Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BBDB28E81
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 16:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65DB10E37C;
	Sat, 16 Aug 2025 14:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="fYE1FImX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013018.outbound.protection.outlook.com
 [40.107.44.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0561710E376;
 Sat, 16 Aug 2025 14:38:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqKTc4S1tnRP/roTv+LNOcrbXxbT92rUBCRtzBB8magPU28zmVHuLyK3jhBa871T42H6c2D6owRSlD8sVCwDdzrBszUxXheLO2K50+V9CRgif5EwEQNZhU11UhIrX2Tm6dLzFy/QN0k7VR+CduP6zNEMhM/G8R+FLeI3lyCHUV/5Q1rn3UzkIuFS/usPXcR/V5Kg4Q5KQeCNW0pHjloKDwTGNPwx1Cv5M0H/MMmuyj01e1wwXMcu8m7soiim64jdWJxsrwsdJjQq/GdOLlBdtQ2vi9mxEcB3NFVWBBw1x2iqT9T2hBHXbA9PbInJ7BfHpXPXmetQikyxDuDT5adhUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53777gLqZn14VpBZlSIZfX0rRI3OkjlUqZzwqlXaC6k=;
 b=BnRkZUl6dJgkdoDIqkwh5qOd9ePx62/4VhIDrUT7DcaKlgc1Owv9kn0E0JdwGbn2HgLoJi651jAq1JYJ/mj9sKCfzhHDoXVi6YT09aUE7cDrpSCVTHuWg+ueA2DbsTbSKESMAhK4izPbdjN5FDTyxdMMX5wPK7aHPsysk3tgSpLhCSKei6BQBU689FPD1X3NAI2tFUPtwAeNYU+4tDNmmYcMUfbCerlIzZT10v0fXpVUJiWzRPEsRU/itWU9bM0zI0Ooos6Z5hgIgPV9j6Iw8rOf8igRzm/ak2T4JRAufTRB6zkMeI2gRbFKyPEXfgHTaKB3+5A4W1M1dhKfJ3nTVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53777gLqZn14VpBZlSIZfX0rRI3OkjlUqZzwqlXaC6k=;
 b=fYE1FImXbJ2llCZbQTNjUl1C5rjmt+metSJVThS4iTpyPK65mCIX6MNv7kWIVATRq4XcJ0SDinQ0vAA29TYFJi5poeZtd3dkp3zdCLlNQCq1mjYVkpRK9jrOyrEmZ5F7Jvbs4+KH/I0hJk78MWasXvccEUp3esTMQVw6qcp/vnVU37eeRY3T0PfoAdaJMAAmoArxnrxhka/dSJCJoiBzB8gB9BQdSfTfijtaPZq+s9u+pK2jmHVB0M0RADt2/KBeGcQn4qWcRBp9lAU0/vpVcaErm2LfQ6A5qyVEjeAZBlNkRLED06SXCfN4wpsh0+3hmkfm4DuqvHyqpjst/kBoBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB6771.apcprd06.prod.outlook.com (2603:1096:400:459::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.18; Sat, 16 Aug 2025 14:38:05 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.018; Sat, 16 Aug 2025
 14:38:05 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), linux-kernel@vger.kernel.org (open list)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 1/2] drm/nouveau: Use vmalloc_array to simplify code
