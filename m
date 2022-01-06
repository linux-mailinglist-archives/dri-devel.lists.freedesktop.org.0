Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244D0486299
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 11:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B57A10F02C;
	Thu,  6 Jan 2022 10:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2120.outbound.protection.outlook.com [40.107.223.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CAB10F028
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 10:02:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hf1c35HcObQhlQKFRE0k8C3EWyabPptVDBtbxUjFmlLn8VAl0nDUVpToh4jjxQEvcN6J2Fmc2O33GOyTY7uBUdPNndc6+8DpBgPrybvQ1tp06rLQDOox/bvNsM1hr8kwvxN6+3OvucVwCKq2B4LSOPj3fVF3mvSXAppLgCnf+Kj0O4/nRKi7I+B7u0FBrYSsv/+rVAZdluiW5yECR+KSyN1xOLs55tM7eQ0v5HgqxET5sLbd49c8wI/UEY48gNiwibRD0CVvgU1xFBi0hospwfjpGjHGV6wv/i7tIOXMVZqdONDxO81zACPcq6nX4hEKOiQ/f9xJbsh41GKUqULj3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1GAARlUuPkNx/DaETZaTWe9OF82JSrEHT4thKMWguY=;
 b=LfWzS6eNLfugZ9a/lHqwzI1aaYj3ZMBX3vV9O8t+Ix53Arh/gMnKeUddIgA94YKBQeEYWGfzUWim6Y8AgaGvE2nOJLg+/Jcdxxm5J5pcvrAF0ZmG7Twl6njF5rp9gDpBOZSW1x8upuncim3pk96tdOLs0HxK5LYOK3XgB0OBzrvr5guPL3ntyM6vH9oXbFytVSZKIKnrWECG26+/mwqNorIxv7w/xO0GjRsXtIdl9MGTtcMiRrxADiyuiFTqoVsFTO332C9Xfl4X6jCiHCKR03ONROi7LE0suRoS9SSVK20pv8tXCFgcLCuSolHyErc7swM+ufqxpQHcJA7a4w/hxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1GAARlUuPkNx/DaETZaTWe9OF82JSrEHT4thKMWguY=;
 b=SJ32inKhZrMcZW5n25s/ZOA7vEf49BBFLVTEc+01I35v4JfBeYm+BeYdsn+kxvD59hRqcVoUIwMYO/UzbJbu7LA20ChXepf6PuUlg8RSQ0MfcW2GjVxj8zZXk+Jl3JmVHZj0mQKcaOdm6/kFX38d3uGGCdXFdol+2ZFcyZ1dla0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from CH2PR04MB6741.namprd04.prod.outlook.com (2603:10b6:610:96::19)
 by CH2PR04MB6823.namprd04.prod.outlook.com (2603:10b6:610:90::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 10:02:43 +0000
Received: from CH2PR04MB6741.namprd04.prod.outlook.com
 ([fe80::c4d8:2407:431:aed1]) by CH2PR04MB6741.namprd04.prod.outlook.com
 ([fe80::c4d8:2407:431:aed1%6]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 10:02:43 +0000
From: Xin Ji <xji@analogixsemi.com>
To: andrzej.hajda@intel.com, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 1/3] drm/bridge: anx7625: Add bridge helper atomic
 conversion
Date: Thu,  6 Jan 2022 18:01:24 +0800
Message-Id: <20220106100127.1862702-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:203:d0::14) To CH2PR04MB6741.namprd04.prod.outlook.com
 (2603:10b6:610:96::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5d3f40d-a50e-49eb-dba5-08d9d0fbae6a
X-MS-TrafficTypeDiagnostic: CH2PR04MB6823:EE_
X-Microsoft-Antispam-PRVS: <CH2PR04MB6823133FB53222AC705ECA4DC74C9@CH2PR04MB6823.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mP5c8+ZOBOfel+l6XHsdmKWl1AUIAOZ/bCjJa+33IYE24ZzNpx0ROf9hxkPTbyo0nqt5aBkp15DwL8g2KIvFY57e7hxzZVm/tIRL70mx+iRTS7KYHmTmzt0h+CGu02aSdA8vlTqDIZyfaGrNxKtXZIDBdDktgfnirYuSQIirdIt+jyG5W+NC3t9tGZxFBaldmMwMhS8lGHEYy3tr2xBjzqBkzsFm4MqYfyPiGJuSIfXCahjqtOD2pw6t3Gzlzh0nJhRlO3bwGpw16rbwZ1dVv/s1WMiACzjVLBlv9q55hVPE7la5dpF1rRSLQDLuUOLiYMnIls85x3WtUo3QT7H+y7w+nLxCVxL53NVp4wONiy3Z+fjH3n2cUmcNN8rAzqpkycKTARW4YhFKosB12c8ORZ8308ojj9aMRZsQIA3w/vSIeZfdP/+zjPMdLLcL0YeANFqZvRPrqDLYZEc7moOrCRU7G2ULm1xQV8kdEZF8p9iryzBOqaVXnw62m8ttDqfxSdP3PZdRc0OFLnOIywuSxfh6T8OSPTit1zEWXk3OSen0sUcgrjwMz1Sh9DIT7rtKc13SRJ6yY1S9IDg5UGeu77OyZW3/Ku37gs1Y/29ceMSXMQmjAO8g+937+6BCPSXJIHdq6o1ft2qFWxRJvMwWf911KZ0huw7sbceNn/bI+acGfFJhK2FE8NvRWR9lgVr7wS4+D7tBPykJiPpuKfzHRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6741.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(4326008)(110136005)(316002)(52116002)(508600001)(2616005)(38100700002)(8676002)(6666004)(8936002)(1076003)(6512007)(66946007)(55236004)(36756003)(66476007)(26005)(7416002)(66556008)(38350700002)(186003)(86362001)(5660300002)(2906002)(6506007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k51Qbj2uFiKIMVCtbciJvGdISWAG01g9lY8Jjd1siK3n+fwisNQCkjZLzziW?=
 =?us-ascii?Q?fLKtLC3PS/BJTCqnzxjYDlfO1eS3lpg5ibfPqYk+DtzV5lruxFZmKZMXEZCH?=
 =?us-ascii?Q?W4YVPeggPD/Uz9fW65SxJH+zIS/ys27K1g7yJ5psLV7a3x0IDp4rI9BZDX/b?=
 =?us-ascii?Q?h2DZbmI8XuqOd1ffTe1f6IRMAhBF5LBpQFwJ6CFKffLm1ap5jUU0eFcUSGI9?=
 =?us-ascii?Q?m0Vp+wlcEyQ4BRCY2zRHbHLoPB7ZyKXPIvfE5t9B3rurdlECNtqhaVzmMcJO?=
 =?us-ascii?Q?G+cEAEAGlC6q8BRJkwHELtc9QfVSddAnwHZH+ssB45Aix1LYaPdCm11iTLT6?=
 =?us-ascii?Q?+AWVixUuXevxctSXXngiz/Tz0Tpx8BgJzbIkLZ3JbBzULNnc7EHibDyO9fIL?=
 =?us-ascii?Q?EiIocHs/ObYSwpdlja6wHXGELoB9x62hu4ls+XC9g0OAM29IkRP83Fhy0uTs?=
 =?us-ascii?Q?VyuEhQxMHuStTI8XS5lFX4zhcV/iyRM7cfd0qkoVnsDvh9DYRKcuEVUZZZyW?=
 =?us-ascii?Q?8V/c9BFLRTt7B6or5JumDx2TIAJK0uHoTfD7gHLngbzgXQ+0wrXYIy0YM8/k?=
 =?us-ascii?Q?1ZV4w3vxklp8/thExA71D/loo8qpfdIKmu2282LtVORnWxOfKfxK6llzw3LV?=
 =?us-ascii?Q?Gzyl3ymf7Ji107IK+sxfRf1w8kOEmGEgRSYjsC8eDUjhJl0DyNDyGMHFjYc/?=
 =?us-ascii?Q?oZbe5ZQfqmXnfx76PaaF6BapDpBRJmg1fotg1e2ZD0/PwX2kVHHTywnUyd/s?=
 =?us-ascii?Q?Y9k3PrPmK5GQauAzo2fHDLq6lmEDVzat8HiInGUu9gHjhcc0gCt75fz79312?=
 =?us-ascii?Q?bWKqlK9d8AiqDk5ZzajJfppjSd3uPthUbDCHgFEddyp5kRi3wRewD8YAO6Co?=
 =?us-ascii?Q?M9YnTx0kNQ1mYfges5VnO0Jlv8ctngu8cQ8vNrKkSv+cbljGDZSNCBYVxC9N?=
 =?us-ascii?Q?K6DShX1M88l63M9iEglI04RyiebdtQvbT7i9BwP5io6L/5HHtP00JAUTBCzT?=
 =?us-ascii?Q?zdIJHXO5HZx3wBHGo5Mr9lszGcF/rvBlD5lkeM39TPUGYoe2ckH+Ypgr/au7?=
 =?us-ascii?Q?5CvatB1sVA1J35ZgbOEBhKNjcqQS6rjw8aZ1gZ4d/L1zXHxehERUlTbr5BXu?=
 =?us-ascii?Q?erDF4XliCDC6F3V80FdyyfwE3U0rTDq/z1by6ZCzItXjTKi9RX1dT7H19qWP?=
 =?us-ascii?Q?TG9HaFWwnNpcSAWM2kkwM8XJ2wZfMSDsNgu52GQwcxxuwe0B7MfWWSBwcE03?=
 =?us-ascii?Q?XOHbPCTH8ggmiwsR37hZ2wE+MsQxdS/aXHLB94KluekzBvQZBVYZuz1iT3er?=
 =?us-ascii?Q?6/Ms071IMXGX8u6YaTRTg2CyBmKI3Cs14h7W62vbOX2eXT3j8dtEwSCijuh8?=
 =?us-ascii?Q?meUVpeSbHsH9s9vkixNsknZ3EDvSlWWYx/F1SHJJYfhsC6TI1IJTyNFhlFEi?=
 =?us-ascii?Q?9PmY+tnkE7eVMZ+irWjOwhl8mwQwdCJVfcZR59NKdpzwLWFU//rpFxNZ3zIT?=
 =?us-ascii?Q?+3VYZICY5CTZczyHCjdLG0vLpU8xNWiBf/fYbP1jJxWqHoYjyJJh1iIDN66g?=
 =?us-ascii?Q?c0CJw+MUEVcfy2joOmEJl2Vajeb5CNxYF9hmBfsstqvj+n4mnNkERrkKumNY?=
 =?us-ascii?Q?bk+HQ020YIKOwm4cNAQgWK0=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d3f40d-a50e-49eb-dba5-08d9d0fbae6a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6741.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 10:02:43.5785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1H882d+sFIeHkQseSEbe2TigBeQWLOYaXFxMDRXQ3Qvd80NskKKSGZHeDH1L3Ij4YfFRN8pDTLZ3pvwCk1XJ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6823
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
Cc: qwen@analogixsemi.com, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bridge helper atomic conversion.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 46 +++++++++++++++++++----
 drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 7b24213f7b13..6d5ae52f4142 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1911,25 +1911,54 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 	return true;
 }
 
-static void anx7625_bridge_enable(struct drm_bridge *bridge)
+static int anx7625_bridge_atomic_check(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = &ctx->client->dev;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "drm enable\n");
+	dev_dbg(dev, "drm bridge atomic check\n");
+	return anx7625_bridge_mode_fixup(bridge, &crtc_state->mode,
+					 &crtc_state->adjusted_mode);
+}
+
+static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
+					 struct drm_bridge_state *state)
+{
+	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
+	struct device *dev = &ctx->client->dev;
+	struct drm_connector *connector;
+
+	dev_dbg(dev, "drm atomic enable\n");
+
+	if (!bridge->encoder) {
+		dev_err(dev, "Parent encoder object not found");
+		return;
+	}
+
+	connector = drm_atomic_get_new_connector_for_encoder(state->base.state,
+							     bridge->encoder);
+	if (!connector)
+		return;
+
+	ctx->connector = connector;
 
 	pm_runtime_get_sync(dev);
 
 	anx7625_dp_start(ctx);
 }
 
