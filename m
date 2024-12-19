Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4511E9F751A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 08:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9712110E291;
	Thu, 19 Dec 2024 07:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="EdNBMYOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2096.outbound.protection.outlook.com [40.107.220.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDB910E291
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 07:04:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riANPBX/Yy7Lq+qQlwETVinzxy+S0+8sI/G8pGfaFNi4kB9vhMYgv7hkBnKIQZsHMgIUg8xwLb8kEEpSpYxhfLECCi9GgDClA7Z4hK0YU7E1qR7elVpS+bSWfZmELt0WdMqo1ZPcz0e5h21qCXBayiL8S/X301rUm/hBfj1HoXRZ/cp61fwar/lLQK60iDAbyGbUq5dzL+fIda7QtVhjcQ1nNGCTt1ixJhZWA6NwU/qbUpuvZyFU6veRuzTW3kxVWjQl7tteCEx5Akros1SA16bT45p9F+n4vbCSrWOq8u7VOlttu4CZdxoEpO/aRAEMI5KE8FP1/2RZNsrC7RKyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvjRnEqJ/kF8f7j1PaLaYaglQW1XtKw/m8aouhFTsXI=;
 b=cVumTbYK8fZHM8hiQNjaRQoVUqijv04cK4yJgncN97zV1wSoCzyt0qHqU5RBo11xjq+iNxx+tPsyCARWp8JeyBhBQqbWYqclA2YcgL6Q3HTFKdIJP8F9ZMhUayeefvzWwq/3ogb+trYkdt97/b1h/qAZ9o3n101D+ccFumHgJ830EmbqmIp0o9kh8zvWLd2feA78PdaPeL5Y1uUPLs1RxVVShLopdecRvABHRje6Rf1JyWHblvBvSJyUpRXlNZvm8qsTwKyyRJTUFWgLVcfrAHzm6cqGrywdD2tLWibAK9E6plB8q1+eGkYwC108qhtdWokKnEC2agKRXpmD55XwDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvjRnEqJ/kF8f7j1PaLaYaglQW1XtKw/m8aouhFTsXI=;
 b=EdNBMYOHaBRPjRon4elFQWX9L+iaMv/I0SGV8u3K9Hbo9m4UJ+xCKNBOzDvhxgXNBQs76e8sWOxiPKGgpUqyo2w19xCBO5iUU6rGX1iyt/UymDGybpnbbxyHjc7bpTusTqKfUsZKa4U3RIUao0et53lH49B9zJrWqdJENmyCE5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by CH4PR04MB9315.namprd04.prod.outlook.com (2603:10b6:610:23c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 07:04:11 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%7]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 07:04:11 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: bliang@analogixsemi.com, qwen@analogixsemi.com, treapking@chromium.org,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4] drm/bridge:anx7625: Update HDCP content status
