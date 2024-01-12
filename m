Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E720782C718
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 23:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E941910E120;
	Fri, 12 Jan 2024 22:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6E310E120
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 22:19:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKoV2r9DnV1Q8rnpjIP346xLfgAxQ7JvTVGMNrmSzyrfJS3O2Ag+pxUjigaxbuCLnKrZRc0zjiiq9hDmYFXdG8PAgwdHnW7JOPbxeQGXSw8hJiafchdnnCUrjA5feLpHOgiMKMihfJCzVdQ+4lVA3+Vszi1Cf5LraVa7wmytwuRbQh/gW+WM6LXvX6NQbypfWx1ZvQ+SP1yq3zmmpmrSWQVL8sieQ+xEeCwHmPIHkVkRt2B5IglgbBndFgUUXJX0OnMzq46YiaIfJfTtnTCEiruU85Y9okiyU4su6ttSf3vmvO/rbzhRR4CLKRGKTjFYGpYavA25F0Ay9vOVrIY1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoXbFMVZTxo+U44G6CAai2y0SRdTG7p5sEZWVlkHfzw=;
 b=WumOnJ8FQuyoUOkQcwpyYVp9LIISNznUWvBVaXUdPFx08/a0GyK+zcq9OfL2ve6IGBXp98lZMlpdUM3zWCQXXL10xcPVCQFUu8kDGYYZiCEmIXyRP0epjBZmDVLXyj6mpabGKY3QgFlUDSA7AGUziY5/qB2KsUSNwTF6yN+JFr1h6C5gix0nub1cSBlkLZ4s8OMVd/KIIc/bLHeSV/BV/+jajxdUBvYmzmckF/J2YuKYBMbM61qMOFc0Jr2EcCQxwbRPzH0aMseZ5mhVK1jp8lE8NVChxZ1csIEZ8exvtVDLD87Vg+Qvy/jHJge12bdAHHYXPTTHsvHKIUsfqLbghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoXbFMVZTxo+U44G6CAai2y0SRdTG7p5sEZWVlkHfzw=;
 b=m6Mgc9MhE80DELsVFWhY94jRagQulMGgjFp99nPBZAkTiw3x+fuwbH3ef5vhkOluqrp0IMxuSkPuiZ7TgcWihGLC03/M+aiBxumFjutpOERy6zLXS1EAeH3jj3tiTcT7s9U+19zv5VKC3f9Jzs93eajMx6KiAYZvvT+lAwfErCZcl+0PWAYC6ad2QUNVGOYSX+HIsnrTC5U30TPSXkoEdVKBs1QNHZl8gVClaIBeL74Z3EN0ZUTNWN/yJelnoqP7ye+x6+fQCviZliAU3U5ilyo1qe7AEKtpS4CQi5WHCudlV+WrfaALrShOVyWlZbjk/yKhOtmdAk2sp7EVRhdL2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 by MW4PR12MB7014.namprd12.prod.outlook.com (2603:10b6:303:218::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 22:19:03 +0000
Received: from CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::7aa1:70ee:5030:b0df]) by CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::7aa1:70ee:5030:b0df%6]) with mapi id 15.20.7181.020; Fri, 12 Jan 2024
 22:19:03 +0000
