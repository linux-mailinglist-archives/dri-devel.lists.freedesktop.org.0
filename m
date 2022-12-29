Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8665865A4FD
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 15:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639F510E136;
	Sat, 31 Dec 2022 14:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (mail-sy4aus01olkn2140.outbound.protection.outlook.com [40.92.62.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104AC10E1F7;
 Thu, 29 Dec 2022 13:17:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtHXxbgjEDfjUrYg6rKZkM71Z07k+F8ftf9nifGa5/EBSEZYPYloLn1/Wu1LnqJRsc3AsLIw0VnzhEcAFihEzCPotE4zMdUZ7VtMQ9wOO7PflzRJEGwXUuDlzaM04X9Yc6Yl16HoJWI1uoJQ6u9uTyHSFHFC1KoaiUe10F+iTpxPyAOSTrjsmRqGSxRXQS7uoEynIOuezE9Xt+EZW2y+VxHOfAS2EfO/Zub+Myj9CQJRLQp4t9bUZIBB8VgIC2eYxfa47/7SI3dvAwG7bMzG0V5zFacV+HMsLm/9mrXEexHUFIjfjB6a7omQ85jAuB0GInbbvliuJgIAdCVCXx9T7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvF/Vo3Y5xYm4eFKAn45sD0QcwmRdFyDM91cf0tk0hk=;
 b=V+d8dnVGfBeSyJGeB5GQaFd1XcPWBm5/o7h/1k5M8pi5tEczNXBkrXvuyYOtoI6m2qqnbsg4nCNJ9tDlaE4QpIGvcz6KcbKez7IVlQ89vtxWHrO6HHcUNR28FRhkFKXNkapxEIU/KZaIOrmGsiX/j2cxQaDtbjPEXKgEqnZ3h/3Nu4Bm9iySjxmaahw4WASGYxXHpmtJJnkyt6HBRiNYwmWpnBrxodBCRsM5W31/cRrmrZTaC362exujPGAs/yTAO0gQFhL41jqIicAWk37Ty154oBaqjPSpYtBkP8E3cQE9o3n41st+v29TbBFG/ECIdsBkXscTtk2eiBqWAVWTdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvF/Vo3Y5xYm4eFKAn45sD0QcwmRdFyDM91cf0tk0hk=;
 b=rhitbfnkqG/V2/26OnRiG5IQgZdvSQEb7/xyR+TG3uqEFYyvRg0AGNTsFeGh6fcu2KZ4rNoHAmqUmEzORPnMUfpQnocjk+v6tnJnUNufWHcYA6HgYkXbkYtj8RXc6xv7Hl+on+dbeOjnjpKDgU509vOZaD9WBeii4cnA1AtFhBBzARgRDCfk5wuLFJHtSs4mBMUxoqt05YwceBfFKuE1GmYP+vhMj07rteSBAJHs3ziZBlPDKnHxlPhR5NH1zvSlJiqKFUDfiZnY+YfQ5cEKblYR2KbBYQI3Djt20aCsLOyhqUzjDazJ4odvPJenQBWKWx8Qqj+3DJbhX4z1o8lTeQ==
Received: from SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:169::6) by
 SY4P282MB2869.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:15c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.17; Thu, 29 Dec 2022 13:17:43 +0000
Received: from SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM
 ([fe80::3021:4e2f:269f:86a2]) by SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM
 ([fe80::3021:4e2f:269f:86a2%6]) with mapi id 15.20.5944.016; Thu, 29 Dec 2022
 13:17:42 +0000
From: qi zhou <atmgnd@outlook.com>
To: "matthew.auld@intel.com" <matthew.auld@intel.com>, open list
 <linux-kernel@vger.kernel.org>, "zhi.a.wang@intel.com"
 <zhi.a.wang@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "rodrigo.vivi@intel.com"
 <rodrigo.vivi@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] fix gvtg cursor position if it is negative