Date: Thu, 19 Dec 2024 15:03:29 +0800
Message-Id: <20241219070330.224996-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::17) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR04MB6739:EE_|CH4PR04MB9315:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dfb98e3-ad25-4799-949e-08dd1ffb56fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CzDGyz8hir61rt7ssPLJfl993ldBN6+OYtGKNyNRi+AD3CsEVTDm11nyWadq?=
 =?us-ascii?Q?J2HWTU1Y9K49IGu0eM9M8Iex1KJkfQEICMcqTr7IRgIhpK0xn2b6waz9k8Tb?=
 =?us-ascii?Q?dPi4Cs+yz51IfEd88txSitGTSTNG/4/21OnquAHRlCxYs0o0Xs9IO+BhRG4c?=
 =?us-ascii?Q?PkQ7UZ65YHMHit8gtrPm1XV0FnwqIt2uQ4T4F/fm/raAv34z+ZfUdjoO1GD/?=
 =?us-ascii?Q?B5Yw2u575phFT+tsOgwQH4gBX54LloSOYm7fdwuCZwUrWsOREPccs6Mr/sjP?=
 =?us-ascii?Q?LSMJOLm2bfHQrKJet9vXDEjpZyx9D3SJYGl1q6+N2VXtj6FkT1QJnneHly0Y?=
 =?us-ascii?Q?7smrsMmDkBWdjx6/uUYFTOEc/XzlnOEcyzTBTGi94/bMMl0P1SppXJ/1jjg/?=
 =?us-ascii?Q?3aWT4xh+FtGk49BzHhHoPC5B+VzLmr7EPmNFtMHZEEQZjs6XYZG/IeklZjm/?=
 =?us-ascii?Q?3DHpDp0OyziN8/QXUOm6tLrQvfmXzsxhTmO8LnDN3JRHPEzfYv63bIAMTSrJ?=
 =?us-ascii?Q?XzhL25KC3er19UP8VyyQxVGg6IatVdIK+dkxdx5iq2jqchigp08LXovhnRON?=
 =?us-ascii?Q?oMCGwXTZtpve1dYllfmCAoZ5CTN9A0dZt/oxPF7F5R4jmAYRWZr4mrsNVKhq?=
 =?us-ascii?Q?cfgPPKV04yoiZE04BG8xhlOatGKXhALPPfqilNjrauCalew4k913Y7a1h1Xr?=
 =?us-ascii?Q?Q+TVPK52HAv2TkXjVnQNQu+iWPsaPaHc6iSRjOSm4ovPyBjoOxpA+QVMY1DB?=
 =?us-ascii?Q?k2/MZEtxsG2TI1eF3xf3vw5r+28TMwvgfqvisgqCvy3ilL3CY7aVHUzfJHpP?=
 =?us-ascii?Q?yVIfdFkfhcacvVJH0vhRwgcvbl9ef/DjK4wx/YEJ8GRm7yAQ7doRa5Mp4t7O?=
 =?us-ascii?Q?okPKYbaIwAH6huyTRKxY2O7rABD6rKwoHs4dwpskefKwZ1yi1q6EPCYvh3+x?=
 =?us-ascii?Q?Y7tWcS8c2xM3ttyKzWL8godhUhl123IBs1tU+8AflHZTykvXZAok7JhjMIMP?=
 =?us-ascii?Q?afzkH9MD5ZWGBrw8vPPagMCzVBhvZ6lMbb/ARTBODbBpwOWajuLuFX4RUQES?=
 =?us-ascii?Q?QYSZ0bRRgCPRaZpdsqIjaoBM6y9dzhucZnV7oXLxjyqtRdoM00HZ8MCnzWfq?=
 =?us-ascii?Q?J8sL/kI0G82M29CRjttpm1mLYir+u5tV2z96W2UMpfiabnLFw1KgvT9iJJCd?=
 =?us-ascii?Q?eGUMOjqC7RNk04eqRwA+XVgp70Qx4MXIcSh8QzfyopT+TNTw2RcmNPiWxOuU?=
 =?us-ascii?Q?4o4mvLfpBlOso3uBWinvwdwn/uCHm9f3MqlhuZ64gxxMEpgLO5T4NFL38s4t?=
 =?us-ascii?Q?hdqC/EXImJFCdNCukCllEPibbSd5kiuSgyhqwINmqRBDiHv1WPFs20HkGCmz?=
 =?us-ascii?Q?nKT02qTV/lw79sZPy7X6aHG0RA1/OqZpr73UQoLL8Bzx7VAlF5VvviAFOEp3?=
 =?us-ascii?Q?2ZWzaeaUNPThLyrH4ygYDBk+o/BQ8NeqjlFABBWjOytS3kAyxkUdFQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EHgRIBqDAQz+5WnvRRbR6TDAgFfvHg+6pkY4C/0oTgYpH58lTfEl4E5Aq9je?=
 =?us-ascii?Q?TiOmi0GHAEG2P97GvsfXZaEk6cifxKGBhb/oDvCM/m9imm3nN/CGFnv6ulXG?=
 =?us-ascii?Q?WzJu4RtCs6t0C6mV3Xe/ZspFrc6zkoLdicDcSPEk25+oXq3wWD7xDES97dQI?=
 =?us-ascii?Q?g19x8brbfJ/VYbOrfjZR3YRpOanqNwWvUj3aoxkYJziyxHQUFJcyvPkXg1PD?=
 =?us-ascii?Q?grECLklaft5Lpz+Xx7u0u1obmnvMYALHLJceuOWNsDaBy4VraER285LzPRZ1?=
 =?us-ascii?Q?GbSd3MWz07Rf1bNZmaa7L/e7RBmkCp7pHcu76csG8gN117n72e9LhU+Ra5Qo?=
 =?us-ascii?Q?IMBZ5caUusSKm0a8DC4Mbu3dkqpsx/UJFkzqPSoZW5n+qowGuwnzsWMixY1j?=
 =?us-ascii?Q?tOFtXmAONbfgBmc/yaL0eJsa48uRSoKSiqZgz78DurYghYvI7E1fZDUQjzAM?=
 =?us-ascii?Q?rFBjDhugUdNpLcBHBf6XZOfFYVKX40q5cYmAXBo+Ewk3cDCS2LvDLyt32nyj?=
 =?us-ascii?Q?f1wvLCUROAiHBZpLkxlya8yXpZknChLREpuok3Tc2eDm6ydV2lTQtt9s/IBM?=
 =?us-ascii?Q?OkyoQjZwioZevFuKjgpUaz2Y0cotL6p3F1Jkn5jhmfpgK/CjnR9rLKKqN8Hu?=
 =?us-ascii?Q?FyfsbYID2mILxz1Q91blnMxj7eg1efXYJBJAjpQG3/7il6RhrnLj8JRo13DD?=
 =?us-ascii?Q?P+lDxqOfS9LRq0ke9Gm0KHXYy8Hj96dvXWGsS87R+j0yZozyOd5h5Go6bMnr?=
 =?us-ascii?Q?qRAa8u0CUJbwNTOmJ3epOlNmwqatoFGZnfpcH5gTW53tzd7ML2GE+osoQTdr?=
 =?us-ascii?Q?bKOB3JoHHgygkXu/HM6X9kmVBG/pn6+a/5e7elK0YBC53+VrjFhP5mcFydi4?=
 =?us-ascii?Q?MkNQiWYv5mFj7SxF0tlll8ukT7hkeHnDIp16MOvZghuO4wRXnGZ6H1TnN+au?=
 =?us-ascii?Q?zJb4fPRfErhhOL0w2xvQhZAMjz9yRFY3n7V/6NTcXexo+cy8K9IenS72Oyao?=
 =?us-ascii?Q?F8fcygmUHD2TIaO0P89Vqc1IcBBUYMkVhPvEPIW56QQpE/thPFSOPa2jzc1t?=
 =?us-ascii?Q?BaIsjvM+7/c7VGh7GWT+pJULPigpb3kusB66KFFT3GLNy8geNg1Pe/FtzlB2?=
 =?us-ascii?Q?7WGlRdardYkag7wSUNTBMPCztyc8zd0dwskx4uXt5DQEEgh4tB29HXXXSulM?=
 =?us-ascii?Q?xV/vSKmpIDsdrC2+BqVq4Bv5u/iWKjuZEumIhjWeSvbyTp/Ne6Xlrk+5AGHf?=
 =?us-ascii?Q?eiuZfImWK50dgOLzeszlRYwW2/ukdZ/sXk2cvRpprVQ7JrDHmN3x8vUnUIVU?=
 =?us-ascii?Q?NrbaYLE2B8xpnv8kwaJPLDGL8adV9aIUI8U58LdQj3esGCafyAS4sj9qTRhc?=
 =?us-ascii?Q?jDYTJmYSCwn4Qa1HoD+wS1IjV2IuOx7jNjMBl8OEhpS977xjDUCfhctN+0BO?=
 =?us-ascii?Q?KMbJIGCFF3cSD92z7+6bYW3e/AWVASpG6HamYzp5qFDpHouU7fz1+dFaG9To?=
 =?us-ascii?Q?8CMX8kuTtA6TIWpT5JVbxxvTN2D8UoEt+DMvBZf10M5F3m6dTJyVPfkrjZij?=
 =?us-ascii?Q?wybnap0vgscKGMYlEHpOguHBzr+RLTHChyDJs5NN?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfb98e3-ad25-4799-949e-08dd1ffb56fd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 07:04:11.4626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8+7JXUf2UDfscnJ930Ota0WHxCUg1Yqi7F80KT9MJbDAxsvw6eDedrc+D2Py/pOiidHrKjIJncL3Amz9UTeLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR04MB9315
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

