Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E306DA5F232
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 12:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497CE10E848;
	Thu, 13 Mar 2025 11:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="CoEmhtgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010011.outbound.protection.outlook.com
 [52.103.68.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F00B10E848
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 11:19:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCMrrIM3fSV/7ZyMC3bP4Yd382j1uLTDgMY9tU38kjpNw9N4zCG8lqpOHo+Ptqpw3eDclmvYOJCBcGRHWylrObaVAWQ1jC4Lar5wy17RzqYHOCMPkkbR8NMIxKlK57uAMJZH8CbYROD5BtPRXPnyfUxLYD3sJV4RbKmEeNCCrf7orHymMmj9U6+5AsH5omBVGczIarHwMs4ey9+ds5y21ZImhlPFyJ5Q2xLohR7U7qDqyjMyNT3aPJVyGMtNwaitQkFhV2Ddol2ie4XHamo/LPNMCkcFAN4650G6yuQZEEuyT3qmJIoYhBtccdmAvOiFoxKKNDgNVckI2MgLYANr1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzJM5vyMl3s56WJMhq6BZAyalpNM5Q0ZF/PIrKBcI9g=;
 b=ueN5dnbaIC6AaEjyItPLP7oEIkxsdqk1MhAlP2GTM1mW8p3hL8I8etS2fGWZUIxIETapHFCU7wD3SJ1PWsC5IZuDwI2Wrx3Xb1GIBwGhENxUQrCAJeCoNAj/BNSpUCVByOluUMGQDOIQotqOEmIsdtVl4qSyNtCf/i6+GfORGrGcU2iOp3KLrNK/pp2iM5pVmZQkyKlY0G82j7EJFdXxfdm9AA4CCFwXfM4EgSpLyP/lnsBO/BzTKRqdBQdGcNVYmI1l28Brp96ZXQgBXklkGdAaYMx5oPX3cheUOrvSS0ImkmLRvCoYFikQk2d1puHdylE2ufGUlG9SONjcfXtrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzJM5vyMl3s56WJMhq6BZAyalpNM5Q0ZF/PIrKBcI9g=;
 b=CoEmhtgV/99hO117FlahxRRFn3t0Mecr9amCYmBIHA3uCprcOyFN8k3tdVlFApTX8CdcFGh4VBnCGfYYuJ+0UF8xKN515TpSu0IndNkhRptVS9Omalp3BpqkzBET4RRN8qe1gyoa6sUYK5oN2hgWldcbUgz4qlMG5kPnN/qC7goPO0wsEP4uMYJ1E0M8d63WvBFmPBicFWqWXblwvICHwBOtBVbFmgj414skQR6Thto3QW2u/fQLD20DvCWQPkiZWRKElWzhijUzdVQUgYaD0BaUmALZhsLeaqg3Se4aY7HhpPN1llxE7tslXwiFumUMlqjZvc06Ycxkj7Rpobo03A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA1PPFE52A1FAE5.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a04::331)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Thu, 13 Mar
 2025 11:19:33 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.025; Thu, 13 Mar 2025
 11:19:33 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Petr Mladek <pmladek@suse.com>, "keescook@chromium.org"
 <keescook@chromium.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>, "joe@perches.com" <joe@perches.com>, 
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Hector Martin
 <marcan@marcan.st>, Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: [PATCH v2 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Topic: [PATCH v2 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Index: AQHblAnLqD345R2rs0audT7tx610NQ==
Date: Thu, 13 Mar 2025 11:19:33 +0000
Message-ID: <79FA3F41-FD7A-41D9-852B-D32606AF5EB4@live.com>
References: <F61E0F31-980B-4855-9AA8-D594BEEFEC6F@live.com>
In-Reply-To: <F61E0F31-980B-4855-9AA8-D594BEEFEC6F@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA1PPFE52A1FAE5:EE_
x-ms-office365-filtering-correlation-id: cc35713d-f2ee-4127-eb85-08dd6220ee3e
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|19110799003|8062599003|8060799006|15080799006|7092599003|440099028|3412199025|41001999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?CiYjPsJTeqfvDsJJrle9AhJTBovu2ldZFkFWWu9Spa+a+R3i02B/3Wbe1UL7?=
 =?us-ascii?Q?iMjoczQXbwWFKXCRAcgCmmM22REiID1IIbIhq4JFSz6whInSWnpGzYlrkqoo?=
 =?us-ascii?Q?aZJc+rqa9MHPGmwLjFDNdk7l3cPkyDG1XyRYqhhCD0XLoHn3oWkOANZLoAox?=
 =?us-ascii?Q?7V9FWfoF3Pi3iIzNFJ8a6t9nxPuOCXPbmrKxJZy1iz2gEVNsJSNbyaulmO3R?=
 =?us-ascii?Q?bNHN+KV9MZ3/IWddvLRUyRr8dsmOOcK1j4MsVzHzUId80CredmdHWHYGP6ab?=
 =?us-ascii?Q?kimWfPhwt5792JJGYJF6yL81jRH5FcRzAwjQxb4tkl4mwmv28B98GdKyJiWr?=
 =?us-ascii?Q?XthKntkQYs6BMYDImMF5l3+cOFeyr/8ATfnpN99R12pBVCjegN0Yr+0I2rBe?=
 =?us-ascii?Q?ZZyr+P67eKo3vbOBLza5gqTff7Qegyo8uEtgLCGAN3xcg2qwIaPINocuv4lT?=
 =?us-ascii?Q?fByPiAbaU1f/TZ8MkkdEJ1MGB9JWfzJXUK3fjU15lq7focWSwdtoZ4cU2/Aw?=
 =?us-ascii?Q?KiUzQnEawrhrEYaO3e3NZH5olU9ZLBn+Ygn8pJMuEx401SW1Mq0F+r5I4c8P?=
 =?us-ascii?Q?GmJbOr7K6lgGSwq+vPxP7GdRtjxpCGspVW9ghQC7AQYm1nyz1/e2VvmA1gXi?=
 =?us-ascii?Q?DWk0/9SfuECvn7Cn8MWCHQ+3tWc+o//9aEuWLWBKfJs9E06GzgaPvkToC+dK?=
 =?us-ascii?Q?P//Mm1nGz/cTTnOpBDw5f852YINPvw8oX3/oR4l1GZDppABstszoepTkU1pY?=
 =?us-ascii?Q?yw2P/TUP+hnllCl9llLu30rXTwftsv2syykqqZFmN2Qo0oYdZENuYiYcIbUL?=
 =?us-ascii?Q?Co372nxOyhr59UGAgpWpK69EKBOTVQK876U+E3aOpweCnXjObJ6luRGir0s7?=
 =?us-ascii?Q?fp2ypPWnlE0zWLQ5JhUH+R0SznU6cV39hy2DvyRVx/H139ygPDSBn1eYLFy2?=
 =?us-ascii?Q?wBBFBxN215pBTHrMZa7yaaf8SwaUEHeZ5rsLjE92WnxKWc+kmKiFH0M0elWj?=
 =?us-ascii?Q?uv12MKLw4PLo/QunxM/zxtSY36quTWkrgA0uBV9oF4V1+zhWLpMccE1f6Au+?=
 =?us-ascii?Q?Uq56c99BLw36enjVzykX7oQ1sC7ItnSvWSKrmTwkdLZvKbEGcQY=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eqTG1vlJx7OFjhs290fO2l8GCDvG3MOr6hzP0QJ3KRXJbd7UxjVCXz/5//HA?=
 =?us-ascii?Q?sweCqUG0YarX47Q8qmrCvVMrySXOTzBX4p+tnhIAXyFvdPFxvyDnbBuYYXhY?=
 =?us-ascii?Q?FSubbtOLX7RgCsAbyQD2K9lm2cM8+pV8tvrzKsrL8Vw82gwmTqvzQ1pZJjIX?=
 =?us-ascii?Q?OIsp7ts6BLSgudEdnsvJ49zT3GceN+ov9lzEeuZKWHAa8L1YAxo6MoMsxXWc?=
 =?us-ascii?Q?jFiqU65F02d+yWZidugjaprnZcS4TqTf4wEQkOH1D8nD9SZ64utWGPquW61O?=
 =?us-ascii?Q?+M0NJs/m24GVF3PKJuEIenK1/6eDCDCt3DdOiYz2+U5jZsqz9iI4ZMvLq3G2?=
 =?us-ascii?Q?p7tdsDcldJCfvahHnNELiJyHah7vnGmMFITESmRqRNS+bACRyQ+/YbxPuUXs?=
 =?us-ascii?Q?PSxMaausWaOEZuIs9xW6Xr7yIHM9aY3Q6S00A2VxGKvfdOJppYadnaZRWWW/?=
 =?us-ascii?Q?IxZjuCWlu4DbJUdka/DwX5HZir3lE+StS2K9qdJcfgksD1yVCf26/O1FJWY3?=
 =?us-ascii?Q?TXAjKkrdxKGKH9y511iuId7O4KtVDf3CiFz8DoZqHNa+28Br6zNdWj2rZje1?=
 =?us-ascii?Q?IlIdpkQduQzkBhabYczBWHY6V8k7JbXXxkjozrLA8EmeenQZ7hVQHBDFXgJ3?=
 =?us-ascii?Q?7HlkRBuq+yl3CokPGSQAgj49AJyeyXQ/HY3Ioskb7wcebYFqFCG9R3hNK79k?=
 =?us-ascii?Q?CgNTOmt6z4taq3Es7f40IbcI56UlT4Ulk10JkHexNP80tXPZQruXF7aV1SNU?=
 =?us-ascii?Q?kfXOqhZG3ANeAlj3bLVuK9cdpe+4zno+YDu963dwuu6xsENGlAe3DSpukt5i?=
 =?us-ascii?Q?BGhRcn5+IVLdbt7N9CiU5Rh3yQC9Pj/5pGD3n71VeFpNolKNn2FSCbSpo4oP?=
 =?us-ascii?Q?a2YZ+qkVWZcpBIiWLDVxHebcHvfqXIP5cVvY9JKnpSiLhOm8xVfv7a/GCzRM?=
 =?us-ascii?Q?hHUn0YLBt82EUuVH4pHyfrYhr9V1zhv8cjmQ4IIhzTpc1XUmVkDRgrYM3pp7?=
 =?us-ascii?Q?LEEjF6bVvkTVix9B4OHq5ifW3zDrb8Y/WBOZc0UnceNHbRlZuDwm9ikvtXVI?=
 =?us-ascii?Q?Ir4XbgaACgEmN0nST5c9rR6Yx+G4HufGFeOqXVjwbYUZzmvscLxGRd4KYxIK?=
 =?us-ascii?Q?OMB7/BRsWFDx0RbX1vl8wtZwhFNlMhpZPr6wBVpPvjlX3X22F9uiljsvahuW?=
 =?us-ascii?Q?X9xqSOoiQRr+1VKue7/mu68cTWYz7rO4peGzP8i7bf1fuse5m5dXK1NXkaDk?=
 =?us-ascii?Q?1J7VBnsYgF9Qf3H0FLwgPoV6bXBoKRBDEnNNp9HNoIpOY0htMdVjU70T9+5U?=
 =?us-ascii?Q?FqaKafPelC1IAW6knsuE8CQ3?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <38ED7DEC3CF38D45B6B5CB0C6589AAEE@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cc35713d-f2ee-4127-eb85-08dd6220ee3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 11:19:33.1855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PPFE52A1FAE5
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

%p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
it's useful to be able to print generic 4-character codes formatted as
an integer. Extend it to add format specifiers for printing generic
32-bit FourCCs with various endian semantics:

%p4ch	Host byte order
%p4cn	Network byte order
%p4cl	Little-endian
%p4cb	Big-endian

The endianness determines how bytes are interpreted as a u32, and the
FourCC is then always printed MSByte-first (this is the opposite of
V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
allow printing LSByte-first FourCCs stored in host endian order
(other than the hex form being in character order, not the integer
value).

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++++
 lib/vsprintf.c                            | 35 +++++++++++++++++++----
 scripts/checkpatch.pl                     |  2 +-
 3 files changed, 62 insertions(+), 7 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core=
-api/printk-formats.rst
index ecccc0473..bd420e8aa 100644
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
+	%p4c[hnlb]	gP00 (0x67503030)
+
+Print a generic FourCC code, as both ASCII characters and its numerical
+value as hexadecimal.
+
+The generic FourCC code is always printed in the big-endian format,
+the most significant byte first. This is the opposite of V4L/DRM FourCCs.
+
+The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
+endianness is used to load the stored bytes. The data might be interpreted
+using the host byte order, network byte order, little-endian, or big-endia=
n.
+
+Passed by reference.
+
+Examples for a little-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cn	00Pg (0x30305067)
+	%p4cl	gP00 (0x67503030)
+	%p4cb	00Pg (0x30305067)
+
+Examples for a big-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cn	00Pg (0x30305067)
+	%p4cl	00Pg (0x30305067)
+	%p4cb	gP00 (0x67503030)
+
 Rust
 ----
=20
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 56fe96319..56511a994 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1781,27 +1781,50 @@ char *fourcc_string(char *buf, char *end, const u32=
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
+		break;
+	case 'n':
+		orig =3D swab32(orig);
+		break;
+	case 'l':
+		orig =3D (__force u32)cpu_to_le32(orig);
+		break;
+	case 'b':
+		orig =3D (__force u32)cpu_to_be32(orig);
+		break;
+	case 'c':
+		/* Pixel formats are printed LSB-first */
+		pixel_fmt =3D true;
+		break;
+	default:
+		return error_string(buf, end, "(%p4?)", spec);
+	}
+
+	val =3D pixel_fmt ? swab32(orig & ~BIT(31)) : orig;
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
index 7b28ad331..5595a0898 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6904,7 +6904,7 @@ sub process {
 					    ($extension eq "f" &&
 					     defined $qualifier && $qualifier !~ /^w/) ||
 					    ($extension eq "4" &&
-					     defined $qualifier && $qualifier !~ /^cc/)) {
+					     defined $qualifier && $qualifier !~ /^c[hnlbc]/)) {
 						$bad_specifier =3D $specifier;
 						last;
 					}
--=20
2.47.1

