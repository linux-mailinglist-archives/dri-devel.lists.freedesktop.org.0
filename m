Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55043A08AA5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 09:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C1C10E4EB;
	Fri, 10 Jan 2025 08:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="P1C0xRdn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2079.outbound.protection.outlook.com [40.107.249.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1B510E4EB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 08:47:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtE0Mm82Khcnhhy3VMQOGNKZu4uINs0sfDkpxzJhxr4lzxl3mLPf66jswdZ3o7Uf34FiS0cfXC4ToXm/xHh9Iz8yyYkBgYiNcebl8Jlg2XLVLuvX6tgK7l9g1VTkOd3ZZGnRAupIVUJXczEYY56XKNu0NYVqeXveOonJSpq3m+eaHdUHplzzpO8KgZ5pVkdPoqkpcvUleJ3h60OWZXHwN5LyRJH7y/2Pi28KVdvk6i//wPe+sqGR50c3NezYK92pbv9oLTrjLN/hdV6kGtRj/lICREU0CrLb4i2k2dvuOYMDL8kq4Leh5nqM5I8xCMwurQoA97BFxOnEsQa92Fxr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aX8rvtCYxOShjWV5Q3g6lDkfgAxib10YauCKTBCDEAQ=;
 b=TSOtGJUFABW4+iSbdYGe50BaxgC6W9jclyq9h9DIZY25Tkh0WWt2/QjO0mTd9IvSqzHuWEiEznjgXm/CiurdPwvLBkfB9w9nmWaMXJ1nOEfqUatngytbcE364itvE4ACUH3Nc8WOgtnan4KKo5xv5oaKAcsGO6sFbUbg+x9UensJZHIr2M05nKktYY6vGZJwN6M5ZyjP7r5gp+DYm6N04F/ylYzwn/zgzgTIotnPog4xpuqy1/EWFL+5yixdYRKyU3ezRKpWzOZmRexpjaImJXiawedKIMRc2ROHGwilIuAeeloBstWF4E+SpLVlEII8khI2Q93ZCsmXFX7LtZwW6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aX8rvtCYxOShjWV5Q3g6lDkfgAxib10YauCKTBCDEAQ=;
 b=P1C0xRdnxTQwxcGL3noPCIepYyAx7icjm82eTlYR3lBdB4kKCO5LLSu9PWInAPG/oWhIkKSxKQJH3l0gN7Grsb0qoQ400B0CGY1nvjH/zzDEtQdItFaayHJi5QCGZtSgABEb7YY6RuO86YEpdYAh3DOzRqt9+3bYte3o0jBjV3pU0f7StZvqWJUxH+bsvFvc+0GTzHGRJ6EwdIwvK89OYqLoGcl4oNJWIzpjfPitHnckF5EpPE9vx4vlf4+Jt1C3e9UFqN79ylvhvPSJgtcjmK/cpnuLTIin553VSbP1SXPYci/YZ+yP84kC39kCMyc+8kdkCF3XMCv5iMKR13HGTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9770.eurprd04.prod.outlook.com (2603:10a6:20b:654::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 08:47:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 08:47:40 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@linaro.org
Subject: [PATCH v2 0/2] drm: display: Fix atomic check for HDMI connector
 disablement
Date: Fri, 10 Jan 2025 16:48:19 +0800
Message-Id: <20250110084821.3239518-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0186.apcprd01.prod.exchangelabs.com
 (2603:1096:990:75::11) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9770:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c41ffb-7fcb-4b1a-a1ec-08dd3153710e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x/5tezRRycnSGmSqpDRj+vFUw4X8yvpYmmCZsSzfxCiJOPSLY5SM/CL6uyHR?=
 =?us-ascii?Q?6qxXG7Nb/Lrt+SgdI85VLAgpkREvme5HA+jp+j5WRqf+3bShfB6CUbbGpgny?=
 =?us-ascii?Q?qX1BC5J+R7aqCCx/EnifinHwiFrfBTq/eAYn7w3Q2EIZRTDFnffNWZaKelcz?=
 =?us-ascii?Q?TVBwc2WZVRJKvQrbhiXUImqEoYAltCS/zqpWlPaFvmgOBCQvULUIw588AFra?=
 =?us-ascii?Q?lGjuGb34P4ek8yTQXYWjtcWcMzVevH0vwNGeztEjowEk0fUHJWMN8iSUl5F3?=
 =?us-ascii?Q?H06LRkrirK0tmXkSV+Cu4uE+poioZt2/Y/AHRw5Q5/Of9iqi4rQGbYSL/niJ?=
 =?us-ascii?Q?XBC1D5d0rKuzvi+/Ip72yC/Ycxf7KrGp87Q7KxL628JUjZovU21bFwzdo57B?=
 =?us-ascii?Q?EjblRZ1aMR6Hrs/QFxABMG4G4XBlyC6iTdxOjggLIMRzoju8YecQArJL0owq?=
 =?us-ascii?Q?1vB4cAmD6U+kOEJh+iPJmzDroQsSPKtT8e+wzsWuggR1NTNP9ilA3MMD36il?=
 =?us-ascii?Q?vfwFEPKoKPA0U7WGgLjRZURETej7aHT+d+nfI2y+mUAAMPI8H+GtgQUmF+Hg?=
 =?us-ascii?Q?VHxPxOWhDPROiwOrnsOePsz+mEs+7iWTeCUOhF//aveaQIFbaop5cgJA/svt?=
 =?us-ascii?Q?sQjXi5JbBCChkP0wBysz7bpMljYlWIlvWSv9SUC6P5jh/CZJynruFuk3zCA4?=
 =?us-ascii?Q?o8UHtvoT3dPdGYE+K9lGGaGp86aW96MbYIMQ7XNVz+9C4VwYqT+wqS3vYFbI?=
 =?us-ascii?Q?l/WWBhjCbs3o9M3ixd+2LctqIRsVm4s8FYVHKwU9zGpSNU4HMBagsGMOO4k3?=
 =?us-ascii?Q?l07YqczewCuBiMsp5hpFt1qeNb4wx3BNCRO83qCXnE80JadrwmgXbO+2uYG4?=
 =?us-ascii?Q?gZyTgYuo8XEb9bxc5Z0f6wXJYOdd0sN4aLBH23jXuRZVs5nCYSpsRgr9AyuJ?=
 =?us-ascii?Q?zJO1YlQJdD1c2n4vPKDq4rV59cXUqK0SN9o98peUUpSdfAZEYW8j5zTFSrQM?=
 =?us-ascii?Q?xA4MQyZ+imrH8gK/H9NeSvH3VKO1Ue9geGbYhO3qklNgWb62CkqTAPO2UuFV?=
 =?us-ascii?Q?P9v4roDUCbR3Oox+VQ89W0TNM19/juKwHfJgt7Nvc6k6KTCezAxNWyQbqmrm?=
 =?us-ascii?Q?EiAHjUYq3FBohuN/mH1uymubzuGV2tI+Jec6G0yVNhyZapT1ZiwKeknqyXwE?=
 =?us-ascii?Q?D331PaWK9rO/Myfiv70zUyvHI7cuNcOmr805l6vC9jc8U86wmbzhrMwd6Qi+?=
 =?us-ascii?Q?f9WyzsoQd1QdamIX2Z8VlTgX7oKRHPO+4JDKkTpybyf5F6g9iS5uaJUCqhi+?=
 =?us-ascii?Q?p5wIMs29GxQjzEnBrY11jVgc4ZHtkcxSNqj7bY/SvWLMqSVASrt7/lzyYRIL?=
 =?us-ascii?Q?3KNt+jYx6y21oP+5TiE4SLJ8XTNwJJuHCcF8NaxisO3NYJ44t5itAyiKeiRm?=
 =?us-ascii?Q?2Ncyi28zDPqjTz93NMR+ryGho7p3UJBc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RMSGFC2hRdZRdEAU0Iiw04K06dAiJIkIXm6Qj2On4HgFJT2R9DORMx37108A?=
 =?us-ascii?Q?65Tpakx8KppP65M3JMy/kxh92xrH1daUe++rIAidksLVmeRnZNcP40RxcJo3?=
 =?us-ascii?Q?3eQYuwofp/pf9cXV19RRUelsTbxjqwStucite0QVc4gsBaZA1e+Vt5rEUYlK?=
 =?us-ascii?Q?D1caqZx0jOn1yTsJ83XUgLU/lCYd7uihyhJA8XJvYtfruvy41L3Mci3TSGxb?=
 =?us-ascii?Q?xGSD15B4T4g4du9pYhVmfTT32BJzcWqkiik4U7SuK21Mfrcl8QdWJDvyjEkU?=
 =?us-ascii?Q?/pKySDp/+RgyLFaLReogkOY2FroUnR2hzddkLF3pmHZmsEFmiwpxXTlDYAnb?=
 =?us-ascii?Q?1lS8yaSyrWIZmVf5s6tftXtdB7MU420hC9rFoeAIUMApfQmwocasvkQHatRZ?=
 =?us-ascii?Q?OSb2fvduG/9VLP0TTxTi4eKMwyHZB2OOA4QJjeCO3BV6J9o/UxWDGIk+rsBJ?=
 =?us-ascii?Q?0axzg7tgA4c3JztabrIvZdbQc5CVkx91+mFtGRXYXXbL0hlMYZRJ3mrrRRAo?=
 =?us-ascii?Q?FOFbkAXANdFVVUatVyeWCxZgo9+8aYlTwnQptau+UKdQCawUe0Djj2Z8XmTf?=
 =?us-ascii?Q?TvFDEBV7okcTr2ZCn7r9uKwBqGPkVdkrq0XRCC/FyQm6uLq5Qt9aQh/0bDRz?=
 =?us-ascii?Q?0miIcFWogQ0RyCOpZvnHLz1gIaOmFQBEQn6zLkLHy79A6vkAJmQFhyi/3MaQ?=
 =?us-ascii?Q?X3ytFzMtHDYDiu0Q66AGIUgfNpry7fEwhoZAEQtKpvdyFs60/ZTHmWitaRbQ?=
 =?us-ascii?Q?7yy4e0tMGUm6/GxmqM2yOBdK5ligWr8aDcBkVlx7PeY/AQbkNvmw025LvKAx?=
 =?us-ascii?Q?KhBM3z1sQXfrz4fhqOkV8eSoKnZX+I0cI8iD3stB1XJwNjGpJKXamf+i1uJV?=
 =?us-ascii?Q?eEMnKOtfwD8sSo+gnqDz9WpXM1VKIgU/P/ipTIumKRgn4HlQkXi4hmjhnW0A?=
 =?us-ascii?Q?0g+Mo/Oz6ltVnf8ZWf2Lg3yIFxeVT/krWUyHlJxPggaLYzE+G+GfIHzu0OVp?=
 =?us-ascii?Q?BJoLloatDOwSfe56CmkI78x7njc+6jWJmCLm73CYOFpF5B1/JG/bGtUW3Cla?=
 =?us-ascii?Q?rkjmF3snv7zepBKflzoM9hehkd1m8eGSmeRr3vSjyuK52vFbSVeudBbDsF3r?=
 =?us-ascii?Q?5CIwYDnI6SdhtMyfMqCpI59JU7st9zxti62EPJMA5mJ/0wXHfLxW7FT2iss4?=
 =?us-ascii?Q?txC5Rozo/xKMxf2k++BDqQWSc0QsJ9/lnMFs7ZTSEtmUrrN83X+HhFXT+VEx?=
 =?us-ascii?Q?Zqfw5CyuWgLGGpWPbZ5QatzoNZjHqWoZ4PASlrTMgtSLFxsskshFJG83ccoO?=
 =?us-ascii?Q?JNHPe3sp6TbHa2kVw6pXxXq5LKWVdBrhMQ2rd9Va4BhoF3PkOYTLuK9NPvKk?=
 =?us-ascii?Q?eE+lx7z6bBkk1gnEZW5jRyA3tq2f4dmQVC98Z2QGXBntx64roP3Zw3/eK4S6?=
 =?us-ascii?Q?wDNaF9NrJqmi/HX5IxLaa3OL/8qEfZ1Vvs7NvwT12JwDajN/rOp9lrCPcrmQ?=
 =?us-ascii?Q?dQFghwo+13NaqOh4r5Pl1l+z/UQWZVeQjyruMiohPemo3tG1Wu20iSV5DwR3?=
 =?us-ascii?Q?+qpXcCbsZhcnDazJ6WClQk0c9Q+XsT8O7/wFQv4A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c41ffb-7fcb-4b1a-a1ec-08dd3153710e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 08:47:40.8480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0tIFEXVeR+/MXuNyM03aW/nHnA8nY1OnvCk9iwdMgEbN4gPp4N4Ee0sdW+VYy/+xpiCfSO/HXXPSm4yK6t6YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9770
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

Hi,

This patch series fixes a potential NULL pointer dereference when using
drm_atomic_helper_connector_hdmi_check() to check a DRM atomic commit
which tries to disable a HDMI connector.

Patch 1 adds necessary checks to avoid the potential NULL pointer dereference.
Patch 2 adds a KUnit test case to make sure that atomic check succeeds when
disabling a HDMI connector.

Patch 1 is tested with i.MX8MP imx-lcdif, but not tested with sun4i and
rockchip due to no HW access.

v2:
* Trim backtrace in patch 1's commit message. (Dmitry)
* Drop timestamps from backtrace in patch 1's commit message. (Dmitry)
* Move the necessary checks from drm_bridge_connector_atomic_check() to
  drm_atomic_helper_connector_hdmi_check(). (Dmitry)
* Add the KUnit test case in patch 2. (Dmitry)

Liu Ying (2):
  drm/connector: hdmi: Do atomic check when necessary
  drm/tests: hdmi: Add connector disablement test

 .../gpu/drm/display/drm_hdmi_state_helper.c   |  3 ++
 .../drm/tests/drm_hdmi_state_helper_test.c    | 52 +++++++++++++++++++
 2 files changed, 55 insertions(+)

-- 
2.34.1

