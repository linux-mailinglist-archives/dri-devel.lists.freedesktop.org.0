Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B177A0277
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 13:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602ED10E10F;
	Thu, 14 Sep 2023 11:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285C210E10A;
 Thu, 14 Sep 2023 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694690582; x=1726226582;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1tUKKzt+v8evnHDjl/tVtH142SAQscaWBffYryBoqTQ=;
 b=jxEpkIgDe1Gfy1/dxB33hnlife/qUsU3/StjlC/r3K4pTDxXhM9RL+bJ
 08xSRixW1g8mMiST7xjnXpF8L+ppzmYcouUxWpX3Cco/WLxpYrtR0S8ux
 9KR+LT6Eo7Dn6jKILHfv9cdJvkGI9KS1VqJGDe4DTZiUsHt8/P4vxJeZl
 oSN2rX0AUNofmReEm1SkA66zhf+wXAoEoP0hbV/E2QHooBPvEzl6vcF4k
 C7AKjjfSteOaN51ilHgslGBim9fGbzIZ9dk50Xc6A5W+7j+o9O4x0CQY1
 ZoNefnBLD+Pz8uq9NeAppCPtLgh5w1rN3Ye2LWtpEuLfChRbSy7i4G1ky A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377829785"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="377829785"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 04:23:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="810025950"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="810025950"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by fmsmga008.fm.intel.com with SMTP; 14 Sep 2023 04:22:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 14 Sep 2023 14:22:58 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Fixup h/vsync_end instead of h/vtotal
Date: Thu, 14 Sep 2023 14:22:58 +0300
Message-ID: <20230914112258.27156-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

There are some weird EDIDs floating around that have the sync
pulse extending beyond the end of the blanking period.

On the currently problemtic machine (HP Omni 120) EDID reports
the following mode:
"1600x900": 60 108000 1600 1780 1860 1800 900 910 913 1000 0x40 0x5
which is then "corrected" to have htotal=1861 by the current drm_edid.c
code.

The fixup code was originally added in commit 7064fef56369 ("drm: work
around EDIDs with bad htotal/vtotal values"). Googling around we end up in
https://bugs.launchpad.net/ubuntu/hardy/+source/xserver-xorg-video-intel/+bug/297245
where we find an EDID for a Dell Studio 15, which reports:
(II) VESA(0): clock: 65.0 MHz   Image Size:  331 x 207 mm
(II) VESA(0): h_active: 1280  h_sync: 1328  h_sync_end 1360 h_blank_end 1337 h_border: 0
(II) VESA(0): v_active: 800  v_sync: 803  v_sync_end 809 v_blanking: 810 v_border: 0

Note that if we use the hblank size (as opposed of the hsync_end)
from the DTD to determine htotal we get exactly 60Hz refresh rate in
both cases, whereas using hsync_end to determine htotal we get a
slightly lower refresh rates. This makes me believe the using the
hblank size is what was intended even in those cases.

Also note that in case of the HP Onmi 120 the VBIOS boots with these:
  crtc timings: 108000 1600 1780 1860 1800 900 910 913 1000, type: 0x40 flags: 0x5
ie. it just blindly stuffs the bogus hsync_end and htotal from the DTD
into the transcoder timing registers, and the display works. I believe
the (at least more modern) hardware will automagically terminate the hsync
pulse when the timing generator reaches htotal, which again points that we
should use the hblank size to determine htotal. Unfortunatley the old bug
reports for the Dell machines are extremely lacking in useful details so
we have no idea what kind of timings the VBIOS programmed into the
hardware :(

Let's just flip this quirk around and reduce the length of the sync
pulse instead of extending the blanking period. This at least seems
to be the correct thing to do on more modern hardware. And if any
issues crop up on older hardware we need to debug them properly.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8895
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 39dd3f694544..0c5563b4d21e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3497,11 +3497,11 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 	mode->vsync_end = mode->vsync_start + vsync_pulse_width;
 	mode->vtotal = mode->vdisplay + vblank;
 
-	/* Some EDIDs have bogus h/vtotal values */
+	/* Some EDIDs have bogus h/vsync_end values */
 	if (mode->hsync_end > mode->htotal)
-		mode->htotal = mode->hsync_end + 1;
+		mode->hsync_end = mode->htotal;
 	if (mode->vsync_end > mode->vtotal)
-		mode->vtotal = mode->vsync_end + 1;
+		mode->vsync_end = mode->vtotal;
 
 	drm_mode_do_interlace_quirk(mode, pt);
 
-- 
2.41.0

