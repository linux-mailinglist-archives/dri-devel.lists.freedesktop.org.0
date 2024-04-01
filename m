Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED3893668
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 02:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1351E10EC48;
	Mon,  1 Apr 2024 00:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Kx2TbxOV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7B610EC48
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 00:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YD6yL9tD/3lEtk1ivSAfkOT8haehqjytYFoe0tTLhZOSji/ptx2gvKKte9ebeVIDOCBxFAL5+q9foKf4K6YEtv93hx6eslFHt76+E9ztTGUmmTm6iAMRsxpR8I4LXfjrNFi76p6vfGleJ541zfXBPAkMW92xFdOI/oAnkB1EnQX8f2daITClxELON86FCtzPJarL/4SiboiC+JnYkXKdsIOI8OEDiEr1pfSBmAvxGgnCb2Txmien7tLm9PPn/spB3v6WSZxi/Ha9/Uaxeou/j+0p5kg/KVgmxnySs2j93or9EsPO5G7AAoObkhfhFqHR5TL704ykx37t2DVcUOcLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7s2w2PIPynKtzrGi/1YXfnroPpGbaWIsqLdWdtnyFU=;
 b=O4bW8rDvmWZraEDx8Od0H+Yo33c3i2CJHtRUXFsQ6WRs0mncins618bPwQJF0EG/QKmB3d8V8RmQa6Xp1PYMuMWx6oehfMSXj8vCMZ/bHDz28Buzip15iiEsWv8YzEyTIB87aZLMRUsnq3auOzHRPtFlnZuLWDSpzM+39oDS+GoGf8haK3ReatHly9Wn+PlMvO9gp51RmDZ8uWhbjT+DD8pCLqBwh67EK5v6vxjJhBgGeWYjwYqEBaYJGUnV2S1mFy6mVDotF7M72VZEDE+l/IsdlVjeRvs1d7B143yTrQith+Gwo7yj5wBVD70eC+0Rk6mtpLsrdqSCGdBWVKaQoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7s2w2PIPynKtzrGi/1YXfnroPpGbaWIsqLdWdtnyFU=;
 b=Kx2TbxOVJq1UzUhrAZA0MWCpTMq6fTm58VuagD9yQUgbkEr3Lc5oF1wFXUlUhHrY5Akj7dLKi2jExIDr1vDFnc26oSzDhQauo2MGK3r5wyS78mWR8z/3jilEVFvslRzBNORI9fL8YlLwIvAjBw+nhKLZgkFzuizpk8hW5G6Dnek=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9325.jpnprd01.prod.outlook.com
 (2603:1096:400:1a2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:01:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:01:55 +0000
Message-ID: <87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 0/8] use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:01:55 +0000
X-ClientProxiedBy: TYCPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:405:2::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9325:EE_
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1LBt4sFo/VduvHVgGQ863xezN3rWEiBjYvtlcPyoBOfgpRW+33IcKc8AQsFSSS2yfYg+SubjfYQSsfTsW6rVDL6py+IhUCXTp07glH6aLeP6QMetlnUBVCcdTRcMmj0tGxTgDjiLVmDdFofpjQvzUZFXgIWzEjycmXEeBsZ+TgrIsBcxxeKItPOTepxlnHB2pAPXaLOwbzu5Nud0tYTpA2YQFNcsO/1ZFqKuc0MkfMqo7lgp0BOzscU7TbhW01/GvWD+iUIR7NzEpmgKVbCuFreVvyh1uTKzmPRiMblIhc+r7E+ACHXf/Ont+o6cJvCdMf04lVyeh54OwEXUhdUHOV49Ss7PE467OyBF1FC02SQ3vdf85AUD/6LVTFeHkfBSQiz68Kb5qtw/6rFgdOqwV5JVGNbOpv1UWAelBFDCzkm9sx9u7C7yp90XGckHwSBkS7YcadagzD+3drYX8nWwcbBvdOM70QxSe0o9LHw2RumYnNAcpiENVXlbUYNrGRpTqOlV72hUYp+XJr9S+dI2w/iiW7tyhpmY9E4YbyXFPehYYhw11etJ0ZkDiCj2q8SWpJNmInZZNvJ/GS73+cityGoQankwuWyimhmyC1rRT/dyXwr0GL71HZXX8Plv8aq2pLlZ59UciPAwOCDax9TQIfbrxS0kHJGjTQZ/EBYvdltjhS+xWwJYE5iBSEogKfdT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(52116005)(7416005)(376005)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oINI8BYj2Pjf2OVVSGQ6w0T9iBXjG9b9Jt6mLyvlVbFqar5g+P/kedoToj6K?=
 =?us-ascii?Q?BqduEznbFD100ULbM6c2kLQtDtJPD5em0ymAK6pAUUAEJtaUi53lVe8H6me8?=
 =?us-ascii?Q?9VTE9ApwAIU5VW6MeUWtM4s3ilID2AE/HwNEFCdkg9jSsRLv83eceiwQ+AM3?=
 =?us-ascii?Q?3CYZSWXEG3M0dEcrL6vcGsbivl4HPWYlIs1wZFXEWpewu5y4yioeARvAfR+1?=
 =?us-ascii?Q?tlONQ3MRksHI6gMnh+XDUdBRfQZWQxgKlyQhIaMutW0cgFt+5sFxw0dM0qE1?=
 =?us-ascii?Q?Gncz57lIW6kRNFQqb0kEuTxSBXCvOMLn4LQ9UE64StmOuHm+1Wx/F03pr0IR?=
 =?us-ascii?Q?/XCsmDh5yg5vM/sJVSlm5VRfYFF8d35wXngve1zOYgUgB1NOG0qw1k5CE3WM?=
 =?us-ascii?Q?slxIfcEbKYnTGXlOQBXT/O0PzYqQQIcctqKDvy06DrCwqvFgO+NcXv4t9+qK?=
 =?us-ascii?Q?xARwZrYfVj+893wM46dlz8210R7Q7DL6mmsQWPmq061SyiCWOPvc9/Thp8wA?=
 =?us-ascii?Q?8uPp7kXXZ2D/ByDuPdBPFHn9zvgm0l+GS1JpyCNh3cFusV8I7r7nEUbdAlpI?=
 =?us-ascii?Q?nMYp3QBgtBF0aB8PFB4oswV79O1TtTV82dNFo9DSKEaEF8LIJKU5INbg6Zyu?=
 =?us-ascii?Q?WZ6ZQGw+PO+FTMDS5vPRJod28WADArSXq8gS3Y9E6zXg310x4jQEJKV9YLnZ?=
 =?us-ascii?Q?tHXGDOQk14DCxBhcn1JvTNWt8+REi0olzpuH4igre/Q6meH1XQxA+qeDKtgQ?=
 =?us-ascii?Q?iOYUR9lll80sRXUtfEEoumsXZMcEOEGFX4BWc12ZVyQkpCaEq39ES7RDCGiT?=
 =?us-ascii?Q?MfbytNcos5T5GPliEZcYbZgc1GGvukzzFjk7f29n51p6uXtVEncziZzBbV31?=
 =?us-ascii?Q?yV7FOMKxH0LGyCqC0t6rCII+7a1gCfd3smL6a+gjtXlsCvWGTD9z7GSgJqpo?=
 =?us-ascii?Q?B/Mfjg+WHk3Wa5XJeiTYtXYwnD/NbC4AQb+RNkhTtay4DhJXRsDSy5/eLEi3?=
 =?us-ascii?Q?8Mqnupqz8xcobC7lsSM1ivuZsx6nKbmKaYPAnZX8vYF38aaI5u8Uzjf114XV?=
 =?us-ascii?Q?1psJUrs2/dnf/jId4Mzhpgx0o3/N255YsOXA0GHbP67dK9yhTUDUxOvY2e+9?=
 =?us-ascii?Q?gcRMegpTWTNU37hvmZwfZc1vAZlxmMsJVP1McPDybjK6W+lPC5JvrIGOeggO?=
 =?us-ascii?Q?hiP01mR4EMFbo5L7g3hiz+M84CD4uMSm0c/o0DvtMuWEhxPH/fqwv9ku5cv1?=
 =?us-ascii?Q?Qe2cuzkfIXd2iSDfR2wUXrCet/zAVLFx2lF2274ZYZY+Ne5rFV7Dm7M4QSS8?=
 =?us-ascii?Q?LBK+RBcTE6Q9BmZ5ZFaOaso9MiNt2PSsbLntAFG4rotcleMqUmxF0MbVF/70?=
 =?us-ascii?Q?CPQyPngiCkiXhsWX6HUdH0HO0qAFc3jimUniVYi6hXijneVbO4EomK9DpRST?=
 =?us-ascii?Q?H1wnUH0TaMTtsOWdGOMtWGY+8gMuUrVgmHfytc30woTmyAKOCsd/a1kbrGXA?=
 =?us-ascii?Q?Asmwi33GmFj/MoNieCf5EY0tuhRbD00xxmAqzzULJrepHN0r8L3qyVCtSuVb?=
 =?us-ascii?Q?8LSGe1VLZa3xC7pLPoeO3FPLb9UikLTAXvFkq1XlQ/rPf5yVdRie1TDMP5G6?=
 =?us-ascii?Q?58bNRGCrTnC5vmIhbWqNvG8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f02879f-cf94-4578-e809-08dc51def17e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:01:55.7289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2315N+aZcZNAN4ZGyghHX3HaxqVrO9BXqHu0k31a/GT6khRiDbLblkMXuJtvsi5vwPCA8a+i2wE0y7pPNRWjls0u/472mZy5ARWLUTvZcIcvgVC4cS9SVwVWQtL8UtUr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9325
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
"MultiMedia" (= Helge). I'm not sure who handle these.

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
2.25.1

