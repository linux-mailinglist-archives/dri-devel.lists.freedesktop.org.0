Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B32BB20B2E9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 15:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD57C6ECA3;
	Fri, 26 Jun 2020 13:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 76ACB6ECA3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 13:52:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12BEE1042;
 Fri, 26 Jun 2020 06:52:40 -0700 (PDT)
Received: from DESKTOP-E1NTVVP.arm.com (unknown [10.57.61.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2AFE3F6CF;
 Fri, 26 Jun 2020 06:52:38 -0700 (PDT)
From: Brian Starkey <brian.starkey@arm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: drm_fourcc: Add generic alias for 16_16_TILE modifier
Date: Fri, 26 Jun 2020 14:52:33 +0100
Message-Id: <20200626135233.32137-1-brian.starkey@arm.com>
X-Mailer: git-send-email 2.17.1
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
Cc: andrzej.p@samsung.com, liviu.dudau@arm.com, matteo.franchin@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In cases such as DRM_FORMAT_MOD_SAMSUNG_16_16_TILE, the modifier
describes a generic pixel re-ordering which can be applicable to
multiple vendors.

Define an alias: DRM_FORMAT_MOD_GENERIC_16_16_TILE, which can be
used to describe this layout in a vendor-neutral way, and add a
comment about the expected usage of such "generic" modifiers.

Signed-off-by: Brian Starkey <brian.starkey@arm.com>
---

This is based off a suggestion from Daniel here:
https://lore.kernel.org/dri-devel/20200529115328.GC1630358@phenom.ffwll.local/

If there are future cases where a "generic" modifier is identified
before merging with a specific vendor code, perhaps we could use
`fourcc_mod_code(NONE, n)` or add a DRM_FORMAT_MOD_VENDOR_GENERIC.

However, I also think we shouldn't try and "guess" what might be generic
up-front and end up polluting the generic namespace. It seems fine to
just alias vendor-specific definitions unless it's very clear-cut.

I typed a version which was s/GENERIC/COMMON/, other suggestions
welcome.

Cheers,
-Brian

 include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 299f9ac4840b..ef78dc9c3fb0 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -345,8 +345,27 @@ extern "C" {
  * When adding a new token please document the layout with a code comment,
  * similar to the fourcc codes above. drm_fourcc.h is considered the
  * authoritative source for all of these.
+ *
+ * Generic modifier names:
+ *
+ * DRM_FORMAT_MOD_GENERIC_* definitions are used to provide vendor-neutral names
+ * for layouts which are common across multiple vendors. To preserve
+ * compatibility, in cases where a vendor-specific definition already exists and
+ * a generic name for it is desired, the common name is a purely symbolic alias
+ * and must use the same numerical value as the original definition.
+ *
+ * Note that generic names should only be used for modifiers which describe
+ * generic layouts (such as pixel re-ordering), which may have
+ * independently-developed support across multiple vendors.
+ *
+ * Generic names should not be used for cases where multiple hardware vendors
+ * have implementations of the same standardised compression scheme (such as
+ * AFBC). In those cases, all implementations should use the same format
+ * modifier(s), reflecting the vendor of the standard.
  */
 
+#define DRM_FORMAT_MOD_GENERIC_16_16_TILE DRM_FORMAT_MOD_SAMSUNG_16_16_TILE
+
 /*
  * Invalid Modifier
  *
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
