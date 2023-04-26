Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142156EECF7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 06:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B12310E2DC;
	Wed, 26 Apr 2023 04:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC7E10E2DC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 04:31:11 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-wCLorNtLOJyk2a5pb64drg-1; Wed, 26 Apr 2023 00:29:38 -0400
X-MC-Unique: wCLorNtLOJyk2a5pb64drg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CD0438123A2;
 Wed, 26 Apr 2023 04:29:38 +0000 (UTC)
Received: from nomad.redhat.com (vpn2-54-28.bne.redhat.com [10.64.54.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD01440C2064;
 Wed, 26 Apr 2023 04:29:36 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] modules/firmware: add a new option to denote a firmware
 group to choose one.
Date: Wed, 26 Apr 2023 14:29:06 +1000
Message-Id: <20230426042906.724352-2-airlied@gmail.com>
In-Reply-To: <20230426042906.724352-1-airlied@gmail.com>
References: <20230426042906.724352-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Dave Airlie <airlied@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>,
 linux-modules@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This adds a tag that will go into the module info, only one firmware from
the group given needs to be available for this driver to work. This allows
dracut to avoid adding in firmware that aren't needed.

This just brackets a module list in the modinfo, the modules in the list
will get entries in reversed order so the last module in the list is the
preferred one.

The corresponding dracut code it at:
https://github.com/dracutdevs/dracut/pull/2309

Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-modules@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 include/linux/module.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/module.h b/include/linux/module.h
index f9d072a7e198..d3e7085cedd0 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -306,6 +306,28 @@ extern typeof(name) __mod_##type##__##name##_device_ta=
ble=09=09\
  */
 #define MODULE_FIRMWARE(_firmware) MODULE_INFO(firmware, _firmware)
=20
+/**
+ * MODULE_FIRMWARE_GROUP_ONLY_ONE - Create a need only one firmware group
+ * @_grpname: group name
+ *
+ * This creates a group of which the driver only needs one firmware instal=
led.
+ * This is to allow dracut to limit the number of firmwares in the initram=
fs.
+ * This just creates a new entry in the modinfo section, there should be o=
ne
+ * of these entries bracketing the group of MODULE_INFO lines.
+ * Due to how modinfo is constructed the ordering of the modinfo means the
+ * last module info in the group will end up being the first one dracut wi=
ll
+ * search for, so place the newest firmware last.
+ *
+ * ``MODULE_FIRMWARE_GROUP_ONLY_ONE("mygroup")``
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
 /**
  * MODULE_IMPORT_NS - Set the symbol namespace for the module.
  * @ns: symbol namespace to import the module into.
--=20
2.39.2

