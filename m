Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47333983F44
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BE510E5B6;
	Tue, 24 Sep 2024 07:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="c0xJ+ZYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF0810E5B6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 07:38:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cETLHGK021NjsA7ADQszzCrpIUqqxvX5ydjS6Q/TxBg3ZLIwA0MrnU3Fzvac1qMP2dmKUUea+lFkI8XIwDSGX9lJctXNwK6l2U0fHlGRWh3FbA0Rf/41mwAcoci3Beojy2fvcakMUOkcL3NC+SmIALd0YTcbjSfW3ibw8nt+7eNgnd8l9Y83ImwpqE6wlsPbk34heZxfXA2ckwc0KvH3L3z5bKdNSPtaoL4VxbseU9HYMuLm49T0BXSK/ELjjVI0o45n793sUoBxA7fhKyGM76PmfaW4JlKpPoaDzcKqGdU5MwQiIqWHzJZhIHnj8CYKjPpl06t796vdSPJ8MXusXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20DMpxWdi98aQsyqXk8j5OQg7RVHRXNloTjGdNSGDs4=;
 b=DiP0nH2JPIHNZRT2GFdc74WBJxGuYyK5LU9hkmGpZL6poQJ2xDzJtzb48uokpp/C6DPRN36+ZfBmaGf4B1PEo0SLqMGmNcxmlZklsllLl5xg+qCJKYf+BmxcI10i9ZN+n2SEa2BrxXXjjFC0eWydVcmUj1lX0tyURwxr5TPJhtciE2wFF4dpRdJyhmg5zYqUQHuT8NESWlfDKNaSxs+CCh3GRU46ULgr/r2hDJ+trC0+pRazH1LjGx8kVPLXcGVIsSCqJiKLxMPF9qyfmTWJHH6b4kDJtt6pLUTO5uWVAJsW+bjCEHbvnmCoFzq+IS9tKHWN3NYigKhBdmEFWquojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20DMpxWdi98aQsyqXk8j5OQg7RVHRXNloTjGdNSGDs4=;
 b=c0xJ+ZYXwjCRt7LrlaEewi0/I4Ha3ZQZoQzWAX84/Hll/Ag/SoDGvi5FY4JUZp/KijxljIE7tWwmVbbz2hu9+8iYmdhFGPCttS/myhT92eSgKlePohgRaxOqiEg+I9DXVpe1v3IZEZbFFcallWgxdBi5Ai3Kek3ErIhu3BM31QKZPlBwlII5idFpYTAaLdvCx6QvZmadB5r6bjal9Anda7EZrJ5aBlJ4dhX20Bn9NWT2l6vsVwSNqXumLaRwQFcO+C6vNBaHfo8lmmsgHte7tEqgLt6GSgHoiREgOO9NNoyzDi0xas6WCcoH/6tSlpRsYfrz/81rDtt/3NBTHCFnsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6881.eurprd04.prod.outlook.com (2603:10a6:208:18b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 07:37:57 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 07:37:57 +0000
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
Subject: [PATCH v17 0/8] Initial support Cadence MHDP8501(HDMI/DP) for i.MX8MQ
Date: Tue, 24 Sep 2024 15:36:45 +0800
Message-Id: <cover.1727159906.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: e6890b28-c8a9-4af8-bd79-08dcdc6bcf07
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lyFmv6gWak7eI41dDC+KSgrvSd7L0tb8mztR38sR6nNSDzXMk50lq5U44YIS?=
 =?us-ascii?Q?M6wbM/7WnwdnEqFOWHE772hTL76e6kZGcS9XgpJuF9SAn1DH3IXBQaR93Ay6?=
 =?us-ascii?Q?bmXHCjuCwtAOaKeeJ2hcCa4iDI+7ySOqPeMfNaOUftpPm6CDho4vN31MNAlo?=
 =?us-ascii?Q?lp/3L3cqSRlUavZQAQ8gQsfC6URKyCzxpOkl/zxAFKA2K/5AV6u167FiUvZA?=
 =?us-ascii?Q?aALUOP0h5S5xTjmgJcjm3s5mlL1tewB1bOWjGK/qVccEcRsG8KBqVfAdCBeg?=
 =?us-ascii?Q?z6sEauZzOwA4J8LJbNAbhep6WGgYjfw3ibZWWqJt0CxJ5h/1s772T3wxZgGI?=
 =?us-ascii?Q?r2hk7yLcr5yZtjPiggt0DD/TQPZCJeGqGv3OeVLMbTjOWYX03W6U3moan5qT?=
 =?us-ascii?Q?m6Y3d+xt0JML02eA194M/JeYB+L5B0cxaIl4gMzioaE6UAJnZmAg4/fUNM6z?=
 =?us-ascii?Q?wBhUPly2NneWm6Ds7bNI4UP4YZ+on8q5vJindDvtZ4J/0cLTeSfnGDA9I8ew?=
 =?us-ascii?Q?9Bfxnpgzq6EyYlo9seA6tVqT0nXeSun6/Lt3RrG8r0qhUoyp8jAjoVQ/cAxU?=
 =?us-ascii?Q?GSFd1DU3+j3Ay1hQUtV/jO36x8mVlE9e8DuEOcJA8eBOK0+PAmwo9+tIAg2P?=
 =?us-ascii?Q?V2y8R3sYtY5S2SubWi4OYz8juedqxZ8gizc2JGOyZGeEybFQBYWkFYS1iAxt?=
 =?us-ascii?Q?ejxpQSqy4ZNqMGUF8rG0sbRgKaICV+eIO+yAlplbDuKV4nbFGHnBBIt2sBI1?=
 =?us-ascii?Q?aFAwAu4ifXeRaaIfj1RSOEHBBRLfoJrjJtbd1n3rjEf7ZX6Z6K3gl0IXif8O?=
 =?us-ascii?Q?8WpWwMuvSQOpPOXzIt8sydAAr8ItSRU0rkqlQroS7CWfaBwKVLMl9IyegbuT?=
 =?us-ascii?Q?BqkTJtN3A0Tt06XOri7XDyjcgC/tjaFm5jhbXacX6qZXZEyOPhHfF3hBPWMA?=
 =?us-ascii?Q?7qTQ5oNpUBzSzUITSwZ81lOzQChLemoonsBhXt4Rpih4rYXx5VE/UsUTFaBF?=
 =?us-ascii?Q?o/Y5EJNghlDL7AjSwsSBgMaZKSQEowI9f9iBN5UoIlPkv+h0DZL63o0FwI9f?=
 =?us-ascii?Q?g4UV+K9bSPjJsWjp5pCRQq3XaVc2xT7bzmeJAvCcFW66h14Zb6OvluAVIFO0?=
 =?us-ascii?Q?EtqDPgO1PWKST3GEjSkI90PTw7fTu6F3TGNuvFabAAWzu9KWDTAb3dL+D890?=
 =?us-ascii?Q?jVjB3w8y2kyBdQpo0S80mtg/WijlAq/Iptfw52K6ntP7SSwxOG/KSEi6p6na?=
 =?us-ascii?Q?SvHyUovtWXOfW9xSKTYd5Kl2ewcmGKsWveZzoqB1SYciquoxcqe/rivvP1Ya?=
 =?us-ascii?Q?mgbWmjxEs3yuqUCdddcDHQICuvEFyuSREQtLLOxTx+2d9TqJba71Mv4dj5hQ?=
 =?us-ascii?Q?1H/yrvPnUxbfpHx/PZJ9hitFRtb/ungfb8SmllzqJiJDsZNUQPV4p+ina5Af?=
 =?us-ascii?Q?JaFCmRgNCiM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xs+s2dUXijFxUTkjTDvu5VoZguw1Uk2PCjafQqEWjXlzWtbf7v/xI1uRWbS7?=
 =?us-ascii?Q?DMy7kcTa7+04bLNiukUKO633VLu1sm+3GBShRx59Xc4aHZkzj9TovlKukcPV?=
 =?us-ascii?Q?IAK3DlnLkegCBuGHtq/wDbs+emBYf+E4RALAEgba9iVgRDXRABnhpHwRC4T5?=
 =?us-ascii?Q?w8yy/l1QGV4hvwXvHLatPXw0jplUDzr4R8cUcHMtrruMsQSJl+i8gH1Scsqj?=
 =?us-ascii?Q?vkqzroXwPwaOllBIpQ6BIs/tsDCRXV1el21L2uZQm3T3PI0kt9N+xTxO+6Wf?=
 =?us-ascii?Q?Dd+0FcDW4mgjFcJXtmqxSUSPnKXjMiLRQN7goay4DE1BtufyKH6jW8KK0S4A?=
 =?us-ascii?Q?t9aRvV48I0yZGvCQc3dIF7YUHDM4g/YZ0OEKh6snBZxqQhXdNCxxOtyi27k5?=
 =?us-ascii?Q?KKZJN0pSk1hxc0Vt8HDEbywkhApGfaF2+E0l6t2773af5VSVTRNU1lHNTNw9?=
 =?us-ascii?Q?SpgFJSugvijflMiWas9+2JYxinxp99+aXGvuCg5uO5feNVmJ60dmNEN+SDAL?=
 =?us-ascii?Q?uUa8xH0UDJc4Qn21W4o3Cxcm9QXcxnvH0QfeC4QDhUFkIQJD3VszvFhlKA4s?=
 =?us-ascii?Q?2FqRBzKst7DuzxbjoIMQFpy5ubhAGooxKQ9+AolxkqxIIAeHE6JBheDRg6NL?=
 =?us-ascii?Q?jvSYLVlB5fogdxTlxA4bn7470q+G181u9q1NmGE0oA5c72vuHLl2h6CVmNoO?=
 =?us-ascii?Q?Uz9I2OXng771Lb8lQmiGbEg5su4cA39t3Q7EtDB/0IRaKTR/2sK64IJANWhk?=
 =?us-ascii?Q?y96dmKON2SKZ2YILyV/DKbnRn5qPlTQmGsuDlrmrS9juGNXuSLVj4Dcf4idc?=
 =?us-ascii?Q?5Qy3IJhht35ydm05x6ZTlmfj5DEbYdJi91RFgkYUse4RIB31Nf+kUBbl+VYK?=
 =?us-ascii?Q?3WiXI5QNOfIlh72VSAvA5fXNBlXtLaTpQcXXd4I1/Cy+PgjmBqZgcxeTUMgl?=
 =?us-ascii?Q?MveoX4tFePkjx1XlFkFpB+8clBX8gb58T+M/9JRouGZ+/wqxNr8twPv240Lw?=
 =?us-ascii?Q?p02hWTbLuzWDuDSnN3YiS9Q/wBpo1ZuyN8ImwePid8iTWoRRiEdxDuA/F5bW?=
 =?us-ascii?Q?031NYlbPk2bMAjtk3CydXK76ju7vtvQKCYTHnMZncO3hClnG+aCg0w67fcU2?=
 =?us-ascii?Q?0x/3xiDy1/Ceq5leNyQUiIM7WDEIqXV/9AObB3Vk4xUO4kIHgjYA3JCn4pQG?=
 =?us-ascii?Q?h9IPOygbAuj4W09zcw9OnNfNe9E0LS4hW3JiIsMt2IPcr+uMXPFyaAYgOKbY?=
 =?us-ascii?Q?2De70CN7FDTnJ7xAuyiHUTRhWmBvotzh840eUvkHNA0IFSE+PfDewAnI3V83?=
 =?us-ascii?Q?EluQt1A74xn+/3sc5NpyQFGLOxPKE9UNfjlxQfYU26rtZELoDpc8JptZB7FD?=
 =?us-ascii?Q?ViiglaXOE4F6TWakOMpyxiTXSDvbBhYvpulvrjvZ9qb4+uX6VWBcs7PP9A3O?=
 =?us-ascii?Q?aYCUzLL/PSdgjkMYgQsucmfe1PW9mP577yYGLvaRUJ8BdmCWMDPUN7y46O7o?=
 =?us-ascii?Q?UDEjlr/xr7s/cSfIgEFP3L9BQDvLdBatakAOmYFY4h+RAhqzlIuaomYxcCx0?=
 =?us-ascii?Q?SfxWn8Fc8ppjD1yfj9lia6n/thXjq7kHcc9/0S6r?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6890b28-c8a9-4af8-bd79-08dcdc6bcf07
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 07:37:57.7464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CGQOX4AJmv6qht414k40T+d55a7KIehB37ub5URLh+8xjodx3TtRkMh3AIw/71f9kreYerkhdVk0reMVGY/+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6881
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
  drm: bridge: Cadence: Create mhdp helper driver
  phy: Add HDMI configuration options
  dt-bindings: display: bridge: Add Cadence MHDP8501
  drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
  dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ

 .../display/bridge/cdns,mhdp8501.yaml         |  109 ++
 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |   51 +
 .../dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |   20 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   68 +
 arch/arm64/boot/dts/freescale/mba8mx.dtsi     |   11 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   20 +
 drivers/gpu/drm/bridge/cadence/Makefile       |    3 +
 .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c |  307 ++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.c   |  323 ++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.h   |  359 +++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c |  737 +++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   |  692 +++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  425 +-----
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   47 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |   36 +-
 drivers/phy/freescale/Kconfig                 |   10 +
 drivers/phy/freescale/Makefile                |    1 +
 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c  | 1337 +++++++++++++++++
 include/drm/bridge/cdns-mhdp-helper.h         |   94 ++
 include/linux/phy/phy-hdmi.h                  |   19 +
 include/linux/phy/phy.h                       |    7 +-
 21 files changed, 4268 insertions(+), 408 deletions(-)
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