When user enabled HDCP feature, userspace will set HDCP content
to DRM_MODE_CONTENT_PROTECTION_DESIRED. Next, anx7625 will update
HDCP content to DRM_MODE_CONTENT_PROTECTION_ENABLED if down stream
support HDCP feature.

As anx7625 bridge IC will be power down after call .atomic_disable(),
then all HDCP status will be lost on chip. So we should reestablish
HDCP again in .atomic_enable(), and update hdcp content to DESIRE if
current HDCP content is ENABLE in .atomic_disable().

v4:
 - Change HDCP content value to DESIRED if HDCP status is ENABLE in bridge
interface .atomic_enable().

v3:
 - Move hdcp content value checking from bridge interface
.atomic_check() to .atomic_enable()

v2:
 - Add more details in commit message

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 73 +++++++++--------------
 1 file changed, 29 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a2675b121fe4..1871262d5a97 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2137,49 +2137,6 @@ static void hdcp_check_work_func(struct work_struct *work)
 	drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
 }
 
-static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
-					  struct drm_connector_state *state)
-{
-	struct device *dev = ctx->dev;
-	int cp;
-
-	dev_dbg(dev, "hdcp state check\n");
-	cp = state->content_protection;
-
-	if (cp == ctx->hdcp_cp)
-		return 0;
-
-	if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
-		if (ctx->dp_en) {
-			dev_dbg(dev, "enable HDCP\n");
-			anx7625_hdcp_enable(ctx);
-
-			queue_delayed_work(ctx->hdcp_workqueue,
-					   &ctx->hdcp_work,
-					   msecs_to_jiffies(2000));
-		}
-	}
-
-	if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-		if (ctx->hdcp_cp != DRM_MODE_CONTENT_PROTECTION_ENABLED) {
-			dev_err(dev, "current CP is not ENABLED\n");
-			return -EINVAL;
-		}
-		anx7625_hdcp_disable(ctx);
-		ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
-		drm_hdcp_update_content_protection(ctx->connector,
-						   ctx->hdcp_cp);
-		dev_dbg(dev, "update CP to UNDESIRE\n");
-	}
-
-	if (cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
-		dev_err(dev, "Userspace illegal set to PROTECTION ENABLE\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int anx7625_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
@@ -2416,7 +2373,7 @@ static int anx7625_bridge_atomic_check(struct drm_bridge *bridge,
 	anx7625_bridge_mode_fixup(bridge, &crtc_state->mode,
 				  &crtc_state->adjusted_mode);
 
-	return anx7625_connector_atomic_check(ctx, conn_state);
+	return 0;
 }
 
 static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
@@ -2425,6 +2382,7 @@ static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = ctx->dev;
 	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
 
 	dev_dbg(dev, "drm atomic enable\n");
 
@@ -2439,6 +2397,22 @@ static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
 	_anx7625_hpd_polling(ctx, 5000 * 100);
 
 	anx7625_dp_start(ctx);
+
+	conn_state = drm_atomic_get_new_connector_state(state->base.state, connector);
+
+	if (WARN_ON(!conn_state))
+		return;
+
+	if (conn_state->content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
+		if (ctx->dp_en) {
+			dev_dbg(dev, "enable HDCP\n");
+			anx7625_hdcp_enable(ctx);
+
+			queue_delayed_work(ctx->hdcp_workqueue,
+					   &ctx->hdcp_work,
+					   msecs_to_jiffies(2000));
+		}
+	}
 }
 
 static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -2449,6 +2423,17 @@ static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dev_dbg(dev, "drm atomic disable\n");
 
+	flush_workqueue(ctx->hdcp_workqueue);
+
+	if (ctx->connector &&
+	    ctx->hdcp_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
+		anx7625_hdcp_disable(ctx);
+		ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		drm_hdcp_update_content_protection(ctx->connector,
+						   ctx->hdcp_cp);
+		dev_dbg(dev, "update CP to DESIRE\n");
+	}
+
 	ctx->connector = NULL;
 	anx7625_dp_stop(ctx);
 
-- 
2.25.1

