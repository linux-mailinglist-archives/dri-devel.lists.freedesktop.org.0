Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FFEB43354
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1956F10E053;
	Thu,  4 Sep 2025 07:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DFAwFoPi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE79110E053
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 07:06:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRr10+k6fHEfuyoMeHW01s/LYCVD+jjHjt/T/ngkFyk9DIIC5ffpubTGmeM64l1UazWn+BMTQPvoeO1RMf93CWQ1aJ/ArwmHYHkTSuZ3EFb8NetIsqGf1FkRd+zkKnbYJdxq5kcLMsnYokksb9vCPH0LF0M6B818mhWSQPQwWyB0u1bqfmPUQB/rtQ3tQK+7b3ohG22jikc1HqeGRATHqLQ8jyikraYex5Al/qv8bqvn2rXK6hQcnouJJgAr7ORk6Mp4tPtabFl8waaN1rAOfNdhwahwvW713miHyALXu1tkEv3JI5+NGajWXjXJ+iPOQe+uAD/WMkZZ4MiFd14gpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RG4ubNH7+DieWFZx7HpdIpc6Wtmn8ks6ugIT99hjjlw=;
 b=gST/QBoyjPzudiZAfqe2TqMYU1xFew0IJpif5omZknnyW2WrX3npzhTCUjwmPF1UgKZGz66eCvs7xaZraxwqJNEl5XllfB70W8H3e+frwlaxYLnI/WLJRGyEo7KpNKooVaC6jzzgYT0s0dyrFz35iqOTISk7sXR9bgA+z6Uu67SpPp2uPhGnUVIKKJdgBqaqP6QqrrXVfBxQLHns2gYpdx8euQTjwCSeBeodZeZmY8HyuoZZnpUwDcHIR8UCdfEPu5NrKo1GhYs53oTdcveSCeddbk7JjlkBWNJgMD6ksmhjOsLZUJZJLoKJFDas2K1sbpnqlspQOLFJoun4siko8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RG4ubNH7+DieWFZx7HpdIpc6Wtmn8ks6ugIT99hjjlw=;
 b=DFAwFoPij1kOMKIx+HPNtrpEOtzDVAL50RiZOqBLZ0tGF8NAz84L9vBGzZseB5S/q8PippO+CA7fzf+JTSSHgbXGOzjIVY9GpPzrLdzxBtACEmcSssxnSJzHQs7xp081b0u37dtZtbH4TNcmpTtAkTayW0utf46QTs0Du30G9RHTWMyyjbWR9205I5VSnSfyPr+VG5dEkRq1gWe6YFUYk75eWNl2LUkYDO9CSZ2pTqXlhVRXpP2JV/az5mD57+qIW8Qi0L41MH/rjz91YL7rOo0pIq7kZI071x8lu/gP2ozaMteQK+Lv/zCLVHU5lDD3RhGi7DC8TFWMRnrmu1xMwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7002.eurprd04.prod.outlook.com (2603:10a6:10:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 07:06:30 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%6]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 07:06:30 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v6 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
