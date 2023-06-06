Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5A725857
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C1610E489;
	Wed,  7 Jun 2023 08:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE57A10E179
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 18:30:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686076230; cv=none; d=zohomail.in; s=zohoarc; 
 b=X9vFGcGJeisIalvabYGBih6inqjrxMLFj22NDV82vmKlcz7pIqCbLJ40W8Hhdx+tRs76XTDecsR0DmZfw3V8El9tGEa863X8ke5mLlpwYhtLuU81NcfziCPc2oc5k7HpmHmvMd4qVSydtupKsoeEI/xgMoAjj1MIqAjoK9VqMQM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686076230;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=gXvXXU5Pl512RxL2KjdbvSb2lS9QYJMeMK1bfUSHDnM=; 
 b=A0N2SwCQYXxjh13/6s2bkeFft4w7YJFnWRD9wKWXubpwAOS19pjJR94RcfZEaHF9raqQmkRvY7NuXc7HZWlEhn8zXzjeqW+kzdK1u4CVdhnU9PUYr5M07UCrqrSUIlfnzqlofN/BLYOldVQosLg9jcXM0Bf4k9n0Cn7sk6o1O5s=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686076230; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=gXvXXU5Pl512RxL2KjdbvSb2lS9QYJMeMK1bfUSHDnM=;
 b=WI9X05PBzmzOzoRXjArKjm0ubGJ5abijIAX1oTKNy6vzd1qBc1GTwVXiqCNq6rUr
 gYIt0PN/gM0r1WOly006wmTcoFFZwEwPLe2yF1Dk/6iY2gJeehuqo4bk/nSW0uKE2Pe
 AJ/HK/cE6clYOUniJdywWgk7/m1G88NiNOLAT3Zc=
Received: from kampyooter.. (122.176.141.156 [122.176.141.156]) by mx.zoho.in
 with SMTPS id 1686076228732331.1940331440147;
 Wed, 7 Jun 2023 00:00:28 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <8ab073a962d29139bca3b2a4f75991f39297e56a.1686075579.git.code@siddh.me>
Subject: [PATCH v10 4/9] drm: Remove usage of deprecated DRM_NOTE in DRM core
Date: Wed,  7 Jun 2023 00:00:05 +0530
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1686075579.git.code@siddh.me>
References: <cover.1686075579.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:26 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_print.h says DRM_NOTE is deprecated in favor of drm_notice().

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_displayid.c         | 2 +-
 drivers/gpu/drm/drm_kms_helper_common.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayi=
d.c
index 9edc111be7ee..27ffeee09e4f 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -42,7 +42,7 @@ validate_displayid(const u8 *displayid, int length, int i=
dx)
 =09for (i =3D 0; i < dispid_length; i++)
 =09=09csum +=3D displayid[idx + i];
 =09if (csum) {
-=09=09DRM_NOTE("DisplayID checksum invalid, remainder is %d\n", csum);
+=09=09drm_notice(NULL, "DisplayID checksum invalid, remainder is %d\n", cs=
um);
 =09=09return ERR_PTR(-EINVAL);
 =09}
=20
diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_=
kms_helper_common.c
index 0bf0fc1abf54..7a41373b67dc 100644
--- a/drivers/gpu/drm/drm_kms_helper_common.c
+++ b/drivers/gpu/drm/drm_kms_helper_common.c
@@ -41,7 +41,7 @@ MODULE_LICENSE("GPL and additional rights");
 /* Backward compatibility for drm_kms_helper.edid_firmware */
 static int edid_firmware_set(const char *val, const struct kernel_param *k=
p)
 {
-=09DRM_NOTE("drm_kms_helper.edid_firmware is deprecated, please use drm.ed=
id_firmware instead.\n");
+=09drm_notice(NULL, "drm_kms_helper.edid_firmware is deprecated, please us=
e drm.edid_firmware instead.\n");
=20
 =09return __drm_set_edid_firmware_path(val);
 }
--=20
2.39.2


