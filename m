Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E397D594EDF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 04:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5D5DA1A8;
	Tue, 16 Aug 2022 02:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A4BDA18A;
 Tue, 16 Aug 2022 02:53:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.101.196.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 832BB3F0C6; 
 Tue, 16 Aug 2022 02:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1660618389;
 bh=IQLHeSHMCgVndEybNXy3VEpy6W3eNIybZWGGP1wHszU=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=JKzWmfhnLy7p+XWRftjo55h4+OEj/1ovUfur4+PYJ8YkxvpB5MfEWaDR9WZXVVGeL
 oWSS0jQ5KPFiirXbOkySLddOYxRWeCO8UwVm0rO9TyB1Kx61jzqCQew0boTcklHG/X
 WmaFe1Bbu6Un4U0SBPOQ87JdVyS5Zot1PEJHjoMSTqOKzJeVMzCBiS7Wovvp6NZFWo
 QdSa/Hxxx0qzVFovhz1ojJ7WlXi8vQvI4EGhbbs0F1/4IGw4SfNISBnLM0tn4PSb/Y
 rqRn8I3SwT1zk0ywcNZS1XBsWsMGH/toefKJv4/qjkpSvSWZBTX6tKCxzh346VG/fT
 sSaiDteA7uhzQ==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com
Subject: [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when it's supported
Date: Tue, 16 Aug 2022 10:52:16 +0800
Message-Id: <20220816025217.618181-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Zenghui Yu <yuzenghui@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On mobile workstations like HP ZBook Fury G8, iGFX's DP-IN can switch to
dGFX so external monitors are routed to dGFX, and more monitors can be
supported as result.

To switch the DP-IN to dGFX, the driver needs to invoke _DSM function 20
on intel_dsm_guid2. This method is described in Intel document 632107.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_acpi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
index e78430001f077..3bd5930e2769b 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.c
+++ b/drivers/gpu/drm/i915/display/intel_acpi.c
@@ -20,6 +20,7 @@ static const guid_t intel_dsm_guid =
 		  0xa8, 0x54, 0x0f, 0x13, 0x17, 0xb0, 0x1c, 0x2c);
 
 #define INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED 0 /* No args */
+#define INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX 20 /* No args */
 
 static const guid_t intel_dsm_guid2 =
 	GUID_INIT(0x3e5b41c6, 0xeb1d, 0x4260,
@@ -187,6 +188,7 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	acpi_handle dhandle;
 	union acpi_object *obj;
+	int supported = 0;
 
 	dhandle = ACPI_HANDLE(&pdev->dev);
 	if (!dhandle)
@@ -194,8 +196,22 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
 
 	obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2, INTEL_DSM_REVISION_ID,
 				INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED, NULL);
-	if (obj)
+	if (obj) {
+		if (obj->type == ACPI_TYPE_INTEGER)
+			supported = obj->integer.value;
+
 		ACPI_FREE(obj);
+	}
+
+	/* Tiger Lake H DP-IN Boot Time Switching from iGfx to dGfx */
+	if (supported & BIT(20)) {
+		obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2,
+					INTEL_DSM_REVISION_ID,
+					INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX,
+					NULL);
+		if (obj)
+			ACPI_FREE(obj);
+	}
 }
 
 /*
-- 
2.36.1

