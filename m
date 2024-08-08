Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E07294BCD4
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 14:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9FD10E6ED;
	Thu,  8 Aug 2024 12:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="EqwIwU4k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2093.outbound.protection.outlook.com [40.92.103.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12A110E6ED
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 12:02:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ernNd6vggmXQwz2g4wn/RRZUFLHp02F4zYH6wJydBn3Fq8LSRapWbj38ZyP0VRIdKmLITxue2IFDxRQ0o/1MP/N0jd39ygj62i+zDgJaRKTGy7aWgD/Ymf64DtZF2LTaMK0QkfmyUQDZBxMEh0fv4vQQiVA/CmQCbz94wq6bNti3se4A/uCH4vY2AJSDVgrxX98Vz6ekT13fDKnl20QoTkj8z2H4WM3D9kA8OmoX3gpqT9prwYWGiENs5Uy4lyOxjU21PKcoD4ahj5AEODCwucFMOVcGl70KC8hbQccD36K/IqGRgiYu2G4E0PTEwX3smsHxHcSJliFHCv1TQZzcjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtdQ3/r+0UdrKlCuSHzXkJk1YWEEi4Wt1GXubHNHEfc=;
 b=S4JkW/EBahzf9sv7AL1UDyGPigWZrBVtrxo0nihqpA5bnbkQ4Gu4SkfpLIbF79zlnUB5WtOKSdDrWS15zUt8/TkRYkTtNMOE8BztCP8RqqAZQEjNXfJPmTTQ8KafeyWLt6qZv/fb9rdL4IYgoUM6ftm7UFH7LYQWKX5ybGpxIYccRiHcEczl9zKwxkSVlm0XuWIugtIcXY4MluFmv9uq+Tqw+PL5YxYQPPs1giC4fA3a7tfBtJZLl8GvAGqrX+D/j3r2GSTjtf209LLHdku++llkt3CtFJK75HsD9RL2ce2tJQO192EVhYu9Yd3h0mZ5y12D902fgAOIDTBjA0zbRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtdQ3/r+0UdrKlCuSHzXkJk1YWEEi4Wt1GXubHNHEfc=;
 b=EqwIwU4kpYHf4R9SFBuLZHr/lQB5/D9KRczREttggng+Rk0YCrvsxyjJDurnXuL2VxqATVm6zw6hTnPvPP3hr2jwlfux+K7RSR1e4mJbXZfNKO7QpLLa5Zswe1I9LbPdtzgf1vvf1qmELPCpzIXcc+ZZyb0rM2Ml5rB2t3hrK3Zy4dXnQhsERzygXwXn+E8Cyu/FMG72F6N0S/7oVg1i6Ee3VarLloJXboKqBPcV/yHhNNwCiVOiAk94Fjk1MJIWykX7nFF2xaF9EPtNu+eNkw/wFxA3JXrAvBtiUyWkOwFoBTc+mrXpF57qpFHvSOWkHmYhjNp8QqTIzP2zIJvEBg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB0925.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:130::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 12:02:01 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:02:01 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, Orlando Chamberlain <orlandoch.dev@gmail.com>
Subject: [PATCH v2 8/9] drm/format-helper: Add conversion from XRGB8888 to
 BGR888
