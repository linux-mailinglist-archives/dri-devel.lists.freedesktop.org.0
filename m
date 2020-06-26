Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D67220B631
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 18:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A356ECDE;
	Fri, 26 Jun 2020 16:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 27FEC6ECDE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 16:48:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B60861042;
 Fri, 26 Jun 2020 09:48:15 -0700 (PDT)
Received: from DESKTOP-E1NTVVP.localdomain (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 862933F71E;
 Fri, 26 Jun 2020 09:48:14 -0700 (PDT)
From: Brian Starkey <brian.starkey@arm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: drm_fourcc: Add generic alias for 16_16_TILE modifier
Date: Fri, 26 Jun 2020 17:48:00 +0100
Message-Id: <20200626164800.11595-1-brian.starkey@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626163256.46duuouu6ebvtakw@DESKTOP-E1NTVVP.localdomain>
References: <20200626163256.46duuouu6ebvtakw@DESKTOP-E1NTVVP.localdomain>
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

Changes in v2:
 - Move note about future cases to comment (Daniel)

Signed-off-by: Brian Starkey <brian.starkey@arm.com>
---
 include/uapi/drm/drm_fourcc.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 299f9ac4840b..cb3db4a21012 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -345,8 +345,33 @@ extern "C" {
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
+ * In future cases where a generic layout is identified before merging with a
+ * vendor-specific modifier, a new 'GENERIC' vendor or modifier using vendor
+ * 'NONE' could be considered. This should only be for obvious, exceptional
+ * cases to avoid polluting the 'GENERIC' namespace with modifiers which only
+ * apply to a single vendor.
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
