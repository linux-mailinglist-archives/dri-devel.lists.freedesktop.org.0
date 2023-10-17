Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2297CBBEA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 09:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C4610E101;
	Tue, 17 Oct 2023 07:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2089.outbound.protection.outlook.com [40.107.105.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA1410E101
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 07:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwhBoIkEPd3f2KWHvLaXk9WkMI/2MWK/sENMFYHoJaFwbgiwht4pyol3qxfCHWzrGWZoXgFk8kwKSb4tgf4LuODRwdDdtevPGH5MVUqgC00q/ZdWX10J9iu6iGMePEMp9OTw6T0FvtAPI4EV/enyvRNO04xANKy5wkml1uKJ/8vzRlxLEHV4RE5p/QoWStK6Ebb6RxNx9+xS1QV0ClhwL+3HcwLu1DijBX+VhrxSMUsW/nlbo7Ex7EdLq9Ww/Hu9nzM/5rN5N84kXtFK06Lc08LGpIO/0BuSQapxqBjuOtmRfEZgbJOl77T/QSAXCSClFLmQJjTmoOIHL5ExEcfDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFhScT8MG2d333LGFzM0gN2S1Fg7wGW3qoGFpsD1aeY=;
 b=FEDcbH6FVPmI4O6DGgwoDK9iELSMarA5acq5OTpx3IL8GerwCdCLvmQpcFgC9J6tWSn1rwuTv3aRvvjdeAD0h0vBGZ4HzOBUnXt8cLzStAKv8SokBP89og2xIi74ZgRPUythR99TIxkoh+WsWuA6ksdJtjmKglEJwg7a2csebeygPAPMJoOMixEY5yzq4HVQjdfWcB4MWWoKPYw073yaChM7FBjBxCj+cbEExywnXmWIkdV9ruylFnfBua1Po3oxuWKnOIt1zcjyH0WRUmXgI/Le+ljcyJlHmpmQx1pKICHqSNUvu0OSa6JL6M4uCVDQDLmuB4+nhJg+gpe2iTUD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFhScT8MG2d333LGFzM0gN2S1Fg7wGW3qoGFpsD1aeY=;
 b=ZSiEG4ILtSuvA36peBmEhTX2L8eZAqXXOyYuzZFHWDb7M+w+gTmLTK3nhcWKtGdBhgw1C2oz3lUlgRdph9r1Hvwxe1A1dIIG8RgXsOBEmFZo1Uk3qb1qNv+yWI6KEmA8qQTgIJvVAbHGnyBC3tMiRQy/TDKY6l5MWNoRqkYfJGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8622.eurprd04.prod.outlook.com (2603:10a6:102:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 07:05:49 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2%7]) with mapi id 15.20.6863.043; Tue, 17 Oct 2023
 07:05:49 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v11 0/7] Initial support Cadence MHDP8501(HDMI/DP) for i.MX8MQ
