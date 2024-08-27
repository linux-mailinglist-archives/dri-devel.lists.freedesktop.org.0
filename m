Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B87960692
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 12:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A902010E2C8;
	Tue, 27 Aug 2024 10:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="f/UHflwO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F8410E222
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:02:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7667C1C0002;
 Tue, 27 Aug 2024 10:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724752919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QXbrQYbwu05I9QcdP0EOzRyW3VmbUgQZEfA/b5hJq/c=;
 b=f/UHflwOwNjX3GLS9YGAaiQzzbpHgXjZD2iKJxHwfggRH236UQ+HPVCJrjoFw5d3ryrdYt
 UGfDhaQg72qAQ7eepZub2VOUG+P/qmD8NNgVlad7B9nZ9HO0iCxTHp8RbDuhso7J7XGXhj
 MEErdzUe0CdmiOdZiw8lQaGFhLzQMsV+pTU4duPycmHj0YciJsl468heZGR/7vFU4xG0fp
 tT9X0z5qV1s2nNx2dI4NZebpldrhYxYF3Pt3Ng1p6HRx6mMd/i7duXlUm4Kk1hhE68D7nl
 DFwitAm/TWZc4jnvRYXatENvxI/Op82NoK64JJKrqu+BUmzurHxuGrhgMPhn2w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 27 Aug 2024 11:57:41 +0200
Subject: [PATCH v2 6/6] drm/vkms: Add missing check for CRTC initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-google-vkms-managed-v2-6-f41104553aeb@bootlin.com>
References: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
In-Reply-To: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1030;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=eon9nKAT8aprMkogaxLTrCwGM6rlkI2aZ3rSwA+swpU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmzaQPRDVNlHwwkHSIsyM3580wfuLwKuybATZ3e
 f1fTFkk8FaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs2kDwAKCRAgrS7GWxAs
 4q3VD/9O53/2TSWKz6e2kcpm9dLhofqv1w+m5klIZ8QHKUHuTMyrKFAtsz1h8R4ElpWZXr1sXAc
 ncPE46mxY559k5KaL+fEwK9mtU9XRbD6OczzCmiRCTCU0BJKCDa/KMJgd6F63ITacdZF5JcuFkR
 Xv9M1hgHh92mTXp+XdZwTKOoVsDMWtXIJW9xYQp9cLTd4kfAkkzqaK3D6/0Ql+9sPN8oPHSkZfs
 /0NDi55NfeUllmYA9I+EeKjqp25WxLxmbj+JrWgmVjZ9aVYXvfmazK3bnMXWIEMDG6pj8+Uexf+
 qVjJ4JqtmYOlDsKGWdWUz91jgWQH3Z1pI5wg6XvKAI12bL1p3+2t0T2np0+LyrdqxJr4phgT2SA
 jtgP6gKCABQaoE9Eqmfn0YSGqjQ+O2esSfx5+xUb6bCFDY5LB/bBpyJbrJ1244ZHVN9FPxvukb5
 NraOGZ+CTOFSx6mbdC1clO6qfIKgzwqQ7SARti31N+crDKbzvHlfdjmp/U9m2AvlOzQc1bwrgUZ
 ZgUou1GjYGxQGxAmKCay9KupgL/3FoKFL6CJ5x11dwoN9GNjvXz+3kxtbHyaSDFJN62TtEmpNwS
 /0Kih70wh2BRmK81LRVMjhj5k6oHVuwbr3Ge7Ra+TnoBg+w8S7kSm9g0CTIrBgehCCskkoQ5SdH
 qC3+Dhf6xAYwRDA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

CRTC initialization call drm_mode_crtc_set_gamma_size without the proper
checks, introduce this check.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index ff55099c86ce..39802c928bdf 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -293,7 +293,12 @@ struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev, struct drm_plane *
 	}
 	drm_crtc_helper_add(&vkms_crtc->base, &vkms_crtc_helper_funcs);
 
-	drm_mode_crtc_set_gamma_size(&vkms_crtc->base, VKMS_LUT_SIZE);
+	ret = drm_mode_crtc_set_gamma_size(&vkms_crtc->base, VKMS_LUT_SIZE);
+	if (ret) {
+		DRM_DEV_ERROR(vkmsdev->drm.dev, "Failed to set gamma size\n");
+		return ERR_PTR(ret);
+	}
+
 	drm_crtc_enable_color_mgmt(&vkms_crtc->base, 0, false, VKMS_LUT_SIZE);
 
 	spin_lock_init(&vkms_crtc->lock);

-- 
2.44.2

