Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D388EB9EEFA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 13:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546D310E8CE;
	Thu, 25 Sep 2025 11:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="QwQrPbvv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022081.outbound.protection.outlook.com [52.101.66.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D6210E8D9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 11:36:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acwLPdZvI536D/as8NtX0FSVHG8ZLfN9hZNr4fBlig+5ZwIaEMjAo3dLXpB4xTS9FRZHor8rgwVfwAcrdsNXHp7XDiplwUmcO/xo/1a9z5W35cTRj3YY6ocl9Nb9eqJWpOqJDtk7qcobaCHSkOZZJe5ftr4Zy9glhpzlRvV+Um5O8s2ep9jGqIt+YqfwcbIQleYZedUsrmMpfYSlzY+2MRvhNWKlntILVPp3M+CMsaQDE8ircRGw4iIQQgaXTpCvVIZCuW6SsGxFheYYu19ez6IOitdgiWCnwH0xVhn7XeKeKWIBDJiDJzw3kuG1YvMPC9iKavb4nPn9fOJRscel9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkK4RaiQF3CTN9KyRswnAVGdfwUqjbu4V5SyPqvMOJU=;
 b=OcSEn1XoSer/3M8jy4EDohC1t/WcRYns/HGtXxilnUUiH167nTa15Kai2Z7UnRzmL3OcxjkWHoWvQKzuzltgoHP8ub1pAWZm17w0ZdOCqL+AcX9acf66xFH0An6z2AUuqu+ZU/nKeyOZM8dGgIq7d6FFEnocoJC8UmO6dc8jOGkSD32GmpV7kdGYjNAkaZ/hm693S2AtaAD0aTVgDHadYdDGiW5YKvMxtLlNyKHR1sJhRF3FsVETPxgPXYEj0HjPeIygc8t6p4FPpdKRE8uD72mEZhhHI1v7cCKaOKzJjONbAKR4jllZqnpmVbWgyGnvOQs72NvEst98zoXzpapKmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkK4RaiQF3CTN9KyRswnAVGdfwUqjbu4V5SyPqvMOJU=;
 b=QwQrPbvvlDsCeD5Uk4WgXFUBA4AMH8k4/A/ilekqzwhXki/wtktdFQaAQZeNCGD5Sty3lIxZ+l40rs8xmjL0uEkWk94XuzW7iNFHLZAEEP+r0ilW+27Ergbbd/xD/RGkny5nhke8Z0Wp83+aDBrBodXm1R1T4jfheEpwqPsJCCgpihQyaN8RbK43ABX4pNz4wCR2yHtiw6Luazkcwqpit+8kLYucPFo5qRSrDF9haVrc0zHWoA579ghfFbmYdc4AcncbhUa8vB8AdGWr82k6z1x0diX5XMMCLevQoKj37BaYCNBKcxQDVdxIBws4v7GmrW+i47KPYswIhZOoVDCoEw==
