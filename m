Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BC36FDA8E
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 11:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9950210E214;
	Wed, 10 May 2023 09:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECB710E214
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 09:20:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8BRc6u7TRND0YZ/4EfpcH5RytXLAHzdtieCMFUdJjxNlPsUpDAkLBZ6g/KnozXbdNEE4T0PQcMkqW8+w1Z1uIhoZkt3JP0VzLbY/SqOhUVFFghlk9H8V2e6CdidQZFhZ8c7H5bBroAPPbazCUBy25i2Wy3bF8BcnSQnRyMgcKtIy66uvc0E7Mxf5ynXaQmNEvaW4Z+0Ur4NhiTd8IqDQ940DJZnPvY8pyuw7OD2nfNuvhNEc4+xeAgvDCGnI5F7C0NlAb18OBjtAOEzPHZWe6Y2k9kby8SMDu6p9uFryftKnlpQ6G/1z+MHnOgJEaOatDmMyVKC2gdnis/H2hw+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVJ1zNiKdNO1aX/20maDsIvPvrxBrOf+dgUAIq3kCgM=;
 b=YvTAEDxEvP509Nepbpi9StFhVOOLbpyqM3m0HqZM3OC2cNADfcPJmybf26XuGrJDPcpnylSB7jNHrDJoezPAj3IhqxIrB08LjCuAyQFbDTEfHbt7CWKpF++dPlLH1cdSHuEOZKtScVwScs+SFU1v7EztePywoFQWCZhnRZcMRzlesxn8aQZx0DjWJsQ6g3+jBi/0zpryn0cXCv5PyVCswXeXFzf9lRQEljqw1RNoTrijSJQCMyGspPA2jfdsUOfG6XapJuo4KSOrdc198Hy7nACEVvmrZVQQHJm/Keb/PsA2WgM3GtFMNiOZnKMbUoCt3DwPMf7Cy7KQVETjDulnqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVJ1zNiKdNO1aX/20maDsIvPvrxBrOf+dgUAIq3kCgM=;
 b=K3dPDyDweChwFHU7wXQJKCD5M2FkSRmpdRgAjmtZgSNbbgkos8AbL/Ax8mPq9HHzkClVHctFpVpwAN4F23sGviIOai/vhs6vdnUwd59Tl8Ng+fLQ9IoxeYrfqdNN74vwvUkS+yvvmUitnL4vNPgcM1R2+QVtUkX2zezVbWbNFTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7711.eurprd04.prod.outlook.com (2603:10a6:102:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Wed, 10 May
 2023 09:20:35 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 09:20:35 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/6] drm: lcdif: Add i.MX93 LCDIF support
