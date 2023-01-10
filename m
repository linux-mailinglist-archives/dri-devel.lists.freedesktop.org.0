Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B93AC6644D5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 16:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAA610E5E8;
	Tue, 10 Jan 2023 15:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C2C10E5E9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 15:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673364645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=amzhvsJZmMqABs7DVJRLK5eAX330bhJ3I2jvqEZEJrg=;
 b=Cz7SZSf0rSxyyKmMgrYWCFl9xXuu/FMkM4W7b7J7KbMHJwhLxRs32fWNXsjxhdtyeYiYGr
 YIO77n5nW0GFYA8ioh1T0ryfbxmMosLnFLnYglU3cZa+dUrWPakgv3UCPk9mLpyWc5/Lgr
 w1VN4RiMyMT2XNgjRUkWPU9wiNWIF4A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-0zz8v5JRMH-a9S6SlNRiYA-1; Tue, 10 Jan 2023 10:30:41 -0500
X-MC-Unique: 0zz8v5JRMH-a9S6SlNRiYA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B662B8828C6;
 Tue, 10 Jan 2023 15:30:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5C75492B00;
 Tue, 10 Jan 2023 15:30:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2] ACPI: Fix selecting the wrong ACPI fwnode for the iGPU on
 some Dell laptops
Date: Tue, 10 Jan 2023 16:30:28 +0100
Message-Id: <20230110153028.183294-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: linux-acpi@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Dell Latitude E6430 both with and without the optional NVidia dGPU
has a bug in its ACPI tables which is causing Linux to assign the wrong
ACPI fwnode / companion to the pci_device for the i915 iGPU.

Specifically under the PCI root bridge there are these 2 ACPI Device()s :

 Scope (_SB.PCI0)
 {
     Device (GFX0)
     {
         Name (_ADR, 0x00020000)  // _ADR: Address
     }

     ...

     Device (VID)
     {
         Name (_ADR, 0x00020000)  // _ADR: Address
         ...

         Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
         {
             VDP8 = Arg0
             VDP1 (One, VDP8)
         }

         Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
         {
             ...
         }
         ...
     }
 }

The non-functional GFX0 ACPI device is a problem, because this gets
returned as ACPI companion-device by acpi_find_child_device() for the iGPU.

This is a long standing problem and the i915 driver does use the ACPI
companion for some things, but works fine without it.

However since commit 63f534b8bad9 ("ACPI: PCI: Rework acpi_get_pci_dev()")
acpi_get_pci_dev() relies on the physical-node pointer in the acpi_device
and that is set on the wrong acpi_device because of the wrong
acpi_find_child_device() return. This breaks the ACPI video code,
leading to non working backlight control in some cases.

Add a type.backlight flag, mark ACPI video bus devices with this and make
find_child_checks() return a higher score for children with this flag set,
so that it picks the right companion-device.

Co-developed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Switch to Rafael's suggested implementation using a type.backlight flag
  and only make find_child_checks() return a higher score when this is set
---
 drivers/acpi/glue.c     | 14 ++++++++++++--
 drivers/acpi/scan.c     |  7 +++++--
 include/acpi/acpi_bus.h |  3 ++-
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/glue.c b/drivers/acpi/glue.c
index 204fe94c7e45..a194f30876c5 100644
--- a/drivers/acpi/glue.c
+++ b/drivers/acpi/glue.c
@@ -75,7 +75,8 @@ static struct acpi_bus_type *acpi_get_bus_type(struct device *dev)
 }
 
 #define FIND_CHILD_MIN_SCORE	1
-#define FIND_CHILD_MAX_SCORE	2
+#define FIND_CHILD_MID_SCORE	2
+#define FIND_CHILD_MAX_SCORE	3
 
 static int match_any(struct acpi_device *adev, void *not_used)
 {
@@ -96,8 +97,17 @@ static int find_child_checks(struct acpi_device *adev, bool check_children)
 		return -ENODEV;
 
 	status = acpi_evaluate_integer(adev->handle, "_STA", NULL, &sta);
-	if (status == AE_NOT_FOUND)
+	if (status == AE_NOT_FOUND) {
+		/*
+		 * Special case: backlight device objects without _STA are
+		 * preferred to other objects with the same _ADR value, because
+		 * it is more likely that they are actually useful.
+		 */
+		if (adev->pnp.type.backlight)
+			return FIND_CHILD_MID_SCORE;
+
 		return FIND_CHILD_MIN_SCORE;
+	}
 
 	if (ACPI_FAILURE(status) || !(sta & ACPI_STA_DEVICE_ENABLED))
 		return -ENODEV;
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 274344434282..0c6f06abe3f4 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1370,9 +1370,12 @@ static void acpi_set_pnp_ids(acpi_handle handle, struct acpi_device_pnp *pnp,
 		 * Some devices don't reliably have _HIDs & _CIDs, so add
 		 * synthetic HIDs to make sure drivers can find them.
 		 */
-		if (acpi_is_video_device(handle))
+		if (acpi_is_video_device(handle)) {
 			acpi_add_id(pnp, ACPI_VIDEO_HID);
-		else if (acpi_bay_match(handle))
+			pnp->type.backlight = 1;
+			break;
+		}
+		if (acpi_bay_match(handle))
 			acpi_add_id(pnp, ACPI_BAY_HID);
 		else if (acpi_dock_match(handle))
 			acpi_add_id(pnp, ACPI_DOCK_HID);
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index cd3b75e08ec3..e44be31115a6 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -230,7 +230,8 @@ struct acpi_pnp_type {
 	u32 hardware_id:1;
 	u32 bus_address:1;
 	u32 platform_id:1;
-	u32 reserved:29;
+	u32 backlight:1;
+	u32 reserved:28;
 };
 
 struct acpi_device_pnp {
-- 
2.39.0

