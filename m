Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD839F445F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 07:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A70F10E42F;
	Tue, 17 Dec 2024 06:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="TLQg0sem";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260e::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7649610E42F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:53:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0MzygkIv6CXQOtLgRzmowBdilMZ8HCySkzZwBhWBem9S0R88x60iSssX/cJ8WKjC+4tCa0mEMYIQM9hCVlVPm+IBRau+PsxzDNIV06NbRXcNmMzIlTu8o1TjKtZWctmQEDFuQOR6xrj+lVMjUELeBux3FSfjhuwi+eNCsnLpY9yyITXrnhXOGHDPrwu6WnZGkDM5jEzp3kF60hMXF/DVlxIHuqMhQfXxKA62MpoRCg5BMthgbS6Ked8Vcob4+w8NRLJPcqpFYmWe9WneU/OyXTAoPusMqpI1URk6yycbGxkXULNOAEXtUxJCi76VjseTMi62LvcUx5pi6HAXSLm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zK0zfOxI10SuBkKxQ/UjTtLB9Dr9jAnFnYgya9qLEaw=;
 b=xvaTzlI3qKHdQtvrowZSTdi8KS/DXChTFY9PIsYLfNLb9VmTDlzmQW54bwFvNHVj9YkiQBHn+XRjGHUyFleNpR1DpawcDLcpp0PBUKTomCnsMZqg2cuCTAPfJHbaizwzKuvZGdeFM/0sZIqIeo7LwzyqHgQgQtht9FIKk7C7A8Rok3VnYzyQKg/AFCiCaTyemNcqW+lSHMiE2KXBh3UtbdkKU0ahbT+9s8GGGJdLvMiS/J+22W7LotXZEv5i6Xkn16vUmgbqoc1/41nzqaA5nIyt8jXrDYP0FeNZ+pWsOh66QKeKK3j4ILYRr0Yggjfa8bqhuVhE/pSL6FN09xXLGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zK0zfOxI10SuBkKxQ/UjTtLB9Dr9jAnFnYgya9qLEaw=;
 b=TLQg0semHkCPShPmKfVmuJrXE5/Q9/KwGY/+kNYkU4QcRdLqqhkxnGBpv6SJ35ibyMU0vnzpMRmfYafB6WgagZ650DgkZvqFTY6C9h3UgGWN3KwyvlnwkA9jOVyFUn7jBZe7//rhTQEpiEI+nLil/sHFH7LbO0/ch7gYYEYZyCzgEYz8HchhcYVtpAj41RMCe2w03Odb2JDYC8w7Lv0nOAq4jWwvhVgyyVGcvQZub3HWKBnn5d1RukXqky4akBOu2W8n/21r7aYtbG8uDS9t/ZiDzSJy6G8gzfNMvQygcEynJiSvV/+h4XI0igAIpGha3V5xIjwpkrDFF+wfOi1UXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU2PR04MB9196.eurprd04.prod.outlook.com (2603:10a6:10:2fb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Tue, 17 Dec
 2024 06:53:14 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 06:53:14 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: [PATCH v20 0/8] Initial support Cadence MHDP8501(HDMI/DP) for i.MX8MQ
