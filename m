Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545B19C52A5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 11:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFD510E5A6;
	Tue, 12 Nov 2024 10:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gLvpStHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2055.outbound.protection.outlook.com [40.107.105.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5179110E5A1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 10:05:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6AAgoKDKSnguLZ3l/DEfvNwBGsHOuE//6mwIH4ZCFgRa+6QnUe7yxaLugJP6skxsMLYfL4+FAuZGCCEBz8ntrBCZxwKmJMyh0xzh7BAzcH6nquoPf+du86TDSc82r5rEjE1t8CQVubn//Z9kPKxdio5PBwLMHdV3zhrfED3HnGu2Q20VbXuNy+ZMYym9ehJSxsdTWx6txeXD7gXRfIPVQLIZ21+c9CEeImETNX0OpsijISMLNrH+AhzS7I5pKU1PPlQj88XAkJUcGl8tPRTmAhWp56kqZEF+7oU4fBCn2FDaOxhpHtlRJRZBD8l2gO8Vhez+P5Omxq7xzCCWJDzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ea+q8vRGx6EaSlkwZ/WcGs86As277ASmEopUEt7SXmo=;
 b=cuc1j1OI3c4DM83HFpol+ytAvVJGyAwZjyyqxF567DppYua37wHJQOh1F7QkV25TAfKhgGv9vUQXK/9rPQBbRwUMzPOiTF8DYlms1ec9CqBao4RXT67dBt6Mb1VM3EoaezN69rrp1bXLaHw6hevSacCMPUdLb2I4Nb2fEX220Sm0CuQKygwP2xjjSPDcj+qrMv+Z0uiVVyfvEJwRSnV45AyyN/euzxJ9+2HrLMju0bbLGjSjCDpXO43o1/eHDODYtjBquIiME/h02YkwThKce/dRQ0tCPI9/OK+SYqw4fsSCLo+vJx+Dtbv0Tk2AmR8QdtoPl7IPQ3ZNDmcrtH2CEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ea+q8vRGx6EaSlkwZ/WcGs86As277ASmEopUEt7SXmo=;
 b=gLvpStHHCgwpZ8dhzj7aLbzWJ6dMcggPROU8lbo8tT28n3X1tBEfZnyWZem1rTd13DIfbXI3yp8Jx+/vmI/maxX6XcUIlGot5KSRZXBSf9PPQ0ELD2NwDIwAZ1jKlEW6aJ5h7ShLqetxfzodEZFAdeiMGIkArCUwaPJX7d7+46xR0nNnqhbKecJnGrIChViMq7sfy2NGjrjc3QRkDB9jKo8opcakcyvs1quMDieT90vhqVdv8LnF/jLFEmFA0NcH2ut+8VCgom3MQsANfjPAhiSrFuKmQvLJCxsvFqwheAQrufQmn+5KAQR2F3pIJx+myB/SoXvWWls1kmdu44+o0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8256.eurprd04.prod.outlook.com (2603:10a6:102:1c6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 10:05:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:05:44 +0000
From: Liu Ying <victor.liu@nxp.com>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 marex@denx.de
Subject: [PATCH v6 0/7] Add ITE IT6263 LVDS to HDMI converter support
Date: Tue, 12 Nov 2024 18:05:40 +0800
Message-Id: <20241112100547.2908497-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:3:18::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd76fc0-cd46-42e5-3dd1-08dd0301927f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+zpbm8cTF6ZropPWjxBCZsSFQFouwRaOko9OVynj2nb3c0aQ3yzt0s4vLNSv?=
 =?us-ascii?Q?/RAicayWY6wsc7FBVfmvYjniSmao4hvzYgP6gKZowbS9SJdrZqoW2ebTEP3I?=
 =?us-ascii?Q?a5meLjw024QpUCL4uh81hb/jKW2l6cdl1xlkBbnPWbi/qvPy++Hl/Cu//HhE?=
 =?us-ascii?Q?N+ccyayDNPZEGqfHYEZiqc3cRMO4osJyQE4AIjAdxzZR/n4i6FJvVMxkauBB?=
 =?us-ascii?Q?hSPZRb/df1QXc1RWqEOrTlys9Tbhw647G0Rx5gWu1qate569BSun0J17ENmG?=
 =?us-ascii?Q?aaF9M078Gzi4gzBU/czxAVnE0s9lRcki8K3AM32QWEImznbcZzoPKwKj7+Ok?=
 =?us-ascii?Q?y+Ykr82dBBkteTTs6yonKds/5lddXhqoAgKJh8cg3r77fT2o77gOiT0VrTPR?=
 =?us-ascii?Q?q2d0pjIIGRXWvo3tfFs6EI+IL39YFLq6GqctFN2tLnDpfBEq5s9iP7GTIdMw?=
 =?us-ascii?Q?a3YuoFKFz3dYZPjjeCd5ovyvOJbj4kehPl2UFHMXQMWf/tyZ+7S2Q+NXF894?=
 =?us-ascii?Q?myoahvMJjMquR5Fdcj6Ij+W4iXiDHMUcbHn8mOStl8txVrdECgAsyPAaUjGo?=
 =?us-ascii?Q?mh2pMA1HsGWf+teg/A1pB3aPcMvsI0EahmvJAT1p1gq3P08etC3Jg+OI/2Et?=
 =?us-ascii?Q?SxxApX0uDWgiD3fnbJ4Aa9f2vImRZHf5knMbj7Lq2gtAKMawt4tEmnlsWW2j?=
 =?us-ascii?Q?tsriDhuE79S8PopzgXTygHYbDK1oX716jX+J3wmP+/PnZcmi5mDS2xDpzSJt?=
 =?us-ascii?Q?AnlRJqGmfzRYdH4uoeAc5jz/cCCRdvLXctwWNkSFckj9ox8eAybYNdoFzutt?=
 =?us-ascii?Q?wiWoM3rQKEjBOyaVabFHx0G3xcSR2SsGZOQXdzvbJyOWcd32aVadaMxj5xOG?=
 =?us-ascii?Q?NGvDTxc3YiTsmrJ3nwaUHfKOeqtzujM8RBmYiRpZ1WMoX8FGuSsawKyZ6idN?=
 =?us-ascii?Q?Obw42Us6FRailleZhLy2YQALVqI4/uK5xLMiG2/iGKhtMxh5QVx02MvJk4rF?=
 =?us-ascii?Q?XbSE4Gpafq4R0Gu+Ka8uG/KRDirEJQwNb3QFKKW0BMGz4wU75Wo8q4aiqVcW?=
 =?us-ascii?Q?oT108vBjUnpiO+TwxSqCf5NAhs0CbscMYKoSFaA4LC3cOTbLvOoGm0ht6l9z?=
 =?us-ascii?Q?rSZJop9DGUCg1ZLeDIpltvEAHOQT9+wUaxxwBuiqTyTduW6OnLZkEH1BDqJQ?=
 =?us-ascii?Q?vjSWbij/7X1ULTVHAiJXFw+NZFx2IY7sKdt/+hNq/v2ItFMGJ3wSbpsuiDtq?=
 =?us-ascii?Q?kpIi6TIoUEv1wclpgbFaVRvhRurEotAU/XQqihq6hZItkwlDd5SU2drqLTcz?=
 =?us-ascii?Q?Y1Ofl1O5HVUUXLUh827LPmRm2Qe9eHMagjzHTGVw/zN38g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kOaJYMDJbvqK69EV4SnV+kIawrJ6SwN9qkae8Rwi3ORe2a+noQH9jl09QhxG?=
 =?us-ascii?Q?XVjLeEs/W3vDwyBcGBpjXpEoj5K9v1xKjlDaYk5/y1Zuks2YOxm4VS3XX8mt?=
 =?us-ascii?Q?HQJ+vgh3e10+uTJXRcjtdN/ohGRQdDfLu/uUwQTlsdlx3xCFtg469Vuqx0MS?=
 =?us-ascii?Q?U4O2v0p5GEmSHLDkYkBqNMdMUoBMIzDtVzp+3TSsW2XterRaefm+DOwVJXu/?=
 =?us-ascii?Q?Yt95DTmGao+OjXgQPmBPmT6vXedjkZLxu1gsjFmBRNOggsn1NwIgyDbLaekZ?=
 =?us-ascii?Q?voCgdZP/DErO6g2lsmzeS0aJHW4g0psErdKpzf9lLyS8o1eNmd/0EkxnJOE2?=
 =?us-ascii?Q?a9lbj+85gmYagyQkjrqkTwcTgCiUDxBfNgpan4Ko3q/kdxuFzmgYFT1MxClq?=
 =?us-ascii?Q?6weNEHxsly9CWTC3ov6WCgIhCBMqk76KpmoXn0jhT6mLcewJYpsIS9BAq9SA?=
 =?us-ascii?Q?s+CBrqN/gS8gmq6Sq1NesEEjg+NqcU4VLKDijcsljnO++P4st0VUkcWzktjp?=
 =?us-ascii?Q?BiuW0KuUzv+MjlII2E/CEFbQOO7CTrLvFG5CmDmsEoT6JyX3YVdQBFVvOpmG?=
 =?us-ascii?Q?AZeusfhZnftRNU/vmEu1nlFv0Xi8S0MP7uxbFPnHUx/3A1drBzI2jSMmrsNg?=
 =?us-ascii?Q?6XvP3UbCTbo5rEJGijm4i8SuVxQmKdrF4vl9ObDuEIgXUEV4Dgdt3fvlrobi?=
 =?us-ascii?Q?eFvPFfRsd3L9qpMhK2K8YUAdHJeQ5Sos7wmucuwkaq+z9Q2U5AFhg93ed4uC?=
 =?us-ascii?Q?I2xpQ6RrySHZxbIKl/DUzHnqi/I7yvq45XPETGY8csWuCtjygLcPD9LblP1b?=
 =?us-ascii?Q?L1JVkBW0KBipu4fT7mdNFAWPr0VaOGXBuevBg4lHGXjXIFwI+JwQ4BAzu6lQ?=
 =?us-ascii?Q?/49opjBGMoRo8Vh+KWesNiDip7z9isGggRR1301kFEMikqY5OtUuoOBbiYki?=
 =?us-ascii?Q?e4lBmKXGUL5snW68Q9tJO0HDtTP38viWaCRtLg31I+kT8LDTWTizifNUF93g?=
 =?us-ascii?Q?w0Few0vkrO8Iwuf+A1+fxJs5gmPZR3CbCWFRG4iij593xCygKKTbACFTVdeL?=
 =?us-ascii?Q?yd4GovPLKIBiqyQhf7iMuc6E56BB7+PhyLwsmOKhAbKZzbfB5x8oKjM5Takh?=
 =?us-ascii?Q?JPGaeED6HMHQy3TJfOGuYo2lGZXz6ZMXr5XTvwckMZl8xWlV+FdWdmZrv3uW?=
 =?us-ascii?Q?ttlUaJF3t9gXColBtbJtDTExSf79xGxSG7Z3qhhoWwBi5C31QRrqNv6GVniV?=
 =?us-ascii?Q?EFHd2nEe2H5Rh4eGSqkkhizlUIRPR88MAywxc58two4BCaAiXIF8+wqEgBtM?=
 =?us-ascii?Q?Wp51cPfpqhHL1yHNX3xXVdpsgVYRePIbbJHsmJwNdj1Gpf0sTLsSpLNnjEBZ?=
 =?us-ascii?Q?/PwRvwdVRm03eiHPG8mMc98lnU3RhI0+WlJA9Qa8t4z6yXoy9eDTTaMTQbbx?=
 =?us-ascii?Q?gLtSLOsPAPWkg6wP9YQdSQdldbUbHFzf9nGGECQkCxBOdWNIPr56RRtcNjry?=
 =?us-ascii?Q?BZT92DaxdnPCE+eCEh6I8Qf+aF5vzGU3ER7fgeQan3yfkS0Sh/wZV41A8Ysd?=
 =?us-ascii?Q?E5A+6hGK2N363RbPqElEDbG1UWzGvtH5493GvfkV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd76fc0-cd46-42e5-3dd1-08dd0301927f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 10:05:44.6417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaNFUb4eVdfWoOzpEN1sAM4+Ar3os+r11o+wdBCEgxxdS7+Mgb726VEoxA6YMsyWsTc8W9eMJUAsWhJTM0IVyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8256
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

This patch series aims to add ITE IT6263 LVDS to HDMI converter on
i.MX8MP EVK.

Since IT6263 DT binding and driver were picked up from v5 and landed
in drm-misc, this patch series contains patches almost all i.MX8MP
SoC/platform specific.

Patch 1 is a preparation patch to allow display mode of an existing
panel to pass the added mode validation logic in patch 3.

Patch 2 is a preparation patch to drop CLK_SET_RATE_PARENT flag for
media_disp{1,2}_pix clocks.

Patch 3 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
the next non-panel bridge, that is the IT6263 in this case.

Patch 4 adds mode validation logic to i.MX8MP LDB bridge driver against
"ldb" clock so that it can filter out unsupported display modes read
from EDID.

Patch 5 adds mode validation logic to i.MX8MP LDB bridge driver against
"pix" clock so that it can filter out display modes which are not
supported by pixel clock tree.

Patch 6 adds DT overlays to support NXP adapter cards[1][2] with IT6263
populated.

Patch 7 enables the IT6263 bridge driver in defconfig.

Note that patch 3 and 4 depend on patch[3] in shawnguo/imx/fixes.

Since this patch series is related to another one[4] authored by Marek,
Maxime asked for a proper description[5] about the exact problem.

Admittedly, it's a bit complicated.  Here, I'm trying to do so and explain
a bit more.

[ Description ]
It's a clock problem about shared i.MX8MP video PLL between MIPI DSI and
LVDS display pipelines.  The pipelines are driven by separate DRM driver
instances, hence there is no way to negotiate a dynamically changeable
PLL rate to satisfy both of them.  The only solution is to assign a
sensible/unchangeable clock rate for the PLL in DT.

Admittedly, sys_pll3_out can be another clock source to derive pixel clock
for i.MX8MP MIPI DSI display pipeline if a particalur i.MX8MP platform
doesn't use audio(sys_pll3_out is supposed to derive audio AXI clock running
at nominal 600MHz).  However, for i.MX8MP platforms with audio features,
the shared video PLL case has to be handled and it determines that the above
solution(unchangeable PLL rate assigned in DT) has to be used no matter
sys_pll3_out is for display or audio, because the separate DRM driver
instances really don't know if they are sharing the video PLL or not.

[[ i.MX8MP Display Hardware ]]
i.MX8MP SoC supports three display pipelines:

 -----------------------------           ------------------------
| imx8mp_media_disp_pix_sels  |         | imx8mp_media_ldb_sels  |
 -----------------------------           ------------------------
|  osc_24m (fixed 24MHz)      |         |  osc_24m (fixed 24MHz) |
|*-video_pll1_out (video)     |         |  sys_pll2_333m (sys)   |
|  audio_pll2_out (audio)     |         |  sys_pll2_100m (sys)   |
|  audio_pll1_out (audio)     |         | -sys_pll1_800m (sys)   |
| -sys_pll1_800m (sys)        |         | -sys_pll2_1000m (sys)  |
| -sys_pll2_1000m (sys)       |         |  clk_ext2 (external)   |
|  sys_pll3_out (audio ?)     |         |  audio_pll2_out (audio)|
|  clk_ext4 (external)        |         |*-video_pll1_out (video)|
 -----------------------------           ------------------------
             ||                                     |
 -----------------------------           ------------------------
|   media_disp{1,2}_pix       |         |        media_ldb       |
 ----------------------------- mux+div   ------------------------ mux+div
             ||                                     |
 -----------------------------           ------------------------
| media_disp{1,2}_pix_root_clk|         |   media_ldb_root_clk   |
 ----------------------------- gate      ------------------------ gate
             ||                                     | (LVDS serial clock)
             ||                                     V
	     || (Disp2 Pclk)  --------      ------------------
	     | ------------> | LCDIF2 | -> |       LDB        | -> panel/bridge
	     |                --------      ------------------
	     |  (Disp1 Pclk)  --------      ------------------
	      -------------> | LCDIF1 | -> | Samsung MIPI DSI | -> panel/bridge
	                      --------      ------------------
                              --------      ------------------      ----------
                             | LCDIF3 | -> | Synopsys HDMI TX | -> | HDMI PHY |
                              --------      ------------------     |     +    |
                                 ^                                 |    PLL   |
                                 |                                  ----------
                                 | (Disp3 pclk)                         | |
                                  --------------------------------------  |
                                                                          V
                                                                    panel/bridge

* video_pll1_out is supposed to be used by video outputs.

- LCDIF2 + LDB can only use the *same* video_pll1_out, sys_pll1_800m or
  sys_pll2_1000m.

[[ i.MX8MP Display Drivers ]]
LCDIF: drivers/gpu/drm/mxsfb/lcdif_*.c
Three LCDIFv3 display controllers are driven by three imx-lcdif DRM instances
separately.

LDB: drivers/gpu/drm/bridge/fsl-ldb.c

Samsung MIPI DSI: drivers/gpu/drm/bridge/samsung-dsim.c

Synopsys HDMI TX: drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c

[[ Problem - Shared Video PLL Between Samsung MIPI DSI and LDB ]]
osc_24m, audio_pll*, sys_pll* and clk_ext* are not for video outputs,
because:
a. Aparently, osc_24m runs at fixed 24MHz which is too low for most displays.
b. Audio subsystem may consume all audio_pll*.
c. sys_pll* are system clocks which are supposed to run at fixed typical
   rates, e.g., sys_pll2_1000m runs at 1000MHz.
d. sys_pll3_out is supposed to derive audio AXI clock running at nominal
   600MHz(i.MX8MP data sheet specifies the rate), see NXP downstream kernel:
   https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx8mp-evk-ndm.dts#L19
   https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx8mp-ddr4-evk.dts#L25
e. clk_ext* are external clocks without known capabilities.

So, the only eligible video_pll1_out is supposed to be shared between LDB
and Samsung MIPI DSI in the two separate display pipelines if sys_pll3_out
is already used to derive the audio AXI clock.

With the shared video_pll1_out, drivers for the two display pipelines cannot
change the PLL clock rate in runtime, since the pipelines are driven by two
DRM driver instances.

[[ Solution ]]
Assign the PLL clock source(s) and the PLL clock rate(s) in DT.  Disallow
display drivers to change the PLL clock source(s) or rate(s) in runtime
including LCDIF driver and bridge drivers.  With sensible PLL clock rate(s),
typical display modes like 1920x1080@60 can be supported if external HDMI
bridges are connected, and panel display modes can be too.  Also the unneeded
CLK_SET_RATE_PARENT flag can be dropped for media_disp{1,2}_pix clocks.
If needed, bridge drivers just call clk_round_rate() to validate clocks so
that unsupported display modes can be filtered out.  Although the
unchangeable PLL clock rate disallows more potential display modes, the
solution works for single/dual/triple display pipelines(OFC, hardware designers
should pick panel/bridge display devices carefully first by considering clock
resources).

[1] https://www.nxp.com/part/IMX-LVDS-HDMI
[2] https://www.nxp.com/part/IMX-DLVDS-HDMI
[3] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241017031146.157996-1-marex@denx.de/
[4] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=896900&state=%2A&archive=both
[5] https://lore.kernel.org/linux-arm-kernel/3341a6a7-ac0e-4594-a670-b3a6d583b344@nxp.com/T/#m587e6a25bdab542d5d99abbf01caaca89495b1d5

v6:
* Drop CLK_SET_RATE_PARENT flag for media_disp{1,2}_pix clocks in patch 2.
* Get pixel clock from display controller's OF node and validate it's
  clock rate in patch 5 instead of taking the sibling "ldb "clock as
  pixel clock in patch 4.

Liu Ying (7):
  arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set "media_disp2_pix"
    clock rate to 70MHz
  Revert "clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure
    parent rate"
  drm/bridge: fsl-ldb: Get the next non-panel bridge
  drm/bridge: fsl-ldb: Use clk_round_rate() to validate "ldb" clock rate
  drm/bridge: fsl-ldb: Use clk_round_rate() to validate "pix" clock rate
  arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter cards
  arm64: defconfig: Enable ITE IT6263 driver

 arch/arm64/boot/dts/freescale/Makefile        |  8 +++
 .../imx8mp-evk-imx-lvds-hdmi-common.dtsi      | 29 ++++++++
 ...8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso | 44 ++++++++++++
 ...imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi | 43 +++++++++++
 .../imx8mp-evk-lvds0-imx-lvds-hdmi.dtso       | 28 ++++++++
 ...8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso | 44 ++++++++++++
 ...imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi | 43 +++++++++++
 .../imx8mp-evk-lvds1-imx-lvds-hdmi.dtso       | 28 ++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  6 ++
 .../imx8mp-skov-revb-mi1010ait-1cp1.dts       |  8 +--
 arch/arm64/configs/defconfig                  |  1 +
 drivers/clk/imx/clk-imx8mp.c                  |  4 +-
 drivers/clk/imx/clk.h                         |  4 --
 drivers/gpu/drm/bridge/fsl-ldb.c              | 71 +++++++++++--------
 14 files changed, 322 insertions(+), 39 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso

-- 
2.34.1

