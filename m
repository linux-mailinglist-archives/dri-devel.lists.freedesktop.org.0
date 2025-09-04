Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AB5B43589
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 10:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCCE10E9A4;
	Thu,  4 Sep 2025 08:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="C2gPnjOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012038.outbound.protection.outlook.com [40.107.75.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB4810E999;
 Thu,  4 Sep 2025 08:21:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ayp+QVjKO8xyJX3SndXEIyzjs27o0vKCHd/kWWBwORupPoqkt8AehXzH9JuLxRRtg7Y+7L+MzmKnmR2k747amXjHSxBLilyhqGb9ISe6Nn37uJcYn1SLAa2ZBRreODHRWjO4wXLuiYfX8FZf1wo0qNLnUR9iRqDsMp7v8tj4p+YwGVlAwYK+dF3SkaKIwrCUAMS2D0RQ0PV/jCR8r5vv3sWFdjiTW1u3mDf2BLQPDOjT5yg7y0JA5nFvMGC1w6BxQ5amfLcTYaOXvC9lw4WpwnzVpLHgr4AF4FBW5WFQdqgWGCyhOarsbEsTM0p+buroISS34OI+wyaGT0WjZfIrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syI8CDCpUzKb66YIZ2s9q1pG2AJcUi5JrNo5Rkb73O8=;
 b=Qrpb4YBiuLS1F+KUFnAFNAEVRzQ8xN2JCwJ1YddexMP0PbZXAfL0awNB1/Miy0agscPkyaZABbW/vQkKEZRP/FAKEjcO6F4M5cQvw/b6YB/ekrcIjpH5jo59PXaqXY2g4dUofLptGGNUkicM4ffqqwrtmqZ+AwNntgG8mEsK6xenyMY0O2Hywf8iaxcRwSpxkH435X/DNhuyJeui6m9B09jxw4VVvz/T1UVfD+CFoHhcKsMejFzSIQFJNFweQR44ns2HnNTsWNoVe00lYy4t82RHEPnOUyesJoiQ14r3mOhP2wu1HcoeGJ61V1VsJCPBQueNuzfzJ3HfwHz9qkYYTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syI8CDCpUzKb66YIZ2s9q1pG2AJcUi5JrNo5Rkb73O8=;
 b=C2gPnjOMtN9t5HGtwRHp4K/uBdgToE8Mc6YqVx3ybZKrQi4ZXCk1ETkPt9iMzgVVbRxn3Z8VuiCQXbtnoLaQljxOIT0bL5vKaqM21u7QrbKDCyUFw30FuyhpqPpad2v98iCV8r6XXUFtoNUY572DMA3B13i53cTEvRfKlk78pns6vjyw4U/Q2fDjUI1yigAsLDpZM1GjFNdy7Is8tUVeVymjJh9UZKLTmP2zluIxIKE2DdRn9KTnH04QogQMjAQS36Q47DKLkfkIl/Vg9elPhXT9fq6edJrTIGp7G97Hrfo/0gYBqhoalqXs/FFoXvZguom2G4rZqZf5RU4f0ogw6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB5062.apcprd06.prod.outlook.com (2603:1096:101:53::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 08:21:44 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 08:21:44 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lijo Lazar <lijo.lazar@amd.com>, "chr[]" <chris@rudorff.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:AMD POWERPLAY AND SWSMU),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 1/3] amdgpu/pm/legacy: remove redundant ternary operators
