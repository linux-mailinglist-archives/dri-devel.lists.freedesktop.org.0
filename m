Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3513B0A38
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FCA6E107;
	Tue, 22 Jun 2021 16:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A7F6E107;
 Tue, 22 Jun 2021 16:24:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4SaaVtXKYmmNVm6lFFfZQ1Pf0vT8dq1r9pBG6wgU4NnHIfJVqeIqDnTxxS3G37lLdnREgtRc7+5TiKUhjAx8yJwjGNWGfYFs+dqz9wHkhWVcXdl/wpxbIQWTUhqXWGDU4zKUlHdI4Ii5n/hlKu1j0jYFJn5T/5C6uozk59cKwfTqNVIWB/pSOwm9d7oMhAj8p1xVqpVk3+8mJVD0wKt/pJa0LiCWIn5koiipW9mGK33qEPfi1icHl6ZmDXCTiLC4G2ouX/2IVHZmqavKZh+FC4N89Y+W2nOe7OL5AowSjbsTZOsxVT8F9YOJiA8XYcC51t1XeaNxbRBbXZ8CcUM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeq3lPKpic4GpmDjUD2jzgFHSzvPxEwBEV1xsFKCcIY=;
 b=exy5ssp/0JWXqDeovR5ee6ceIBaAWf8fUNarcwF3JPDduDVcUaltCB6vhYphYHdibh7Xr55tcn/dgrQxN1lkZfwF5CR6qG9wKifuvd0Az/rcVjPrKbHHFOy8P6sX90yuftm0SMuaye5a+/4KXJQYWpnDk1OT1hw9+tPNePUhBSBDzAdncfPthX3ltNNfbRFo8Vuv+tfnBpLcWJ+o7Eq02EcR1Y2wjRNj9nn3cMxQZxnM3bVJW5EAJPnBOGGFPYmIXQ0VGt9jgGarnG2RFOBD8ZMepvWGclTmxWy+m3dWdODbJu4BjbeDsYlgJBHFq9St7HvgNJLBPxea5OarG5p+UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeq3lPKpic4GpmDjUD2jzgFHSzvPxEwBEV1xsFKCcIY=;
 b=hFZrPbXhA8FTF54Y4kH+hke2q3pQEVcGwDDsCdqGwCvEvo1DLJX8yAHQmyWW8nCF810tsZB5+9UOBQ792SWkGYA1BYbdWp/6cGCPU/JcIedVUiw3AEN/XO5x2zJwlKoZRk+LYbfxMChaENAn0mtyny/K8Z1wWsasL5CZinJKWu8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 22 Jun
 2021 16:24:08 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 16:24:08 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
Date: Tue, 22 Jun 2021 12:23:34 -0400
Message-Id: <20210622162339.761651-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:5c6b:dde9:a4fe:685]
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:5c6b:dde9:a4fe:685) by
 YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 22 Jun 2021 16:24:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a79ec498-aff4-41c3-d186-08d9359a2905
