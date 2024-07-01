Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4896391D619
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 04:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A0A10E15B;
	Mon,  1 Jul 2024 02:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="SHIUNvZK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF79E10E15B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 02:31:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9//PhuyOVsfUveHpJU9sjXRQzIA2I3SFNC8PTs0ClK+EWX6XcqL+0kojaXC788w2JdFLdR3MNFl7jKnfeTDJua4TyN4r3v8q7UgP1r4q9MzK1082WRb+GEIb13jWIH3td0g11JMm4v6MfM1VGak16S8V69p0uVT8xXOxrQPg7Yg0Ws9rQDza/f8I98KNVpBK0CduR9PeATV5RqDpkWOPL+d5iaEnIq0vDf3O/oPkjus3EMBDaziEkVVVGDSMqjTitvtdCon6MCit6tJEoX7nXvA9EG/ysTPsd8F2NSvMnwEIeJjTHOgisddC8BAvnvPhU2r8lDVer5fFbBbjtps1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qV7PjlsWYTahbsZsDmk0ph0ehvdaNiqfPLOEhFN+JJM=;
 b=cn+DQAXA2bFpbe89X8I6tQ1pqakkyskGo9ADnBcC7cBgwQzOtVxhDgBVJOYniQNb0xBmzYo6b+dIh3lsIODu23TzroyQ35IMFJt17a1qrMpQV7iPa8i/KK46+e34mZoT+hA61w4r7lKZlm1uYTLENh5gOtodIjO0HSq4hJ7yXZaWVO8/6E+QvlqF77Lw+73aSA5mbtNZPhthNPwX7KQB+XF5/eLsBM4sTWJLc1/7txPn+ebny+0US8JcK8rc1DTHL05+Hy5erkIcKJxfZ3MYksMqx6fA9C7d/iq1Rtn/Jr+hXOE8kkL7uOAQeAFip+ZgmPtj598JbMi+MkbyYCKMgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qV7PjlsWYTahbsZsDmk0ph0ehvdaNiqfPLOEhFN+JJM=;
 b=SHIUNvZK9+PQk1GNiXfasaUzP5BRRF4CJlV2G8madXo9vhj4vBVFj2euhtVk8iPikvFVT/pkbpYjvzdXTXvDdAno+kfW5Re6R+ZSfWS7OJ6ryWU6Mp6HTbA9mzP2qftrZd+JesUnpxLwLt9xsynjD/h9R3d9eQIQ6e/91Bh7L8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9627.jpnprd01.prod.outlook.com
 (2603:1096:400:193::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 02:31:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 02:31:50 +0000
Message-ID: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org, dri-devel@lists.fre,
	edesktop.org@freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 0/7] use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Jul 2024 02:31:50 +0000
