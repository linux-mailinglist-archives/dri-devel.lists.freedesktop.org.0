Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8834D7C7BF9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 05:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F2F10E58B;
	Fri, 13 Oct 2023 03:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2074.outbound.protection.outlook.com [40.107.105.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8819B10E58B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 03:25:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHduVwzo+6y+BT9uSayy6Q/Q/5yGqWZXVHAJcjZ7vo08es433we9f6pm+Ydazq4BLcN3+CMZUFjy9mC7IvQAfB/4ROlfBea1lkhW3YYUw7EKQJDK1Hd4kjxvgHYlSoErVjbFglKcXj8CP1v2PAQ5w+qdjuwkt2so7qipT0paaUC6wL8h3N91r370cTLcN/cwmtqg77nNcPchFROuf1upEzHJh6Pdq0yM+XMyh//o//VG8fNYBUOmFEbeJCWk3+LN5401Kj/Z0Zls/8AeCRNKFHU4YhOOeZRD8XPyPmU6keR10toCTI9wXv5TinG3pK1H21Rzj86rle/NMh0CHpY4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkUcMzvT54oZrVmKbD9jFzBMgS1Qtcgdd7sYJ6G/tmI=;
 b=GCBpbTQGfdaGHfzZ8RRsMmQIzv8FaJrWQi4pMUygiUoIAddf5fkk8ckSrFKAQadLfEJMQwE/nab0oNNGjV0Sxlqoi7luGtJsu9UWmcH+hILKEhdWLM8qzyxT33/3W+sYfcTjd4MojVbrcAb5LoQvL4ndb9IuG3P+lgxR1nQ+G9onZKDsD0VO3OwA3VOtRl8HGL3VG5m/MNqhhBZKuvBfpBouTtawvdrUZGMg/rkP+gvJbhyWp81mrMeRR0rHD+35yNyTm0g7XVrPbB1dLwUc+d47XfpWza55dfzRz4swvedqA+MI2i6Qwi9bVrx8T8jRvXFe9ekeBGjC3cC8d9Q/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkUcMzvT54oZrVmKbD9jFzBMgS1Qtcgdd7sYJ6G/tmI=;
 b=hsAXacCxKx+ewbrzivz1pBCXBcwM9kmnwLe3eLDS/4LgMjHF7UA/2J+6/b2cBalwGUBUP6E2P5CXUs0C/s2A8BehTCZsEaYiGTBIvyBf3LF4PQpGlmRWv6+7PsB5m5gJ5Ib5LvjGe5C8zhN3SOmvGZL6eZWLYDkd0EhaUwbGBl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6978.eurprd04.prod.outlook.com (2603:10a6:208:17d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 03:25:34 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 03:25:34 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v10 0/7] Initial support Cadence MHDP8501(HDMI/DP) for i.MX8MQ
Date: Fri, 13 Oct 2023 11:24:19 +0800
Message-Id: <cover.1697162990.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0179.apcprd04.prod.outlook.com
 (2603:1096:4:14::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cda7514-9aa6-4680-df40-08dbcb9c0fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VA7hzpqNPuWjBlhTOVPZaXWgmyGRFJFXlpLeCjB0aNQZkb4KmQIQ/Nir21ceJsHoWk11k7qBUzw3j6L3zJGQVthxkCRKpsRer7+CnyqwXPI2PBD7vGdIWCaisbI7ncqjUcZnzWERrpxYC/GqlGwTYLQoX7XmouX8PUqYdJuKUmshebH83YraFP/cVbnwSgiD7D2Spc8HDTpR1eWpHdO+BfiEixJKBMEAwCdMKvXxsVC1MFAyeNiqgfzX31VpWq7orM0/QUtYDtruStIQy9lItJe3TTgbx4Mv/6h86oSZ7tJN30TWWE0nm3S35wX11xMZDvec/IVoWiOhNJK9/+1Nx09up61Jh9qmZ5iPEx5esVp04Bx80uNQq2fBU4Z7lXcPg6ENf0ci2I+ROSJ6nmuNYlSrQJH2ZEyTTtKR8lP5q427HPxPg6A2IccwCtam21oor44BAT02sd30K7Qvuth8aToFST2LjpUqMlv9auzdPBfxcPwttCYGEvAU12XW4Ev01p0fixSJV+Cuiv3Jp0W63cUg3R3oFEvuunn631hDzz2BgU8huTyEzPZZ80hPe3RMNpKBUiEeRqnoeN+Y/WzuZbBZyQ5QQxOxzRQZN+IxOPn1Q+3fqzPOvs+Xuxb+cLOl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(86362001)(7416002)(921005)(36756003)(2906002)(38350700002)(38100700002)(41300700001)(52116002)(6666004)(6506007)(6512007)(8936002)(8676002)(5660300002)(478600001)(966005)(6486002)(66946007)(66556008)(66476007)(316002)(26005)(4326008)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGVoOERjOWtXY3dmMEdZQUtzZGNkRFpXSDc4V0lwOGdjdmJHWHpQZ2RmZ09D?=
 =?utf-8?B?b0REYnZpR2hHRERDVDBSUmhPaXU3T3JFRGc2eE4wVjQ5MHlmVUpSSWtDaW9a?=
 =?utf-8?B?VnBuNUd2WGtjWEZGdlh5SG5MRGVaUFYzR1E2aDhSclZpenRxbDN0M1hmOXQy?=
 =?utf-8?B?M01kRk55Q2d1RnBpc3RIVVkvdHQra2JrTmhuRFBNRkpNdlpwK0w4bzdrTWl6?=
 =?utf-8?B?MlJ3ZlRLWXJGR0JTVkdvR3dsTm9yZVZLeEJkUHVNdUlPNVl0MG0zVkM4NFFF?=
 =?utf-8?B?Y3B1Q0t6Ykl3QjFQaG1MWVJFQnVhR1M3ZHhHSEV2ajBsaXBWc0ZtU3lkQzlk?=
 =?utf-8?B?V1h2NWljeHhPRnhiMkgzcG5wNWZSQzhpcXRLaS9KUE5qbXhTZUZvZWJHQi8r?=
 =?utf-8?B?VWtmalZRMGxhSWt5d2hYU0xJSkQvNXRuZVptRVdMMlFES1hlVHB0OExvU1Vj?=
 =?utf-8?B?YnpmRkNtSnB1ZU9FUWVMOEZFUUpkQm9WSTFQRzY4aS92R0ZOZWdZWG9LcktD?=
 =?utf-8?B?U0c4UlZ5aDJlWmpPdStieXk0OW1vLzV4eXF2eTBZV0lNUUhVL0k0THpNUmg0?=
 =?utf-8?B?UEhNN2MwOWFON3RQNDNVZnROVjFxRXlETEVnZHdOYUU4cVpoclNhQ0FlQnoz?=
 =?utf-8?B?dlJTTDcvL09SVmdHYkpEa1VhYmFyZkZwMWY2U3N3emNCTGVJM3FzQk9DQW5m?=
 =?utf-8?B?MkpnOE5pbkczaEM0TlpuQmE5UzFxd1lIVjhxYW5YVlExQlVwMzVoSTBUWURl?=
 =?utf-8?B?ZjdHVGpqcVRFN052WG9GYUhydHBheXB3ZWk0Zk1mckNUTjM2ZFhCaC95SG5P?=
 =?utf-8?B?TzE4YVcza0NNM2pLaDR1UTAzc0hTOTV1VDcybXNYdS9xNUgzOG1XM0R5eWc3?=
 =?utf-8?B?TktCQjM1aHlyUVBnT0k5QiszK1pFOHZrOUNCS2E2S0ZqYmF2R25CTHJaM3lE?=
 =?utf-8?B?ZWdWeUg2N2VLeU5BNWJyczdGM2FwY0IzVVVPRzFmam1lYklsaFJGU3BML0dZ?=
 =?utf-8?B?YkExRTZ6cHczV21JQU9qQk1jL1lVMjNYdGU1UG9sMkI3OEVMbEdWWGh3T3hI?=
 =?utf-8?B?czBtZkk2SzkwVEQzdDY0WEllUGpxTUJEekNSR2FkQUpLQ01VRTliZU1DSnAy?=
 =?utf-8?B?RFl6T2s1V3pmTFg1czA5d2tJVzVCeGdFTUpFRXI5Z1JCcldSOUN6bnlXbDlD?=
 =?utf-8?B?SE4wSit6RnQybUtKZXNJRlIxdDFrc0htekxXd2RNb0VHYVZLcm04cFpPSUY3?=
 =?utf-8?B?aWR2ZUJkNUtBeHAzUWw5eHRrWHczQ2pJcDBwNzFJUHZsbFZqeUJSTmJRK05x?=
 =?utf-8?B?MlMyWlVyYk1PTkZBaWRrMFU0Yk1nN0IvS29aaDhrMVpaVU1FVElpZjJaYTht?=
 =?utf-8?B?bGV1a3BpTG5oa1RuRzFZVS8reUV4SkNxT1JBVlVxNEZBTUZnNUVvaGNCalc0?=
 =?utf-8?B?Z0t5Vll0cHhubHgzZnFiSnBUcEJxZ05qTXBNQkwzS2dmMzdGc2VGRjNFYXBn?=
 =?utf-8?B?dVJYVW85TVl6Sml6Y3Q2ek5WQTNseksxeXJrbFE5V05qSTh1N1MzQXVKaG5s?=
 =?utf-8?B?cW10UjdqWS9GVjJ3eS8vNlNYRDJFTEhWS3JkdGNKTVpSOVhzTEJwMW5BdExs?=
 =?utf-8?B?eDhsQ1dSVHdNamw1YUxoUzhZcC8vbW5lOTUrMzZyZENyY3FoSHMySnZGVGkv?=
 =?utf-8?B?dGRnTG04TG9nYlNHMldFVTZ1djNaRUZrUFh1a3BpSEpkb3ZsdUdlcWpUYk5N?=
 =?utf-8?B?K00welVYMTA1MVpUY2RMYm5FSVV3QmtMb0dlQVp2NmwxaW9GdG1ZRnJpazEx?=
 =?utf-8?B?cklJV0JqRElBUXhqWEF3dEVzcDBlWmZ6ZWJzZUN3T2REMXJ1anVxZmZhd1V1?=
 =?utf-8?B?WE9DbytjdXdRUkVkeUlESHlZMS9HSjExUVJja2NzaG1DVGRuT3FjVkVDckR6?=
 =?utf-8?B?bnoxOEptVFlOVVZWWUxrY25hYSt0cmgvbGVOekd0M3JKcXBBQ3IyUElMOTlZ?=
 =?utf-8?B?Wk5KNWNqa2tEck9RUGsrd1ZaM01rMSttbkdna0hpM29qUVJRQ2UvR3NJTndM?=
 =?utf-8?B?eVkxZDBvWG5vSFQrVnBoZUIwUzZWMWJ3YWdaOHJpeFh0dUpKSDhMY0gyRHNz?=
 =?utf-8?Q?QMX+65oNjnGjL7Jk1XBa5JPc6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cda7514-9aa6-4680-df40-08dbcb9c0fe0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 03:25:34.6952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4x6G8MpyYUUiFsoAyJkKNeuEuPBDter2ZJM/aTELnny5lvrCm9IvDr38ZTILksIhVNx1fZMbclFM1w7lK2ZxKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6978
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
Cc: oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, Sandor.yu@nxp.com,
 linux-imx@nxp.com, kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
drivers and Cadence HDP-TX PHY(HDMI/DP) drivers for Freescale i.MX8MQ.

The patch set compose of DRM bridge drivers and PHY drivers.

Both of them need patche #1 and #2 to pass build.

DRM bridges driver patches:
  #1: drm: bridge: Cadence: Creat mhdp helper driver
  #2: phy: Add HDMI configuration options
  #3: dt-bindings: display: bridge: Add Cadence MHDP8501
  #4: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver

PHY driver patches:
  #1: drm: bridge: Cadence: Creat mhdp helper driver
  #2: phy: Add HDMI configuration options
  #5: dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  #6: phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
  #7: phy: freescale: Add HDMI PHY driver for i.MX8MQ

v9->v10:
- Create mhdp helper driver to replace macro functions,
move all mhdp mailbox access functions and common functions
into the helper driver.
Patch #1:drm: bridge: Cadence: Creat mhdp helper driver
it is totaly different with v9.

v8->v9:
- Remove compatible string "cdns,mhdp8501" that had removed
  from dt-bindings file in v8.
- Add Dmitry's R-b tag to patch #2
- Add Krzysztof's R-b tag to patch #3

v7->v8:
MHDP8501 HDMI/DP:
- Correct DT node name to "display-bridge".
- Remove "cdns,mhdp8501" from mhdp8501 dt-binding doc.

HDMI/DP PHY:
- Introduced functions `wait_for_ack` and `wait_for_ack_clear` to handle
  waiting with acknowledgment bits set and cleared respectively.
- Use FIELD_PRE() to set bitfields for both HDMI and DP PHY.

v6->v7:
MHDP8501 HDMI/DP:
- Combine HDMI and DP driver into one mhdp8501 driver.
  Use the connector type to load the corresponding functions.
- Remove connector init functions.
- Add <linux/hdmi.h> in phy_hdmi.h to reuse ‘enum hdmi_colorspace’.

HDMI/DP PHY:
- Lowercase hex values
- Fix parameters indent issue on some functions
- Replace ‘udelay’ with ‘usleep_range’

v5->v6:
HDMI/DP bridge driver
- 8501 is the part number of Cadence MHDP on i.MX8MQ.
  Use MHDP8501 to name hdmi/dp drivers and files. 
- Add compatible "fsl,imx8mq-mhdp8501-dp" for i.MX8MQ DP driver
- Add compatible "fsl,imx8mq-mhdp8501-hdmi" for i.MX8MQ HDMI driver
- Combine HDMI and DP dt-bindings into one file cdns,mhdp8501.yaml
- Fix HDMI scrambling is not enable issue when driver working in 4Kp60
  mode.
- Add HDMI/DP PHY API mailbox protect.

HDMI/DP PHY driver:
- Rename DP and HDMI PHY files and move to folder phy/freescale/
- Remove properties num_lanes and link_rate from DP PHY driver.
- Combine HDMI and DP dt-bindings into one file fsl,imx8mq-dp-hdmi-phy.yaml
- Update compatible string to "fsl,imx8mq-dp-phy".
- Update compatible string to "fsl,imx8mq-hdmi-phy".

v4->v5:
- Drop "clk" suffix in clock name.
- Add output port property in the example of hdmi/dp.

v3->v4:
dt-bindings:
- Correct dt-bindings coding style and address review comments.
- Add apb_clk description.
- Add output port for HDMI/DP connector
PHY:
- Alphabetically sorted in Kconfig and Makefile for DP and HDMI PHY
- Remove unused registers define from HDMI and DP PHY drivers.
- More description in phy_hdmi.h.
- Add apb_clk to HDMI and DP phy driver.
HDMI/DP:
- Use get_unaligned_le32() to replace hardcode type conversion
  in HDMI AVI infoframe data fill function.
- Add mailbox mutex lock in HDMI/DP driver for phy functions
  to reslove race conditions between HDMI/DP and PHY drivers.
- Add apb_clk to both HDMI and DP driver.
- Rename some function names and add prefix with "cdns_hdmi/cdns_dp".
- Remove bpc 12 and 16 optional that not supported.

v2->v3:
Address comments for dt-bindings files.
- Correct dts-bindings file names 
  Rename phy-cadence-hdptx-dp.yaml to cdns,mhdp-imx8mq-dp.yaml
  Rename phy-cadence-hdptx-hdmi.yaml to cdns,mhdp-imx8mq-hdmi.yaml
- Drop redundant words and descriptions.
- Correct hdmi/dp node name.

v2 is a completely different version compared to v1.
Previous v1 can be available here [1].

v1->v2:
- Reuse Cadence mailbox access functions from mhdp8546 instead of
  rockchip DP.
- Mailbox access functions be convert to marco functions
  that will be referenced by HDP-TX PHY(HDMI/DP) driver too.
- Plain bridge instead of component driver.
- Standalone Cadence HDP-TX PHY(HDMI/DP) driver.
- Audio driver are removed from the patch set, it will be add in another
  patch set later.

[1] https://patchwork.kernel.org/project/linux-rockchip/cover/cover.1590982881.git.Sandor.yu@nxp.com/

Sandor Yu (7):
  drm: bridge: Cadence: Creat mhdp helper driver
  phy: Add HDMI configuration options
  dt-bindings: display: bridge: Add Cadence MHDP8501
  drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
  dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
  phy: freescale: Add HDMI PHY driver for i.MX8MQ

 .../display/bridge/cdns,mhdp8501.yaml         | 104 ++
 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |  53 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |  20 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   3 +
 .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c | 306 ++++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 316 ++++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 365 +++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 708 +++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 673 ++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 383 ++-----
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  44 +-
 drivers/phy/freescale/Kconfig                 |  20 +
 drivers/phy/freescale/Makefile                |   2 +
 drivers/phy/freescale/phy-fsl-imx8mq-dp.c     | 720 +++++++++++++
 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c   | 961 ++++++++++++++++++
 include/drm/bridge/cdns-mhdp-helper.h         |  96 ++
 include/linux/phy/phy-hdmi.h                  |  24 +
 include/linux/phy/phy.h                       |   7 +-
 18 files changed, 4443 insertions(+), 362 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-dp.c
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c
 create mode 100644 include/drm/bridge/cdns-mhdp-helper.h
 create mode 100644 include/linux/phy/phy-hdmi.h

-- 
2.34.1

