Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBABB1B8ED
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 19:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A9510E6CD;
	Tue,  5 Aug 2025 17:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="cJyDr0W8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012025.outbound.protection.outlook.com [52.101.126.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF14810E600
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 07:47:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRjnCn+cwmmH+jDeILHFBQPhe4JMWyZGAN+DeVyFnnbbosTyhSi787c1QvR8ZJ7/BCKl0oPKPcVehmx7lrE+z6Hm6dKTduyFixlsbcZxOxsDXPaAfOb5kBBv1tmkXqhs+MDNpP6ujvAtwXQaoE432gtTeyRFkKw2MQNhB+QOA5FxByRSCQ0WkM6L4a4KZFBQT+xuxE4qAtvcArEPlsWVDuhnECXruQcs+VpZvLoZcuc21Hz+BV4TiEWETosDgNOqgmbjArS52jlPA9dLORpyPprzEr8ir3VqDk3cYmfsm+dTzhOm/PhnRbC4GveeDSEz/pqF2Fp038cgyvoXyNCMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VegefIvQ/6IBDYkgFdRmYX2o2N5zc+RWIowozX+0NRA=;
 b=Q4TZDljZE4+4OtES+XEbUJRZmU+/ZLPmxIq1sm4eYnp9mBcis/f9LKR9t0DIaWc+cQjPxqmb1k9NHxUVH4FAoGcyp+egZ0MUHGG1k6J3s6pZAKU9hdEXisDcShl2vE1Qtb/SFPiEp2cc0KaMS8bqtXijP9/ilkI68qrsVZ0P7I+PH2/GGfKU3EfdwZ1QMktdK6kvnO2F44rR0INBS93z7dN9WnHdQteEIGs/VGRAWhvbdhK28/7IZ+Q1Xq5MdYsQctr/iz6HRFD59+4YpfRf1jMrmQDx2Zaca5aMdp/PJqwqwFd/mhGMaJEPqqN06O6CfEjxL92Kldk9T2yrsbtYVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VegefIvQ/6IBDYkgFdRmYX2o2N5zc+RWIowozX+0NRA=;
 b=cJyDr0W8sAbqATRc4sMqkgLOXup5ttlOM2YP6MTbWJGBuKflpNz4wVnehOpLlqaYbVtQ1C/c+H5JVAA8bHcrUsRyX1pI6cN85i2tyUhSoByZbzAmRDE5KzZvq7NUhbkcPLOnLJukvkSp/GAVQrySMyExhTGWZJv2dExZcIaO4SJrevcm85lJ8XtHqYSmf+Wch1dCrNspw198SSN4/Wa0NrdOu1YYo7rnvtiS/XxFpiXa3xYbT+gqgPQ2YNsNj+GN2aDWr5sJetsjX0Y3NTgQeNL7pSZoqnmiAgRz246NIUW3H9DapXhfjxoVRTnMeueV3bR6E0S0l7q8wdTMu7PpFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by OSQPR06MB7278.apcprd06.prod.outlook.com (2603:1096:604:29c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 07:47:28 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 07:47:28 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 4/4] drm/panel: Remove goto label that are only used once
