Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A36069ACEF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E25910EFED;
	Fri, 17 Feb 2023 13:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCFB10EFE9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hw5y2doCl00T3ibUla5BtLSkevMMipuwdAIlo8ABos8=;
 b=KdZ5OVRO/J0tjc8Ie8acigPl6WxpZ6q7cHfGuFNpOQLF6FcVM44mkBSjU4aFSPFI4hBejL
 lGDjpDTiarTpcEVeDrs3Jwr2g/pIcjH9HeeDBdHecRb3vGnzHv+swQUO4oxdA7His5CfvV
 0nOqRVO3cj0jcgk+AYfSQ8bNjp4cMto=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-r-zjI4mkPnaql5o1J9KC2A-1; Fri, 17 Feb 2023 08:44:46 -0500
X-MC-Unique: r-zjI4mkPnaql5o1J9KC2A-1
Received: by mail-ed1-f71.google.com with SMTP id
 w11-20020a056402268b00b004accf30f6d3so1841878edd.14
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:44:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hw5y2doCl00T3ibUla5BtLSkevMMipuwdAIlo8ABos8=;
 b=b+YODi76VNmS3Rr0pnaxWQtZGqbQ8iRHTtASfmNBDJ+lOHqQmeoEgyHCiIGPPiI2Ix
 UHuKIPrBlaYGBtlOalaXxm0miYyLbZFqOjvAgmuCfyyQST6I5milCP4GSa96tn94l+jd
 NaoebTiaF25JdcH3fr1jIkOImlGpC8jCceKPyUadW8ngnzxDT48xUmwwgDvLn6lKmaPO
 PcNfffCl6duLqGn6D5+URUqpe/kXZn+IGx3K6SYVPXs9YhKqpOmkCP5/cqGFpYRNKB8g
 pB+T77lOIIMnYGhLMkJC4x/lGO+tqB7ZE1KpKvlJK8VuYQtF826rST6H7pVZGKuNW/9y
 4q8A==
X-Gm-Message-State: AO0yUKWGoEXdlLyjbgBmtGSrZM67moRme7OZbzQ0m45AHdKui9Gev8na
 4tTFNZuHBLm/4De01cqcttHHp11KACKGNDMwLN2s6kvh9NsYtbsiXS335UkJeisbuwIgkRbBo1L
 ZICL+Ug/PbGLKZSR7n/YKPRF7NniD
X-Received: by 2002:a17:907:7204:b0:8ab:a378:5f96 with SMTP id
 dr4-20020a170907720400b008aba3785f96mr6877801ejc.3.1676641485231; 
 Fri, 17 Feb 2023 05:44:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/TZG7ec9qZlnOFOe4bPzyNu9aCVszGIuq0bCjLphIoqf/IkkxWSOngWo7N98WoGLtfENjN0g==
X-Received: by 2002:a17:907:7204:b0:8ab:a378:5f96 with SMTP id
 dr4-20020a170907720400b008aba3785f96mr6877771ejc.3.1676641484996; 
 Fri, 17 Feb 2023 05:44:44 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a1709066bc600b008b159612b2dsm2164061ejs.106.2023.02.17.05.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:44:44 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v2 04/16] maple_tree: add flag MT_FLAGS_LOCK_NONE
Date: Fri, 17 Feb 2023 14:44:10 +0100
Message-Id: <20230217134422.14116-5-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generic components making use of the maple tree (such as the
DRM GPUVA Manager) delegate the responsibility of ensuring mutual
exclusion to their users.

While such components could inherit the concept of an external lock,
some users might just serialize the access to the component and hence to
the internal maple tree.

