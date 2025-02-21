Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B63FA3F30E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 12:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DDF10EA5A;
	Fri, 21 Feb 2025 11:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="VwfgHJTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011033.outbound.protection.outlook.com
 [52.103.68.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB5810EA5A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 11:37:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moCLWwChdTFrj0rKN1C3DPaWUuRz/FEnVtmbuhHYSjTVX2bcV9Gz6rWAqhDe2MN0I7iUQaU/mdqRA+eErx4gPqw0YRE8p1yZgKHpgQnXGWx7d6Eg7BEIf4hOnLQWkcLi50OiynONVmVRTpQRF38r96hi5dxYFFzcwQv1wjVd3XmRKo0P+Xi4E7c+VXG+eM9SWGj+P0B83OzJ3fsXQtXDCBHNvF7QZR6hjjtCbNOliA+amDVU/y0YTu50Va0Go2kuXaaa5qRSfjMuOMt1GE4tdZPIl81by02VzrtWEZdEZFU3cbCXMUozahRwk/4osA/CeWc7H41srl6knOAqga43hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtDHMcw1b6+smQ9zjnsyzlYPYrXKiqgZ1ffHmC1S8AI=;
 b=Rud3LzZjY3KhdhC20wkdwZKG5OY03E9441RlJ+1/RVuIjegkkboqn8Zt7FOD/De2g8mv9nGh1oRqAA1TZ815yyB7VMUFCFtO+v2PaHyp4FVcSmw6S3eEOZ1JPom7aKVGVY2751YzOlZtVXDeKa3ZGkWRlcfCKMmAHl9v6AgmTda9SAkkpNtkvLL4pGooz1DIbgUK3vohMM4N6jhRQZfi5dt5nXV2ZR5iqMxM0WHQU14Ytjxs0fhfUmO/r3gcxl/6DtTpaegjEnOUdAU4OkSRzp8SMLOkQZ9VeCc7ME16WFswuM2aTFSlauMERXVdffdXC4SYF03yAhfgopgdUUP71g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtDHMcw1b6+smQ9zjnsyzlYPYrXKiqgZ1ffHmC1S8AI=;
 b=VwfgHJTmV4OKO6BdTFH5bz6n7cwEdEeprTjJvR94N/BX2/2VzO1yw5wS3LwkZSLN9Q6zmOmoTZkk8Gp+gxuI9ghHBtcB6rD9jJ/ezUm+JjP3FM6vEkSaL8/eEU4WRuxxqdGmArUHqbbotV4T4KJ8L/r4HrjpMXbz9aqQjftTNiprpVWjkFHLUNEsmoVCHK+xbSvsm5wnxJp3tMV66TQ+0fLxh3bT2jRGMqJMrmFhYmSbUOnawDmlMOiAW3q6vuDxOOQvK8Z3bGTXFyT1VWjFMBlpTmngTYXXLsUd31IeFzP6oOO87QrsV8JKwYXGqKXHS0uTYxoXL+zrOZrPE9o2lQ==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by MA0PR01MB10284.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 11:37:13 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 11:37:13 +0000
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
Subject: [PATCH v3 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Topic: [PATCH v3 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Index: AQHbhFTzgQy2ndYjv0+1YtY5sM6hDw==
Date: Fri, 21 Feb 2025 11:37:13 +0000
Message-ID: <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
In-Reply-To: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|MA0PR01MB10284:EE_
x-ms-office365-filtering-correlation-id: aec76da7-c7bb-4c83-b1b3-08dd526c162e
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|19110799003|15080799006|461199028|8060799006|7092599003|440099028|3412199025|41001999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?ohtFrewhkxeCfr1INrJ5HqBUWr/bQwz45N3Hi3dKybqNz8zaOg+bWyGP6Fy7?=
 =?us-ascii?Q?ojO4Q2yJ34F9npUJ/wHvlezCzUcttthL9l4vypin54dLEX3Z05NWbL37taz9?=
 =?us-ascii?Q?ZSlobMncnr/v9cuejZR7jTer7G3WNn9oIhNfXKk8ecIO0cl2RGH2fcMdzGfj?=
 =?us-ascii?Q?HFOKtqIkrtzXR7OKmZIszEZNoY4RL84Lbj08WKTvYAh+dPhRMAkb4v8fEZLE?=
 =?us-ascii?Q?Evx161eeNXnJjuF3SJbLhlIlNokrAB4uLYMyC03fAB+Edp4+CKyGkSz773/J?=
 =?us-ascii?Q?erD2MN5CC1PkjPamDwfAX80po2nrIeYeTCECIM+2QrmZcrJ30btkhCwaT8d4?=
 =?us-ascii?Q?SxYunjJ2Pl9xDo16DcaGya6IgjnhB+p6t5V7KDk3SmuZEU9FOcfaQMLXNBNd?=
 =?us-ascii?Q?2n5zm6YizEXB0nrHJC9kpERv7lILUIYXqdREEOn3z7011hGrBYq7TFC5hLaU?=
 =?us-ascii?Q?htto+IftR3kW2QFROnr9/FymfFMR7Oa5dTphLBBJihBTXc5CcFbWzjEJtc++?=
 =?us-ascii?Q?BccDOjEFZVKCdPd0kijOciVEund+nhrUqhrjN9C00w9GDW4W5dUnYru1MPkO?=
 =?us-ascii?Q?+asT00n90r6m4nHY5EW+2iPcOgOc2kjtirGT8HW4RoxYlAu9806qXUOccuba?=
 =?us-ascii?Q?xunnAsQD3ad3hV3M/lRDn2diaOB48Zxo5flWafRYX8+oBn++6HtF0PAvnRBW?=
 =?us-ascii?Q?Qo1ya/VWDI7i6E5h8TYLRe1eN0+IXI6Q5YB7vAGNyvj1ycs2Zj0QHxPJwsOo?=
 =?us-ascii?Q?zGjaUFO3W/3bfxdWskxY1QRtIGmxznkyWuN9Cg03hyJQuK6kWboyDZ4a+X6c?=
 =?us-ascii?Q?NGZdFTsQMN2l/kOIkYqaPT0AbA9xsOCvkJFK+y+yJtiq5XrJYItKxPkrrjJM?=
 =?us-ascii?Q?kY1wPQ4HjxX9sx2P52wzA0vPfYprWT2EywkICSZjePP3KaWuN7SaMof0PsIF?=
 =?us-ascii?Q?qLubiUU5FbvpW7u4Nu/pbJ285kuqRZi2aPRPKr+UlgltqB/LTGA5IoAsV5Mb?=
 =?us-ascii?Q?G7VhGhMB0PHPtSCEv3RibjwCeXLKEBTTZdLI0mhXbmbyW7dxSJvn5/D8LrXD?=
 =?us-ascii?Q?4UMCbSStAACxtsgGwsAYFoz9e44ppEbpoSkaoVMb2cFB6/loolk=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?euPN1n7u6Ae9lkpNMBVL2GYBz53CDAGcBOoqASLZsw8u7N9Lruum0GvYWXoI?=
 =?us-ascii?Q?vbOcIy1iKTc2Lo6L3772UwpRWRomI+5KrDfbkB50NDBEJ14AEKm911gUNGYk?=
 =?us-ascii?Q?R5QbYNo2f46HNdPbDvUXVn5khCMadmHIVs5MEHkhlcMoP4HmyZv9hjRuBkSn?=
 =?us-ascii?Q?0t16F9lQ24wGK6AjyaWbluRODNDw1c3aoMjwQG46WPLN94wPb7/3Rmd2O5rc?=
 =?us-ascii?Q?0yTt44nE7LXqwd9/cGl788ezhnoYY5+J4hRQFIMWx/XABc4mwIWHFxZcU/EE?=
 =?us-ascii?Q?TkL8hWojmRHW5Oggixedg9UNHsZqdjcg4b7rCYGzRDU9aRaVO9ttePFNRwWm?=
 =?us-ascii?Q?NnMYyjJoLt7v+xuN7G1mvymKSeEt6OK/BqRn+TJcUStdks4kSA486TYih4EB?=
 =?us-ascii?Q?6oBOM3EFZPMSGMBgEAu4Pj7UesDyTQOwRhQR0tkHofEuywNIKmB/WFzteLwN?=
 =?us-ascii?Q?SzqQpgt9D4MSf56Oumc/Raosiqv/jyMJiFnUIYaz8Q39BW/ZAcI4gaJ+bpVp?=
 =?us-ascii?Q?FjG/KlFpRrS5UQ+MeJTdAbQgTQ2KRbemPzAh9LVafD+Do0UoZ4gF26salu50?=
 =?us-ascii?Q?4w58R3ua59ujugR4hvnWL1c0++ZaadCAPBWf4hj74CnJ077YNErHxbrm9jPJ?=
 =?us-ascii?Q?zUU9GSwYK/Fs1ArROzI3M7NR0JJSWxK6fBZoLx+BWForn6Ajh+WLtCZYPFgT?=
 =?us-ascii?Q?7Q9v9IjXRBFWnM6AEv2bcMxVAQ9WBk+E5lUwU+bZvcg/RlpU9YDwVpJ3v+CW?=
 =?us-ascii?Q?2/QPMS+IJq9QMzG88UxGJ/Wh93zVMxLik42yuNfFfHqUu0m25AUVpzzDyuIV?=
 =?us-ascii?Q?XGPP3Lchui1NEhxGE5W7C0BFYGdV8iGkPSxD1obVUZ+esdiM/RrWUWKsEott?=
 =?us-ascii?Q?LGv2vsROrt0NDkrhGRMbXvXi/g6kN0Uq2f0cJgBSaZ57o+mLgm/nnjF+J+bd?=
 =?us-ascii?Q?5R4OFH0Lj8Jy2t0U8lwHGSWcbJ5JdT+QV5hhQNQTqI758YNTPyAaEfOauseL?=
 =?us-ascii?Q?Z7l6w0EwjW9MQIkwi76L5vhYi01NcntykYlA5XnGe3hkJVAyA/I+7fwrwJfC?=
 =?us-ascii?Q?UqrLNuYQ2HtNhtK96iPpqJ+KEViUVW3bsRLG7tTyAhmqvMJDvPCDU+WKpHBy?=
 =?us-ascii?Q?W1FK/EKq8AjNMbFLGCNGxvCcHOLKobk+TYKccV9k0KJKVGAFe8mR+a8N9ckP?=
 =?us-ascii?Q?O6ELQt6nLgS5aTRxq3ye8yfp8+NOc4NdPvt/1QZi6Z+scd7CBU8+wnEI2AYM?=
 =?us-ascii?Q?cRefA9hYnONw3/TYsa/6w9i8MsUVRbuaQy8XHZLSWS1Wq4e0s+M4kRoXhdVi?=
 =?us-ascii?Q?Jt4c2KBs3aMtFwNIA8ttxfzp?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E3F01C943914CD4CBCFCC2C0618E2C2D@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: aec76da7-c7bb-4c83-b1b3-08dd526c162e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 11:37:13.8244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10284
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

From: Hector Martin <marcan@marcan.st>

%p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
it's useful to be able to print generic 4-character codes formatted as
an integer. Extend it to add format specifiers for printing generic
32-bit FOURCCs with various endian semantics:

%p4ch   Host-endian
%p4cl	Little-endian
%p4cb	Big-endian
%p4cr	Reverse-endian

The endianness determines how bytes are interpreted as a u32, and the
FOURCC is then always printed MSByte-first (this is the opposite of
V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
allow printing LSByte-first FOURCCs stored in host endian order
(other than the hex form being in character order, not the integer
value).

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
v2 -> Add this patch
v3 -> Make array static
 Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++
 lib/test_printf.c                         | 39 +++++++++++++++++++----
 lib/vsprintf.c                            | 38 ++++++++++++++++++----
 scripts/checkpatch.pl                     |  2 +-
 4 files changed, 97 insertions(+), 14 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core=
-api/printk-formats.rst
index ecccc0473..9982861fa 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -648,6 +648,38 @@ Examples::
 	%p4cc	Y10  little-endian (0x20303159)
 	%p4cc	NV12 big-endian (0xb231564e)
=20
+Generic FourCC code
+-------------------
+
+::
+	%p4c[hrbl]	gP00 (0x67503030)
+
+Print a generic FourCC code, as both ASCII characters and its numerical
+value as hexadecimal.
+
+The additional ``h``, ``r``, ``b``, and ``l`` specifiers are used to speci=
fy
+host, reversed, big or little endian order data respectively. Host endian
+order means the data is interpreted as a 32-bit integer and the most
+significant byte is printed first; that is, the character code as printed
+matches the byte order stored in memory on big-endian systems, and is reve=
rsed
+on little-endian systems.
+
+Passed by reference.
+
+Examples for a little-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cr	00Pg (0x30305067)
+	%p4cb	00Pg (0x30305067)
+	%p4cl	gP00 (0x67503030)
+
+Examples for a big-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cr	00Pg (0x30305067)
+	%p4cb	gP00 (0x67503030)
+	%p4cl	00Pg (0x30305067)
+
 Rust
 ----
=20
diff --git a/lib/test_printf.c b/lib/test_printf.c
index 59dbe4f9a..4bde40822 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -776,21 +776,46 @@ static void __init fwnode_pointer(void)
 	software_node_unregister_node_group(group);
 }
=20
+struct fourcc_struct {
+	u32 code;
+	const char *str;
+};
+
+static void __init fourcc_pointer_test(const struct fourcc_struct *fc, siz=
e_t n,
+				       const char *fmt)
+{
+	size_t i;
+
+	for (i =3D 0; i < n; i++)
+		test(fc[i].str, fmt, &fc[i].code);
+}
+
 static void __init fourcc_pointer(void)
 {
-	struct {
-		u32 code;
-		char *str;
-	} const try[] =3D {
+	static const struct fourcc_struct try_cc[] =3D {
 		{ 0x3231564e, "NV12 little-endian (0x3231564e)", },
 		{ 0xb231564e, "NV12 big-endian (0xb231564e)", },
 		{ 0x10111213, ".... little-endian (0x10111213)", },
 		{ 0x20303159, "Y10  little-endian (0x20303159)", },
 	};
-	unsigned int i;
+	static const struct fourcc_struct try_ch =3D {
+		0x41424344, "ABCD (0x41424344)",
+	};
+	struct const struct fourcc_struct try_cr =3D {
+		0x41424344, "DCBA (0x44434241)",
+	};
+	static const struct fourcc_struct try_cl =3D {
+		le32_to_cpu(0x41424344), "ABCD (0x41424344)",
+	};
+	struct const struct fourcc_struct try_cb =3D {
+		be32_to_cpu(0x41424344), "ABCD (0x41424344)",
+	};
=20
-	for (i =3D 0; i < ARRAY_SIZE(try); i++)
-		test(try[i].str, "%p4cc", &try[i].code);
+	fourcc_pointer_test(try_cc, ARRAY_SIZE(try_cc), "%p4cc");
+	fourcc_pointer_test(&try_ch, 1, "%p4ch");
+	fourcc_pointer_test(&try_cr, 1, "%p4cr");
+	fourcc_pointer_test(&try_cl, 1, "%p4cl");
+	fourcc_pointer_test(&try_cb, 1, "%p4cb");
 }
=20
 static void __init
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 56fe96319..13733a4da 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1781,27 +1781,53 @@ char *fourcc_string(char *buf, char *end, const u32=
 *fourcc,
 	char output[sizeof("0123 little-endian (0x01234567)")];
 	char *p =3D output;
 	unsigned int i;
+	bool pixel_fmt =3D false;
 	u32 orig, val;
=20
-	if (fmt[1] !=3D 'c' || fmt[2] !=3D 'c')
+	if (fmt[1] !=3D 'c')
 		return error_string(buf, end, "(%p4?)", spec);
=20
 	if (check_pointer(&buf, end, fourcc, spec))
 		return buf;
=20
 	orig =3D get_unaligned(fourcc);
-	val =3D orig & ~BIT(31);
+	switch (fmt[2]) {
+	case 'h':
+		val =3D orig;
+		break;
+	case 'r':
+		orig =3D swab32(orig);
+		val =3D orig;
+		break;
+	case 'l':
+		orig =3D le32_to_cpu(orig);
+		val =3D orig;
+		break;
+	case 'b':
+		orig =3D be32_to_cpu(orig);
+		val =3D orig;
+		break;
+	case 'c':
+		/* Pixel formats are printed LSB-first */
+		val =3D swab32(orig & ~BIT(31));
+		pixel_fmt =3D true;
+		break;
+	default:
+		return error_string(buf, end, "(%p4?)", spec);
+	}
=20
 	for (i =3D 0; i < sizeof(u32); i++) {
-		unsigned char c =3D val >> (i * 8);
+		unsigned char c =3D val >> ((3 - i) * 8);
=20
 		/* Print non-control ASCII characters as-is, dot otherwise */
 		*p++ =3D isascii(c) && isprint(c) ? c : '.';
 	}
=20
-	*p++ =3D ' ';
-	strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
-	p +=3D strlen(p);
+	if (pixel_fmt) {
+		*p++ =3D ' ';
+		strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
+		p +=3D strlen(p);
+	}
=20
 	*p++ =3D ' ';
 	*p++ =3D '(';
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7b28ad331..21516f753 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6904,7 +6904,7 @@ sub process {
 					    ($extension eq "f" &&
 					     defined $qualifier && $qualifier !~ /^w/) ||
 					    ($extension eq "4" &&
-					     defined $qualifier && $qualifier !~ /^cc/)) {
+					     defined $qualifier && $qualifier !~ /^c[chlbr]/)) {
 						$bad_specifier =3D $specifier;
 						last;
 					}
--=20
2.43.0

