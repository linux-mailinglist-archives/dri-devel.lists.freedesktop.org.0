Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42340848CBD
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 11:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE1810EB3D;
	Sun,  4 Feb 2024 10:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NXS9rOcW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2065.outbound.protection.outlook.com [40.107.104.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A445610EB3D
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 10:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XX0GUcBMxP6725MUpxyW+HPZvWJ+hH105RUAYV4eyKZRKm340zaWnbJM9AndOZI7DxmWSI5ewuYbf6cxqoTuIa7Wo0ID2LhfUWdFRQTQHYj16gfxsV2pBWs4Cx6vtzGOenz6g8eWW2UFouGD4mFKZPNbZjXl4mEwxpPkLuoOoiKzFnYoB6wTzxmX9c2h6c8lPMO//o9pPSkxZbk0dJmi7xrVFhO16C2ueZqbtLr3Zd27j78PxzAPMn021jAyEAx/PR5mzY9PswBg9348jK3OTooewH969CTVDyM7UqxmAdB+zFaAoVjIpLzYmFNsm+UAkgghvyYd8csubvLafk0DwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmDu+Vrvxp7pGdltiArzNeE1WOCTkKjJoHHRhml7jEw=;
 b=LZDKVZZbwwFN6oW8YA93AQgiM9ebUw9YEAKgyrCfPGPwSn9zFYSXqTz1aY+D9McG81KRvE//wpr8IwCDcjAgEBULN89y+4UAiSSeEQ/J9WAe11hyj1nCyYnvY1eXZTqFQZOClCdaPsaVF0Zx1KIBF8EULciT6Y2zSpxVbwXW9jyaLK0KkhWecBW8vqcf3bCKZp9yE1SmGW4dloK4HJSh5gKd82G4X1vNMkl7bkIPMrZdjqYmFkvAJkHgTJjJgg+u6Kw6NFl4ZvnLZwGc2Jnif3YDKBwsSmLOZmzWdsv48AY9MbWsnvy162pKOtLIpF1NcVmOhcDW7saCuulFewaPmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmDu+Vrvxp7pGdltiArzNeE1WOCTkKjJoHHRhml7jEw=;
 b=NXS9rOcWo27S0SKTdt2SHJ+7lMjI6h7p19szKy5tQ98uFYhJAODyiu++qdUG/cS5enipdxfMmB9Li233pDh0DkHqIcNYBZJQswW5l398suJE+8GtYW4ydhaGaKIFJXQYLIVMo4TT1UXuHlfQ43xPkTowUwTfAS28O8gIzXafwuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Sun, 4 Feb
 2024 10:22:53 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::b24c:5d0d:bb15:3e9]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::b24c:5d0d:bb15:3e9%5]) with mapi id 15.20.7249.025; Sun, 4 Feb 2024
 10:22:53 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: [PATCH v13 0/7] Initial support Cadence MHDP8501(HDMI/DP) for i.MX8MQ