Date: Tue,  5 Aug 2025 15:46:19 +0800
Message-Id: <20250805074645.625911-5-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805074645.625911-1-liaoyuanhong@vivo.com>
References: <20250805074645.625911-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|OSQPR06MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e5ec22f-9f00-4b10-6795-08ddd3f453b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uaxp7whFQzXD+3DinsGng8ycopQMmKGjUt37pjLZJz40oRoKHrJPxk/bOo2x?=
 =?us-ascii?Q?OsR4pouf3Njwg36FuHuChgRDdFx54Y+del2mEZ62HpsjHvP/QHh4wTSikmHd?=
 =?us-ascii?Q?NYswgvFbKup6NbDLUvl3gP7ONvMjrPEk/Y6ajF36x/MNjLo7axj0ay3iVA6U?=
 =?us-ascii?Q?tI5UvdjBNxgx+a0b4mIzx19l8WvT+W+XbQpuGw/EkkL8JdS8S/XEqxbbi3T2?=
 =?us-ascii?Q?CItlxuwr/IwpHBdQ7eaSs+9GwMGo5u9JEKv3Ks471TpuqUkCFsFzgVK66ocN?=
 =?us-ascii?Q?eDt4MqrQqLLPoZ3au8JUEFi4hDGyTYLpwiqvomgum9ksyN0g0irUhm3wBqPw?=
 =?us-ascii?Q?i07e3nQN/sbdXNkyGcTebc/hf2vpUgBngQwfxck+uTYiQ6POytLeF/jhteMu?=
 =?us-ascii?Q?bulev2ikgCv4Qx0nWaIFyKRZHBV534R88l47Ae78NFfzXYQwkSTV0Ulmlydq?=
 =?us-ascii?Q?c0X7+eDtTPavLb34Hz5Ebenvc6wv255+Q3EoHi11ykYbFV7BDXzt1gXr0N/7?=
 =?us-ascii?Q?J+6oyqFR72GPtp4a2/l5fRpAQzzunMr3+cdx9JHRshRZ8wApukkrYmN6wlLI?=
 =?us-ascii?Q?EkP9j0Waw7ro5v504qaB+PRubBbn2PH3ieuoGVfry5V5LG4U8Jfl/aT/Wkqg?=
 =?us-ascii?Q?37xz36/0i1IfQyt9hlHIAe4eRh/F4AaQDbNIq34k6KQUmvCbedEzJHb/mLUv?=
 =?us-ascii?Q?Y+TiCyf6Ev/qKtO1ZE71CT+JEavwO29rwRG32qaeiJHobd+28LKGvtZG+n4I?=
 =?us-ascii?Q?++1i2OGVr5QPFeK4ph9R4nQiT3O1xyi0YxfF8RKvdVm0QBepWOAxly7f79TP?=
 =?us-ascii?Q?DBaedWQ0sfX1BdaF4vsLUcE19IfexT5HsvmZ66SE9n32oDTj4y1ieapq12oe?=
 =?us-ascii?Q?Fyfb9lwpgszIISlqmAx/6sdJVYUZByDPTd5We0lhDmQmBYqRm8i3a0j5Q9xx?=
 =?us-ascii?Q?tZLDnQztWBBCmgGss11zRZbbBMEKs9IV21OULZ7WVdnnTIMcx5QRmw4qaKfS?=
 =?us-ascii?Q?b9bai8dAMT25WY7CNeyMNXiga4FC+oiJtA3VtgDPWRcr7PZLsSt67MYW38K5?=
 =?us-ascii?Q?SOHR22bDNHoX9vsOYc4Ca6R2tP4ZxF0or1jO5kiSOpXQ/yga1Sip/EBUvCu9?=
 =?us-ascii?Q?8FzO2WDsAb6Uin0394snkcBN/59kwxQmUcegMsBEmKI/M6EsUi90csfr1pdk?=
 =?us-ascii?Q?Rja7S2ddYYt11tTRTa8o3NcDy/zGvUUPF23usk2w9TuA3TlFpH5Uo1QrLZHb?=
 =?us-ascii?Q?eRyEuc5cjo1nhm5Ital3vZpHraj7H7hb+WZCeoETTSkAuNeKj2L1ntykwYqG?=
 =?us-ascii?Q?WI1UI8WTTTckTud+n/zkH8bzc4Sp85kYSqFcvkiLgyKGbJ03kN9A8VEQ4qP2?=
 =?us-ascii?Q?MJIadsRXMpOWzVhkOKpZuVSmDg5n/J+4FLBvUNpJxr5XXwsrOSIm0XxFSfT0?=
 =?us-ascii?Q?REwFTY0DUwymF5VDTAJQXQ0O92nOL+2y1IbdAUff8yr6JRSyFXOUeQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oa0UKon2vHkVdkvuvnS7gj+aicAJVhcf52fsemor5mOtklQWt315MUbkpIdl?=
 =?us-ascii?Q?aVgr+Zc1aT8KxeE187gX72vf/qfekjYVZ6ntvbNUERv0xGnUGIjqAsrVcWrN?=
 =?us-ascii?Q?qjBdMoW6RyvVgEcmOwwqlj8ipt89zkwJQGulU1a75NoEoDQjsZhU4uqVR9Nr?=
 =?us-ascii?Q?mOkMoQMH+G/00HLYci8ejA2sDvr/TsZuwZ225QpoUshLj+AO1S653+VO8LRV?=
 =?us-ascii?Q?Vcyiplj44REKGqXrySbVyAc33HQHQ7UwZB8ryvTA+F2xsXtWWaOqhgzmJ90H?=
 =?us-ascii?Q?NHbiGhGbpxTF8U0/HtRi4I1gNpDkyXXAhVLM4psArSQxASgsZtvAg2Y521li?=
 =?us-ascii?Q?QCqa2RvH2VH6y+xVbRT+3+W9mPcNpztOsB3jJR0GNfwN9/H5isr4TT+togY3?=
 =?us-ascii?Q?YR8xCYblU4GZ5yiaSnRjgmtYtnUSyZYkSkhhAseYBWCO/jUQ65KjTAmP8aA5?=
 =?us-ascii?Q?VtnWfYYoILznI34w+Nt1Fo9UtqSr02wmcX+6mNyYr/d41l4SvnPXha6TiSWY?=
 =?us-ascii?Q?foJXmmEGsySt8pWzHxaqDt8RotNTmqqUFt8Pez+aUEObFEK5HvQfNYEG1Qf3?=
 =?us-ascii?Q?4IqspxdAP1XMX1md6740ZA1ydcPKeNyhlNINwk2pj9mulbyJNQ/9gGlnm1KD?=
 =?us-ascii?Q?RzagnH1dSrebk7QhGFmbXKjrmBuxZUWS/+qZ7I/ScM60X+h4HKCQuJr7pFL7?=
 =?us-ascii?Q?DEp/yWztIQm//yJVkaD8B64uo++g9pmko8q8GsNwBvxfKmeEWth75yugo/3F?=
 =?us-ascii?Q?LlQ/rwIPLbYm1C1v1MYzNHxHDJrRCUjjSiizzqD40Lklfm2xcFkvDhxui53Q?=
 =?us-ascii?Q?/b8VPHKQ8kP0DlTdCEjeAmCbm+QILjP5k1M/iVHAvKS6qCuyJJmrtn6HhDly?=
 =?us-ascii?Q?u5uHCLKxd89rp1BSsLs4cJjd38oL+Zuzl8jTs3Tx5MuwFDX+lhW4B1pOIUAq?=
 =?us-ascii?Q?TGjmQdl2MJ3XmuDn0bQUh3dSBP+oAf+D95SwQaExUpX+srE31mSKo2t2QRte?=
 =?us-ascii?Q?SsLrUeIVGPCPTetP9m+K41qUgiM2wXI1nyIi/O1plCODEuIUuqkfgDFeLd7f?=
 =?us-ascii?Q?sx/UB7UhHEQS0+n6oz4WKbRg4OFpWFSRJAwtPHAq+/VKm9FrDzMo7itJ5uod?=
 =?us-ascii?Q?soWwUt9yL8PHjKUPNDbsyhOCcZzTYfnASeiqbc3uujpzvAoOANF350P+t0mO?=
 =?us-ascii?Q?oT9RZFQ0zvPfv5TwwVAS8Q/hn2TNx6GgUAHO3OUht/aoB1CyLjxF3MC/Wo3g?=
 =?us-ascii?Q?2/ccrek1PGS9kbsR7vkjRXY+WAJ9E3iEmXWcCa6Q9jxRX0jGvtM1PdeQ7/9G?=
 =?us-ascii?Q?74LNjurCmhwMvI4KVagU82uFYXUxdn1kAa6M9R0GvDR0UyslVeP7eoR5T6k6?=
 =?us-ascii?Q?nHgkL/8Mw/0cZWdYAdJVS8OylOAKvhw78h1sD5CLC38f1lbw11xc5eIbvjs3?=
 =?us-ascii?Q?zZVr1ym6NI91Ke6wgOcfjkMwj/hv6jhdhHW1Hn0GXQJCBsn9sO7ouSgk/Lon?=
 =?us-ascii?Q?BEFo4DIaIGtwamtSThzcqwJxDjd+Hv+qODqA4QEhA/aJXea0WgfQzxxF6+7e?=
 =?us-ascii?Q?txxpAUNaHK2I/0mtysVDI4DoDiR/iUB+jycm+AoR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5ec22f-9f00-4b10-6795-08ddd3f453b1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 07:47:28.7981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlV2xFojEtEeyt7xW1lh9WFciSqi2hRE6GDGkj3yHRcrHGNp+EWVN5NwzG+mXhjG6JzH/Qg9N3wWB72At95GJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7278
