Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CA48291C8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 02:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C465310E54A;
	Wed, 10 Jan 2024 01:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0944410E54A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 01:09:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hi9MH7/vcQqHXFS+LNNH/Cw579h33KyOlxM1RIqr3IRyhrtkWdoRvcpmzeIANfj2ahPwa9xgT9MVV97Zk+V3VvkyPQzwRfGn1lbueufY4st0cmcWwAcGrIbxFmO9LrH4hP28bXAo0tOBrt1Gf0nJJLsUHGxivmTAgeNKE/3cEGu1otNqVose7By0ZBOKuN+fTMHI73F5QkdUmRIVfccS04yUenJiL/NFRxrpLbpNJvwTOEIxlbF+9yKZPyuG+InQaZPu91ISNk3aqFlTXRPlHF2q7367sOxnzFOZWoT3IbhWNeXovlT6gq6v7dsV1xCDsLYmoulzOE37WhObEW1HjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/aIxW6s1Y02ApE3Fq0m9Vd3LptkSrQjTExOx7xf5zs=;
 b=S7KDTaa0vYFyb17FEOH94niGNnAdD1v06/L1QIaUrO/FK/TcoXVoFoJ0/LJ+6c5vJOipvsmwcUoLIRUeEKKTEyVerxRYgyavqtvfrMgXchZZk2tG9gN48w9TqRiP2EKpnbRDDbJkKmYrJcTntNmlkm4H8Hut/hgSFcqaTv9Xp4LO8AGLhlj+GwYaWI+nm/oQwOutKc1z3IZ7Los9w5bw/17G9+uxEl2/oM9xc7Wdmi72Fr5/Hwn++xMsqOfXlSRfXK2Qo9M1A9TUfwORLo4GPyyBGWINMQ3BPGcwNENL1mLwqr8wA0yQS5hd1S9aiP5vQtkmANkffVSs0HapB/3QZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/aIxW6s1Y02ApE3Fq0m9Vd3LptkSrQjTExOx7xf5zs=;
 b=Y37icVCP1jdzmOpywAFR5EqVpshyyusuxP1pP+UAyQGRQo/pY+7yks+o9guhk7iyOI12vP6TFCIvgfgMl63M5mjzNuXRs5PMGjs2JASQz7xdQQ1XxrLAnlD4iW0l+nWJUN8Oi6p3lGoqTqfFPZY2BbnZyhhZrLoyZz/Qiq2PYvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI1PR04MB9836.eurprd04.prod.outlook.com (2603:10a6:800:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 01:09:52 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::e6e0:d026:3089:17d5]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::e6e0:d026:3089:17d5%5]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 01:09:52 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v12 0/7] Initial support Cadence MHDP8501(HDMI/DP) for i.MX8MQ