Date: Thu,  4 Sep 2025 16:21:11 +0800
Message-Id: <20250904082127.271638-2-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904082127.271638-1-liaoyuanhong@vivo.com>
References: <20250904082127.271638-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0100.apcprd02.prod.outlook.com
 (2603:1096:4:92::16) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f101bc0-5b93-47ff-0dda-08ddeb8c1595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UN87clT5xj7KGh1FdzqYKrQYy9b/QGw7/fcZ29cqv2mPyq5CuRZRX1+RdIqV?=
 =?us-ascii?Q?fKTVbBZx0frup0xc02LdCYLW4Gi8V9ur7Ajc/XIhXn+NTjMXfWzJUjPxQVWQ?=
 =?us-ascii?Q?SAE6WJZAqFl/7kPI3oBe0X1sCsSSbuaZXiYNzynMZ2Kypghx+8EpJlNocWQE?=
 =?us-ascii?Q?/6MLv0lrT/S9bwqnMLOaDw/zsVD+nGj50wJnXvfm2I0R/g3I3CsRJk6A50Y3?=
 =?us-ascii?Q?zofLr+Qgvcue90WMWKr/7bXqEW8p13YeFUcHJ7g6gqpkMQFyCMNFNx889VIB?=
 =?us-ascii?Q?sruB4FI1pdcUPmiwKPCD2Kdt5aqZyAlyuCjvQSIx6iG60UkblFWCGpqp2w07?=
 =?us-ascii?Q?xgneCw8mHb6AqNKzDXrvD831w1ahS9NaFRqXvb7nWYDdgYbDaodL9OfNsc9o?=
 =?us-ascii?Q?0EMyaY0jnM0l4SXpu/IzwXZSalSRhGmlJlTr3c3yjE7ogjY3aXqBFLMKFRYh?=
 =?us-ascii?Q?9uqvz0XRS+fR1G9rBZXbOinD9RXZJPEYCit6Y0RdxB7LG6hvIlhKOWHpA9aM?=
 =?us-ascii?Q?WBTTJ241/rpFVsMNrze/XkT/qHsKMXPkJq9OupMrDVEEpxZR+cBabCIULscR?=
 =?us-ascii?Q?Sd90+jBsanySP1T3bjCrfPalDNtUxOs/L/W5dNv+ebt7hJHxg59Ic+UXCy9X?=
 =?us-ascii?Q?BrgZMywya5jGwYUSwFAgZpC6PkKJaCxSmO1ERzDzdiW6xLWl5WxQ11rvFUE8?=
 =?us-ascii?Q?H9F/6cYpyUUChNJFXynmNIMYKk8m9Yappz5rxsv72Df3U2nhI3eHoBCGu6Dd?=
 =?us-ascii?Q?WAJGsgsJ6gd3a9HPtArXNljvdopDn9BR17BsCKEiQVIV7W6OOCkiZ9pE1s7l?=
 =?us-ascii?Q?oTMfM0MG+xrh/3i18PX5jS9UdRlQU72YhK4hSOWWAXq7lQebGjsYgUoDdqqM?=
 =?us-ascii?Q?VP9uXJniQhpJY/y0D3lqzIiNSXtlvjJ2yhrX8uRmOPVsW+yJ17MNl3/FTOmy?=
 =?us-ascii?Q?25JYjXshDQ0fE7RkhuX+ELPWRXjpZ2uM3bilsHjTQz8aNPtbUAd6IxlVNAHm?=
 =?us-ascii?Q?vTmnIMdF5GKE1pK8yMNVUSkCQ3upm/QUXa6dRgOYwVbHc+YcW/N1zjkPrNsU?=
 =?us-ascii?Q?BUqw/t6tpPq+8e6RKHhhvW0GPxirdRhK2L3KrB109SRxjOUNNDW1WdNr4tfb?=
 =?us-ascii?Q?6ObnCkGT/lAIylN4qVp9ancVCuVOzMoMsj8h/uUmxkOgPUofl8QAaKrZzMPz?=
 =?us-ascii?Q?cPuAQ/BYMPHzayq+GNMycCWFkeHp4ZFi2nOTUfxD3nkGaebTFHdlGnn1TBUe?=
 =?us-ascii?Q?WvCKTsdh1gBbek4+J6+4J0ww/S18wM/n0OPD72Qvg6+33ngyroDXhx1W9sbM?=
 =?us-ascii?Q?BmwrXoub+PcA6bShO0DGD5kUpY8J54JeQyfoz+VyJq/yuYTaie0a+lpX38Sv?=
 =?us-ascii?Q?bBXsH+Q4s30uzZO6145DMlTBqgDlLUYPpGwCzNmxR922BJhpu9ONs9C1ZBxn?=
 =?us-ascii?Q?EU5Dio6/lENs/9oonka+Slm5ct+hHNQF1zwdL9S3fP+X78KaMHkWk8fBf3RL?=
 =?us-ascii?Q?a3QE+mofB6Y/Beo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?scSdFr0trkbZO05nxCtnQ+5XANFocMM788Ucruarqp+oFzj5mbOAngnfX5TF?=
 =?us-ascii?Q?DCPOqkS9U73RrzyD70sxfbf7c6LquE1eFqznzJmmKk+5geOJCBP4i7Rq8tUK?=
 =?us-ascii?Q?lJXIwOBaoOmuKj63B1W75GfKmus5V7QVNldpaVOjI6dj8l22flL6fnSgYBaR?=
 =?us-ascii?Q?t4TensJyrVFahvolsPLC90RnYBkMVkhBtC3KgaTx9qcaj+4Y+n2MH5RyDJm6?=
 =?us-ascii?Q?fjiqepLMWvPS+7frDAU4ncayoYNTPmP4kvvUpu4at1fEzSK5RIR5bJYeeTbm?=
 =?us-ascii?Q?TkOsAGCuOykRK29hB6YJalIw3+0jQcNUB+hCO4VxD8EoV4M4HrTWBBmUIJ7f?=
 =?us-ascii?Q?uGA+r5PmKlxCRj4jy1wppGko2aSymE/pU9mO8WcRBUpMHgDwh2gb9D/KsoqG?=
 =?us-ascii?Q?gnoz6mwxWY/Bx3yHeVW/OpkWjJY5yc986q1bablepg/O7JsozR79c7h9EgJt?=
 =?us-ascii?Q?6+iSl4/jAKzfI5RR4ogetqaotdlHMHp8eGEnk7UQngGXbTJOCSMOcR/+pCqX?=
 =?us-ascii?Q?ILJlZwKweFIrQHqjjEeBvHqZWGnUhnUap05lmEbcQTVq6SUN/aD1Dog7HcFz?=
 =?us-ascii?Q?345OYwuHVAwvn25fOlyEWnklwi1XyJy5pU28L40L4ELlKhUZD47PbnqHa7UA?=
 =?us-ascii?Q?s1ZnOJeXHPulXiNRQHCnIvj1qCQb+QesE4qo3ixSy9+g7v6dyUWiu7F1YVPP?=
 =?us-ascii?Q?rgL7aOgo1WLlzsEDrpv1ixmmzYjEMHXuX0aiv1+Ess+Y/y7D3+vxnOVR36Uq?=
 =?us-ascii?Q?zzJDEk4nESHo8P3EkHTPV7mtjSJw9OoDoagBuABh5UJ8Yx+wnM9rr7OXsTa1?=
 =?us-ascii?Q?o5bEok1brv8pLBZbTKcgzBc3eXxj4idl1aTzILONOpySsSrt9hi/Rw/0Wlv6?=
 =?us-ascii?Q?ejdrQvLiKf3Qxb0Yz05DHwVQLXTvLWTO9+Kvbg8M18wiesZCE62aZk8JYPy/?=
 =?us-ascii?Q?hUNnrZhqmrcifQ6jHZ1ybabGf0znl1nsTDIJ6mBpDkVaoXQNUq3/h5WaYm+/?=
 =?us-ascii?Q?2OhMtGH7crces2J96zANqVi04Nq6IZmORc/tJshnL6/SV/FhlRY6G53ma3Oq?=
 =?us-ascii?Q?PPi/rkldzV6hXQocHRRy3rdaFBpUBO5Mrx0UTnIvw2d2ACc0puBuxq6NzbrG?=
 =?us-ascii?Q?b5QpsZE6AP8Cv4clGht6KcpZbJBF90c8rZPaCc630b2V7q1sFqzDKinB8CjV?=
 =?us-ascii?Q?dChtMwjwBN60In8EIre/HwII6LIm5wqt5FxDWZNyfi30ZheDhKlBznm36u6O?=
 =?us-ascii?Q?G+ftSyhmzFz+DZThthvTFjElHUj0a+YRYNBZV6vzsRcvCp7WYDIlOuPxNcUo?=
 =?us-ascii?Q?95BDE6jAGZMkDI3iemcxezqlf3iIYh8n6YTI5/l5W6PIHO3tBW/YUiN3HwYG?=
 =?us-ascii?Q?3tQYRvWs5QwCPgrNf8Fd4BxWRt99lYeH94nWykphL2qjinUwmEf5DiEKH5wb?=
 =?us-ascii?Q?suRYcrZOnnCtgce0xdl1Io/uDbAGfOstTBVP84lFfjaBBiI+R0QeRzQoTc7L?=
 =?us-ascii?Q?2To7oM5OUSVkVINZkvzleXPQuKPxRHsFg6KzSec8/BM4QMpwaDBhaHJi6HaU?=
 =?us-ascii?Q?HgODhDzFkGC1y8HF20tOuGDW/SNFD4Lho0SZIUsU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f101bc0-5b93-47ff-0dda-08ddeb8c1595
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 08:21:44.8757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVQhvZqShYpduYQSKLKMUENCmqByHZAua0s3JuNi0opgdYCWpxygtIgkhaKNCkFCUebYmzgR5wl1DVI5FMX/Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5062
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

For ternary operators in the form of "a ? true : false", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c
index ea3ace882a10..52dbf6d0469d 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c
@@ -771,8 +771,7 @@ static struct amdgpu_ps *amdgpu_dpm_pick_power_state(struct amdgpu_device *adev,
 	int i;
 	struct amdgpu_ps *ps;
 	u32 ui_class;
-	bool single_display = (adev->pm.dpm.new_active_crtc_count < 2) ?
-		true : false;
+	bool single_display = adev->pm.dpm.new_active_crtc_count < 2;
 
 	/* check if the vblank period is too short to adjust the mclk */
 	if (single_display && adev->powerplay.pp_funcs->vblank_too_short) {
-- 
2.34.1

