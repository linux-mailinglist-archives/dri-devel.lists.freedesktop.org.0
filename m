Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35359B4207
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 07:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FA210E59B;
	Tue, 29 Oct 2024 06:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FUYK7JMz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140DE10E1C5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 06:04:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaTTypooSGguDZmWvBnOgk6JAazOT+z6hahZRVRs+U8wvIuLGLdRZ3o1JYWFBOgtM1pOpM9VY17gmOOcJEsa2CxTP2saUKLXw0y/4He54YhE7UQH5iyUSYEzp5CptCmAK1wo0c5ypUQX4gbMpL9xMEcfp5O4hXwlf7q7FJcZsAc6cmZ7k5v1/VD9oB0kHO71yBeX/P6pH8PFlt7EvnGrqUXmcO5mS+g6lkf3nzCTvbVgdp00zqm3n/rTDaai/33dgbJajBHqWC+QS3dyJwfNyWBR9O+R9OoqQlTZ7K0tQr2EGHckr2ej8T+/42/WwyHViR6JYw7AEDnGIp2cWnJIbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wcn828QJ/L7Ae7OdHa36sEOZsuweLx3DYdbyS5BE5Cc=;
 b=YOPdUsXRzRkArWsd6dos/hFKyNEYn+DXdHytb63w2s6rNaz0gNr5Xy+zpFTdcS9H6ZjhJkpyQ69ZlDFtzZ0aZp/8iSHw2Phfv7Qe06FUHVtHyTxcICTHex8QQgsLjehbR313q/XRdtKVTOytUfKVOnMa1GF1mES6+a1VWGmPjEXgzWQ4ux+kMSkYY7JP8SywUHakpPyXWb8izQ46uPxyZvaoe+JEXUCqIDHKaRd1/RTaje6pO4VlffEEKAmGr8V7dcyUD8fNkPWoRkaPldF1i3Gy1+LFITqR0b2exNr+rALVLo0Imk7URtSyalQr4vtS8C/VMzgmnZqf3n8cYEqmag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wcn828QJ/L7Ae7OdHa36sEOZsuweLx3DYdbyS5BE5Cc=;
 b=FUYK7JMz8U/Hpt2i5TkIken0CVLW5TFuRJs65jGvTFBio/YyJCPs0/gSfPkSb96QGU+2dN8fWdbDpQkCU7LnSG3PWONJOc6u8W0ORqNLI6fwQ8lC8uTg1hHabh14eft56pV5pKtErYxbDwltpdIUD3u73Xaqcv4ZsDUSqN0QQzAKaqfLQInyCW5nSlihuzJPaaC6FlzJllM3NO/+9iTAe3FAZf9BJIcuDqLQQrDKAy8HA2y4bR1YWZ+dXzvfl4IR4SSJcymmrWaeFvMEg66StjHSJhLTel2pj/OXHXJ+pvLraAwfv2N1hOSnksnToxX9u4CoDq2rVvIAYqStgBSs+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB7172.eurprd04.prod.outlook.com (2603:10a6:208:192::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 06:04:21 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 06:04:21 +0000
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
Subject: [PATCH v18 0/8] Initial support Cadence MHDP8501(HDMI/DP) for i.MX8MQ
Date: Tue, 29 Oct 2024 14:02:08 +0800
Message-Id: <cover.1730172244.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c792a98-337a-4fd9-5bd4-08dcf7df87e1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xHxfa6AcNddcWqjujYljiADXAFyeOQhgJiOOcDRFPzTPK3H7h7A+5S3CFiVK?=
 =?us-ascii?Q?9mTxlWA6Xj+ycxWFQ7trJhzPlpP46jUoKCyRyWRqAh+JBAi6a3kvQaFSrBQe?=
 =?us-ascii?Q?auTxND2NWVGNzu4LZf+TYdfXzStHuH4+AJSbdOTD5MFL0UOmsWp0c0w0FpG+?=
 =?us-ascii?Q?Q5o2ZDSRvCdz300AA2v/6OzBnYk6vfyez5SOl82tP7JGJPGKxilED3NdJ6VE?=
 =?us-ascii?Q?pqzlItOfpXO1pyczYKj+UIvGU/guZMSAHO3FwKkmLgAsCdJadPcUIg2J1EjR?=
 =?us-ascii?Q?kegcaCrRB3nqM6CWZT20hwKD+CkkzgMLA/aKWGLufJu5QtOM9mY1mjAUVN+y?=
 =?us-ascii?Q?YD2pcrwxlntos4E8Q/WgiiCQose5Yp3Oe60z7My4CcNLVyromwUbay1VGBzB?=
 =?us-ascii?Q?5aJLHReiLkVEvbfoFICGepHXsmjYXwv7QeU5K5B+18eddyYDzS8V9P2qmhdW?=
 =?us-ascii?Q?odfXxOG8o3y4QdzqBpii1dsX/z3+ocqUmqIhISZvIaRp3XVAWKtvsGFMi99B?=
 =?us-ascii?Q?eneUlP8g813BiFNGsi3zSXffyO1vqNvYU34chfISrLjeWV7jtm/6gof1E/YV?=
 =?us-ascii?Q?M0dyygeVYRvhNGQZ2mQEHakqwW02N82hJAJ0+vEIkXmfpggxrxEOLMDowZCp?=
 =?us-ascii?Q?6F3Pn8sTXBWRpP5RTzMaS6IRToB5Wm0lEaD/vrrCyskTjXTSwbhDZblorbYx?=
 =?us-ascii?Q?Yn64eYGhsD635tGmVGjTddSAV69usgkFQKnZ/ytK6DX0rKPl5QYx7fAatc7X?=
 =?us-ascii?Q?jX03I6JYVCLES0w0qsF1qZT/6rMo4gUfIg7Ndaugz7/Y8x7sUDbSZoW7KDdf?=
 =?us-ascii?Q?A1hdPiY84HulQZzknzoaDBntHaRXcdbZVqLCrjoB6GLZJws/brmlHDmP9xoG?=
 =?us-ascii?Q?q+96N3LGKVlNaB9zS5Ikinx/ktrvlcfvvXB+TEbtkm39/lomh9QViOAFZO1d?=
 =?us-ascii?Q?2Pdj3B1R+DrNVDQRXE7DF17evM9sPtu3cpPYGrVSP1p0Aveuqc9RA8UdmPYf?=
 =?us-ascii?Q?hSfnJ38vA0zk1XNOa/alTpYAqfRK/O7Fh3kQjJOdZxbL8k457eIg5Hup5+08?=
 =?us-ascii?Q?IzaGmtMk+94pxyxbT3NSkg1rD9Kr3TUyfawqp3LFxPnpqaZ1ND2umfBscyi/?=
 =?us-ascii?Q?8X77njl4/I4Ey3+4aLTPLiLWRdUJk4fCvC5UwQ/Hamln00ISQ7yVmKK9D687?=
 =?us-ascii?Q?CXXtO7bC3vhr4rsWnFsK7VORJBI9HO/VUR0lMDQ0onyksZqrG2sXjj0MvTbb?=
 =?us-ascii?Q?K8bjuSPRLCxk//lAfRyRvqf1pHWiK8OB/GBnHzrSqOumwaEOEl5blHlZWHao?=
 =?us-ascii?Q?C/kGXGh6aB2+tE4CWqyOOeJsIfefVJhJb2LzR6gNdICIYAkvijPFjK/RWVQk?=
 =?us-ascii?Q?P7NBNs93ImxJNqF7pgCq3HyGwuhM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TpYSrj2L9v9E3Dc27FDN6Hcof4V9f38ZUm+T6TqQIKoRfI68nzNB7BTGD2lU?=
 =?us-ascii?Q?mT2aGYfzU9XD9XUrAjqa3lcZOC7vCQTVJis4+c0aUCF9vl8+x67hOB6sQt7q?=
 =?us-ascii?Q?ZtjFvgqHw01/RiWdOUQ9ffUs34TRRyDb4CyJ51t2VdvSkQs27D+CWWN9DRlM?=
 =?us-ascii?Q?ZW8y5XEKzH2Fz3Xa4Fki03VQZriSry3AdsM1KmOqpndmSUmEe1TF/+opOI21?=
 =?us-ascii?Q?oW8PynZk5eEQ2k6ZhCtdNpsKgMtkYzr4LaWNDZbU0NKo7ZLxokaIeY7p/Crz?=
 =?us-ascii?Q?mqmlI1FGTTbf7GwCAPK45YTQGrSqRawgRMPfIp4umJwo6i7yBDYRkD7slKfr?=
 =?us-ascii?Q?opSxMhO/F+CraYAw3uQKmtoaWM6ltHqzve2bD8z+koqvRwl0GN1UvRqnDraa?=
 =?us-ascii?Q?9THP64sI7Qpk/KpYk8hBMyZO9MbeezCZ6wxpN2hApkaIXBboBwi7upY6Xpdw?=
 =?us-ascii?Q?OPDdY0+qO/txIRvLQJm6OCXSSHRIckRy/BMi4jS1E2E3RTa8v2W5LVEDABRJ?=
 =?us-ascii?Q?1zU+DlsMUUCwvVrI3rJfcQT8JhJmD4ERd0Z2EVHBhICJgRsBMBdD6i5VJSuO?=
 =?us-ascii?Q?W1pGH2y25F8P2GFyF5gWqgDXUkRac5L44nDFTw7qRFODdD0qO/Gwcrs3uVp8?=
 =?us-ascii?Q?pXY3hdJQwOMKfMxUmhtokKfHYUc65tWo7NgLntN2JGSr3MpMY8AHPIQsZFCm?=
 =?us-ascii?Q?s4QE5fHG2PZ8XRt0g6u0Ri8bb+NdOTwdOX8eyxAp84Womd1BGNlVkRZEICkX?=
 =?us-ascii?Q?Q3j4WSi9d/aeBb+fbZKig1WEX3rWKr8t45+2eEtXrolDhlpIfwsXuqyLatbY?=
 =?us-ascii?Q?duLBdGl7xbPlpcQxl1gXIDlBn9N1PIXQkVYIG20/OGpCfWfEM71713Zp80N3?=
 =?us-ascii?Q?OrIe3aor6KqMqZA87CJTPQcETI443rki1CTw3G/3cgAIB6AQ6aylm0T4a/od?=
 =?us-ascii?Q?nIJ5nYK10yFAHQh2RtGK1XmgMyLOPJvPYiZWBfvYje1UnC0vVEgYaYt/AIi+?=
 =?us-ascii?Q?/Mra6ODFN9bdZrC72t9qEu1a07u3aFDa6xdCGw41ij5baf8NrVXx1dDsgIPm?=
 =?us-ascii?Q?FWhC84a+9yxB2iJ4af+p7o2BFWnIXTzTPysvON1qf6T1COqVNCrxeZMAvPiA?=
 =?us-ascii?Q?jrBnO1Qs0bCibank19Lm+lIHmcKLIs4gjjyH5tU/4YbPDIw6i3x+abcQ75ud?=
 =?us-ascii?Q?6AHjp6XNoZVoGovtsJE7mU+KvTIDCksPaNpcDLaqbq9lodrt23+87W/55MlJ?=
 =?us-ascii?Q?2OFrw+QmQo13lW+QaAaRSKS8kVRVqg/MkrH6t0QpoVGPmegp4oHzz+aWpaxw?=
 =?us-ascii?Q?SULCxG8bhtKXkrAOQ3mtyG96S3ZMhQGjfxcEPXj5VhE8j2ISQEZPplMA0Krh?=
 =?us-ascii?Q?QI+pV6rt4BhLU9xIWvJOZHf54VFBA3troMMQaC/IqQY69+MRpKmQgYpPQnTN?=
 =?us-ascii?Q?sdcnrkgon3pz3M4fO1mGHnownBGf7wBRty1GcB2uJtqpZ+zS+KKABrgmOq9S?=
 =?us-ascii?Q?amJI8SZaOCEBzDMDCJ0kUlhy4OsNAk2ENMC4qzGd5FYBSW3ZN9mK3J2izpuL?=
 =?us-ascii?Q?g31+XxP689V8qapUxSdzTZckbvlbyaKeyaeFGB0O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c792a98-337a-4fd9-5bd4-08dcf7df87e1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 06:04:21.2225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSIhXH1ILMA00mv14bRmh524RW3Btz+aJABZ5/KIU4Td7tQyUKhMNGwBILVAR9Iwrs3oGzhJN3pO2IifAj+q3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7172
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

 .../display/bridge/cdns,mhdp8501.yaml         |  112 ++
 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |   51 +
 .../dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |   21 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   68 +
 arch/arm64/boot/dts/freescale/mba8mx.dtsi     |   11 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   20 +
 drivers/gpu/drm/bridge/cadence/Makefile       |    3 +
 .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c |  414 +++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.c   |  329 ++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.h   |  376 +++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c |  683 +++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   |  764 ++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  487 +-----
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   47 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |  236 +--
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |   18 +-
 drivers/phy/freescale/Kconfig                 |   10 +
 drivers/phy/freescale/Makefile                |    1 +
 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c  | 1337 +++++++++++++++++
 include/drm/bridge/cdns-mhdp-helper.h         |  130 ++
 include/linux/phy/phy-hdmi.h                  |   19 +
 include/linux/phy/phy.h                       |    7 +-
 22 files changed, 4464 insertions(+), 680 deletions(-)
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