X-ClientProxiedBy: TYCP301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 8283c964-46d7-4ad7-4611-08dc9975f692
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J9NtbYa/nrhZkleh6g5OKhA5LTb7p+LoH7VQBSNAJTEzCRCsUWjgtL07Dwrh?=
 =?us-ascii?Q?3FQ5dDokaFJKIDrl+LNAJp1s1BtI8VaOUms767uP8U+wg1qoulAONKXE6JZb?=
 =?us-ascii?Q?ky44sVshUKJMnRFxz/qxdH7uiEA3r0JTGcEScbWcr+wpugb/Uvs5kZNutAiT?=
 =?us-ascii?Q?fVb6wD/1gT1XZm58FcFj5wwnYmfwpfTeIx5amBitKO3H/43TXuB7UOiFUPFh?=
 =?us-ascii?Q?sThJ0BSBNgF/wTre6R/+k1NrQwk3lR+a6Hx7Oxzy1XWe7ZjReQ8PGh8fV3tZ?=
 =?us-ascii?Q?rC4hCv9a8RHDYegUpMBd8Zbs9qBb+dC+aOKJQ322DvY1KU5a+j1gu5qEoKGq?=
 =?us-ascii?Q?29+PYnkMxuD0MGxpsP+r2ZS34mUJwblCBbUSb2+a8FLW//3tJppVu4p2qlun?=
 =?us-ascii?Q?HOm8zf5PX2AAlEu7MXWCO7hD0cdbTM+CPTDiEadtCa6DB7OR8SetTlmYoYP6?=
 =?us-ascii?Q?P5VPCofDeEVhzPebKYu6Jz1EWM/ye9E/Jja9i+hC8BQ79pu8TLGUz/eDtsTL?=
 =?us-ascii?Q?DXjFUlbVO2BRnpSo2axfkFnhU9ZrvqAY91905wlzHR9FA62I80cRkSUA/d7n?=
 =?us-ascii?Q?e47JvQnU1gjCAlj2Jb0If6tZw84Wks9mZJPzELnF90QC6d1bYYqvBDEry5d9?=
 =?us-ascii?Q?mFPywG11WbB49zXN275sWlWnwEtGw/IMBrV9idz0qchlKeb3Wer0Abt+gbXv?=
 =?us-ascii?Q?eV7G2CcgMYRtBJYfF0Jb3YkOho6sNmB4qQD9jzKytxnNr2dOhBgtv2yLA5i5?=
 =?us-ascii?Q?zknVNLkibNbZsIRU2KWZcIOMQBX7mKr7p9a/qwugkpVS1UXuS0ZjgRqhwa8y?=
 =?us-ascii?Q?Xs+n3nexoXzVHCr/IqyJBEekowaWnDrSdLrAwJiAHGdfYEKdzZOi5DUJ5Veg?=
 =?us-ascii?Q?5Woct223ygVLX0BfMrWe7hgVgIWu6oEe6qVg3vmvKbINZOKxBb1e2So0Zic4?=
 =?us-ascii?Q?luyzqW4Auk8CyiFX6WnmUwj4E0CZlxOV/Sy6dGrlEbvOLRQyO+vEWAFVpkxO?=
 =?us-ascii?Q?waqCwOhU+MbqKcyB5xLGLUj/M/HoAbJuLnkSR1cPjFpGUddgrHuHskJcDd1F?=
 =?us-ascii?Q?S7Hp7NButXQBqiG439m8+luXV8hJ5NDsNVAVKt1JQui1cn771XeptcyiDVEv?=
 =?us-ascii?Q?i2jZz6LK/O/evED4tqupi2X86QRFsVyBbOqOttj+ZOYtCozEXUvm0Clv4h2G?=
 =?us-ascii?Q?tJV6lZiPoZIMLnPfbLnKx2XNZQbGNdQKAiFunYDueXJHTXxsmxTefmZCZdjD?=
 =?us-ascii?Q?C5RGOp4pLrOFdQay4F81LByFdQH65mRyJrDrf8vxqJhppF7x6vdGIpi2IviK?=
 =?us-ascii?Q?03Nr6Jlk6/q2yb5v6oKI1W/4qIjSA4/DBydTkyjoYG5PzaS1aIAAtJ3PhoTA?=
 =?us-ascii?Q?YvK5DGbSgf0P7QjE3zmW23hRoDZ7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2PretOlwuy6uHVx+9gxqxlcjqy6i4r37E0iFmlavwIXAKFC4bRunUXiPfq0C?=
 =?us-ascii?Q?uFcN5NF3TRjRzetQ9coqyqAPToNcxJLUs7rhARR+WCWAPv1aU1fVjhjQ5S/G?=
 =?us-ascii?Q?7US4sBsha1zDTLw26bZjtuySdPI1rvOrUUDC/LCVIjOG8a7fGNPLpUP2Mu5H?=
 =?us-ascii?Q?LW9FlO7VMtDHUjUUjwyQSCn4L+lZaWQfpE5Vkir812MfMS3k0cgcKzlFNOIF?=
 =?us-ascii?Q?Lvhi+Yuo/Y7VAJYSo0DbcfgBUs2cy/3mJL8uuHWWDluIM8kaIblE4prh69Cl?=
 =?us-ascii?Q?5nlKpFEpGdin2uJAH9cHwRgRjxcNCXtcsT+8YNbrd7QPnk3kxE1T1RvaEYeY?=
 =?us-ascii?Q?BCAnCsgH6LREvdK4ukhZfr893VJFNhQpuEQpHC8I9Otj0FULXYlKVEI/39kQ?=
 =?us-ascii?Q?IXxt0HI/LI3D2ekHxk2yAdhq8TqDR7q1nKqoNilxcmcB7rVgcgb63HtaSnjp?=
 =?us-ascii?Q?kU7LJA3I0QxD065tIjU2LVMWHo1/0msj8sgfsvxlVIDB4s8Z5xq1fY0t3+xl?=
 =?us-ascii?Q?OfCVn0LmDMG4ZapIFizPVaNQxL29/zdmylTTZIGt+XSbL3CXeIdxBIh6CX4z?=
 =?us-ascii?Q?GUpxnvMbQhvVkT3qF+9ctv/phoLV1VIBO33je8OunqP50nrKFFyG2Y5EAgcG?=
 =?us-ascii?Q?5Pwle//EJGwP/9cAFSR1sKG/KlKCho6J1yjMZxAJrnCZpSgWEcyzopWn6xBs?=
 =?us-ascii?Q?SyJ471oqXKZFCbiHsOPMmI2SBRIKYG1BTtaZfjKcn2uwR8Ql7a+xJAPD6Yqo?=
 =?us-ascii?Q?Hc4e2aH5zokh8cY/JdHpo+5+kO4GINTopY1e5N+oHizHogiI92JjEygEvNnE?=
 =?us-ascii?Q?wYl8eCMy2uo3Ui9eA0cGhO+Mp/Ezkl3bEZ4JV0eTxgA5SDNjyZc5JpMtWkQX?=
 =?us-ascii?Q?9h5OFuC32b2yIl7Pszs3kw1G1vUoO1trvdhCLkcORi3vXCLk+BBy5Dz7Wz1B?=
 =?us-ascii?Q?yZif29HRt7mjtU9o6aVxX0NL7RSbI4z9ltV1vPSgKym2FXX7OE9mGr+O+x4y?=
 =?us-ascii?Q?YHL+H/kF2YCznjmFz0qXpxWwVNJVHyHwlFjNJ5H4wzhi80dHRhk6JwhdSNYo?=
 =?us-ascii?Q?ZDh+4c/Ue3lMupNP/QF0l2YMo0ZUG6yRxBdfNINnK/Zb9Ro1sv4mTws7Lf5f?=
 =?us-ascii?Q?I4nuHo6UtA4L/WqV6h/uDr79pYNqzQzi8cp7cI+4bxRpuG6sUmXCiODEc9hI?=
 =?us-ascii?Q?Ygvczu4TlAShDXMXKHY0W2UV2soPZ5OMD9FAbhfIeTpMvdtveslPg/NPHI7w?=
 =?us-ascii?Q?esh4Zyeb/igYI3mUoNUKdzy6P5fJrrROcDbZETyGeMnY4OZSdquc342BH3lG?=
 =?us-ascii?Q?XeLFQS+Dz7CeP1hRDmXbyGO0JZPAJtOZgMTdoIaGVo9Jo/ALEFn8KwC1qZYz?=
 =?us-ascii?Q?CGG7hN1oCsun03SOeg13um4hSEsRFBcW0/ji3jH1HwgVULnVhk1NUIfnG5gE?=
 =?us-ascii?Q?taQWejbgmgBnZT8fwlaiwye3PLtx+D1EDbcl2oUGI4uCPY59lqTeoC9JGql8?=
 =?us-ascii?Q?2cAtHwy5iuErMaIivMh70oKlZdGn9MGN177twyxcuLNzmSGqs0RNQlzc7Jnd?=
 =?us-ascii?Q?G+kvbDqqEEWLu3q6JYhMIGdyPZeZJN9Y5JwerOb0BrHLkpNI7UYGdhhiiRWZ?=
 =?us-ascii?Q?yGCqKT5pcrVqDaCQ6i4pviM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8283c964-46d7-4ad7-4611-08dc9975f692
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 02:31:50.7975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BC9+TZ4DnecPZd4m6/XYYGgbdCc4R5ChKAmZq0YEISzhTnO6g96NsRHBnznI80Vj1zpCorST2gsUAQkLbPBAo+BNwe1uNKj7SN8DqHiV5NCdAD2Lasej4EbvKu09taQF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9627
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


