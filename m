Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA3972585A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165E610E494;
	Wed,  7 Jun 2023 08:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACC910E330
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 11:00:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686048331; cv=none; d=zohomail.in; s=zohoarc; 
 b=UvubI0ufLdq+aLsLCgpiNRcI1SL6UnVyfZOBemO56MTqS32QSUlYqzaYu8rHCJKG1kwxwL8ztdDGZCGm1TCZCHs4GUc+dB6gHA2JlOmydJr/JrDiddIASc6OHfOz/k5H82v2TMK3V6OYkfjKe8Lot1tMWW/h0UtNK4e+vQFlYR8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686048331;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=oaRDWrHa9OwMd9tMZjDMhVHgfoU1wFJjeKV6s1bIgBA=; 
 b=PmAuNgAbivHQippfZ9q5173Rdgd0sWgjx1d846eSogThkjpdyeNggxxMlUVLwf6UG/yDf5WRQvYBamacZq/rcWs5E7HTVMitwM0SzE2vC2R5il1imitl/Jk1hsTNgPjYK80CdjxHPq1OE9bDtR203USQMaiVQqcnt8e2uRIbLZk=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686048331; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=oaRDWrHa9OwMd9tMZjDMhVHgfoU1wFJjeKV6s1bIgBA=;
 b=at6SXXhsguFokWjd741ICj90PKaQZw8HVk17W6QRId8iJA6YMT1qkphbM1up+8uz
 Kwo0CtXRTsfRkXFLshM+Iv0aCFzUGxOWDN1L0f42/fzy72u/wIA4NBiT9XHdGKj5tSU
 IgggfwwwkOv9pSJ8oVcCOKTGoUf5dUJRuiRIBvx8=
Received: from kampyooter.. (122.176.141.156 [122.176.141.156]) by mx.zoho.in
 with SMTPS id 1686048330047115.23647061214422;
 Tue, 6 Jun 2023 16:15:30 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <91d957dd92b41dda42da912397df195e3565866a.1686047727.git.code@siddh.me>
Subject: [PATCH v9 4/8] drm: Remove usage of deprecated DRM_NOTE
Date: Tue,  6 Jun 2023 16:15:18 +0530
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1686047727.git.code@siddh.me>
References: <cover.1686047727.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:25 +0000
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


