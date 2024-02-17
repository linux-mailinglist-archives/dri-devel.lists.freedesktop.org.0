Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C04E859078
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 16:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E42810E2F6;
	Sat, 17 Feb 2024 15:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DU23ssNV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F373210E069;
 Sat, 17 Feb 2024 15:22:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 18889CE09E6;
 Sat, 17 Feb 2024 15:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BC7C433F1;
 Sat, 17 Feb 2024 15:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708183330;
 bh=pnmjMtj6LUKSLk2ge6TNKEdB5HeEr+uuqdYKp1VAbK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DU23ssNVRNEU/rAOjwOWef06YUBznmP6qaEPZeRmZHrV+pGneYJCIWEwsOnaXllcZ
 tDfuHD234Qh/hGc/luVN4cqfJwpbk/AYuM/X//gxknluCTgMjU9csI8zjoG7VFd9y+
 HSmx8CkAlukSPWwOsN2vvH1E4odRYx94ztQwk2y1wbP7Hr8temgVUKtC9SgaJjAI5B
 BaG7OFD1ODbbyG3/JXRe+jL1T8vjq3ju4f2V66sndaPIcNTjE2wq6FZGxM2bpbEGnJ
 ESmQ52WVUFg4ui4nPnUwdmsQBhq6hCY8Xw+XoaCj+wDat6PWn6val5QyD5Sqjh9A8B
 1dJdW88kRPXKw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rbMW1-000000001dK-0sfA;
 Sat, 17 Feb 2024 16:22:09 +0100
Date: Sat, 17 Feb 2024 16:22:09 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: drm/msm: DisplayPort regressions in 6.8-rc1
Message-ID: <ZdDPISS5ntrWSPf_@hovoldconsulting.com>
References: <ZctVmLK4zTwcpW3A@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZctVmLK4zTwcpW3A@hovoldconsulting.com>
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

On Tue, Feb 13, 2024 at 12:42:17PM +0100, Johan Hovold wrote:

> Since 6.8-rc1 the internal eDP display on the Lenovo ThinkPad X13s does
> not always show up on boot.
> 
> The logs indicate problems with the runtime PM and eDP rework that went
> into 6.8-rc1:
> 
> 	[    6.007872] [drm:drm_bridge_attach [drm]] *ERROR* failed to attach bridge /soc@0/phy@88eb000 to encoder TMDS-31: -16
	
> and this can also manifest itself as a NULL-pointer dereference:
> 
> 	[    7.339447] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> 	
> 	[    7.643705] pc : drm_bridge_attach+0x70/0x1a8 [drm]

#regzbot ^introduced: 2bcca96abfbf

It looks like it may have been possible to hit this also before commit
2bcca96abfbf ("soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE") and
the transparent bridge rework in 6.8-rc1 even if that has not yet been
confirmed.

The above is what made this trigger since 6.8-rc1 however.

Johan
