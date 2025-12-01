Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEED9C965AB
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 10:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B4B10E22E;
	Mon,  1 Dec 2025 09:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ASxw0RCW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010025.outbound.protection.outlook.com [52.101.46.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BE310E22E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 09:20:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6xqZRR+w+GAwhLs8Lbv3YRATScMrklc1sjayuihT7gcIpHwGCvuySmldNCndTQwqYn+e+4sUvBKzKzcTXKIKXC/HCuVTO/P3Vwr/E8Y9aIMIEKK1e4D0ahEU7uE9C3MUl4tU7W0ekzXDA3ADh84niOA/CjFVnLV17iaeufx2nkGLe5EppSBFj6PPtB69tTcjKLBIhtsaZ8Ib99F6ZIZ1+XgyEnm3la27qJshGhz8ECVWeqMy247fw0I9mGPP057w5+obcz65ujSSkYZ6CG6wFMjUjEBJdoUr3X0tGXXOWqRPpQIybDfEErtQ2lcEmFWnxrLPT66Y+qgH23yBYDxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8mPR5CRXGdC+GCT3JS8pnbhb5XGaHg0GwzpaasRb4M=;
 b=FFR95bCWECLPTagcxd6D4fiK+Vx5F+Xi+Inp3vSOgjBYCt5/xSh3jjorCQBwNW79n+t5dY+4rQJD+uJhlDAezo0RGaperTFXmHVQcYGP0ZuwLqZpRGe+GvpO094QlTD8hxRczDrDU88sG85SjLWqCVBHgwTT0G1cRFxVEA+wn4ixpq3Xz2WVL7hd0R67/yRIDutGcrHVo7PtIg9XgVSK003dWoGqlI4/XxCiqcJFNHLis7ggqQNYzeODKJ6P2/eV8YZYj8CXukefbdy9C2XL7D66ELSqYvA+BjX9AxXftsRIlOHIXEQ56HsS3eoQEWr4GKrvJPIOKLm8UiIEXLTacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8mPR5CRXGdC+GCT3JS8pnbhb5XGaHg0GwzpaasRb4M=;
 b=ASxw0RCW9gtBNBCk5D0enBoPiGFCRdJ6yFzOxE+ziZ3T+3uXwrSXRBn3j9+mS9LCb1oF9qGZm0hmsGvbHnISmTzJDNVZaH+jAmF8K97U3w9GCcKCIVJUfIahiOKIUa7ZwhQfuIJW9kXQ/afuYB5uO+/DtPL4ELNNXqHN1mZcrt9PIHIop/KmTFcnQsDqf9i+Y7GtxAgALzxG4u4WJ6id5iqG6THSHY14V+BOh1WdlIVidTw011KmfX/kWVQjeE8srG5hX7TqfYAmJTNLGC6wpMojGt24/eBm9ybzLCchZAHzqup/j7D7/C4vEQKCZF3JB4bZUSsM6SWinkKxj17yqA==
Received: from PH7PR10CA0011.namprd10.prod.outlook.com (2603:10b6:510:23d::12)
 by MN2PR12MB4095.namprd12.prod.outlook.com (2603:10b6:208:1d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:20:52 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:510:23d:cafe::2f) by PH7PR10CA0011.outlook.office365.com
 (2603:10b6:510:23d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 09:20:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.0 via Frontend Transport; Mon, 1 Dec 2025 09:20:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 01:20:26 -0800
Received: from [10.221.129.205] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 01:20:23 -0800
Message-ID: <f00bdc19-58cd-45a6-a57d-7b7612197c71@nvidia.com>
Date: Mon, 1 Dec 2025 10:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: heaps: Clear CMA pages with clear_page()
To: Linus Walleij <linus.walleij@linaro.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
References: <20251130-dma-buf-heap-clear-page-v1-1-a8dcea2a88ee@linaro.org>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <20251130-dma-buf-heap-clear-page-v1-1-a8dcea2a88ee@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|MN2PR12MB4095:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a4a39b-3955-4bb5-e315-08de30baebe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emtLQmV6dUhYZWl6QmVqU2dtREtCcVpnbGs5VGpYV0xqcHZXYjhnSnAwdk90?=
 =?utf-8?B?Wm11YlV6bHdLYTh6MlBxb3d5UFUxcFNPejBIaE1RUkU5eFU2blhleWM4Nmxk?=
 =?utf-8?B?eFY1YmVnWmdNZk1rR1RWbzRqLzlTbjhETzdubEppazF2RmFoOHFOT0Zid1VD?=
 =?utf-8?B?czJUK3cxWmk1WkU0NXIyUmVNajFJbGFnUVFXaW5qdmhtN2o4L2t4Yzl3cmY5?=
 =?utf-8?B?dk9rT2VyN2hWeWxkSFhBOWdwZjI4R0hjRHoxWTMwWTEvL0lEZDh1ZVRIbDZ3?=
 =?utf-8?B?QXRCellGQkU0ckRWRmlheHVhWXlLbk1icjNudkpobStRS213Y0lHRm1XWHpa?=
 =?utf-8?B?eUMvQjNXMk1vYWRHVTBERHNzbmJzcXJXaG5ZQ3ltN0Zub0FaVjQrZUhJS3FY?=
 =?utf-8?B?RzFpZU1FY2N3VVpNVDdZeHgvdVpRSVd5U2JVYnJlRE9nZFozZkZBZHJhTjBr?=
 =?utf-8?B?TnN2YnVDRC9SSXVMaFJRQmhDaVBWRlcwcUhLV09QSkljQzFMR0F3ekxXYU5M?=
 =?utf-8?B?STVLV0JhcVo2SXRPSXdyYzBGLzJvSDVIeksvT1p3cUpHQlA3QUMzdXl4YWxu?=
 =?utf-8?B?d2ZYT2xNd3lPWGkvQlgxc1BSNnBMQjFwS2hQL3lsNVdXbmlTSjFMS3pkNmVV?=
 =?utf-8?B?b0pBN2NCR1RSelowMlVBbXdGa05zdC9obFQ1MUY0eTZicEw0ZTQrNDFZUmJI?=
 =?utf-8?B?V05abkNueEtQYW9vaVVaeVV3QjlTVjdEcFlBcWlpSThXZGFxa1JzamR6NTJM?=
 =?utf-8?B?SHphNnFRcjhneEJwZmVZWTB1UnZUQ2U5elUwbXZWbmVZSnY2Y3JEZkNDRzVz?=
 =?utf-8?B?cXAwRkNQN1kvR0VtWTBTeDRSeC8vMW1jLzBnaEtsZWRRa2dXQkloRUhSSDdS?=
 =?utf-8?B?SzR1QzExc0JONFQxc1laREVScFVTVVdQcksxekRBVlJocVZpT1hBUllhdk1C?=
 =?utf-8?B?b20xK0RiVWozRWw5R0I4VkJsNlNuVXR3V005bForYm5QalRwcDhBbGRwbFdD?=
 =?utf-8?B?dFlYK2QvbDFzVlVKSGJTdHpMMUNpSDRmd0VqSm81c0wweGpzb2JmUndqSmZS?=
 =?utf-8?B?ZUp4d0ZLWkhaL0hYK01KOFZ6dFRtMUtRSzhEYXdDRDc4cXlNYmR2SCtKQkwx?=
 =?utf-8?B?T2R0enNjTDN5RFdBcGlYcjJpQkJqbzNiemlWOCsyUXVrU3ZJdXN4dkFXL2Ra?=
 =?utf-8?B?ZDVWU3k3QXFpRnIxZFpOZmQ5bHNqWCszcVA4SzN4blVSL2NocDlCVUxiUjI2?=
 =?utf-8?B?VHI1aFJ5VG05Sm1pVDhSUWNRN2RaN0lWSVc5R0NTdDV6bm5VaExJUS8vaUxH?=
 =?utf-8?B?TmQ3ZWhBMTZ1MXhSUi9lR1lhMG5CbkZ1UDV4K2FCVStUU1BiZHJBVXVIblcw?=
 =?utf-8?B?UmpJaVhQWUExTTZQL0hYcHFZeFFGcVJGTFAyRTJYQWQxdkJGbEtscjJsM1JQ?=
 =?utf-8?B?Qk9jOHVkWkJQOURsdDRzL1UzOG92dXEzV25raUlpcjBJUEpFdUVxQU50R0NK?=
 =?utf-8?B?SGxMQlpORU1DcGJaSlBHMTlydnFQN3F0SzJrVmgyRWtZcHR4aXVRY1NXMjNH?=
 =?utf-8?B?TnJkZ3RVOHR0MDlNRFcvUS9HS3UzU1drOEdaejVvTmlJRXI2Zml3VTA5K0Q4?=
 =?utf-8?B?NWR3VlBsY0JaUncxSVIwdXNiTWFpMGZCUDl4ZzdJY2JOWlBGcjNhb3pUNUY4?=
 =?utf-8?B?Zm4vS2RxMVJROTNrb3pyT3VWcUpJSER4WWJ3RXJlR2lFa1U4VlArcXFDSm1F?=
 =?utf-8?B?QWRUdEhZMGxHYk9FSzJjcHE4WHVmSkxidGN4a2pGMjhGMHd6SnAzaWNOclZ4?=
 =?utf-8?B?VEgvWGpNaTBwUUc1NklYZjBDb2ZtSWYyVEZsQ1BpSnJvVE44TFNxUmJnQkNF?=
 =?utf-8?B?bWRnVEsvVk53eWpFYkNycFB3MXlTcVBHS1pnMXlyNExpN1FNK21WaTRRc0pE?=
 =?utf-8?B?SVdzemdvZDBUekIvZjBIdkcvK0NzYWFuK1VJb1lBZURvSW1VNmhJdFphTitn?=
 =?utf-8?B?YTlGaVRXRU9yc3RaanB4Q3ZDNEdQd250ZU1CQ20xd1Z5L2NnK1J2V1lsZjVW?=
 =?utf-8?B?SFppN3c3d2NZSE1aMWo4bk5TKzBhakltbUl4MnJMZkxiSVVqNmJ1QzRtN3d2?=
 =?utf-8?Q?GNMM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 09:20:51.1791 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a4a39b-3955-4bb5-e315-08de30baebe1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4095
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


On 30.11.25 11:54, Linus Walleij wrote:
> clear_page() translates into memset(*p, 0, PAGE_SIZE) on some
> architectures, but on the major architectures it will call
> an optimized assembly snippet so use this instead of open
> coding a memset().
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Nirmoy Das <nirmoyd@nvidia.com>
> ---
>   drivers/dma-buf/heaps/cma_heap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index 0df007111975..9eaff80050f2 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -315,7 +315,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
>   		while (nr_clear_pages > 0) {
>   			void *vaddr = kmap_local_page(page);
>   
> -			memset(vaddr, 0, PAGE_SIZE);
> +			clear_page(vaddr);
>   			kunmap_local(vaddr);
>   			/*
>   			 * Avoid wasting time zeroing memory if the process
>
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251129-dma-buf-heap-clear-page-248bb236e4c4
>
> Best regards,
