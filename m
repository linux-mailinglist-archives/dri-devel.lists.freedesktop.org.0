Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5D3B2612C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB47D10E2A1;
	Thu, 14 Aug 2025 09:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="eIXOf0Eg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013053.outbound.protection.outlook.com
 [40.107.44.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0813610E2A1;
 Thu, 14 Aug 2025 09:40:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F028z8MSCyq6zppT17SDIumMVI0i8oSGlYbkVWoyh08ZAv1lkClDuojziDP9DKw6lilWmLvRBAoeULRY/FmFpFLI+rJUn8EAim+DbO92nCGp8pNYAV53cPvqleXco8jISskxhsbEh4T2qlEdPLYZaJbzzsMpKU+uBOp4xWUBsS+TzowaNu1QP+TV13ncBMnhI5/bB0aRrpwh1J/e1yPaHswQzumGFKMgCbU7W2mrWrkF3qRcfuQe/2PxaqnpD8xJz08Si0CPtAVrhSG3GbLJuF3gPW+KxLMPUTsk7Es8ED8ib5mBIRVKkmVApqabgsjww3dfdaMSWZ1pea1GlSNl0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZ0iokmu5lBZ0EaxPfjUOx/O5TtLYkbVrTf2FZuTfKg=;
 b=JA5SDjEx1Zs9IUkZitMrPq7KlmVZkN2IsufOxs0gjsb9q0bYt2h1ir8bn/3vWBY5OUfXSui8Kyh/sF6rLbV5cy24DbqUSdR9lO2m3ohFjVFvkXATZwzl0Qo6KppfAnNUrBw2Rfj+J/B+H8nhhO+8luTkhhvMZvxRVJRxj4l4HEgTdp8F/BuNGcsPxM+E8MeDmPhHOyIMTefsP2p2xynwRjhliki+4KiuhdCcDkeb8YG0u54p1CaZ5b7YVsIguDXFnYhPxZiMLYyzfol9dmf1pA1ljjGL78iYpuxvOp0qiJTyraoaSRkIn4mJ4l85luNt8Lht+3Up6XDXYwB16gFmlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZ0iokmu5lBZ0EaxPfjUOx/O5TtLYkbVrTf2FZuTfKg=;
 b=eIXOf0EgIUUzbYbf5WR0p1i9D24hKtmCnkZ8thRoeTmC0pHJIYSo2bRPz6+P827OMKY75viSjx+3ZBdjX6E+s3cjqaYYcDKtdJ13n/0ihYXBqHMsmlm1J6S+pugtxRziWvVUiWE4Z3wsN64BlWfxijcL3V6KsaOuOFMLg6Gaxvdu5tqYSu8kr0Yq7TJOm88azm3r6ZDwe1uRZgTfHlD9JANK7hBhUPrOPGX7OntWi0kl9O/jVn6XUrnlBCawn0Kxo7xo/pxbU6NliMSBgV3mDy6lNnLjw83lbTdQ4y1fUupFbt7RlaUCcncfJmcvchb7vEt0/OzBOEEUo4Vedij0yA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by JH0PR06MB6368.apcprd06.prod.outlook.com (2603:1096:990:13::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 09:40:10 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 09:40:09 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] drm/radeon: Move the memset() function call after the return
 statement
Date: Thu, 14 Aug 2025 17:39:57 +0800
Message-Id: <20250814093957.137397-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0213.jpnprd01.prod.outlook.com
 (2603:1096:404:29::33) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|JH0PR06MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db95df1-ac26-4e23-fd3a-08dddb168f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6arAEt8Eoyz+EY+QpXpwxUzPe5wEPWNNeZq44mJ7j+7aPvT8K8NrAYGcokFW?=
 =?us-ascii?Q?kdw6YNZc9LYuU4NcSBPUYRx/HnmHuWZJs7iPnZ/TFMOsIpQ2FDrP/UuEevZ7?=
 =?us-ascii?Q?t0X+np1gmfkHZRwHoDJK8iRbqgPbrb1a7581C5Z0isUmXgtQTsTyVbdB2+qI?=
 =?us-ascii?Q?6X8uHIxJl6ZySGWYzqOPiHHf9paLVLz0fKYw7dyLEiZ4HS2g4GMYSTLVCQzG?=
 =?us-ascii?Q?VoVjILaRRFfyLtwQOiuaIlHtcSQlYcaCoQWAmvJcTOEK7c71MKMenJkZUiJe?=
 =?us-ascii?Q?quWSmNlH4nUIBKOojXFSV7RQzyvCBX2f071R7UkEII63tgGkOKEnGDbBFcRo?=
 =?us-ascii?Q?DdWQG9yeh//b3Vka8VB/lARESC4eRTLaIBohugQTcglQFQXDv8Xg5+q9BHAV?=
 =?us-ascii?Q?mAyLDSg3TMj0SyHM/FwTj7qBX1yJpE16Bu+pckHalNdyyNw+lsr6Tb8reK8Y?=
 =?us-ascii?Q?/5j++B+jPj/usuhjXh1WL7cYH/Oym1Lh4BLlvJ8YpLJ0NiKF7vOimKqhHzt0?=
 =?us-ascii?Q?f7cAzptMwO9kvtoCFhlBomj7Xw77NcfBPP0z69UwaG5NNJMr5hLTggXsc6lR?=
 =?us-ascii?Q?oBn3oFm8szyuNxEWwBthwO6NRM34KHyY26UPfSSktoGU7LPia8LBv+v78l7p?=
 =?us-ascii?Q?aTEpPZBzg/vSTWYytA+lfPZl0slGDNFpJ4zf8LouTo5OoaLcfBwHPO0/7CW6?=
 =?us-ascii?Q?ALgv5DemIJyvCq+vSZPzfnuKBc3aTPieQ2ImgZ7lt8go9Cr2nwU0ac7kjBap?=
 =?us-ascii?Q?rQdXdNtQ9nnAauXB/hClveTjjuxFzaavelFylRGLvjnQ2WG+bqTQUVTpoYkW?=
 =?us-ascii?Q?TirN+RJKLDLus0YLGL48obWyu4UdjZVUPaHgUImhIDnQ3IA/t62l6KpfEHpd?=
 =?us-ascii?Q?vJ/PphCe9UEVrgvCFWF6/PQX2lbOydjfM/oxCUHklDySPrq+90//vdlmWTFe?=
 =?us-ascii?Q?GtCRq2z3+2gwHU2WN2TwXEu76h2spa+L5LbZm7SkDGayKN+toWclGS+LaNBp?=
 =?us-ascii?Q?t5tkLKjcPGB6MiB7i5uGO23Pd1+Pq4RyTr3fcpB/dn2rFOoUn13Tj3FMv9P/?=
 =?us-ascii?Q?qy1UWFQjSwoOgcDzLXUWtpRRz9v4dWxEw7Ddqfgst7LielfzfYHfCqP1BFfg?=
 =?us-ascii?Q?su4WiXJRp38FFWplPnLEMhaU12Fpz1yft8AOaewdZhBy9B+pC8vo/hwwQzcN?=
 =?us-ascii?Q?lo4w03ylhwwgUjbq2b0sqCqHUMOyor534RiT3amB7zqZ0YsPNSwTfBMuTTNa?=
 =?us-ascii?Q?R2tuhJeNDNIpW6viwNMaoQ2x13/CJjJ3Pqwn/44AZnSHU6ax198df5UzcP2E?=
 =?us-ascii?Q?jECDEnifGCkpO5u2ZCaftuDAEawlMHKqOx3xvdew1mpHFwcAjkFeZpOMznTz?=
 =?us-ascii?Q?AdP8zG6Gp24/nVgKtu/yUJ4IEUzrph1kWU50vhWQnOypS0VDn49H9XmubiLZ?=
 =?us-ascii?Q?B5A8nHC+TilHWqs2L8G0burYjFgd2dvYKr709jnXUOZLCaZRoqcybg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FPsvGbRwYRfFe+8xX2JcHsytyRPR3a2tBlpBo5rDASe4gVfNeqBbKd5p5o0Y?=
 =?us-ascii?Q?tiCdrU0E/RidVhL3eaDY8+866WYtubj8jRElR+nIam74eOjYt9gGaiym+STA?=
 =?us-ascii?Q?vC+OQ52BJkGS5JXhQJk8xumCakPStaxDGMyuPfh1tA2jIp6gA4OvltBj9KP6?=
 =?us-ascii?Q?gMteRGumKfbZ7fzgM4gSpkAyaRdPqIAwWY3ei3W37fnkYIiFrcVOlpgWYs2z?=
 =?us-ascii?Q?Z4ZQLMy6Exy/80+B6vL+TQgiewUWmDOE76vH2TnX/7GWEWYW5fJwXsC3MGM2?=
 =?us-ascii?Q?Ph4kEkuu3Q+Fy77bQ56WTV7ozoXh+SqCGQczz3UHf9/VBzU96rtJ1yRePerd?=
 =?us-ascii?Q?mKkzAQecn+pjOyPaxLb9NdiMhqEvYDmaB+/kORoYieCgE2OSlXFz9/W/X4Hh?=
 =?us-ascii?Q?1O+lL2/xOuSxBDIPJDepa86c4p4N0lP3vLRemxsRRvQmY379VusukF9mckPe?=
 =?us-ascii?Q?4x8m9icc/dP3v8xFr2y/oDSfy4jyQHk256JJzBlHwwgsb1v4o0TjaQiwc3Ot?=
 =?us-ascii?Q?+wuEkI/RDKziRWAfUz10lyRJA3Ez6Moa5DGcCEgZqgYtA6GexrSSgYQkjQ4A?=
 =?us-ascii?Q?L2Zygg3z7bPZBKYWbQ7Wr0kAnNABbsp4/0UaInAzA/lbX7D4ErLt83b0PO9Y?=
 =?us-ascii?Q?qiitIBQkMZsVVEraa6P0V3VxV42bpeJGmnHCz2sm0oMjm/UNSXb37wNWS/7E?=
 =?us-ascii?Q?UG9VGhQiBkOQMDl2/46d8PyBvVyNnV2xn1QFZ3t5CeTU6/Jq75kfsWxwsktE?=
 =?us-ascii?Q?ifjmpOX/LaQNhmIeeX69v5sj9NHrcCZTWlFgmFHEz+MmIYCTGkTGpTWKxgkH?=
 =?us-ascii?Q?nhlcMoyJxwRya/ZI3tGOLrHNeHMOnhCHgF8AVWIMKLoDytVejfT+vALo4zwM?=
 =?us-ascii?Q?S4NNPIFMIQX5cS5iZfKIcrfh0/hjbHh/gSGGVfhHqX87NaoH10lK6P4w0340?=
 =?us-ascii?Q?XYvk3tPPGDeuDJy//TC0PMucjV91s/QWQNCMwwPNvb4AU6gJ+OLLWxIARKFR?=
 =?us-ascii?Q?POAtlruj0OAF9iyIctyyS31eKCJagEtAvH6m+rzsIu98NU/XtTQJY0+LFiRL?=
 =?us-ascii?Q?JsKncBoEYqZFkcJDBpUWCY+ugKDH/grD6Ro0nS0xY0KbKHFq1LX5GD6e5ayV?=
 =?us-ascii?Q?2ZAMvGPFW0YTtvJLjObPEz/b14y0vJdIRLQJc4L3KJ8TM2kJTRL7+eMt2AAQ?=
 =?us-ascii?Q?u5xVm2Nh28Y2MME//AHgtLI8lzccYyskfiN3XB79HCvDPbF/khpVfbyKHjE5?=
 =?us-ascii?Q?LYI3ln8lGWQ11dVLrxZqOsrpszU5XfgSq3saH3s7Ay+/+qF01tT/Bq9G9zom?=
 =?us-ascii?Q?EU07X45b99vUcXYlLhUGbAksAGeQzilIZZG+hSac/sQZ/AvwPHjlAKZa6Wq0?=
 =?us-ascii?Q?WASLnuqolbaQff+VRIGFFGjVvI2zYPQReQaNFQlNv+4Ei2XCH0P49/vsRqjY?=
 =?us-ascii?Q?LNAxtoz9mGkHkKE1MxfYpxs/b91p157sRHy/q9wX1ZE2aoQZyeeCjsSngJoG?=
 =?us-ascii?Q?TT+gHAt9iPn3ECOEC2HLoPxwF5SCy1V5GDL3nxZVtewkLAZHqClA56DknXpl?=
 =?us-ascii?Q?5bQhcEcpDAtFNkQewo/6GF4opOzXFyIOVcWK/4rj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db95df1-ac26-4e23-fd3a-08dddb168f24
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 09:40:09.6173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FO2XmSG/rQjWB7vHdmWvOA+NwFXPM2iODUOo2hOWXcYgncPIqGWJY9L7zTWSrldqPK22ccgiFbYoOjW0l0um5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6368
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

Adjust the position of the memset() call to avoid unnecessary invocations.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/radeon/atombios_crtc.c     |  8 ++++----
 drivers/gpu/drm/radeon/atombios_encoders.c | 20 ++++++++++----------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
index 9b3a3a9d60e2..0aae84f5e27c 100644
--- a/drivers/gpu/drm/radeon/atombios_crtc.c
+++ b/drivers/gpu/drm/radeon/atombios_crtc.c
@@ -770,13 +770,13 @@ static void atombios_crtc_set_disp_eng_pll(struct radeon_device *rdev,
 	int index;
 	union set_pixel_clock args;
 
-	memset(&args, 0, sizeof(args));
-
 	index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
 	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev,
 				   &crev))
 		return;
 