-static void anx7625_bridge_disable(struct drm_bridge *bridge)
+static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *old)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = &ctx->client->dev;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "drm disable\n");
+	dev_dbg(dev, "drm atomic disable\n");
 
+	ctx->connector = NULL;
 	anx7625_dp_stop(ctx);
 
 	pm_runtime_put_sync(dev);
@@ -1959,11 +1988,14 @@ static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs anx7625_bridge_funcs = {
 	.attach = anx7625_bridge_attach,
-	.disable = anx7625_bridge_disable,
 	.mode_valid = anx7625_bridge_mode_valid,
 	.mode_set = anx7625_bridge_mode_set,
-	.mode_fixup = anx7625_bridge_mode_fixup,
-	.enable = anx7625_bridge_enable,
+	.atomic_check = anx7625_bridge_atomic_check,
+	.atomic_enable = anx7625_bridge_atomic_enable,
+	.atomic_disable = anx7625_bridge_atomic_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.detect = anx7625_bridge_detect,
 	.get_edid = anx7625_bridge_get_edid,
 };
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 3d79b6fb13c8..6f9d5f0e377c 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -407,6 +407,7 @@ struct anx7625_data {
 	u8 display_timing_valid;
 	struct drm_bridge bridge;
 	u8 bridge_attached;
+	struct drm_connector *connector;
 	struct mipi_dsi_device *dsi;
 };
 
-- 
2.25.1

