Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605657E3D05
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D4110E561;
	Tue,  7 Nov 2023 12:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF1310E561
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 12:25:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D81DDB81699;
 Tue,  7 Nov 2023 12:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9720AC433C7;
 Tue,  7 Nov 2023 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359900;
 bh=1OcoPziCnbrGV4/qJy8m8eXtgw1Fw8ZAvVQ3Tqrsmug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E23bv9pnbjOkkLfJ5vjqZKje73blIZYIaVJ4nUI3zUloo/1/C/mWnDez6Ea+E7wD3
 rrLdcabZAk0vsWbUnsFOdbyHXlFXGxZpFcA9pkKa9Lc6TO+t1ggViT+76+AtO+/ZTV
 Ko7l1zrUW4o60e/4I4x5vUvRWVM6+dKEZYQy78Z3QuPBcaqyGb9PHL+D1WAC+6tbws
 5xyccPLnd+UB9feX7ZammucxYPnqtSMGselheWhpAzRBtPTTxHuPsTKrR5J3TNIOhP
 rVSPu4lzOD61dOTiCkEuSPSkNtRuCC3goRLzl50FoNZRYWdEqa1wYNejt7c9/Ce++R
 YRgOdRtYdsEEw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 07/37] drm/edid: Fixup h/vsync_end instead of
 h/vtotal
Date: Tue,  7 Nov 2023 07:21:18 -0500
Message-ID: <20231107122407.3760584-7-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122407.3760584-1-sashal@kernel.org>
References: <20231107122407.3760584-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
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
Cc: Sasha Levin <sashal@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 mripard@kernel.org, dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

[ Upstream commit 2682768bde745b10ae126a322cdcaf532cf88851 ]

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

v2: Add debug message breadcrumbs (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8895
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230920211934.14920-1-ville.syrjala@linux.intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_edid.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 69d855123d3e3..f1ceb7d08519e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3499,11 +3499,19 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 	mode->vsync_end = mode->vsync_start + vsync_pulse_width;
 	mode->vtotal = mode->vdisplay + vblank;
 
-	/* Some EDIDs have bogus h/vtotal values */
-	if (mode->hsync_end > mode->htotal)
-		mode->htotal = mode->hsync_end + 1;
-	if (mode->vsync_end > mode->vtotal)
-		mode->vtotal = mode->vsync_end + 1;
+	/* Some EDIDs have bogus h/vsync_end values */
+	if (mode->hsync_end > mode->htotal) {
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] reducing hsync_end %d->%d\n",
+			    connector->base.id, connector->name,
+			    mode->hsync_end, mode->htotal);
+		mode->hsync_end = mode->htotal;
+	}
+	if (mode->vsync_end > mode->vtotal) {
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] reducing vsync_end %d->%d\n",
+			    connector->base.id, connector->name,
+			    mode->vsync_end, mode->vtotal);
+		mode->vsync_end = mode->vtotal;
+	}
 
 	drm_mode_do_interlace_quirk(mode, pt);
 
-- 
2.42.0

