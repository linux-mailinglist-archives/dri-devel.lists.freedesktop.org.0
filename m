Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OgCFOYujWk/zwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 02:37:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6F8128FFC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 02:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFF310E6AD;
	Thu, 12 Feb 2026 01:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="hgOZQGzl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E5410E6AD
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 01:37:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770860255; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=n1CzFEGTKviIMX/d15K2//1s9Wv5dTmRu3R9+NQOdFSm3cyPVC7XVgsSwdWA751yL0Qc+n2OFvNFFug3Y3dFYQTzmaS7WTiv+PouCW+7sBxmXmlOIfjrkGevYiTwYi73q6tsJNWIzTJAMKGnRH+tTy/4P6/oWPZqyR7ywc3ysdI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770860255;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Lez+oPXTsx7GivoupNNO0Y6wKAfdFgOevpV5ZU+wW0M=; 
 b=TenFGY1TVnJe78lySi7yFk7SyIfS0mfL6oLLGfXbfaHZFhA/1IIn37zTQj2uyCYAmWW64a2SgHMyKTAyiOeaggwkKOFtCyxTl2T26Jk7kshaf5rR6Wtaw977fLXSM7twyTRNIBeibqt4RWZEDvgSAfDXhrSouliuU3k2Vcu9JWY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770860255; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Lez+oPXTsx7GivoupNNO0Y6wKAfdFgOevpV5ZU+wW0M=;
 b=hgOZQGzlxu8ykY8BXzSYLBY4zU+X7LyfJo8HWghvxqCckU1F7oaO83FmNxA0zWmM
 UOS4zn9hCN5NH8lnW9I/PgBePiwL8F+y8DjqyZYD7y0H/3Y2iAewtRzqjHyf7fVrk4F
 +MDifukPQDGHCx264QPrbzK5bU1+mM5NiK8u8V0Y=
Received: by mx.zohomail.com with SMTPS id 1770860253185360.3147245468143;
 Wed, 11 Feb 2026 17:37:33 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, beata.michalska@arm.com, lyude@redhat.com,
 Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 01/12] drm/tyr: select DRM abstractions in Kconfig
Date: Wed, 11 Feb 2026 17:37:02 -0800
Message-ID: <20260212013713.304343-2-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212013713.304343-1-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9F6F8128FFC
X-Rspamd-Action: no action

From: Boris Brezillon <boris.brezillon@collabora.com>

When Tyr uses GEM_SHMEM_HELPER and GPUVM, these helpers must be enabled
or the build will fail with undefined symbol errors like:
  "ld.lld: error: undefined symbol: drm_gem_shmem_free"

Introduce DRM_TYR_STATIC_DEPS and have Tyr select the required
abstractions to ensure that they are enabled when Tyr is built.

Also add MMU and IOMMU dependencies that will be required to boot
the firmware.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/Kconfig | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/Kconfig b/drivers/gpu/drm/tyr/Kconfig
index 4b55308fd2eb..c521fbd950ea 100644
--- a/drivers/gpu/drm/tyr/Kconfig
+++ b/drivers/gpu/drm/tyr/Kconfig
@@ -1,11 +1,23 @@
 # SPDX-License-Identifier: GPL-2.0 or MIT
 
+config DRM_TYR_STATIC_DEPS
+	bool
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_GPUVM
+	help
+	  Ensure required DRM infrastructure is built-in when enabling Tyr
+	  even if Tyr is =m
+
 config DRM_TYR
 	tristate "Tyr (Rust DRM support for ARM Mali CSF-based GPUs)"
 	depends on DRM=y
 	depends on RUST
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
+	depends on MMU
+	select DRM_TYR_STATIC_DEPS
+	select IOMMU_IO_PGTABLE_LPAE
+	depends on IOMMU_SUPPORT
 	default n
 	help
 	  Rust DRM driver for ARM Mali CSF-based GPUs.
@@ -15,5 +27,5 @@ config DRM_TYR
 	  Note that the Mali-G68 and Mali-G78, while Valhall architecture, will
 	  be supported with the panfrost driver as they are not CSF GPUs.
 
-	  if M is selected, the module will be called tyr. This driver is work
+	  If M is selected, the module will be called tyr. This driver is work
 	  in progress and may not be functional.
-- 
2.52.0

