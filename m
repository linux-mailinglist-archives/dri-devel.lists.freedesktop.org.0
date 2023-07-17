Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B23755DC5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF6610E1F6;
	Mon, 17 Jul 2023 08:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2078.outbound.protection.outlook.com [40.107.104.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB6110E1F6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:04:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoFPMjL4znpgk3DKkqD/OBYusQMI7SB+Tw0BsZb/RlF1HMj6Jv8Fkdy4ChH5VYtF63U4+mrsxnqmBq2hV77Mm5HgDwtmmtpoBlJ4lR+Uv0eLuX05UOnGHFvZxQx+DTbtpv2DAgSE8qwCZIUtCH5d2oWhIW2Fi+bKIF39CDFBp9JRWQuGKfo5YxYJ8jfsQClC0JG0unJRoMcMCfSBIaqmEYDk/vRtIka2x+XYrIB0T0JIWIHX1fFJfBlnH8ZUq3A2Ec+xSg40xXlR5pA1p+0OA2DD5uMawDDm0bpWgrd96/mZfMuFwc5+W+HGjomm+pm1O3HA4xJe+moQi437EgMm5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N70qR7/+sUxx0rPRMt6agsbSolM4bHlO9MnxMZ0T+lE=;
 b=U0N3khTBwOpK6NxgFuqu6JEIy/014RqZCFUjqq2Xpc1J+OrLX1j5kJDgqk7rc4czCAbNku7yJ/rDVPTw0hz4XWKjN6S/w97RyiLwZT65VJBSV1Funx1OpLFU9y0B7qykJj8G/Ehd8XVRmavQZZ1FsVQ37s++adk1AeOfR8SIFun7v54owgfkS86vX4gWl/RbATN7emZAxZpOK440xhujU8zd+z24WKy98FQXvG+zg+kulcgf49bU6FnUiOb7C9b5XEvyTlzqpqDCrE9moY0kFOIYgHpkybYPrEULGjqdf/zO0dbjWGp1UXfLhxEnku32MxY/+khO6E612uk7fWkysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N70qR7/+sUxx0rPRMt6agsbSolM4bHlO9MnxMZ0T+lE=;
 b=VA0ybkAr6sWui2GaVr1yIS2RQ5QNMb0Ds+gvnszKbsHy+o+1oUZ7YzzxgJ48pXCsdPA3XL5UPzDNvPFkT/ggZP4VReugPsHlHnG5X6fXa+h/gR+ylYERi/AGDRP2+aXLblaXCxJqzRSyRy/GoRrXcsUE8uh4jvWUINIGAdYETJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB9234.eurprd04.prod.outlook.com (2603:10a6:10:372::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 08:04:39 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 08:04:39 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v7 0/7] Initial support Cadence MHDP8501(HDMI/DP) for i.MX8MQ
Date: Mon, 17 Jul 2023 16:03:46 +0800
Message-Id: <cover.1689580812.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DB9PR04MB9234:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ca9b17-3d42-4011-e701-08db869c7840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ygUmhunsCMUFPHZz8A7ETBS177gdQA+2HrKUSmbMPQef7tmOQBNghWfa++rFsXfslJCHfY+eR3JmdWbFb4l0/5UPSLYupB99x8zxY69MtFFyQ9rcqWHWPWpH8ky3y1JzAFE9kS7vz7ZwkSIGMp5kzzYOXf1JoqxKk4b5wgDapFdZJuygPiWqmrw1AFsDP87xazymVobuvQ3cGfRhzkhLdM7AfDwc2hsagE9IKqFSFaQVjJRVwfkZsuw3ttQU2Y7PwWexPEqoY3OVXt9Vghus8hn9u+cwvQkeycE+FEkyFQjEg+mWYOFcT5Z1rIYHx4cBMvytEd/kjb8EY0ifm4Bu9p+gUbCjrX6k5Ym8+++Z2a3xzLTQp4UmN6UUBuslJcsJytOLW8uvUFCibsYh92XDuDsZJff4Q41PtmKbYYmxxrCaD+BxktE80sZNrindly/wSXDs9yu11CHRd+Trvdd/6cHKrLjYQUU6hHUJQC6ltafrLOhxlBj2iK/MLWgVGYC712/D4F/L+6LwULP4sPsyfw2zg3la2V62CWKYwTR3OKNIc46rCcIglkPrHy4fq0qU4B5O8w+A/OIgl2hbnLqJh/10jNqqZHQWUG60HqKPTkkG1ptNqaKY48wD/cPoJwzs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199021)(6666004)(6486002)(52116002)(921005)(478600001)(7416002)(5660300002)(8936002)(8676002)(2906002)(36756003)(86362001)(4326008)(38350700002)(38100700002)(66946007)(66476007)(66556008)(41300700001)(316002)(6506007)(26005)(83380400001)(186003)(2616005)(6512007)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MENJZU9NS1Z6OXRhRDcxczJUTnQ2TjNsTzFDeDREcnE5MVYySnBqWVUrMGoy?=
 =?utf-8?B?all5Q1B4ZkFZQWdPNzlDZ2w4eHdCQUZTQ2hSZVJDUnhNSTY0NzZrc09hMUV1?=
 =?utf-8?B?S0MwWUszNzQ3T2pSdDJ5U2JRd3QwSkFqaVBDY1UxY2FEckZNN0toYyt1R0pa?=
 =?utf-8?B?aDU3dXp4RXhGcnBEdTBzZ1FycFQrYnJPWkYzMFowT01CTDJLZ3hpTnVHeHZk?=
 =?utf-8?B?bjdwQ1V0WnZhVkRJbXFMUExLampwc0pacWNNUkpMQXd0YnJwVHJqUjlQdjND?=
 =?utf-8?B?R21qRUJDVXhyai91aitEL2MxdVNiSlVoamJrbFNBQlJwODhSSDByaUtBRThx?=
 =?utf-8?B?d082SlZUd1R3ZE8zWVM2RldUcUVuRkFyWTY5Uk1MWmcvaE9xZitEUXZVT0Z3?=
 =?utf-8?B?UVBIZXZpN05sSndkU29qdU5EdzQwR0x6Rm9nbGRHQUJEaCtQbyt3aHlSMEFR?=
 =?utf-8?B?Y1FpelYybSt3N1NiUXBMSi9GY0VYUmpOUktIWktvam42NUxUMEpSVnYxYyti?=
 =?utf-8?B?MFFKSWZ6RnFKd29JZ1pyYVR0YVM0UWhiN0hDLzFDNDJiRk5zNVJ1TFhyL3FO?=
 =?utf-8?B?MnlHUm1wVVVqQ2JCOXFXTFFCMVhTT2pRY3pUeENFNkQ4RTRNS3Y5Y0xQSXlq?=
 =?utf-8?B?dXZEeFhucHdsMnRaQ0hGTHdpZ1VCK0hCcHZxYjYxRWNVeDVVb2RxRVJXK1F3?=
 =?utf-8?B?QkZXRlVvWUNjQWt2V1BxMStsYmtjWEluMkVnMnVYNVNFbHVna29rQ0FnT2xT?=
 =?utf-8?B?cmV3Nnc5NnFBQ01EVTJ1bTVVcGRJVjFqeVZzV1JVZENraVZpNmlHMkFQT3dh?=
 =?utf-8?B?Y1pyK05SYXRFT0RwcmVUVjRjS0hXUTd1dVZmd2dyVmh4ZlFpWEo5UDBlNlZY?=
 =?utf-8?B?L01WUTlaUW84azd0S1hzRlFaSlF3TEpsV2hhLzEzdjdlOU0xanJuUVNSa0dX?=
 =?utf-8?B?eDM4Ymo2Nkx4djYzMmMwQXpjWElVTjVDY3JxM2VIQXVZQ3hhL0pPdk9WeHhV?=
 =?utf-8?B?S3loeXNURDRoN1pvVE5OR2FnajJuM3l3bEtnR1BjQ2lTVnpkYUFKcngzK0Jx?=
 =?utf-8?B?OXlJRG1hWXZrZm5BUlcrbTZtWGZnZm9UY01nRVd2cGJOMmFwVFkrQTVnY3Av?=
 =?utf-8?B?M3FVWFljb2lZd3N4VFc2dnNod3dGVk5YRlZZcWNXWkNST2Vub1pHN3lqRUJP?=
 =?utf-8?B?b1hsRHNBOUdqei9TRzgvdmZ3Qnh1MHVQNmJadWlEWk9jTEEraXdUYlpRUzc2?=
 =?utf-8?B?NXNBOGo1OWdBQk5NbldSNmxJOEZyY2RmOHFrdTdURXV5S0NVdmdQa0tmV1lo?=
 =?utf-8?B?dDVmd3RUUEpxeEtIK3VXenpOMU5Hc3FPWUlTbnE4OThIL0dqV0tTamo2L3ha?=
 =?utf-8?B?aXlnUWlWZ3gxYUhoOHpKc1VYdklZSXhwQkd5WDZtYXlpTTl1NnpnOVBhTlJZ?=
 =?utf-8?B?K2JVUG5RVm12V3VOaFcxTGs4eTR5bENVVjBLOFhYMzVMQ3YxTk5mWXB5dmxL?=
 =?utf-8?B?Wjh5V3NXaVoydTd5OTgyNURiT1JzazVENWhDUlhpMjlXOVZaZDNDMVBkNEov?=
 =?utf-8?B?akJrR1dPUlR4NXQvZDFwdEFxazVWWEZHNXBacU9pemJNZ2RWNjNUdDZCbUVI?=
 =?utf-8?B?Ry9ia0twVnYxa1hiUldoeWxSMk1Lb3ZobWpKZ3YxbjViVUZNV2ZXSHpEMDRY?=
 =?utf-8?B?K0JmNkxHRkE1RmpOdDJzVE9mZFBTekV2ZzZFbGFqS1RXS0tKd1AwYUJtQWp5?=
 =?utf-8?B?U1pTM25EUURIby9aM1FXK3IvZG03S0RsT1BXSnNQcVdObjZHRGprMVdPc3Z4?=
 =?utf-8?B?OXpNMFZuRDczTjUxMFFMQlYrQ2lkZ0VUclplUDdxLyt3UHc3VjFzVGNxTGRH?=
 =?utf-8?B?djVFZi84V2llMWdHSkpCYjRtdGYwVkdQRFlOVERUU2RENWZNUGFsNEdhMzcv?=
 =?utf-8?B?T3pnc3o2cEp4ZDVJdTFMMW1HMEF5aUNiN1JvWkR3bGY4UzB2VzRMcThrTDhR?=
 =?utf-8?B?cGJDMk5EUWVBOHY0alI4TFV5LzczekxGTjcrVFJ1MGtpWjVqL29VUld2M21G?=
 =?utf-8?B?L0ZmanpQWEQ5dE5Lazh5U3FCMEVObEszS2ZmcnA0RTJ0eHZnSnU1TXMwSUZw?=
 =?utf-8?Q?zf668rg6b2DSqDY79LE4UZCTC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ca9b17-3d42-4011-e701-08db869c7840
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 08:04:39.5265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPm7or/JSs4kun/yQNvhAPNy3zdrcFjT1K92QPra3iCDLtO7o+1zNvttNHMbZbZZzDKgvL/1Eo37cAeKwzy99A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9234
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