In order to allow such use cases, add a new flag MT_FLAGS_LOCK_NONE to
indicate not to do any internal lockdep checks.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 include/linux/maple_tree.h | 20 +++++++++++++++-----
 lib/maple_tree.c           |  7 ++++---
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index ca04c900e51a..f795e5def8d0 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -170,10 +170,11 @@ enum maple_type {
 #define MT_FLAGS_USE_RCU	0x02
 #define MT_FLAGS_HEIGHT_OFFSET	0x02
 #define MT_FLAGS_HEIGHT_MASK	0x7C
-#define MT_FLAGS_LOCK_MASK	0x300
+#define MT_FLAGS_LOCK_MASK	0x700
 #define MT_FLAGS_LOCK_IRQ	0x100
 #define MT_FLAGS_LOCK_BH	0x200
 #define MT_FLAGS_LOCK_EXTERN	0x300
+#define MT_FLAGS_LOCK_NONE	0x400
 
 #define MAPLE_HEIGHT_MAX	31
 
@@ -559,11 +560,16 @@ static inline void mas_set(struct ma_state *mas, unsigned long index)
 	mas_set_range(mas, index, index);
 }
 
-static inline bool mt_external_lock(const struct maple_tree *mt)
+static inline bool mt_lock_external(const struct maple_tree *mt)
 {
 	return (mt->ma_flags & MT_FLAGS_LOCK_MASK) == MT_FLAGS_LOCK_EXTERN;
 }
 
+static inline bool mt_lock_none(const struct maple_tree *mt)
+{
+	return (mt->ma_flags & MT_FLAGS_LOCK_MASK) == MT_FLAGS_LOCK_NONE;
+}
+
 /**
  * mt_init_flags() - Initialise an empty maple tree with flags.
  * @mt: Maple Tree
@@ -577,7 +583,7 @@ static inline bool mt_external_lock(const struct maple_tree *mt)
 static inline void mt_init_flags(struct maple_tree *mt, unsigned int flags)
 {
 	mt->ma_flags = flags;
-	if (!mt_external_lock(mt))
+	if (!mt_lock_external(mt) && !mt_lock_none(mt))
 		spin_lock_init(&mt->ma_lock);
 	rcu_assign_pointer(mt->ma_root, NULL);
 }
@@ -612,9 +618,11 @@ static inline void mt_clear_in_rcu(struct maple_tree *mt)
 	if (!mt_in_rcu(mt))
 		return;
 
-	if (mt_external_lock(mt)) {
+	if (mt_lock_external(mt)) {
 		BUG_ON(!mt_lock_is_held(mt));
 		mt->ma_flags &= ~MT_FLAGS_USE_RCU;
+	} else if (mt_lock_none(mt)) {
+		mt->ma_flags &= ~MT_FLAGS_USE_RCU;
 	} else {
 		mtree_lock(mt);
 		mt->ma_flags &= ~MT_FLAGS_USE_RCU;
@@ -631,9 +639,11 @@ static inline void mt_set_in_rcu(struct maple_tree *mt)
 	if (mt_in_rcu(mt))
 		return;
 
-	if (mt_external_lock(mt)) {
+	if (mt_lock_external(mt)) {
 		BUG_ON(!mt_lock_is_held(mt));
 		mt->ma_flags |= MT_FLAGS_USE_RCU;
+	} else if (mt_lock_none(mt)) {
+		mt->ma_flags |= MT_FLAGS_USE_RCU;
 	} else {
 		mtree_lock(mt);
 		mt->ma_flags |= MT_FLAGS_USE_RCU;
diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 26e2045d3cda..f51c0fd4eaad 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -802,8 +802,8 @@ static inline void __rcu **ma_slots(struct maple_node *mn, enum maple_type mt)
 
 static inline bool mt_locked(const struct maple_tree *mt)
 {
-	return mt_external_lock(mt) ? mt_lock_is_held(mt) :
-		lockdep_is_held(&mt->ma_lock);
+	return mt_lock_external(mt) ? mt_lock_is_held(mt) :
+		mt_lock_none(mt) ? true : lockdep_is_held(&mt->ma_lock);
 }
 
 static inline void *mt_slot(const struct maple_tree *mt,
@@ -6120,7 +6120,8 @@ bool mas_nomem(struct ma_state *mas, gfp_t gfp)
 		return false;
 	}
 
-	if (gfpflags_allow_blocking(gfp) && !mt_external_lock(mas->tree)) {
+	if (gfpflags_allow_blocking(gfp) &&
+	    !mt_lock_external(mas->tree) && !mt_lock_none(mas->tree)) {
 		mtree_unlock(mas->tree);
 		mas_alloc_nodes(mas, gfp);
 		mtree_lock(mas->tree);
-- 
2.39.1

