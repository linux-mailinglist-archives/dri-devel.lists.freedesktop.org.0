Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF4BB39E17
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 15:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6647610E9AB;
	Thu, 28 Aug 2025 13:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="QA1ia5Ty";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48E010E9A9;
 Thu, 28 Aug 2025 13:04:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756386280; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UXdb7qtUMuUfb7I/Yo2iOa1ijUtosxp40K+CT1oZh/S4TLHPxhn6m4pRKv0bebRmbAbL/PGEhNsvw5rzbe44/2bUJECkTb2R0yo/mSQAMxHwVrmvDk5LU756DHAIjSFCCRcKJLLj3aIg29gPM7Owkqr6wv0qqJMPVHOu1TQrQPs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756386280;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IsBIBxMMc8GVYJbqi0A58N+l8O/netfqjBFPZE3p3I4=; 
 b=HBW0MKs2viOZh4TRvvfJ4MzlT6apiffoYmZN914q6mBbgFWct5IMXIq/X3d3BoGzzAPvOZC2ECX6YyF5BmzKNBLez50bsT2cPMW9jU3a/uiVchkjvQNBGz+uvL9rbBxa+YZ9Mf3+ri5D8pzj9YpvV9gHUEkmPABlZV3Xj6FqzOE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756386280; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=IsBIBxMMc8GVYJbqi0A58N+l8O/netfqjBFPZE3p3I4=;
 b=QA1ia5TyT73ESyCYs1l5dXGF/1igDG7e6J7LUMNNl/azsJ2C8ZQ2/4Pz4jkn1OOr
 4qJfbTGD74oI7mKUyTnzmaxSAvOH6fL23SAFpo+cBwOBwKCnbdEJi3HQW8OO5Oj0Emc
 oCNpkA8JsfRhhpRdxH0+24mnX78HrsKmKgG91e04=
Received: by mx.zohomail.com with SMTPS id 1756386278674819.7897722440389;
 Thu, 28 Aug 2025 06:04:38 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t 3/4] lib: initial panthor infrastructure
Date: Thu, 28 Aug 2025 10:03:59 -0300
Message-ID: <20250828130402.2549948-4-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828130402.2549948-1-daniel.almeida@collabora.com>
References: <20250828130402.2549948-1-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Add the basic infrastructure that will be used by the Panthor tests
themselves.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 lib/igt_panthor.c | 14 ++++++++++++++
 lib/igt_panthor.h |  8 ++++++++
 lib/meson.build   |  1 +
 3 files changed, 23 insertions(+)
 create mode 100644 lib/igt_panthor.c
 create mode 100644 lib/igt_panthor.h

diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
new file mode 100644
index 000000000..3e2c29b17
--- /dev/null
+++ b/lib/igt_panthor.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: MIT
+// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
+
+#include "igt_panthor.h"
+
+/**
+ * SECTION:igt_panthor
+ * @short_description: Panthor support library
+ * @title: Panthor
+ * @include: igt.h
+ *
+ * This library provides various auxiliary helper functions for writing Panthor
+ * tests.
+ */
diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
new file mode 100644
index 000000000..c4bee1838
--- /dev/null
+++ b/lib/igt_panthor.h
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: MIT
+// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
+
+#ifndef IGT_PANTHOR_H
+#define IGT_PANTHOR_H
+
+
+#endif /* IGT_PANTHOR_H */
diff --git a/lib/meson.build b/lib/meson.build
index f078dad4e..1738f1b54 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -104,6 +104,7 @@ lib_sources = [
 	'igt_kmod.c',
 	'igt_ktap.c',
 	'igt_panfrost.c',
+	'igt_panthor.c',
 	'igt_v3d.c',
 	'igt_vc4.c',
 	'igt_vmwgfx.c',
-- 
2.50.1

