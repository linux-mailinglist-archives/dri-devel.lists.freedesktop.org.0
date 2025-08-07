Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09701B1D817
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 14:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0513510E833;
	Thu,  7 Aug 2025 12:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Pckk4d0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013011.outbound.protection.outlook.com
 [40.107.44.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DD010E833
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 12:39:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usuhxz0g2yawPUiC7egqGzKCaEw1nTm20y6ixc9oRjBC8IKqDQb33F7aLYZr6i0qmtjG+6ARyfCYsA/CMlTk/ZXGgcfX5ts25GJ+b30QOTZoO5xZ6HWS2C1g7RHwA1/TolPaueNfTEgrrm7y/e4jkvxvcWpH8CYqKiy5c1NlufTFWwbKeeR5DRMktPka4yGx02TcepLFtNhd95zRyLcfM3sSVir89fr0caVA4J66P79eBHyS8BcFdTukCsZSkDe85WquhopFMigRh4UleKBTclCMn5i2wi/sA0rzONhDDpQYJTyVywulGWV8q3rojLhfzyInuI+texNjjjB9L3eXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uas5N4eV7hS8/EtB1rsbgE3e7Q4LkRPQMv3Dx5iABnA=;
 b=GsbOJ9tSvmjPJJCUQ2LPFhUZQvKn9UEvbnGmiYsiRgLAOiAlqZ3+WCtjs9l2YczaXAQ5Lsk5m8LTdrIE5St3OZ/Qe1yfHCnrIQAKIRRpTAoJDe3MIv3M3R1ubISHSwR9teCVtKNknt313e6Ma0/kLjn0EH6nSskw2iD5FcU/X5aIUzs35pw4756vdYbpnPqxz+g05PlmP4/zSaizDeV5DCaf0yiYWNgQ8ZUOGr17DiKXnLibjlQ5h3RzwSiek7aAua0OmFXdP4kofEzYrmdm+H2cXl2XMXWnTw1qYcF4E9Ca52rtrPx+wv0Mr6TcwMQPaVze9YkuNc/rRiUJVUR06g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uas5N4eV7hS8/EtB1rsbgE3e7Q4LkRPQMv3Dx5iABnA=;
 b=Pckk4d0t9gG0O66FNXo7+JYqqiZlsJ1Ot+w/qkfp8uFI8I+wWUSVUIakx85tS2Vnyr6P5G9hklclFfB8O7IXzrCvGjJPH5WdmbY4blK/QpwM8nHqS0prKHl9iCiEV2OqP9kJ+eV0QEg93wQC7NYqCysahsZtdFZpTtjrlc8ITivH1LRbKpV0WP9NJCyqfg62oqBp+8g38iSOHkFP3ifU4I1XGiw6rT5TzKi1l8fVczkXrRuq1X0e6G/OfvBKbk9Fc3lIctxpmXwM/DHCLNsaRcNlRhwarykrCa3ax7ReFWw/erl06Pn02Fo7VxNmyYCcPX7hBNfSiGJ0LQyvGgyXDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEZPR06MB5574.apcprd06.prod.outlook.com (2603:1096:101:cb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 12:39:30 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 12:39:30 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] drm/bridge: Remove unnecessary memset
Date: Thu,  7 Aug 2025 20:38:33 +0800
Message-Id: <20250807123836.494696-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0174.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::13) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEZPR06MB5574:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3d6cf0-686b-4f3d-8166-08ddd5af7446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JjfKkk3lOx1/Dd+lM1Mfc1wJ8NDKjeQIlgzinJwc+Df4Jc3cFQ1BJhims5T2?=
 =?us-ascii?Q?StUuVcilCI/r3fFpRlrHIIN3YPxmzoO5fMaIV9dCZXqTKlYZL8KM7WOinNKS?=
 =?us-ascii?Q?5vLqMjGAniWTo4KrQZMz68ufj7L1XfTgwikpJyHLETCSwyGJ7xKzi+w0nszj?=
 =?us-ascii?Q?7Vg5T4EmL66ENhlirQ3xYTuS0d+R9pQxLkAT7IPMnFz+PkqniUGE0M3XyhNP?=
 =?us-ascii?Q?cXAIsv/V217Enr0Y83lMGJJSjMbhiG4+USmf7SshaHYcdBVNq4fHZxUQFD5K?=
 =?us-ascii?Q?rIN2ue+vV/MeJlpt+cxPFZsMOi6jYZNThqDTMHGGWyZn/LOC7XdH2QjqHRIs?=
 =?us-ascii?Q?oXiSkLZRYF3gHV3f3ehzDRpQYSqz8LOmgh/2x4UubUtjNUQnfW6oNYAcSzF4?=
 =?us-ascii?Q?kuJUSE5jJGkTM431UK8awbwad57OR+JNN/8ziI+JWqIBq5cVkp1lGT4JDuK7?=
 =?us-ascii?Q?FWVlr7qs4gIFdYb7HH3ovwm99tGuDgyNFBGJk4y3NnHYBihPA9f1eQt8hdx6?=
 =?us-ascii?Q?fmYx6QS42XoYgpKIynztIx+s/AaxYzIvjLV3OnjE2l6U4x4hN7IIgd/xsgqw?=
 =?us-ascii?Q?nPqbZgM8HNcp/ddDmKGD7a7EoF5ADbQVc9PG70iS3jk56ebSgEXH7yvfdVgB?=
 =?us-ascii?Q?83I1pIdz7sPijmpEncFxxeBju/o02hDZXaMDrNvf/UrnAqwu2RCuJyCU+fal?=
 =?us-ascii?Q?o3kYD0IF46qafgWichdFrtSTEQnJ9RfuPl/6qiXQbd0NNvEYcV+0tgUxE4cI?=
 =?us-ascii?Q?WlsDqAR8CLm+7stqlOp7zNaya5nDZtqVrVURtOsD+CrVsd3vi95MI0gdEVBr?=
 =?us-ascii?Q?7gFHQY0q3rgrE20wT6C0v5d1bRJtHPdcRgfcxPXw+AXfVT1Yj6jrEerhTc7O?=
 =?us-ascii?Q?e/xxwGH/SBg3Z96GmSHsYL2opXn+t1PajlccC3zdzKdcf9UPjaiNS9YfsFN/?=
 =?us-ascii?Q?R/WZ7ml44X0djSKRVG+TmQkGbZ+dbgGSRVU2bcbRagkFaGNSG973DDVep1HQ?=
 =?us-ascii?Q?QmhYpHISTyxHlacK25rGJUreXZ4zn1N4y3F5rv6e4pwZaXklGldqJJE++c7K?=
 =?us-ascii?Q?oF3A1XtnZBbRWUxawAxBLIg262Ys7PYMHBLI2GP4liAGHxiCIqiPEifNvvVc?=
 =?us-ascii?Q?rczlWKwouj29gIQWiUGbwahGrXFRtOwPO8X/EFtC8ENKFgA/fx+3kg5EoG1h?=
 =?us-ascii?Q?0pFD08dM8FlI6hdljveyaI8r90gpzVd/qxUKfvPLFl35H9K5ed1BGVEJ0IiL?=
 =?us-ascii?Q?bFTXxxd8gQUqKAMycmCmRltBiYj2KqV9cP9xhqjCb86b9crraJXLemstW/0w?=
 =?us-ascii?Q?1k2nzyIdujCNY4gRe+0/eVEeUY81UnG4mDFNjYbljUokqWkNZglPvHUi3sIW?=
 =?us-ascii?Q?o2AVVIG3THM2Nu2cdlrO4g4ykUaJwuNxcr5HjTKpV1sy6dTn4FOEWECTNQ0E?=
 =?us-ascii?Q?hOhrvCzVi/77hxVAu9GE6LdLV93GZ+nDMnG8DugF/XXKFA99LCl7mlVfxOJB?=
 =?us-ascii?Q?7r22sPh9klLfPj0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4WQhjBdbHPTJojQsPs7Sy9MvhwPYjxgWy3XB5vseDqKBSlmC9T3F+ML7EwNn?=
 =?us-ascii?Q?OxDUy63QJnQztFVytkCSRCULiRUEnLOSRj5qzOM5e+L3XbP2Ra12/XYWsIwQ?=
 =?us-ascii?Q?43/9fOuNl5Vzvee5dtoESiEjRtlfmO6abW3wrlGg1u79Y24hNsKMchjw76D/?=
 =?us-ascii?Q?mSRrk0RlMI4uFA9sjf/jlREN3wF/QaQaWLaawC2FoLtiCkDyNSvOFdNScQ2F?=
 =?us-ascii?Q?71AartauKFHvJZsUSxyg5Gdx+Lo37XZbX5nFdizzrEwPKgbqkaxySEW5BNaw?=
 =?us-ascii?Q?1fzZlEoiPMYzVYnuQr7pAi3MZrr6egdDYxbU6P5PFCo0RJOVNclQINauLHxM?=
 =?us-ascii?Q?DtK4F5JbHAV5EN1mW2BbyEH1XSsawVgzhJfzQP02nxFm+HwNI+d1ODKGPew3?=
 =?us-ascii?Q?dg1nHq9VEN6QIxNHGY8LzU5d6Y8Xg+bjVl9a26SSLY/BclIP+d8ARwV8y6Ws?=
 =?us-ascii?Q?B1PhJX4AfCcc3E083nb9opwwPS82dhWAFOPV8OQAyBeA2NuPk1sIYXs8xXYp?=
 =?us-ascii?Q?utRArMZsxSZ0kf37kLQePzPKFblKIJ9jjj2Fb+2ffSiK+vaxJcU7NlV8pJUa?=
 =?us-ascii?Q?1udiF4pOBXQkI2UxPHVPhPWFRoMRNzmNdz2elVTEQ+YT+zy3fSoUqGpI0LZx?=
 =?us-ascii?Q?FKOLRpD6Rhhi/ZP3xTt8lKbcyXrFQsijkhkeBW1b97iKe9pRJtSeJGQgckhj?=
 =?us-ascii?Q?sbiC9R91/RygE4tDXr/m93I23tzqP3sEkMIbgPpKzjaMeiEjUTm4XUeOZRxX?=
 =?us-ascii?Q?q4QMskx56y7llWXDGD/EV4/Fct8i0mJvKfAvFGtM66HP4p2f0acG5Rurox/r?=
 =?us-ascii?Q?woQpmJaTLMN5tg/gRxcxr/5n0ZauSbuTZ1ELFeTBlDkIFuLjyiJ8aaBwP0c5?=
 =?us-ascii?Q?U1kwXFMMCaDdRNJpLFVHqGKEqjhqwfCNvFbybutj9r0OgH8aA0wk6dJRT6rd?=
 =?us-ascii?Q?N7h4v/s12AncmYWpRqnR4OpYslagNAgMAwoh1eoxh5HhWrzsYP1kDT9SK139?=
 =?us-ascii?Q?QHiCunajz/qWLmXzao2x9luvt6m+tI7Sj+PMBUyfPVVNGmOwigN76PbpSnG7?=
 =?us-ascii?Q?8XRiTf6RvIw45R3FWNq3OmM9SJXgy7tEGWCK36/uJJAJecabLrMeaE3GRVLR?=
 =?us-ascii?Q?BJQKhU6N8NH1aM2ZvHMY2a578W2DxKOgQQ6W6JsXi2NWOrGtknYexAXpTJBt?=
 =?us-ascii?Q?BhhLxsU9goeg7Xnun9FIKn6/PolYmavK42qHRgSlWN6TbhGrXPW5+24Ed+27?=
 =?us-ascii?Q?LJ4qljYHiUA7VO82YA2YeZ4qaT8aquwFju3gdelhTL0VBMPSE4B/JoO/Sdic?=
 =?us-ascii?Q?jM9XSdBaAIDUvn3eNoMSQxFjMVdSCE6UAZYKZ7IUf2YvWqfEZn6fm7UDJK/V?=
 =?us-ascii?Q?X2+ZlLbozoMHU2E42FjObozCbXtdC5z/M7w8/Wv6mcV6RZ9i+zCtlvCKIuZR?=
 =?us-ascii?Q?+FUomNviJylScL8rAO872JLpDCs1WIFaK+TeEXDEwWMVULTMDvXrTTufydeX?=
 =?us-ascii?Q?Ae1IFsbIXFOVrNth5h17LQjGZ0gUyaVn8FXmdv2XjFhQ1/jybPYYpnIz6Qre?=
 =?us-ascii?Q?khy6JPL2GRxVNlIO51UEzMGELIrf51X8FwSWkhuB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3d6cf0-686b-4f3d-8166-08ddd5af7446
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 12:39:30.6206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNTzcLh9H/nlXABOGVfwfl2qN8lKfCVvy4urDVq/W1bQUdCZe86vlrA8tWJLdvIbHaETe9fdSVZq5h2PCh+84g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5574
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

kzalloc() has already been initialized to full 0 space, there is no need to
use memset() to initialize again.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index a57ca8c3bdae..590f7c75744e 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1047,7 +1047,6 @@ cdns_dsi_bridge_atomic_reset(struct drm_bridge *bridge)
 	if (!dsi_state)
 		return NULL;
 
-	memset(dsi_state, 0, sizeof(*dsi_state));
 	dsi_state->base.bridge = bridge;
 
 	return &dsi_state->base;
-- 
2.34.1

