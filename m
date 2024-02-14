Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC38E854ABE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 14:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A8E10E269;
	Wed, 14 Feb 2024 13:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rO2Y0P/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D21D10E260;
 Wed, 14 Feb 2024 13:51:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9A74FCE2146;
 Wed, 14 Feb 2024 13:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A38C433F1;
 Wed, 14 Feb 2024 13:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707918706;
 bh=Qq4RI3/eNvGIvnkvbEhKzEkeUXbVPZq7+5c0G9BM++I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rO2Y0P/rIMwckSI4l41akdMEhZtEl+Kno80nEh/FOlEu7LHwVqzr0gHSGb4rxy46h
 wbIn8eX2z8YkjpATs0FKPYzqCLGxqDHTm8cq8aFD6cJcrHNFv38mSRCd6GK3LEcSaU
 iR6e45a8NtmMSeCggrS/dEcwl/FPrhMXzzm4LfIzJ3FRVh/ANgrmWP/c8fJr3sawIp
 u7gI3lmObcKNatscXsV6qohUPs/nwil/IKwjHFjnszp10/MitkFSNiZEwf0c465CDs
 wX+BNxgYVQfwmiCR7EhqC9Ij0lDBz3uRo3SirfmLB1C7ZPp1QbOyeoXwe3k5LGZsKV
 oL0mcq15CVDTQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1raFgD-000000005BW-1E73;
 Wed, 14 Feb 2024 14:52:06 +0100
Date: Wed, 14 Feb 2024 14:52:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: drm/msm: DisplayPort regressions in 6.8-rc1
Message-ID: <ZczFhVjHIm55JTfO@hovoldconsulting.com>
References: <ZctVmLK4zTwcpW3A@hovoldconsulting.com>
 <343710b1-f0f4-5c05-70e6-3c221cdc9580@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <343710b1-f0f4-5c05-70e6-3c221cdc9580@quicinc.com>
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

On Tue, Feb 13, 2024 at 10:00:13AM -0800, Abhinav Kumar wrote:

> I do agree that pm runtime eDP driver got merged that time but I think 
> the issue is either a combination of that along with DRM aux bridge 
> https://patchwork.freedesktop.org/series/122584/ OR just the latter as 
> even that went in around the same time.

Yes, indeed there was a lot of changes that went into the MSM drm driver
in 6.8-rc1 and since I have not tried to debug this myself I can't say
for sure which change or changes that triggered this regression (or
possibly regressions).

The fact that the USB-C/DP PHY appears to be involved
(/soc@0/phy@88eb000) could indeed point to the series you mentioned.

> Thats why perhaps this issue was not seen with the chromebooks we tested 
> on as they do not use pmic_glink (aux bridge).
> 
> So we will need to debug this on sc8280xp specifically or an equivalent 
> device which uses aux bridge.

I've hit the NULL-pointer deference three times now in the last few days
on the sc8280xp CRD. But since it doesn't trigger on every boot it seems
you need to go back to the series that could potentially have caused
this regression and review them again. There's clearly something quite
broken here.

> On 2/13/2024 3:42 AM, Johan Hovold wrote:

> > Since 6.8-rc1 the internal eDP display on the Lenovo ThinkPad X13s does
> > not always show up on boot.

> > 	[    6.007872] [drm:drm_bridge_attach [drm]] *ERROR* failed to attach bridge /soc@0/phy@88eb000 to encoder TMDS-31: -16
	
> > and this can also manifest itself as a NULL-pointer dereference:
> > 
> > 	[    7.339447] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> > 	
> > 	[    7.643705] pc : drm_bridge_attach+0x70/0x1a8 [drm]
> > 	[    7.686415] lr : drm_aux_bridge_attach+0x24/0x38 [aux_bridge]
> > 	
> > 	[    7.769039] Call trace:
> > 	[    7.771564]  drm_bridge_attach+0x70/0x1a8 [drm]
> > 	[    7.776234]  drm_aux_bridge_attach+0x24/0x38 [aux_bridge]
> > 	[    7.781782]  drm_bridge_attach+0x80/0x1a8 [drm]
> > 	[    7.786454]  dp_bridge_init+0xa8/0x15c [msm]
> > 	[    7.790856]  msm_dp_modeset_init+0x28/0xc4 [msm]
> > 	[    7.795617]  _dpu_kms_drm_obj_init+0x19c/0x680 [msm]
> > 	[    7.800731]  dpu_kms_hw_init+0x348/0x4c4 [msm]
> > 	[    7.805306]  msm_drm_kms_init+0x84/0x324 [msm]
> > 	[    7.809891]  msm_drm_bind+0x1d8/0x3a8 [msm]
> > 	[    7.814196]  try_to_bring_up_aggregate_device+0x1f0/0x2f8
> > 	[    7.819747]  __component_add+0xa4/0x18c
> > 	[    7.823703]  component_add+0x14/0x20
> > 	[    7.827389]  dp_display_probe+0x47c/0x568 [msm]
> > 	[    7.832052]  platform_probe+0x68/0xd8
> > 
> > Users have also reported random crashes at boot since 6.8-rc1, and I've
> > been able to trigger hard crashes twice when testing an external display
> > (USB-C/DP), which may also be related to the DP regressions.

Johan
