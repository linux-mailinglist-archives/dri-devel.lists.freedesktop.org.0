Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 335BF6F9F3D
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 07:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAE710E076;
	Mon,  8 May 2023 05:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2058.outbound.protection.outlook.com [40.107.13.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D507110E076
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 05:53:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cijd9+Mfj7JSBU5qkwUWDryNFRSikPJ9l/qXiqpJDSW3if4SLx/QVuH54GTbCA7Nc5dJ7b5NKoYm7cmQ9faQRvT89sYKnWobuLXGLndPqQjVNKsWfd5xrPu2nAmdasAJ0R/gM4GDeRouN+IUcE0WMGmfW7D3C5FoMrQ0oRGiXFJttY5zhxCvonMRnaNru9Uv7suxnxtSA8ahJlwPmY9OMChrlK/ZGdIsi0hpFjqdVlTxXOx7e7PoVP0JB2+s91bKbMixku2j1YY3i4vQUGR8kmzyVSjAHRj09xoloW8fxzO5TrmmOr+9KXI3IHGOSGm2M2sjSAgIYWHur1edB+1YWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=195B+CB1z/60zeuUHL2i7Tbhc2xhyav83W4usRCKIrw=;
 b=jG7hcooge+q9icq4AFuCIi9EpwbiSESnAObE7IaBhEWLftW/yxG7s9P7iDCyAjw18m5xM1s4UJ6di9hbBTYauW+a31Gvgh02dez09wXfqaGXbbaiz9oy+94FwbsyE0YOFkJtACeHOcNTPBhzmdsHN3kgjZoiu5CQXQOwJ+bEMPxMcVzAPY2AysICaHLSSn3w/qcS+gnipO+O94YCdWQMVIiY642kt6H0N1BOeN50DiBacx7HNMzfV6Vpzpjw7HnHFAKSQn9/ymy/RdvbwmOvrI5ehyJ3LboUZLIlnV2EgfXzb7x27ENn54hmQ6zQsY2gBHOccwOXYBBUsY6zLIl6uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=195B+CB1z/60zeuUHL2i7Tbhc2xhyav83W4usRCKIrw=;
 b=IpQgEPQL7ssXfjqP2pOfSK0hGM4Z+HO9QclbBnUIqjL1s2gyTUus1WSHuDL3mJenDUtlygB/H1wuZI8gbNa2BpWqh7hqy3udDEsviyo/9bxgdOl7oVwFxKN+l8F17trePbWha/3Hv/UnqLce8XnxRlpEohCdoJAdvfVJkenj9rE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8523.eurprd04.prod.outlook.com (2603:10a6:20b:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 05:53:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 05:53:07 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/6] drm: lcdif: Add i.MX93 LCDIF support
Date: Mon,  8 May 2023 13:57:34 +0800
Message-Id: <20230508055740.635256-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: d754ea79-8e4b-4690-5a76-08db4f887f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: onCzTbNkHvtFquQ0IxP/xCcqJ+k0sgb1jQdvH7k2vYWt+x0CDpK1OukLJHJACZsCa9bYk2IZX8XDqfQ6JbBXWW9E5y9qIyZSR2jZnO4b9hHYVArMLMEgHzGLUp3Cz3JkoLFH4mmbll9hk2rT+Az3LRg+U05q1J+U8Xm8P6eAAdHkblN25CGvkSme/Ufv6J74uqjECnz6bGzkZeDEeey9FuwZ21/ebep2td8dQBGVjM9OWFuFQIwHDYb5OeFkJOhv6eqvH5OylMwRkxAAJ3vzK11RjczcHoHf3ZNjci6Ybi/kYPHjEuPgnAUPMAiC5HBbHjel66OXU5RmR/k12kifbCYQoEjfme2KI1kTIi73S9gJQ1RamPcbFPlbIGaOQI2AeWmEDk7ARaGjtKiflws8Biaa95dk5GtmiGu4yN83PVSyoInWcAyacSmQ4AH7eqJZ6yo+rgnAg8dTIa2q82woZY6dylanzUDyzRRu6IJJcTtJzryftuGbypQeg/4oAhO/xn8ViERH43dobu1XX2EvW9J7DeDiTGjNE4DS4sAcPrdUfkwya4YBGKRgg6Eaxoxc9hvkba9uYYzKrCxR5ab25ZzvYgM3kdPzMR1tkn9yzt3fO5L+3IF4iuGdoX5HNYrR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(83380400001)(6666004)(52116002)(6486002)(478600001)(2616005)(6512007)(6506007)(1076003)(26005)(186003)(2906002)(7416002)(36756003)(38100700002)(38350700002)(66476007)(66556008)(66946007)(4326008)(41300700001)(8676002)(8936002)(86362001)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tOHr/TRIy6GUgPgkHcLWx+QjEKVEXOW4MBSZ7gAs4SLMwLGv3sEWAVX29gK0?=
 =?us-ascii?Q?1KIuyggu4ARKiqcbxYuM4Xs0TSzZO1Fojh98TskFU3aIHj6PWzlk91X1YAwz?=
 =?us-ascii?Q?S6lsn3GbUj3IsqBN71xmEv7Zz+DJway/TuUGtnF5fhH69yV2P5xoBD7uvZJI?=
 =?us-ascii?Q?yIeU/TCOm4jFOssBxXtkMjTjLU2DozWBs8wPM2MiFJyIDT9nqTFtshmWyywU?=
 =?us-ascii?Q?YDwk/SXGKCwFX96XUifunvx3ZZCUWkBgktLPfTCb0kRWgWnrXaOD6ZRS1WI7?=
 =?us-ascii?Q?wF+TjYbDzxX/Q8M1exJR/gfwr5155cpjMwdpTRr/l1SW6eYmqAupP4HARxEI?=
 =?us-ascii?Q?q1t+QIKRvxH3FhGUBFBMlqUpeCXNVK2szBmrF7oQG5yxTjiyujKH0YYANASb?=
 =?us-ascii?Q?53kJ+EKUt3mTxfcY0hos6B3wssQOt7OUauxtEOuwqQcIP7IPYkJK7RaEmBhk?=
 =?us-ascii?Q?4VP0kF9zuybuWeO4rEoE4HSH+ho5okU/SWklsmK/NGHZP0DIUJYPmugYYs/q?=
 =?us-ascii?Q?ZGt3anGtOERtjGn7lZK6MQhN/U8GYyqml2jRC6Y5aLLNS+Ism+fLYYRo4HEN?=
 =?us-ascii?Q?6rtCkG2F6BR6skycgcY8/7qQnzqrnjtu4LYbA825ysnOhVBDxyDs3bKwoEXa?=
 =?us-ascii?Q?sqtq2sI5TBokhxx27Vp/GjLDrLu1SMK1z67WhKhiwbMn3oU+f+1an0lLcpfv?=
 =?us-ascii?Q?Z121PAPOLT4fFPE/byH4GWi6fm3LtzoVbtDdsL55+UZ7PRiaZStCruXBS0FU?=
 =?us-ascii?Q?JsCPnppf1IUZh2KyZEPZpY4BBuUVb6fUHR1p/yHAeKdHzhTvWv/lmYXc+ySH?=
 =?us-ascii?Q?XTC1s6Sc4YEitr2v1+Qn6Ko29FNuC3oEkvNGWpnm6Lcx2TEUdFzJhTddCSXU?=
 =?us-ascii?Q?zHm2g6RFBUAhNHet+xKvNbQ6KJ+2ELIZV12fTSQ62lgHNh+sTMlcotvLNbYC?=
 =?us-ascii?Q?ECLt9SU4VxMzYpzL1JbZ2YoriWtLzsZB/mQEVmvh0Okdon1eDdlcV1LwFnMi?=
 =?us-ascii?Q?iH2COJGsKPN5RYbGen4DHwSfTFp57uD5tlmeWhX1OrNe0GR9NrG9PN4rCSsk?=
 =?us-ascii?Q?xaz+ZZ49x/qRyINMefeC/tAErKC6021x/XuWEEkvRM/b1hiZ3V1LaO4EfMRg?=
 =?us-ascii?Q?JLs+X8A7e1nFFyxoHoh+UUDllQ5LxeF7vJ7K8gBnWmCgsKHeCS5B1FRF0qJS?=
 =?us-ascii?Q?Zy+UVyWv42U1dXyKZMFVfMnENanIaQWDX1t+WjU3rW8yVgd+QksTCvAeDFGu?=
 =?us-ascii?Q?9TYAJ1ivRD475lh0e+52OfpAcuPJeDKQdVaIJGN7Y2cW/Aeoa3HrTqhVE7Ww?=
 =?us-ascii?Q?o8qX+A7wuTyQEjT4zNo/BsPdFUH+HyPam+Ppebo013xdrP/OppCngKUHppw/?=
 =?us-ascii?Q?eeB+KKE1D7hk1bw8UOURBPlq45tAIgMAjX4DCcCbZ1SHAktg4kXkIA1lkTZT?=
 =?us-ascii?Q?DHnvQ7TDygcqHKfT7ohj2Tg0qgI9wYTKRCH7pPPfPj7IV+NvosMMYKGJht/I?=
 =?us-ascii?Q?Zj6nW1mqB2UC91vl3Hzn+c4Mv+ef6GkfmNWv0CjeRa0KRDncxa5CFxJiCiyL?=
 =?us-ascii?Q?mlwn3OE/oj0w4VVxx2dA31PqUX5m+jSj/T9wltPj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d754ea79-8e4b-4690-5a76-08db4f887f51
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 05:53:07.6233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BG9mS19hEcMBleJM9pMo7KEQ7XsuBAidPIglnErqQFbS4Nao4IxNo+GpNozVjHEM9zUM58uICCo4DIrI9G/bxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8523
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
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |  71 ++++++-
 drivers/gpu/drm/mxsfb/lcdif_drv.h             |   5 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c             | 198 ++++++++++++------
 4 files changed, 206 insertions(+), 75 deletions(-)

-- 
2.37.1

