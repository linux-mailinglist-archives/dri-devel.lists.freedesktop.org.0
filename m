Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0F885A135
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 11:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3FE10E2D5;
	Mon, 19 Feb 2024 10:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LY6yXZr3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4504C10E2CD;
 Mon, 19 Feb 2024 10:41:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 790C2CE10A8;
 Mon, 19 Feb 2024 10:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0ADCC433F1;
 Mon, 19 Feb 2024 10:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708339303;
 bh=j0hZ7OP3iKPpfHm4XNFd9GklyucQI6Echl+Kr1PbKTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LY6yXZr3E2vzWkg1Hg9gmo5TqYcNayGq//e1aM6TDjTSjOYtKCjyL1lOKXFSFAeuF
 V2WJ8OD/2ZPSq3wiOlRSM76qr71jZijdaRDQ/BijFj7wZnZ7sViiwSZ4bLlGNoD+ZV
 WH4//y4qt8YHFZuPle48PQ0JIjlUyHbs3sqIxnQQwtNo6naYwYzLqwh0n+Ou9KxA9q
 TLmwEhUoEEAKU+0VbbUZMfAjrQcLPHK05XkPWQ3IFQ3TazJb5UBMHb4crKm4a5q9n6
 NqUbtMGE/2ohmNR3QBpUDSq7onI6kyNLMXQClsTIMiVx+CgsqLyenhRcpbnB8SmjCa
 jPT7FURBb12Ew==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rc15h-000000006eY-16Ya;
 Mon, 19 Feb 2024 11:41:41 +0100
Date: Mon, 19 Feb 2024 11:41:41 +0100
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
Subject: drm/msm: Second DisplayPort regression in 6.8-rc1
Message-ID: <ZdMwZa98L23mu3u6@hovoldconsulting.com>
References: <ZctVmLK4zTwcpW3A@hovoldconsulting.com>
 <343710b1-f0f4-5c05-70e6-3c221cdc9580@quicinc.com>
 <ZczFhVjHIm55JTfO@hovoldconsulting.com>
 <ZdDNcrf4KpflGeYQ@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdDNcrf4KpflGeYQ@hovoldconsulting.com>
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

On Sat, Feb 17, 2024 at 04:14:58PM +0100, Johan Hovold wrote:
> On Wed, Feb 14, 2024 at 02:52:06PM +0100, Johan Hovold wrote:
> > On Tue, Feb 13, 2024 at 10:00:13AM -0800, Abhinav Kumar wrote:

> Since Dmitry had trouble reproducing this issue I took a closer look at
> the DRM aux bridge series that Abhinav pointed and was able to track
> down the bridge regressions and come up with a reproducer. I just posted
> a series fixing this here:
> 
> 	https://lore.kernel.org/lkml/20240217150228.5788-1-johan+linaro@kernel.org/
> 
> As I mentioned in the cover letter, I am still seeing intermittent hard
> resets around the time that the DRM subsystem is initialising, which
> suggests that we may be dealing with two separate DRM regressions here
> however.
> 
> If the hard resets are triggered by something like unclocked hardware,
> perhaps that bit could this be related to the runtime PM rework?

It seems my initial suspicion that at least some of these regressions
were related to the runtime PM work was correct. The hard resets happens
when the DP controller is runtime suspended after being probed:

[   16.748475] bus: 'platform': __driver_probe_device: matched device ae00000.display-subsystem with driver msm-mdss
[   16.759444] msm-mdss ae00000.display-subsystem: Adding to iommu group 21
[   16.795226] bus: 'platform': __driver_probe_device: matched device ae01000.display-controller with driver msm_dpu
[   16.807542] probe of ae01000.display-controller returned -517 after 3 usecs
[   16.821552] bus: 'platform': __driver_probe_device: matched device ae90000.displayport-controller with driver msm-dp-display
[   16.837749] probe of ae90000.displayport-controller returned -517 after 1 usecs
[  OK  ] Listening on Load/Save RF Kill Swit[   16.854659] bus: 'platform': __dch Status /dev/rfkill Watch.
[   16.868458] probe of ae98000.displayport-controller returned -517 after 2 usecs
[   16.880012] bus: 'platform': __driver_probe_device: matched device aea0000.displayport-controller with driver msm-dp-display
[   16.891856] probe of aea0000.displayport-controller returned -517 after 2 usecs
[   16.903825] probe of ae00000.display-subsystem returned 0 after 144497 usecs
[   16.911636] bus: 'platform': __driver_probe_device: matched device ae01000.display-controller with driver msm_dpu
[   16.942092] probe of ae01000.display-controller returned 0 after 19593 usecs
         Starting Load/Save Screen Backligh…rightness[   16.959146] bus: 'platform': _ of backlight:backlight...
[   16.995355] msm-dp-display ae90000.displayport-controller: dp_display_probe - probe tail
[   17.004032] probe of ae90000.displayport-controller returned 0 after 30225 usecs
[   17.012308] bus: 'platform': __driver_probe_device: matched device ae98000.displayport-controller with driver msm-dp-display
[   17.050193] msm-dp-display ae98000.displayport-controller: dp_display_probe - probe tail
         Starting Network Name Resolution...
[   17.058925] probe of ae98000.displayport-controller returned 0 after 34774 usecs
[   17.074925] bus: 'platform': __driver_probe_device: matched device aea0000.displayport-controller with driver msm-dp-display
[        Starting Network Time Synchronization...
[   17.112000] msm-dp-display aea0000.displayport-controller: dp_display_probe - populate aux bus
[   17.125208] msm-dp-display aea0000.displayport-controller: dp_pm_runtime_resume
         Starting Record System Boot/Shutdown in UTMP...
         Starting Virtual Console Setup...
[  OK  ] Finished Load/Save Screen Backlight Brightness of backlight:backlight.
[   17.197909] msm-dp-display aea0000.displayport-controller: dp_pm_runtime_suspend
[   17.198079] probe of aea0Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.MXF.1.1-00470-MAKENA-1
S - IMAGE_VARIANT_STRING=SocMakenaWP
S - OEM_IMAGE_VERSION_STRING=crm-ubuntu92

  < machine is reset by hypervisor >

Presumably the reset happens when controller is being shut down while
still being used by the EFI framebuffer.

In the cases where the machines survives boot, the controller is never
suspended.

When investigating this I've also seen intermittent:

	[drm:dp_display_probe [msm]] *ERROR* device tree parsing failed

which also appears to be related to the runtime PM rework:

	https://lore.kernel.org/lkml/1701472789-25951-1-git-send-email-quic_khsieh@quicinc.com/

I believe this is enough evidence to conclude that this second
regression is introduced by commit 5814b8bf086a ("drm/msm/dp:
incorporate pm_runtime framework into DP driver"):

#regzbot introduced: 5814b8bf086a

Has anyone given some thought to how the framebuffer handover is
supposed to work? It seems we're currently just relying on luck with
timing.

Johan
