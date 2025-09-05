Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A94B459E9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 15:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1585910EBAF;
	Fri,  5 Sep 2025 13:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pOBn7PW1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260E410EBAC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 13:59:02 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C5E11129;
 Fri,  5 Sep 2025 15:57:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1757080670;
 bh=d79gF3C/4tQwTaSFPW6C3OwVcb/ZdZ9Ef2lR8kqdQ7o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pOBn7PW1/oGYZdn8RIS3t36exOo+3miQO57jAs4BNjwkNJsBbxlmKAYnaBkBCtoKw
 s4Pp2eItNha/SYLNB0HZCU5whzGUHZyveZxQ2WzgmVujU8jbmGPb2Ebs3jaYFA8Zqp
 ej6868HnB+xuX8KJ3HzHHhUNWjwV4+RxkWaiabYY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 05 Sep 2025 16:58:07 +0300
Subject: [PATCH 2/2] drm/tidss: Set vblank (event) time at crtc_atomic_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-tidss-fix-timestamp-v1-2-c2aedf31e2c9@ideasonboard.com>
References: <20250905-tidss-fix-timestamp-v1-0-c2aedf31e2c9@ideasonboard.com>
In-Reply-To: <20250905-tidss-fix-timestamp-v1-0-c2aedf31e2c9@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2935;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=d79gF3C/4tQwTaSFPW6C3OwVcb/ZdZ9Ef2lR8kqdQ7o=;
 b=kA0DAAgB+j2qjLyWHvUByyZiAGi67KGgJvXjBdQxQKSKuxn8T0Yg595MYXVGDJ8y3/JBORSeI
 4kCMwQAAQgAHRYhBMQ4DD6WXv2BB5/zp/o9qoy8lh71BQJouuyhAAoJEPo9qoy8lh71/LAP/jeQ
 GWd3PwHtj5TKTlhMcI2GexXtRc97s9LF6bLB7PJqmytjuEeLzFnNrlMmDR71+3AtIwWej3HGxBr
 llceGPDJfXPqaNsI/TX8EpHkaBlvW1lG2nuDp8Me5dDE7Eb4fDADDfUv0hvHwnfNoc8UBd24llv
 K1oasihGfVPjk/i08frrYVFTczGixaTNtBTqEma280IEf3UTTqwssQoT6or7nFE4pGOyIrBoaT7
 wmmXczGLlvAbFMwXwlk9fcyvib2zj8fO8GGiMzunCEAiuuA3AJUTE9aLV+3j97lnQcRpFxgzbqk
 gfinKzBZetSRBNIJYi7gh0krd9w05/sJZUoVyKQvPBpqq2zLPWD+i+n0wAUyrk9ugedCRYwKTj3
 WXaFcPazsXGgguCvNfTfq1S2H+WDWzoHdC8KDoXBNtsJoYKfof11bQstKYHM3rGbnlWZRoPDSq/
 yihELyH8yqJsSlmpXjpsA2RaIu7zNS481CZw/4uhXpjpYvf/geca1OW3YIE9ZJ2k3syKok1fZQ5
 lKHWOl/Rh3pj4pBGPNuuON+gNC9RVoVpYg2aTTxqT4O7OMbE8lnFgdhamviK8Zd4BvzZ51kjBEP
 eKEnaa6hj16L4jRO11rYRzJarPJgpShOyTMBe59hoZPBQBLt1RDE5J/LWeyxTyvS3/S9DVrHxVh
 TAH91
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

It was reported that Weston stops at an assert, which checks that the
page flip event timestamp is the same or newer than the previous
timestamp:

weston_output_finish_frame: Assertion `timespec_sub_to_nsec(stamp, &output->frame_time) >= 0' failed.

With manual tests, I can see that when I enable the CRTC, I get a page
flip event with a timestamp of 0. Tracking this down led to
drm_reset_vblank_timestamp() which does "t_vblank = 0" if
"high-precision query" is not available.

TI DSS does not have any hardware timestamping, and thus the default
ktime_get() is used in the DRM framework to get the vblank timestamp,
and ktime_get() is not "high precision" here.

It is not quite clear why the framework behaves this way, but I assume
the idea is that drm_crtc_vblank_on(), which calls
drm_reset_vblank_timestamp(), can be called at any time, and thus
ktime_get() wouldn't give a good timestamp. And, the idea is that the
driver would wait until next vblank after the CRTC enable, and then we
could get a good timestamp. This is hinted in the comment: "reinitialize
delayed at next vblank interrupt and assign 0 for now".

I think that makes sense. However, when we enable the CRTC in TI DSS,
i.e. we write the enable bit to the hardware, that's the exact moment
when the "vblank cycle" starts. It is the zero point in the cycle, and
thus ktime_get() would give a good timestamp.

I am not sure if this is applicable to other hardware, and if so, how
should it be solved in the framework. So, let's fix this in the tidss
driver at least for now.

This patch updates the vblank->time manually to ktime_get() just before
sending the vblank event, and we enable the crtc just before calling
ktime_get(). To get even more exact timing, the dispc_vp_enable() is
moved inside the event_lock spinlock.

With this, we get a proper timestamp for the page flip event from
enabling the CRTC, and Weston is happy.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_crtc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 1b767af8e1f6..6898f12bb364 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -244,11 +244,16 @@ static void tidss_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	dispc_vp_prepare(tidss->dispc, tcrtc->hw_videoport, crtc->state);
 
-	dispc_vp_enable(tidss->dispc, tcrtc->hw_videoport);
-
 	spin_lock_irqsave(&ddev->event_lock, flags);
 
+	dispc_vp_enable(tidss->dispc, tcrtc->hw_videoport);
+
 	if (crtc->state->event) {
+		unsigned int pipe = drm_crtc_index(crtc);
+		struct drm_vblank_crtc *vblank = &ddev->vblank[pipe];
+
+		vblank->time = ktime_get();
+
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}

-- 
2.43.0