X-Mailman-Approved-At: Tue, 05 Aug 2025 17:05:36 +0000
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

Remove unnecessary goto labels to improve code readability. 

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/panel/panel-innolux-ej030na.c    | 7 ++-----
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c | 7 ++-----
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
index f85b7a4cbb42..6779a584bbd8 100644
--- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
+++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
@@ -105,14 +105,11 @@ static int ej030na_prepare(struct drm_panel *panel)
 				     ARRAY_SIZE(ej030na_init_sequence));
 	if (err) {
 		dev_err(dev, "Failed to init registers: %d\n", err);
-		goto err_disable_regulator;
+		regulator_disable(priv->supply);
+		return err;
 	}
 
 	return 0;
-
-err_disable_regulator:
-	regulator_disable(priv->supply);
-	return err;
 }
 
 static int ej030na_unprepare(struct drm_panel *panel)
diff --git a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
index fc87f61d4400..95cf8f36dd09 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
@@ -130,16 +130,13 @@ static int ota5601a_prepare(struct drm_panel *drm_panel)
 				     ARRAY_SIZE(ota5601a_panel_regs));
 	if (err) {
 		dev_err(drm_panel->dev, "Failed to init registers: %d\n", err);
-		goto err_disable_regulator;
+		regulator_disable(panel->supply);
+		return err;
 	}
 
 	msleep(120);
 
 	return 0;
-
-err_disable_regulator:
-	regulator_disable(panel->supply);
-	return err;
 }
 
 static int ota5601a_unprepare(struct drm_panel *drm_panel)
-- 
2.34.1

