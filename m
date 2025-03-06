Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A96AA5537B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDB210E2B2;
	Thu,  6 Mar 2025 17:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EPOhhgxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8CF10EA47
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:51:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ih6kqY5191M/tMI8ZaljCJ/XVq/Me3/30NCF3XcOaMI5fivHFBwdCG0hWbGCS1KV74b5KzsE/vcmVjLu6GdaJCRGFQ9diNOSZQojAXTD2K8aUf3U1aHOPauFbzHA+JYmOKsuIVj8yYFfww3VB2xJMMQGqnlRjnPNCXQwib4Iwec1kLr3FAPc84U3FRKzHk3DGCdVAOIfVv2wClb2XyXuO6149AF6pxXFp4kzn+bmhaHBioylwvwKl3qlyZnrZYHzL5iYloDaOklE13tl5eIyHikc98eDMMsbUz1TwNH09AMFEhYVfkP2185AIyYkW1ab24CI54D0GgFvkAgyitROAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTzNLBZyyPL4eqhQwHQnPL0Qa7fGXBizscwHseLztYc=;
 b=W8Lyu2TjqCaouNgNna1DruRxmhLv03AK3VMlm4xenGqsSkqa0HVQ23tGu//CaWzcysr6YdLnEn/hMl2RgEI9at/8DKizzf19/gijjnA8LV7ODtSxqHmZl4x/05qSH2QwbUyE1/l1hulIfGdx+SKPki4W0VkxRW6jZHBBqzIivL7hl1EARXuoa9DRymkEbrFxUMC0UUB+vKU3aBvt8xdLVzpCUCpmpnbU7uP2ZlRjDqc6VDGET0c9eisPk0BQV9JAF9lb2bEal4v5PnM50jxFEt1Y9FeWDs3L6hfY9UDnjZEHLDcHC6taDTyGzoLAnYq+7m1JwCjDa5eElMF1e8q5iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTzNLBZyyPL4eqhQwHQnPL0Qa7fGXBizscwHseLztYc=;
 b=EPOhhgxRfBJSEwoUJuBz7So1Lwhe9CQ27EbSArbdaY5hRa52c+BAmcZdT8XXPqyCTWTrFiJ2gX8dq3k7H0PqtOhZlFOF51NItSY2eOvjrPUNgN6hvOxlAjbEhsmdN8r0pGV/6vGCLX5MbKw143uGTvh1EVuIhQeHbNoGeLo2Y8s=