+	memset(&args, 0, sizeof(args));
+
 	switch (frev) {
 	case 1:
 		switch (crev) {
@@ -832,12 +832,12 @@ static void atombios_crtc_program_pll(struct drm_crtc *crtc,
 	int index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
 	union set_pixel_clock args;
 
-	memset(&args, 0, sizeof(args));
-
 	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev,
 				   &crev))
 		return;
 
+	memset(&args, 0, sizeof(args));
+
 	switch (frev) {
 	case 1:
 		switch (crev) {
diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index d1c5e471bdca..f706e21a3509 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -492,11 +492,11 @@ atombios_dvo_setup(struct drm_encoder *encoder, int action)
 	int index = GetIndexIntoMasterTable(COMMAND, DVOEncoderControl);
 	uint8_t frev, crev;
 
-	memset(&args, 0, sizeof(args));
-
 	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
 		return;
 
+	memset(&args, 0, sizeof(args));
+
 	/* some R4xx chips have the wrong frev */
 	if (rdev->family <= CHIP_RV410)
 		frev = 1;
@@ -856,8 +856,6 @@ atombios_dig_encoder_setup2(struct drm_encoder *encoder, int action, int panel_m
 	if (dig->dig_encoder == -1)
 		return;
 
-	memset(&args, 0, sizeof(args));
-
 	if (ASIC_IS_DCE4(rdev))
 		index = GetIndexIntoMasterTable(COMMAND, DIGxEncoderControl);
 	else {
@@ -870,6 +868,8 @@ atombios_dig_encoder_setup2(struct drm_encoder *encoder, int action, int panel_m
 	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
 		return;
 
+	memset(&args, 0, sizeof(args));
+
 	switch (frev) {
 	case 1:
 		switch (crev) {
@@ -1453,11 +1453,11 @@ atombios_external_encoder_setup(struct drm_encoder *encoder,
 			(radeon_connector->connector_object_id & OBJECT_ID_MASK) >> OBJECT_ID_SHIFT;
 	}
 
-	memset(&args, 0, sizeof(args));
-
 	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
 		return;
 
+	memset(&args, 0, sizeof(args));
+
 	switch (frev) {
 	case 1:
 		/* no params on frev 1 */
@@ -1853,11 +1853,11 @@ atombios_set_encoder_crtc_source(struct drm_encoder *encoder)
 	uint8_t frev, crev;
 	struct radeon_encoder_atom_dig *dig;
 
-	memset(&args, 0, sizeof(args));
-
 	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
 		return;
 
+	memset(&args, 0, sizeof(args));
+
 	switch (frev) {
 	case 1:
 		switch (crev) {
@@ -2284,11 +2284,11 @@ atombios_dac_load_detect(struct drm_encoder *encoder, struct drm_connector *conn
 		int index = GetIndexIntoMasterTable(COMMAND, DAC_LoadDetection);
 		uint8_t frev, crev;
 
-		memset(&args, 0, sizeof(args));
-
 		if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
 			return false;
 
+		memset(&args, 0, sizeof(args));
+
 		args.sDacload.ucMisc = 0;
 
 		if ((radeon_encoder->encoder_id == ENCODER_OBJECT_ID_INTERNAL_DAC1) ||
-- 
2.34.1