Thread-Topic: [PATCH] fix gvtg cursor position if it is negative
Thread-Index: AQHZG4eUlO6VebNR50mtjCIRm5fqpw==
Date: Thu, 29 Dec 2022 13:17:42 +0000
Message-ID: <SYZP282MB3252074E5A0A1C467337132AC9F39@SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [5xJU6W118WwbNM8E5fh8u8XHZuVsIdVC]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYZP282MB3252:EE_|SY4P282MB2869:EE_
x-ms-office365-filtering-correlation-id: d61abdd3-5ee1-48c0-df62-08dae99f1187
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u9QBmfx3w5UG1ZgCnuqloR/esemKrnf0bYRqIwZiP0IA4rY5cWCo2COKRLj7CKkXAMe9HkcQDOhb3x5Dhq4UkF2gM5jhPHlHr2x8QFU/AB/eLnBEF3wANRzcmpXmcHQ0NtqaGcEimy+USPwP/Vz9yNwc834jcDiz4fZiNoNiIZRrzVsdTU/jD8chbsWhg2E4lQ0cgO4ktNxBJKcGKT0tVx2kcjRp27EqSSQ1D/yoigjM9PdRWoWQBqUqa7AwESsOO1sxsVCVXMUYMlELIhMhcMqhQ/cXAM94fwfYinW64EzFcz2uL0Njxde9SSdfQ3qVnFihiAo3RiLX13QHlwyH9Y/raqpihaLbVs+LxMYfmzqRuFSPmuaB7tvcYC+3OQs8prQdNZ2vk/Wxzz4KWEeMT5hh5nGg9W+/SugMfo6FCCfBBvlyVj13M27EWrOLMiBxyaLoZtr0l4xQZV9AHTchCr1OUOg7gQurhQOSn6Ql8jRGcVC5WN9qJMC9VrjWmDjjvOTTrrceJOFHvUuos9BJV9fEnTOZjdVx1qzBlFhlSFdzdjXDBvGBrxyl5vZNOPeob3iWetp6AmGEM1bHPHJNpDopN6Ab9sJtSb906XiCj+4=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?15aswYJvJ+WCOIBJJVIr1nZyHBJu9iL4ZAsdOh32ADCGkD9CYJ6tf9rEFi?=
 =?iso-8859-1?Q?5bmuZ/dNzEHMuPgVBgCXvTtmCT8gc4oq+clgifuPAuFEPxSjnpxjiBehlp?=
 =?iso-8859-1?Q?y03v3Ushgur0909o7oxAmmo1zvnfo3WwPKFNbOXJVOk5gNyWUtwFp/vGDi?=
 =?iso-8859-1?Q?OW3zb3b3g3WZ5ySfVW8E9F1ZdDdHd8yr/gGpWePXOUu//R6z/P9BELM8Yd?=
 =?iso-8859-1?Q?JQS1h6PKT+jaygBrfcQ7HTj6WJosb5vMNdb/ssyu7e2zK9LmCxxGow6eOt?=
 =?iso-8859-1?Q?ZynzOU0xGB2T59qRMrYnPYwczrPEUBNiKhuK4G3Z4OGM4+0WCV/5nx5MT4?=
 =?iso-8859-1?Q?OA0IHVCopAJoLE5+2fqzlt4s9kmXxMH5E4RsMppiHlFOkuvedemTL1Er+M?=
 =?iso-8859-1?Q?qbggv4d++SoOtU6+npjqq5ce2BtkAFVcD84klrUV/tgBSMxysafn5Xn4tG?=
 =?iso-8859-1?Q?7H6wzVIp7e08Kg7XH8BFU5P7w1/NZJeGwqzr64D1IJP/fAQ6maMK6E0FOZ?=
 =?iso-8859-1?Q?0ML2YufW3e8v5b4ij1VVn7EznelW7whGsE617vDWWjkHc8dorA0Joea6JR?=
 =?iso-8859-1?Q?87O2qolASGJEvzRgesxFoWEyWc7o19wF+H+b6Yv504mCkKcTVAepWRvjeR?=
 =?iso-8859-1?Q?VBT/tL6D8nbHDczcInXHJw7GlO51jJL5S3H4TzKBlaNwxCreD9VLJuRgpX?=
 =?iso-8859-1?Q?3eGxH1vjYt6jBcymUoblq/mDXrKYgc6Zp94UB0w6f+67SJO3tfa8JHHAuw?=
 =?iso-8859-1?Q?ojQ+kRh3SojCquhZvM0wv4/EQpoL2chmvY/Bq/i2haocChYeuKi5//HWRO?=
 =?iso-8859-1?Q?LU9R1wIH4bKV2pEvBPE8nV9siW28BoEyzjQ/UiyfQ4ec//IubemoL/obW/?=
 =?iso-8859-1?Q?/lt2kcdX40fB5rE05QQ1PIiTy5okZZGC4eQdahkMWOL0tv23sr8hAbg1Nx?=
 =?iso-8859-1?Q?k5t2ux/ngozAc6tkMSFQqyxeOjDGGb1a/HtCeAk9Uj246TMIQCerzt4Z1E?=
 =?iso-8859-1?Q?CgYU9OnZx9ZWWQjSlCFVs220AFjrUxhgSfETDAknlzL7RkAxlXrA5qI9ps?=
 =?iso-8859-1?Q?0mVcTq0SOyBL8T22ieqH0oOdvk7aJ0bB3r+WqGEjeHJBnKH0yXHiwS9g+O?=
 =?iso-8859-1?Q?wDvJvhHwA/zAYban/v84yVilfbGwbkiMFoflHaLCMUwZAT5KkFADfaKo0Y?=
 =?iso-8859-1?Q?WLmc5fKGQeJ3twa1Ub2G79dbPJkkTREO4ljeeq5lr5Gv45ygIasCqsi7gm?=
 =?iso-8859-1?Q?cRx2jzKSxuRXv8AL0mVLL5M6WaqLkk94GsMWpPM2W+kjeBntNw4iPepCPL?=
 =?iso-8859-1?Q?RNJ7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d61abdd3-5ee1-48c0-df62-08dae99f1187
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 13:17:42.8911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4P282MB2869
X-Mailman-Approved-At: Sat, 31 Dec 2022 14:30:00 +0000
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

