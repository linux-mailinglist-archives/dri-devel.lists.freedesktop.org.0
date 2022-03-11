Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 322244D5FB7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 11:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378DD10E8D1;
	Fri, 11 Mar 2022 10:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2111.outbound.protection.outlook.com [40.107.92.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852C410E8DF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 10:36:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTHS+eVoRTgc4LfECD9M/Lgr5vrztPsAwiZmis+4Uv/mrlhqj6DmduyvqU2o2Wv8/k3mncQ/hymb+zOnqpTT9RTm8STPoDNgg9ifj/siq7znS0VwN+q3lp7NbAfd9k4RzSfskBcXnzkjArYhY2753p3M8u+3jCwzQ+p6zbY40JA6Qv4UVDH1Z8b0v8uy5pQIShzXZw0E0JuFD1kAL62kHg/cxtfpHR3tX36oOqdXpDu61iqG/fV46DQ6Csv5h+kwHa5attN+VUvhxQF30fU/AQOnu2lq9DBmte4YrtvFDhHVwqb4xno/LcvQWuFq5g1k0SaiDQgWt/a7m24rxp1J3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdWpaL++G+qbrTuS099Pq5TV6p1Lq5innZSWHVrKhd8=;
 b=H13lQaKD6Ou0qkkyzcNuPTnfvsWe6Ljjw2GEGB/vegnCd7NXIBUlYfn0/y/60RS5Wks4JU0YAz5Mr9MUfyTpdKXtDmVKFdMmki2p1uiF73y/K5Qku1lvtFnRO5ks0xJNTEnEesOeDePQI+hi7daXb+lUVzH5xu8tcWwgPd9/HBSEJPrLglQFkUojZJZi3G+Cy7GuRyPSI0mXkrspkQrTPfaiNrXdfkEgHsQe2htd9ojvpPFtwva879zaNleMmX1W9ooZNw4p9P1v7rrLcIGx5Okuih09YmRgGc31Y5cJGk+juycKL2MjpHnDnHWj5cAOh1u+2PXIgXeYRH+3L4GWgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdWpaL++G+qbrTuS099Pq5TV6p1Lq5innZSWHVrKhd8=;
 b=gmBSvX8rhcsjKHKGqOA8I5zaNAmNWpsjLXJCZyK+1T3xPlE8bwlOiEAOmQ4UQ/ucFreJuIqRkq5ygrJumEEIXsH8n+u52zXBJ+MG/9HvMQ7R/Ipk1IlEvsTOn6WlEoedJMcYwtLunV3dPkJTcilQh3Fm2Cot+0g6u9XE17Owr6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by MN2PR04MB7021.namprd04.prod.outlook.com (2603:10b6:208:1e6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 11 Mar
 2022 10:35:59 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 10:35:59 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v2] drm/bridge: anx7625: Fix not correct get property counts
Date: Fri, 11 Mar 2022 18:35:25 +0800
Message-Id: <20220311103525.1431890-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0195.apcprd02.prod.outlook.com
 (2603:1096:201:21::31) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40e6b493-3d9c-4a56-4524-08da034aeea1
X-MS-TrafficTypeDiagnostic: MN2PR04MB7021:EE_
X-Microsoft-Antispam-PRVS: <MN2PR04MB70218D98657D4EEC9B454F2DC70C9@MN2PR04MB7021.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JzaWMgETYdvSPM6dq0KTtIZyDWVJMcn566kMEILlZ+4LWPg1VKSGCFicTJDYEBcawv9+KT4yN/inNiSSacKHaSvsqsRyO3r7mrHNWuH7HVU+fCVZSHscERNeQc1TEGexsMGjjbCSTjA5ta0f5SdY/8Qg+xeIE6Grkag0G96uBgw8elKDHbgA9/kDi0P7PujZM0vPtvvHJCnfoGh/FILI1hdnwjfjJgckjPwl+m5pi3oJcpK42X+/cD/1pxHxFPb4LKl9XlQ49Q6FUuNcQWwAnuFW1HOw4q0GBUEE5WNWc55Zkp/VUMG5EiPfBVcosKMJpd+sd2j2SDjr1wvETcCXprTOSzB74/1/x95DiH4nmqPBtF6YE0rvt5w5IXvhcL7NPenUyt/Md70n7As+uNmHF9Pk0RABs4dI14vl16f/ZibsT7zi//RCDzxqVdcseVtLmuKgiLDyHBBMKO/qXs5xpb6IuA/HvEto5NuGrDapKT54mASc1x1nXiTi8R3fTzd/5PpQl7AiW3zNLXwiTXFpyhcqLM+O+bImkEsOebo+bcoXG91FgSXw7gl6Ul5LoTxNtRTQ9C3dRdGgXHSq/MbGURUClCaw9FA9hPwSautTrAvDTfFYcg5GXo1f+L4EMZFTKMhagQqbMiVRT5aerUA9b4/G455YkWByt4Wy4edMwF26YB60nXTa1d43GavcFvZQ1Zt5e6nhAz/4oZr5xU6t/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(8936002)(7049001)(52116002)(6666004)(36756003)(6506007)(55236004)(110136005)(83380400001)(26005)(1076003)(38100700002)(38350700002)(2616005)(186003)(5660300002)(7416002)(4326008)(8676002)(6512007)(66946007)(66556008)(6486002)(66476007)(498600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5LXWKM+pbpOzKdTiTRqGOC4WEQ6gRiKTwb/+FTT9sy0mpJqVGZ020VOu6szB?=
 =?us-ascii?Q?pNTdgJhSKfg54tAFy0diwlN1QCxArRDAVVNnC9G0u80RoXBZwxDZNLhLph7M?=
 =?us-ascii?Q?V0xeEn1Ilabvbi5y3YdJhpfCWvuprCchsa4LSz3zngZ9tgV9Qa604ab9iX5K?=
 =?us-ascii?Q?T89sjdRBGJ/XlkTNW7irHw0BGS8eCbNxZm5/VaOgKtE5wUIK83yNtroPwGsi?=
 =?us-ascii?Q?Lx3f3dwwZmfj8jKwIn1ecrX5i2sgwFhIjK/RYFu+9ZAF++yuz6L8n161YKjr?=
 =?us-ascii?Q?QqFZEKFInJXjqCkS+CDl96dTQ1ewbqkjchCE7kNIMfLTDT9Ds+9PNbAZSHHr?=
 =?us-ascii?Q?h2SUv5EvgjMNKlXhhXdJP1qvdh24/5hoXfOAH8FhCWfgOSwPw4MozUp9eWzg?=
 =?us-ascii?Q?2GPZbKlUnYv2SkxUQLXImp6hGKgIlaNWgTLnxWw67xFWIAm1lEYPgKDhUsVN?=
 =?us-ascii?Q?PlyAaGVLsvLk2g4Bfl95QVvDb40MLFc7jS0JCsqiMBwrTvD496HowwnyCuT7?=
 =?us-ascii?Q?CjNje0kaLh3rcQTxWJhT8woA241oeVvfJr1X9dPQI8IBUllyIvR3aozbjLP5?=
 =?us-ascii?Q?cBn5+SNB8CFmAGaiq1rxUXD71SLQXE0wyw8pxv4dNqOEywfkCNkcNMdLZbxY?=
 =?us-ascii?Q?6M0r5qapLHyKfnbivdFOQJ+/xDTrEtW02tRed9sYyH8aeHV+dV1x4+T17RRl?=
 =?us-ascii?Q?2PiOhbrSk+/UaNjCGn6PYszbIP3IXZymWKuQDeShV3ufRbpexDUyFM0xfk9C?=
 =?us-ascii?Q?e1WKcgUTtMy9jM8YimUxKQAOf6PM1mBKbxIGFpBm1q4TjaJlglqoSX0xfnoi?=
 =?us-ascii?Q?xPp5JqIzHxIYnvpCQPqqIEcHSTR3wH1twtgjgZNQsGJZbt5ULuZigHKMLdHE?=
 =?us-ascii?Q?bgWRwG3SJB+R6FL6Y0ec48yO+WbGfmp26IFvf0U6hlq+7Wdlq77Typ/aEe7L?=
 =?us-ascii?Q?G0sJV88bfqPJ7x0vDMp8i7vTuS7fDNha4abaZ+5PZGGezWv7d2R6BSbRnyr5?=
 =?us-ascii?Q?OyetJoKTueC6WnOB4v8OgHYbR1NvkegxyXxtrRDPKkVNu+1r9dia2pm9msbg?=
 =?us-ascii?Q?qIEJo5r/Y8qxGt7NC67hYUk4FhL8JVkAgelZQ1WXTxlrnYHm98YtSjjVIXTU?=
 =?us-ascii?Q?sNfLZJkZRo98ItCyNNmkgL46wm3WW5RufMcmur7Ek/gaUlDpDJ+zaRhqjQXJ?=
 =?us-ascii?Q?q3aQyf89rDau3Xmd8oSjaGrMagnNSn1OmJNz1gN9OmYQczUMhXwdfIF/qtnh?=
 =?us-ascii?Q?g8+Sea32IEr7uqPaZ+6oq54xmvdfKgPAXpVHnq+M4J+uPv5TX3FXUCHHRfqq?=
 =?us-ascii?Q?94S3ZFVYKJj7GpNgiF3+kLFknpk/+JDIeGOg0kZ0ZwVeAvFfeL0QJQs1tGhd?=
 =?us-ascii?Q?QK0jd2rqou6Ek1hsHPAoQ4nKEW++QLnF9+g/WUFgjr7GgO5t8xM13iv7Y3u3?=
 =?us-ascii?Q?UlzCz5Ud40/cn+BMVhd6eKgTW2jQGMC/yweARcJztlq+LpE/B54rxOg/1Tdd?=
 =?us-ascii?Q?r+LvuydRk4ciIJfo86U6mylvwPoPfKhQJ4fM+yuOWzwh82IKHTD+XT4Suoyr?=
 =?us-ascii?Q?qBoD53euLi3cM6IetCMb6A/jj6pA8tXMd5K9zKEgh9zvt0drusHgv9xhy+wk?=
 =?us-ascii?Q?+QtmOPGgf8gexk8Nt7lpNVU=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e6b493-3d9c-4a56-4524-08da034aeea1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 10:35:59.5011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lr/RdxyzyKMIe16/BN8NakpfLPa2RlzztRV7HjsDwYPOaGuFWs+unpdT45TGqDW/z/GJ+XDxl6gTjxPxTutydg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB7021
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
Cc: qwen@analogixsemi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mliu@analogixsemi.com, hsinyi@chromium.org,
 bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The property length which returns from "of_get_property", it means array
bytes count if the property has prefix as "/bits/ 8". The driver should
call function "of_property_read_u8_array" to get correct array value.

Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
Signed-off-by: Xin Ji <xji@analogixsemi.com>

---
V1 -> V2: Fix Sam comment, use of_property_read_u8_array to get array
value
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
 drivers/gpu/drm/bridge/analogix/anx7625.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index c6a9a02ed762..628cbf769141 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1598,8 +1598,8 @@ static int anx7625_get_swing_setting(struct device *dev,
 			num_regs = DP_TX_SWING_REG_CNT;
 
 		pdata->dp_lane0_swing_reg_cnt = num_regs;
-		of_property_read_u32_array(dev->of_node, "analogix,lane0-swing",
-					   pdata->lane0_reg_data, num_regs);
+		of_property_read_u8_array(dev->of_node, "analogix,lane0-swing",
+					  pdata->lane0_reg_data, num_regs);
 	}
 
 	if (of_get_property(dev->of_node,
@@ -1608,8 +1608,8 @@ static int anx7625_get_swing_setting(struct device *dev,
 			num_regs = DP_TX_SWING_REG_CNT;
 
 		pdata->dp_lane1_swing_reg_cnt = num_regs;
-		of_property_read_u32_array(dev->of_node, "analogix,lane1-swing",
-					   pdata->lane1_reg_data, num_regs);
+		of_property_read_u8_array(dev->of_node, "analogix,lane1-swing",
+					  pdata->lane1_reg_data, num_regs);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index edbbfe410a56..2c340f16f2c3 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -426,9 +426,9 @@ struct anx7625_platform_data {
 	int mipi_lanes;
 	int audio_en;
 	int dp_lane0_swing_reg_cnt;
-	int lane0_reg_data[DP_TX_SWING_REG_CNT];
 	int dp_lane1_swing_reg_cnt;
-	int lane1_reg_data[DP_TX_SWING_REG_CNT];
+	u8 lane0_reg_data[DP_TX_SWING_REG_CNT];
+	u8 lane1_reg_data[DP_TX_SWING_REG_CNT];
 	u32 low_power_mode;
 	struct device_node *mipi_host_node;
 };
-- 
2.25.1

