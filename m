Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7876669A5C0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 07:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D332410E3E8;
	Fri, 17 Feb 2023 06:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2070.outbound.protection.outlook.com [40.107.6.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3AC10E3E8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 06:53:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jI3T+ICLy5FKeyP11xOfIjZW8VAnNjLJ+A3rEAeC/P+lY9QvpPt12pDYlGHiY1VnQdJ1ETE5EtfWyPGQD+9b0neGZH/vEICCIUpYvtbRa4T7TfBy3q1Ff2x1CdyEMeHTQodgtRp+27357jKwpvFlTUgACbjuhcbul9m5qouHBOZf4FD/LD+S4lda23ZP9yNZd/9ZFNzXy+FUQWBIFfqbVOHJQQaP9vwItuqHGVJ7tfzOOHpQBB/B4Mq6Ag3QonxSoeve4Hx1siRCxRgUxkpz+077X+GtKF0FiYzdHhTA3WZR2bLG58oQhIrW+2Z5Ir57gf87sjsXr/9K4rlr1gLuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSFPVQC0TVmjRuKTCSVqhHKw5lk5IUGHhfjWwsSAh6Y=;
 b=Jr3ca9SWEqwomekgyzOp0ooVphrO3LEyO8RjFs4rIloMfgdVPRKT600Y4kTScV5Cm1L5wAhIxetYuHW1CeJH7TcNZlnmBTjKO6P/9o7RJUFoehtmGD5RQYOyhue5W+mCyDZHZMpN7sqUhRaDjdOVJrifjLqQjuK9eLx9hZGvM5XBC4Ubi3Ly3SpezJS1f8D3zqAub0ZMrxA8rYxhHdRHD3jZbsYtFGljvQWdLDp8UTT8+mOX47Z517eC8eKBm6ru9bzCPdycFFelvGNmGnRbjwSlPiqZipD0q8tIWdMsbxyhr1V2F9mYM4w3FHNvEL3UqlOruwBupR13LPwi/4M9BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSFPVQC0TVmjRuKTCSVqhHKw5lk5IUGHhfjWwsSAh6Y=;
 b=Ccme1hYZCIlICvGpoC3Q/hT5Hmr2HQLJ4W7PdNwJl1Yde6T5yvtzMB/+VrjLF/CIeNU5hd+iwCftaZHADETseSZca6hUNX6tO5kG0MhshzVxbNAaySNgEyLlyfIwpdM5JtgxZqmlLLBbKWvrv4vh/x+PcYMOfh4DTo8VIWJxkiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM7PR04MB6840.eurprd04.prod.outlook.com (2603:10a6:20b:10f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 06:53:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6111.014; Fri, 17 Feb 2023
 06:53:04 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/6] drm: lcdif: Add i.MX93 LCDIF support
Date: Fri, 17 Feb 2023 14:54:01 +0800
Message-Id: <20230217065407.2259731-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM7PR04MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: dbcb922e-bfd3-44a4-c71e-08db10b39de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QWiHfkpNr8Typ3wRF33yWOQ/kL8ITIz5hPiZ9pNUDP+Gd9uflUf2tU0JDjBuLTuAMaCYkfIZzAK6zT+RggFch5encywqP252qbhxZx9j961i9/U7K3u939s0PBqzWmWwOzWmWDJt2bxx8946QitPVt5x2dH9v0djpAkPi5n1fry45pDyV3YZ2pzQB+mWJRC8Gl6GXy6VZN0JR3VIze8viFf1cr9uZ9cPgOlTpWpo1wh254HeJ0wFwBraCXvwJyZW/HjkY2BB44Yu20K/F5aMziJ5NNc29U3NLDP9SJzTF3pwAxbw7T3rHSsK/1WW/HOn2k14UqVY4TDa9CiP0TAIPII8XyDuqZFtHh+aSzKhIwzAF+kE6XJnTgw2MpCRiwbaRcA/7QDUXnTI0ot22XGzr2Ynm8thQu98WC31HVxgNSxs6TCeRYl2/81JlKuoJ9v09XQGziTMBZy0a0ipMzg+yVppL3b3iiZ70uK56DS4R3zwP6uyI0DxXvl/XVkbKdVlyj+UgHpd0orq3AziZbEsgu1OEYuCW+ITHFSrd9kDaW7My/J1RgIIT47sVEznoEZcvLRImt5vT4hEL6KoONLYH1aSl4xsErVvoeBn5Y7f7eIQw1vmfzaFJb+mQSaw0WwsznPOO198YAZQkkgwKktMubFX7VcIqXkgr7K+c3zwf++TCCrtihOOpsnvhEbHaiwHXo2zTRNVdBbWhyk+Sn35jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199018)(36756003)(66946007)(4326008)(8676002)(2906002)(66476007)(66556008)(7416002)(38350700002)(38100700002)(478600001)(1076003)(6486002)(41300700001)(52116002)(316002)(6506007)(6666004)(5660300002)(86362001)(8936002)(83380400001)(26005)(186003)(2616005)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b0T+90sYGTXCv7DMxI2R/uTugyR/YXkdJsMfHPsVNfY7v4Nb1VBf9j2yrJPD?=
 =?us-ascii?Q?M5lLkQkOcOPvYwQHU1yIfdIS4RCEK0zxVAAjmza9L2VRdrY1gS8g28nDB4ds?=
 =?us-ascii?Q?UWM8wWsx6qn+rfAyFY+VWUdDMWQPE1BxCyNeI1yCCuKNiYslqUtCf3t5Ulp6?=
 =?us-ascii?Q?TH8xl/gHjmsa1SFi3IKrYhfj+EaQIzkjimx/lWnmss4nY5KLZOYCOEpQLVa4?=
 =?us-ascii?Q?CwBzdO/rdNiaTR6YmiJFZZNUIDlEoq/d2wWdta7s3r+ILsbrh4Cmqgn+30S8?=
 =?us-ascii?Q?3HMHsCu7g4IaSDh2Sh7XTiJKWS5TtWIywX8+lyaX+sf7QwVOkwaxPcmGxE/n?=
 =?us-ascii?Q?cNytIkO0TnUXL0/SqVSa8aC4hUG+7W8COP6ELl+3XUGhlPBQVuX4eqMojebW?=
 =?us-ascii?Q?PB3t69ecmB237sItr/u1B+/yjID7QdwY7t5aAUGCWjtWh0BaHhc6POuKoLMR?=
 =?us-ascii?Q?LW45y0hIBm2UgfsLKDrAZu8ovv6uiFUPwQ2jYQopMfHzATuznNdCExwfK3FT?=
 =?us-ascii?Q?4AQcP9Oj8gvNLWaGFnQd3inEYuhq/xd/KhEeo9vzLaRJzOcuztjtS5F/GTQp?=
 =?us-ascii?Q?7DyxlEq2SF2B+eHoq+D4UnGSYht43hk3/Hhj0Kh+ZiM/S1bT1frELZRBaBJC?=
 =?us-ascii?Q?XtU25EXtsC691SP5C9Zu9bki+gJXEpI77TAmfmfMhZ5RMxfr49fMiTD7Z0oh?=
 =?us-ascii?Q?oh831rGXx7Shc/kVfX93NODYQZnacBldtB19rdAveR5jgzc0LbbvMPzpebdm?=
 =?us-ascii?Q?nwJRIFdq4Hj4mNYixfRTtqC84+zT9IkTxiM/VvJkgdBt6dZqqsXiL9wKm1Xo?=
 =?us-ascii?Q?pggVy3QWYoj/U4/TMULceE8vEj5yBWmZe4kmh/1jEsVIL9UzEJXH5/JzqPEb?=
 =?us-ascii?Q?FxXKEBbJ+usetBY429gLj/i+zpTxAvX6bzS9jeZtOe2hALWSg10bTaaLYcmT?=
 =?us-ascii?Q?Pj4nTbL3nNYTKrWA9eIViGNnvcD+hKWlsHGFlNPtZQRQMN5pCSYb135qsDnp?=
 =?us-ascii?Q?6espfglMt4JHVe08LU+H9/PN1ek/mHryZETq9QZ2pmSyCnUZEyrcvi50y9fY?=
 =?us-ascii?Q?bAlQtofymsjqPkZmVmbcP0NQ2t3tjJHbJh1r/0AehWUGRliu8HfRnd8AqwDc?=
 =?us-ascii?Q?Ur1VcDlnr1JXHTOs8LLaUdGqyb01jvpod/eS3ju6lmRGDIAYp/XmrzwVi9lG?=
 =?us-ascii?Q?ysKCpVol4frNIIgrniHWgxlGw0FAD7B5Utnb7Zy2APUHbsACMPwMV/q/Fbo6?=
 =?us-ascii?Q?+3BaQV2+wpw4p+NeKvIMTYc6F12Gae0ge6FVtnSvlLlxvLwPy2mw54uJFq3P?=
 =?us-ascii?Q?trAQ+idrvJbyJpk6ZUoOu/h5w9OO5ngVwDBib4jddDKTFfhQXnTBD710G882?=
 =?us-ascii?Q?qws4zBB6E09JjSlOdrRClAJrFu189dAVUZ477tgbylU8XYQRh9fylT+vllSe?=
 =?us-ascii?Q?atrVtDWwMpgwX/0LJ9soAC4pV4J/oH+FK+RL/bvPvPJ95FaUsVXkdzv4qbMD?=
 =?us-ascii?Q?1pwj8X0W1uuDeC1iCmPF0ZMRZ1e3OnzvqqJtXafv8OR4QzGfDc3RjBzD7ZbZ?=
 =?us-ascii?Q?kqBp4FAJU0df4VC/0W71sdYM8XLnuMf7miCJ0Qd2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcb922e-bfd3-44a4-c71e-08db10b39de9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 06:53:04.0561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1DGVe5mjwqDlhbs+r9ftsU6QIu8GhFNWqp1sjmWgSjM8HGxqSEnPGW9JxOOnxJERdQ8a1O8C5MGFDby96MMlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6840
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
Cc: marex@denx.de, alexander.stein@ew.tq-group.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch set aims to add i.MX93 LCDIF display controller support
in the existing LCDIF DRM driver.  The LCDIF embedded in i.MX93 SoC
is essentially the same to those embedded in i.MX8mp SoC.  Through
internal bridges, i.MX93 LCDIF may drive a MIPI DSI display or a LVDS
display or a parallel display.

