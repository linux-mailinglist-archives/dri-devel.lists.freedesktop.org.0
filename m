Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67E8B12EF4
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 12:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBB010E3CE;
	Sun, 27 Jul 2025 10:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E356310E3C5;
 Sun, 27 Jul 2025 07:04:28 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 203763F116;
 Sun, 27 Jul 2025 09:04:25 +0200 (CEST)
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Simon Richter <Simon.Richter@hogyros.de>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/1] Mark xe driver as BROKEN if kernel page size is not 4kB
Date: Sun, 27 Jul 2025 16:04:10 +0900
Message-ID: <20250727070413.9743-2-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250727070413.9743-1-Simon.Richter@hogyros.de>
References: <20250727070413.9743-1-Simon.Richter@hogyros.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Jul 2025 10:00:09 +0000
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

This driver, for the time being, assumes that the kernel page size is 4kB,
so it fails on loong64 and aarch64 with 16kB pages, and ppc64el with 64kB
pages.

Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/xe/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 2bb2bc052120..7c9f1de7b35f 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XE
 	tristate "Intel Xe2 Graphics"
-	depends on DRM && PCI
+	depends on DRM && PCI && (PAGE_SIZE_4KB || BROKEN)
 	depends on KUNIT || !KUNIT
 	depends on INTEL_VSEC || !INTEL_VSEC
 	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)
-- 
2.47.2