Date: Sun,  4 Feb 2024 18:21:45 +0800
Message-Id: <cover.1707040881.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb696b5-2e45-4925-0e5a-08dc256b3f63
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BsRcKOaeevwXYuDJg+pHppxQrTWZ9A74xmsrbnf2ztBDjVIsYNQbrMgJ1tnWqnwc1+PRxhTYnoIBUaAe2oAmdqFWH7W5/a77tQxxJjnOLS+9xofo59fsHDbZQ3316HbtrGQw/6+UnoOej19fS9OqsvEmkVJ9527F/Quolb2+YqK/I4Tn5alLa4EFRM9Qe3bgkC6fEhP1SwzN2NETw1AJQnf9zmn9tKTEzgfmb5n0F2l6/M38bVbdF4LT1kZWkpvivV9UOYZyzgpXgAzpNjkOFxNrSFKdNf4LYzr8T+Q0hD7cxvn67DN08DDTb2urRLyTvCNJVVXg6JYwuNuhCT4ucUoM9DXwuY5HxJXzd9ce2MSy3placAldd6grTPxQ6O4MGSRWwtzof5RhIPMTvI05gUG74tfMO+wLq0ifSSE1cWpGHTRwG9sfSH3uRhH9j1cHV/CuWTJVCeFUGDCt1SjlU8Eoo4XUwqX7ZByYTAcZaIKOY2cIXaU3wrqeOS/JU4b85Dt3lQsLUTbwLCs+1smb0e7KjI2UsR/KaSJTWQ1RvAhw0yF1+XB/tP1R3cx0V37iqpJnYD75V2nndtgV9cdQCVZb1vf5TpCEdf8O8GFQODs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(396003)(136003)(366004)(376002)(230273577357003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(83380400001)(26005)(2616005)(6512007)(86362001)(6506007)(52116002)(478600001)(6486002)(966005)(38350700005)(66946007)(66556008)(66476007)(4326008)(8676002)(316002)(8936002)(6666004)(38100700002)(36756003)(41300700001)(2906002)(7416002)(5660300002)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEMxV1hmKzYwaVQ0N2ZOL2pxQlhNNGg0OWFaVXpTanJyRXZvQkt1SnE3VDBh?=
 =?utf-8?B?TFNZZHJSNlpqMGprK3l1QkVqaGtLUThlMkU3bGV1Nk5FQWdDSzZJRjAxOXFs?=
 =?utf-8?B?bndDQTUwN2NvT256ZDhGdmtPRG5RUE5ZaFA1MkVZeHRVMmFxWHpNV09lWHVw?=
 =?utf-8?B?MUZ3OUVNOUJCWWtKa0V3bGhtSzNsc3NXcFN2cnNhYXBmemYxd2xOOUZneDA0?=
 =?utf-8?B?RG54L0wzVTFrNVJ0MUsxMVlqL2NXY3pDNkJBa3hoWWtheEJ2ZERVM0FMclJF?=
 =?utf-8?B?MTdMTDJLbUl6MVZHd3J1ZG0remhESkJzZHJRdVkvS2JnVDdXVEN2MXJNZHpL?=
 =?utf-8?B?MDBFSjB4TkM1ci95SWlPMjZjbjQ0aWEwcENIQy96Ykx0TUl3aUVDcnhrZ2oy?=
 =?utf-8?B?bEw0R2lVendseitKbkFPUzUyb3lYWms5M3JYaXYxT1cyV092WTFBVzBUT3ZH?=
 =?utf-8?B?R2xYSTZwYk5LeXByNHNuMFpnNVBWZ2JjR1VIeExxb1h5Qko2VVZudDZ6Q2NU?=
 =?utf-8?B?anRKVEZ1ZEQ2bUh1N2k3eVlXZmF2c2paOTljcnI2SVE3T1Q5emlwalp3Rzkx?=
 =?utf-8?B?UGxhUXN2eTFjTmg0V1ZpN09STWJCUGNhRkMyUiszeGU3RWlRaGdUdXpobzJX?=
 =?utf-8?B?Y2wvTUc0MWM1bzlVd1d6bFQrTHJQblViMHR5NEZqczkzRnVGcmxrUnV3K2Nr?=
 =?utf-8?B?MzBUNGptUHhOaHBuL1JCcHR1Kzd2dCtYQkMzcVdKOVd5Qjh1UnVVbXgwRjAx?=
 =?utf-8?B?WjRjUUQrcTI4NGFkY2FUc3RkditaSHhHOU9CRS9xV0FOb0NSa09OYzluRWlO?=
 =?utf-8?B?YmdQc0JGOTNPNmtqQWYxUlNRcC9iaUNlMXZZQVRhQkJ1ZnppKy9YaUpzc2p3?=
 =?utf-8?B?YTZDQ2Y0aTNPUmF0MmMrenlnQ2VTd3NjQTIvdTYrTVlPRXQ3dUFTUjNHZVV0?=
 =?utf-8?B?eWJwWVM1NytDd1l1QjdRMEhNVEF5NGd4Q1ZIVEVkNzRld1NyK1MzcVl0OXVr?=
 =?utf-8?B?UUVML0grSzJHS0dZbEJnaERwQm1nN0dJMTFmbjlpVkpMT0VLdFY0UkZTUHFP?=
 =?utf-8?B?bWh0OE1JUmJWR2JTc1BMY2JWcFdmaUYvVW4zdlJFbVRURlF4OWl5WmFMQklH?=
 =?utf-8?B?cmJBYjlqUVFpd1dYWW92TXl5VDNOMW10Z1NmUXI5Sm14UjdtQWNJU3NhZ2lv?=
 =?utf-8?B?amJJRFVIVzNNM0YrajJDcGNFTnZZRDhac0FWRGd3VEQ5YU5xdjAxcU4xT21F?=
 =?utf-8?B?aUlwaXVoQlljZlorYzVtTFZ2RUNzQ1hZZ1FlQktuSTRpNGRaZDlUMDNjTkJB?=
 =?utf-8?B?dEVQRDBVSDB3TVVEU0R2MS8vdGg3MGtzSHJuQkZSNkV3U1UvTWo2UTJ1Tnd2?=
 =?utf-8?B?T2lBS2JCQVpyTGtQemp1cDROYzNScWtoK0dFdDB6WDE4VWVTSXpTdWU5K21O?=
 =?utf-8?B?Uk41dFYzTmtjdXo2OXNGWWdiM29SMXhSMzNScC9aK1pRVDFvUE1hYjBmUFBo?=
 =?utf-8?B?LzlqM0xBdVJLekpFOXpvWlV1aTh0SEJ1OG1PZUxiakV2ZXJjcThlT0Fhb21j?=
 =?utf-8?B?K2h0cGVWSWF2Z09Zd0VGaGt6VlV3aWg4Q3V3SGV5d1dTMTd3OEwzcVdCNkEy?=
 =?utf-8?B?OXZRVmNUR2E5d1NyZjlFQ0l3bVlHR2dEVjgxMGV4a01NSi9ody83QWZnbmRs?=
 =?utf-8?B?cFBJQUhPT2JHSm4rMDROK2dGelZXOVd6eS9xU3ltYm1NNmxIT1QyUUdzaDBp?=
 =?utf-8?B?cnpONkQwa3ZOSi9vRm1Pd0w0eTJZSUpHZ2QwODRNa3dLYk9TajYyei8wcVIw?=
 =?utf-8?B?TG8rcFcyMGZoMXc5U2k4Q0YzcjZ1NzcraCtGZXZOU1B2YmM2WDZ6Ly94YUYr?=
 =?utf-8?B?YUUrdHYwaElwdk5kNXFhdUFJVmhqVVB5OUdwWjk4cDZpVnVncmc3SkJsTlQr?=
 =?utf-8?B?c0tqTTZRZWE0STZGMGJSQ1FvZUJUcnVKdXlwVVIzd2hERGF1YXJoOVhTc21C?=
 =?utf-8?B?K1pFVE5jMkljZklFVVlEQy9TVU0vTzdPTUM1aGFHZnpZRDJaZHRGOW1yeDk3?=
 =?utf-8?B?M0htcW9PNWVHYlVxbTRNTm9XbW5Pem5CQm1maWdhczN0MVNsMXk3NDNNVWpL?=
 =?utf-8?Q?6EUy7szUPk6EThU4dATvklkWz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb696b5-2e45-4925-0e5a-08dc256b3f63
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2024 10:22:53.6668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2d/DOVyzW0r5KJeQhBR5QH+Y3I08FGEtqQKzHPC+d1Jejq5VrkpJxx49hCsv4I0g1xnNONlIBJdVy4csEGNUug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
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
driver and Cadence HDP-TX PHY(HDMI/DP) drivers for Freescale i.MX8MQ.

The patch set compose of DRM bridge drivers and PHY drivers.

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
  #6: phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
  #7: phy: freescale: Add HDMI PHY driver for i.MX8MQ

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
 .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 316 ++++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 365 +++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 699 +++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 679 +++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 403 ++------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  44 +-
 drivers/phy/freescale/Kconfig                 |  20 +
 drivers/phy/freescale/Makefile                |   2 +
 drivers/phy/freescale/phy-fsl-imx8mq-dp.c     | 726 +++++++++++++
 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c   | 960 ++++++++++++++++++
 include/drm/bridge/cdns-mhdp-helper.h         |  97 ++
 include/linux/phy/phy-hdmi.h                  |  24 +
 include/linux/phy/phy.h                       |   7 +-
 18 files changed, 4451 insertions(+), 375 deletions(-)
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

