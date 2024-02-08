Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F0084E78F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 19:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0171510E28B;
	Thu,  8 Feb 2024 18:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.com header.i=erick.archer@gmx.com header.b="rTP+FBzJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FB110E28B;
 Thu,  8 Feb 2024 18:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
 s=s31663417; t=1707416351; x=1708021151; i=erick.archer@gmx.com;
 bh=ysgMn0ZRWUYT/Hge0FlA9uwr6TJWomFtNilVmXv2T/w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=rTP+FBzJf6c9vHHT+97TkSG/Uvm8g90FqR4Mntv4D4A8H3TAYyI200beD81+vMSD
 P15SPBwMoO6vN2Vum+oCuRrsL+yqG1yrDgU3qxZK3QhFLycMjU4q4P7vrLNXKJWIR
 AcdNj1t1+EUHpxlmKnurOg56N5JOfXAaX9ilmI5boKITFbzs66EMftYvAoPA+1G17
 55sSMvJtp10q+Yxmsmgbsg8UV6bEueUx0wKXCYOv2R5IntpRJ81O15bsJJ0okP2vA
 7yYAKrjOalqbFHHFzgGH/eBG85bSKRO0WCgsUsqS89qOnCZz1F+JZdqPbFBhWLUJF
 ABOfgyHz/HgpUQG7Lg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([79.157.194.183]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1M7b6l-1rdLQw2iQn-0081qr; Thu, 08 Feb 2024 19:13:35 +0100
From: Erick Archer <erick.archer@gmx.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Erick Archer <erick.archer@gmx.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH] drm/i915: Add flex arrays to struct i915_syncmap
Date: Thu,  8 Feb 2024 19:13:18 +0100
Message-Id: <20240208181318.4259-1-erick.archer@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pfHdlpNnJigTy8aCxrOPtJDMrJKf0ixBybkrQ5Vv5mXAzAOCOce
 kE/56VgSJ24fEWyckAkZBiWw31er/4+LJmrLfiKbxBq0xz8Hfrzpel9d0ON3gwuUpxPyHbE
 rdS3TQvdJZV2shpo3dlarUHJyNmnOMWYszl8ojPossp4pbrgBMG/j9ZA3TOBvkYMcVXSjOq
 g75Q7z0uPqbDs2hAyGnmQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7eioEc7nG0c=;qtwKIX5gPG/Y57aHU7UDVkHMFaE
 JToO/0XCCcuVFGqULSXsSgP6ptQExfCebO6YXHofeQKSA5VTH3Rx0BPdQ/Jo+sylF13EPbI0T
 Izh6uiCVr2BeFMb8Mo7ptlutk0GaiuTXhSwPkjMW2B8o5Dc085jjAUMWeB3aQUr8ibqBQO5jZ
 XHRnAklzfh+g+TOE6RVXLDpqaGMBFNWvkkb7n93+fL/ZGG1GCFSIqWDR7O3FU4gyx0u9cxI2v
 VKBafIfiDpkzamqgGhBrNA5dBUtqs7+b0MxELAUjjVtkPS9T5LCAA+EaztiioPdaxtDVW/70/
 +D+579XV0ikBVQipN8Orbe3Cl3wLYyiQ44pDnIzYNc8WAX1mQzvah3tUv89lbMW0BZmpxVX5a
 5TG0A6y3sM/WpIuReX/L1EW3P3Xp3E85EIJE9PAbMmEjB+92stmRLuQfsY04ODHTdpoU4crn1
 Njr+fvCDsoFFu/11gu4og/beC9d/kOrZTyQi7Gjc/mc0XK6TMa8ScEMyvstVIwrFooLiO33Ng
 bFuGdjFbKoO9cfwt04+XDJ6hWuQF7COASscQ/jtY7AY6eqdsT57r2wXSKUMQArGSm7r4giTRQ
 Qsnkb5KDaNeKDM5G1EvS0JJ7jcJW+ivpF1VFxshFi1DEDMpa0Q0SWvpRAKMivN9K6RtEh13gs
 OpoWE3Lu8gIkvo6AdmTPA42MhlEFREt2H/sGt2VLV9+oSMV0kbsrinJQBjPEYscChsW1yIIxo
 WpkG5/liHV1D7yWyYkWlaKkCv+MkkPM5r7UUu+1Hz7yYdzIbozc/YNZo+V7OPP102kyAZhBle
 Ez3i3irdlHSE0lnZqSUdAgW7tybDatbHXq7POenIjwzBc=
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

