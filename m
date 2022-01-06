Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF06486088
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 07:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4370D112511;
	Thu,  6 Jan 2022 06:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2111.outbound.protection.outlook.com [40.107.244.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B083C112510
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 06:19:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W00nkLV1ahbROBY4hnTzTiDFOJD4n8qnAAiyYAMpZ/yGF7X9LtSg5zdguoAzBzJEd2/1g1ahq+cS+mo/XDqR61Tw5MnV9zPKdf3KuvV+EPAh40LUg3LlpwItnxyx+yNymdM2K1tIVzPXMWdQSdgziWmIMWmR3WsR62x+QYTNXivz8So3B9Byp9KWueP7UuvWnquZ+jEIGskwsbSD88jGsObtgRFv/pxLKduvDMk0BE8e/LoNMRFcJFFkfrD7Q1giTg5LyTm8Ib303Vz7jexpmQu/RDBR/KYYxxYaRiMQqhUJ05nPUYw9TXXnzBFpted9VPEud/91doQqIQRU7tDfFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1GAARlUuPkNx/DaETZaTWe9OF82JSrEHT4thKMWguY=;
 b=k8W8XD3EBpLnCnCfqpzBEdEPu6AtoLiq1W6akuLAqkDoiSVOVFfOSkCPFma9MGKc17m0Zjqi9M5u1aNlEMEY8KRfhVk/+gwA1vmbocblXNtvF7HbbVJRVwHG45mqSfNleX5vkZI0Hu0bNGEewF7usYXpHFfR1m6dfZh4mWqxTRCBVer8JF8jRlVjr5mxmOVINUoj9tQRqMJ+xwzRZKvHjcVkq/H/ICafyxHi3k3L4e7Vq1xBt5tItXVLGxfQOfOqbVgAHX8ld1SFDJ1n4o9qkWYDSL4Y94YSRNtj9+1HS/ASm3BKrJne9+6iAUpWWFmr4nkIplT1rcu8k1drAn3BqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1GAARlUuPkNx/DaETZaTWe9OF82JSrEHT4thKMWguY=;
 b=cU1VFELcZgRPrKl5sYCoxcO00F/DjHRIsX6cEozJBG7w8EOnJQamX6BJ0SyFoxFk8F5/K3ViEWe72Z99elyvX/mP6zSVevel/79fhb4ZCPftP8rnk3ejBzm2s1kl+kiaszdzRlp2ayBRopgon4DaU4DQuBti0Ns1KUf/S29pjJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5269.namprd04.prod.outlook.com (2603:10b6:a03:cb::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 06:18:59 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c25:c736:478a:b108]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c25:c736:478a:b108%3]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 06:18:58 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/3] drm/bridge: anx7625: Add bridge helper atomic
 conversion