Date: Tue, 17 Oct 2023 15:03:56 +0800
Message-Id: <cover.1697524277.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0122.apcprd03.prod.outlook.com
 (2603:1096:4:91::26) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8622:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f37f42-a5c3-4b55-f02f-08dbcedf7e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ObPqWNSlAoIgoqBk0Nq6lSr2VGqDZVzt5bFY6/vlMEHSw+uvUe8LoZwLj2wCclHS9vt8iorC6HM9xBDp3j15hJF74yF0ExJPqgYNGzQyzn+Js0Ef20/H8Zs5PK5A7RMXTEx3IX1htZbBQM8s0xIVPnnBneYNoYcgymLy7WTFn9EhdPwdL1DgF6XipGGBMDGKNbwVyDGHvCCEXkddnPfpzPhWQCbDdr4aHX26f8OOIn4QDJ71+nemgajL90/57sFTNDxlnsBvyWia+BIsHwQAd3XVdCSJfqubO1HF3PSsi2rg4LyBlDJBfVL17xgajxPg5aWoE6fFctcAFRQY1Ho24yCwS7P6yPe6eUpm0uYq6vQ9sv4Ng9+Ktd4L6xXJn17DKd5UnFMNY9X+6J6TbGz86OEp8hsvRH4yckxEfzKQw3w1EPSlFOVeZlyLxjjFOZVCDXjb51B/O3TRrcnwKRvMilN/cYsFJzfn95HGgivy6yVGQQH+q3Jer7a0/jih0PPu3I+R9U20f9o9eB/xK1bTKo3gbk6GYJuwgd9R+6Y64FOOXFPFzxgdGZQ0jG4IKSDjQPBDf+MGxgOHk68s9a/6mNw9VYbaJzgumpIKMXIKUao25m5l8RBPWWrdU/z9E17Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(478600001)(2616005)(6486002)(52116002)(6666004)(6506007)(41300700001)(6512007)(316002)(5660300002)(26005)(66946007)(66476007)(66556008)(38350700005)(921005)(36756003)(38100700002)(86362001)(83380400001)(966005)(4326008)(8676002)(8936002)(2906002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEYzaU9ZSkdSNklrNkY4U055Uzh6dld2UFF5OUZ6Tk5XM010bHNEMGJWdm9t?=
 =?utf-8?B?YllEN0FmQ2g0dlF4K1FIWkpNNG5lVWFZV2VJdUpIRnlXZlJpdXM2anF1c0Fa?=
 =?utf-8?B?SU5qSkVqWGVLNTk5N0hUNHFFN1p4aGdSVWpkZ1RlakZHQk00ZDdKZGgzanE1?=
 =?utf-8?B?bWY4elBVSUFyMlhoNnZiK2l2Q29tWXZ5Q05CZkdmZGxCRnhvcVdEQ1p5MURE?=
 =?utf-8?B?VXNldEc1cjBGandLalA3OWJKVkhoTVlMckYzSGZ2eERrOCtITmlBM0tKZWQ3?=
 =?utf-8?B?dkhETlo1ZUsyVWtZdUtPRTRUbGU3RUJLWUhPdE9vU3dwMmRTbm9DaHhhQXBt?=
 =?utf-8?B?TzcyNHNJbkFNOVBCV2tqZ3dBSnVRZ2VQQ0NRSFAwZ0EvOFgvN0pjSGh1cDM4?=
 =?utf-8?B?T1V0ZmUxSzNSMlo1Y1J6dXNmbTRMVHJUN0lZV2JkanBaQU9reUdiWDg0THZy?=
 =?utf-8?B?VzBZYVhJdUFmQnNZREs5QlUvSVd2Ry9Yeis5SGl5aXVqTUlxKzZkUVlrSVNw?=
 =?utf-8?B?SGMwS1VZZjcrbE15ZTVGd0gxZDFQakpiK3VXN2JMbGcwS0RxWGlMaDVDZlMx?=
 =?utf-8?B?elVDMmltK1drWjRORGpRODYwUjUzTFhlWnJ2WHcxelRqNzdvQTgvNkJKR1Vr?=
 =?utf-8?B?UFVOTnVIdkF0MnFhMVpkQXhwTVZMVk9qbW1rS1RPQlZqWlJhbmFicTRaS1RJ?=
 =?utf-8?B?VkVtWmYxZ3dTcFM2Nld1Mm9HK3JQRFJLM0N0SzRWYnBKeGF2YmJjTW5HWGhE?=
 =?utf-8?B?MzNXbHJndmg2T2dqbFJGTG5iWmdsMzlaV0VMTVhGUkdRd2tXcGMzcisvbXBI?=
 =?utf-8?B?Rit0UlV3amtUS0hzRFlvUVZhRFJKMVhhaEVHcHJ5M21aeVhBNVY4Sm1HYTFw?=
 =?utf-8?B?VlZVQk9ITEptdDF2MzFkdHJFVEM4S0ZZaFFwT2MrY3ZOZzZwZ3pJYVFzODBG?=
 =?utf-8?B?WVB3WVNFL2lNL1Q3ZWtFWkdWK0t1RHQrUVhKMzFhNHVzVjFDYm9QaTlVK1J0?=
 =?utf-8?B?VDRSTnpEdHdtaXp4U0JPUUdzMjA2K0x3aVVSVkEzMndhMWlxYWhvdTRiS3ht?=
 =?utf-8?B?aHdLRk5KQ09EZHRKc3ArcmxZUUhtd2lLaWxsOHdOdm5oMFcxL3FhQVorWHYr?=
 =?utf-8?B?RFQ0UW9SUm1LWFVkVGRkZWlpOFE0ckR2eXRiVUxWL1k5L3BqMVIxeDNoQ3pn?=
 =?utf-8?B?WkVDNzdnRWF4dW9DYWZ0MDdLZ2hsbU5XTWJGL2ZueVMxbUJhblkveGEwOG0y?=
 =?utf-8?B?b3F3M2RFV1BhcEs2N0QwVTdnZ00vSVB3cDBGQzA3czhGd3RrdzIrSGhCTnha?=
 =?utf-8?B?VkhpWUoreW1iamJFRjJUQkR0K1pTYyt4eXlRemFPRHVEUTFBWGU0NE1yR1E0?=
 =?utf-8?B?c2kyYTBwcW1mdFZKTVJGS3FaLzdreE5pV1hTbHk1eForWnNmcnkrNnRvcHla?=
 =?utf-8?B?ZlZuUkU1TFIwZFFtRXhkWk91YksydnYrMlpqSEQ5SnFiMzdYcENTNXpTcURT?=
 =?utf-8?B?dmFkdnV2UnM4dnZ1c2R1NEo5c0s4cXF6OHJJR1NFWTliRzN3VVNuRjlsSzZI?=
 =?utf-8?B?UEg4V3hVckdkWnNLVGRpbGZUd2F6RktKS3I4YWg3d3RyWDh5VjZZTUNmQWhm?=
 =?utf-8?B?MTZWaTV5YkxFM1haZmZSeXVHbktTZCtuRlA2TDhSNDFueWZGMFBGajFRM0Mz?=
 =?utf-8?B?NVRjTzJ3WWhjR3pNYUVtL0RNS3VXcEtEa016cjNNemJEQ01IdGpyMnhQY1RY?=
 =?utf-8?B?ZjRKZExGZ0Z1VWJUc2hHNS9GUU53THRNR2FSemo2bHNOOTErNlpQZGVndDVn?=
 =?utf-8?B?cS82TjVsMFVHOWdSbXFHd0Zsa01iMmJtZ3JveGRrVzdubnBTMDh0NUlYMWEr?=
 =?utf-8?B?NHdhNERuR0xwcTgwdVlab3BTeGRDcnhYM2ZCdE9GVkg5ajNFbVU3WEh3eXp2?=
 =?utf-8?B?RUZOa2EwczZnUEQ2YzI1R2lzZXJkM1l1UHMyMERibk9zN2t2V2FHaklvZ1lu?=
 =?utf-8?B?ZlBRV3FyZTJ2bFVhMjdRei9aSDlGUi9JRGZzSUp0T1JMUForc0o2ZU5RVG5t?=
 =?utf-8?B?M3EzczgraHNDZERoOUo3dlYxdnVYVlBwSlVjSUIveGJlb0FzSGxJR1ovcXJx?=
 =?utf-8?Q?7PZC52aapJNgfS0foENyxJtpS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f37f42-a5c3-4b55-f02f-08dbcedf7e57
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 07:05:49.7808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQSWnmo2ts9pmSGtMUQY5BXr0fahWHPUFFmpPfPnDDaMixk1Nbb6Hx9iqIsNW7wY7AuT1Smn5TUF53FOtBb9MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8622
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
 .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c | 304 ++++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 315 ++++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 365 +++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 708 +++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 673 ++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 403 ++------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  44 +-
 drivers/phy/freescale/Kconfig                 |  20 +
 drivers/phy/freescale/Makefile                |   2 +
 drivers/phy/freescale/phy-fsl-imx8mq-dp.c     | 720 +++++++++++++
 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c   | 961 ++++++++++++++++++
 include/drm/bridge/cdns-mhdp-helper.h         |  94 ++
 include/linux/phy/phy-hdmi.h                  |  24 +
 include/linux/phy/phy.h                       |   7 +-
 18 files changed, 4445 insertions(+), 375 deletions(-)
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

