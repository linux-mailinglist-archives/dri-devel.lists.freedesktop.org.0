Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBCB6E7261
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 06:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA39E10E05F;
	Wed, 19 Apr 2023 04:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 355 seconds by postgrey-1.36 at gabe;
 Wed, 19 Apr 2023 04:44:12 UTC
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5CE10E05F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 04:44:12 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-yyLvVTcoMf2-qj5HLDZvig-1; Wed, 19 Apr 2023 00:36:57 -0400
X-MC-Unique: yyLvVTcoMf2-qj5HLDZvig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9807B8996E0;
 Wed, 19 Apr 2023 04:36:57 +0000 (UTC)
Received: from dreadlord.bne.redhat.com (fdacunha.bne.redhat.com [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F2A1C15BAD;
 Wed, 19 Apr 2023 04:36:55 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: linux-modules@vger.kernel.org
Subject: [PATCH] modules/firmware: add a new option to denote a firmware group
 to choose one.
Date: Wed, 19 Apr 2023 14:36:52 +1000
Message-Id: <20230419043652.1773413-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
 dri-devel@lists.freedesktop.org
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
 include/linux/module.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/module.h b/include/linux/module.h
index 4435ad9439ab..f02448ed5e2b 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -289,6 +289,8 @@ extern typeof(name) __mod_##type##__##name##_device_tab=
le=09=09\
  * files require multiple MODULE_FIRMWARE() specifiers */
 #define MODULE_FIRMWARE(_firmware) MODULE_INFO(firmware, _firmware)
=20
+#define MODULE_FIRMWARE_GROUP_ONLY_ONE(_grpname) MODULE_INFO(firmware_grou=
p_only_one, _grpname)
+
 #define MODULE_IMPORT_NS(ns)=09MODULE_INFO(import_ns, __stringify(ns))
=20
 struct notifier_block;
--=20
2.39.2

