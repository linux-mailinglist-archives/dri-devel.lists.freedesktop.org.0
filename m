Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2868C85B140
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 04:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7D610E044;
	Tue, 20 Feb 2024 03:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="SrJGMbdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2079.outbound.protection.outlook.com [40.107.15.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0142410E044
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 03:25:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egg4uJ/y0sofIePF7FJEui0X8XOWrvHCO6jPbZ1F1GRm+hSlFhksV12GFBCPfrLskRa6ntLtNL4J/pO2QFf8pJYZs5qLV4U5WLIx5PXzEigLP7USEbKu2Q0nQYhS+tWSVJEcmzXZisaBnnvlyejNrvDgboi418sQSS4Ibl//NwSuHPuKHgSvcdvdtlJdgcr0YbbivO9QJ2lgZ5AZJRYB8iTGIvssP5DQSpLlJ8Itez/EP92oiA5zG/Rxz1aXS+BRJ7CAabWk51QV+FC0SYNeTvfDnr5oHFzMDac09/44OQfAePG991nrLnb/1WBhsJysPHfu75M24mzSd0HWT94iFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Cnt133TIlweFHuUtV1tnxkq4nO8YaJ7OPJDV77FfOY=;
 b=Zu/EXIwCJnJwL8gQpmT4dkFkz8XnUo8jNJcqA/ZGazXB4uPVQMvfn+Ku21WIFhG2c5r0WdzPmm5mqxM2RqLXyuJ1suNNbD7A3EpHMvTo+tAY/wsrh+umD0ZwMiQykNS5S9fthM5Rhlp6o/oWXLsdz06mrSo1qvfuVRA+PVA5Uyeggd3tJQK1hoi8ZY6jv6inax8FHFG0O+R7oKF8H7kdyxENz1YXb9L2RRhkUfvV/8RUPNl39mHxMqrq92gFEJ7zj6M9jln8FB/eqqGMsqSkrOqVaH1HC6JEAQq7fCppSlMH+P+0zFpQ7HwFjnnXjpJnKakopf7j4RfzWXlsmPI5tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Cnt133TIlweFHuUtV1tnxkq4nO8YaJ7OPJDV77FfOY=;
 b=SrJGMbdICHMcn1ncrg6i00AYXOgtVTNNNK6EsaOeF+lwiKfKXQD3ukb9rPXxYoF+76oyuD8ykEwhi+W3U1qRHeOqwDg4cnu90hcr7Xi/QUvj3oPEVJOwHprny3TPRxigA+NYA0BHKiKGlN41vghilZADuB2CveBACE5EnNzba6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13)
 by AM8PR04MB7268.eurprd04.prod.outlook.com (2603:10a6:20b:1de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 03:25:02 +0000
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4272:e277:dda3:2446]) by DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4272:e277:dda3:2446%2]) with mapi id 15.20.7292.029; Tue, 20 Feb 2024
 03:25:02 +0000
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
Subject: [PATCH v14 0/7] Initial support Cadence MHDP8501(HDMI/DP) for i.MX8MQ
Date: Tue, 20 Feb 2024 11:23:48 +0800
Message-Id: <cover.1708395604.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0029.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::16) To DB9PR04MB9452.eurprd04.prod.outlook.com
 (2603:10a6:10:367::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9452:EE_|AM8PR04MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: f047983f-a081-4032-7b05-08dc31c38635
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U9GfW6Owbe6+/HC56tmvxKBT7vOkxp0YzGFSL3CQXaNENhXcUEUN+V/r5eFZOMLBW5vJOtymTMFwxPRjfqfZ5Q7FWBnoRERMjy520NBVh0P78pI8WAj998bXJqqRQxlg49TSquq1V+SP9nEiuBkD9DJ9w8MIzNxcUTKqmvoCfpg+M1FcfAC9fnN2JX+P2beJWYBvXk9/GOP3U1/mBCwZ8vxu24Yo7X0k5CvjVatgrMs4dRfZ4H8/V+gSvYnV8ESltQbCjIdDl+C/OBwLwDl4modw8B4vWlsMdvMb1/iMdh6YM/pzqhjjLNV7ivB9YLk9FvbqoFw2Sv87zyutsdenh9i+NFFTrEM8dSbb+rQpp/0OjwfI7Cq/u+CfULlMhlQwd9qrNV9RUxepzE9lKhc1z5oXsUq6H9stvyMUsHMXNAny7Sm7fIBxkRS3W+f9M/2JGsMR9SU3Xw7C9VSE1GqzsIwTUFMPhCJRKDshO1sK1xDHJexB7syos7LoE7IqzPmZ69ctXyKB7kx00CHSThQX8xvqUDv2tkoZ90CCVLnd4mWJe9ywa5d3Sgaosrd5+xpkupF0HKimF9LZR9r4gTCEM6LLplcyJjbtUkhYzHz3MOZu5arco6zFAfTlora1RLrA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9452.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(921011)(38350700005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHNiQllnOGY4LytkeVY4dWUrTFYwNkZadUFzMmQ5ckNaZFVXNTVGVFN6K3Js?=
 =?utf-8?B?b0xiVm5yS0hWOUQ2UXhybzZHV0xVT2hFbFlPcDB1OE5tU0sreDhwUlJFSlFt?=
 =?utf-8?B?aTB5Z0Y5U3RxQnE0SEN5YWJDSFNwQXFSZ2tOWGFWZGU1THRsYlBEazY2emxa?=
 =?utf-8?B?Y084QXpQTkxPazd4Wk1qL1FlaUFvMjEyT2R4T2tsa240MkpMZ214NUxQVmtm?=
 =?utf-8?B?bXg1NU8wWFlZdk9vanBodXVNUnBXZjN3U2FuWjFYeFlTd005Z0ljU0dBdFVS?=
 =?utf-8?B?ejZSaVBOYnZPcVJuR2ZjN0lzcHpidFJ5V2ZCTnc2VmlwQ2h1L29pekhycThZ?=
 =?utf-8?B?TG9uVGR5K3VGeGE4MVBOUkhoempWQXAvR1lNc0ttbTNLNGZCUGtwdTh0aXJH?=
 =?utf-8?B?eGc2Y2ViTGJjSU11ajNhZUQwSEt0WUN3UHZBTG5WZVhGNEZpQXU2Zjh5cG9C?=
 =?utf-8?B?NW94UStCUGpMQUpDTVZzT2thTzNDUDdSRzZPbDY0Nys2Mms0cTlRTjQ3c0gz?=
 =?utf-8?B?VWZ1NW41N2ZYVzU5dng0WSt2cldSTVdHbDNaZlloekJIZXZseHNET050Tnpy?=
 =?utf-8?B?Uks3R1hGVkViM1MyNlVmVjMrZEVOOUZ4K25VZDZ3ZkZqdkRFMWNRRHN1U0xJ?=
 =?utf-8?B?Y3hab2FYa1BDRnFZbUlrWHFhZXRaZ28yazRUMjI0L1kvTEt5UFlHWkxkSDM2?=
 =?utf-8?B?TzZQazNBcjBXQjFNTjA4cnV0UHI1UU9qZEF0dGwzRk5nVXRtdFZnUlNhKzlI?=
 =?utf-8?B?d3FqOURSQXZLN0UwNDdWUjFFQzRhdXU2UXNKVXg1VDRLcGt5MG41TmkzYk1J?=
 =?utf-8?B?dTlCNnBpZWF0TDB3N2YvQTZ3RnArMTBhVE92dEpUSjZYc3pWT3R6NFBkSjZK?=
 =?utf-8?B?QUhyWCtBcHBieGcxYzdqMkFNQXF6WDg2OVdlbDZjUEZ0dkNmVmt6ODdKeVpF?=
 =?utf-8?B?NlN1KzVlc1QweUkxaG5iOC9wQithY1pWbGI4SlY3ZitJTHQ3SXdsajBQRkpo?=
 =?utf-8?B?aXdBWFZNSFA2N2dqZHBFUkZNN3ZsNVBYVXA3a1pYTTA0Tk1WR0ozKzdxc3ZI?=
 =?utf-8?B?RTlrYVgzTkYvSEZZdFU4YVdwdTRUbUhKYW1nc2M3Mm5iZjFJN0hVVjd3cEFW?=
 =?utf-8?B?N21Zdzk4RnRneFZ4ZkZudnZLZ2xaNjlJSzEvVXhVT2ttWjkyN3ZQK09HZ2Vq?=
 =?utf-8?B?akRQdHJkczJFbE5QQlBMOUJ4SmxMaGo1OG1FbGN5Um0zREJiSUFsRW9EN1JS?=
 =?utf-8?B?NTArWk1ZdW0yd1JDZ3lEVkcrNXhrSk1vRHNDTGU3ZXpicmR1VnVoS0ZqdHpU?=
 =?utf-8?B?ZDhwalp5d21BdUVVeERlL2RINmlXVDRUOTdyQjR4eVRRSU5VWHVRSStqZTd4?=
 =?utf-8?B?aXY2bzZwYUxaTTExdzdTOFNmRE5seWVuSkRmY01LU3VjOHltUFQ2eElwdDdJ?=
 =?utf-8?B?VTNiN0xWNGNJM1F1S0pJQlJpU2o0WFpGc3hNL3JCU0FYWDZJTE93ZFFER2RC?=
 =?utf-8?B?WUpaNG5XcjV0VEpCOEJwdE5EbXVISTNoWktzckR0TW9BVElvakZsZHRKSlNZ?=
 =?utf-8?B?Y1JiSDZCcEl6SjhJUmNtc1ZEOFlWSGRRUE11ZUtCWVBTdXhYUnhKNHVSRTFY?=
 =?utf-8?B?QnNEMnhrbXQ4QTFNWFNFcW9HcDRWODlxc0l6Q1NJWEJPRW00TVJzVVNEOFdS?=
 =?utf-8?B?NEwycDc3VFJvQkozRTlweUNTdnI2dTRGdFlrbFIraUE0WUVwMC9Ca2tTS1gz?=
 =?utf-8?B?dy8xQzVRTENzQjU3UlVNL3RkVDZaSkpXUnZINnVxbHVwdTdKR0FHS1NXMXRQ?=
 =?utf-8?B?STFuZlplZUJPaUdSbUhhcE53anh5TExjOHpnb3BZUDUvWm5BV055U3RwTkxx?=
 =?utf-8?B?ZTNSQ0RRTGtYZy9iYS9rb1d4UmRzbHg1Nnd0dHVlSWlDWmpSeU5GTUJhVjBr?=
 =?utf-8?B?aTl2T2lQVXMyWklyaDJxUmc5Z1lXN0hBMXNZL3ZoSC85YTFGTHlrK3M3VGI3?=
 =?utf-8?B?cWJpdU5ZdnJ5dFl4ZHFZRGQzcjBZV0pQTTBqNHpwTnZDV2JMWEtKNnVqazVB?=
 =?utf-8?B?OThuRG1GRXdNbVkwY3ExbFBQdFQ2N1lBa3BJM29COU9nRFJ3c1VMVGk3bWx5?=
 =?utf-8?Q?C0Wbb0z7mkuMN83wTb8avCgYZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f047983f-a081-4032-7b05-08dc31c38635
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 03:25:02.1848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ms0DdJpYOsENcIea+2FdugR8cDDnENKg4nA1SEHzPGkKoD//6xCBKrq8cgYS140I4DJXFIunC3psVFR8bFXPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7268
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
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 700 +++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 680 +++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 403 ++------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  44 +-
 drivers/phy/freescale/Kconfig                 |  20 +
 drivers/phy/freescale/Makefile                |   2 +
 drivers/phy/freescale/phy-fsl-imx8mq-dp.c     | 726 +++++++++++++
 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c   | 960 ++++++++++++++++++
 include/drm/bridge/cdns-mhdp-helper.h         |  97 ++
 include/linux/phy/phy-hdmi.h                  |  24 +
 include/linux/phy/phy.h                       |   7 +-
 18 files changed, 4453 insertions(+), 375 deletions(-)
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

