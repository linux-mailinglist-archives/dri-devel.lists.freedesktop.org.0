Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262F7B1D9FA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 16:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B2F10E0C4;
	Thu,  7 Aug 2025 14:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tb+oAIJG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADCD10E0C4;
 Thu,  7 Aug 2025 14:34:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E41A7A5613A;
 Thu,  7 Aug 2025 14:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3437BC4CEEB;
 Thu,  7 Aug 2025 14:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754577291;
 bh=oIv1AhxQFm1DY8j3ea6WxxB3ZICPAWl1Q01D/LXQQNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tb+oAIJG1EQrqKdSa/yHJeVXXPszvhr/D0rOkd5DHzQNl9eFcZLP24GH4cqJZBDvV
 mdXyk4pdXIuts6n3HcV2hMhmnSGA/u+ZeHLvIarn/6C3ALmRfWFfphgcklcN5VDf57
 nOkuNpW+YGjEmmuWP7W/1C6EedU6jX0NzGYcHGtc2yzEzxLuklZAayWZASyORozzg4
 Osfb25rQf8BE6CzLRRxyTuOckLEJC2at53+sTM/OBdxk6j1nVFi9oh6wwXV+Hbb0To
 Rx1qNo2d4ujXXovSx1xDwsMuJEfC/kPJ6pbnSs1v3199nvePPhlWd5xRy5pIgEcmYv
 jzFDysiwIhDQQ==
Date: Thu, 7 Aug 2025 07:34:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/dpu: avoid uninitialized variable use
Message-ID: <20250807143444.GA1009053@ax162>
References: <20250807072016.4109051-1-arnd@kernel.org>
 <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
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

On Thu, Aug 07, 2025 at 11:09:38AM +0300, Dmitry Baryshkov wrote:
> Having no plane->crtc is a valid setting and it is handled inside
> drm_atomic_helper_check_plane_state() by setting plane_state->visible =
> false and returning early. Setting crtc_state to NULL is a correct fix.
> Could you please send it?

I sent this fix three weeks ago, could this be applied?

https://lore.kernel.org/20250715-drm-msm-fix-const-uninit-warning-v1-1-d6a366fd9a32@kernel.org/

Cheers,
Nathan
