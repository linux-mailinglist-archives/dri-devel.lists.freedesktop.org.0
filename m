Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5B6B2BBC0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 10:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59E110E210;
	Tue, 19 Aug 2025 08:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="BCAGezD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012060.outbound.protection.outlook.com [40.107.75.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0BD10E210;
 Tue, 19 Aug 2025 08:25:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1GY305evsEVoz4GcnsEEu39uEKriTSr2avboaFuAPw6BCuvDNgkEZHsr4bctDRoSFq42CFWKdEUeRJrg52R8SQZ+O4N1TZD5PYnnwAeZzAkj8rs18kvo4rzakCUNGAu+PX+Y2VZCaE8cX+yS/8li5ekkKFY3FtlfUodnWIR7jFaw3zhW2lntQLxWKAvpHBfEBYCmKRIzrawIYyH+zlPHfKUwDVP6o3bBKQFK+1bsdJn07zviljymZCobT/+6BvxOXFcQc1zAV9LS5VNvCPTunIAmcO1KVNFEVHqPuPtEoz6UkQNw/qoty2qCgzCyPBpS0gH/G0s8+FeG+BZ09jJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSKSdvG+O2n38mstHBMQi8xl7eGuotw6lQL/3rlhg4E=;
 b=Kf0fSRsa3iWK/EmoC0XYWwhTh/D3Vs0+59qYPbXdRGqh+wCxy2fg0cL2ZS/uMP/oTNz2/Jgfvx0bIlfAe4sK6dyrjBAEpO/35QI62Xl1ZO8ojhRUiv5DIgGoUaUYXTHZcSytTtP2TEZhyEVyGNeFLBDRk2Yn1rd7CvUer3ywfToCrzjLnQRD3T0vXRDCeAxnKjUC2pN0VN45kKkpVb8XSY4kFIS+9s3mDlWFlJMlauHZ3rOx9ske9cSD9UrggqFY7sbwF4EaCt16QqFvjVcr7aeSHH5BmRp0KbdC0vP2HN85V95M9pI8fGLzdsEPVK3yv+5kOsQA/+L3bdJgj7QAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSKSdvG+O2n38mstHBMQi8xl7eGuotw6lQL/3rlhg4E=;
 b=BCAGezD9BnjKLkLsjnc8g/u8qbv+csbt+ejciksSbkyzMvAr+hUJLskSQxiH6+0+87rGXA1rdXTM5vz6lVQLKP22v+sT6pVatRpEl5N0wLqGESY0KtmsCKfGTs2uU+8TC77OUtOW3zPVDiBt/KDZRGAF0zwOi0tc+SMGlPBYlhG4sR/AIM5H2/2AMFU77+KRXQK2NwWGHcfxsPsmaLdI+/VSGwSlxGG+nNJHtL7PoJ/hnKx3bkGY5PYlrxj8eF4yOClUBwHD/HlrmJcvFFl0BwhrKKQ51nDP32Vz6wyCFSSA6kgaHZ+6Gx/UIlmzXAQxOl6MvRYteWzQe6DetSeFSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB6955.apcprd06.prod.outlook.com (2603:1096:405:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Tue, 19 Aug
 2025 08:25:34 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 08:25:34 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] drm/amdgpu/fence: Remove redundant 0 value initialization
