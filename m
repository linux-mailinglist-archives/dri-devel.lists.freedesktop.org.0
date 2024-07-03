Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FE892652E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5E710E99A;
	Wed,  3 Jul 2024 15:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DOrjPUWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C804A10E99A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 15:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720021478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0frVolVqICIByf5Si0QYc0zMajNKduQXQ0wYd9/EsUE=;
 b=DOrjPUWpt9P33WKCK0Oq1QRoER8iu2ka4HfeVJSSj4Ll+mUYRR/ILDutZGV1XjmMAZaVwd
 41Lu/tFK+P4rzgeULvMQN3byfFDCFf5a0sjN8saSzdrKS75rrVDQhDrLYyRYsKOVehXVuD
 mfvLNgOejroXay4c0mJ9BPsa+byAYnA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-4Nv7kDPNOIKt5ziTvenevA-1; Wed,
 03 Jul 2024 11:44:37 -0400
X-MC-Unique: 4Nv7kDPNOIKt5ziTvenevA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CFF1E1955BC0; Wed,  3 Jul 2024 15:44:34 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.208])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EAD3D1955BC0; Wed,  3 Jul 2024 15:44:28 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 "Bjorn Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 2/4] drm/rect: add drm_rect_overlap()
Date: Wed,  3 Jul 2024 17:33:59 +0200
Message-ID: <20240703154309.426867-3-jfalempe@redhat.com>
In-Reply-To: <20240703154309.426867-1-jfalempe@redhat.com>
References: <20240703154309.426867-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

Check if two rectangles overlap.
It's a bit similar to drm_rect_intersect() but this won't modify
the rectangle.
Simplifies a bit drm_panic.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c |  3 +--
 include/drm/drm_rect.h      | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index fb8c823b7c00..9e06609e1799 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -522,8 +522,7 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
 	/* Fill with the background color, and draw text on top */
 	drm_panic_fill(sb, &r_screen, bg_color);
 
-	if ((r_msg.x1 >= logo_width || r_msg.y1 >= logo_height) &&
-	    logo_width <= sb->width && logo_height <= sb->height) {
+	if (!drm_rect_overlap(&r_logo, &r_msg)) {
 		if (logo_mono)
 			drm_panic_blit(sb, &r_logo, logo_mono->data, DIV_ROUND_UP(logo_width, 8),
 				       fg_color);
diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
index 73fcb899a01d..7bafde747d56 100644
--- a/include/drm/drm_rect.h
+++ b/include/drm/drm_rect.h
@@ -238,6 +238,21 @@ static inline void drm_rect_fp_to_int(struct drm_rect *dst,
 		      drm_rect_height(src) >> 16);
 }
 
+/**
+ * drm_rect_overlap - Check if two rectangles overlap
+ * @r1: first rectangle
+ * @r2: second rectangle
+ *
+ * RETURNS:
+ * %true if the rectangles overlap, %false otherwise.
+ */
+static inline bool drm_rect_overlap(const struct drm_rect *r1,
+				    const struct drm_rect *r2)
+{
+	return (r1->x2 > r2->x1 && r2->x2 > r1->x1 &&
+		r1->y2 > r2->y1 && r2->y2 > r1->y1);
+}
+
 bool drm_rect_intersect(struct drm_rect *r, const struct drm_rect *clip);
 bool drm_rect_clip_scaled(struct drm_rect *src, struct drm_rect *dst,
 			  const struct drm_rect *clip);
-- 
2.45.2