Date: Wed, 10 Jan 2024 09:08:41 +0800
Message-Id: <cover.1704785836.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI1PR04MB9836:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a42f71-8575-4e2b-48b3-08dc1178d977
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g9JYN2A9HF/El0cjgjnMBSq7oz/upom5NkhPu5TEF46IYZAQcAHTmf09fMGADuyWa4R5/abTL79MEdeVd7cVfPlB5m5W+yyjhRloXiG560d1ohzclpe8STDu/eaKUamGz+lPOHN1adVIKZGDDLcqzQKcJk93W6u0p4wqXADGOGiWRX5ojpiz5h5idJlb5TiJdFH7Y2oJQn3MQpO1GvWXfN0GMzhG9ubL5xXEeXP4d5ER/PpK+za6md9uXCBdtZdLx+HJhhfx6M2kMRikQNscEQ0u6dCgk5/XGmEXyvZP/33YmS5auGqGKgpi0fqfRWwq2e7bxaLBQ6Ya5ogYoknuOtD4o5cHKiev2znyROHgyJeFs7K5WZ0hqrCYU5dnbg9TBfBTdiFfRRRz1D9Xx2H9sv119Thp7HU6NR3uFIG4XxC93tzqb8SWKtQv14PSwqzhjMAR8GWc69z2/XZGV+LgVLishusPaVUC7CZJd5YDhNRNwA05eSWENeaLy3EPQG+rWR0hMPAjGJ9d7vQKjG6gmr4rH/Ps8UcR2zGuViaSh2vUz0EMNcY0QOQ4QpYNP/ph3fCOHeZ1EIM9wuotOJkIOq6iQLjURj17TNvLY03vP0ecBNfbdYApwLzGrZH/XNYo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(38100700002)(38350700005)(36756003)(921011)(86362001)(26005)(2616005)(52116002)(6512007)(4326008)(316002)(66476007)(6486002)(8936002)(66556008)(66946007)(966005)(478600001)(6506007)(6666004)(8676002)(41300700001)(2906002)(5660300002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVFiZ0JDazRXSWNpc0NjTkNKYUttTjFJQ2JicCtyN2VpV0dhbkJmVlVkZEZj?=
 =?utf-8?B?RExtT1dxUTVLNDBoSHFqbFBZRzlGNVd0Q1RhVWNndXJQdktBLytBYnRuRFJW?=
 =?utf-8?B?K0laSWk1ZTVQdGNOYTU5TjRYSHd4SWtiOVE4emZheEYrQU5yOFp4QmV0TUtQ?=
 =?utf-8?B?U1loMkI2ZzMyUG5GUkFwSVVmOWRwN1BJYURscFNwdi9rMmpLM3I0RnhMTWVE?=
 =?utf-8?B?UWxieHI1a3N5czFRanFyZHp4b1FybDdlRVl2WUdFc0pVUzRiL2ZSQURQcm1L?=
 =?utf-8?B?TUJkUWRZYndTVHBEcjFCUzA2aEJDdGNQdmJTOUR1QW5aaHRhNTUwOHVTdVZs?=
 =?utf-8?B?Ly9ldHZ3Z3dhYnNIdlBkV213M0lSZ0YxNStteHc4bXpINmlQOUFteEx0RjRq?=
 =?utf-8?B?aFdOL3dvaEsyTWoybnJNdy9hMm5oRDh5UHVjTTJxU3lJUSt5K2NlUEZxamdq?=
 =?utf-8?B?cXlxTG5vcXhYc3VEeXRka1R3dHFCSWd3a0dtd0NlY0dEbjN6aDRXN1dWdm1C?=
 =?utf-8?B?T2o0cUNDNlZMamh5V2VrWnRVMEl1TjgwWGJXNjFTSkROT2QrTVZHNGVRRHZi?=
 =?utf-8?B?dkM0Z0VYOFUrK1AreDJEQXF1dnR0RUo5SWlRVDRuSVY0Y2h6SWVTOHJTbC9R?=
 =?utf-8?B?eWV2Q1c3RTV6UGZTSTZRV3gxWElwalcwcHNWWk16eG5BSGhJRmhDMVFvajZw?=
 =?utf-8?B?bUVCVFgwc0JyUHZLMUsvanE3b29Sb2oydE5PS1oyeWZRQll0eVBZM2R5UEZV?=
 =?utf-8?B?NzJEclBVc1J0RzlNSFJNM3hIdTh0WDdDR3ZQTFE3cHZ0VEJDME1vR3o3QUtj?=
 =?utf-8?B?UjRLQXJoSnlhT1VQeFAyMEZpREk5clhOcXl5OFBwTXdoalYzZnR6czc0VHZ6?=
 =?utf-8?B?dk44U0J5UCtPVkcxS2dyakN4bG5qc21sNUNUWnJXZEdYOTVveVUzQXV1bHBr?=
 =?utf-8?B?Ulh3S0kyTDhxVk8xZ2RNSzdEVTV1aVdOWXpMblhKMy9oeDVCdE5GU05LVTh1?=
 =?utf-8?B?TVhod3BEZThZMnM2NngwenhXTzRYcFBzbW9vZjNRNCtHTGFsZ2dsTExYS0t1?=
 =?utf-8?B?Q3hSbTlPZEpLMXNFdmJaSmJqOTMyeHFsdzF6TFhCTnlDL2VqYWdlMC9uM2dI?=
 =?utf-8?B?SWRIeHZjWStpL2NzcTRsMXh2ZXFzVkRwM1JwNXJnTDN3dmgweCtGTkNYZ0ZJ?=
 =?utf-8?B?S01ySUpzQ3BMckJ0ZWd0RmlBdE9iVmI3eE84QTZhUTRvcmJ3cUVYYmN5SG1W?=
 =?utf-8?B?djRhTVJQUjBzZFhGMDdFa01IbGUvcmN3cjZDRHdvMHNVSnp5eWJvV2JrRWdu?=
 =?utf-8?B?Y1E0UnpKME5nSjN2bjVtSmtGYlUwOFJQd1F2Uk5hVWpxbXVrSWlnYUlucGMz?=
 =?utf-8?B?dkJWZE5lbE5Cd29XcXlYVG9RTkhGTWQxRkEzZ3dQcjVhdi9SKzZpdktibHAz?=
 =?utf-8?B?WWVremdheVkwNGFYMXZCaGR4aUlRSXc3RUtVV0h1WW90VzNHSksrTUtYYmpK?=
 =?utf-8?B?WnZiRm9FRUVTZ1pIMU9qUFgwR1FmMnNUTVgxSUYzVDdJMndLblh0WjdwYUFS?=
 =?utf-8?B?OWtpLzhsSjN5MWlSRU9mWlFvcHMyRDR0a0h6eW5GRGlrSS9rNUdNSzV1Ry9Y?=
 =?utf-8?B?SGs3SEg1NjVLUGlvdmNWdndBWTU1U0JCaDBmMWxVOHE1ZHFyODJuL1ByeVZp?=
 =?utf-8?B?YkN1WEk4cVc4cFlOOVlQTnlmOHhXbzdZSS9qSFgyeTg5N2d6eEFadU9ESmxk?=
 =?utf-8?B?YlFBc0ZWQVhUd3JWSWY4TUZ5RS9vNy9BZXdtWm9CRjZjWU1HQ1cyN0xnVVMz?=
 =?utf-8?B?cGtPV0ZDSnhrdTJZLzlxODROZWhGWGtVY0ttK1NnRCtJNXJHbllzemU4eitL?=
 =?utf-8?B?R0ZnWGRFVVdBODN1VlpzcCsrUW8wNzA4MkJ0M01ER0tNWlRZWHRiN01aK2dy?=
 =?utf-8?B?WU5DdHRVQkg0OVNSSzVzMnFYMi9NdTdGYk1RcWg3aEQ4NVZVZ01WUE93ay9s?=
 =?utf-8?B?SG9wdVZMQ3VlNUhwbGNXQ0lBS0FtcitHa01EWllrdmJvajUrMHlCK2o5NFBR?=
 =?utf-8?B?TDhIa1FXeGxGczN6QjlpSzBwL3M3M044NlpUQUk5bVJSOGMxRDU1amRWcGg1?=
 =?utf-8?Q?JynNAQQ851W9oa0Pt0UlMkxfc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a42f71-8575-4e2b-48b3-08dc1178d977
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:09:52.3971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxmxivCdHw/hD2u40QX8ZTC7x+Vze0wvdhpASt9sdmZwwzS7BBPJ+oJJvu0771UZ7hh+OnjmMoVGAWripgLitA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9836
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
driver and Cadence HDP-TX PHY(HDMI/DP) drivers for Freescale i.MX8MQ.

The patch set compose of DRM bridge drivers and PHY drivers.

Both of them need patch #1 and #2 to pass build.

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

v11->v12:
Patch #1: 
- Move status initialize out of mbox_mutex.
- Reorder API functions in alphabetical.
- Add notes for malibox access functions.
- Add year 2024 to copyright.
Patch #4:
- Replace DRM_INFO with dev_info or dev_warn.
- Replace DRM_ERROR with dev_err.
- Return ret when cdns_mhdp_dpcd_read failed in function cdns_dp_aux_transferi().
- Remove unused parmeter in function cdns_dp_get_msa_misc
  and use two separate variables for color space and bpc.
- Add year 2024 to copyright.
Patch #6:
- Return error code to replace -1 for function wait_for_ack().
- Set cdns_phy->power_up = false in phy_power_down function.
- Remove "RATE_8_1 = 810000", it is not used in driver.
- Add year 2024 to copyright.
Patch #7:
- Adjust clk disable order.
- Return error code to replace -1 for function wait_for_ack().
- Use bool for variable pclk_in.
- Add year 2024 to copyright.

v10->v11:
- rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver,
use cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write()
same as the other mailbox access functions.
- use static for cdns_mhdp_mailbox_write() and cdns_mhdp_mailbox_read()
and remove them from EXPORT_SYMBOL_GPL().
- remove MODULE_ALIAS() from mhdp8501 driver.

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
  drm: bridge: Cadence: Create mhdp helper driver
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
 .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c | 304 ++++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 315 ++++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 365 +++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 699 +++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 678 +++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 403 ++------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  44 +-
 drivers/phy/freescale/Kconfig                 |  20 +
 drivers/phy/freescale/Makefile                |   2 +
 drivers/phy/freescale/phy-fsl-imx8mq-dp.c     | 726 +++++++++++++
 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c   | 959 ++++++++++++++++++
 include/drm/bridge/cdns-mhdp-helper.h         |  97 ++
 include/linux/phy/phy-hdmi.h                  |  24 +
 include/linux/phy/phy.h                       |   7 +-
 18 files changed, 4448 insertions(+), 375 deletions(-)
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