Both of them need the followed two patches to pass build.
  drm: bridge: Cadence: convert mailbox functions to macro functions
  phy: Add HDMI configuration options

DRM bridges driver patches:
  dt-bindings: display: bridge: Add Cadence MHDP850
  drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver

PHY driver patches:
  dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
  phy: freescale: Add HDMI PHY driver for i.MX8MQ

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
  drm: bridge: Cadence: convert mailbox functions to macro functions
  phy: Add HDMI configuration options
  dt-bindings: display: bridge: Add Cadence MHDP850
  drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
  dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
  phy: freescale: Add HDMI PHY driver for i.MX8MQ

 .../display/bridge/cdns,mhdp8501.yaml         | 105 ++
 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |  53 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |  15 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   2 +
 .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 313 ++++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 410 ++++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 780 +++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 674 +++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 195 +---
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   1 -
 drivers/phy/freescale/Kconfig                 |  18 +
 drivers/phy/freescale/Makefile                |   2 +
 drivers/phy/freescale/phy-fsl-imx8mq-dp.c     | 698 ++++++++++++++
 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c   | 907 ++++++++++++++++++
 include/drm/bridge/cdns-mhdp-mailbox.h        | 240 +++++
 include/linux/phy/phy-hdmi.h                  |  24 +
 include/linux/phy/phy.h                       |   7 +-
 17 files changed, 4248 insertions(+), 196 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-dp.c
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c
 create mode 100644 include/drm/bridge/cdns-mhdp-mailbox.h
 create mode 100644 include/linux/phy/phy-hdmi.h

-- 
2.34.1

