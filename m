Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA98A3E0F6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B07410E9AF;
	Thu, 20 Feb 2025 16:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="pBUvr5dp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011025.outbound.protection.outlook.com
 [52.103.67.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869BC10E9AF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 16:38:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPY1Rr3r8LG4zwHlqgPrMVFrPmfLY7TJXu1syIUne3nw5AG6WaDM/UKP6+c4U6A0Wwgb37AdpeW8X0YKT/RKWjHXcBcx9X048kP3pl4gpIIsVeUrnb3Gf7jSlucmMO/vEAS8aWjx+K3/xwy+vVMvYdTlPsi72SFHB8MSNGAn+5d7cbRg90pOHJ0MZL/h0jOfRR+aOcX0TbcOnEDa27oFkAAimGAF8lW65vvWDbVCR0bqN0Tn16Y4J3rnfI4JGUpTasDObKV2nnzjF7w6C0UDGL6encTKvViDZSj2qyg5L5gMybzF/6dyz6D0AO5XW7Payx4HNbWEKOxZXKB3D5HFNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2H84kTbGDVa2t9f0UBKqJJGDr6M2YaGd+SZIm37dm9s=;
 b=dEwnItRvmWuS7evJ+o64zVQruGRJkKGnnKD3fWy8QO+XFC1cZdZSfzAsZtkRmv5ClseIHmaEc0EiBP9FdE4AeurHi0rZbTHK2xx1vTKsbc1uIAqRgz3Y33DpF7sNZwwQja8YRkVeUazayj+EIKlgvYY/olztYgbCbACHGcOo4Jqx24+7l/39oqVwL0mFXUuzFmElnMGp/QDgLqOnkhFyisXPOJdqsrx5WR7u4NYe5pZ2Y3bcPzjc9/yR3xoPByCqLP4yeXXOn6a2IRX5xLsAZmWVkza/15POLvLYgfD/tc5sV6C2jSnbIGmtnLV4VtPiA0cXnGOJNwO1mkJbEMEZlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2H84kTbGDVa2t9f0UBKqJJGDr6M2YaGd+SZIm37dm9s=;
 b=pBUvr5dpd1/UIraz9O7RywQHfT9nbZGPcHit8TOKzSYyLkd0aeWHnE3+iyMnJ8R/xEC8GM7+eKSyAWWqg3lOg1CGT3jPFaHc4/aNBqWFUG/k453j1f+KG7+GBw4IUyOCpZnSY//M6+GsARC4ihWRZAOG3X3Xq2mBRxMg1Ncz6dFpVLL1lvB86Kn9ufajCRQ/bP96wdi41iH0KIIALv7wNsDyuS+Wgq8KeXGm/Jsj+vUB8zZHduEGY8Mxc6R9JOtDIQzbrEmGcR4R4wz5UP4qP6PxPaCmnMJkruJaGXZgXcPsaNckX+W6cQb5BrlpuQUWUpVGf6j9c2qp9GEsBjQSiQ==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN3PR01MB5548.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Thu, 20 Feb
 2025 16:38:21 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 16:38:21 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "linux@rasmusvillemoes.dk"
 <linux@rasmusvillemoes.dk>, "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>, "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>
CC: "kekrby@gmail.com" <kekrby@gmail.com>, "admin@kodeit.net"
 <admin@kodeit.net>, Orlando Chamberlain <orlandoch.dev@gmail.com>,
 "evepolonium@gmail.com" <evepolonium@gmail.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "asahi@lists.linux.dev"
 <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>, Janne Grunau
 <j@jannau.net>
Subject: [PATCH v2 1/3] drm/format-helper: Add conversion from XRGB8888 to
 BGR888
Thread-Topic: [PATCH v2 1/3] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Thread-Index: AQHbg7XakrrwvZJOCUaL/6wffrXcsQ==
Date: Thu, 20 Feb 2025 16:38:21 +0000
Message-ID: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN3PR01MB5548:EE_
x-ms-office365-filtering-correlation-id: 284b4fd1-7cc0-4fa8-b242-08dd51ccfd0d
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|19110799003|15080799006|461199028|7092599003|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?BUArsdgqt7Z6sAwXCNf+7KFqBifnJFID2SnsR1e8gVwFGpz5SSomljUMxsTf?=
 =?us-ascii?Q?rHgSulYse3zxmWHCUE4qwOA8X2FkGyKegFVigqEdMZ2nCXgERylnX5+SZZn6?=
 =?us-ascii?Q?MaAMcpdpvAr6uBGCwpPw5eXm1md00LLYX6iKiBqxfenOdokcF8c+yWqwkpWT?=
 =?us-ascii?Q?VGMSLMM4ZNGj5SlkSkIoPyz7zaxo7iZewzaeZSCfJRYmRrRLRySYXQdsp808?=
 =?us-ascii?Q?94R6R0gVHrFhuMVesYARQGUQMQaXsSYtF64ejKqgtpY8hZBx0exM2wHc2YY0?=
 =?us-ascii?Q?cAJ4JYZK9lXj7wVQVgmu0JlhMA9Qxr5Xv8k8anIPtzouFR9ITyyr4iMPbSF7?=
 =?us-ascii?Q?7eiryK0RSpyGNRn5FG0iHNy/xH0E1BE+ZyDdGttnn3qzAt8X27q+xWNW9uGH?=
 =?us-ascii?Q?xNttHtYsOFM2hpxDo5MN1wjtg/VPGcx6ziHbYwbeYdYrq98YAtePSQAGCpLt?=
 =?us-ascii?Q?qz8Ode2M6xNe5ML8LZiAXmrUqfCmJs+Y5b/iB3csxGS++Ct7uR80qFkyjoSn?=
 =?us-ascii?Q?uca2RtQ5wJO0evw/hztLhAezWBkQwbmaehMkITQdoWjiCl5eRpDYaObWoX5O?=
 =?us-ascii?Q?nKnzF5etrO1xsHb57mLY57580uT7VdLWawn/KYk9EMECQ8KdV5YnHL3ZMpdT?=
 =?us-ascii?Q?6cw0HuOuwZtSmdZJgTzswKZ5l9kzPsnIeT0uTdwxVqgOCVx342AfXxaoNBDZ?=
 =?us-ascii?Q?slzyxvczFVZBx9hj702swWVlmdQvOJrxUvGmSFKXDxEa1ec2i/GlNWqYowDF?=
 =?us-ascii?Q?OKMeZVK4X8KFLlqxlz8yHEoj/UqDjmLCFvLIvMW5PaOqiRPWOco5NfG/5OkL?=
 =?us-ascii?Q?Og5cw/UTENpQlMvvLTSE0lFlbOzFF7zE7x+oO4DIMfq4WuhoX5RfVsM5uweP?=
 =?us-ascii?Q?nj1vdAqZyCfeLnAP3WoZEraaQBsgye63yf8hoJdEBaLk3HN0N/+ZlhUnN+oS?=
 =?us-ascii?Q?mOoV0ZOk/0zsPqCqR/orZ2xu31hw7x8uhp0/fsTHnaRWF9d0ilgbWRP4GWMX?=
 =?us-ascii?Q?rDY4f3gsEELMnbWtTc1M4+BsFG9n2FYCrCl9n14r2HhGP1rq/ymSVBCv3w2G?=
 =?us-ascii?Q?0y+R39fmlsC5JaRIQmxprsnJ971bNgsX9/g2b5cLr+b4RZkJHJk=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Pkr9SIgdfOTAFV4JBQSngdIn568GAVEeug3z/lkyRuNVJd/JHEELKEWtAwZv?=
 =?us-ascii?Q?inRUkHf2TaSmB1qYqd86JGbOtE9Lgiyv76Tmn0sEv1DsCaFLalDUbrTvjAhI?=
 =?us-ascii?Q?DmbIM3CQtEIKHkkHutCELLSyZ/0v5DUvOY6hODW0GN95wOyulfw9iOzjScLZ?=
 =?us-ascii?Q?uxiCc8TNAkHidOqNl1YTb52LOoDpzP6HLmiP5ExFoYB5yNKXbCCEpbXwAdPK?=
 =?us-ascii?Q?4P6ddSGhEg9YV79fNKDhSDf36YB7vQmAdj0hPggUGCgOT4/MvGfiBrdi+OS6?=
 =?us-ascii?Q?dQMLxXYuAlJ1D7m36ekXjfU2vyXRNWnLxtM+LbRJ7S4glz+CvBuhbjyqcqSW?=
 =?us-ascii?Q?WQwEUYDEdLGosEpAI0liJqVF4Ju5Q2dD8kTPMyYXoOrAjdQacrLCE+yQ1V8K?=
 =?us-ascii?Q?5UMK2yYYw9BZCHJP2ozSmL6MjcdVtlfcRTuzj0XBF3YWVh6y9QUWcU17ErC3?=
 =?us-ascii?Q?xIe/+pDduAikNAS3qL+NOvgZH6vbY73884kKiIXOuL9pOu8u6ei0DiNnEda1?=
 =?us-ascii?Q?wc4OgeKeB/LQelFNQbERhuarI0SejCpLusZrZw2NxBDulN9jQcAcd7zjsL9K?=
 =?us-ascii?Q?6aulHmosTIB1JuUCny6AATTBcosFmQMe5MOqP93Mg8KAHo9cy4yoPfeXpgO/?=
 =?us-ascii?Q?Swpb8usWDjubcvSoCParSi+jLt8uqCYWOfMBij/KHP6A8sGUR9T6F8hsuv/3?=
 =?us-ascii?Q?EiKmhiqtUAZ0dwbmzJ89/Uz/QuCnwypSNZMCs9RIlmqrkdtMPj7yYKLlqJs3?=
 =?us-ascii?Q?qIo7qwjS8vJE0elNfNQWOCvZZOEa90p0hknIXWq96nEYXlWon68qyU01Vtaw?=
 =?us-ascii?Q?XfDQ8mJDEWwZdu0MpWgDdKcbsbZHKSBQfpvW4dNUA/KwCFKrqM9u9GiJr7Xs?=
 =?us-ascii?Q?T75B94bfmRBV1NtuLr086AGFAu0rTDY0qBwum4QzXbc9jGNwFMxiuryXv9cC?=
 =?us-ascii?Q?5lt+eo8Et5Z8As/uJaStCUq8zbtOpv2c58X1m+O+YR0Vxhs3M5mPVgLqA23K?=
 =?us-ascii?Q?Rs+WVVUzaGy3KaNKT7CmLHvDLwr++ThJEW/qioWIL3zqTrcV+bIFjaD/OUpz?=
 =?us-ascii?Q?xYenb/gO908lO2r6V3TxsAzmqQ36SuQ33/5S8jNLfQctuiG4LQ+KCIUqkiWO?=
 =?us-ascii?Q?HIW1kTJz+icGFItdc/KcsnpHCYKn+ustNHjsh5wRCt1kOkwfRsrQ4PK+XVuW?=
 =?us-ascii?Q?Mg9gaodaQycMmZ+rzHoPbcrhyOx8QIdYNtmpzfeFxp7NfrWfPV+Ol//lUc29?=
 =?us-ascii?Q?0TkyzbPXgwyRVWi6BjPohOk56Tc037wG+BYAlc82piped81WHvgQ98JbHzE2?=
 =?us-ascii?Q?LqrKKhujbBI8N5visC98CfHR?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6AD9CEB2A5510A4A8A8BB56F650324AF@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 284b4fd1-7cc0-4fa8-b242-08dd51ccfd0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 16:38:21.6674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB5548
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

