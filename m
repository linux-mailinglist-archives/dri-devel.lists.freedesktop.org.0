Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850B7C21AB9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABE610E32A;
	Thu, 30 Oct 2025 18:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cYbuRcux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013049.outbound.protection.outlook.com
 [40.107.201.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B6B10E32B;
 Thu, 30 Oct 2025 18:07:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSDI8cA7hV/k4dm/k1rRfBjJ8nwX++IZGmipQaVGMMnXT2OoDSlq8RlNFgnPd/Qh18XfXA4c9OtZPiLiHiIHE+apPd40BOerDr/csBqVVY5hQgNU8wkXR68s7u3sZx7ZtGggZzXQXj+NUSY1xJ14Y8kRJb0cmx8QPHcDwsk4MzeYrGuekj+v9e5c7n+oG0Nd+tOWLBJEafVJIkGhu5ddSnQhvjK0+pnCjOgmIazBQUpp9/NAkJW5ZI8tl9VJTXd3xnUlEe9cQEgSdpdTVoDEVfrL15FA8fDb1jL3rxJ6E6PknedzThqd4y4KKZUlI5uwb8bIEw2wJ4RwbPQ8kJNX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+/bpGEE9WCuARZJ++oD/JdSEDE2RmsR+ksmHkbTOeU=;
 b=tu3bAcvnN8ddu8q1SdXM2ipzQJZ+F0+gOWQGKz8rPCunCZRsIXt/YKxt0Y9miwPGLMQy6n/SzZO0eDJmJiUsEUgXpIiD8Nm23x7CevgDxmhwuZTgH7+R3IQ/y3GEKe+AwONq74KTMmHUGuUC4oMX5i8C6yTE++e+H2h5fVhct/xKiVb4F0ZY0NhdsBDt2IifLkje4gDTikurJY1rh5Td3wNsnW7TfkuE3ZI72VlpRnx3P0ydmeYAR2zWIrBKuc8Mg8OxdOEPZffQ/zZJYdFfTWGukaZHHA1zgILoTMsaDzOaKMdWRJ6XsNfBPoTvbI+nkczoCJiWLNbA9gyAOzcgsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+/bpGEE9WCuARZJ++oD/JdSEDE2RmsR+ksmHkbTOeU=;
 b=cYbuRcuxvogGEZq6haEKNRjuXOTKaIc6OZn+TNDKkHqHfg+Ae/MrS1G8xLo6yNNhfDA/cLmpLpbeIyoGh36/xnWF2YwsBaeqanvRT0eRDWO+8X9HRkEn33C2SsHoMHULNEtjrGcKdDQwqa4NjSMR6CHz2R/fmKSHniIGg7nbyjt4zdpka9Ywn91PhA1344D3udr6A3R5H44qN3pQEcuDLlmXANjkl4tUifZWxEAWUNVt6rnAE9FG/G2Fq8Y0JKethhsVepMqvkmED/jLZAEW7wY6ugsBk+5Q/8os/owA9eaOM72FzTrRBbquTIPJz3i7/hDgqRStlibdRIBMupbrcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by SA0PR12MB7479.namprd12.prod.outlook.com (2603:10b6:806:24b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 18:07:15 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 18:07:15 +0000
From: James Jones <jajones@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Joel Fernandes <joelagnelf@nvidia.com>,
 James Jones <jajones@nvidia.com>
Subject: [PATCH v2 2/2] drm/nouveau: Advertise correct modifiers on GB20x
Date: Thu, 30 Oct 2025 11:11:53 -0700
Message-ID: <20251030181153.1208-3-jajones@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030181153.1208-1-jajones@nvidia.com>
References: <20251030181153.1208-1-jajones@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|SA0PR12MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: bb76e7d9-7412-403c-90ac-08de17df284f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j45ssitZPMHVPkyCvmMDJ+mMPa1IdWh3Nuqkwq/yBBhMK9k1yme/mb4zw8Ko?=
 =?us-ascii?Q?40YwQccNEkV+cYo0SzhDaL08l6BCwIo0TYfURGaTVOQlAbOhObWqS7Ba8lk7?=
 =?us-ascii?Q?D9ofcJgstIlCiOSdSAyLVBQ1Ugv8tsGNj5yOWr0dw+zBIcUi8IDLNyFQoBui?=
 =?us-ascii?Q?xTh1Qksf6DCTbVTW4Ss3c/GmAidvQVZbjELkl22ak4fLLOxfNxDQchCjMDj0?=
 =?us-ascii?Q?WzeUBsiKu1JtoxGUM4cGLFH3o1tcqLHVXD4KrQA6oHpnFWgD2Xl65UpZDFnH?=
 =?us-ascii?Q?HdCBzmtdJzBXRMEMq3lJogxvAXmlgjWZB5Nb2oaqoXZCwoXtmNIfTZ1WYSDt?=
 =?us-ascii?Q?PtK8IHWmHewiuRvVHSrXIMhl1Skyxlok5S1FAzJJvOwcdtbsrWTYqFu3SByG?=
 =?us-ascii?Q?oke8TMBy5M66CsN8GPJSLAX2B+1a9iGaXY8RJGfCX98/fr6raOGxOhZvzenG?=
 =?us-ascii?Q?dv8eQ4Qw3HY5y/fPNFdtwY2sQuIAEpOlBxAGFw8docxG8KNObgGwlKkDR75Z?=
 =?us-ascii?Q?ynuTY8pMYGfo/X26uWXn8YUVAQXBhlTCxFIb4I9cs38xpLPoSP4vCNAqIXBH?=
 =?us-ascii?Q?El5Zm+Adv2V2tf7AtZN8yDe8cWdFegjb5aot7/1lsNnPn+k+xoZ2Wr+ZDEGm?=
 =?us-ascii?Q?37a0ynvIlZllErFFAu92jMcj+bG2LoAB4Lg05ItgUkvY3SqqzL9hHLvUlXH/?=
 =?us-ascii?Q?3EdHENeA3fOCcbSEQG2pr53TN+7kMPDPIkVWsdpBpHp8gnvQRphnw4dkvZOE?=
 =?us-ascii?Q?6AiUaEE1oXKYYfLBnizdXP9v/mKYGdeXIB6EjBBAS/FG3gpD8p880wCL/Rd2?=
 =?us-ascii?Q?1Nuul4wSSFDJ8kpPL/6aktfHRSgwKgyUhkUWYfoILbGd08M3P/qW1FdRtZPG?=
 =?us-ascii?Q?ZO8gLtFadr0yDjtGc47FpGrzOhB4qnpyfEoheszpQ/vr6P2ycX6aJ+/qpqau?=
 =?us-ascii?Q?XNNMcVUSv99h4B168krS4AtnDqEU14I/DfuSv2haxXVoIci3KQA5CdF1BpZS?=
 =?us-ascii?Q?nUewUiKS9QnNYWHid0F8zcaubPl8MVnGLgTOn0NVxQhAUh3ZLNpQ0NEAqV0d?=
 =?us-ascii?Q?ImDfj1gjD2HJmgyYQIEjISJHwoqk8YVZqXBV4xVuPi+IPh3giqv5c2QIdVrb?=
 =?us-ascii?Q?Nl88kFArKHE7r0sa8If6+ihNlnaq1eJqI7Sddfec8hvxX6BmwYHFaZVIvX2/?=
 =?us-ascii?Q?j/+i2I/7uM2SyJWQWn0HiSECimtz2MNoqI10A1hcu0lBB0ILZE47Muh528jY?=
 =?us-ascii?Q?zpxUaeyAKpnt3jWebMHebgS0LA/3HR8KzL8XdtitYnKMIyBsPRZcuwLs0T+q?=
 =?us-ascii?Q?xiVBaCjSSw7eHV0C3/dscTPX7FIC3MJy1vzlE5npXXaPYVhoTeARwQp9m4Iu?=
 =?us-ascii?Q?mWS4lcjALRMYJphYaTg3DMbV86fDohFY/1z9uCT+R3vxAgnIxt/u5jj3uEBe?=
 =?us-ascii?Q?NHMvFAhM1ukvW/KvnyHTyMUgdjw++Vks?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y3Nud2YNNaNu2nsvCzR/AWesHZSMh6ujG2JBy9pXmZrl9PCTsjHzPT1Ev6VR?=
 =?us-ascii?Q?s5/IRXp11Ny+dWtrIV0o03ng06kK4nEPS1mLkqp5CYUg1HZwzCHm0GHwwDHS?=
 =?us-ascii?Q?ExteMYEq30VLwT09KN7BAhiWG/8TS1rk0ulBlUe6HalKCYZEkritQ4uOe4OM?=
 =?us-ascii?Q?xKpkrSlKILnYl1P8qiPTzoA9jA7ZIKefv/2WC2RyOIonxo03iieX2Yk2O/0O?=
 =?us-ascii?Q?pSwNvfyZ1MP5XlvU+rSX6C0lhbenhWvp/pEJVNTdNv1PdClVkzzoJOpAQ8zL?=
 =?us-ascii?Q?UD4jiYg9GG2SkVTFDbi+I6YmQwRZdB1xRduea7qdVnYbT9cCyEKJyJjCCF/W?=
 =?us-ascii?Q?prfCm4oPhCCn25nhYQa/j/2Dc4tgdjvo1viwpeTxutTc+iXAmcQ4XTZJHRqA?=
 =?us-ascii?Q?m00KO5OLxpqvZisUluUnI919XwTc6EVOMERjzS7vVzi8VjM5CVvX3k6wsPwe?=
 =?us-ascii?Q?Qje4DmmQnwZsqxxQM4bxNrEdM+qMflG3YgzLxbvXs4LwPinTri4ihgNUtXuU?=
 =?us-ascii?Q?XcUaPlUPHPPncJbvUPMhMqnJ1z8wu0AfhoVM+AAMQLqFoGuuny976qSYrews?=
 =?us-ascii?Q?hDZyoshms1WRRxqCMKP5cgY67AwAQCxt3jezTX4HatyGA6Ne6JP7dRXzm4RE?=
 =?us-ascii?Q?D1GZGSZFS02D9+Rt73Ev5Er3wvZVv/AVqKBhQBFV122yt37XWvZTGTuoIciQ?=
 =?us-ascii?Q?GRmw5k1khxho5Py+uYIXRXg0pfrz3BAdPFcd81ltEe4pcdHOxfxfJt4p4JjW?=
 =?us-ascii?Q?klM6OT7BTBsf66FMB/+6CZZP64iCfmcu/vkISXIi/0w0sQuPGksRyQIpqGkP?=
 =?us-ascii?Q?z++EPUG3CR4OPMqb4alXGXCxKAmH65c5B6Ux/wlenbnmumvFFtFaGOU17/Qp?=
 =?us-ascii?Q?iD/buiVIXUOCA3QwJMy8wSrLONyXA33WOXv8W+pHIj6974Ed53/m4ADdpzzM?=
 =?us-ascii?Q?X4w1u1uN/NIy46iCan3miWYP+7JceOkXYkpjCnDaH3pR84//5n5k7WEX6aql?=
 =?us-ascii?Q?EEYsmioAiG4pzahNNbPTab/bFmBN0g3HuFu7iPg0bRRd9r33DVsCobzCQ5Ry?=
 =?us-ascii?Q?X3MDlPr+1uWguO2xvw5vloEi2QE5zTa6pfbfAJIPv2nbKC3HFCYa5sBzZY4z?=
 =?us-ascii?Q?dxk0Z3QoceT9hIDDdqtezYM+F3YANw5yhvStJow+rkMmCJkO9E5WQEunP1GR?=
 =?us-ascii?Q?3l0+FMCud17nuZpp64wL80GBTKLyGNKeXssxAwVmMMa+r92+4b/xTsU/wCYt?=
 =?us-ascii?Q?0ZL+RHwO+jKbUdPhd4rqiUMlBi+n4yjRtp3BJBdFpj20rfNl+AXwdMX5Iy3I?=
 =?us-ascii?Q?FD9GjomYl08Hs5GWlJDgdn6bqNusim/pxpu3AhIDwz5gs0RwYC1xAZI0X3kD?=
 =?us-ascii?Q?FnRG/ApGqVfsRx+i/3LnXR30cfKihtxvgfwwkfcoQ6TYOvnfx7eKiQxV0Gm/?=
 =?us-ascii?Q?2a2s4GGVGy+pj9caGP8dj64pmQNjxarjf7feVkGc3E2KBOdgx4AtKB0PqHpd?=
 =?us-ascii?Q?TWMYWKlp5Md+LNJpcXLSB9wRMubQDdn1G5aNgoCUG6dit5Vs9A3GDLZHumdm?=
 =?us-ascii?Q?6UuKgTJKHHvSAZ4rzRWD4hLMi0QCdGEz5NlqbRnE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb76e7d9-7412-403c-90ac-08de17df284f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 18:07:15.6282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ss6cZbDYx9hbE++xRJBlNLVAuRIiKnHqASE+2eYX3igk0em6zh0n7WIXP7rb+C6Z7zhSowaWgggl7ScpFa+PYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7479
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

8 and 16 bit formats use a different layout on
GB20x than they did on prior chips. Add the
corresponding DRM format modifiers to the list of
modifiers supported by the display engine on such
chips, and filter the supported modifiers for each
format based on its bytes per pixel in
nv50_plane_format_mod_supported().

Note this logic will need to be updated when GB10
support is added, since it is a GB20x chip that
uses the pre-GB20x sector layout for all formats.

Fixes: 6cc6e08d4542 ("drm/nouveau/kms: add support for GB20x")
Signed-off-by: James Jones <jajones@nvidia.com>
Reviewed-by: Faith Ekstrand <faith.ekstrand@collabora.com>
---

(no changes since v1)

 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  4 ++-
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     | 24 +++++++++++++--
 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c | 33 +++++++++++++++++++++
 4 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e97e39abf3a2..12b1dba8e05d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2867,7 +2867,9 @@ nv50_display_create(struct drm_device *dev)
 	}
 
 	/* Assign the correct format modifiers */
-	if (disp->disp->object.oclass >= TU102_DISP)
+	if (disp->disp->object.oclass >= GB202_DISP)
+		nouveau_display(dev)->format_modifiers = wndwca7e_modifiers;
+	else if (disp->disp->object.oclass >= TU102_DISP)
 		nouveau_display(dev)->format_modifiers = wndwc57e_modifiers;
 	else
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_FERMI)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 15f9242b72ac..5d998f0319dc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -104,4 +104,5 @@ struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder);
 extern const u64 disp50xx_modifiers[];
 extern const u64 disp90xx_modifiers[];
 extern const u64 wndwc57e_modifiers[];
