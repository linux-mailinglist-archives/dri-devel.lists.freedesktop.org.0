Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F08BA3F307
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 12:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16F610E2CD;
	Fri, 21 Feb 2025 11:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="iniof2yw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011027.outbound.protection.outlook.com
 [52.103.68.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB7610E2CD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 11:36:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTIgXMyiDgXGdpYRp35Clu2zVlZw8nkWWyCp3XgB1YrwiP+niHYwun3+Szmck+fpC1yvNFsHvayqVuyf9NOLSZWUuRB9uL964+zwj1cHnf/zKGE2Y0jN55OkdKDJ0r3NpgfElyLyN8sHwuln8lOzLIvbnpe6vuw/OUJ0h7WR7NfYXv+CcE7CymXC4+RhWSKz2OY5ye9xVOftTRSidq+ISVqsmlxMB4GrpqPDGtf8b0eTuOcarZJwteMGa7gHrNKtUQGgk0bG5ad4YPiusd6D1YBbq9lH/bgebchKpGxJ/1pVLrabQyYUAZ9G7sJP3+5bTz7vKHc5wfqVUhIFWfBqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7YHFu7v/bv/9AABEWj2muQuuwY6ueCX79QT2sAl/Xs=;
 b=jg42j/u848D4/V5Wd/UhQBScYfOwFo3Oj8OoM1+MkgrJjIk/r+idEdLsGVCyU5viCAwachKsC99gU0UPlB+zrIJ9aQd5EW9F2KiJQeb/ZF/MkqjFLqf8I8b/ynyF/qupIZHMR6REsMmfbV3B7a5CIvaXWFrp7vFq0jKgcuODZEJ7IvrNMk55RAHDGSerXt1RtwXHxtqfF6u+eVXBVuCeC4r//lx+L6uY8BxsDyfcITK2x+eW7ASUdIbNZx2puLmTN3vHmxn8BiDbo/S/RRLVvclT+6iWXQkSsXfdkR+BpzPrQgXaDC3NTTwcWgQOqo65wdEWxO2aibzBogXYnvJVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7YHFu7v/bv/9AABEWj2muQuuwY6ueCX79QT2sAl/Xs=;
 b=iniof2ywYa8QLtE7iVwDPXpW1ga2LEa6II7vZGv2nShytm918w+GHYNJFKoMMhPVo9KrXyt2tICF9z2j2M4ye30MGP0MwMI8m5CGWrahf9JEVYM+aIazA8FEnbM0S7t5Mx4OvuuYsre88sQ0pObG6CKo+kKkFC2MI2K1YH6u5ewKFgekXDSrocJRRQ7s11aLm8nBGdt6WKmP/9yOqEofO5zWb7vMxXGFDqdjAMZ7DB8DlFofmHY4yRFTYaIoDim8WwlvJfw/byNwcoApcaoMBnizUxuuLrM3v5EriO6TJXWrfsdZeuETjhd+1AxGE8W+k7vRz9uFLwgxeeroqjZDpg==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN3PR01MB6457.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:84::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 11:36:01 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 11:36:00 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "pmladek@suse.com" <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "linux@rasmusvillemoes.dk"
 <linux@rasmusvillemoes.dk>, "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>, "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>
CC: Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>, Atharva Tiwari
 <evepolonium@gmail.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, Asahi Linux Mailing List
 <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>, Janne Grunau
 <j@jannau.net>
Subject: [PATCH v3 1/3] drm/format-helper: Add conversion from XRGB8888 to
 BGR888
Thread-Topic: [PATCH v3 1/3] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Thread-Index: AQHbhFTIgiDbbKYiw0mijjb2mLA7Rg==
Date: Fri, 21 Feb 2025 11:36:00 +0000
Message-ID: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN3PR01MB6457:EE_
x-ms-office365-filtering-correlation-id: d2b787ef-e183-4c7c-8b2d-08dd526beaa6
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|19110799003|7092599003|15080799006|461199028|440099028|3412199025|41001999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?C2SvoPCpfeXgBU9RZLIGmd4Znp07FkaAU0jQNAub2UK/HwTxbnQ5J5eFhwWM?=
 =?us-ascii?Q?GSMuy4tyBwESmz4/1MQ/TpPZkMtY5uFuhR0KmoGHajBhcJIj4t8w8dILK0tT?=
 =?us-ascii?Q?kA3QBx6hhbOmdPyjyvLSg4YrraUg3x4ilJHJpBFdG284yneAp5SeCTu/W93i?=
 =?us-ascii?Q?hOiNtUjfc4UEMcLj4SeNxn4y9d6gH1iJ7qS6yRzJUu1WJt8Qt3QAF35FbQ2+?=
 =?us-ascii?Q?c+Z69OA5SmEPcIkeBtdPDU9+T7NoImtjNAHbMKz/3+nsPauXUmNQBaXz5t6P?=
 =?us-ascii?Q?bsmav2cVN/oflVT/URqn8rWZK6A/s+P4KnTr8Kkl2N1exXvYrnKJEJ9EzJOW?=
 =?us-ascii?Q?CghcYVs7BFkbF+ntTQwUYVwxLtasF7GOdyWcnz3LZ/c3PzcFSmU+S5TfO/G3?=
 =?us-ascii?Q?+9DO3sQAxFmkDGNRkPjiepWhxtfArLXIK800tF2Zx+gKYPn0v3TF+kNKMLRD?=
 =?us-ascii?Q?8hHQRrIX0g+125/y/ITasgu7EgUfXlWJZL2gBSVomRnXjDFioSNNp1ePMy7P?=
 =?us-ascii?Q?/eSTNzT4GORBhBxNB6Bvicc5c/SzVBvQUdCgKe72t1D4KPpXqFTHuNp4gF3+?=
 =?us-ascii?Q?eL5TNWxZitCpTZR2m5TGFx1J+vi/5bLPX1iDmRJ8O22Ed2AKu1sD67gK9r/4?=
 =?us-ascii?Q?seJ27lE5IeuEo7K/FMWVzNvrQ1KaJUHocd6CRQ4ljUbaUmT2a2fAa0pGwK/n?=
 =?us-ascii?Q?GCw6agQlMtVg2jqUskG9YQTe1QQYjbwin+O6dlf2bvyjEHBWYnIZBC+LoA6M?=
 =?us-ascii?Q?ndZnRSqYWA47P5Za3D6cZqAPe4DVqRaUV3ACvusK8TuCjtcFrCDydZ/tRBSF?=
 =?us-ascii?Q?y3OKL25b6YU5dpaB8a9tS+NPQkvAh2XI2wG/ytOP8FyQy4agTGd/YLzoSM/X?=
 =?us-ascii?Q?noyM124A0Y+1zraTuEZLdbCWRTNlKY2b21oIF5ZAEzBo53b94vbuh0YZvRxm?=
 =?us-ascii?Q?dhsHR1K6C8ecDbU6UJhQPoClheudPbtuwJVRigj9xh8nEKmj6hm9pYNY4lCg?=
 =?us-ascii?Q?U4uplFVmO+tlTMxiT8S4/tZi4KuK0bycBoiMSj17aMTJtiPAq2/KBpOjZPSU?=
 =?us-ascii?Q?5mPAKwCnvS13BQb13WXMaCcI+Ot2o99UdrnFGwEKTZ398bbIg+Q=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NcIoGNLdaqtcHbT6+vOh/R5FntoFhkXj9JmE21TlcxsiRacBdwilbKxCmqxv?=
 =?us-ascii?Q?i1UgXOOgob0UQqCGY0MJSP0yVnaJZv7QaLLAmWFS7hxTixsF7nBK0cdzYgxs?=
 =?us-ascii?Q?/ZxD8KTXjK/6RuPPP5cNPGJP5YjBaqoqU4sMqK4vuANPk3H8IkCw3gXr4jWO?=
 =?us-ascii?Q?mVZpbHQa4W3+hBWTJrtXrrCnu7ImWBtc0V+woQgbOgsW8qBAIHyIBhJhKzJI?=
 =?us-ascii?Q?PhQyusQc8bhkDClFfo7bJVvyrhj8SUoNEfiDPklQRi6k+5AcyMdFHJcrW/VS?=
 =?us-ascii?Q?pIEqiJY2mJ9MtKcAwSq+rxxU0EgDLfyqLIw43Pk0Rh5irgppqTGlnNpPonK1?=
 =?us-ascii?Q?wdBF9QwFBn+lwiGBSUjynDoO/0sfm3TBUVThurEhqinGtNIcwsw7jhx2KUNn?=
 =?us-ascii?Q?5VyRkDqC5jFzHBi/pkGN1fkT3zK82xdnIiiEZghhBx/qOjEiR2tVJo3/YIBo?=
 =?us-ascii?Q?1scj+ESCAQM5aTpKofCGGTxMQg0YpSB04tRDav88H3MFpH1gtBCreQgP843o?=
 =?us-ascii?Q?QgXFH4vAJTLPvCw1JOhidHHu4VQcIx2/YFH9UomU+c4Yw8yZb4Lo0zoNf+Mz?=
 =?us-ascii?Q?vL2Vs/8ANp9KhmfV3k9leofgsmEHMi4PyuWmEMW9z/IjB5Zbn9S0ZGFZGA9Z?=
 =?us-ascii?Q?cRilSO9svIvFZ+DN3b6BZFSBbH+yKMAI++s1MaP36B4Od5kHK/HxRTXIOv6K?=
 =?us-ascii?Q?rkDMSCVSiLYn4R7v3mGiHuVG/B0S5veYywEgnOQ86gM3pGvean9MaurTyhCt?=
 =?us-ascii?Q?WFvBGPn3r9cmmOOVTrZul3yn7yfv5mmelTKy7YwcUaLuQDSBTMbZQHYiLYRr?=
 =?us-ascii?Q?G9Quz15osBtGRolk9jOKDjU1cMbXO5Xo0weZ+FhREl4ZUR6tB25j5Xdq4KeC?=
 =?us-ascii?Q?dG39tz387YkZoD2HJdSqwCFVemrlmIfxKJ8LXVfz0lSgOAZBgwFU4xNq8Yq2?=
 =?us-ascii?Q?YFFBsv5oaPFGD3zqqcwKCYZ1reBQID4O/jR3uZiqDgoXHw3PThP+V3qdfSkL?=
 =?us-ascii?Q?mrH52j5po0Q+EPX4Ar6gxQf7cjzjKMSFZvdPM+OG0DCOX3TwlD0CyYnPZKZI?=
 =?us-ascii?Q?M0OlWA7t9kx+jBLT6FLeJxt4OvrUCjKVT8r09bYCYU2q8mmRl/akwM0E8WBH?=
 =?us-ascii?Q?jwYvFwb4lVscSZC/C1QqqJUAGtVE7GqbMdmhZIrMohOMt6ZuKiw4Se47gsI0?=
 =?us-ascii?Q?Fw1cBWmI2FgG1qX7PhqVE4rngpf0bUGFWM2HJd0nfHrlozSbYwjjvAe+a+iE?=
 =?us-ascii?Q?v8p9YWPPhmakdDg1Tt4l6AkupYu5iZvq/qFwPWHMZqt0VSfDj6D6T16ntdG8?=
 =?us-ascii?Q?WX6EjgES2jQMUmblqWcbndN2?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <43988FB88197EF40A9C46BAB804BE7F1@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b787ef-e183-4c7c-8b2d-08dd526beaa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 11:36:00.7880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6457
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

From: Kerem Karabay <kekrby@gmail.com>

Add XRGB8888 emulation helper for devices that only support BGR888.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
v2 -> Fix incorrect description
v3 -> No change in this patch
 drivers/gpu/drm/drm_format_helper.c           | 54 +++++++++++++
 .../gpu/drm/tests/drm_format_helper_test.c    | 81 +++++++++++++++++++
 include/drm/drm_format_helper.h               |  3 +
 3 files changed, 138 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_form=
at_helper.c
index b1be458ed..4f60c8d8f 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -702,6 +702,57 @@ void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, =
const unsigned int *dst_pi
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
=20
+static void drm_fb_xrgb8888_to_bgr888_line(void *dbuf, const void *sbuf, u=
nsigned int pixels)
+{
+	u8 *dbuf8 =3D dbuf;
+	const __le32 *sbuf32 =3D sbuf;
+	unsigned int x;
+	u32 pix;
+
+	for (x =3D 0; x < pixels; x++) {
+		pix =3D le32_to_cpu(sbuf32[x]);
+		/* write red-green-blue to output in little endianness */
+		*dbuf8++ =3D (pix & 0x00ff0000) >> 16;
+		*dbuf8++ =3D (pix & 0x0000ff00) >> 8;
+		*dbuf8++ =3D (pix & 0x000000ff) >> 0;
+	}
+}
+
+/**
+ * drm_fb_xrgb8888_to_bgr888 - Convert XRGB8888 to BGR888 clip buffer
+ * @dst: Array of BGR888 destination buffers
+ * @dst_pitch: Array of numbers of bytes between the start of two consecut=
ive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to ea=
ch other.
+ * @src: Array of XRGB8888 source buffers
+ * @fb: DRM framebuffer
+ * @clip: Clip rectangle area to copy
+ * @state: Transform and conversion state
+ *
+ * This function copies parts of a framebuffer to display memory and conve=
rts the
+ * color format during the process. Destination and framebuffer formats mu=
st match. The
+ * parameters @dst, @dst_pitch and @src refer to arrays. Each array must h=
ave at
+ * least as many entries as there are planes in @fb's format. Each entry s=
tores the
+ * value for the format's respective color plane at the same index.
+ *
+ * This function does not apply clipping on @dst (i.e. the destination is =
at the
+ * top-left corner).
+ *
+ * Drivers can use this function for BGR888 devices that don't natively
+ * support XRGB8888.
+ */
+void drm_fb_xrgb8888_to_bgr888(struct iosys_map *dst, const unsigned int *=
dst_pitch,
+			       const struct iosys_map *src, const struct drm_framebuffer *fb,
+			       const struct drm_rect *clip, struct drm_format_conv_state *state=
)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] =3D {
+		3,
+	};
+
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+		    drm_fb_xrgb8888_to_bgr888_line);
+}
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_bgr888);
+
 static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf,=
 unsigned int pixels)
 {
 	__le32 *dbuf32 =3D dbuf;
@@ -1035,6 +1086,9 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned=
 int *dst_pitch, uint32_t d
 		} else if (dst_format =3D=3D DRM_FORMAT_RGB888) {
 			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip, state);
 			return 0;