Date: Thu,  4 Sep 2025 15:05:53 +0800
Message-Id: <20250904070600.1361165-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB8PR04MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: b929a883-09d7-4a3c-8d83-08ddeb819273
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1slpSYycDT75rTaogjLoGQIFPVg0foi6s4qXZV/UVESq5VjnUPcLlqVLp3Ho?=
 =?us-ascii?Q?2tYAGFBn4LxPMf6ImjfylK93QnNyMX4hRivhj4deOPt8mTnjmukEfLiTj1uF?=
 =?us-ascii?Q?dVnoh+qV3feoG3seLZfTeR+MYL7LpTPSMRyXDA0ZySLa68dWSuCOVD5C+LJG?=
 =?us-ascii?Q?ltPT3k//YtzLXC+giiCibd5MWVZs9GR3CHQdzyE+STePxCW+IFkp+hO2+7kl?=
 =?us-ascii?Q?nWBzGiukpRBKSwmJ90FyoDPlojZcT5YKngmTS+l8cSsMdq26AkZQR6wA5WrT?=
 =?us-ascii?Q?jx/rKIXA9l+7cwKGwBr+sWAqSszNPKE1+YCUTRrsCkgUODtUiK14UfodUpYf?=
 =?us-ascii?Q?WZdlub9MhT9d/4Ca1IGq9+slbGmH5if9w1UY70yuuV9tona8ihvdqImgHQo9?=
 =?us-ascii?Q?OfOrV17Dz8/J//v/Itgk863K/wTlPBnqUXqJDG2z/L3nLnrQnqQW+wUC1yx3?=
 =?us-ascii?Q?4QcXzZASFRjl7+1jQH0ebnVKqF589l2whushjy2sCCo7r77LVI1Bbjx1+bfa?=
 =?us-ascii?Q?x3/1dyn/K8hNEvZ53CMx2e01KgobaXEDHBG0mllcsAM5vFB9ZJ8PGWhYBLAh?=
 =?us-ascii?Q?c567NrKkkDe4YVG8K6DN3yXtvrqstHgAjLBQ2+oBTPPW9McALkDbieeencLF?=
 =?us-ascii?Q?roNx6+A0UGpFoIfzm/55SPaPPJ3EihnIPoSEXK+xwhspOQAHeJSA92AEVtSi?=
 =?us-ascii?Q?1Jg1EfKGEODvl9XWhSC8o56H1LqXdzTtljw0n1LuC7/Mehio99o4fNCkeOgk?=
 =?us-ascii?Q?2u8PvN8zrUvW/WxSGsWgTzhsCkjiFhMsa38/KER1o7oQdk524W2isaNZEZVh?=
 =?us-ascii?Q?QuXJabHa4CtrF1L/PHhnShq9iYlL4ipQzEhlJZ4vs2Z46DscN8qWZHOsStxl?=
 =?us-ascii?Q?R70FKHeGl9IZrOixkMrmB8Mn5RqL8O+r2F+uuHrAa3E6+YmCWIa094lceM7Q?=
 =?us-ascii?Q?L5w2BgF6t2CJEklDSR2Gxo3yUnPXvdPvvKbMQ3Ik21lzexoYUr14nJBm7izZ?=
 =?us-ascii?Q?D6NmCCEZGmy3lAWvn0zlzeef0gvVL2j31m7jNYm2/1g1GgFeg/3vU+G0PaQz?=
 =?us-ascii?Q?92yhBJCtfXaLYTgZ6nfS5BTi8Ha8IAsjB/amksN4h0Lwq9ceRLf7Noav+usO?=
 =?us-ascii?Q?KrV8R7TjqWjA/JnPMuX8L58LuxCJbUsv58HboVY+OH5UhhQ8iJFCmmg17zeo?=
 =?us-ascii?Q?gWI7QjyCMjAua8YLnsm7Ac5P/QrqLjFgBrt4iSxRtaLGdAgpWGRs3WzsZwvz?=
 =?us-ascii?Q?o2LEdX5Xxn2SuzuBpY2xjsmMfVAVm+SUYNk1C4pWTWXhFx7DhDJLj9Mu/CPv?=
 =?us-ascii?Q?cjbv9Rb2Wk8ao1b4l78xmja8VWcaF6DBXDp1xdIuGMDip0XSkBEPyZezCNSs?=
 =?us-ascii?Q?ewFQqDHNc0VVPoYaii7fMLU8mRnaIOWjVULok5Jz3JV/0yGp4dNNO6UvHyoE?=
 =?us-ascii?Q?bbrXdMqDzm4cvyqVqJ7kfhQL3q5/1VZVkufenvQS2NtTiWWGOIUWdJQe7qVK?=
 =?us-ascii?Q?3vh2UWmOzbg3ZU0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2UQt5g5cFvtlUhY5c970A8k5KWN5q9eTZIJrh4UBnc3hMPM/R1DgzpKMUcfc?=
 =?us-ascii?Q?v6zXbCmA+i4+x0UqGjzX4IDu5yT0Nv5sW0h49y79eUyCm9wvNpBscY7XyOwP?=
 =?us-ascii?Q?rYPFj3norWWf3NbDuttwZk45VsHvZRolrEwwZzejCipYqx/DftrNgIOxvl5D?=
 =?us-ascii?Q?eGJKgBVMjT0glIa/WQIPspXkbNqHAXZgLYVF976vQSaMkuvgcxNza5w0gZtw?=
 =?us-ascii?Q?D99PQgQVq73nhGO4B07jLgQYhdPAtnzCDenGXkaWiGDH6F3WFozgt/BhWZvW?=
 =?us-ascii?Q?Vp0R17EVNtDVIlvKrLpYpByqGBXb0Sd625hCBTjHWH9FDisqzcqasx1QL+S6?=
 =?us-ascii?Q?nmYkxsChVG82IJGAvlhk7iJJymyZC75rMTDSYvYFqypWg+/tNvWPKakqJlWg?=
 =?us-ascii?Q?Uuzl1be/C8ZUzODec1rgJNg/lWCsskVixxiJxQYKZ53rk5oMdtKDLyO/KqpP?=
 =?us-ascii?Q?fr2MQtZLCr1aWcO/IEgIr7gFxY++ayNgq7BHqKtKGkTzN8Vhw3F3UiZbtYgO?=
 =?us-ascii?Q?E8PiQ3oMVu4ApoaC+Fh/SRxSLXiJ7nefGzh1DUfSuXLiCtmyyUi7Xp7DBUhP?=
 =?us-ascii?Q?NGO8lvc6H394BtxPoaVB5i6rxTv/875i5//IIY72eVd4oNi09gDgDfxAxdz4?=
 =?us-ascii?Q?AhoueezTWn3Rd0vBwfuTdCMjjWlaSK5h6MiY8EzMXs4ASU0EATaFkuZTNmqS?=
 =?us-ascii?Q?f3GewKW2SmvhCZ+h4tZLAn+d1LHdhP1lXaJGpmnknAEM0rGjvm2A/JDGOpdA?=
 =?us-ascii?Q?xZ3iSbg0/Pok8qpKRF+aI0jRRFvq44gYn2LNmHBI0EfN5i5zGPqY5sVD4Tpz?=
 =?us-ascii?Q?nCiT3BRpG+X/dXYALoT/4SOTDz4j0K9TmyTwnOtr5sfFNi9MQmSa4QDIp22k?=
 =?us-ascii?Q?ca3HLFihzShjydfJ7CabNMhZ4vvcTkKKMkv93oYQgJcugexrf9vHjx4IxSgL?=
 =?us-ascii?Q?9kffVWhMDvgppzOklIVzLVOf0UiaCgt8vHa7S6OcZx9i6JCIlBaa1woFBJtR?=
 =?us-ascii?Q?r/8B+B/Hk5oKP5cnL4bMWCIlfuyyHgezt+vUtO4XyqoCNAuuigPTOECOv+aF?=
 =?us-ascii?Q?i2peGaI+GK72cxz8GpJoG7ZgzOvxRIvkLTtSTrkmvSCAjgJvidt1h7KE650W?=
 =?us-ascii?Q?R7oaI1GgyDiChgNYYgf2xF3xl1jT+pOxDNdEskVyhBK0Q3QfY58K0jyhRsxr?=
 =?us-ascii?Q?GyYZcEfgyzI2BgzdpEbLxM5Sqw+7Egm9eVgdFSaEfQjfzN8RTdVFBggHtpV3?=
 =?us-ascii?Q?f1WsWFMMTDFbuaaoH6VO+Hvuk8Gg0enb/cYGmAqC81IF1TQtaVJPz8+Pchc8?=
 =?us-ascii?Q?JdbAd6i+y/DkSET05GPhIzrqULislY7bLucsdD0A1Y8QaWvnUp0XWZb4XGwu?=
 =?us-ascii?Q?R0fZ5efU+GBF6941iUYcfC6JQKx9og4Tujj8kXFdQlbR1fxVUvJz06rzQEzx?=
 =?us-ascii?Q?K+Q6TWhpsJmN46UdBPIPK9cnsxN8ZcesWfz0JbhiOXpFUdfSSATRnQsGNYjk?=
 =?us-ascii?Q?5ZuFjW25kHImRfrW8dV8XxTu+45JZnuw+lUZYVpOEnMRpwGHf8MQ0UHFwMpB?=
 =?us-ascii?Q?lr8UnfpxXYhkhyM7aQJbeau8t9TBlPnQ2SJJ5vye?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b929a883-09d7-4a3c-8d83-08ddeb819273
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:06:30.0250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwjKaqVQNLwSt93i8CLAt2iBMxi9kjyv3pTYKifNF4Se04GzPDcI+pyHFHOxllGMr+J8knshsYPplwq+ODiMTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7002
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

