Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35329D9944
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 15:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F6010E8AF;
	Tue, 26 Nov 2024 14:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="byW0eIzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3FF10E408
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 14:13:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpFJ6FdqG+dyiZ25PhXnPne5pOir6H2TKNtZk4liTAuPVw+3uRttqh50VuZVEJndZ6n5zi7sbT1uLG4vKypG4rfXvzaUbp87r7491h8+jKxHxQAzMFlDb38rnkXQsOteVntaJgplDXHGJ1aE8YB8FAYZZ4ZS13BxATk15Hlanv3Gq2R3ShtYeqLiurq3rLJvMp0MthFfeWttl9iiM7xHL0iJu3/ENSkrWpK+1Pi2wePEUToKuXZ6hk0a7uRMa8KOEhARZCZIvPigRPs1NpTCteEeLVnDYtRampRsWXjGRTkY4vZntPIhNI6MIArQR6k+B/Bz/bFYwGvrVV9AkM0UWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWM9pttkh/pufr/Z1IXlKbooydaxgBoJaBdfI4h4KeQ=;
 b=laOK7ca7BZP3tCv7zJeKlPpk8K1WQTA/oN9GsOKus2jJklYXQaBQzZA73P3uzKnZGuO5gkoXgR4o9ivJW3HzUBCzJp4DqMSilakVuXohuGtroVyveuXeeKKfoE6WYYeDUIBHaS2u1dFkIbPSyZjPyDXa9sgZil4NNkTUDEVxH22w2Tb31/+L65D0wCVU6fzcKDsxAQIynB6wZHMuHWWewQ0LDTNiJ4HbGNht/m8A4NDyqq2Pcj7d76JolHjbRGj50haGqBKTrGY5v40Wl2VvWR4Dclmutiz1o8pdRXZ/eQZPiPzUs1Sk03CWvRfViAujmXB+gXoZzBLxt7sTxqSxJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWM9pttkh/pufr/Z1IXlKbooydaxgBoJaBdfI4h4KeQ=;
 b=byW0eIzFtrEX/i2+UAsn0NxHiLOwYMPUo+93wlCfc3Ltc8E6rt01jCrkzi9jNm6B8lJyIif52w4fzyjs7yYv5/pA0uz/1CjALIIFe4VARmvGfbM3tEQr0sB+p3JPuWmYEhLuoGC1s8cg+vHNt11rHhJ1f2yYnM44nO9avyxn5v24roIsAd7dhltMnTtBkEzkxDogyBl5SOGJveK+llthNLlNVI4I1I4PE8nuDegz1bnLhz5c6QvNSHTKTMC110Z/hE7Gob/OZjXzomthhQZr+gDo59UWUxIz93RLnQS+8p15+bqxv3w131zMB6+Pt5ZYxdNs+n9BO2rcN/RJ5nZz9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8894.eurprd04.prod.outlook.com (2603:10a6:102:20d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 14:13:04 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 14:13:04 +0000
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
Subject: [PATCH v19 0/8] Initial support Cadence MHDP8501(HDMI/DP) for i.MX8MQ
Date: Tue, 26 Nov 2024 22:11:45 +0800
Message-Id: <cover.1732627815.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8894:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6076df-7305-4ddc-3bd3-08dd0e247196
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8eHdBw3Jg8Zoug5Mu7wjcQ/EB+ZFmMCCTICtWaRpkbCrmAoayqjtNJ/o/RFS?=
 =?us-ascii?Q?sBk4QzGhvfitoxKGNzrEc7p1bNf0Yw3pvBBGqrSRbYrLpsjwtKb0BsQA2GM1?=
 =?us-ascii?Q?f7lCojZxGJ9IVUGiJ8zcNzLbuMltEBrbPEQpZle02lnf5Ai2Sgp0PNkaywsE?=
 =?us-ascii?Q?VE/0axVqRosa8vP6gKflDrSuBmbWLrPsNESN+3A0AY+Ph9E34kNFW9W6CFHX?=
 =?us-ascii?Q?0DhHIWm3TpbWW9rpfbaBlVJHDkVWylktAUp179u+pawGkNcmp0mxHAak8zZf?=
 =?us-ascii?Q?ZiaN2By102DDZGPWy4vqgt6Di2FQkF9vIk8rSu041oP4Ps9ccoa1X1koEoKI?=
 =?us-ascii?Q?9rIk+22rYHYIyv1zmm+EILQ2Qu/oRGcRWzkggF02cm+3pjFCFmGd5JPoyLwm?=
 =?us-ascii?Q?qUzDSKH0f27rgQ4kEWqnawqeuKLLc2Tb0rtGYGOODtMCPzTDlNk/xr9Ak/3x?=
 =?us-ascii?Q?H7yyqfdLXvqwO1S6KMrxsWE3XF8w3ky3ZTvg9GYt5PcpynpqQU8QO+VO8E9q?=
 =?us-ascii?Q?iXWlzlMlyzX3PEnzSATDYwNYP7uVDk2W7ZL8DEe7jYHAMhTHI9cE2qX90RQi?=
 =?us-ascii?Q?zIH4ZMHqx7egZRMMbGe2smNw7MjAUsSRqRdLwn0weBg+WP8hqPG8T1IdzqAc?=
 =?us-ascii?Q?XbwcjtMZMN1frWtABGNS+qS2iH7E2Rj19E088pNIEnvTwqZg/q5UdmlgJxGg?=
 =?us-ascii?Q?soNJBqEJpqMAh1glJ6ewwMm3+4q38RSSaSe5O300h9tptWq2OxntYf0bCIbK?=
 =?us-ascii?Q?+aWFZL8wy2JdShceDWRcx8GCLZpc7jiq6S1SNuMR/MI7s/jNQoiiVXNdsbiv?=
 =?us-ascii?Q?EPF4f8wpu9+AepQzAe6aRESrRW+dZL4lphEXjWnq1bhgf3joOIJ/EpgLbIPQ?=
 =?us-ascii?Q?mrDC21ZmfyGmWFmWD/PiS4k6J6Ld6YTlEUCG8lZLtL+d/CP4lhEhyTBX40sE?=
 =?us-ascii?Q?SEtAw+sGco1ags4aVl6NM6Gy1+ojYg7h/qzmaRzX14c5MMIfJXmNX536Og/m?=
 =?us-ascii?Q?2EM0DMrrmTCvZZ87P9zZYL/fdu73E2ELzZsIcRFtbIpU/qG/FWhGa9KieHTf?=
 =?us-ascii?Q?9zREvXHY9hyw0Qc5X1a3K7zhivDJVtBp1uFJtLNujLPdikHKh+xLPhIU64ZW?=
 =?us-ascii?Q?rEmCeEAajGYqz7R2xNazP/b1XoJRFaHfT4zfok9Gu1FSJAgCXmTUJ3tdzDg3?=
 =?us-ascii?Q?ZY/NjhuRNuZG1gvRTtWERo0zDeUVzo+eSKV+/SWHXPxxt+4ucK3w5bGJRHFj?=
 =?us-ascii?Q?Fmb1bgF7gAcmjpF2jwu/DjywQfaPtDaDvgL9HWcsAxaRxOK4rK/fyde6KJ2U?=
 =?us-ascii?Q?5UggD6hRk8N0L+eIomZZO2PyZU6EsQMeYQzcFuuFCfBt0LLTzsDYGnDT5Fwc?=
 =?us-ascii?Q?EaE7lOA2mloONesDwCXLHggPC0902v2gAAKfa3pVYK+G6HwQRyKL1jfq66c9?=
 =?us-ascii?Q?heNiSstdV7E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?47ERUgjoUzOxABjNtnJX9cwY8z33z6cXUgE3qut+/SWU5jlMU5Jzy9aA7Hqw?=
 =?us-ascii?Q?kwRY7l9aH8GwW4RZbv9cXdrr1HoUdYU+vyhknLE5segWvcFTaQ8tbXbAAdo9?=
 =?us-ascii?Q?mqpXWpWEgyAZOT9NTM5YPvk8I4AkPct0qkMEfZGsyXShls0YDjEWIi7bHk65?=
 =?us-ascii?Q?RMu8YtKGt+42uq2IHDSeZfE/8gwBE8mQuDwoZEczneZv0acEwQea01+KD3mV?=
 =?us-ascii?Q?e9Z7Lv1WIjeUkk1/SpIfiX6ELXKlCV0xPnIX02IS3N+rkNXL6oeH4M6RtyW+?=
 =?us-ascii?Q?oLMh5j5RPsqlgy9UsCwUym3aCWX1iOFRQt4fRkejt/3t4KtTDTCciDl1smNR?=
 =?us-ascii?Q?zGXDc1OXt/Czgb8XAt3IFgmMDt440o1mWAMopYhwSSBOJmONv7AOzGTjO+Ag?=
 =?us-ascii?Q?lwa7Le3hnkt6fHA5gUIycIXEmK9+p2YCPcnUr2B1X1R/ph/TO0i0cZGGrcQn?=
 =?us-ascii?Q?dmbmbhCApYj6NfS8nyxxDDEfgrxsDvfXXPwAZJxYKpVRvTdDIdpH552pLRJD?=
 =?us-ascii?Q?flACjqb2BelSOxH3e+jL8cKHtTgsGQIOMmDJBRJwnIPjSk7Sv8hmgulH4v73?=
 =?us-ascii?Q?WSsQBFA0yv+h7VMJFCIcR2IapzEkPWR2derXwCdYSFrSAamuXaaKvI1XTSUp?=
 =?us-ascii?Q?K5zWFNq6UUOnVKzprvHcTAulfmIZgY3skmO2sTuiaO/Ji2VUoRGrFM8VPV+e?=
 =?us-ascii?Q?oaolsClGqE46ubLbXLmJBgu+EzFAMZ3z3OUZbFbsTCAQVAFoWAbZNoLC/F7i?=
 =?us-ascii?Q?kgQvcIeiN/zttDpIgiGrPQ/7SyTimEQ0h0+68+KpMyM8Ssb7DjDlUCmxITL8?=
 =?us-ascii?Q?l4UdE0QpI63ofv9L8+y2fjhFU7ecqYMVBTpgFhg0TjWDOdn3TthcXzii+DpC?=
 =?us-ascii?Q?5sUa3E077pOarYv39t8dtseufqcNUMdqft/tI//0P2Y2DEJfEIwMLf+yORDO?=
 =?us-ascii?Q?fveURZjhKnmJRLv7Iih9ny/5/qCdCxTSPt4jRzEvtADTcg3qa1PLEoilAVD2?=
 =?us-ascii?Q?7m0ebsVg9eU+2u0WMxH2v5tAEk6ZaMplZMt+5siadKER2Rrtp6et3HPGvdko?=
 =?us-ascii?Q?ZfOj+76MTwTG/J/TMH+N/UM7k+kE8OCSj41LGy/N2sEFjqmjOiYbX8LAtHDc?=
 =?us-ascii?Q?7WNe18xZOijVTupY2w2hvaHjKhQPQgGdHnE03Ux9fsJZCrYixViKpug3kRUV?=
 =?us-ascii?Q?SSYzCDzCYy36uYhagmsL0J4tOBIASHz3ReAysn+TmrbIn7glz45hl4aAghkI?=
 =?us-ascii?Q?zbe8eunPp8X9xaZ3a03ST9y7wjbSZOLY5Zs/vJjgDCmhEhSMqy7B7bgvDObq?=
 =?us-ascii?Q?jgN00XRRM8IhRNy9QuGzi6zLOKmy2IYe/XtSOCj25lpDXhKKhFnNunvVZVBR?=
 =?us-ascii?Q?99vgnexb+utRRJ07rKTlQgy9qrDngpk6CG4ePhN5hOwQJj1MyY3q6zWZ3Y79?=
 =?us-ascii?Q?UnKQ/yKoxrvllXNFwvqqQsKignqXzJTBPkbcXmXUnQWndA32CpOv3JINQUsI?=
 =?us-ascii?Q?d9v4XOFWPPmROUfIfswJCkI5S8dgqr43ZW/zdUZomTDfFzZ+hOM6wVfbYI6n?=
 =?us-ascii?Q?tjNkBhd4k1ZKb58jvAYgVXSxNTLYMDLoF3rjaJKB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6076df-7305-4ddc-3bd3-08dd0e247196
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 14:13:04.7457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DKsafNLalV+wEASvg/2iWO6UmSUg9TFwv+aoN2pxZOfHFODWlJpO9Aet0y9TtFvU+HmhnjM3wIAfRQztaOJDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8894
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

Both of them need by patch #1 and #2 to pass build.

DRM bridges driver patches:
  #1: drm: bridge: Cadence: Creat mhdp helper driver
  #2: phy: Add HDMI configuration options
  #3: dt-bindings: display: bridge: Add Cadence MHDP8501
  #4: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver

PHY driver patches:
  #1: drm: bridge: Cadence: Creat mhdp helper driver
  #2: phy: Add HDMI configuration options
  #5: dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  #6: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ

i.MX8M/TQMa8Mx DT patches:
  #7: Add DT nodes for DCSS/HDMI pipeline
  #8: Enable HDMI for TQMa8Mx/MBa8Mx

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

Sandor Yu (6):
  drm: bridge: Cadence: Create MHDP helper driver
  phy: Add HDMI configuration options
  dt-bindings: display: bridge: Add Cadence MHDP8501
  drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
  dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ

 .../display/bridge/cdns,mhdp8501.yaml         |  120 ++
 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |   51 +
 .../dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |   26 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   68 +
 arch/arm64/boot/dts/freescale/mba8mx.dtsi     |   11 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   24 +
 drivers/gpu/drm/bridge/cadence/Makefile       |    3 +
 .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c |  565 ++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.c   |  322 +++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.h   |  376 +++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c |  686 +++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   |  764 ++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  487 +------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   47 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |  236 +---
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |   18 +-
 drivers/phy/freescale/Kconfig                 |   10 +
 drivers/phy/freescale/Makefile                |    1 +
 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c  | 1237 +++++++++++++++++
 include/drm/bridge/cdns-mhdp-helper.h         |  129 ++
 include/linux/phy/phy-hdmi.h                  |   19 +
 include/linux/phy/phy.h                       |    7 +-
 22 files changed, 4527 insertions(+), 680 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
 create mode 100644 include/drm/bridge/cdns-mhdp-helper.h
 create mode 100644 include/linux/phy/phy-hdmi.h

-- 
2.34.1