Received: from AS4P191CA0052.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::25)
 by DU0P195MB2894.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:59b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 11:36:22 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:20b:657:cafe::f6) by AS4P191CA0052.outlook.office365.com
 (2603:10a6:20b:657::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 11:36:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 25 Sep 2025 11:36:22 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 13:36:20 +0200
From: Jan Remmet <j.remmet@phytec.de>
Date: Thu, 25 Sep 2025 13:35:56 +0200
Subject: [PATCH RFC 2/2] drm/bridge: samsung-dsim: move clk setup to enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-2-94f9f775ee62@phytec.de>
References: <20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-94f9f775ee62@phytec.de>
In-Reply-To: <20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-94f9f775ee62@phytec.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Devarsh Thakkar
 <devarsht@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <upstream@lists.phytec.de>, Jan Remmet <j.remmet@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.39.81]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A3:EE_|DU0P195MB2894:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2c8f13-eab2-4e2b-4625-08ddfc27c0a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enBlcFlpZlNjOE1OUDR0ckxKOVFWd0JpUWJmV1RzRUdPMlVxY0g3T0FXM2tB?=
 =?utf-8?B?ZGtHS1ZnNysvN2FxREFlRFE4aCtTakJJMStnMFp4eW0xSmREUCt3cDB1eXo0?=
 =?utf-8?B?ZU5SR1k1RFo4NjdMa2wxc3JqMVBVN1BIOWNXWWhhQ2pkK0VtV2VWNUhlRTlK?=
 =?utf-8?B?anlzTEt1S2lIOHVlNmJxbjRsK0RydjNZb3E0Z2NqZGV4MlV0UnczaGh0YXM5?=
 =?utf-8?B?a1I1dVgxenEwZjEvWklWdUtZaEZyS3VDUU9lRzJQZjYrSnpUWTVRZ3pxVnZo?=
 =?utf-8?B?T3UvbGVSVVRGOEVlZXNXK3RqNnZ6MWEvYnd0TnUxK0FqeE92TDRYT1JKWEo0?=
 =?utf-8?B?Nk1EK0p6a2NaVlE2WFQwVEVvclRhS25YUE1oeG93UDRjdm1IclJjTzJJb1dw?=
 =?utf-8?B?Y2JKc0RHRk94dWdnUTQvV1huRkRnK0dCRDRYY3A3UnJuK0txZ2hzdndTN2Zw?=
 =?utf-8?B?c3F2cUJQMjRaVURKN0ZTdXRGMTRkSnNTRzZ0VGU1Ump2eUtneFJIQ1hEZjBj?=
 =?utf-8?B?RlpHVUNDQUhyZEFVbmVvQ1RSd0ZGOXpsenprYndBMHVENzVjOVB6ODRxeDk0?=
 =?utf-8?B?Tk9kMXRjYkxaQlF4RHYrWmJBNHNVWW41R3lOR0JVLy9BWFY1N2hycDY1Q1Yz?=
 =?utf-8?B?eW1Bb1dLM0lRVytQcHV5KzFwSmN2ZENGNDRWenJad0tPaVBCc21aODZ1VlhG?=
 =?utf-8?B?U0RWTHNRVTY5bFlFdW1haWlEUC8zVEJxYTEyVFpEU1hXdkFwWGtWT2dWaVov?=
 =?utf-8?B?cjlvWXl1L0VMNlpJV040YlhTclM5YS9ZaFRxODZ4UjJXZGVMcVlLa1VodHRn?=
 =?utf-8?B?MEZNN0txWWcrVnhpQlFJOHQ5MFZsV1VzOGhjcHQvazNzYnBzTGswdDAzZmhF?=
 =?utf-8?B?Mk4zNmNPb3ZNT0VKWGlwQ0cxdm9RN0FobnhvbnNBMFJNTkdVQVhaZE5tR3VE?=
 =?utf-8?B?cm1TY2lncFlXekdXM3BoSzJGUzRzUy9HaUZ5eWJ5d09CeXQyTzhDYUdUQ3JZ?=
 =?utf-8?B?RVZnRjU4MFEwK1VlUTBSSTdRRXJvVmJLZ2hyRXFBS1hQaHcvY1B1UHdhYXRC?=
 =?utf-8?B?eTBWSEhRWjlDU1M5THp1cCtNZFdWTnNIYWduWVl5RXlDRXFIUXNuMXVZN1N0?=
 =?utf-8?B?d25vMTdFUmxxZHUwUWVQa1lGbnFlQTNTV0hlNDhjblhFaE1LaTFLdU03N3d2?=
 =?utf-8?B?S21lZE1GZEcwcWZZeDh0ZHNFQS93TENvQUFNbE9PR3JGR2lldnhlaFdOcnNo?=
 =?utf-8?B?Q0p5M2F6QXBWZTNPb25ZWmFCaXRBWVJDS2R0MUhFTE4xdktFUTJaeExMZnU4?=
 =?utf-8?B?Sk5idS83MTlLWVQ0cFhMeG51VlpvL2tKanRaaGswR2ZXL3ZCTXViQVB1T2tF?=
 =?utf-8?B?eEptaUh6bHBYekk1YTNOVHdPWnlSaUpidXZIWWlWdUc5NzFZb3FOWEZEN05S?=
 =?utf-8?B?OWRlaFZISEpLZWV5K1A2QW5OWSt5RE1WREhrYit3dVc4d1plOFZTTEd6MUta?=
 =?utf-8?B?ZUk1eTlhbXJCMVo0ZHMzOUVQOHdmcEJCN3VsOG5UcHJldTdjNDdkM09zNUJp?=
 =?utf-8?B?bzJiYkhuTkpCZTBMbjUyQzcvbGt0anhqTzk5NXk4T1VtSnMvK3BtWm1pN1dD?=
 =?utf-8?B?cEtrdW1YU0NMalJxSStPbGg0SERSZU1DMGRic3YvWEJMM09UWU1TOFlDLys0?=
 =?utf-8?B?cUI0NVdLeE5lcFlvMUJHajVHNzBIRE5nOCtub1NDNm1RTXBZeW5ScHo1TjNH?=
 =?utf-8?B?djM0R1ZpblVMeUdDUm85a0c3NW1CTnRtcjlnYWRMVjNHWFhRL0pDSjBKNlNi?=
 =?utf-8?B?T3FUS3FzUndjZlBrejJNY1FDcGJMbUNmODRVUHVTb1JBVzBkV1oyZWZpQWRV?=
 =?utf-8?B?WENDNlpQbXBFRDI1NnZRRzljOE1hdjd3V2xHNkV4aWhQTC9sMForYXBpUTBV?=
 =?utf-8?B?OURxbmNtUThEbTRsNDY3TG43Vjc0ZWpPb09WaEVpeDFnQU85T0RIUTZZTHI2?=
 =?utf-8?B?NEJNbDBneHJ6dlRsL1ZjdGNrMnZZeThqOE13WmJFWkVrdzY2akkzTFJ0ZFNN?=
 =?utf-8?B?RnpETU5sK2NxTnNZcFpKYkZwR1l2NFArTzFmQT09?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 11:36:22.2121 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2c8f13-eab2-4e2b-4625-08ddfc27c0a6
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB2894
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

Move the samsung_dsim_init and so samsung_dsim_enable_clock to
samsung_dsim_atomic_enable.

The base clocks may not be ready when pre_enable is called.

commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
and post-disable") points out that pre_enable hook definition says that
"The display pipe (i.e. clocks and timing signals) feeding this bridge
will not yet be running when this callback is called".

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index b5dd71f6a99057d98cf15090f6081d0460836ec5..53ce3228586ac0f6abfa252b7c15d9eba459c96c 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1460,6 +1460,14 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
+}
+
+static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
+				       struct drm_atomic_state *state)
+{
+	pr_debug("%s called from %pS\n", __func__, __builtin_return_address(0));
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
+	int ret;
 
 	/*
 	 * For Exynos-DSIM the downstream bridge, or panel are expecting
@@ -1470,12 +1478,6 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
 		if (ret)
 			return;
 	}
-}
-
-static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
-				       struct drm_atomic_state *state)
-{
-	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
 	samsung_dsim_set_display_mode(dsi);
 	samsung_dsim_set_display_enable(dsi, true);

-- 
2.43.0