Date: Sat, 16 Aug 2025 22:37:50 +0800
Message-Id: <20250816143752.397973-2-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250816143752.397973-1-rongqianfeng@vivo.com>
References: <20250816143752.397973-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d1e244-1869-4127-160f-08dddcd2829e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ha3sOHKe95fDZUzCq/frjfpl3wE0dd03Gbi6/sO7Vkej/bZqWDACXWuhNoke?=
 =?us-ascii?Q?hQYi7JuPthHXygDdKvfYPTuqSfSSu91fMOsvU3Wvb/PHbiD4leHamGFtuBiE?=
 =?us-ascii?Q?+Icol/U3PIKGV2HV7Lj2CSsRBo/+7JZ81Ud6WwI1ryP/dkBTO3w3HockGMNT?=
 =?us-ascii?Q?piELTHERQOVD9SdkKp+2pLtcLxdl84EfvOhXeACmhN3XsV6EUEltelQFGJQW?=
 =?us-ascii?Q?fhudeX/w448fBocEJKqS2h0Cr2H1YqZJ11Y+ibDdhkVIzKbKVkeiBQgthB3q?=
 =?us-ascii?Q?RvOL+f1RqTZ2w0aO0bVoEnq/3yK1FXtL3oGksVJYgxxfOyROzu5mUhaF7YEK?=
 =?us-ascii?Q?ilWalH7XVrrXc5pDCQ02Oo1F1TGP9QjCiPr54ARDxOI1jc1JmDF3Nv2vcJUT?=
 =?us-ascii?Q?BtSIJyc47TFZ2OzdXBV334wXRXUW9H6AaH7oHja3DXOC8O+l73/H8AGWif6O?=
 =?us-ascii?Q?jM8pW76fS9C5mWl3vFu/6ZkM7ExCYo7NhTE1+BTSEmQPRKBL/8A2rQ9zVkXi?=
 =?us-ascii?Q?YuvgV70TJZsWO6mB/QlcqHJ64WOjccah7xISoENLLf94E02jhyfOANigN+C+?=
 =?us-ascii?Q?m734EhXtXRKl3DtDE1nzAubdxOCqDBSN6ojxo1LSqhu5lFPcHdlP+UxH4aWX?=
 =?us-ascii?Q?7YbqQDJUip3yXuzSeJyw1hOnVIs+mxeYOPrH0+mFbmMF4z/76g81nOeZZ2pD?=
 =?us-ascii?Q?qg7VC7RtMzzrTjjR5kDG5nClln50nVIKkRqmlyfTRAuZMT5sahks4P0jQxoX?=
 =?us-ascii?Q?7bScI5JnmyZD8GaGZLqGxdcZvFlSPf7L63qlcWEjOJBI1rato1bnuJ0IvQ+B?=
 =?us-ascii?Q?1Sxf7d49l3iuE47V9roAMJcQMNL3ESjfX73VA9K9/DOscd+GUy3ANVyZ+Xhl?=
 =?us-ascii?Q?tmvH8oGfarFLSobTNHvgnlHAqk01DMzIpOudiDzVLpsSLuDsp5SsX/Ni3mMK?=
 =?us-ascii?Q?hK3z/ZTA53a6pv8MmVxfYVZq5MlUzjQp6Ug9240ep4uQeK6p8i5WtpYAeoAn?=
 =?us-ascii?Q?PDj5qLHavVvX35sgAVAIjN0xCfQFQRPA0exfn92ALuUuIa0evCaV0y1P8jAM?=
 =?us-ascii?Q?ZEcVZmcVdG++bJW5KSibUH6mNH9m7zNRv+FlupeB9NiOfDsoSHZ6lhbywcMN?=
 =?us-ascii?Q?BnTu5vRrzoPJhiT1HaYArHPjqjtfAedWqC0sRZctf6owVAhv8GMXS5EhNZnv?=
 =?us-ascii?Q?3DfZ027vAUbMzJfkPwKePL9k5qV28A8lPhZ46VoilMxsiW8Tdk0brg+hUTbV?=
 =?us-ascii?Q?kQ2hWKLtKb6nuhM8RDrvfn9FpVxzH/YQg2AkKQjewxLS0C5/8DuMKO//Rbb9?=
 =?us-ascii?Q?7ntvWgpbIQsR/5ZUuu3phHaB0HWbgACQyL7TR45Cw8UrNNhJYMuhyeASk1zK?=
 =?us-ascii?Q?qcLNpl1yAb6kqoF311FN1XxNuhOiUTS24dIZPcVWk5A3KL36SWWzrgushBLr?=
 =?us-ascii?Q?sphTGWEjhtmiUNwG5FKrD7PMwNMG5x7LpSEG/wtziC1o6Kn5ASxFHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?stQ0sVsB02k36DOYZE7VqqAFAuX7bxUfWor9GluhKJbOGGCdA9fJVl+1CX8G?=
 =?us-ascii?Q?zkYru3u03uCba18vDeYLdqgHaT/SBLGddJbmt86tCGIaTJ8wCc+2vhmAYO19?=
 =?us-ascii?Q?jCJARPLAikliRTmjNHCsEfCYPjsuJcMLRcx9jduOxom+b+VhqOZ6Xao12GL1?=
 =?us-ascii?Q?Mutk5HvGdQ2i4G9IlG7ztQpxznfYSbKa4kVnMMLXuEmrCbMiR7QbresqEAMq?=
 =?us-ascii?Q?u1RgC15hIMzZel7bzUnPXIWoN+edzIW/d0GZDseHRcPuMrYQ166TsGv+mTss?=
 =?us-ascii?Q?sPDycrRY3lG75RzYTJWmdXLtgkB0Yeb+kysCQ9uG4NSObTSSMue44cqlpuTw?=
 =?us-ascii?Q?2UA5iaZXwtmAkQSyQwmp454F2IdyLqq8grT0VBCdO4hO49Ew/CgoAV2n+fQy?=
 =?us-ascii?Q?FE6Gz7ALhbfTbRE/uUYkTWgbTDactuob8geK3Y1d3hlXnWvycnDgcPRqRVLO?=
 =?us-ascii?Q?CxVVMm5Pe9nn2l6GxXeUl1sIwHbQ9PtT7hGrmPjUz0TjRkN1+G2+oOWR3ybq?=
 =?us-ascii?Q?iaXoP1zDznvOScJQZZLyJO5CLrY97FqmLRhgOkvNhfUaJu4lRb0rZPNB+PMI?=
 =?us-ascii?Q?2r3cKrZlDzttqEVUJCTwswMHUk1kOTKJDG2DLYbUTtQPKFiMe3kbJbycVJ8W?=
 =?us-ascii?Q?Zx1RFdLh714qfi8YRWQ+KzShz41l8INjf3R7VijodRUIVcCthiEeS9RmQ8eQ?=
 =?us-ascii?Q?nYIkBonzBuy/uu2jGGkfKlrqBwmCPFv3ZGoRHLPO4MKqQSGTuKpbf0eN3sAo?=
 =?us-ascii?Q?aK9n7trCelAwmflVIQow4gvcDcCfKQAJO7q1HVhRGQahuoACbSXB0kPJLsvk?=
 =?us-ascii?Q?JFKDNIbWvbQCwrjzwK1CeGyK+3rMazDYrnRsxM2uO/QX4w26LlF+7hFEqfAL?=
 =?us-ascii?Q?viDIq3YZOy6++586H6WD3JKSQKLyJE1wiHWCXgspMNisGAKqM8ozX4EHcq0x?=
 =?us-ascii?Q?L0ryLVc4qQ1zmtSP68rews0ufKVdUtdDAjDvepiGFvEsYHfbh9kiUGnlSFhf?=
 =?us-ascii?Q?FjY2W3s2gOugXJxxW8pqXPfbjY+fgqhZz06vvCax/AV4IQrscwQnQzDWbT6F?=
 =?us-ascii?Q?Nh6ipc3G9HcyFkYJyN0UqH6xGVSQp1xRxF7TQyJJnBNMzng4v1WDCKuaogrH?=
 =?us-ascii?Q?AGMyZ2o3lOfXcnYPm2S2AAelOcHIJqbNg2zG9GHhBkhUlaEwM/LJ/4Qi6Oxd?=
 =?us-ascii?Q?4n/FmHgGTSlfn5St1O9oD86Gh1W2VDhtDGJA4apAOEs9SquAIhPFFf8oVI2l?=
 =?us-ascii?Q?VaaKHPS7za0oUMD5VUZc9uoVtHeOGYxbPliEPATUj45HV/xt2sHDgSvqcH0I?=
 =?us-ascii?Q?KCWUFgaWqim/EUuwGoW636beuikW6pTM4hslAAhmxgJwAMBL2TfOLvreuCkd?=
 =?us-ascii?Q?JHfOkq/v/Ezqgmkf9Rnadi1f40r5xsDRo1CMD6RlIAuqAf3JqvxWJUqXaDn4?=
 =?us-ascii?Q?/CaXOAz/P92rw6Sz+GzMaOOhfomJ4IC1cKYUEvuv6DkAjAsZXk5ec/gh1rnk?=
 =?us-ascii?Q?ifu6Z22hPL5F+sZUfjxZImCrOgnI7Aufti38b+eSuCyfOzVJrXTFZO7Effeh?=
 =?us-ascii?Q?Bnlo1z9itHD+x6MLdA7/lrc4j7iyNRVHHOTpme/s?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d1e244-1869-4127-160f-08dddcd2829e
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2025 14:38:05.0768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmgJYi7EC2SqugHp0lc82MfIqB8LK4pLMPM53AQWD7Eo+BqQ9kSDbSxtjMAOBEjZIBN8Xp9ylMGWSo1rdfub0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6771
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

Use vmalloc_array() instead of vmalloc() to simplify the functions
nv84_fence_suspend().

vmalloc_array() is also optimized better, resulting in less instructions
being used.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/gpu/drm/nouveau/nv84_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
index 1765b2cedaf9..63a477e631ae 100644
--- a/drivers/gpu/drm/nouveau/nv84_fence.c
+++ b/drivers/gpu/drm/nouveau/nv84_fence.c
@@ -158,7 +158,7 @@ nv84_fence_suspend(struct nouveau_drm *drm)
 	struct nv84_fence_priv *priv = drm->fence;
 	int i;
 
-	priv->suspend = vmalloc(array_size(sizeof(u32), drm->chan_total));
+	priv->suspend = vmalloc_array(drm->chan_total, sizeof(u32));
 	if (priv->suspend) {
 		for (i = 0; i < drm->chan_total; i++)
 			priv->suspend[i] = nouveau_bo_rd32(priv->bo, i*4);
-- 
2.34.1

