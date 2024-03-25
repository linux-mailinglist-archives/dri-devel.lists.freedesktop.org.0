Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED658889CF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 04:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8841C10E0FF;
	Mon, 25 Mar 2024 03:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Uigvohji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2081.outbound.protection.outlook.com [40.107.113.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6450210E0FF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:04:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=be9WKd3+4cBG5SqtUkmoDcqdIA2q3KbjBTT0yF12zJb4iXQ8Kv9adL1nfw6j2NAjhF4P9joW4tq1+BhAD7DLRlbzpeEOK4C0eM/yN3d0NVVGlbznHuCM+gvstGFplBgykgXITbjndYKssmuMyky6t/roMwP2/o/3GPqxsVUhB/F3Q8G/XdFCINCiebD2p/O/EXLsYXUPj78xIX4GMc5IbQN6WAeOpMhmylUmVIi+vNuRPUIkXSpAi/NQzPbc2XGCzHhvv+RTVCPkbetPDAfhVafyYNPp2zxfAoqQrGpSlvmuzEy3DnnZ1yS7r2xyk9HcKjJEA3Cj719JVr8efmCMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZsdpR5imvkVNiwWqfpsf7qA/E018z6R54D4itgGZ/0=;
 b=lbTSPWaFuwREVSrEHLF//8NzIQl3QKusZ+lD/SaAF7dpOuIZUKGsDCLb8gA0ZcsT9enTW6yK6VD6Kq3KzmXXzw1j3fCjEGgaACRP0pIE2HmfeL0PQeGTW/GIvGjAT68ky9KQrFAqxY4RUrtdhQQJq2SoxLLZ0gQkEG+Y+AeO+QLyXFND1r6VF9tUBIby1IuoF/DcW0np45k4PewhdJ27Pd2GJZJeOdyTwAITBgci9z+VGlmBJ0t9f9MxijZUs/BGXP4gUwbz6iAqqsLp5qBX6JUsSModAdzssoKewuGBh8Ig1kyJrPXrFqhjiTG5cSRTGrBTUhAZnS8PacLoVYF9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZsdpR5imvkVNiwWqfpsf7qA/E018z6R54D4itgGZ/0=;
 b=UigvohjiSj5i+lroer589zJf8mbg6BnHTRimQp7OnzJYkGAJuOnG8KXh0QmuIeu/BXarFON88Fb7Zh790eH3dSEXJiHErMAHoOjqBIfK0ZEizA749aoDzopd12o1/rJmA4DSrgOFwXGsyOWq4oy7CrdIQlJ5eOEHVLxfTNMshKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6966.jpnprd01.prod.outlook.com
 (2603:1096:604:12d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 03:04:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 03:04:40 +0000
Message-ID: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-om@freedesktop.org,
	ap@vger.kernel.org, linux-staging@lists.linux.dev
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/8] use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 03:04:40 +0000
X-ClientProxiedBy: TYCPR01CA0166.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb71da8-fe98-4712-f8d4-08dc4c78504d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ntw/iTCJtNwsDNDFCOlR7zZVtGmMwn8BPl4LZafBbKjEalUp/tWj23dnvO5oI3ac/8CFlal/628bk97Iz+zCjtEeKsB07302dNftXoASed+LbER0iQCsguP3olugEiAPZVoChuPl2KmLIiQMOHrv0peuiwOyCL7CnI4qj7Ykqzxt06KhZg4VCDTiSzip5F6X4SwYt5pa+2T0Bh6BdQHPVB5VOMiW4asW9dpkYyyKH6VFKuNsFllaa5jGNuksyUTRH2hUeBCBiOhtxW9dBkLa7nzrt0r6p3VvuqkGI6fXMM0rzkpwu3Nw22SE9L+A4zEQnWOd4th4UGBtsopl2j+Is9UhuxkLkfgNaBwChKCx9SlL8Qp4IdwHHEigSm6diaphpnoWgvrEof+sDoQys2Gy/TXVz70pvLOxR/OEBo176FNn88lLpj7mUUsZvUYnUs2dfiYcq4ZYKNOK1MAlpupiCo+QA7uCNPHeoEi6GwHTKk7ttniJ0/4Tbo+EYsXjGJGsYyyvtrwUqwaXT8fkVjvJbuWFxwOSQbYTly18ATMmkGs77COqHXdifc7pnVfn+6sYCErjgDdD7Uw2atQlWc8d2armxkkm6Po8oSfFMvBfxYQBcdNOkErvCONlqT14t3LaCT4Hiaz8z/BMeA8J9ePXAnSacQyzCCG6m+gyzcxiW4Vy25hcYD+fq4gg3CZxNO3WF12NBhFVa9G4d2giXcoUUs21XZVDZ0GrfoB+EKpnh5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(7416005)(366007)(376005)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4P45nDyRUKc/bIzVYoor2LznUw90V0BtRJA2rC1YhzRw8IZFJyfiyUep7U5G?=
 =?us-ascii?Q?wBtQfsGSxVi3ayEUdoNZm45tNx70E7tTfmx+Gg3CBEd1Mn1W5YC3bseU+erC?=
 =?us-ascii?Q?tB3FljVasbTCePvENr7maaUm4H+h2XcGs5P50coPNwZroc5pCtmLCmdyRSYT?=
 =?us-ascii?Q?wDoRtKDVNfPMnRplEqa+ARRiZSBMgc+PHW5ni2bEQGPGNbZRtkJWuToZrcQn?=
 =?us-ascii?Q?6OSvLkyiIBRhBfIRzVnPIvlKc7KUdHKRefAlxgA4q6Qkw5G9nyhEGgi4MaB6?=
 =?us-ascii?Q?4fTDC7HwnGLDqrw5vtrYbZAaMWruOAQbW3vANRsIfeMkYC3msxXY+3OAgjLl?=
 =?us-ascii?Q?pKzaKVO/dzj3NI5A1HPDQE4Fw1VtC/7o2dXekNfKmXACgI+jdm/34C5MvCSq?=
 =?us-ascii?Q?9PG0hgnZt6gOSWaUfoChDC/3y2+y2tGmYEU0VMQ3Ad2Nu9TYLenatf/1/af0?=
 =?us-ascii?Q?qxMT9SEsPygyU1ABbViYiFYO77n1z/VxTtTqMtGOMpTQUVZVrT29TdkpfZg4?=
 =?us-ascii?Q?X/Eox7nLH3FT5D9zM+lLn84Z7v6Dn01h2h4bA4Xm60jo1Hn2HsihUcf3z9gd?=
 =?us-ascii?Q?Nc/FDXOmT/hVJkLP7hxSPW2tfsfpRuMHxlTDJtAXeBP9mrou+/A+XmS6BbBq?=
 =?us-ascii?Q?axicXtcumTPNiEPB1LCkFGytQirk+bevDLMSoGU9neVvriPVWaPqxO+ZLlGG?=
 =?us-ascii?Q?bDcqdBY9zt3h51cpGAkqPjIBtTG5ovNsrx3Dl5fTfn2JyupQF6InjGzTE3Uh?=
 =?us-ascii?Q?sAS8mBXIgPlX2M0nP+gbvVWr4ZYxEGg5XZN6a3XwhP8wL9VJ4J8wVWk0gScb?=
 =?us-ascii?Q?DDrwFKqsz9LGpv4wimq3RAfHfETpIvy6wi2ayQUazUkZ2BYhFC59SlGm72tS?=
 =?us-ascii?Q?whoieqkAIxkuAeGW+/A3x2ct8RF8cbDfbduiihSpXk/CM2e5ks2kjqmPJjbk?=
 =?us-ascii?Q?iQg3TELQxfC6Jm1Rxr0RZ1fY3x1+3WmhLYQ6DLPemOaJqoHYSeUqrVwT7gJO?=
 =?us-ascii?Q?mjThBPhAozfmzktKnHWgA6p2DqsuXCpWs3ChMRqIeEqyYH04fdCOorxXy6pM?=
 =?us-ascii?Q?FmBQFrxtkO90FSQxaK7ZuWFNX2ezR6SMu1lVDf+bbFjU0iYiDXrQkUO7m1ip?=
 =?us-ascii?Q?LkZDjeHuyxrGG5ZyrD6pDwYSqgC+HqusfvVKVB0pkxm4GZzLytENKyrU8CUm?=
 =?us-ascii?Q?ImeyE22GW85YaaOMZYZWUhKUIElf7is2fvAdjd6a9Dlt1geboEI5t7Rujggt?=
 =?us-ascii?Q?6rHys6U2qirIRaFSIYh4rEScCv2qwxp9tZYD8exiSxxuBGLuqgA618EW3yNH?=
 =?us-ascii?Q?rQUOKDmvAon3CdJPfiOVPn305ZAx8IrktQOCrVhJxns+2W0R91C1ephKuo6f?=
 =?us-ascii?Q?go1sUz/942l7a5dfxYwXwimfbRnvOwo31T9X8iBPvnIOBqO8HD+AUsgnggXN?=
 =?us-ascii?Q?GXpQThCw9QtnEeHT739msNDOGNW2O/axk83RQqyC3LFyCQHAA0bCmrLdh5Pa?=
 =?us-ascii?Q?3FuWh/HLTGXilirj+B4lsfzeCpl37Ln+8W36WcM6Z6wby2TRpA/17taP4Dyy?=
 =?us-ascii?Q?WU/7Fg2EGbi45y1fjx2feuQspvdtMrRF0bE9k8saSsIlget0CB5pj8AmL5Ow?=
 =?us-ascii?Q?ver+/EjjN8JPoMMORooJH0c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb71da8-fe98-4712-f8d4-08dc4c78504d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 03:04:40.7954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amKL5BvVbLkzyQzZzUYjKhLHaZyDgjDUjSuHU1K19Y8JWce0PyQu9AElOM0BsSeBMrUguuHtgb/RUDeQnvqxrOKT8tTRS/DUmGOLwtrwTRIT/ZFNPZkXPepjNUGL/kNZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6966
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

We already have for_each_endpoint_of_node(), but some drivers are
not using it. This patch-set replace it.

This patch-set is related to "OF" (= Rob), but many driveres are for
"MultiMedia" (= Helge). I'm not sure who can handle it.

[o] done
[x] under reviewing
[*] this patch-set

	[o] tidyup of_graph_get_endpoint_count()
	[x] replace endpoint func - use endpoint_by_regs()
	[*] replace endpoint func - use for_each()
	[ ] rename endpoint func to device_endpoint
	[ ] add new port function
	[ ] add new endpont function
	[ ] remove of_graph_get_next_device_endpoint()

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
 .../media/platform/ti/am437x/am437x-vpfe.c    |  8 +++-----
 .../media/platform/ti/davinci/vpif_capture.c  | 11 +++++------
 drivers/media/platform/xilinx/xilinx-vipp.c   |  7 +------
 .../deprecated/atmel/atmel-sama5d2-isc.c      |  6 +-----
 .../deprecated/atmel/atmel-sama7g5-isc.c      |  6 +-----
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +--------------
 .../omap2/omapfb/dss/omapdss-boot-init.c      |  3 +--
 11 files changed, 30 insertions(+), 71 deletions(-)

-- 
2.25.1