X-MS-TrafficTypeDiagnostic: SA0PR12MB4399:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB43993F96BA3BFFE804D0F125EA099@SA0PR12MB4399.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g4X4yJkgkyBznOOHc3pW6fusIWob1tJuvP0Zsq0TTB9d97CAVTmDHMBGjxGRsiq+o5oOc4Cr2d2oO4ujHlPDc8tk4GDRIU36luZ1RAZBPVf1ii5lSc1sHQ2JidQ1NfdmRHBi8DmB4aCuL0rhthz4WK10m0ebum5jRjdJEW7zFkb/W8LH4MHI6c/mZLGAO4lsZ5HeIRoXd+MG0k21AGXscRSahxzh+ZEpnjkrUKUXDgvhwMv2dQAdc8Gb+DOGtg1O7qsFZGamwRY9WG1lUhMebnmvPIOWKWhDWs3hMiC9h6ZUtlxSXhrZ22d9OuEHF/NNr9ShTj3S6QLTVcSK0YKJZgahfqF3JyHhxeczngfuM1Mx5YevEzqSr5h/tjvicoZqlEncFnF1pTEBGAz2Kcy163hL2jOebsCRChcaLXAzp+4g0Lfm3eftERsaiI6XLUtwUmdWT67v2MUTfNUcOiZIHmn8aOsrnDNSYEkKqC0hpPNnN1a+7tdOhz4rmBpRnQ5h4m7NwV1fexZhHVAuIhHGWroQw6/UfiIu+4rUri9SZIuAX0vBQ4JKkYqqEr6Ezd0JnKJCXW9YoK3Su5AUq+RYFb6BBKHHnZtwhtcKRE9Dors=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(66476007)(66556008)(66946007)(2616005)(44832011)(2906002)(8936002)(8676002)(5660300002)(6666004)(86362001)(6486002)(16526019)(186003)(66574015)(6512007)(6506007)(83380400001)(1076003)(52116002)(38100700002)(4326008)(498600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmY3dHVod3VJSkJUaG10V0FURnczRkJLbEFjQ0ZSVzAxQWFocFlMd3F3WWtn?=
 =?utf-8?B?NHEzbFhTZXlvNHBPUGlVc09TUnhXdC95b1FXcWU2c3ArWTF6cnpoc3k0Tmlo?=
 =?utf-8?B?VzJZK3I4VVVqN3lCSkdnc1hwd0dNdjFueHlUc0tjT0ZTMTFGYVY4L3MxL2g2?=
 =?utf-8?B?WFdHRlRNcGhTdmZpY3dDWm5QTk1Mb2QzdEtQSHVWa3RGT2gyUDdjNlI4Y2dl?=
 =?utf-8?B?YWZ0NkgyVjNMWll4STVZMk1DMndCRHFsdkt3V3hGcHJ5Rmp6UXg5dndTVDJo?=
 =?utf-8?B?cEJETnpVRzdJaVZxdy92dlJrSUNpL2JNaXlPUkkxQmRxclVjOEZkQ2FMSnpJ?=
 =?utf-8?B?NitoNWN0cVRvMWpqZGRxMzB1WGhYUEtsZzJ0WlRDcE9ZNk1Ycm4zdlVFeTNm?=
 =?utf-8?B?Vlgrc056YkxTb2o3enFYNHBTRnFRVkRXMkNtRDc2ZTYvTjBUUzVPUEFLSTB1?=
 =?utf-8?B?WTFxNHJkb2hXdnhidDFwNlI2QTdYMmZMU3d0eVVOV2dQc2JrVjhUK0g0N3cz?=
 =?utf-8?B?QmxOZ0ZLZDl4aUY0MHdHOEtqNisxVUJxOUYwUnRkTjhySnBudkFpY2laZkJr?=
 =?utf-8?B?cnNHdlhVdkJjcW80VWRoSVY5b0Y0VWFhOHlpTzNpUHYxTVJTczc5TU81andK?=
 =?utf-8?B?MUpsb2dwNWEzSzloVGJQZStjMkQyZm1VWEhBUHZsWkJmZlJYeVcyQ09YSTlw?=
 =?utf-8?B?aUxJVlgzRFZGS3RHOTZsdkpxSFcya3RJdUtNeU5KaEtJb1UxRDZEQ3pPYW5m?=
 =?utf-8?B?RTE1UExpSDE4VG5hMkJjd2R1SGJmb1lGbmNYMmVmbXJQZWdkU2xibTBwT3Js?=
 =?utf-8?B?T2NJU2IxZjVFRU9YUHN4ZkdzT21SNG1nSCtQUjBkZDZKN3QvREVyV1d5T0dF?=
 =?utf-8?B?bit6K29lZ2t0T3pIcEVHYk9iUlFadUVhMnlyd2lDTTl0Q090cDFCeWYxcmVV?=
 =?utf-8?B?dUJ0Qkt4YThHRS9yNzJTdzEzTU9jWkFwUUowYjZ1VTNTdHFTTDdXNklhUm5J?=
 =?utf-8?B?VTlDOVR4ZkQvOGNrNzlmQnhnZHZRM1o5d2pxeW1tY1hvVlJiQ0hQM2JnSCtr?=
 =?utf-8?B?a3dCUHA1ODgzWEc4blNVVEhxc1VNQ2pXSDlsMXFhZkd3VXdrcXJXNUU4SVk4?=
 =?utf-8?B?WHN3WkVtUnVESExPREovMmI4bmZ1elBOdUg3bXRtOHkrL29UMTFVYWZiQ0hJ?=
 =?utf-8?B?dWVONE5vdmJsY3JQTEFVSTFXOW1wV0xTTVJWQytPays1NFNNQnJCY3IxaUpt?=
 =?utf-8?B?QkhNV2lMdkNCc2g2QWRqZUladDNGcVdiNGQyNTcxZzdxVUNjNmVrOFkzbnBD?=
 =?utf-8?B?MTE3YWptWVNKSHhTRU9EMU9BWjh6cGRGbzB4Q1hidlNodGplMm9DWjhyT2Nm?=
 =?utf-8?B?Mms4ZWFYa2tlNUNzWlVPRGszdUUrVWdzSjNPbWVHMTNpSzRjaUFLWjAvUFlm?=
 =?utf-8?B?UGhoN2RtQWR5ZDRYSXdGUkdSQ2lvNjFlZUhka0VoYmtzakNVRVpMNEs5VmJP?=
 =?utf-8?B?RXBCTnp4TktJL29VVUJjOHZSc25oYzg1Q2JQbjByMkVXVm4wVmtPMERJQWhk?=
 =?utf-8?B?Y3FobWZ1cWtnRGtUUVU3QlphaVpDMmh4R2MxdUp6SDgzSWVKZHhuWkJiRXIy?=
 =?utf-8?B?MWVXaDcveHU0SUVqUXNKcFdORWt5V1JXYWtERlB3akpadXR5M0lHZSttZ0g0?=
 =?utf-8?B?MHB1MmJQb1pLWDBzZlZlQjBGTHQxajVDcHVKUUZxV1RJUGRuZ2V6c29NOS83?=
 =?utf-8?B?V05jQlhjVTdIMkordzJxWGhkTk1aLzY4SEp1YWZYR3UwbWZ4aUFiUHc2ZFk5?=
 =?utf-8?B?Si9JWHJqbUhFOVFtb2pxMlZ0M212WjlPdnpNc05HVkY3WmZWT3RPeDlYRkk2?=
 =?utf-8?Q?8X9yzQErLdJfa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79ec498-aff4-41c3-d186-08d9359a2905
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 16:24:08.1597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJGLOcKiG2JIKgCNa6891UrNx0B20UPdlg7W7xPCtpX6vLO5Z+zD2ZyOjK2CdaqKQ0iBfYMKihAkJZS6YI6Wyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399
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
Cc: ckoenig.leichtzumerken@gmail.com, Lang.Yu@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lang Yu <Lang.Yu@amd.com>

Sometimes drivers need to use bounce buffers to evict BOs. While those reside
in some domain they are not necessarily suitable for CS.

Add a flag so that drivers can note that a bounce buffers needs to be
reallocated during validation.

v2: add detailed comments
v3 (chk): merge commits and rework commit message

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Lang Yu <Lang.Yu@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    | 3 +++
 include/drm/ttm/ttm_placement.h | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index db53fecca696..45145d02aed2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -913,6 +913,9 @@ static bool ttm_bo_places_compat(const struct ttm_place *places,
 {
 	unsigned i;
 
+	if (mem->placement & TTM_PL_FLAG_TEMPORARY)
+		return false;
+
 	for (i = 0; i < num_placement; i++) {
 		const struct ttm_place *heap = &places[i];
 
diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index aa6ba4d0cf78..8995c9e4ec1b 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -47,8 +47,11 @@
  * top of the memory area, instead of the bottom.
  */
 
-#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
-#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
+#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
+#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
+
+/* For multihop handling */
+#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
 
 /**
  * struct ttm_place
-- 
2.25.1