Patch 1/6 adds device tree binding support for i.MX93 LCDIF in the
existing fsl,lcdif.yaml.

Patch 2/6 drops lcdif->bridge NULL pointer check as a cleanup patch.

Patch 3/6~5/6 prepare for adding i.MX93 LCDIF support step by step.

Patch 6/6 adds i.MX93 LCDIF compatible string as the last step of
adding i.MX93 LCDIF support.

v3->v4:
* Improve warning message when ignoring invalid LCDIF OF endpoint ids in
  patch 5/6. (Alexander)
* Use 'new_{c,p}state' instead of 'new_{crtc,plane}_state' in patch 3/6.
  (Alexander)
* Simplify lcdif_crtc_reset() by calling lcdif_crtc_atomic_destroy_state()
  in patch 3/6. (Alexander)
* Add '!crtc->state' check in lcdif_crtc_atomic_duplicate_state() in patch 3/6.
  (Alexander)
* Collect Alexander's R-b tags on patch 1/6, 2/6 and 6/6.

v2->v3:
* Fix a trivial typo in patch 6/6's commit message.

v1->v2:
* Add Krzysztof's A-b and Marek's R-b tags on patch 1/6.
* Split patch 2/2 in v1 into patch 2/6~6/6 in v2. (Marek, Alexander)
* Drop '!remote ||' from lcdif_attach_bridge(). (Lothar)
* Add comment on the 'base' member of lcdif_crtc_state structure to
  note it should always be the first member. (Lothar)
* Drop unneeded 'bridges' member from lcdif_drm_private structure.
* Drop a comment about bridge input bus format from lcdif_crtc_atomic_check().

Liu Ying (6):
  dt-bindings: lcdif: Add i.MX93 LCDIF support
  drm: lcdif: Drop unnecessary NULL pointer check on lcdif->bridge
  drm: lcdif: Determine bus format and flags in ->atomic_check()
  drm: lcdif: Check consistent bus format and flags across first bridges
  drm: lcdif: Add multiple encoders and first bridges support
  drm: lcdif: Add i.MX93 LCDIF compatible string

 .../bindings/display/fsl,lcdif.yaml           |   7 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |  71 ++++++-
 drivers/gpu/drm/mxsfb/lcdif_drv.h             |   5 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c             | 198 ++++++++++++------
 4 files changed, 206 insertions(+), 75 deletions(-)

-- 
2.37.1