Received: from BN9PR03CA0564.namprd03.prod.outlook.com (2603:10b6:408:138::29)
 by MW4PR12MB5601.namprd12.prod.outlook.com (2603:10b6:303:168::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 17:51:43 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:138:cafe::48) by BN9PR03CA0564.outlook.office365.com
 (2603:10b6:408:138::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Thu,
 6 Mar 2025 17:51:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 17:51:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 11:51:40 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 11:51:40 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 11:51:39 -0600
Message-ID: <554638b5-314b-b0cc-5b91-2cc635f78f7d@amd.com>
Date: Thu, 6 Mar 2025 09:51:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/qaic: Fix possible data corruption in BOs > 2G
Content-Language: en-US
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, <quic_carlv@quicinc.com>,
 <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, "Jeffrey
 Hugo" <quic_jhugo@quicinc.com>
References: <20250306171959.853466-1-jeff.hugo@oss.qualcomm.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250306171959.853466-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|MW4PR12MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 7382f517-746f-42a9-42a4-08dd5cd78d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHlRd0E4VTd5VXRKa0lZUk45K0FZS3o3WFM5TUNrWHNsM0d4OXN0L3VjRE16?=
 =?utf-8?B?d3AyVmNhMjdtdGgveGJpMWhPdkFQYnZFSzczY2JBOUVLTHoyTjZRMUcwU25F?=
 =?utf-8?B?NzNUVVdsV01kTk9zN0ZjZ1pPUWlTKzBLRHZjbERWd29xcEsyblZQcWZOell6?=
 =?utf-8?B?L0Q2WWFvd2hJZk83QWhESyt3ZUxkWGx3OWJOSGZUUWdabldNQzZCY29aaGhI?=
 =?utf-8?B?ei9FSERFbWVLK1BBWVpEYWsvbTdiOGxLRWVocFlEVWNWTFhmWHMwNDRrV0tG?=
 =?utf-8?B?cVVVRnpKcTFHRXBDTnF1TUk3QmZxMC9aaTA5ZnErR0lxSVdNN0JTQ0hVeGxL?=
 =?utf-8?B?NDI4THpuRzkwblpFZkE5Nnk5YVR5RlUxZ3ZxY0Fqc3Q5VlhBUEwwaDVtOEEz?=
 =?utf-8?B?c1E1Q3Y3Z2FFWXZ3V1ZHVThhZm5PRWd1Mzh4cHY2SWVmelZydUhkQWFqZ1RR?=
 =?utf-8?B?L0RlZnN6Q0FZZWZJcnZMZFNsc0tjdHU0VGtDbFJid3ExNytKbDZjbVJTWGNQ?=
 =?utf-8?B?aE9uYWxxcEdkZTZtWTJBM3Nhb0ZBbHB6YWJzNzhzdXpLbU1QbGF3K3YyM29i?=
 =?utf-8?B?My9UTjVtbzFPeHFGN29jVERaNDNYdW9zRmVzVjVVVUxYaEc5b25aMHQva1p2?=
 =?utf-8?B?RGxwd2lzUzlyVFRUVExET3RNOC95MTIxczZJS3hCV1Z0ckZQS2xhV05Nd0Fj?=
 =?utf-8?B?NU1hNVZXNmlsWGpaVVN3QlpRYng2eklUMHlZWlo1bjc3RTRlRVpQdUtOVllK?=
 =?utf-8?B?cDRwRlRoWVNuVEh1SnFINnNMelpyeUt5MXNDTHVOVDYzUk5PSk5nSllFdE1k?=
 =?utf-8?B?ZVRsWUxEY1FZaE44RVdwNytjZGJBSExSR0x2WTUyWG5xSzlEYzRmWXR4ZjlR?=
 =?utf-8?B?bWREUzNSaXQ1NGdlLzl4cXBuQmZZSmxtZHM3eDVvd09zK0hDb09BaGdiZ1Rz?=
 =?utf-8?B?bUVnSVhRUHdHSENhNmdHa2VzWG5BRzdpNXgra0FQeVQydHh0bE5RQlBSaUZO?=
 =?utf-8?B?NUpWVXlzaHlXVFFoc21zdjRrUGFOaGNrN29UVjFrdnlhME5GUzdLUzlmYWpx?=
 =?utf-8?B?TDROK0lkYlFYdUZUSGdjSVBaZWhqd0RDT1kwM1lMNVAvY2RlNEVrRDhQQXlu?=
 =?utf-8?B?WHozclZ5aHFWVUM2UmR1TVo3blludU5BVXR6OGpvNk9MNTBSR1NsOE9tdXc5?=
 =?utf-8?B?aEVEM2xMZ1hyTzR1WUJaaUtHZUZrWXcySmtkOTlFQ2E1cnN1VWVCNkVCTkpq?=
 =?utf-8?B?Ykcwekx2V3ZiUnFUdEZvamE5MGhZeGQrVWdqWURHc2U3Mnc1ekpZd040U1l4?=
 =?utf-8?B?T0hkYzdwemdneGNjVUhlWFlOZXdUTGN2dlkrYk5NMG1Zc0RUelMrT05sRUVR?=
 =?utf-8?B?WXhXcjYxUy9rUksxYldSTnNrSzZLUzVPVWpTV3MwV3NvTlNxK0RLS28xTXFX?=
 =?utf-8?B?T0UyTlRaZW9VSUFRYzRmMmhTQXdqOEUraWV0a3R3ZTNOTStZRExWeUxjV1d3?=
 =?utf-8?B?WEpoeHNmZUVJKzFCellPV2pTZVlTYy83T0hUazcwT0N2aVY2QjJPcXE3d3pT?=
 =?utf-8?B?MkN0N1dJcitTYlBka3JOTTlaWlZVWCtzWlI5bUMyQU02Zkc5SEhRUTVtVVZw?=
 =?utf-8?B?RDZ6Si9jOFFzSk5pNi9lZ1JIQjZ6QjdMQ0RHOEMyRUh6VzNpS0ZWT2JSRjJK?=
 =?utf-8?B?eUJJMVBHTGR0NDVORVNRazBlOElOd3BrcTRpWURYVnRla1BUMm0ycEM2N0hu?=
 =?utf-8?B?OENRNHVFUURtcVBYckMzdk4rN2F2QVZncEJ0SEYwNjRBeTZnYU1rQ1NhVlNv?=
 =?utf-8?B?eFl1V0F5UUtIcE5SczVQcGcwQXc3NUVqdzlBVjBrQUdERGYvZzRoUHBLV0U0?=
 =?utf-8?B?d3VOTDRFUXljbmRVaVF1QTZhZTJFSjdzWndEZWFWNXVpOWg5UlM5a0NrZmFY?=
 =?utf-8?B?dldhVHVFenh6K3lPRlEyQk5pdm5rYU9zaFZ0YTZFdmpobnFkWWVnR211Y0t0?=
 =?utf-8?Q?BqK1JYDvTyQoqOCejdV/IXfZrNO4UE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 17:51:41.1042 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7382f517-746f-42a9-42a4-08dd5cd78d1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5601
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


On 3/6/25 09:19, Jeff Hugo wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
>
> When slicing a BO, we need to iterate through the BO's sgt to find the
> right pieces to construct the slice. Some of the data types chosen for
> this process are incorrectly too small, and can overflow. This can
> result in the incorrect slice construction, which can lead to data
> corruption in workload execution.
>
> The device can only handle 32-bit sized transfers, and the scatterlist
> struct only supports 32-bit buffer sizes, so our upper limit for an
> individual transfer is an unsigned int. Using an int is incorrect due to
> the reservation of the sign bit. Upgrade the length of a scatterlist
> entry and the offsets into a scatterlist entry to unsigned int for a
> correct representation.
>
> While each transfer may be limited to 32-bits, the overall BO may exceed
> that size. For counting the total length of the BO, we need a type that
> can represent the largest allocation possible on the system. That is the
> definition of size_t, so use it.
>
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> ---
>   drivers/accel/qaic/qaic_data.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index c20eb63750f5..ffcdf5738d09 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -172,9 +172,10 @@ static void free_slice(struct kref *kref)
>   static int clone_range_of_sgt_for_slice(struct qaic_device *qdev, struct sg_table **sgt_out,
>   					struct sg_table *sgt_in, u64 size, u64 offset)
>   {
> -	int total_len, len, nents, offf = 0, offl = 0;
>   	struct scatterlist *sg, *sgn, *sgf, *sgl;
> +	unsigned int len, nents, offf, offl;
>   	struct sg_table *sgt;
> +	size_t total_len;
>   	int ret, j;
>   
>   	/* find out number of relevant nents needed for this mem */
> @@ -182,6 +183,8 @@ static int clone_range_of_sgt_for_slice(struct qaic_device *qdev, struct sg_tabl
>   	sgf = NULL;
>   	sgl = NULL;
>   	nents = 0;
> +	offf = 0;
> +	offl = 0;
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   
>   	size = size ? size : PAGE_SIZE;
>   	for_each_sgtable_dma_sg(sgt_in, sg, j) {