Date: Wed, 10 May 2023 17:24:44 +0800
Message-Id: <20230510092450.4024730-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df67176-a07d-4890-f783-08db5137cf9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SjuRGdOYPu0lV4GUWwizVZvEanQmbJILKpt4ZbhK0JK3fA0AjwPoV0is3IX392ROe9UchjK6pvLRX568GYIpJOUYYRp+hi6sh6q4j8vbke3Fng+Dut6TXChIkvKqGCWqCdJTwTNDVQe8iP4+OLzBvdsns+6A2VO8mUpP5yQza/T2w24AgTbHHUYCgwdK9yFGr6wgkMDZogCw6wQVegL4b3MGj8lbXAlgHtkgr+xG1m9mCgohrxtdzSPqVJSf/v2D7l/3zeWNIOG4ToQo9eOhDLY25mxs203SQ/IsYynk/e9S70b82dpC54Af+rlA64G6UARHIsc2Uv+hXCdf8ej1LD4ANd2RBj5E8X+98cDIkVCMtQDr+xWZztX5KuN62GXUq8GnE6Tjy4VhQ9VSOBc4X1VGJklpq653pcQCdZ34qFbd98vCwvLLDVdXe1BW5nndJZ5H/+NwNfMmM3npsmHZbNcokuF0hmMJSb8RNWVGHdyMoBub/VDRTfwpAykCxlnZ2zlwfvRC0Ht7a2FqGUxFQg0Tyk8jbFRlL2TR6J2rolgCGsvjb0Xd8S4GSBWbaThwKAMYD0br4ynNmadOoR5HDnL/iw89yidgzqFH7LRQiL3P5jEa8TmuRYQCPFKkws44
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199021)(4326008)(316002)(83380400001)(52116002)(36756003)(5660300002)(2906002)(41300700001)(66476007)(66556008)(86362001)(66946007)(6486002)(6666004)(1076003)(26005)(6512007)(6506007)(38100700002)(38350700002)(2616005)(8936002)(8676002)(186003)(7416002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tiPU2s289cNVl4GfBRV09gd2bZ+/MsmE4AAOcqMCiD3a7gpt1GrGk08cy2gf?=
 =?us-ascii?Q?AgbvWww+i4a9y4uT3NJ4LrqrdometdIZXWby7IOEWXGw8NzXYsShl8JZnvba?=
 =?us-ascii?Q?37qjJ1qRk3oOtZbhD6mAJ4MAzDgXvN+MOk+Rn2Ptz5rLpJliglnog+W8rTPm?=
 =?us-ascii?Q?cbadDk5NFydQqXpX7mgaXCkVKGFYa+RU/3JJbmU5EWNyh2UFkUF0/XFJyqAb?=
 =?us-ascii?Q?Z4ue5+StJzY9jEh1fE8dkOvVsIaMt6/ykkg8AyfTq94cWDpzz0IlcWud7LXD?=
 =?us-ascii?Q?hx/kXOJfb7pX4Y7RpoDPQ5MvMZdinObofUnxHPLXllajmG8WRDjO4cTqGrdh?=
 =?us-ascii?Q?7F60l+tO3zs7JGRp0JaO6uYUAd/mKRs7LMclx8MmlZJ3S3Q2hPhO1pjmQZHS?=
 =?us-ascii?Q?HcUiBqUidsSqj12Ht6fYxfBfBZwGyrU6LurxoJCSttIkgnGPwHJXRnavWveY?=
 =?us-ascii?Q?rodn0N3iriZTbhBI1KZCviuxPrf25kRi4IwniOt/0DweWfs7+KcR9l4Dozvw?=
 =?us-ascii?Q?FmKEtlTWauy8CDsgQWDTwsY6lpJbP6hjST6tonvDrprM9Db+Htl9u49dA3oD?=
 =?us-ascii?Q?bTTK1sUlRKfCp0HibVVkvCkJrLNmSKzxKLvuT7+uvz9YmWOmpAq4v8B37PKA?=
 =?us-ascii?Q?YWM/bLV30YjSxy/AirUFW37o4NNZUHTr2xknTk7MyuEZRdDmo06/0L89tpP5?=
 =?us-ascii?Q?JL7mOAeYVuc9EvS4Or5ehVfVGZHLRsjxAaH+nr0JUKoomMw4D9Yqs1XuGf6U?=
 =?us-ascii?Q?8pLRO1dhtq6atHfsMNE7lziJQVUoRbtgdNsn4C25intpe71l81dkcfu1n/U0?=
 =?us-ascii?Q?dcxtcKzGlsitv2MhOfZRK6GB26qWqXgdnb29vCMzin4ChpRYvfIsPZ6QMesn?=
 =?us-ascii?Q?/WsY136uRiMZr/Drhxx3rKebIXjmi7fSzG/l+DfdJTWpf2T7UM5OYm7+3zMo?=
 =?us-ascii?Q?1HcELEQSkDvTvPqqmxaUE6fftIaxUESjrHE/XiykrvQ/2CBP64oVSTHOptUQ?=
 =?us-ascii?Q?OADBUP0ckYxDg4x3ffUZke63kTZu7J9rI06Kvfxz8XYHnhJQbPWwlOkhtJWe?=
 =?us-ascii?Q?UMMfVYZ0Q6FRceuKBvx+o56q7NKXezgTldBIqIhNsttJKUjg7Y5WtVgkTem7?=
 =?us-ascii?Q?qOnHkjmvSjRQczvU3H8I4mWpi8qCBEkSG6ZSe3ARgvMUwUfhhANl6veIciCw?=
 =?us-ascii?Q?km2MAoVXjEeAeWN43Vwhq95A2TWAbNZYjiWr4WpSk2IC+tNE72TEktatEQNl?=
 =?us-ascii?Q?Mix8Ddmmc4mv20k2qMpSWKz4R8p4G2/eYTlSCOAv9ba0G4keE8qSqU0Uttkr?=
 =?us-ascii?Q?5aLTtGpVyPls+zBqXeguqZ0gHsqn3EofcFtACdXnEQFnyuOSZUW/nk0tqP9Q?=
 =?us-ascii?Q?0yRbcTOoEpxzAkbnvKzxE8IGATkkeg9OherviZN1AJ3zEosXLMP8uvkfAsre?=
 =?us-ascii?Q?rETzLf63g55toNjPfZnzivRlcPjX6rHzu8FRgcLwwIPvariwqNFQfpYIlBjG?=
 =?us-ascii?Q?AfUn0yMwER3rPSLI0Rd2Lsf4Z+7maDKSBXeEQGvI6tylsBH8vFHpiT799+8l?=
 =?us-ascii?Q?02wgELjXDOl8IZilK5mICoAdWcZ+PNaCVjVw96vo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df67176-a07d-4890-f783-08db5137cf9d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 09:20:35.4563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+eEd9XgQ0jw+BMVD4jDQ5ZvNwUjmV/tOqt7pNPqq5OoN8XExz356g7LIjS24kxMZnsSkfp7E4ZdzeAzAJPemA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7711
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
Cc: marex@denx.de, conor+dt@kernel.org, alexander.stein@ew.tq-group.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 kernel@pengutronix.de, LW@karo-electronics.de
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

v5->v6:
* Collect Marek's R-b tags on patch 3/6, 4/6 and 6/6.
* Keep default MEDIA_BUS_FMT_RGB888_1X24 bus format in patch 2/6 in case
  bridge_state->input_bus_cfg.format is zero. (Marek)
* Drop MAX_DISPLAYS macro in patch 5/6. (Marek)
* Drop the encoder member in struct lcdif_drm_private in patch 5/6.
* Drop endpoint id check in patch 5/6.
* Allocate encoders by calling devm_kzalloc() in patch 5/6.

v4->v5:
* Rebase this patch set upon v6.4-rc1 and resolve a trivial conflict for
  patch 5/6.
* Collect Alexander's R-b tag on patch 3/6, A-b tags on patch 4/6 and 5/6,
  T-b tags on patch 2/6~6/6.

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
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |  73 ++++++-
 drivers/gpu/drm/mxsfb/lcdif_drv.h             |   3 -
 drivers/gpu/drm/mxsfb/lcdif_kms.c             | 201 ++++++++++++------
 4 files changed, 208 insertions(+), 76 deletions(-)

-- 
2.37.1

