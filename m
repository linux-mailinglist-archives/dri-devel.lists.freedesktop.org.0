Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFD736C192
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A076E928;
	Tue, 27 Apr 2021 09:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B4D6E90B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 09:20:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h4so49653499wrt.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 02:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CGUka0sVW6wFNgc+ztoFeb2OUOiG/y4ojkNNplTLBt0=;
 b=lHcSeuO8JXlioU0SoJkhNjeUMSk697hQ5zjRlICZIdlcoCD+gtNxmqtsqVaoejeIqF
 JVkbZ4vwo0H7UnWI6b/SRN11ITJY5qZrNUtNBWPwhSqHZ0aDzFYt65GC1/dJLw4AR9d5
 kPi4sCxP4h02OO5vhQbXsNHkUWX1w1OD5rfsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CGUka0sVW6wFNgc+ztoFeb2OUOiG/y4ojkNNplTLBt0=;
 b=DYmimBvv9CqHEjjB0p1KNs3LATJUHJv0tIHgN/MOR41FKK6FOjVL81uvmcT7EWLvAQ
 hF2AX+48V9VvlRHV0g8dvUSpA8rsJbAS19bU5BVyxvvL3riCIhoUd8WPY5SAHdK7ACdb
 nRXJct866/kLwYBlcfKjTU22BtRpD1nMCg7iovtVVgE5bk1zp1fpvP4mC3OKNSD/YA8A
 T07zPi1ObcPMZxlRCksocyO0o0sxsd7Xb4OvINIPdbWaksSsJmTaPRF7sxmPXoOjyYFz
 KSm1N4UQfU+QgScSGijA+0OwNczsny8d09Gi3StKjMA4OKaxaFAlqwzCKMDRQGEE7OfS
 Fc4Q==
X-Gm-Message-State: AOAM533qBwKN3akjxHFybx8Uhujx/SeFtO5ZgMyXZUgdKcykf293bsYr
 RAjKZbiLzOLP9h+Rijnd0JifEzj9kayuqg==
X-Google-Smtp-Source: ABdhPJzvyNyHijFaOxhyQ5XBzpoVz9wyxCqtYwON0mcdqndBwfa9nQPuaqV5R5FcJKMQq7TH0Bmpog==
X-Received: by 2002:a5d:444d:: with SMTP id x13mr28571123wrr.406.1619515225336; 
 Tue, 27 Apr 2021 02:20:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r24sm1939816wmh.8.2021.04.27.02.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:20:24 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/8] drm/arm/malidp: Always list modifiers
Date: Tue, 27 Apr 2021 11:20:12 +0200
Message-Id: <20210427092018.832258-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
References: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <liviu.dudau@arm.com>, stable@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even when all we support is linear, make that explicit. Otherwise the
uapi is rather confusing.

Cc: stable@vger.kernel.org
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/arm/malidp_planes.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index ddbba67f0283..8c2ab3d653b7 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -927,6 +927,11 @@ static const struct drm_plane_helper_funcs malidp_de_plane_helper_funcs = {
 	.atomic_disable = malidp_de_plane_disable,
 };
 
+static const uint64_t linear_only_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 int malidp_de_planes_init(struct drm_device *drm)
 {
 	struct malidp_drm *malidp = drm->dev_private;
@@ -990,8 +995,8 @@ int malidp_de_planes_init(struct drm_device *drm)
 		 */
 		ret = drm_universal_plane_init(drm, &plane->base, crtcs,
 				&malidp_de_plane_funcs, formats, n,
-				(id == DE_SMART) ? NULL : modifiers, plane_type,
-				NULL);
+				(id == DE_SMART) ? linear_only_modifiers : modifiers,
+				plane_type, NULL);
 
 		if (ret < 0)
 			goto cleanup;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
