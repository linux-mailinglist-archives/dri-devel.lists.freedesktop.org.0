Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA91E9EC15C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 02:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC7110E8D6;
	Wed, 11 Dec 2024 01:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iS/3PWM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3738210E8D6;
 Wed, 11 Dec 2024 01:13:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B1903A41D2C;
 Wed, 11 Dec 2024 01:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91169C4CED6;
 Wed, 11 Dec 2024 01:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733879635;
 bh=WXYFL2lzpahBm9B+v7DU3pKQd5XfIBdEGGOSasUIPzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iS/3PWM9TNlHS7RGLrXMkZAdwOkldLNzoXEaOeoqgBMx5ECYOict+BBcv0x/hvTYJ
 4+N5Jv0yQTjXHhbj7h3A0h7YsYbbnYIg6B2GI584k/gTZd94F72j47lunKkC/DGK0m
 5E9yQokf1WvYnWUltojmWOiab1zudFtSzncq1sQ8T7o79V5iGjAjddaa6r1DsDCmHM
 j8EDEhMAf71gMbVt0NY9r55TRtxtYbetNeJBxWBozJIOKi/86G10z+mka3ccWpMWT4
 CsLknvFUygFyYVCakkAfqMcUNKGKcFegooKAU+uMGGCMdFfjWeZBx5dHpRkB0cwQJx
 VvXsLHYhlowdA==
Date: Tue, 10 Dec 2024 19:13:52 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Pavan Kondeti <quic_pkondeti@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Elliot Berman <quic_eberman@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <iyknardi445n4h74am22arpgc4vlchh6z6cvkbff2xg76pd655@nozwz7snt476>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
 <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
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

On Tue, Dec 10, 2024 at 02:22:27AM +0530, Akhil P Oommen wrote:
> On 12/10/2024 1:24 AM, Rob Clark wrote:
> > On Mon, Dec 9, 2024 at 12:20 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>
> >> When kernel is booted in EL2, SECVID registers are accessible to the
> >> KMD. So we can use that to switch GPU's secure mode to avoid dependency
> >> on Zap firmware. Also, we can't load a secure firmware without a
> >> hypervisor that supports it.
> > 
> > Shouldn't we do this based on whether zap node is in dtb (and not disabled)?
> 
> This is better, isn't it? Otherwise, multiple overlays should be
> maintained for each soc/board since EL2 can be toggled from bootloader.
> And this feature is likely going to be more widely available.
> 

The DeviceTree passed to the OS needs to describe the world that said OS
is going to operate in. If you change the world you need to change the
description.
There are several other examples where this would be necessary
(remoteproc and watchdog to name two examples from the Qualcomm upstream
world).

So, if we can cover this by zap-shader being enabled or disabled, that
sounds like a clean and scaleable solution.

Regards,
Bjorn