Message-ID: <1e3fc8e3-f1bb-44f4-a205-a56684459b3b@nvidia.com>
Date: Fri, 12 Jan 2024 14:19:00 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
From: Erik Kurzinger <ekurzinger@nvidia.com>
Subject: [PATCH] drm/syncobj: call drm_syncobj_fence_add_wait when,
 WAIT_AVAILABLE flag is set
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::30) To CH0PR12MB5122.namprd12.prod.outlook.com
 (2603:10b6:610:bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_|MW4PR12MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a49d76-f960-42e9-ebb3-08dc13bc7bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Eti9RpsTiCpveH530FFF6hZctaOn3BMETLFHx4jFeXwtsLGjVr6xGvtECInhocTgPEtHpdEKFkyPNEKYxqG+F0BuXwUR63AMeoULbAVMCjvuJphSGddPQy/kf2Av+bMi3+pc135QIoalez2DHRz79U2Ifew6XzTi2WUWJjSZgf/7iMnycd3YxlipTodQS1N26Xx+ot+CC7l1Xz7ZUpfxGo1Nh9GHAGy0HMVClkrWvqI9XJJ6D/L8B1ysuLL6JFGXUopaP0JLm/v+5vSlFTy45JsW+IRWHUs5BxL0YMHHInxScKyqpigcOoe1TK0LCLK+2aLGLBIBl7LrWL8duGBwdJ9vIzPHdJ2sIp2TnD05tsUsa2vXrOic4tilUNHFPMjXv9LvjMD74R6Oj5UQ+jNhnZlIhYbi442wI2pHAOPGotXuhquDr0oEcSuJllaDzzsCchdNIIwIgW1WkknfcQi3bfhPpvFIWNsxgiyxcJQhhzF42kt0arZtxwNxqxh8Ms4lPh+LZB+wIdjsKSiccNv9hqpXbks8pGEd2MbYo+Y9T1PJsSLVXcO9Vs6PUqQVcS/Xq4Gi3oeeONKDDQ0aEB1Cj25d5A1jEXw9F7qBI+ub/6OSy+iumCsuWrvX9fFae+rMxJ1F+WdsmWFfBvALQ7/e6c3mppS3Tql3BuvdqisYulajZNjke8CsSgqs61XqX1R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5122.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(396003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(86362001)(83380400001)(41300700001)(6506007)(478600001)(966005)(31696002)(26005)(2616005)(6512007)(4326008)(38100700002)(6486002)(36756003)(66556008)(6916009)(66946007)(66476007)(8936002)(54906003)(316002)(8676002)(2906002)(5660300002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0FnTEl3ay9sY0V5Tlh1Qy9oVlRsQzJXTGJkZzBHdU5MeWxwazBXNitVSkx2?=
 =?utf-8?B?cVQwcUV1ZEtUTmdhVFBDUUVOQnFFYTNvMVFVQWVJTVR6dHRSbElIeFlkYmJG?=
 =?utf-8?B?WVJ6ZzRJeWcyM09RZC9YOU8zRHcxTE1IS2drbkhjQ05VWVY2VWxpTkY4R0Ja?=
 =?utf-8?B?YzRQQ2puaElsWVBHMnhkQTZPY2VRV3lMSzQvc1g5Nms5cWFZa1ppdEZobGd1?=
 =?utf-8?B?UDlEQ0psUm04TnhhTjg3MGxmUnRqYVZlMXBlSjhQbEdEcDhKNmwveHJQOFNV?=
 =?utf-8?B?UGwzeC9WQSt4SWZIQ1hUb2ZjOFNjUGVWb3ViUDBxd2tGRUM3cFQyWE11Z1lZ?=
 =?utf-8?B?R3hOS0dOd0RBdXhLRkJHR0E1cWdEbG1aRVpxRzdDQlR2L2gyZDFFNndLcVJx?=
 =?utf-8?B?YTlZSHZPam1xWDVyUDBqNFJEczFVZlRjQVl2b1dhNmdBeW5NQVZoK3ltL29Q?=
 =?utf-8?B?VU9sNEEzaVhhUmFiVkkzZVhxdmZaVUJ0RGY4ZjRPUFovWk9xejBpV3R3SkU2?=
 =?utf-8?B?aHZJVTdQWTF2b2NUWENDREJhTUdFejJwcGdtYVdScDlHeDVFcmhTSGhncy9I?=
 =?utf-8?B?MHlORGZOSmRwQjc3S243Tm04czkyL3ZCNmdxYnlyKzVPSEsrb205b2pBN2ZN?=
 =?utf-8?B?bmY4ZkhuTG5SSVNjdmw1VWZNSHhnT1JBREhIVElFbFU5THdOVExYYnNoaGU4?=
 =?utf-8?B?c3pvSUs2OHpNd2hvclVNMHU1UlhjTXJHWFZEU3Npb1J2TllpT3ZVai9FeDRu?=
 =?utf-8?B?RlMvVGtzWEsrbVQ5UjFRdlBDalNtM1dHcGNjS0dYVUpsWHluZmkrM3RkVDlY?=
 =?utf-8?B?eEUybDVJa0VaQnYrSHdvTDRDc09tNFdUT3ozMWV5b0RidDFkQlQ3cTBSbW9H?=
 =?utf-8?B?UXV1M3NDL0xSS1NoZWRXbVlzNk95RExKc3RadTd5b28rR0FRUG54NXpGS2pk?=
 =?utf-8?B?N2JLcmsxcUVEdTI5MkZFd1BsNXdBOUpEbkxyemFCYXRxUFYxSytpZjg5UXZm?=
 =?utf-8?B?Z00vd1ozUVRLZU5tNDNIVlpzZnNwb3lEQkp2VVNVeEhSNjhuZmZsUEdFWkVl?=
 =?utf-8?B?d1dYd2tFTjRrMFBzSnFtbTFrRGxaTEh4UGsxWlgwR2RMajU1U0NoaSt4NFBy?=
 =?utf-8?B?WXkxUVNiSjZDR2xGd1kvNFliTVpBMjBBcGR0c1BKcy9zTFY0T0R5Y0xRRnR6?=
 =?utf-8?B?WWdiamsweU05N0U5d1pBSm1LWXdZZThhQmxuQThKU3RIN0ZQYmVHd01nNHRq?=
 =?utf-8?B?dlhLb0lPMy9BZjlwblZ6Q1RsUHlBRkYySjFHNnVnMnorWGNjUDdOVnZUZXJs?=
 =?utf-8?B?RkJ3UzJpOHhmdjBCL1F4bm1jOEZiVnNxUVN5dWg3WEM3eU1qRW9nNW1DRDBl?=
 =?utf-8?B?bUl0TnJoQ2hHUVRrWVE5WlZyR3VkUS9MbGVwUlcybFhNMEt2NXJaOFJYMHl1?=
 =?utf-8?B?WDVuQlI5TmIwT1gyYXVrUDlGTFhUbmtmOHBSVS9QQmxyNnl0dHYrUTg2bEZL?=
 =?utf-8?B?LzNrUnNMS2N1ZTFJQ25pdWl6NG1iTER6UGRUaU13eHVQQm5XWEFnakRDY2da?=
 =?utf-8?B?UkZEMDlEVGdDdGo0RzZrQXdPTGE4M1g1V3FQZnlYeGNGUko1cW5IT0F5WXlt?=
 =?utf-8?B?cEtoNFNQaDdZRVUzOHF0eG9JVGZmVXg0SDhqeHJMQTNCM0pzcHAzcGNEM28v?=
 =?utf-8?B?dkJCR0ZzYVN3YklkWEpoZmZPUnNxMlN6VWVJVGFqejFZS2RLN3h1U2RBMFB4?=
 =?utf-8?B?Q0YxeEVmMGtWZVkwZkZjQ0VEVmlSL1Q0eCtiUlprM2JrQ3A3MGFicEZwNHcw?=
 =?utf-8?B?ZHI3SHprVEhTMExOZGhnMmYyU1FEVml0aXo1ZHZFRlZpUGpESDhqbE93bCtu?=
 =?utf-8?B?KzZaSWdEL2k5YTB4MURSb25HZUdOdUZ2eGRBbVFLcWV4YWdhcnQzNThPeW9H?=
 =?utf-8?B?Q1p3Qlk2Mkc5LzQ0dFJsK2JrcDNCR1FFUjJhV0lvNTRaTUlwcW1rTzRpc1B4?=
 =?utf-8?B?YytmYTRVNVVmQ0d4ei9RZWJOazdSUUhsWUFmQkl4S3RuOGFHTjZMYUtHNHpU?=
 =?utf-8?B?TjRSNzgrNi83TFpYZWxVcFVJMlIybWUvU3FxWXRUWlhPRUhJekdQcERmeW43?=
 =?utf-8?Q?hDRCLIDdT5xtCicGF79Ivpu0v?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a49d76-f960-42e9-ebb3-08dc13bc7bd6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5122.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 22:19:03.3874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7h8iZbFcAn+MWOOdvU9YWUSp4inSyzfnEs7SYGMEpRjhU1vLMZndNsyjndXyWGUhyokxMKILFGiU5kjn3kqFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7014
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
Cc: Kyle Brenneman <kbrenneman@nvidia.com>, Austin Shafer <ashafer@nvidia.com>,
 James Jones <jajones@nvidia.com>, david1.zhou@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When waiting for a syncobj timeline point whose fence has not yet been
submitted with the WAIT_FOR_SUBMIT flag, a callback is registered using
drm_syncobj_fence_add_wait and the thread is put to sleep until the
timeout expires. If the fence is submitted before then,
drm_syncobj_add_point will wake up the sleeping thread immediately which
will proceed to wait for the fence to be signaled.

However, if the WAIT_AVAILABLE flag is used instead,
drm_syncobj_fence_add_wait won't get called, meaning the waiting thread
will always sleep for the full timeout duration, even if the fence gets
submitted earlier. If it turns out that the fence *has* been submitted
by the time it eventually wakes up, it will still indicate to userspace
that the wait completed successfully (it won't return -ETIME), but it
will have taken much longer than it should have.

To fix this, we must call drm_syncobj_fence_add_wait if *either* the
WAIT_FOR_SUBMIT flag or the WAIT_AVAILABLE flag is set. The only
difference being that with WAIT_FOR_SUBMIT we will also wait for the
fence to be signaled after it has been submitted while with
WAIT_AVAILABLE we will return immediately.

IGT test patch: https://lists.freedesktop.org/archives/igt-dev/2024-January/067282.html

Fixes: 01d6c3578379 ("drm/syncobj: add support for timeline point wait v8")
Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index a8e6b61a188c..a1443c673f30 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1121,7 +1121,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 	 * fallthough and try a 0 timeout wait!
 	 */
 
-	if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT) {
+	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
+		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
 		for (i = 0; i < count; ++i)
 			drm_syncobj_fence_add_wait(syncobjs[i], &entries[i]);
 	}
-- 
2.43.0


