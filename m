Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC44D200D6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 17:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7F910E595;
	Wed, 14 Jan 2026 16:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K2j/9HLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012002.outbound.protection.outlook.com
 [40.107.200.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBCB10E585;
 Wed, 14 Jan 2026 16:05:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utALMFP830atfSQhzJqQ2GTJe2fD7mrZbLtANXiSDxPPhTqMUAoEZ8k6vny88zmQF9gG5eEqM6LmG44ILiwdbRKWH0DHCKlDtLiA/Z34OSOXmTRj6OC8dmD1wavedbpdaVyplrvxEFZi/H93QyRzcWBOQ5sEcme4UOh7jDoj7MmU3kwNzSXl7wL7OUMlKe/5GpRMOxowwugHnXK3GRBq8rTQSYmlvZjYwuOb8I3pqLiAMxY60KH5ur9JHQefF2tfPyswVIQEzBtlBDOOAX2uojqERe+bl2gMa23UOkUCfYXN0kVTf8w1psHu1UcbdzyCLEeJcFL4tk0ieHtm9OgJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAcYq4qHEecpl89LkQjJ/zWrzFvhqTuXZ1/Oi6c2LKU=;
 b=t4EPyZRXAkNOBX7yQQEuTHgmzPDLP2MdfTfEzXAZjW1+BmRkb3qVis5kkmpMwt4phRcOTLNI+/ItkuLEuAoirSJJxy5J5muAOc/zjDJkTySNXySGv8zGlMhRNaQY4RNqTVCvje6ruYeCxeFfwwWweG5XHbjbOlbNNqvfIRZUEtkqlrEP1+NX5205pRFkqgp4s6ualFLdYrbMi9Kbo6YiV2VsfBa8hMnXr+Vgd6RioiyisQ0E5CBrX/kml648CsDkcq80ORwm4qApdckr8/g9ywUK2F/Vek8UV92OgEpHWBEWrUQPHtj7X6HKIRlfY3YTRkUEL602d/HEhIHK243VeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAcYq4qHEecpl89LkQjJ/zWrzFvhqTuXZ1/Oi6c2LKU=;
 b=K2j/9HLnyceczvCihshirtu4CO8rYHAW3Pj1ZcQiqcF5Fk/Lz14QguFl1H7cHudW0KC6G91vEX8wcqJDAoFJm2MNJExZXtZVLXPGRjdstTyoKJZOG1p3kEvubWhGgGCju5Cf6A7/EQyrwby+7h8/lb+VRN2UDOu7wtBdITOM4/ndA8+BadLf4IlYnRk5HsumzM6D32Fxek+t5Jj2/T92VU+wplDIv/YorjvfEqy3CkfN3VMGXsgEEYzzKHROE/AE1zcouPDnRXUQc62x4OyWEhgscfu95hYMmnivSCK5nNm/codwAWQF09YEw0dTIAcd0BMNKN34MXUZqZBN1OAeUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by BN5PR12MB9487.namprd12.prod.outlook.com (2603:10b6:408:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 16:05:17 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 16:05:14 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH] drm/amdkfd: simplify svm_range_unmap_from_gpus()
Date: Wed, 14 Jan 2026 11:05:10 -0500
Message-ID: <20260114160512.831773-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:408:f6::27) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|BN5PR12MB9487:EE_
X-MS-Office365-Filtering-Correlation-Id: bea6736e-03e9-488a-296c-08de5386b404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zxUgCkOotdtTO9SL45rUW1t1hlZcq9nHDGjbQIGSV6FCcfFuG7NS/nr4vD42?=
 =?us-ascii?Q?ZijOWIIIBjc0qc+4BPiXQKCkd5K76pXk4bwkKx2wjBqeUTUnpAe/AVR2cjMW?=
 =?us-ascii?Q?UuBGbhoNmaoas+9QyKRO4Xp5AF3+Ze0oVK4ihpRjiiO9NAlBIbB56rYYL44/?=
 =?us-ascii?Q?3d5F6i9taiPbXDmVV9QvNA0Ks44vB+je8gnAdAvQ8DnCjxW/70pgDYAqFr2C?=
 =?us-ascii?Q?ENaWuBBVL8JjB1UH7SXGlbnAkKL7hOP60E3l+7AkPnOqTwPcwAVgW9OmmUFm?=
 =?us-ascii?Q?wrJGgR2GPF5LP7p9Y4se3aewvU6pJOBZhT9qU3wSeQSqHkrMvGuUv2CaZIxl?=
 =?us-ascii?Q?VHc64QEW2fAstuXlDoJz7qhU1K4ZAphQYWuupcoOyYj3Y/dwp8WPylFZ0Rx0?=
 =?us-ascii?Q?JmCVriV0JWrsGBTEIlbr/bqA1g3CbkRfPQIq1UneeXLj+Ol00NQygsD7cZDe?=
 =?us-ascii?Q?ZBFQy02h9DkSmsroqYU9vCJh3ZuI8S5XXx9DA/n8+iGE8web74suNiKNkRmF?=
 =?us-ascii?Q?xoqOkqlWjDc69kAlARLzWaIrqsBOVE7+nllNuKazsKTFf7PsPq7lJtcTaNlS?=
 =?us-ascii?Q?TRpemZwMJmG6+II3G0Hjgva/KuFl5HPh8PlLQOcqwpFoXPFrxXLR+8lhHdC6?=
 =?us-ascii?Q?CZDHkDblls+8XkwpHAMaxxcYUhI1sumxv5mge6Cio8KChcLDUL1R+8/8g2w9?=
 =?us-ascii?Q?p8A3esYjaIr/HuADD7ZlLHBsNYEIcKd4icChTb/fCVejUG0wBWxescWC+CrN?=
 =?us-ascii?Q?I42iviuwRpjzpKJEUWY99jGSklWID2ujMfEOv/WZtTdXLKjts3QkesHH9yXG?=
 =?us-ascii?Q?+FKavW6Dg7eClHyRiyJ4457En9ouSZG2Bp+s2i4HwYq+1rpMhoC9uzQh4UI7?=
 =?us-ascii?Q?ZJxNfxHZjv+PJ4GNyQkS87shL21+fpfdJVJ7jrcxkclGM2AqFzGB4I4yi5m9?=
 =?us-ascii?Q?y180iav9vU0T2ePImjTIN5XmgDcTMttnXdWl75QeVzXtkxRDgPrGtVmbdb2c?=
 =?us-ascii?Q?5ovy6haXlaiPZBdgB93jWuTx+cv9R4B6m6sUp7N0YFzUMlG02BvNIO0/oN6k?=
 =?us-ascii?Q?PZmqmP1hU9m1GttT0598lh86Zg2DkkudmbPBvKOmXBwnUTbEbEdZZUIXZjmg?=
 =?us-ascii?Q?QoKfkM6CPAXU+nXqiyRfDVNiZYNSg6c1O8F6uB9E4d6AUoOY46N0bffK4dui?=
 =?us-ascii?Q?a+J1A7l3aWwvxBCkUSFZkE1mwid+41C91qWzTbqXgcjZnRfkZAfTVrPxyemd?=
 =?us-ascii?Q?uRbSy9a+ptnUxmSMVnTnG01n5oTSbbzDha7Nz55zbeoKjkEnYrQOXpxga28y?=
 =?us-ascii?Q?NDr4zQPr80g0EQ3ESoCSs/kO/XYSvONAd/22a7LZ0bhiRlFIk2Sc3J9BsATp?=
 =?us-ascii?Q?aUL7nucePWj6g8nchxhQ+WKB0kc8wsvzBqPVmL0IiYTepXDmyZF87/tXYpHI?=
 =?us-ascii?Q?P2YVHWdNHEFfvJZO7Bh+zT+svXYGtqzWTsaXi50Z+IXySYv7Yk4qTKO+kRjv?=
 =?us-ascii?Q?Vl8TubrUzM06j02ijxeu6gk1Pdd91y0RIdQfCpzIyLejYmM6p9YdfEYZlS7A?=
 =?us-ascii?Q?GN2Lwt1lwQ5FOBya6so=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8800.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1I2zAEu97slNn+U8u70P52S4z0XZljEh7l4fy/kdLeeLAUeqKjiPd7q5Mt0f?=
 =?us-ascii?Q?a5w8RJQjlbHXazGxR9T2i8aFFEXXgw+q/aiA0OlqqgeItawQx6b6P9GfoiLX?=
 =?us-ascii?Q?cbQlluciEls2trqDU2Gi/RI3IdSm29D9aqRq10Uq5VkvrenpHH6/R3bkw2lU?=
 =?us-ascii?Q?r7/XwE2nmOlC8N10tH73hRlI8iR4LuHSTtvUabt/VxthDEKsCejR1w+DPSWc?=
 =?us-ascii?Q?GTnociEdHB6Mf+wbGFY7xhfhB64dWRxn0YvYyouSZu56ZS3o5/H8osOKiqS3?=
 =?us-ascii?Q?r7sJ9aYOTyU82ck3LeGgk6Hy11VvLgFne7LqUP1hA1Kmp4PEONsCz9z2sCxT?=
 =?us-ascii?Q?YrYKsVvufuKiLDSjDC2fhOlL38NzCLI4FmFEW2Afp6chwmttvjnTjBH6Xrm1?=
 =?us-ascii?Q?Xd7BUZCnT3R4SCkdLHeXWjOGWQm/4IEQmiXclPvjyKkGlSd87lttd4lBY4S5?=
 =?us-ascii?Q?tihWuoSs6NwIAnWir0I9HycXTYiVeqSfSBUEtRxeghJCxiTck41XmW/BPaFb?=
 =?us-ascii?Q?1qLa0NnBWgjzDFFHbAu6Qluy+ZSwnG39hQhBYjjWHMcJia07FfQ5PoijhM6U?=
 =?us-ascii?Q?rQhqRdSrlYgcNfVxf6zcbkQiJwwrw4ET52PljssV8Xmmcpm4pgjDezjOu4ZU?=
 =?us-ascii?Q?TV3EoZiVUNLwmF0Lx/cgV/tCuHnnYA663WXqesYW4utBfc6q3Q2AXwv59Xi4?=
 =?us-ascii?Q?fmbdC2ojzRiYBvQ8Cd17w/o2UlqZ9v/gVxVLRX767hTvdvpsTZo9oAAOqhfx?=
 =?us-ascii?Q?dnqZnv5rwCt5GfLv2o0V5TlvXZ2WkSLs9DHPPvUPgzdjZCTYQpkCEbn6oSKj?=
 =?us-ascii?Q?pNUVRgGEx/VcIG9AjzIqgTpD6VmG1qeOcJpItmVdc64Fy4oDy4m8UibzjX17?=
 =?us-ascii?Q?zJ/fA/NkjwMBcC4jRgtU29nsYbSlmkbe/6Tq8IJowqyceCx30PD4zuNrhpBP?=
 =?us-ascii?Q?jnhXchc7hCmFW0uFYsf6vjv3kEGDAU+lku4GQiZoBjyZbW3vID0Bn+olq0y6?=
 =?us-ascii?Q?yehP7gL9Ff3sAZvdAZgTUPwxQV4DMSBYVlxGHPLyl7UxM2mThahekrNJVge5?=
 =?us-ascii?Q?U5mLUfOYyKQK8nqilYYGVxDWEw4vUjrgS183X5I86ept/jBbzG0uckC1WRKG?=
 =?us-ascii?Q?mMhxsEtu0qlVG1uHae8uFcydRgy+2kTXpgq66d0EJrcbHN63CnLJ6NW1VVWR?=
 =?us-ascii?Q?zPXvpgo/J7Rsbp67S2LzXD+6Gq9zZBDSHZlMh6EI2atEkW4r6+uqiI2S1rvK?=
 =?us-ascii?Q?6sqShlL9kwmbrwr762eJ/aCI3qakz1goNrAmEbyXYSfvuS8LpjL1idPjSol5?=
 =?us-ascii?Q?0ifUZmWpLR1N/aCXQy29PjxVdKg2pBaqcHvNeb+dcdP8Rs2TxEzSe6XdVRtv?=
 =?us-ascii?Q?ISpJNp5/UocwJnOsq3mx0WV3dYIa+EKjou8BRNhjOdp7pEkGiMe90VLe/oBs?=
 =?us-ascii?Q?Mg23Rh/QIIfnw//tqDA5K31quQdx1dSzjpj21upLhld7GRgczimk5g1qatwN?=
 =?us-ascii?Q?v3Jr/veLrDaSAW+cDsBEVILQDVDXluQkASD6AyNtAEjow95h7MDd2in5qsPr?=
 =?us-ascii?Q?KUXm9GSiKVey5ZeJ1QImry7nolf7AqWpWVS4NOOS3M223nl1mXMODRHmZZmO?=
 =?us-ascii?Q?YY28OGEI8kCf557bApBQpzZQjm+7cTYkPM7V9GxJJWN1WucYI5Ft4XbLHi1+?=
 =?us-ascii?Q?a5KIBer/TnAC3m/364tzxmTwJj5IIalYKq2LFwfAv9PqdmBQ0I9SnZnvuVHD?=
 =?us-ascii?Q?oA+8YYVAZ3GRFgmw6FLJxT4MT4tNQ2mY0HK/zk1udzw3KJwOiX1U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea6736e-03e9-488a-296c-08de5386b404
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:05:14.6353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvpzr+PrtCUp7ED0ny/tCYNrPkJg+HJNjlhki0ogGdZMr791FXoRngNjUcopeyKZv21XlXmMZnXG2eOm32LmPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9487
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

The function calls bitmap_or() followed by for_each_set_bit().
Switch it to the dedicated for_each_or_bit() and drop the temporary
bitmap.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 79ea138897fc..eed76b13d191 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1344,7 +1344,6 @@ static int
 svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
 			  unsigned long last, uint32_t trigger)
 {
-	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
 	struct kfd_process_device *pdd;
 	struct dma_fence *fence = NULL;
 	struct kfd_process *p;
@@ -1362,11 +1361,9 @@ svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
 		prange->mapped_to_gpu = false;
 	}
 
-	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
-		  MAX_GPU_INSTANCE);
 	p = container_of(prange->svms, struct kfd_process, svms);
 
-	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+	for_each_or_bit(gpuidx, prange->bitmap_access, prange->bitmap_aip, MAX_GPU_INSTANCE) {
 		pr_debug("unmap from gpu idx 0x%x\n", gpuidx);
 		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
 		if (!pdd) {
-- 
2.43.0