Hi Maarten, Maxime, Thomas	(for [1/7][2/7])
   Suzuki			(for [3/7])
   Mauro, Lad			(for [4/7][5/7][6/7][7/7])

2 weeks past, but nothing happened. This is v5 patch-set
(Basically same as v4, but rebased to next-20240628).

We already have for_each_endpoint_of_node(), but some drivers are
not using it. This patch-set replace it.

[o] done
[*] this patch-set

	[o] tidyup of_graph_get_endpoint_count()
(A)	[o] replace endpoint func - use endpoint_by_regs()
	[*] replace endpoint func - use for_each()
	[ ] add new port function
	[ ] add new endpoint function

I noticed that my posted 1 patch on (A) was not yet included on
linus/master (= [1/7]). I have included it.

Dan is indicating it needs _scoped() macro, but it is new new feature.
So I think we want to have separate this patch-set and _scoped() patch-set.
I asked it to ML/Maintainer but no responce, so v4 doesn't include it.
It will be handled by other patch-set in the future.


v4 -> v5
	- rebase on linux-next 2024-06-28

v3 -> v4
	- fixup ret handling

v2 -> v3
	- don't initialize pointer.
	- add Reviewed-by / Acked-by
	- include not-yet applied missing patch

v1 -> v2
	- fixup TI patch

Link: https://lore.kernel.org/r/8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87le3soy08.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87v82q4yg0.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (7):
  gpu: drm: replace of_graph_get_next_endpoint()
  gpu: drm: use for_each_endpoint_of_node()
  hwtracing: use for_each_endpoint_of_node()
  media: platform: microchip: use for_each_endpoint_of_node()
  media: platform: ti: use for_each_endpoint_of_node()
  media: platform: xilinx: use for_each_endpoint_of_node()
  staging: media: atmel: use for_each_endpoint_of_node()

 drivers/gpu/drm/drm_of.c                      |  4 +++-
 drivers/gpu/drm/omapdrm/dss/base.c            |  3 +--
 .../drm/panel/panel-raspberrypi-touchscreen.c |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 .../hwtracing/coresight/coresight-platform.c  |  4 ++--
 .../microchip/microchip-sama5d2-isc.c         | 21 +++++++------------
 .../microchip/microchip-sama7g5-isc.c         | 21 +++++++------------
 .../media/platform/ti/am437x/am437x-vpfe.c    | 12 +++++------
 .../media/platform/ti/davinci/vpif_capture.c  | 14 ++++++-------
 drivers/media/platform/xilinx/xilinx-vipp.c   |  9 ++------
 .../deprecated/atmel/atmel-sama5d2-isc.c      | 10 +++------
 .../deprecated/atmel/atmel-sama7g5-isc.c      | 10 +++------
 12 files changed, 44 insertions(+), 68 deletions(-)

-- 
2.43.0