+		} else if (dst_format =3D=3D DRM_FORMAT_BGR888) {
+			drm_fb_xrgb8888_to_bgr888(dst, dst_pitch, src, fb, clip, state);
+			return 0;
 		} else if (dst_format =3D=3D DRM_FORMAT_ARGB8888) {
 			drm_fb_xrgb8888_to_argb8888(dst, dst_pitch, src, fb, clip, state);
 			return 0;
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/d=
rm/tests/drm_format_helper_test.c
index 08992636e..35cd3405d 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -60,6 +60,11 @@ struct convert_to_rgb888_result {
 	const u8 expected[TEST_BUF_SIZE];
 };
=20
+struct convert_to_bgr888_result {
+	unsigned int dst_pitch;
+	const u8 expected[TEST_BUF_SIZE];
+};
+
 struct convert_to_argb8888_result {
 	unsigned int dst_pitch;
 	const u32 expected[TEST_BUF_SIZE];
@@ -107,6 +112,7 @@ struct convert_xrgb8888_case {
 	struct convert_to_argb1555_result argb1555_result;
 	struct convert_to_rgba5551_result rgba5551_result;
 	struct convert_to_rgb888_result rgb888_result;
+	struct convert_to_bgr888_result bgr888_result;
 	struct convert_to_argb8888_result argb8888_result;
 	struct convert_to_xrgb2101010_result xrgb2101010_result;
 	struct convert_to_argb2101010_result argb2101010_result;
@@ -151,6 +157,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
 			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
 			.expected =3D { 0x00, 0x00, 0xFF },
 		},
+		.bgr888_result =3D {
+			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
+			.expected =3D { 0xFF, 0x00, 0x00 },
+		},
 		.argb8888_result =3D {
 			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
 			.expected =3D { 0xFFFF0000 },
@@ -217,6 +227,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
 			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
 			.expected =3D { 0x00, 0x00, 0xFF },
 		},
+		.bgr888_result =3D {
+			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
+			.expected =3D { 0xFF, 0x00, 0x00 },
+		},
 		.argb8888_result =3D {
 			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
 			.expected =3D { 0xFFFF0000 },
@@ -330,6 +344,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
 				0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
 			},
 		},
+		.bgr888_result =3D {
+			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
+			.expected =3D {
+				0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00,
+				0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00,
+				0x00, 0x00, 0xFF, 0xFF, 0x00, 0xFF,
+				0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF,
+			},
+		},
 		.argb8888_result =3D {
 			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
 			.expected =3D {
@@ -468,6 +491,17 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
 				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			},
 		},
+		.bgr888_result =3D {
+			.dst_pitch =3D 15,
+			.expected =3D {
+				0x0E, 0x44, 0x9C, 0x11, 0x4D, 0x05, 0xA8, 0xF3, 0x03,
+				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				0x6C, 0xF0, 0x73, 0x0E, 0x44, 0x9C, 0x11, 0x4D, 0x05,
+				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				0xA8, 0x03, 0x03, 0x6C, 0xF0, 0x73, 0x0E, 0x44, 0x9C,
+				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			},
+		},
 		.argb8888_result =3D {
 			.dst_pitch =3D 20,
 			.expected =3D {
@@ -914,6 +948,52 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kuni=
t *test)
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
=20
+static void drm_test_fb_xrgb8888_to_bgr888(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params =3D test->param_value;
+	const struct convert_to_bgr888_result *result =3D &params->bgr888_result;
+	size_t dst_size;
+	u8 *buf =3D NULL;
+	__le32 *xrgb8888 =3D NULL;
+	struct iosys_map dst, src;
+
+	struct drm_framebuffer fb =3D {
+		.format =3D drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches =3D { params->pitch, 0, 0 },
+	};
+
+	dst_size =3D conversion_buf_size(DRM_FORMAT_BGR888, result->dst_pitch,
+				       &params->clip, 0);
+	KUNIT_ASSERT_GT(test, dst_size, 0);
+
+	buf =3D kunit_kzalloc(test, dst_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+	iosys_map_set_vaddr(&dst, buf);
+
+	xrgb8888 =3D cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+	iosys_map_set_vaddr(&src, xrgb8888);
+
+	/*
+	 * BGR888 expected results are already in little-endian
+	 * order, so there's no need to convert the test output.
+	 */
+	drm_fb_xrgb8888_to_bgr888(&dst, &result->dst_pitch, &src, &fb, &params->c=
lip,
+				  &fmtcnv_state);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf =3D dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, dst_size);
+
+	int blit_result =3D 0;
+
+	blit_result =3D drm_fb_blit(&dst, &result->dst_pitch, DRM_FORMAT_BGR888, =
&src, &fb, &params->clip,
+				  &fmtcnv_state);
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+}
+
 static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
 {
 	const struct convert_xrgb8888_case *params =3D test->param_value;
@@ -1851,6 +1931,7 @@ static struct kunit_case drm_format_helper_test_cases=
[] =3D {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb1555, convert_xrgb8888_gen_p=
arams),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgba5551, convert_xrgb8888_gen_p=
arams),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888, convert_xrgb8888_gen_par=
ams),
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_bgr888, convert_xrgb8888_gen_par=
ams),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb8888, convert_xrgb8888_gen_p=
arams),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8888_ge=
n_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8888_ge=
n_params),
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helpe=
r.h
index 428d81afe..aa1604d92 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -96,6 +96,9 @@ void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, c=
onst unsigned int *dst_
 void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *=
dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip, struct drm_format_conv_state *state=
);
+void drm_fb_xrgb8888_to_bgr888(struct iosys_map *dst, const unsigned int *=
dst_pitch,
+			       const struct iosys_map *src, const struct drm_framebuffer *fb,
+			       const struct drm_rect *clip, struct drm_format_conv_state *state=
);
 void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int=
 *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
 				 const struct drm_rect *clip, struct drm_format_conv_state *state);
--=20
2.43.0

