Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B442878307
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 16:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C89112B09;
	Mon, 11 Mar 2024 15:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="skhuymnT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138BD112B09;
 Mon, 11 Mar 2024 15:16:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 742B160EC0;
 Mon, 11 Mar 2024 15:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E6DC43390;
 Mon, 11 Mar 2024 15:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710170197;
 bh=wKdCzd6BnmptS+QJnboMGafnedP7woLGUI8aYnsac7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=skhuymnT6wj0znfcfZZjkDOn+WslqtCW0qO5oNlgmTe0NuIz2Ak8RXXdmmUWD0dpQ
 mlXO4OJe2n0e9c2PsgHiGa1ZkK+FcVhzT4SdRcuTnVjsgpkdBFV7GRXyPq/YQM+kCG
 OpAH/PdbM5pYT3/1emuYP0y5VuyWLFhY4gbAUcN/dmIxkSXUFVGCkf2W0d0wjIpM/Y
 IGVSDq1VYhiEqkwaYw2GrVK9FU/JrdKamPiF48Fe6O/nCIDGLgwkP0yPvVfYBqVljg
 klMql6cJ4UlYQuECxe2mAV0/BMJ6iHihVFufryZJr2diUfcmtI5p9CnM9/nL5lYNpP
 JvZKQgcO8Mlrg==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rjhOK-0000000056X-3qz4;
 Mon, 11 Mar 2024 16:16:40 +0100
Date: Mon, 11 Mar 2024 16:16:40 +0100
From: Johan Hovold <johan@kernel.org>
To: regressions@lists.linux.dev
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: drm/msm: DisplayPort hard-reset on hotplug regression in 6.8-rc1
Message-ID: <Ze8gWHK2ipXIHRAP@hovoldconsulting.com>
References: <Zd3kvD02Qvsh2Sid@hovoldconsulting.com>
 <ZesH21DcfOldRD9g@hovoldconsulting.com>
 <56de6cfb-fe0f-de30-d4d0-03c0fbb0afbb@quicinc.com>
 <ZeyOmJLlBbwnmaJN@hovoldconsulting.com>
 <Ze8Ke_M2xHyPYCu-@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ze8Ke_M2xHyPYCu-@hovoldconsulting.com>
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

On Mon, Mar 11, 2024 at 02:43:24PM +0100, Johan Hovold wrote:

> So, while it may still be theoretically possible to hit the resets after
> the revert, the HPD notify revert effectively "fixed" the regression in
> 6.8-rc1 by removing the preconditions that now made us hit it (i.e. the
> half-initialised bridge).
> 
> It seems the hotplug state machine needs to be reworked completely, but
> at least we're roughly back where we were with 6.7 (including that the
> bus clocks will never be turned of because of the rpm leaks on
> disconnect).

#regzbot introduced: e467e0bde881
#regzbot fix: 664bad6af3cb
