Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF43596D5CC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 12:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AB010E84F;
	Thu,  5 Sep 2024 10:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="q0Mtd8A2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2050.outbound.protection.outlook.com [40.107.215.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317DD10E84F;
 Thu,  5 Sep 2024 10:22:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFl//SkxHEGhH1JUy5JIvCa2WKDHLJwv6vFoOvKJ4te0YU2VwQ54GpDNh868beViyKwytA16uelB8EFSP8LCicKDXUO+vjTckhLC7gRYbCjq45jebWiklASW9F0fj1zlW/bQ41KorU+tUHzs8deGewZQJ0bligLh9HYQrP9ay/yGz7QCpnarSUEi/ytHnLgslO/9HMHvPd7jwNEo09ikHH98wcB8vi85kJQ9i6TilS6HSUOBVXsFFl0hkaoTegRH6S+5eZDip3eMzey5l3wWaxZQjNYwK2JxDY3qcEq4z3oM6vhWgZ8kbaR9By0HMGjowYt+Lny9jwZDAQuH5aNX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEPKNvrGwgQfwdsWCzQOaciZOOWDsFnQkygZIlbvb2w=;
 b=RY/D5KRftE1eQN/tENc2l2RUYfznrb0V8sFs6f9fKJE3xh3lFBv8yBrKYMUoiSJ7A+PJkAhJ2GTva/TUao2p3m8GYKhZFWf7HAe7BjcQEk0y+lVLsfGQ2myPxLP/hwzOccrZQ3MiIcWk3VoiJ9K6qPYWf/O0qBM1NLVG6il7HP5U+D4CXcwmE/h5onLo/OjmgwTW8S4RRF9zE2Ioi1vIQ3Oh4JIp88qtOjSbQ+bA+tZKisgG3+e8qr7p+70MqyoVQWwfqzffiL0C0ocR9bBdNn/iV2EFmjMpgc5PVjXT8az/uWXL/asMJwUIydaJTh50dznVEp0doVGqqq0/bksN3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEPKNvrGwgQfwdsWCzQOaciZOOWDsFnQkygZIlbvb2w=;
 b=q0Mtd8A2jnEpgMIT3d2wYJAMVnSKvqNDgfou91HeiBz2es2cQ5oApj9tFCDrjiMhGsQzf+Gwiuz/ayyp06PO8MIAHb2sS4/HgOZ8Cn2CdmGA9Pi4Q9R4+j0rpVsNPzoIYYBZXZrfEXroCB1IbddOjw+e4DgHa0dIoTHt8yj5mDCpn3QSHQ9iYJlcKHLpzz79ZPxocu6+NRbksBPS8XyeNT0I1hnqTL02qviGWrPKmxpRcQ2r45E9Zeqhw2vjlXDHennEQwMolps7X8IpVp9+/l3Zr1/SgqJZaXJiv5qCDr5aCh4vUY0GfEMOZV1T9JAPcWxii2Vni+zPAuDbdLtFgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB5487.apcprd06.prod.outlook.com
 (2603:1096:820:bf::14) by KL1PR06MB6865.apcprd06.prod.outlook.com
 (2603:1096:820:10d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 10:22:42 +0000
Received: from KL1PR0601MB5487.apcprd06.prod.outlook.com
 ([fe80::2129:59e5:6c67:311f]) by KL1PR0601MB5487.apcprd06.prod.outlook.com
 ([fe80::2129:59e5:6c67:311f%7]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 10:22:42 +0000
From: Chen Yufan <chenyufan@vivo.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Chen Yufan <chenyufan@vivo.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] drm/nouveau/nvkm: Convert to use ERR_CAST()
Date: Thu,  5 Sep 2024 18:20:30 +0800
Message-Id: <20240905102106.85283-1-chenyufan@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To KL1PR0601MB5487.apcprd06.prod.outlook.com
 (2603:1096:820:bf::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB5487:EE_|KL1PR06MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d45c253-538f-41e8-29fa-08dccd94ad23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E/HLgOVB3RFI3qxHgUcFk+N/LOD/kx8ywYsyE3iJIy/oXSkKfOEwe6cq9u/d?=
 =?us-ascii?Q?zIf2aim0MJ5HEvDIRj7OzMLWjxKacxrmGYDzqOTNptmec6YWtMZbYUJ/HqR1?=
 =?us-ascii?Q?z1Ek9bcBuSZm8kEBx8/GShiBmtXaErRs+RHwiHuAsB44AqwSMkDU9UWB3E82?=
 =?us-ascii?Q?HLF1SBc/RRFywB+G6oP62TyGN7/CFeg33qjBTdWAh/WcxqaPTDrDLQeL3WZI?=
 =?us-ascii?Q?6Lni1xAKW4q+Fl94ll9HUyyz/kXFHdj+lMhrx+CX0fShJCEcuCFpDU0+RoDK?=
 =?us-ascii?Q?oNJAsoJe7q8cpHagTx4hD2l0qobVlAGhfilAU9m6E7D9uZqZsp5Um3qNrLir?=
 =?us-ascii?Q?JYvsD7vyr4ZVTRVea4MLFY9hRRbAXLsmRkZTkUD9MwNxCkPn0ltcSamu5mmX?=
 =?us-ascii?Q?eI1025l8WENqdbPZgEAyBDxpgXOuczUQTh+J3+h3mrqFIBkVXg1l4s8LqiZd?=
 =?us-ascii?Q?BOTA7O0Pfcq8k/Z9Ni4ek6EAwvEzDDXV21EvVIc1utALwUT81oHbWdtbxmHr?=
 =?us-ascii?Q?3rxx6GhNTvoPrUgkBfKfzo7CKt7TBzgS3i3yLnN3iAGFi7ZEkl+ShDeO1Lu/?=
 =?us-ascii?Q?boEDYNR5FAD/9yA+y5lhPRGvnXMoGGAoRLlUAwq0JKUAOgQDVnt5z67hNff2?=
 =?us-ascii?Q?qI1FKmaTqTwi0Omd3iDb3sVuWqfj+v+WrvLEiqja8Maa8Fowg76fH0gdmFQg?=
 =?us-ascii?Q?POfoD7GXq4w10utbZpDHz7P3RckLeXynLYv2fOkkgaMdAq0sL9OPndc17WiO?=
 =?us-ascii?Q?VU4aaPW2bUxJsmuVyaOzeUKGwdNwEkQov8k4NMaMCCSXe7JLLvdmXSDWBD7H?=
 =?us-ascii?Q?JYFM/QsT5NVaYhH4MX5vi5EBMOcAxWXZg38pTgkLJK8wbSG8tRJ+35Sj5Fho?=
 =?us-ascii?Q?+JLBxlF8dVdTeep7DjZyYeYi2UJz+txnUIsBY472FLI9gMQa3lstafG13onU?=
 =?us-ascii?Q?3uRFZo9lOxMkq/1F6Dmq8cbmsGqI4ANT807A3EgV5DrCcSTlRQ6MP9jBUPxO?=
 =?us-ascii?Q?6K8YffknCDS71o42b2E5I/1tYhcgxszlyoK6QgP0KJw6GPhI8SIP7njdGdHH?=
 =?us-ascii?Q?zOm310zefl9njl5aQeGL1fI5H7QvapNOu82skaIiIdhBs48kuMYxxMIYyAgN?=
 =?us-ascii?Q?ImxOdJMY/sV9Oxuh3HZ+rNr5kQlYKDc9Q/+ypAYK31m2NCNh1RRwfkFWldrs?=
 =?us-ascii?Q?AlynOpkbzhi53zeZWQvdLFD5pu29GiLM11MWYFAtaaBghai39ZE72Dzr7ANm?=
 =?us-ascii?Q?ydpfPPIBOzWk8DVfS1+QOSzPp6MSuKfyGlB6f1s14WPGAdwEA/y3LIjj2zPj?=
 =?us-ascii?Q?KUrpreToTewmmLluw5KhwgugtwFO17ZLQ70D21ZwvaFs2bSA+S5Vl9v+r5JH?=
 =?us-ascii?Q?2SWFD+C7yaT6PrLqCOmHmBtiRONYJDLTXwLYrvTpLh/tn5SwWMUk5UuztHkw?=
 =?us-ascii?Q?+i9jn9CJo+g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB5487.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LhieTlWAvuVblEfWjoUrQbR0boAIeokbni4e+ojvHww31bfuOJ/xjKOdaE2H?=
 =?us-ascii?Q?pXb1YwNN3OR3bjSwZ/OpyLnNOw4Ug+I+e1wDO54Iy8CqAezUNjra+xmUF56h?=
 =?us-ascii?Q?az9jyEcjjdDgFRzO1UEUjgzN+9w58T30W+5fZDnzY9wBV/F/ruMAiXw1Cw2v?=
 =?us-ascii?Q?sZxr3OudYZan3ad6nSxx7ZFmgICi9w3o46dYCfDL0jdF+9Ce3iJTY6Xn+OEI?=
 =?us-ascii?Q?IAtfZ8N63r0wL8vw0+A386CcHc1P/nNGYzKVZQRSPiZ6HM7jUQLE0uYYB2No?=
 =?us-ascii?Q?mAE5/ybfJbuzcu6vSXO0fuMvMMVBRl2rNiqkqnJRgGP6Ph5Ja4XpyKDMA3pV?=
 =?us-ascii?Q?DYxKsgyGVL/gMqMsGZsW+IEq2TSGzYFhCt9hbQl6gDDi7yshi0fN8F/TgLrg?=
 =?us-ascii?Q?eEO5EcOPBcHqct4FZyy/GophX6ToI+xkrBeVeWikHfpap1h2bjcSHzT+TN4D?=
 =?us-ascii?Q?A1kwgpsCRuPK+y/Afy1/Fj8BwzLiWsD0bcqOMBvXaygMIJ7Pzoy8tSjsWJyP?=
 =?us-ascii?Q?zg8wsEEM011lRhMUhmxIbLKY0T8YC8bhr7L+UjYDuMEZ3Z71mUj13O9Rg/Fr?=
 =?us-ascii?Q?YTkSAYUDKvMtcXghvQEn4AVUyDks8SZj3qBBRyXzrd1toDw6SY4kEN8ClBqK?=
 =?us-ascii?Q?Cq0SWXqX2eFTtFMA483WoWXcGrANSwYr5CAkmlhqFtTk6iQGv7O9PuSKU6Xf?=
 =?us-ascii?Q?/RrmzrS0RQWUROOiaNnM4x+E8rvNwzJN55E1lcHhIW22XmyD/Lhv5vgtTX+E?=
 =?us-ascii?Q?aQH2RBHRI2B8OBXH2+we7wXDKI07LumQd8AbFWQIWK8YluZbLHWcvD54mOjb?=
 =?us-ascii?Q?Xlu6OhaP3Kdgd9RfCef1gkv6tb9H69ylpG8MBCQSd38OJg9Q4OmZTfac4n5v?=
 =?us-ascii?Q?mL97MXAeVb2Lfp2ENWNZ5gv9EEn2tTfUDIHU2r8u1U2dyFOsZGlKfksAVLNw?=
 =?us-ascii?Q?xZa9C6zBtLKInHgQ3HUJZfz9Fkb6jL9EErDrpiz2XP/QDPqZwG9DuMLuj1RX?=
 =?us-ascii?Q?7dZ2DH7qmgCySL+T7CODw5VyYqkhzAa3lSthM6t/oteBws0a1rXZpbKM2J6U?=
 =?us-ascii?Q?Dd5UadWIGRs8YA8FencNLXsoMGADMGFd+7Gnfw1jeRiez4okP3Cq66KKAmed?=
 =?us-ascii?Q?Q4TCDZiWOeaCMYJjH9HCu1KJx1/ajgA6aPuKePuMbClSdBdkbcXuFr3ug3HE?=
 =?us-ascii?Q?4jrv5t0zlDY1pIvQ88F5ypYRAnIXx53jmXz2c/qAi0/AKp3qmV2NiKhQhgDO?=
 =?us-ascii?Q?Tm/HQ1/GOI01PsfOAsaBXhbnBvfjdyV8LB1JBYSrn7w/dauzwf2vknSdePqH?=
 =?us-ascii?Q?rbmbqaARdSqukXPEdhyyQzW69xaGGh93nFjn49J/TUSa7+F3n2VatTmJ49q6?=
 =?us-ascii?Q?fzsICXAQd0ht54QmrpIvZTLQzdoLac3lQtEzzgc0y4qi2SxT/W+DUUWs7k31?=
 =?us-ascii?Q?sO7JEaOEdd6YBOVIPBXB7fW4H+ptjUH1nAJcoEv+S36UOVR8VprWSqFVxxAv?=
 =?us-ascii?Q?pvEZBDmlm2Ey3IVimYJ9H85XDR/F7ZWqABZgGgkTc31j1j9Rt8ffbhR+0Kg7?=
 =?us-ascii?Q?SE7JrLJkkh8TBONxKBWMHYt8e6gQMomBdtvv9bTp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d45c253-538f-41e8-29fa-08dccd94ad23
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5487.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 10:22:42.5416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5i7fUO9tLGfW87ZfvlYsgYmtBX0Sz+m+HrRQYAfUFvblQGarBn/xpl8DJDj6TleC5s/4cogXH94NriM1C9yWJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6865
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

Instead of directly casting and returning (void *) pointer, use ERR_CAST
to explicitly return an error-valued pointer. This makes the error handling
more explicit and improves code clarity.

Signed-off-by: Chen Yufan <chenyufan@vivo.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
index 027867c2a8c5..266857ace7c7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
@@ -646,7 +646,7 @@ r535_conn_new(struct nvkm_disp *disp, u32 id)
 	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
 				    NV0073_CTRL_CMD_SPECIFIC_GET_CONNECTOR_DATA, sizeof(*ctrl));
 	if (IS_ERR(ctrl))
-		return (void *)ctrl;
+		return ERR_CAST(ctrl);
 
 	ctrl->subDeviceInstance = 0;
 	ctrl->displayId = BIT(id);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c
index 797131ed7d67..ef02e61dda0c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c
@@ -38,7 +38,7 @@ nvkm_dmaobj_search(struct nvkm_client *client, u64 handle)
 
 	object = nvkm_object_search(client, handle, &nvkm_dmaobj_func);
 	if (IS_ERR(object))
-		return (void *)object;
+		return ERR_CAST(object);
 
 	return nvkm_dmaobj(object);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index cf490ff2b9f1..c45914f30c3d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -37,7 +37,7 @@ nvkm_uvmm_search(struct nvkm_client *client, u64 handle)
 
 	object = nvkm_object_search(client, handle, &nvkm_uvmm);
 	if (IS_ERR(object))
-		return (void *)object;
+		return ERR_CAST(object);
 
 	return nvkm_vmm_ref(nvkm_uvmm(object)->vmm);
 }
-- 
2.39.0