+extern const u64 wndwca7e_modifiers[];
 #endif
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index e2c55f4b9c5a..ef9e410babbf 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -786,13 +786,14 @@ nv50_wndw_destroy(struct drm_plane *plane)
 }
 
 /* This function assumes the format has already been validated against the plane
- * and the modifier was validated against the device-wides modifier list at FB
+ * and the modifier was validated against the device-wide modifier list at FB
  * creation time.
  */
 static bool nv50_plane_format_mod_supported(struct drm_plane *plane,
 					    u32 format, u64 modifier)
 {
 	struct nouveau_drm *drm = nouveau_drm(plane->dev);
+	const struct drm_format_info *info = drm_format_info(format);
 	uint8_t i;
 
 	/* All chipsets can display all formats in linear layout */
@@ -800,13 +801,32 @@ static bool nv50_plane_format_mod_supported(struct drm_plane *plane,
 		return true;
 
 	if (drm->client.device.info.chipset < 0xc0) {
-		const struct drm_format_info *info = drm_format_info(format);
 		const uint8_t kind = (modifier >> 12) & 0xff;
 
 		if (!format) return false;
 
 		for (i = 0; i < info->num_planes; i++)
 			if ((info->cpp[i] != 4) && kind != 0x70) return false;
+	} else if (drm->client.device.info.chipset >= 0x1b2) {
+		const uint8_t slayout = ((modifier >> 22) & 0x1) |
+			((modifier >> 25) & 0x6);
+
+		if (!format)
+			return false;
+
+		/*
+		 * Note in practice this implies only formats where cpp is equal
+		 * for each plane, or >= 4 for all planes, are supported.
+		 */
+		for (i = 0; i < info->num_planes; i++) {
+			if (((info->cpp[i] == 2) && slayout != 3) ||
+			    ((info->cpp[i] == 1) && slayout != 2) ||
+			    ((info->cpp[i] >= 4) && slayout != 1))
+				return false;
+
+			/* 24-bit not supported. It has yet another layout */
+			WARN_ON(info->cpp[i] == 3);
+		}
 	}
 
 	return true;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
index 0d8e9a9d1a57..2cec8cfbd546 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
@@ -179,6 +179,39 @@ wndwca7e_ntfy_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 	return 0;
 }
 
+/****************************************************************
+ *            Log2(block height) ----------------------------+  *
+ *            Page Kind ----------------------------------+  |  *
+ *            Gob Height/Page Kind Generation ------+     |  |  *
+ *                          Sector layout -------+  |     |  |  *
+ *                          Compression ------+  |  |     |  |  */
+const u64 wndwca7e_modifiers[] = { /*         |  |  |     |  |  */
+	/* 4cpp+ modifiers */
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 5),
+	/* 1cpp/8bpp modifiers */
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 5),
+	/* 2cpp/16bpp modifiers */
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 5),
+	/* All formats support linear */
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 static const struct nv50_wndw_func
 wndwca7e = {
 	.acquire = wndwc37e_acquire,
-- 
2.50.1

