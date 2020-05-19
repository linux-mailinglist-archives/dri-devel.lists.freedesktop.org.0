Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2389D1DAC4B
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257C66E593;
	Wed, 20 May 2020 07:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6586E2E5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 08:44:38 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id f189so13893856qkd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 01:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=86PgcVVFV/b0083CtiWjXQR951R8AOvjBgVIPKWqiGo=;
 b=RuS+5Xy3h2icmiWPGU5+H2H6fL71/u6Xj32kitWMEBzE8P6k1ECCT4LWFJQdIczjAL
 W1PawkKMI0LeaWCIQMqtPtWcujcqoCsH44DY8hneju6fTbalCerGqn+Y9MixOdwDGlLv
 3xVbpNODdaUB9JkcmqLkg9hqiXG6TgyEpZMl9gdI8zYmlRBckn/PUaqi8NW8wx/651GE
 Gc2nxV2HEzLDUpZ7Docc0TrjfPAyz/g7vw/hi605NuNLMmR/Gpov2pCMtc23EbNEiiJa
 I/HWaA6Zz6wiaiTifDNNeqfD3mde9xQfwVNMPQgalgiBNfrazVPtlHjrqvOuPfz+mHg9
 9tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=86PgcVVFV/b0083CtiWjXQR951R8AOvjBgVIPKWqiGo=;
 b=Pv2s47/BuSDx2WvBXKAHdV/2C/WbEELX9+4EC3kJct1QE9pEpAN0VGDqElyfy2hTxp
 mpYgnhMcZ/D36zSM3WxLOOZE467Q2pCWUTUUPMzrl07IC2Srq0iyI5bgPGWsn5DMe/4I
 /FOyINVuIw2D9tszlBbpM5QzF1sTLCu+b8rYXQgZ1DqNTof+IaU/e8TbpeJt4BML7SvA
 NsByc6680bhlHCb8Zyj0Au6Dg5ykd1LUo1TL52DsRdV2hfEcQZrv5hncZMKMHwkOy4rP
 J5GIpmXc2bvpB4Fg/+gC2UEcLskZsFUclR9SB5+P567YjXpOqpubzPnPSm9OLSc0QQhA
 1Utg==
X-Gm-Message-State: AOAM533stAL4STLY+aaWgRLs82IT79JqOQb2Jpj4IoLK/iv047nxaw+s
 KrVa+LxAYxWlTBJP6b7dp7mwkKxhmbY=
X-Google-Smtp-Source: ABdhPJyH1bHg+rwdT6uyruMld0gBm6uTDs7NjUlmoYiouyH+WOU3A+ibDz/kbNo2AQJtS/3JiNJrgw==
X-Received: by 2002:a37:a0c6:: with SMTP id
 j189mr19205261qke.226.1589877877350; 
 Tue, 19 May 2020 01:44:37 -0700 (PDT)
Received: from localhost.localdomain.amd.com
 (p200300c58f25850023856023606ce396.dip0.t-ipconnect.de.
 [2003:c5:8f25:8500:2385:6023:606c:e396])
 by smtp.gmail.com with ESMTPSA id l64sm5126494qkd.15.2020.05.19.01.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 01:44:36 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/mm: expand rb_hole_addr augmented callbacks
Date: Tue, 19 May 2020 10:44:35 +0200
Message-Id: <20200519084436.91718-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 May 2020 07:34:33 +0000
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
Cc: nirmoy.aiemd@gmail.com, Nirmoy Das <nirmoy.das@amd.com>,
 christian.koenig@amd.com, chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expand RB_DECLARE_CALLBACKS_MAX so that it is possible to store
extra value(max hole alignment) in the rb_hole_addr augmented rbtree.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/drm_mm.c | 72 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index f4ca1ff80af9..91e90c635e05 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -241,9 +241,74 @@ static void insert_hole_size(struct rb_root_cached *root,
 	rb_insert_color_cached(&node->rb_hole_size, root, first);
 }

-RB_DECLARE_CALLBACKS_MAX(static, augment_callbacks,
-			 struct drm_mm_node, rb_hole_addr,
-			 u64, subtree_max_hole, HOLE_SIZE)
+static inline bool
+augment_callbacks_compute_max_hole(struct drm_mm_node *node, bool exit)
+{
+	struct drm_mm_node *child;
+	u64 max = HOLE_SIZE(node);
+
+	if (node->rb_hole_addr.rb_left) {
+		child = rb_entry(node->rb_hole_addr.rb_left, struct drm_mm_node,
+				 rb_hole_addr);
+		if (child->subtree_max_hole > max)
+			max = child->subtree_max_hole;
+	}
+
+	if (node->rb_hole_addr.rb_right) {
+		child = rb_entry(node->rb_hole_addr.rb_right,
+				 struct drm_mm_node, rb_hole_addr);
+		if (child->subtree_max_hole > max)
+			max = child->subtree_max_hole;
+	}
+
+	if (exit && node->subtree_max_hole == max)
+		return true;
+
+	node->subtree_max_hole = max;
+	return false;
+}
+
+static inline void
+augment_callbacks_propagate(struct rb_node *rb, struct rb_node *stop)
+{
+	while (rb != stop) {
+		struct drm_mm_node *node = rb_entry(rb,  struct drm_mm_node,
+						    rb_hole_addr);
+		if (augment_callbacks_compute_max_hole(node, true))
+			break;
+
+		rb = rb_parent(&node->rb_hole_addr);
+	}
+}
+
+static inline void
+augment_callbacks_copy(struct rb_node *rb_old, struct rb_node *rb_new)
+{
+	struct drm_mm_node *old = rb_entry(rb_old, struct drm_mm_node,
+					   rb_hole_addr);
+	struct drm_mm_node *new = rb_entry(rb_new, struct drm_mm_node,
+					   rb_hole_addr);
+
+	new->subtree_max_hole = old->subtree_max_hole;
+}
+
+static void
+augment_callbacks_rotate(struct rb_node *rb_old, struct rb_node *rb_new)
+{
+	struct drm_mm_node *old = rb_entry(rb_old, struct drm_mm_node,
+					   rb_hole_addr);
+	struct drm_mm_node *new = rb_entry(rb_new, struct drm_mm_node,
+					   rb_hole_addr);
+
+	new->subtree_max_hole = old->subtree_max_hole;
+	augment_callbacks_compute_max_hole(old, false);
+}
+
+static const struct rb_augment_callbacks augment_callbacks = {
+	.propagate = augment_callbacks_propagate,
+	.copy = augment_callbacks_copy,
+	.rotate = augment_callbacks_rotate
+};

 static void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
 {
@@ -256,6 +321,7 @@ static void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
 		parent = rb_entry(rb_parent, struct drm_mm_node, rb_hole_addr);
 		if (parent->subtree_max_hole < subtree_max_hole)
 			parent->subtree_max_hole = subtree_max_hole;
+
 		if (start < HOLE_ADDR(parent))
 			link = &parent->rb_hole_addr.rb_left;
 		else
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
