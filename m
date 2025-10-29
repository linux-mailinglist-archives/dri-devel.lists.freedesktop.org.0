Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5078BC19A8E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 11:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3E710E780;
	Wed, 29 Oct 2025 10:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDD210E77B;
 Wed, 29 Oct 2025 10:22:10 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 4F3743F11A;
 Wed, 29 Oct 2025 11:22:08 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH 2/4] misc/mei: Decouple ME interfaces from GPU drivers
Date: Wed, 29 Oct 2025 19:21:14 +0900
Message-ID: <20251029102153.419347-3-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251029102153.419347-1-Simon.Richter@hogyros.de>
References: <20251029102153.419347-1-Simon.Richter@hogyros.de>
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

These are enumerated via an auxiliary bus, so there is no functional
dependency between these drivers, therefore allow compiling MEI as builtin
even when i915/xe are built as modules.

Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
---
 drivers/misc/mei/Kconfig           | 2 +-
 drivers/misc/mei/gsc_proxy/Kconfig | 2 +-
 drivers/misc/mei/hdcp/Kconfig      | 2 +-
 drivers/misc/mei/pxp/Kconfig       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
index 8bf3efe3bcf5..9a45fa0c2f7a 100644
--- a/drivers/misc/mei/Kconfig
+++ b/drivers/misc/mei/Kconfig
@@ -49,7 +49,7 @@ config INTEL_MEI_TXE
 config INTEL_MEI_GSC
 	tristate "Intel MEI GSC embedded device"
 	depends on INTEL_MEI_ME
-	depends on DRM_I915
+	depends on DRM_I915!=n
 	help
 	  Intel auxiliary driver for GSC devices embedded in Intel graphics devices.
 
diff --git a/drivers/misc/mei/gsc_proxy/Kconfig b/drivers/misc/mei/gsc_proxy/Kconfig
index ac78b9d1eccd..30811117fc65 100644
--- a/drivers/misc/mei/gsc_proxy/Kconfig
+++ b/drivers/misc/mei/gsc_proxy/Kconfig
@@ -4,7 +4,7 @@
 config INTEL_MEI_GSC_PROXY
 	tristate "Intel GSC Proxy services of ME Interface"
 	depends on INTEL_MEI_ME
-	depends on DRM_I915
+	depends on DRM_I915!=n
 	help
          MEI Support for GSC Proxy Services on Intel platforms.
 
diff --git a/drivers/misc/mei/hdcp/Kconfig b/drivers/misc/mei/hdcp/Kconfig
index 631dd9651d7c..a9af4918e5b2 100644
--- a/drivers/misc/mei/hdcp/Kconfig
+++ b/drivers/misc/mei/hdcp/Kconfig
@@ -4,7 +4,7 @@
 config INTEL_MEI_HDCP
 	tristate "Intel HDCP2.2 services of ME Interface"
 	depends on INTEL_MEI_ME
-	depends on DRM_I915 || DRM_XE
+	depends on DRM_I915!=n || DRM_XE!=n
 	help
 	  MEI Support for HDCP2.2 Services on Intel platforms.
 
diff --git a/drivers/misc/mei/pxp/Kconfig b/drivers/misc/mei/pxp/Kconfig
index aa2dece4a927..d0f8bb6aa2de 100644
--- a/drivers/misc/mei/pxp/Kconfig
+++ b/drivers/misc/mei/pxp/Kconfig
@@ -4,7 +4,7 @@
 config INTEL_MEI_PXP
 	tristate "Intel PXP services of ME Interface"
 	depends on INTEL_MEI_ME
-	depends on DRM_I915 || DRM_XE
+	depends on DRM_I915!=n || DRM_XE!=n
 	help
 	  MEI Support for PXP Services on Intel platforms.
 
-- 
2.47.3