From 8d2a0c2c265119cb481deab825ea59c9605f3bd8 Mon Sep 17 00:00:00 2001=0A=
From: Qi Zhou <atmgnd@outlook.com>=0A=
Date: Thu, 29 Dec 2022 20:15:51 +0800=0A=
Subject: [PATCH] fix gvtg cursor position if it is negative=0A=
=0A=
It is valid if position of cursor is negative(not hotspot coordinates). for=
=0A=
example: precision section, resize, move, north east arrow...=0A=
=0A=
Signed-off-by: Qi Zhou <atmgnd@outlook.com>=0A=
---=0A=
 drivers/gpu/drm/i915/gvt/dmabuf.c | 5 ++---=0A=
 drivers/gpu/drm/i915/gvt/dmabuf.h | 4 ++--=0A=
 include/uapi/linux/vfio.h         | 4 ++--=0A=
 3 files changed, 6 insertions(+), 7 deletions(-)=0A=
=0A=
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/d=
mabuf.c=0A=
index 355f1c0e8664..b91122b33222 100644=0A=
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c=0A=
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c=0A=
@@ -299,9 +299,8 @@ static int vgpu_get_plane_info(struct drm_device *dev,=
=0A=
 		info->stride =3D c.width * (c.bpp / 8);=0A=
 		info->drm_format =3D c.drm_format;=0A=
 		info->drm_format_mod =3D 0;=0A=
-		info->x_pos =3D c.x_pos;=0A=
-		info->y_pos =3D c.y_pos;=0A=
-=0A=
+		info->x_pos =3D c.x_sign ? -c.x_pos : c.x_pos;=0A=
+		info->y_pos =3D c.y_sign ? -c.y_pos : c.y_pos;=0A=
 		if (validate_hotspot(&c)) {=0A=
 			info->x_hot =3D c.x_hot;=0A=
 			info->y_hot =3D c.y_hot;=0A=
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.h b/drivers/gpu/drm/i915/gvt/d=
mabuf.h=0A=
index 3dcdb6570eda..4103106d7cc2 100644=0A=
--- a/drivers/gpu/drm/i915/gvt/dmabuf.h=0A=
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.h=0A=
@@ -41,8 +41,8 @@ struct intel_vgpu_fb_info {=0A=
 	__u32 height;	/* height of plane */=0A=
 	__u32 stride;	/* stride of plane */=0A=
 	__u32 size;	/* size of plane in bytes, align on page */=0A=
-	__u32 x_pos;	/* horizontal position of cursor plane */=0A=
-	__u32 y_pos;	/* vertical position of cursor plane */=0A=
+	__s32 x_pos;	/* horizontal position of cursor plane */=0A=
+	__s32 y_pos;	/* vertical position of cursor plane */=0A=
 	__u32 x_hot;    /* horizontal position of cursor hotspot */=0A=
 	__u32 y_hot;    /* vertical position of cursor hotspot */=0A=
 	struct intel_vgpu_dmabuf_obj *obj;=0A=
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h=0A=
index 23105eb036fa..a9b93251ac7f 100644=0A=
--- a/include/uapi/linux/vfio.h=0A=
+++ b/include/uapi/linux/vfio.h=0A=
@@ -720,8 +720,8 @@ struct vfio_device_gfx_plane_info {=0A=
 	__u32 height;	/* height of plane */=0A=
 	__u32 stride;	/* stride of plane */=0A=
 	__u32 size;	/* size of plane in bytes, align on page*/=0A=
-	__u32 x_pos;	/* horizontal position of cursor plane */=0A=
-	__u32 y_pos;	/* vertical position of cursor plane*/=0A=
+	__s32 x_pos;	/* horizontal position of cursor plane */=0A=
+	__s32 y_pos;	/* vertical position of cursor plane*/=0A=
 	__u32 x_hot;    /* horizontal position of cursor hotspot */=0A=
 	__u32 y_hot;    /* vertical position of cursor hotspot */=0A=
 	union {=0A=
-- =0A=
2.25.1=0A=
