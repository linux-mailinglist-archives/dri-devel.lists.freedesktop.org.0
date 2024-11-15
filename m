Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1DE9CDFB4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 14:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0045310E86F;
	Fri, 15 Nov 2024 13:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j6Fmzj99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76C110E876;
 Fri, 15 Nov 2024 13:18:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8C227A41E93;
 Fri, 15 Nov 2024 13:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089E0C4CECF;
 Fri, 15 Nov 2024 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731676686;
 bh=7oXYRRawKbk2IfSVZUztCSg41vvROYYiVDjxrBKKIMI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j6Fmzj99uXSicxhZaVYIP1mAqUdBb6FtTakNUHAvI1VPGUWWB6pibG7sVHb0cSeeO
 EJ/JTP8LoN7EkMk8kPRoslm2sYJukIttY00hzCTxaBATPdkuh/p+6TNVgVSVswFVyQ
 4kxbbQGatL10thse9H7RS5tByKOOYa6scCzBB/3yRhVHZuGBKhpXRPUws7V6NDDMJo
 0jGAzpwQ5wKr2l/kz1D6fuC8TqNTFrA+nCqGQgyoHdmk8QeS35p24zH7CzqdCqiorq
 LIT9+Y+kvF15a2gl0cp00uqyr3+OKlCmfw6jpmIWWC4k58Nc/xge4Iptu0V/3R9a39
 xS8YkB4gQ+emA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1tBwCy-000000007nZ-0yyR;
 Fri, 15 Nov 2024 14:17:56 +0100
Date: Fri, 15 Nov 2024 14:17:56 +0100
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix x1e80100 intf_6 underrun/vsync interrupt
Message-ID: <ZzdKBMRKs2MgLGon@hovoldconsulting.com>
References: <20241115-x1e80100-dp2-fix-v1-1-727b9fe6f390@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115-x1e80100-dp2-fix-v1-1-727b9fe6f390@linaro.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 15, 2024 at 01:55:13PM +0100, Stephan Gerhold wrote:
> The IRQ indexes for the intf_6 underrun/vsync interrupts are swapped.
> DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16) is the actual underrun interrupt and
> DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17) is the vsync interrupt.
> 
> This causes timeout errors when using the DP2 controller, e.g.
>   [dpu error]enc37 frame done timeout
>   *ERROR* irq timeout id=37, intf_mode=INTF_MODE_VIDEO intf=6 wb=-1, pp=2, intr=0
>   *ERROR* wait disable failed: id:37 intf:6 ret:-110
> 
> Correct them to fix these errors and make DP2 work properly.
> 
> Cc: stable@vger.kernel.org
> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

This fixes the errors I was seeing with the third usb-c port on the
x1e80100 CRD:

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan
