Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 172FD85A4F8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 14:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B4410E0BC;
	Mon, 19 Feb 2024 13:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RKU4rhLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C80D10E0F3;
 Mon, 19 Feb 2024 13:38:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BD97ECE126D;
 Mon, 19 Feb 2024 13:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E31C433F1;
 Mon, 19 Feb 2024 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708349924;
 bh=2y/R2rNrQF5YNdRb1X6YdN4UDCwnv5pqvMcfcKpihWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RKU4rhLmXh2QGNfVOd1TLLlAWldlYF1g01lkeL+TNUl/NObJeGAgG8LAVZSK8Zt7l
 ySPSnhqT2Gi2bZ5Kz09RVV3tGh8l9vffvkg9q29/Ypd5SQF4fw63Hx7eh3sZhT4Zfa
 D6jeHwAt3rfOmYxtibweL82tniOlA9SX5g7Wtuxja01mcAzBbNATfB0mpLVp7IRw2u
 s8nNCVyHiDp8qiomruTzVpmtl8nQJjLOy6HBxahTsCeydfzpL2F6c4sTkbsj5+qmGg
 FtGX6AoSQRa4y+/hS/mnZvGo+91/BDSS5IEBoYAg0uAXgSWiLXszqzFpZyMt6eF5OF
 /sHe0ELFLhLqw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rc3qz-000000002NA-15HX;
 Mon, 19 Feb 2024 14:38:41 +0100
Date: Mon, 19 Feb 2024 14:38:41 +0100
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
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
Subject: Re: drm/msm: Second DisplayPort regression in 6.8-rc1
Message-ID: <ZdNZ4TiJn9-yKT5_@hovoldconsulting.com>
References: <ZctVmLK4zTwcpW3A@hovoldconsulting.com>
 <343710b1-f0f4-5c05-70e6-3c221cdc9580@quicinc.com>
 <ZczFhVjHIm55JTfO@hovoldconsulting.com>
 <ZdDNcrf4KpflGeYQ@hovoldconsulting.com>
 <ZdMwZa98L23mu3u6@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdMwZa98L23mu3u6@hovoldconsulting.com>
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

On Mon, Feb 19, 2024 at 11:41:41AM +0100, Johan Hovold wrote:

> It seems my initial suspicion that at least some of these regressions
> were related to the runtime PM work was correct. The hard resets happens
> when the DP controller is runtime suspended after being probed:
 
> [   17.074925] bus: 'platform': __driver_probe_device: matched device aea0000.displayport-controller with driver msm-dp-display
> [   17.112000] msm-dp-display aea0000.displayport-controller: dp_display_probe - populate aux bus
> [   17.125208] msm-dp-display aea0000.displayport-controller: dp_pm_runtime_resume
> [   17.197909] msm-dp-display aea0000.displayport-controller: dp_pm_runtime_suspend
> [   17.198079] probe of aea0Format: Log Type - Time(microsec) - Message - Optional Info
> Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
> S - QC_IMAGE_VERSION_STRING=BOOT.MXF.1.1-00470-MAKENA-1
> S - IMAGE_VARIANT_STRING=SocMakenaWP
> S - OEM_IMAGE_VERSION_STRING=crm-ubuntu92
> 
>   < machine is reset by hypervisor >
> 
> Presumably the reset happens when controller is being shut down while
> still being used by the EFI framebuffer.
> 
> In the cases where the machines survives boot, the controller is never
> suspended.
> 
> When investigating this I've also seen intermittent:
> 
> 	[drm:dp_display_probe [msm]] *ERROR* device tree parsing failed

Note that there are further indications there may be more than one bug
here too.

I definitely see hard resets when dp_pm_runtime_suspend() is shutting
down the eDP PHY, but there are occasional resets also if I instrument
DP controller probe() to resume and then prevent the controller from
suspending until after a timeout (e.g. to be used as a temporary
workaround):

[   15.676495] bus: 'platform': __driver_probe_device: matched device aea0000.displayport-controller with driver msm-dp-display
[   15.769392] msm-dp-display aea0000.displayport-controller: dp_display_probe - populate aux bus
[   15.778808] msm-dp-display aea0000.displayport-controller: dp_display_probe - scheduling handover
[   15.789931] probe of aea0000.displayport-controller returned 0 after 91121 usecs
[   15.790460] bus: 'dp-aux': __driver_probe_device: matched device aux-aea0000.displayport-controller with driver panel-simple-dp-aux
Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.MXF.1.1-00470-MAKENA-1

I'll wait for the maintainers and authors of this code to comment, but
it seems the runtime PM work is broken in multiple ways.

Johan