The "struct i915_syncmap" uses a dynamically sized set of trailing
elements. It can use an "u32" array or a "struct i915_syncmap *"
array.

So, use the preferred way in the kernel declaring flexible arrays [1].
Because there are two possibilities for the trailing arrays, it is
necessary to declare a union and use the DECLARE_FLEX_ARRAY macro.

The comment can be removed as the union is now clear enough.

Also, avoid the open-coded arithmetic in the memory allocator functions
[2] using the "struct_size" macro.

Moreover, refactor the "__sync_seqno" and "__sync_child" functions due
to now it is possible to use the union members added to the structure.
This way, it is also possible to avoid the open-coded arithmetic in
pointers.

Link: https://www.kernel.org/doc/html/next/process/deprecated.html#zero-le=
ngth-and-one-element-arrays [1]
Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-co=
ded-arithmetic-in-allocator-arguments [2]
Signed-off-by: Erick Archer <erick.archer@gmx.com>
=2D--
 drivers/gpu/drm/i915/i915_syncmap.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_syncmap.c b/drivers/gpu/drm/i915/i9=
15_syncmap.c
index 60404dbb2e9f..df6437c37373 100644
=2D-- a/drivers/gpu/drm/i915/i915_syncmap.c
+++ b/drivers/gpu/drm/i915/i915_syncmap.c
@@ -75,13 +75,10 @@ struct i915_syncmap {
 	unsigned int height;
 	unsigned int bitmap;
 	struct i915_syncmap *parent;
-	/*
-	 * Following this header is an array of either seqno or child pointers:
-	 * union {
-	 *	u32 seqno[KSYNCMAP];
-	 *	struct i915_syncmap *child[KSYNCMAP];
-	 * };
-	 */
+	union {
+		DECLARE_FLEX_ARRAY(u32, seqno);
+		DECLARE_FLEX_ARRAY(struct i915_syncmap *, child);
+	};
 };

 /**
@@ -99,13 +96,13 @@ void i915_syncmap_init(struct i915_syncmap **root)
 static inline u32 *__sync_seqno(struct i915_syncmap *p)
 {
 	GEM_BUG_ON(p->height);
-	return (u32 *)(p + 1);
+	return p->seqno;
 }

 static inline struct i915_syncmap **__sync_child(struct i915_syncmap *p)
 {
 	GEM_BUG_ON(!p->height);
-	return (struct i915_syncmap **)(p + 1);
+	return p->child;
 }

 static inline unsigned int
@@ -200,7 +197,7 @@ __sync_alloc_leaf(struct i915_syncmap *parent, u64 id)
 {
 	struct i915_syncmap *p;

-	p =3D kmalloc(sizeof(*p) + KSYNCMAP * sizeof(u32), GFP_KERNEL);
+	p =3D kmalloc(struct_size(p, seqno, KSYNCMAP), GFP_KERNEL);
 	if (unlikely(!p))
 		return NULL;

@@ -282,7 +279,7 @@ static noinline int __sync_set(struct i915_syncmap **r=
oot, u64 id, u32 seqno)
 			unsigned int above;

 			/* Insert a join above the current layer */
-			next =3D kzalloc(sizeof(*next) + KSYNCMAP * sizeof(next),
+			next =3D kzalloc(struct_size(next, child, KSYNCMAP),
 				       GFP_KERNEL);
 			if (unlikely(!next))
 				return -ENOMEM;
=2D-
2.25.1

