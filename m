Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE91C8611F5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 13:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4018D10EBFE;
	Fri, 23 Feb 2024 12:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="evV+Boqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E13010EBFD;
 Fri, 23 Feb 2024 12:51:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AEEBECE2BCF;
 Fri, 23 Feb 2024 12:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC6DC433F1;
 Fri, 23 Feb 2024 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708692696;
 bh=1lJXy4uKYL7pJq5F8Vo9jDbbuH8lfKzhYgyljzDs/n0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=evV+Boqp9I4YqNzKSjDSoquLBTJkguhMnylBUp+eSde9n7BkMk3q9Lg60i9e8XMX6
 KnVD7vHyg/cySaCtEXVuP/bnIKdedXSHu565Z9tnXNSUs8YPe1xFIzRKuV5Lg0ZXQV
 l5kazV2J2jYV5p1S+u6WGNhBVb5rBFr+fQm9xY0lkYDytbFklcGTP7cg/mrT3n3tmj
 s3PjVAYReKFME7zw5SaGqKfCDkAiLyIE41BxO+3TiTxQhRYcsaiqUTsS88rk0XN1+O
 AHCRTL2asQ7U5XUr+EIzkSF1syZ/XvtniJ/7iKjkLOcduxCRcGwgDdWDqckgm/Fjq3
 7vD74+f1h5vkw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rdV1f-000000002l8-1Rm4;
 Fri, 23 Feb 2024 13:51:40 +0100
Date: Fri, 23 Feb 2024 13:51:39 +0100
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
Message-ID: <ZdiU2z8rzo542_Ih@hovoldconsulting.com>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <170868613914.4029284.5549880672870201262.b4-ty@linaro.org>
 <3c4246b6-431a-442e-8ace-3b0d0e67743f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c4246b6-431a-442e-8ace-3b0d0e67743f@linaro.org>
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

On Fri, Feb 23, 2024 at 12:03:10PM +0100, Neil Armstrong wrote:
> On 23/02/2024 12:02, Neil Armstrong wrote:
> > Hi,
> > 
> > On Sat, 17 Feb 2024 16:02:22 +0100, Johan Hovold wrote:
> >> Starting with 6.8-rc1 the internal display sometimes fails to come up on
> >> machines like the Lenovo ThinkPad X13s and the logs indicate that this
> >> is due to a regression in the DRM subsystem [1].
> >>
> >> This series fixes a race in the pmic_glink_altmode driver which was
> >> exposed / triggered by the transparent DRM bridges rework that went into
> >> 6.8-rc1 and that manifested itself as a bridge failing to attach and
> >> sometimes triggering a NULL-pointer dereference.
> >>
> >> [...]
> > 
> > Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)
> > 
> > [1/6] drm/bridge: aux-hpd: fix OF node leaks
> >        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9ee485bdda68d6d3f5728cbe3150eb9013d7d22b
> > [2/6] drm/bridge: aux-hpd: separate allocation and registration
> >        (no commit info)
> > [3/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
> >        (no commit info)
> > [4/6] soc: qcom: pmic_glink: Fix boot when QRTR=m
> >        (no commit info)
> > [5/6] phy: qcom-qmp-combo: fix drm bridge registration
> >        (no commit info)
> > [6/6] phy: qcom-qmp-combo: fix type-c switch registration
> >        (no commit info)
> > 
> 
> To clarify, I only applied patch 1 to drm-misc-fixes

Ok, but can you please not do that? :)

These patches should go in through the same tree to avoid conflicts.

I discussed this with Bjorn and Dmitry the other day and the conclusion
was that it was easiest to take all of these through DRM.

With Vinod acking the PHY patches, I believe you have what you need to
merge the whole series now?

Johan