Date: Tue, 17 Dec 2024 14:51:42 +0800
Message-Id: <cover.1734340233.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0214.apcprd04.prod.outlook.com
 (2603:1096:4:187::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU2PR04MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: eb0865e5-c83f-4847-74a1-08dd1e677a6b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TFTixyQuNUGFWNCy5ZiZBhRkwxl3/Cah0ruMNC8cVlHGs3itggXouDd7XVr4?=
 =?us-ascii?Q?l3YK7ECws7KVkJ/nms65yr1l3dtRIGxvLsCeJlKjFVxTYHx/A65DYOdqXwsb?=
 =?us-ascii?Q?HOr9PNOiPIrOTmQNefrrBEyI6nucveJHVuVQOc54t0tIlsymUYHfHT1BA0Ya?=
 =?us-ascii?Q?xfxrZs0acTRtAlJuoKn3tUXJus/wOOQ3NXbkjOpRf++sa/+tgStOyKhh5UE/?=
 =?us-ascii?Q?HMKbj9QgqzyRps4STWGENjYk5FM5yHFGDAzQaOosXGPEm2Ufac2DY3j+W4g0?=
 =?us-ascii?Q?49vHseutq5xCenUEmMYYD2YGP+LBG8BkRSGlN2S+w5rn40RtTrfzFzUp3EzY?=
 =?us-ascii?Q?OcTi7u/1+/HW/ZDWwdpIPBKSzjBQ12slX+kWlwktejknmVJxedvsWVob4rel?=
 =?us-ascii?Q?EbcGpaN7MkI03iyBa289gRN/srhPa2pstAjZDFGLGAYlGTHNz2zetQycMF4v?=
 =?us-ascii?Q?e2b0j/538GFASXAlZVr5wzqnnRuLccrQCGsT0uEA6RSPLJcvsTKKymUV3i9F?=
 =?us-ascii?Q?dLme5nlmwgPMXr7GblHe5S/z/vo0/aj45fIUNN2rB0B6LlfR8noHaBSx5BPZ?=
 =?us-ascii?Q?td0Tuk0rI7/pw48WpxfACMHlKT4IdWB1ym8ODSRPeom73vCqjwtWeFpLxUB+?=
 =?us-ascii?Q?uEB3Dnkine7vOPbF1fV/SCBze3Bz6Wrko/tk1o2bUYqu0kiRW9Bu1Zqo6UZP?=
 =?us-ascii?Q?pOusVYWPwbcbbn+YdLZ52Jfzn37m4/iO8J3p6oH19APgeuXhtOkD1E3WhdIy?=
 =?us-ascii?Q?Le6TKUQbVUVeKNXQcmG4ENZafEd6sgVzqZNj2J4UI13ZKGL11TGwcEFHhFmW?=
 =?us-ascii?Q?s8nbchGuSTt64f6BX+HTThA6KgooFnJBx04jrJn46RmGvn2LL/XTLotaXcu4?=
 =?us-ascii?Q?9H+4hypOFdvTUeQKxen0Y1urK+aFePQjZE925gGDLYnlVRgChXt7nYHV1Zir?=
 =?us-ascii?Q?jokdd/iGuNO0JF/peVkOjekbfBq4MNwMwONUWYicSC3N/oYsP1lRkZYsRMg8?=
 =?us-ascii?Q?MTsf+u9nZAJfyWmkbfNC5tkjETP2Mv9sDV7bAJsPJUT++OYjD7OT8mAq7oIQ?=
 =?us-ascii?Q?ionb0EjxCd3d20OnIBcgNl87LLmZEePRfYC7OlT5sCPZL32Uw19gG+/HsiNw?=
 =?us-ascii?Q?iwB9aqQqRd/lsJifhhuu3WLJVGPVZXVvwqncMi5Qp8ooY/+Zl89zDQNBwht1?=
 =?us-ascii?Q?pVjoWfhUDGcUFnTTDaS+D6+Xnvz3GF19IgKfkX+QKRNxWSRQ6jrBg5Gxdwl0?=
 =?us-ascii?Q?VraoHl1Qoszgc0xzWTTCLliAu+1ZexbQCgR4UP69nAqSAhEhYyd7MpY5uihu?=
 =?us-ascii?Q?5vjmTlAxxKWpLM5cdDqMb8AlrV8kvm0kGZlscE0OSOFBGrX7DjgZC3CRtER+?=
 =?us-ascii?Q?iNCv/zzp3vJFxm4UOECplDUkRF06te9+0j4neWjqhvevbNmbccWkdukOubKC?=
 =?us-ascii?Q?nUFyVN/d+5c3moSJs7nta0kcG9ZArIiKciuh/Y8VfSe6sQlB1pwovA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nDjxA60FZAiqJz7JyF6DUm5goqaRd6b2BMXlLRCINbiBOX6aGeln1WeIphVr?=
 =?us-ascii?Q?rTVYzPFLp3KR8/FJJ/6t6lkUtgCKqMySeUCncaVcR8l/rNdnpMcw02cps6T+?=
 =?us-ascii?Q?9/zpofTckFdGVzgqPDBT8qV+Nl3HGuGRENDT0zPUIkMiZP3ltQ1g5VYUFpyS?=
 =?us-ascii?Q?2cjUttNFdfJVh0WiiCtE/7s40OB+y8YHtxc+rZFJbtLzyLPlL5e24Sj2lrpg?=
 =?us-ascii?Q?Hl9Th5wvLclsfOAvvTvG/rOTva17Tpv6zvMMd7h4WgCGKFvB06HSqp6Eoire?=
 =?us-ascii?Q?I3y8EAyjjSdnrPyaxDTiruORdykcRt2Usivd13WVMS9Gcc2KSkWy1X0no4EE?=
 =?us-ascii?Q?tJdEa+LsB3CXiyZTihmgDiTR8dzs7Yes1pU4792Jd7ThNccGdpDPs///FTW7?=
 =?us-ascii?Q?DdlvQSF7cOwvWNjkoAfx8lcvVem7Uh4WvK3Q2lLWZR0iu39+EJfpDc/CiHuP?=
 =?us-ascii?Q?hIEG74JjqNhkc+WIDDEwn2LxNv7nV85ST7HESuADya0ePeRqrhe2UWi/HyBB?=
 =?us-ascii?Q?tP1FWwsDQIPq/Q4YLl2iNqu9Kvti6/35Jc1llS6RmW3oschcb8u8hoDRRHSd?=
 =?us-ascii?Q?N/61qCURqppg0IDiXYwh6fD1NdgVyJytCDZyiaFvYYaHCxqeEOs/2EWv7a1G?=
 =?us-ascii?Q?zvgQdG0T+1jKGkdCSr47HCMReYjJxJEeVvstp8zgwrBf3wYqiDKqaWEZacKD?=
 =?us-ascii?Q?yz4RqcauPeOIHLN6nVd6zl+WiqCed+8yhLyHliZ84eUnB1DkznIZWSbSLGs1?=
 =?us-ascii?Q?Vz37ElNqPDQD0KGh0YYSxqZKo8AFNf5tm8qMBZYd7zk+e06dVI5F1UH+YMbR?=
 =?us-ascii?Q?qVlamnxAddRX0M5ikILNFD6P06nG5LX8PRMNqgq5mn+xSan6CrD3d8eFDMuo?=
 =?us-ascii?Q?qGVNuvtCpE+jOTkbfrlFNArbYDuMpOUIsZg8uCgY7hqsiqlmL1Oroo4dJNYC?=
 =?us-ascii?Q?4gXcJoe1Zwrya6SV26wNjNDGFL1B/DRhVgGUA6fZakf7jSvrNJgzwtqdJZeS?=
 =?us-ascii?Q?kWkWPaOmvNPi/aOOvrE8QsaI5zbSndak38H1HJXlHCjTgi7jCPycK3Df8cec?=
 =?us-ascii?Q?XssxBCg2DZPfq/hEKkNkkxNvNo5M/Snn0PUIhBFJ1GIwNlVzS48orq0VNFaP?=
 =?us-ascii?Q?Gahj6LTGZr2zeqAPC44PtoyVodsWUG8aiaFgPhPuEyX+uCAzqboIQEiGrXVo?=
 =?us-ascii?Q?TS40JIm/hajfd8J4/d9VBfjmZO0/YfBXHcnDLclHg7aI/DcaIfJDx5Z2CNnU?=
 =?us-ascii?Q?EAJ6k7SXXmZ81poQx1LQNCNhyOaIUd8MvLRoCSWcfysmkfHHyW++22Xu6aTN?=
 =?us-ascii?Q?58xjt2217+c7U/TmqZKh5NoTUC10L0zUJB6oAjEqMOXCtCfbESM4VCoZviBJ?=
 =?us-ascii?Q?q+JTOiCKUbNa5g1/uAIjyJMjlqvStbrolKeSKF+KaJ7LSzmMjjDFRALUJDGP?=
 =?us-ascii?Q?IMmBA2W+3ZN4if6kLiAvdq5r6y5467a/uKBSuQ3OpETnf9MyPDT+28iUM7a5?=
 =?us-ascii?Q?5knXfubbJqdfZb/4HwNfEYDhnVn39vR7kuXWb3/PIMiIcFi56JsfjA8TLzIe?=
 =?us-ascii?Q?GCPyEKQyAoB5cfRqpJFv8jT5vhYRC+n0Zp5mI5ck?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0865e5-c83f-4847-74a1-08dd1e677a6b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 06:53:14.4116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0F12STX6+Ub5bN2VVPG1ZBBls/EJT9yLqT1B2QtS7qhuzRH2qerBPIzjpFtw3o5fxMQ5KBgV5wgpVA/6KZokXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9196
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

The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
driver and Cadence HDP-TX PHY(HDMI/DP) driver for Freescale i.MX8MQ.

The patch set compose of DRM bridge drivers and PHY driver.

Both of them need by patch #1 and #3 to pass build.

DRM bridges driver patches:
  #1: soc: cadence: Create helper functions for Cadence MHDP
  #2: drm: bridge: cadence: Update mhdp8546 mailbox access functions
  #3: phy: Add HDMI configuration options
  #4: dt-bindings: display: bridge: Add Cadence MHDP8501
  #5: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver

PHY driver patches:
  #1: soc: cadence: Create helper functions for Cadence MHDP
  #3: phy: Add HDMI configuration options
  #6: dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  #7: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ

i.MX8M/TQMa8Mx DT patches:
  #8: Add DT nodes for DCSS/HDMI pipeline
  #9: Enable HDMI for TQMa8Mx/MBa8Mx

v19->v20:
Patch #1: soc: cadence: Create helper functions for Cadence MHDP
Patch #2: drm: bridge: cadence: Update mhdp8546 mailbox access functions
- The two patches are split from Patch #1 in v19.
  The MHDP helper functions have been moved in a new "cadence" directory
  under the SOC directory in patch #1, in order to promote code reuse
  among MHDP8546, MHDP8501, and the i.MX8MQ HDMI/DP PHY drivers,

Patch #3: phy: Add HDMI configuration options
- Add a-b tag

Patch #4: dt-bindings: display: bridge: Add Cadence MHDP8501
- remove data type link of data-lanes

Patch #5: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
- Dump mhdp FW version by debugfs
- Combine HDMI and DP cable detect functions into one function
- Combine HDMI and DP cable bridge_mode_valid() functions into one function
- Rename cdns_hdmi_reset_link() to cdns_hdmi_handle_hotplug()
- Add comments for EDID in cdns_hdmi_handle_hotplug() and cdns_dp_check_link_state()
- Add atomic_get_input_bus_fmts() and bridge_atomic_check() for DP driver
- Remove bpc and color_fmt init in atomic_enable() function.
- More detail comments for DDC adapter only support SCDC_I2C_SLAVE_ADDRESS
  read and write in HDMI driver.

Patch #7: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ
- implify DP configuration handling by directly copying
  the configuration options to the driver's internal structure.
- return the error code directly instead of logging an error message in `hdptx_clk_enable`
- Remove redundant ref_clk_rate check


v18->v19:
Patch #1
- use guard(mutex)
- Add kerneldocs for all new APIs.
- Detail comments for mailbox access specific case.
- remove cdns_mhdp_dp_reg_write() because it is not needed by driver now.

Patch #3
- move property data-lanes to endpoint of port@1

Patch #4
- get endpoint for data-lanes as it had move to endpoint of port@1
- update clock management as devm_clk_get_enabled() introduced.
- Fix clear_infoframe() function is not work issue.
- Manage PHY power state via phy_power_on() and phy_power_off().

Patch #6
- Simplify the PLL table by removing unused and constant data
- Remove PHY power management, controller driver will handle them.
- Remove enum dp_link_rate
- introduce read_pll_timeout.
- update clock management as devm_clk_get_enabled() introduced.
- remove cdns_hdptx_phy_init() and cdns_hdptx_phy_remove().

Patch #8:
- move property data-lanes to endpoint of port@1

v17->v18:
Patch #1
- Create three ordinary mailbox access APIs
    cdns_mhdp_mailbox_send
    cdns_mhdp_mailbox_send_recv
    cdns_mhdp_mailbox_send_recv_multi
- Create three secure mailbox access APIs
    cdns_mhdp_secure_mailbox_send
    cdns_mhdp_secure_mailbox_send_recv
    cdns_mhdp_secure_mailbox_send_recv_multi
- MHDP8546 DP and HDCP commands that need access mailbox are rewrited
  with above 6 API functions.

Patch #3
- remove lane-mapping and replace it with data-lanes
- remove r-b tag as property changed.

Patch #4
- MHDP8501 HDMI and DP commands that need access mailbox are rewrited
  with new API functions created in patch #1.
- replace lane-mapping with data-lanes, use the value from data-lanes
  to reorder HDMI and DP lane mapping.
- create I2C adapter for HDMI SCDC, remove cdns_hdmi_scdc_write() function.
- Rewrite cdns_hdmi_sink_config() function, use HDMI SCDC helper function
  drm_scdc_set_high_tmds_clock_ratio() and drm_scdc_set_scrambling()
  to config HDMI sink TMDS.
- Remove struct video_info from HDMI driver.
- Remove tmds_char_rate_valid() be called in bridge_mode_valid(),
  community had patch in reviewing to implement the function.
- Remove warning message print when get unknown HPD cable status.
- Add more detail comments for HDP plugin and plugout interrupt.
- use dev_dbg to repleace DRM_INFO when cable HPD status changed.
- Remove t-b tag as above code change.

Patch #6
- fix build error as code rebase to latest kernel version.

Patch #8:
- replace lane-mapping with data-lanes


v16->v17:
Patch #1:
- Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex
Patch #2:
- remove hdmi.h
- add 2024 year to copyright
- Add r-b tag.
Patch #3:
- Add lane-mapping property.
Patch #4:
- Reset the HDMI/DP link when an HPD (Hot Plug Detect) event is detected
- Move the HDMI protocol settings from hdmi_ctrl_init() to a new function
  cdns_hdmi_set_hdmi_mode_type(), to align with the introduced link reset functionality.
- Implement logic to check the type of HDMI sink.
  If the sink is not a hdmi display, set the default mode to DVI.
- Implement hdmi_reset_infoframe function
- Reorder certain bit definitions in the header file to follow a descending order.
- Add "lane-mapping" property for both HDMI and DP, remove platform data from driver.
  lane-mapping should be setting in dts according different board layout.
- Remove variable mode in struct cdns_mhdp8501_device, video mode could get from struct drm_crtc_state
- Remove variable char_rate in  struct cdns_mhdp8501_device, it could get from struct struct drm_connector_state.hdmi
- Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex
- Remove mutext protect for phy_api access functions.
Patch #6:
- Remove mbox_mutex

v15->v16:
Patch #2:
- Remove pixel_clk_rate, bpc and color_space fields from struct
  phy_configure_opts_hdmi, they were replaced by
  unsigned long long tmds_char_rate.
- Remove r-b and a-c tags because this patch have important change.
Patch #4:
- Add DRM_BRIDGE_OP_HDMI flags for HDMI driver,
- Introduce the hdmi info frame helper functions,
  added hdmi_clear_infoframe(), hdmi_write_infoframe() and
  hdmi_tmds_char_rate_valid() according Dmitry's patch
  'make use of the HDMI connector infrastructure' patchset ([2]).
- mode_fixup() is replaced by atomic_check().
- Fix video mode 4Kp30 did not work on some displays that support
  LTE_340Mcsc_scramble.
- updated for tmds_char_rate added in patch #2. 
Patch #6:
- updated for tmds_char_rate added in patch #2. 

v14->v15:
Patch #6 + #7:
-  Merged PHY driver into a single combo PHY driver
Patch #7 + #8:
- Add DT patches for a running HDMI setup

v13->v14:
Patch #4:
- Rebase to next-20240219, replace get_edid function by edid_read
  function as commits d807ad80d811b ("drm/bridge: add ->edid_read
  hook and drm_bridge_edid_read()") and 27b8f91c08d99 ("drm/bridge:
  remove ->get_edid callback") had change the API.

v12->v13:
Patch #4:
- Explicitly include linux/platform_device.h for cdns-mhdp8501-core.c
- Fix build warning
- Order bit bpc and color_space in descending shit. 
Patch #7:
- Fix build warning

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
- Add <linux/hdmi.h> in phy_hdmi.h to reuse 'enum hdmi_colorspace'.

HDMI/DP PHY:
- Lowercase hex values
- Fix parameters indent issue on some functions
- Replace 'udelay' with 'usleep_range'

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

Alexander Stein (2):
  arm64: dts: imx8mq: Add DCSS + HDMI/DP display pipeline
  arm64: dts: imx8mq: tqma8mq-mba8mx: Enable HDMI support

Sandor Yu (7):
  soc: cadence: Create helper functions for Cadence MHDP
  drm: bridge: cadence: Update mhdp8546 mailbox access functions
  phy: Add HDMI configuration options
  dt-bindings: display: bridge: Add Cadence MHDP8501
  drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
  dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ

 .../display/bridge/cdns,mhdp8501.yaml         |  121 ++
 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |   51 +
 .../dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |   26 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   68 +
 arch/arm64/boot/dts/freescale/mba8mx.dtsi     |   11 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   17 +
 drivers/gpu/drm/bridge/cadence/Makefile       |    2 +
 .../drm/bridge/cadence/cdns-mhdp8501-core.c   |  379 +++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.h   |  380 +++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c |  694 ++++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   |  745 ++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  487 ++-----
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   47 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |  212 +--
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |   18 +-
 drivers/phy/freescale/Kconfig                 |   10 +
 drivers/phy/freescale/Makefile                |    1 +
 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c  | 1231 +++++++++++++++++
 drivers/soc/Kconfig                           |    1 +
 drivers/soc/Makefile                          |    1 +
 drivers/soc/cadence/Kconfig                   |    9 +
 drivers/soc/cadence/Makefile                  |    3 +
 drivers/soc/cadence/cdns-mhdp-helper.c        |  565 ++++++++
 include/linux/phy/phy-hdmi.h                  |   19 +
 include/linux/phy/phy.h                       |    7 +-
 include/soc/cadence/cdns-mhdp-helper.h        |  129 ++
 26 files changed, 4572 insertions(+), 662 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
 create mode 100644 drivers/soc/cadence/Kconfig
 create mode 100644 drivers/soc/cadence/Makefile
 create mode 100644 drivers/soc/cadence/cdns-mhdp-helper.c
 create mode 100644 include/linux/phy/phy-hdmi.h
 create mode 100644 include/soc/cadence/cdns-mhdp-helper.h

-- 
2.34.1

