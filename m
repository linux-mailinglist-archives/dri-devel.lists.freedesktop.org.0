Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAED8D2900
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 01:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9195D10FF51;
	Tue, 28 May 2024 23:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="OC9/Um0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2059.outbound.protection.outlook.com [40.107.114.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADD410FF51
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 23:55:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPICc75G5epq1cRxJLRyjQ8AUQi90x+63pMRtBhGnIueBGEY30s45aBEABUn5MXlNvgqY8qe7U5fDdq5xxJvy63RhL870npKMVK380CmR0MIKx2GMIjJjIQp/cyazK03RMqYRQ9Mo+eilhkcAhMaGgNWCCEW1Auxg+iDIeYxPeIaioSepAtltOMbsAbdcDZ6CQbNAzvXuOpj7nh7LVg+Mg1lD1zDLJVcxgmuPnYz2HxKyXX3s81s5q4wUrVCv0wewDMzq2sXNWBWUBzMUL6lX05FCBz2vvUnNnkG1hmlZ2sPQ+jZvinopTK/mlgGITcBJ//gwKrBg85CUOIKxKJZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC2ZTa3dTfEU9ANJwfy5zKSSA47kz8WDmL9rACZ35iU=;
 b=nWrEuQthpvf1BGue2g/E5u+cb0Tiw6qXYGxJVgJj2zsKrroUneN5SH9TQbIVlO+9T305I/ctOSgyXsQYr8fFnbfJMiLnTxZ8oQNz7A64wPjqWTH6CUiz2VBsUVnlPqvIdAXhX5kHXO/x5g6aGziMzNdrvrJYZHDgPAP/XPifaFK25VpOJCsb5VNoVcjUMkc/7+OOQK37mUO9/EGKNVYf3ayOWu8rC/jNPoDooEPjG2xpujllrA+j9hEDR6DD8N7TxI+pWZwl2+YnTr5ZmMpUc88eVuECyhzoZ/4lya7UNYDtVgH6DGIICHWjI4wiWavP9HXcUYBTVgySNvgCuD+bOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oC2ZTa3dTfEU9ANJwfy5zKSSA47kz8WDmL9rACZ35iU=;
 b=OC9/Um0X979mjzRVgoh2Ai7OazwjOprGY6KijWibyngPhrovWIo5DEYw7luNvvunoAJxJcRZw7IOnWBpGhpNESi+bh9aLr+P6MC1VxaDSA2qE2AmrascXJhckDw6jok6z357ePkKgDek5xSo1xn4MBtmPAPH43MJ2b2b9VcTfjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11224.jpnprd01.prod.outlook.com
 (2603:1096:400:3bf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 28 May
 2024 23:55:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 23:55:02 +0000
Date: Wed, 29 May 2024 08:55:02 +0900
Message-ID: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
To: <prabhakar.csengg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org
 , linux-media@vger.kernel.org, linux-staging@lists.linux.dev
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 resend 0/8] use for_each_endpoint_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11224:EE_
X-MS-Office365-Filtering-Correlation-Id: eae2f8cb-70da-41fd-a468-08dc7f719750
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|52116005|1800799015|7416005|376005|366007|38350700005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3Ba+Gea94MLbwIvV4AXJKCwwBQ4Wm90W+wcZ2XWKRAgPFhmPPQW+zKSjLJIp?=
 =?us-ascii?Q?baCFzRkUo3nVqELcFhMrByXq0ObrHGjxnS01Um0dx7CElCaL+9GF39VpmhtX?=
 =?us-ascii?Q?N2LVTFZ3som943dwQiV1GCBtlxjwANDVS+X2XLkHnPaZChYON54sHNhDIKpf?=
 =?us-ascii?Q?cAFNAu7sJpwcX6Jp09H1MjFi48EX03jnNFEmidEL9Nhe2nDEeeF+zk7Laeo5?=
 =?us-ascii?Q?6EI7tXrT6jm4HdmVbkWNcdpuamoC6GHNVoO1+LqQB5na+16F3nrSX9Of4W3O?=
 =?us-ascii?Q?J5uMqXqKSRWq5lePSxnkIFzVDeb1mIIf/nCQvWTpszLt2xO1UoU+RXQ2Dams?=
 =?us-ascii?Q?KqJHHBeQO6WPUN1IVN0CdP8Lbf4WG4bLHpktfAcQO1YBBcSp7M5bnyzW3rET?=
 =?us-ascii?Q?zxz3DBtWalSMLzEzPFY+Daqlksgfv3D8+naossADp/5WgAJdEPW5K+cWEuva?=
 =?us-ascii?Q?TYxdvwDlGl6KpKiMnfuVIzeh27LMug4eixD3JUv5CddHAqaAf6an6nhIayYi?=
 =?us-ascii?Q?U+up+ybfzyPi7o+yDDkD3g6W3HIzCY3vaTxaKwCq10U85vIXatJx5ToAB1qJ?=
 =?us-ascii?Q?xOx9GBsaENewbIp2ck0DIU8DGCmgJ1IHEUGdNbj5CNmQhKSQFQ7C4T+hBrhA?=
 =?us-ascii?Q?CvQmafT4rVh9/89wpLaD9YAI0rbhtynw+HE6eJ8ic4yKUqdZdV/J1lCrVczu?=
 =?us-ascii?Q?d2/pP/hjEXxfMfYDqI4roxTwwek6HaSOxTRjwFN1I/33L/fnSMtuK7rP78BF?=
 =?us-ascii?Q?nqBesO+B0044beKDjw1Aj5Nt64l4gb3GhixQotIVQOX8sCNpTgoJLEJKKgcw?=
 =?us-ascii?Q?mYDByBHcAc6oJqUcZbbv4JtyaV1wWmBZc6KUSXvix6YrQYfuh7BHAA5Uth7o?=
 =?us-ascii?Q?XoL7GIFVqcoRtAOgtGVwcoqp9gIUnjP8fd9kDgiaqyMl84UMmoHwZWMYYQQk?=
 =?us-ascii?Q?K4PayRTud/fQDsdMtMjRK3nMbM+CD67ogJso7vHxd0NFGTmHC71EF43OKOJ6?=
 =?us-ascii?Q?NGd7dJZVFQ6qY9izdP5MpVszrYoO19+7NjSZghqV6eGDhhKAk082m7MojsFq?=
 =?us-ascii?Q?PKEkIegd3jJYq1aE5XAKmC8cK0EsUUZgbOTRSl5gbJajhsjYQeoEY5daYKlI?=
 =?us-ascii?Q?rBUz4SwV+pX8HYtJaUwv9wv8G20/vFsK9vslzD8ronCk9OtSS0zs4jXVexuV?=
 =?us-ascii?Q?oihgpXR0OIaLM/KC8kHztT2sDzbYVvEDiCtFmfDMbZHnuHFRIlKKT4N0ECRX?=
 =?us-ascii?Q?j9BdSUPKXGhBAa+OkqOr/RTnNRcWeMG1eeW600SukE1vrmiKYJnyIYkM6/An?=
 =?us-ascii?Q?TKM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(1800799015)(7416005)(376005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X1qyHp5msnXHnmQyhfwZyYaCqFhXTAthAVkcoMJj0JWgeEnE9WJDxPJSc+kB?=
 =?us-ascii?Q?T+ybG0AeFMcKq0ZNjhZ/iH6qekMJBn5xT3T4u6CgmRzR9qrcvYhBKnxC4sZI?=
 =?us-ascii?Q?upCYB8TNnmNiU6/Nnj5S/0J7VhJSXClucu6OS99xSKOYjIumn7+D9nRx2Zt7?=
 =?us-ascii?Q?rakyxEzMCv8RiVmw08r4A1KuCDFQVcG312VWpgBrbJP21gwd0VNeg8FhHlMH?=
 =?us-ascii?Q?c8D1I8uulHQBTvBMqAv/sh4qgNFZaD5Ru1cVGH9qW0WXNbTFK4d46mE38FOp?=
 =?us-ascii?Q?8Ktc2fburYLxZocZHNeqRDNFj++pbYJno7BaY1MBwFiGYEkRqbsvaI3/gS/Y?=
 =?us-ascii?Q?9fJ+QsooWSQF98VXzrOiL7ybsBg0QIVf/FRzV8EKrFIhoffNaGCCj0x9s0hj?=
 =?us-ascii?Q?0D84dBQiNrXDikVsIYs6YdJWnAMdmbYaKGeyF1lt0JUqJSn6FmryieR98nl9?=
 =?us-ascii?Q?5jxaLOmjEIi7OfJR97VFNlxlDN8NjSDGkjAZz7AB5RXBmCixgD02rih6KhSa?=
 =?us-ascii?Q?engjs++Q72dvuXBZqgrU16wW3/x/FD1UuXrLPZ2NJjPqDa/eRE/gW9l6Kbjm?=
 =?us-ascii?Q?HxvNuTaIKdYq/QVah72BIuF0POHYbccEwN1/iCMfwH7R3fHWRYlGAfhG1r4p?=
 =?us-ascii?Q?B352x+V5rn8MIbZRODin3HMnIHO2yv1R2tOSGYkxLkJFwVbk685x40IEJoHl?=
 =?us-ascii?Q?l13LzxQAEDa96D0m0mBiV2Ce4oTYuLyngjliuJ5viFZrI/DO3pem+NWiq6+b?=
 =?us-ascii?Q?XNhXjMr+7eH8TEFszG/GyEzg220F4TbTGsNibf/NnnD1f6m+xiUnJwo6TexK?=
 =?us-ascii?Q?ESc4N6prBle4NSvAZAgnXuTrCa19UyViL1SSN8rw1mz0DOZrQ7ennCSQsboX?=
 =?us-ascii?Q?wa8Q7CNY2pTFNAzCFuycC7pk4/5Xag/coCEWAMhxFcZQKQibBXGMYHhBLF9k?=
 =?us-ascii?Q?vGlJcwxHJ3P7ediQtCm1ap1g5KqoP25w/mRvmzQ8/VzM3oTCllf8qzqsdrv7?=
 =?us-ascii?Q?jAypKTbBUo+uxdHFhEF+diR923WU7boGgnmDlRehbVAGjr3EGVmhB2/Ymcwd?=
 =?us-ascii?Q?XH52QF2v1IZOKRoY3K0Th/F3Qc3wiPuT7t+0Hd7/a+mGsQ+PJq4oSt2QGWSO?=
 =?us-ascii?Q?weXExBJhPuY5i5o5lZ7nYng58qZ+RM0L6IuaK2jDCkEOUjYV9r/63LFTo1BG?=
 =?us-ascii?Q?f+9FZnkKLselGTfBtfLCSK5n6sETz0I+eeD+sNvfBc+u5CXFQAaxYQMUCLQt?=
 =?us-ascii?Q?VWYt3Iv2VmkFsfjcmQu2CQRQQb1LJq8EUOiegVQv/Z6qwG0j3yXhUlBQu3JY?=
 =?us-ascii?Q?mxjcHL4EmIsIiUGwwYhvdvQUL4BE+XsDz/3IFkdvJjibymw6bViPGHRW6DE1?=
 =?us-ascii?Q?0LWtu+oACIZZ0OkePXz7ijj2F2qyg3bI+7gtk/sQMlbZCPtcaTw+vUAEdGsp?=
 =?us-ascii?Q?wDsff2MSJsCHmMd9EbigWbnby9EKIZq3gFtQtLEn3iiDsfGbBNQFd1+/bUqP?=
 =?us-ascii?Q?8sll8VfrmIx/CVcbHvXP7yfz9Z6zFAMk8rvU3P80HbR7DtwWg73f+vDSjGK8?=
 =?us-ascii?Q?ZhCEms3WC1H26WqnFtrlCOUQ91tQk+JTWHxgZ6rFH9M2b8/X37eJobsu2KHo?=
 =?us-ascii?Q?I2/yu5s7xycBGVXIde9+S8k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae2f8cb-70da-41fd-a468-08dc7f719750
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 23:55:02.8648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XANBxYVmLEmTqW4HLfNln5KxAvuPDUL61UPBOt7YNSwtrgaBsf9v5kzHYDSCUpF5HhvYXLMAlSK/bL/6EInDbMwC6YkbtWRxlVtSi5bWu5J5MRLnyteUbCS/2UlwZmZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11224
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


Hi Rob, Helge

This is resend of v2 patch-set

We already have for_each_endpoint_of_node(), but some drivers are
not using it. This patch-set replace it.

This patch-set is related to "OF" (= Rob), but many driveres are for
"MultiMedia" (= Helge). I'm not sure who handle these.

I will re-post this patch-set because I couldn't find these on
linus/master branch.

[o] done
[*] this patch-set

	[o] tidyup of_graph_get_endpoint_count()
	[o] replace endpoint func - use endpoint_by_regs()
	[*] replace endpoint func - use for_each()
	[ ] rename endpoint func to device_endpoint
	[ ] add new port function
	[ ] add new endpont function
	[ ] remove of_graph_get_next_device_endpoint()

v1 -> v2
	- fixup TI patch

Link: https://lore.kernel.org/r/8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (8):
  gpu: drm: use for_each_endpoint_of_node()
  hwtracing: use for_each_endpoint_of_node()
  media: platform: microchip: use for_each_endpoint_of_node()
  media: platform: ti: use for_each_endpoint_of_node()
  media: platform: xilinx: use for_each_endpoint_of_node()
  staging: media: atmel: use for_each_endpoint_of_node()
  video: fbdev: use for_each_endpoint_of_node()
  fbdev: omapfb: use of_graph_get_remote_port()

 drivers/gpu/drm/omapdrm/dss/base.c            |  3 +--
 .../hwtracing/coresight/coresight-platform.c  |  4 ++--
 .../microchip/microchip-sama5d2-isc.c         | 19 +++++++------------
 .../microchip/microchip-sama7g5-isc.c         | 19 +++++++------------
 .../media/platform/ti/am437x/am437x-vpfe.c    | 12 +++++-------
 .../media/platform/ti/davinci/vpif_capture.c  | 12 ++++++------
 drivers/media/platform/xilinx/xilinx-vipp.c   |  7 +------
 .../deprecated/atmel/atmel-sama5d2-isc.c      |  6 +-----
 .../deprecated/atmel/atmel-sama7g5-isc.c      |  6 +-----
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +--------------
 .../omap2/omapfb/dss/omapdss-boot-init.c      |  3 +--
 11 files changed, 33 insertions(+), 73 deletions(-)

-- 
2.43.0

