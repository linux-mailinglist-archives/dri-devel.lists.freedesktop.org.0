Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C72E420138
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 12:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A046E057;
	Sun,  3 Oct 2021 10:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE436E057
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Oct 2021 10:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633257798;
 bh=zopy7JiduOhiOraL+CIOE8r8McNSECiWHJbGvJY+/wk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=lvx5GL/7dRsd5R/rBBj/tK46Hs3uVK08hGHs9VaKJev7d95nT7KoAgo7aEpUrCa7k
 83SRFuRYMzsPBEdgge8DSDM5R0q3nqYztQq01UkWpw4O79nannpH7bk5uz4E18oi1w
 0rsU9CC57/nCJ6bu1AJzqJw3PjjC2vB/oucng1CQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1N9dwd-1mtnBT2n9J-015c9e; Sun, 03 Oct 2021 12:43:18 +0200
From: Len Baker <len.baker@gmx.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Len Baker <len.baker@gmx.com>, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: Prefer struct_size over open coded arithmetic
Date: Sun,  3 Oct 2021 12:42:58 +0200
Message-Id: <20211003104258.18550-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uxCZL6xJRu3oEOGIGxrkEkeAYobt3kt5RUND+CwOV7gb29aFtlt
 XYBMW8PY3+dXrVVEyjK13+fJll8DyzLN5hKiyTJwBj7xorhQJWIRIJlhc7qgnpoRH1yJWkf
 2hAQv7FbJdd4kVls/vfCWapbxyQ/CmhjQU/diQasrAEpcfjfCgHmpKHWhCb4I10bOqQkLUT
 Pl1tYhlOrbJQJf1gpBtaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QArz2dc5ypc=:p3dODVcckWTX11y2VtLBr7
 FC/Utic68qHS63CflCCl/X/mpL8FtpFit/UwO99wCcZMBO1JS8G0MRlSRYJSv0w8aYX+OM/Gi
 0g/5QwJ8hI91A3IUORASvq1Py8jAcoa2371wPgjzXDAlkjeJxyTn0nwzFuIeuOdp9Wz6qtrLO
 KqDd5Kn/vq8cGvb59EQWFwz/VfRxBqMLXCHzE6U8CZA8cBUH6WDcVGLNDOe8oiZX1GPS/H4+d
 YSEff4AmwtR3f0jr24gk0vYqTFNFJbPDYFqE8g2vqEblxo3SzOpVuoAbNiobu1PN8mHUEdJiB
 KEPFHijtDdOIzsAg3FmkiVrzyGz+/j8N9GlbIaDXx+c10rCjzeg5fTc036Bce48tJh1Y/phG0
 B/4aSWr1pHD7PeQPry1Ev/isEjZdovZLu/dFZMQFzJuoiDFi2guxhdKSJZOsZAnGfDvvgIslN
 O3nfeHlqbFxhMcB5amayK+e5mZ00v4AfqImC1wJPRZj0CKR/H0yYHcVbQTJk1F9nwIP1M0sKY
 caLX0bCQKnRZXK0b/OJkr9F+2Jioc98c66zsbZm4vP6WsMQj+n9XyFwFi4+phdUuer6N0rbBE
 UzUcMtXWWhUmY+AIoKJmWJ53JQG9qO358J7PMEJMVXt1COwQlZh8SoR3Ve8aTDng3TpP7KhEI
 88f3kO03YSsBXibhXRandSRMdKMuZzF0GmcfSiioLaqVmJxc/+yszUq7wfeaNKKJg/93Jdo7d
 4Il2pBI04ZylcnevLpzPm0o6KfoHv9PDjiPoINqlFfnd7bZprZWAFOTO6hvTQraPWTRQaYaGg
 fZBmNv+8PIIxZs/Lmjce8KIFr9vz6nnmVF/46ue+3fElE1UBYb3utd2ciSaf9eDOrcFyJGea3
 2oU8WEZYAQpWUFTCB1eh/kJQy4PfLUp1YnkFM/comLpQib+PHEFIx/RIBlVpIqPbeNXN2P/I9
 xdd/texNihEkS69vV9nviESlpMvEcsX2NcmdxYViSYZqystYFjeXGnmpRdKuZ7KniGRMqsIIW
 vHrGhRMNFS4rbZTbHWOUUhcosT3/MQdtCIbLGktMWhRwiKy37OOr2339lZPXA6LvwTaq4SE0r
 +2AKRZwPwqeFYQ=
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

As noted in the "Deprecated Interfaces, Language Features, Attributes,
and Conventions" documentation [1], size calculations (especially
multiplication) should not be performed in memory allocator (or similar)
function arguments due to the risk of them overflowing. This could lead
to values wrapping around and a smaller allocation being made than the
caller was expecting. Using those allocations could lead to linear
overflows of heap memory and other misbehaviors.

In this case these are not actually dynamic sizes: all the operands
involved in the calculation are constant values. However it is better to
refactor them anyway, just to keep the open-coded math idiom out of
code.

So, add at the end of the struct i915_syncmap a union with two flexible
array members (these arrays share the same memory layout). This is
possible using the new DECLARE_FLEX_ARRAY macro. And then, use the
struct_size() helper to do the arithmetic instead of the argument
"size + count * size" in the kmalloc and kzalloc() functions.

Also, take the opportunity to refactor the __sync_seqno and __sync_child
making them more readable.

This code was detected with the help of Coccinelle and audited and fixed
manually.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#open-co=
ded-arithmetic-in-allocator-arguments

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/gpu/drm/i915/i915_syncmap.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_syncmap.c b/drivers/gpu/drm/i915/i9=
15_syncmap.c
index 60404dbb2e9f..a8d35491d05a 100644
=2D-- a/drivers/gpu/drm/i915/i915_syncmap.c
+++ b/drivers/gpu/drm/i915/i915_syncmap.c
@@ -82,6 +82,10 @@ struct i915_syncmap {
 	 *	struct i915_syncmap *child[KSYNCMAP];
 	 * };
 	 */
+	union {
+		DECLARE_FLEX_ARRAY(u32, seqno);
+		DECLARE_FLEX_ARRAY(struct i915_syncmap *, child);
+	};
 };

 /**
@@ -99,13 +103,13 @@ void i915_syncmap_init(struct i915_syncmap **root)
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
@@ -200,7 +204,7 @@ __sync_alloc_leaf(struct i915_syncmap *parent, u64 id)
 {
 	struct i915_syncmap *p;

-	p =3D kmalloc(sizeof(*p) + KSYNCMAP * sizeof(u32), GFP_KERNEL);
+	p =3D kmalloc(struct_size(p, seqno, KSYNCMAP), GFP_KERNEL);
 	if (unlikely(!p))
 		return NULL;

@@ -282,7 +286,7 @@ static noinline int __sync_set(struct i915_syncmap **r=
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