Thread-Topic: [PATCH v2 8/9] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Thread-Index: AQHa6YrH8N1UU3Lexk6hcx8Bbn3Wrw==
Date: Thu, 8 Aug 2024 12:02:01 +0000
Message-ID: <DD1D2855-D3C2-4EED-B236-0D5FA9D325A9@live.com>
References: <021EE0BF-93CA-4A37-863F-851078A0EFB7@live.com>
In-Reply-To: <021EE0BF-93CA-4A37-863F-851078A0EFB7@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [yaUpJp84u9Mq7rbg31lHnt8PPFVn5KhKmzFy9jSQ0WDj+nlaSQQgedLopwAktsuYlbCOll+Z+1A=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB0925:EE_
x-ms-office365-filtering-correlation-id: f55fd3ee-e5ae-4e8e-849b-08dcb7a1e9bc
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|15080799003|461199028|8060799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: oH6A9hMlA3k8U7b3kwPJzIYw4c/Z/nT8/Fc0WKIPAhWBpFSxCG2aqf+C5jL0htkp4L2l4o+xXXqk1F3baj8pH+BaI6A50LKO2EGCgy4giFU6om7udI4M4Csgs8XbyeP+9uIKDhVLNobpVTuNja+30rJFcOL/opBf22cQKfC7VOCpHnQGBJGCR1BFm4sjxkwVm+W0js/w1VnqaMxBBwSnSrSPt39U4ZMAgKlDs3V0y/OMLWrhexRzWEetspUGI/sMz0FUoJ42M7NMyEr7G2Z+x2QxAxLul7WYEi95WjRD1vGejT7B5e7RrTg9kbI6962IiCRNemvCAnbO2dWcqs5lYgxzm9b6gvtaCpXpklk1Jdd07TfgT44MyOrsytBuI+Q2a4jpi39sNyvDNF6ONI9P4QXEb58Ajw2Q6C3iZoj11xTy9wtrgLo7vuf505T46vdvwDCIjUAWzJvQf/tFriMXDQ1IzWGNj8/FuNht6JCVmEgf+CyWpzZENpCRHHlfmqNZOb9bzYerchP6WB7dsDQfk41BoeugT8ypT8xJLGsVUb22XGhVLMRXhbQmzhIrcCcigB/lSEqcRclMKSucMO4S4CqqH7s7x0oV7BJGtFdsp/RXkP0/NqsXUCnEvyLP6/LtoPpDq1S3VhsbIyw2lANJTq1cQLfgEPrw0T4sWQuj+uw=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uYFfSadW5TXLiV1C7uQ00jp1xRdQy/V7MFGZuYQbuiwqNFTI0YHX6h+CGVRu?=
 =?us-ascii?Q?+0VrcvZzG6TsIabH32cyuBpbhUqg9C3N20YEkA+XpRRjw0BOgDyiiD3GYbUo?=
 =?us-ascii?Q?bGu/7/N66NhRa08UIRloXFxaJI+fqqWUEZIYKplPGNhel5/TAWPQogtPXE6c?=
 =?us-ascii?Q?FE2cxfNPPDe5ygi2ym4ioUQgZ7hCx4+YQJLDKqiMMOtOuPjnUiiOS9KSu04d?=
 =?us-ascii?Q?lKs5BSA80y2cge0iLpC96f7bTp6u4VmN2tlq3Yde2ZAmex1IZ28PeD2dAIVr?=
 =?us-ascii?Q?yyuI8Uf7IZ3eaytY1sBygzE/3T7GdP2Mr65nQAo9UTg642+5naCzSLZ4ZSOf?=
 =?us-ascii?Q?5hEoaJDaGVvYXPwPVckizTUMTZdu8VbZIvjbf92LnOjZBfsBVRTJrgTx5I6v?=
 =?us-ascii?Q?yovEwwCwLuYaoLO331azR2bHJQI96HnKU+8Iplvf3WfDt5vUxv4+fBnZ925e?=
 =?us-ascii?Q?liZAZYo5dqKyiLcH7L6ZySKtCH71UOdltGqo6eGoV10PAY50FUg7cq0fc1zZ?=
 =?us-ascii?Q?azsWEGI1k+UhoIh0Hotpls81BFy/JUxhyWmC0sKYU+GzLjmnYIazVxtWxTu/?=
 =?us-ascii?Q?PkQkhuLNhCFvrzSBPPUWxvZ2uarwxz/RQyv/4TURdxz0ywlnskK1TgngH762?=
 =?us-ascii?Q?fDlUcsxJ1Xt8E/LkLtwGyJlhohy0ghC/a7dmHl2HV47OqxDkr8g02fr4cq+g?=
 =?us-ascii?Q?/B24dES7+wxTejgfHYgdNNPmge2x0YuizeMMm9+Z6vUWmzj8FRkD3zFnBw06?=
 =?us-ascii?Q?qQ1gi66reioU5KNEZdYhZwrCRhxpyF4HWrHfnbas20Ig8vWog1D4vQ9p/nAv?=
 =?us-ascii?Q?7aUM7C8R4spdm3/EZMYNX6inIhx3QqaS3OcHr+ihWRgtQyAcjUOMR/zAmsu+?=
 =?us-ascii?Q?eBchZbIx8cZFduk+etApCc7As2iGNven6dI8z7llAf+iEI0S6jSxYcTkV2fl?=
 =?us-ascii?Q?Pe9qnbtk+sykaKmrQ0R3NY0xAZOsTpw5m21HbKv76ENksN14qI8YSzE9tNmk?=
 =?us-ascii?Q?rJH8tknnSYxXTugyOviNHlTrlSBZgVGsfmx4vqq1nEMYQWI4lOm2jLOJmaDO?=
 =?us-ascii?Q?n6GdgAHs7V7/D5doxIUcedbhB+yGdXcaOoOUf45oQA/PjOCf4LsbhshB7U0Q?=
 =?us-ascii?Q?buTSXVoitVXriysYj+29qf+QKxP+cnzbBIaGsgZKFhCTRGf4yA3ElBjNBAWd?=
 =?us-ascii?Q?N3WTDy6DMnb42uDs1PV1xUN50K0m242pPyMG8gDD0UKvLeQCwxRpxz3IA8hA?=
 =?us-ascii?Q?IK4yp9FALfyfznf5TNkZoOKKMJJ+D/OSSa6KPa4+t5xnh8gm8irwnOwaxTvt?=
 =?us-ascii?Q?ep4GphC/w/oxqZs17zpSXswI?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5B62F816C57B6244A12FD4DBA73D2C1B@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f55fd3ee-e5ae-4e8e-849b-08dcb7a1e9bc
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:02:01.8710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0925
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
---
 drivers/gpu/drm/drm_format_helper.c           | 54 +++++++++++++
 .../gpu/drm/tests/drm_format_helper_test.c    | 81 +++++++++++++++++++
 include/drm/drm_format_helper.h               |  3 +
 3 files changed, 138 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_form=
at_helper.c
index b1be458ed..28c0e76a1 100644
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
+		*dbuf8++ =3D (pix & 0x00FF0000) >> 16;
+		*dbuf8++ =3D (pix & 0x0000FF00) >> 8;
+		*dbuf8++ =3D (pix & 0x000000FF) >> 0;
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
2.39.3 (Apple Git-146)