Date: Tue, 19 Aug 2025 16:25:21 +0800
Message-Id: <20250819082524.526572-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0070.apcprd02.prod.outlook.com
 (2603:1096:404:e2::34) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: 571f3d36-0079-4f2b-c9b3-08dddef9f7dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7MavI4Rm7/EHoFzucVJxKLjsHS5xpRmPc+6gqS5O59StZ6mlqPRq851bzC09?=
 =?us-ascii?Q?+ApuqDt+8ywtBsg3yZtyK01l2VnXi6wKSzQrXZnlKetQaUmliNzcmTC4GlzL?=
 =?us-ascii?Q?G2Oq9IOoftxeOtZhzesAK+sy2WcRLxMAfbIbhMAQHm9bTJCKMlkT8LpN0cHr?=
 =?us-ascii?Q?fgw8a7gYjjN647d6hx4Hqinu/B2lijkMKfi0Lbehz+blSVlTlYGQWUSkUiKt?=
 =?us-ascii?Q?DNpD3jrygrXBEPsI1OhUJbnuH9+3srqXXPP4lu5AExR7FxqDlLsnWerZqWxb?=
 =?us-ascii?Q?46rH8dyN9hfaQCH4CxqVgWa4nvD4zAHF1hkHwoEA+N1wPo2JENx2BPJQ0LvG?=
 =?us-ascii?Q?fa/3T2BmIQDCljl1uvdndMJHFziRCDL/IEv5I21+eB5UQ08pHlILUNlnobZB?=
 =?us-ascii?Q?AbmmJlX4iR3obfOTCIjDv6lg9yDpClW9Otk3tL5TnG8kfvMouO0A3clZBKMA?=
 =?us-ascii?Q?0PuvfvhRRIrMUOLfizqeyrjKQKXh5cqLQYL6COfryy0Hfm+f3N1VKOcQN0KH?=
 =?us-ascii?Q?7XNs3e/4uf0qt8uYIfy+ZdHQRTiUc8d6jmVzT9lhT2px0VsA4hjGpBvsa6EH?=
 =?us-ascii?Q?TFnuBjbTNh1Q8HvGBDSWSHuM7HPF6i+l8YLBYIgSzEkwAEZxVqb+uuHBqzJt?=
 =?us-ascii?Q?WABbMft1CTROOoUhBfhFWVwklNPcZpx/W7/HFOEG0ZYUknnNBfxBcM/tSDiB?=
 =?us-ascii?Q?q1udxx3MF15NUjnnrlZ/VZPOe6v3LJIy9EWcVmXYkIOSm7Rsamnq9sw7uWre?=
 =?us-ascii?Q?U27HxGA2D7zKwEic7RWQZyQ/VJlAYQOl6zamsFMHVPVhLdi9SWjE3dXtBOv6?=
 =?us-ascii?Q?aNBP+B9P4cS9HmnbBxFVu9RVC9tQ5i16s9Xw/1fTs66VjxaeUcU79DRIAD2+?=
 =?us-ascii?Q?Bk3tCZDowdxGfHjf/sXSt1b0gmrd6tGwK4ZxwfkIONFl3C17pisUsmokEGOi?=
 =?us-ascii?Q?CnG0oOB+tqGKGEJfIVw26X7qvTY8+WGbK+rQOndUU6TQkl3wLw+6kqAdG1BE?=
 =?us-ascii?Q?+JCNMX/NGjv36cOalq+YxZ4cQKMRl5RBjFlRjVUC6qvYymVTLVL/Tmmg09BJ?=
 =?us-ascii?Q?ZwZ8k97MwPg0OB3wQ2cxjXEY0ti+yzfS0TqCGnv9Y1IOSmz1AogIojLZOXW8?=
 =?us-ascii?Q?uO6sBVxL8LROlEvkm35Hi8EvS/8k9UscaH9Hq/BFUSkx6s3Cwy449PombOiD?=
 =?us-ascii?Q?gceDtasw/wiwR53+8Kcs9EImILgljJaGPusT4TOV9UviMRrVvWwzPtRmNiVN?=
 =?us-ascii?Q?+XWjULgF6ZggmyctNMXCnZWFckAYP8cA6PNu1gt29X17yEcbJXsgcdQ7udAB?=
 =?us-ascii?Q?ke4gZcidMNU9A6GPBcHu8MA2kj/qeG3UD3WTS4jvyjlse5F166X84uDmbW7s?=
 =?us-ascii?Q?iVALuxs+0L2AG1EkkXjae6S/UPowKMIh5pWUAKM54pYAkZKToCOJqu2LDMpE?=
 =?us-ascii?Q?ThojgLTv1BEehY00WD3UVsPlyR+LZwPIXO1TO3HaoUj0+ROm+MIELhWTT8yz?=
 =?us-ascii?Q?5+vl5vHfa2O2ohc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kx0QQVNjrg/jGK/45HGnzG4XllYhAls4bef/0QF7ChS/YOiGLnC5zRmATJjI?=
 =?us-ascii?Q?XnHJrvesFb9cxHYcsp6ysc9KgYI9tKbzRPZUii2JJ5GAi3caAmljGYnNkbac?=
 =?us-ascii?Q?QNse3qzC4Gmi6QC+kAiRh5NfkvpMGyqoRg6k3fsRtjQZRIl+QpgjLMgn1nql?=
 =?us-ascii?Q?L89vOK33NG70YjLl6SDFHwZv9g7Ku7i3NHzYIb1UsyWziN/mMuvx3St0RVIv?=
 =?us-ascii?Q?zkiHRAtckquNvga/JFEXKFqJRZknSD6Ig4vRuEmll9gqF26kSQMIqguJMRE2?=
 =?us-ascii?Q?3kXadZi53I4Kyl2B/hhrmmSpORSMBoBPLVCtCeBSMgQ6nHTqSZqXiyQfyfbl?=
 =?us-ascii?Q?Y/IBrziWZL602hT8xxIrXNilzeOQMQ87NaZ1ZHsXZ+B8mOBwboeoa9L2oHlb?=
 =?us-ascii?Q?5KoylKAr1juqyqn9HRApnTdmwsWLzwvFs8E187sU16+ADaAEOVDUuAZf1M2H?=
 =?us-ascii?Q?zT4RbStya2iyxQEXiMwtB/57LdUZXKc2llFcAN10lG67b/R0A2ZuZlstNqdT?=
 =?us-ascii?Q?44Y1xUErOKOYPe/9jioAn8wYt51pUR5NuZDxRp3dHuBsa0oXnaCELzraZ43b?=
 =?us-ascii?Q?mFmYIuAeV6Qwck7pMdK3pR4h3N8oJ8pZTw8U0vqYa0K8J2+UePGLrvWMnVnJ?=
 =?us-ascii?Q?asPShp/Gy1dxNVA368WqpY5AF4fNcPD4zZqpzmRl06GRZ2QgC8u3/uVcUKD5?=
 =?us-ascii?Q?FU4KDexTd5y/KmVz5t5KGxaY094wmmPYyfW10bbj540tKTDdaXWOjiOmR8lW?=
 =?us-ascii?Q?RdKR1GLNPHl3jQTNZjjO3F3AVXphqpt+j45fbUccG+d09XTDduvNjDPtoqAK?=
 =?us-ascii?Q?nN76IyIUcWf9Z0oBmdZVeL4EtgxaOfog5gF6PxWvt9EYxPUBrf2JeGt3ZS1T?=
 =?us-ascii?Q?gn+D/xrklQougPgCNOe06v7H0uiUmar9wThj94C8ClXr1FcV6OkD0cbQY8sS?=
 =?us-ascii?Q?UeBA4RUHg5Y019K1zX3HVimViZ3xfjlgyCvPzTTHYe4CQzwiVQJdK29HtjYt?=
 =?us-ascii?Q?CLRajpLrQk/i4ClXV/PPkEUBCGxDg0pfOLrvEhauyyjyt8ZNQS48s0uVkfS0?=
 =?us-ascii?Q?u7j3RzWS1aAF8Pl5C3cLPZSHm7MgYrPpVvYUGGFkNGE3+U0+X7szcIL/9YDf?=
 =?us-ascii?Q?+Mn6dART8/7w/SXXJTf9sO0h+Wb0YIJaJkbv+AKTQX8nPYEFfrLEpGxQ/OHE?=
 =?us-ascii?Q?4aeLjNrjmhXiZpWPJQ+2l9dNUx9vcZndzxNewY3N+TGqxevocrvm15oLdYa2?=
 =?us-ascii?Q?ZhQKea/eZqVT2dTUP+t07ypYkUDfpXh/YfniOdK7Js63Qau5kwnujlrTk+Yc?=
 =?us-ascii?Q?mGqUNUbxdgWTSOLz0gFQKJVer1BNbv9sTma1WwBODAUFTYpn8XfNmWiE3Er7?=
 =?us-ascii?Q?10HLD50K504axkM8tvmM9g2+Bz7rPJKPIyYRf0oGtRIP29T9HqHwl+ca/rvF?=
 =?us-ascii?Q?a49feEvk511iAZKSpkDS6vZM+MqamdI+mzR3fqRUhjUjYkq5o86uFEy6YwLv?=
 =?us-ascii?Q?LAlh9298nS/pYEbR0SvZys4olayV8SPa9jMV5zFJf2+40WVJMNZGedruJBwS?=
 =?us-ascii?Q?I8XUqkbXUlwvonxUnrfuwHr8KKoOsN3uB/szmc2t?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571f3d36-0079-4f2b-c9b3-08dddef9f7dd
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 08:25:34.5734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUX7WC+iplvNggh7Pi1jZ27Zc+2AEpMCTQvqamCSxIRn22mvtY1pUPics07TF5bjC+nXy2OgnLz1RgX2DVNNdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6955
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

The amdgpu_fence struct is already zeroed by kzalloc(). It's redundant to
initialize am_fence->context to 0.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index bcb74286a78a..fd8cca241da6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -120,7 +120,6 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f,
 		am_fence = kzalloc(sizeof(*am_fence), GFP_KERNEL);
 		if (!am_fence)
 			return -ENOMEM;
-		am_fence->context = 0;
 	} else {
 		am_fence = af;
 	}
-- 
2.34.1

