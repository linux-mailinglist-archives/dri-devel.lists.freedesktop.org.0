Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 497E7796E50
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 03:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8553810E73C;
	Thu,  7 Sep 2023 01:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2043.outbound.protection.outlook.com [40.107.14.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A3810E03D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 01:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJDOnU4tDY0eUEq0ieT/Wr6id9sSJwWiWSKpCgtRB7p+neL1h2l7NeYALiNOeXc4neQDllqup+TWhmoj8KpebrpPdWcFi6O3+U5PqdivcWPOq9UqwhAQRev/AEMtrNStsnxsXYMxRDDWnf5VgBRzHVeMmvWK3wELdk8IniChxJYkBwM7L+SdYE4Pv7Ky5KaT69mNwuHk1aja7jWjXjjTWPwEVanZhhbeiCLFxCgcdC7wUTo8kGlny5y0CdWrhles2IV99eAbhWizCbOS2qnxxCXaRob3wsTdP29qkhRem75D3p5PTrrSNOoMsVBQ9oyxIU6H3Qe/lXAdEP91k3YW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jP2mBxCcR16jkbGXryEF/X7CXtxDCTZtf1B2XBERk24=;
 b=i05GKA2mRzOfyCc7r2CFlUfgoxSiVFAQ83ETsBJMsYBx8qZgbhU5mWYlygIkE7FcIYO+KFLurNuToBdpIEXpqBjg0pY8LDpMuPDYor9Mgrrc8dEBZeLbmA+RcPMiW4l0dPboM//M6vvukw96P7/476pSNMJEu83XyVj3HfsA7Ha6Vs0UrNaSDruHqMSQwInwEPqmGWmu3uU33JG4udKAOSRWvk6FZOeh92mKv0E4JMve9mrhV1rXTVPHepdKPSvL4Vu1XcLFRNNafGuJwjGIfgoG14geic+s6/AWS5gogBxFUUpog4oZ0LDpNB0S3lFWoIHcgWlf5xw0uqmlNFpF1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jP2mBxCcR16jkbGXryEF/X7CXtxDCTZtf1B2XBERk24=;
 b=rDFZGwTucZJJefqApQwElb0zddD+6PB6TjSMpzvBKC+DRhskwDCEEiu1yJ1zvo4kbScjwvDChPH37NLgBOgwdbLIi8jXo2PPFp5bAfavDcDS67Tv4k4oVEWTXI1bTz85f5PicPfp2UDnINpg+haMffwzlCb6uhRa5LNdG1Ih0Xc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6802.eurprd04.prod.outlook.com (2603:10a6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Thu, 7 Sep
 2023 01:06:26 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 01:06:26 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v9 0/7] Initial support Cadence MHDP8501(HDMI/DP) for i.MX8MQ
Date: Thu,  7 Sep 2023 09:05:27 +0800
Message-Id: <cover.1694047629.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a0bb16-3d18-4657-a3b4-08dbaf3ea8f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zn5Tlc/OgJQmsZMDL+p3gTcMxSX/oX4hUmXe+z3q6dLpVF+bqrefT8GsFYrpd8SEXedyP7YMKHIBLJeoVhz17qeqGMOJI96JDp+o0sIL2uY9A7Q+8p6GvWwX2N8eB2qzyN50IWik/4+2yuntQqTP3mzOzBljOBo4YlWBRl/qKWK2PV0bfOKRjftEzW0Z6J6gjBPJ2F7wUsC5BmhjgQxMdEYW5KmPagQlocXnVsEL7jsHijnQs3JBjkKOE8HjnUst1bzsiLxzb0t/e//5oSGt0dincMFbD+dtwrcp4r1mfWCv4hFCTQWM/cfEUHYczbx5IvPLYIej5Re3CFKlNVsYYjlOGC4z2GElTh/J13HGqauBhjeTlQ3H1KqiTen4FBrai2yeP1SHKoMIQj71P9Vsbm12qkebAAw1Nr9l8SbUie+iXHYASvsNUE8f1USg6F9xBlvPnviOgrJk1izXuZBLYds+AHskwZkg5kKiiS/yYPBEtWv8Wv/XF6QWCksVmVT75AFK1Nihl7Yx+zKYkl4f8wzEaaocrtt2U/6vCjMJNyJn0xPChz9Ucnx0u7UtRfkgKg7EyBTE0il+MKFU3igW9g305DGCefUy5tMb+QgJbPKOG0AlWpAgDUn61JMEios5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(1800799009)(186009)(451199024)(921005)(66476007)(966005)(66946007)(26005)(66556008)(478600001)(2616005)(6486002)(6512007)(52116002)(8936002)(4326008)(8676002)(316002)(5660300002)(86362001)(83380400001)(38350700002)(38100700002)(7416002)(36756003)(41300700001)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm9yTVh4TDl0M1VBOVh5cUkySk1TV2RqbmJDa0pYVUJGRHZBRjJUMjJYb0Jl?=
 =?utf-8?B?OHNKSXQ1SWtBc0VSWGZpZDVtcmkwdis1ZEhyRmtLZkcxK3ZySWdEbVVPMWxY?=
 =?utf-8?B?ZW5lMXhrTjB4U1YrTGJxaW5yTXpyU0dJRkVsRDJGYzkzK0Y5VHphM3RxNkpS?=
 =?utf-8?B?V3ZndGVJZjhOcGxyMEVaZ3kxNVZmdGk4WUs2cGkwUFlmRm9mbTVlUUFjUVNt?=
 =?utf-8?B?ay9nZVdaTUdHZ1hhWldxSng2UzNNYVpNTElsMXpVdGE2aUQrZTlVbVdwY0dq?=
 =?utf-8?B?NkV1LzY3K3dvUjNLVmVvcm5qSGlrQ3pWT2Z2ZzhrVXJhaVJxUE9VUk9SRWFU?=
 =?utf-8?B?cUFXQVhGTGd4UjhHcUc0UkhmWG9iTjgvSHhGVjZqcEFyZjNsMXVNRmk5b0c5?=
 =?utf-8?B?TkJ3d0puVDBadzk1cXVWaE44VG51VUh3YnJRMTNteVJjYnNhYisvWE1MaDRT?=
 =?utf-8?B?RVkwWW1FS0VhbmRiQmZxamR4cVZsVGxIWmVObm5YdW9nMEY4MzdUSlZIdC9V?=
 =?utf-8?B?cHErM2M3SU16UFlWT0xteC9WMEtEcDd2QWlwUkFyZG9tZjQ0dEVTVkF0Ylo1?=
 =?utf-8?B?RUVRdU0raDRRYUp5SW9DR1hBMUZLMUVPSmxsdHhNemkwYThXSGRvcFVRUFl5?=
 =?utf-8?B?R29zN3piejllVFVoRDBjblBUUUhPOURJQVR2OHNlOW1jaHdYYWFwcllRamRI?=
 =?utf-8?B?blcwM1NIZkJ6R0VDK1JzdjdpNUw4NWd4Q0RKL1VCMjhCUktidzB1V0pVeFpB?=
 =?utf-8?B?TGx2bTJIREpXcVdTU2Q0RGRpdzJZYmt6cS9waFdGQmxLVXB5aXpCU1dZalRX?=
 =?utf-8?B?QVN2VHZ0RVNRYmE3Szc2OGVZN0RYTWN4NVE3RC9CM0hlMzVuTnEraDhaZGs0?=
 =?utf-8?B?bFZFQTAxTXhhbWszMm5nYmtpakI1T0tERDkvYU15UHYrV2o2Z3g1b0tuUFVO?=
 =?utf-8?B?Qkt4TFN2dkVMR0VySTA3cHJIQXBReHpmRmprTGZrWlRLSzA0dFV1cFc4N0VM?=
 =?utf-8?B?OFRVMUpQclFwUENJbS8weklBT2ZuZHBmU3F2QnVWL0RkTWxjRXg3amNzbU9X?=
 =?utf-8?B?ZnVEZE8wT0MrMXBWbWpRT3ZFV28xSlZ6SU42QWVrYW8rWlR0aERQaWNIb2Iz?=
 =?utf-8?B?UXZUZ0NLcXBLblZtUkNoTVBjMVZrdURiNDJUNHM0ak9hYzZRckEzcW5RSmtQ?=
 =?utf-8?B?OXFmbHBkRHo4eTNUTGhrTklPVjdNckFhYlErS2xvaFoxaHNwaUdRT0VLK0la?=
 =?utf-8?B?S3pCOVdHdnpwNTF6ZjdBQ1RmSFB0VVdVRzMxdnNjd3RlTGE0S1liTmN1Y2dV?=
 =?utf-8?B?ZWZ2VSt1M1cvcks2ZzdqUWhzVU9NVzVGU1NiOFFFOC81MWZNVlNIVkNBaUR0?=
 =?utf-8?B?dTFZclcyM251R3BPR0c4d0xPWHhIcFNZcE5teDBKUVNVQ0wxTHFVZXh0OVlh?=
 =?utf-8?B?N2RGbzB6cDZwNFQvVDAxUXI1Q1pTVTN0bktMU2hkMkF6eFhDdFpRRlJWM2c2?=
 =?utf-8?B?UVRMSndJZ3pwUkE1UGx5ZnIyc2Y5eThVNHJHS1FZQnZWUElndGRVMDU4dko4?=
 =?utf-8?B?a2doRkNHZ1I4SmdGeUZNY2ZLd3BSaG41bGc1Nlh4UWIwQ0dGTldqNDJ0R0JG?=
 =?utf-8?B?Y2RhYThPNkNadEl0S3ordFBnS2hwajZKUFAxRWlSc3NzdFgrcVg3OVdnaWMz?=
 =?utf-8?B?MTlKc3RTUklYTEhGM0YwU2FoaWd4WUk3SWZvN1FseUFnejdVOHRnNHhydWs1?=
 =?utf-8?B?dVdTb1Nuek0xejdBcHYvSXJyK0kzR3NNaHdDL20zbFVyNkxBUGVmUUR6Ty94?=
 =?utf-8?B?Y0V5a01CK1c1VElOa1BIN0EzQ2J0dDJPd2FXRUVpMjZFRHRCcW9FcENDRGFU?=
 =?utf-8?B?Y08yT2dpalVTM3ZGSWswYnFsOG1LdFZNSHB4M2hqZjUwNlI4azlTbjA3SVlQ?=
 =?utf-8?B?QyszQ2hyVHFkZ1dSbEloVkpvK3hOd1Q0MmRkZ2t4aHdwM09CVUp3RGZLMjFH?=
 =?utf-8?B?RGFhYjVrZy9kdURWZHUrcmFSdnlsRGVtL04zRVovZkR5WmVvdW5CbWV2ZjlZ?=
 =?utf-8?B?aUtKR0NlYmVLbFdTdTU4V2JKeThpYUpaTjhjdDd1S1ZudjFEN2lGeC9zS1d2?=
 =?utf-8?Q?hKlnb/QitYb0GL5OzbAblyHcx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a0bb16-3d18-4657-a3b4-08dbaf3ea8f8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 01:06:26.4502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ke+qs66dVnDqfz0MzgmaD7GJyFUwS6Uu/4tWNvfLZKVIWPxz+QIP3nuniF/4gRgHcvtMF1SmlO7MpkEyrRyuAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6802
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
  drm: bridge: Cadence: convert mailbox functions to macro functions
  phy: Add HDMI configuration options
  dt-bindings: display: bridge: Add Cadence MHDP850
  drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
  dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
  phy: freescale: Add HDMI PHY driver for i.MX8MQ

 .../display/bridge/cdns,mhdp8501.yaml         | 104 ++
 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |  53 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |  15 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   2 +
 .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 312 ++++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 410 ++++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 780 ++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 674 ++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 195 +---
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   1 -
 drivers/phy/freescale/Kconfig                 |  18 +
 drivers/phy/freescale/Makefile                |   2 +
 drivers/phy/freescale/phy-fsl-imx8mq-dp.c     | 714 +++++++++++++
 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c   | 955 ++++++++++++++++++
 include/drm/bridge/cdns-mhdp-mailbox.h        | 240 +++++
 include/linux/phy/phy-hdmi.h                  |  24 +
 include/linux/phy/phy.h                       |   7 +-
 17 files changed, 4310 insertions(+), 196 deletions(-)
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