The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
acts as the bridge between the Audio Subsystem to the HDMI TX Controller.

Add HDMI PAI driver on i.MX8MP to make HDMI audio function fully work.

changes in v6:
- remove mutex in dw_hdmi_set_sample_iec958()

changes in v5:
- add empty line commit message for patch 7
- remove blank line in dts node
- add component_unbind_all when dw_hdmi_probe return error

changes in v4:
- separate dts for soc and board
- bind hdmi_pai with hdmi_tx by moving some code to .bind() and .unbind()
- add "select DRM_DW_HDMI" to fix build error reported by test robot
- remove unnecessary code/definition in pai driver

changes in v3:
- add space and 'U' in asoundef.h
- add more commit message for binding doc commit
- add bitfield.h header for fixing build error

changes in v2:
- address some comments on commit messages
- add two more commits:
  add definitions for the bits in IEC958 subframe
  add API dw_hdmi_set_sample_iec958() for iec958 format
- use component helper in hdmi_pai and hdmi_tx driver
- use regmap in hdmi_pai driver.
- add clocks in binding doc

Shengjiu Wang (7):
  dt-bindings: display: imx: add HDMI PAI for i.MX8MP
  ALSA: Add definitions for the bits in IEC958 subframe
  drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
  drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958() for iec958
    format
  drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface
  arm64: dts: imx8mp: Add hdmi parallel audio interface node
  arm64: dts: imx8mp-evk: enable hdmi_pai device

 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  12 ++
 .../display/imx/fsl,imx8mp-hdmi-pai.yaml      |  69 ++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   4 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  27 ++-
 drivers/gpu/drm/bridge/imx/Kconfig            |  11 ++
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c  | 158 ++++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  65 ++++++-
 .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    |   5 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  16 +-
 include/drm/bridge/dw_hdmi.h                  |  11 +-
 include/sound/asoundef.h                      |   9 +
 12 files changed, 380 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c

-- 
2.34.1

