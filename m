Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229F07467B8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 04:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF66F10E26B;
	Tue,  4 Jul 2023 02:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0A710E26B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 02:53:49 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-pE3BurX5Px6usp1Ejjf5PQ-1; Mon, 03 Jul 2023 22:53:35 -0400
X-MC-Unique: pE3BurX5Px6usp1Ejjf5PQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06C1686F122;
 Tue,  4 Jul 2023 02:53:35 +0000 (UTC)
Received: from nomad.redhat.com (vpn2-54-59.bne.redhat.com [10.64.54.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8755440C6CCD;
 Tue,  4 Jul 2023 02:53:33 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-modules@vger.kernel.org
Subject: [PATCH 2/2] modules/firmware: add a new option to denote a firmware
 group to choose one.
Date: Tue,  4 Jul 2023 12:50:50 +1000
Message-ID: <20230704025322.2623556-3-airlied@gmail.com>
In-Reply-To: <20230704025322.2623556-1-airlied@gmail.com>
References: <20230704025322.2623556-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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
Cc: Dave Airlie <airlied@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This adds two tags that will go into the module info.

The first denotes a group of firmwares, when that tag is present all
MODULE_FIRMWARE lines between the tags will be ignored by new versions of
dracut.

The second makes an explicitly ordered group of firmwares to search for
inside a group setting. New dracut will pick the first available firmware
from this to put in the initramfs.

Old dracut will just ignore these tags and fallback to installing all
the firmwares.

The corresponding dracut code it at:
https://github.com/dracutdevs/dracut/pull/2309

Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-modules@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 include/linux/module.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/linux/module.h b/include/linux/module.h
index b255db33b40f..b7bef5814034 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -307,6 +307,40 @@ extern typeof(name) __mod_##type##__##name##_device_ta=
ble=09=09\
  */
 #define MODULE_FIRMWARE(_firmware) MODULE_INFO(firmware, _firmware)
=20
+/**
+ * MODULE_FIRMWARE_GROUP_ONLY_ONE - Create a need only one firmware group
+ * @_grpname: group name
+ *
+ * This creates a group boundary of which the driver only needs one firmwa=
re installed.
+ * This is to allow dracut to limit the number of firmwares in the initram=
fs.
+ * This just creates a new entry in the modinfo section, there should be o=
ne
+ * of these entries bracketing the group of MODULE_INFO lines.
+ *
+ * Old dracut will ignore this, and just read MODULE_FIRMWARE.
+ * New dracut will ignore MODULE_FIRMWARE lines between group boundaries,
+ * and will only parse the new group list.
+ * It will pick the first found firmware from the group list.
+ *
+ * ``MODULE_FIRMWARE_GROUP_ONLY_ONE("mygroup")``
+ *
+ * ``MODULE_FIRMWARE_GROUP_LIST("firmwarev2,firmwarev1")``
+ *
+ * ``MODULE_FIRMWARE("firmwarev1")``
+ *
+ * ``MODULE_FIRMWARE("firmwarev2")``
+ *
+ * ``MODULE_FIRMWARE_GROUP_ONLY_ONE("mygroup")``
+ */
+#define MODULE_FIRMWARE_GROUP_ONLY_ONE(_grpname) MODULE_INFO(firmware_grou=
p_only_one, _grpname)
+
+/**
+ * MODULE_FIRMWARE_GROUP_LIST - Create a need one firmware list
+ * @_fwnames: firmware names in the group.
+ *
+ * See MODULE_FIRMWARE_GROUP_ONLY_ONE.
+ */
+#define MODULE_FIRMWARE_GROUP_LIST(_fwnames) MODULE_INFO(firmware_group_li=
st, _fwnames)
+
 /**
  * MODULE_IMPORT_NS - Set the symbol namespace for the module.
  * @ns: symbol namespace to import the module into.
--=20
2.41.0