Date: Thu,  6 Jan 2022 14:16:28 +0800
Message-Id: <20220106061630.1752762-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e486e0b-810d-422b-d44c-08d9d0dc6c9b
X-MS-TrafficTypeDiagnostic: BYAPR04MB5269:EE_
X-Microsoft-Antispam-PRVS: <BYAPR04MB52698C95FF71539AE3955FAAC74C9@BYAPR04MB5269.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /pDY2gxnPGXTzoqMv4EizlmWMOGPk+CYGXLuzzjxHSj70kYphhOyPme0YwbMQR2HjY3may0ddQxfuMu3lnyYX1NXHQLJ7DaFFB6eL6Bz4gozLjVAgvENw8lTBFY9fev6KULfH3my1lIidDMyoAsV9g2H0TCcsILjEertXODnjia394KimDlu7j5FHPv+dkUCONIDOAP0pwbNY+dExOkmg08KSmM4s/n/AmyqqEmatO3ww0nW4MPqTAznjJXqNxVpTopfOM98NkFk7THSQoxyOJbxXK4O4f1ScbvKbdHTHWQuJQ55h0oxchtsNJgAb1ol9ElD/LuEGlqFvkYNfSpu0SS0NnobPrnPSTAnW4xYK3YxpBwwmYrO5oKz62W2J43HN6d16yqgd5UzKv590ageHqSf5DJ8RkmV5jPgQa+uEHLaDZo7o+stGSSAnPXkVPSOuukKQ5LPa2D5N+SzURp9Qtla6G8AkKpy1R8p57ak063ERNb0Os2tcYp3i+8h9nOSa5XzFhA7+ibPFwwTkQpXPHGijJzIbeSTlPRffSSUx8NfQ6toEYS0z2ypTAesAs2MXslm0/5S0cl2NHMC/dFJCYFUv03nyxb/dRkVBx3g6bUo4CfeHzz+bP7uxqsPJqceOG00dp7xHkdPB9SX10pEYo9HiaJpz6j5qyefQW014fEb86Zh0/xI7MJZR10X65sSDfqvacEH2GSk/kA1fT1E8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(110136005)(38350700002)(36756003)(38100700002)(55236004)(83380400001)(26005)(508600001)(5660300002)(186003)(6666004)(52116002)(316002)(2906002)(1076003)(6512007)(2616005)(6506007)(4326008)(8676002)(86362001)(66556008)(7416002)(6486002)(66946007)(66476007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dpapbt774crCPun6FhnFWBYkYJmbM/WaA0sWGbI7Wvgtatlo0VOIH3qo+R2d?=
 =?us-ascii?Q?fI5VkMoAgA2IFOvRFPtWQw/F9/nnABvN9eXe1z3Tzt+cZyV1fY2bianTaHZr?=
 =?us-ascii?Q?hFGUeBrEW3HAMK4cbFkgWAhAh/GbDZS533znv8iM6nMPnvFE/gGWavGJD9S1?=
 =?us-ascii?Q?iIVp17fn+weQUcF32dAiYoLTueGH5CQ8JpCT7Gpq/U1QiN8g3PyPS/2KDDUr?=
 =?us-ascii?Q?/d4RULyvY/qaqKyGK/rKjSlxkA7Y/ZXQS1PDntY5+5NI5GYuQhZU38tj3tNo?=
 =?us-ascii?Q?dT+AxZwL+cj4HGfSWDkNVktsCBkeknt3RnrRS6PfS+1rkTu+okwHyP/cvloX?=
 =?us-ascii?Q?cI3OOWfwK+A19JZA4sq9zFLi4Q3FO7qzYLyE7Ds7HWEeaHSpGpYfilBfsoel?=
 =?us-ascii?Q?bqEOVzk8dXLbzIu3ohdb5OSa4RriToUmj2e2hLqonGObnX9Ih5lZk0z8zQPm?=
 =?us-ascii?Q?+rvtAaSclQkze8MZci6zUb0nIYKd37TdY/Lkv+h0XAJHazQDHTEzU8uPMZ+c?=
 =?us-ascii?Q?HIY+aY0LsIkDPX/mhfNJR4Vuhtu63DqtbxdTFBzmVSwVRyYktlmYRmD5A7s5?=
 =?us-ascii?Q?QTMjaXETJxQxc90Z4Zh8AS0jhSswrV4YLH06PVev1LlwjFe098CtkTbt1Xck?=
 =?us-ascii?Q?fCIRpeXVZwO6Y9kmikSG3ZbeNtfwSWeGYDKJPAXzOCTaB1+bBj1vmZcNHero?=
 =?us-ascii?Q?kle2xJZSy92byJq0q43t60R5i+urDn/1jDsx8SBY/28dJot7TtURJiGs4gzL?=
 =?us-ascii?Q?5GXaQdMDr/KZQaa0plI4n5RVBCUiHoAZ7cy44babp4+N4xbWfULqBJdXhGHs?=
 =?us-ascii?Q?ciJPCLEkJxDibpWHlvFF2iA4BooB6rCYAax4f8jHR6ou48CElp4zJTxFCmml?=
 =?us-ascii?Q?6WW1jvvN9xUoJkF5icIffRmQMCeOpZ3gQkI4b2L0g8PWUK695WRpnrgMlpE8?=
 =?us-ascii?Q?itrCBAq7f0i2wNNzRRGUmNEU0lYVl6SMZBwZAhhZ9JQVhhoiF2yp0I8FcmaI?=
 =?us-ascii?Q?gfKu7w3PzcM0F89zZVvqdY6Qqa8RUIzS2O9J1vftJNRvZPikd1xYekGDrsPo?=
 =?us-ascii?Q?JL8DDXOtYh4THYYVLGGXTTEnf33a6W0tWZNV9osQ3Bz4Grvs7C5vurjeyDYY?=
 =?us-ascii?Q?VV4cgZneB6uWfDg2yTirL/H77O4ynFzufRGTouT7YnhOZ2TR8w/N+3Z+JVkZ?=
 =?us-ascii?Q?brNt8vfy4tO8mzHHowuBBHOXmmjhM5wDuP7FPYHfGmyKyTKVKtLI86oiWJTL?=
 =?us-ascii?Q?Zi8MCfIfI2j6FFh5+nW7hnF5uNyliZncH0MpjO2MBF8NEEYQ7eMd3qyAMW60?=
 =?us-ascii?Q?Cx69x3lhxHuB88PQ1j2yZ3YlnoiGKU63VLn4mzl5Qn+p1Yc6fz2ubxvVCTVs?=
 =?us-ascii?Q?PfmtWse3BMQUlRdNZ8xvJE3fjQIXbszT8N3KTm7W+pMB5Jj9iQmVm+1A8YDT?=
 =?us-ascii?Q?mlr/C8evktgJXrtXi2FoZTU4XJdVsuiMGBTfL8R+xzJz2m6UyfykbHMBPreU?=
 =?us-ascii?Q?UfkgYcVDDjJAxLc/hnC0mUTKlMzPoK4tOVgahzQhr+4YmnmD1kW6kl+0v5z8?=
 =?us-ascii?Q?hjV6pvaGdoXGbwPyO0zdjacu2+R3E14FTKQY1MM116zZZqmX3BCVcHZQjOD1?=
 =?us-ascii?Q?5deTw6yPyK92i6ei0VDiHf8=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e486e0b-810d-422b-d44c-08d9d0dc6c9b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 06:18:58.6294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBDdGQccPKE2py0cacYba+NaYA8BSQUX2+sGvDDBAnrgZ7qdupqgEQKEx0ogqf+PiWHJQcMwbt92aUxXQ6jjBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5269
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

