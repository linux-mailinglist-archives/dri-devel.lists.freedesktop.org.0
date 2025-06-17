Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96292ADC1D6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 07:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A45E10E426;
	Tue, 17 Jun 2025 05:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LQ+ynNqW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD7D10E426
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 05:37:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qq1gcIrj4TZ99EQsduraTb0UfLLb2zFRCXfOW9XudOO/hsZkZtFqSAzdjs5gC1k4FjUbgOGUrfQ+I9/QaYvPPaKMmHHacCoEX2fApQ5RzX6I0Mcnd7/NLbh9TU79zDVjyIoMGEyioqKq42NzYz5aJcB8x9bMjwhyhaj5jfBrb7z/3/BwrzLV6Vkb4FuBpJa5LskHBvoqV1MELdFsnMOAepePSr5L/ICG6S/IGh0v7xXj+NHw+NXdGantRSHVm98w1Rnqcyjjud/prmkCwdTlp9dbyKwQ2M0ii1xBvZPqgg5UloLHdinhWzgml+w4wJz96PzVhfDv1RIjwhAslDT+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUapABDFkHeNJIlw0Mk3dOPyzqvJ7Mq6dVZo7Gof7FA=;
 b=wDDxSmRTGjYsWSGNF+Dj7KuDkR4A2h8/NLXyOHin8ZGYVHgd0kK5jeJTuSXkRMjRqxO3GiIA0KEctTMNgRxEd3rNOjorPOjisi4dByc9As20IGPVqTYU0TV1zKeRtbSHzOQMEz4CJY/plgegumQYZJ3GgcV7YLjRbkOgTZnGzVX/LdBHOir+Pmo07UNTv5JGRIlv/qigJkfCZIydQu8Lkd6K7sVdUl2Scbr1O0Ow97920oud8/O5BmgdOHte8GDPzGdl0EgvVDnZiJzYk6XeHVQ714pS37abCNH6Iye6xcfmIHVK0Zdb95+fpo+92D0Dgia6VruQXqE7s3+VNeWfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUapABDFkHeNJIlw0Mk3dOPyzqvJ7Mq6dVZo7Gof7FA=;
 b=LQ+ynNqWv3WhMUf0j8DeX3OQSkvvHn0V4dNtnbqG2/Gp6jIRsFrQXGSlxu497J3Q9O2NiRZRKVtxvZa7W+Nz9ZM5qWUtkUg2ACK92rYGZiV22zI+y68M0lME1i8pXVnK+K/U0HAKe+4shV14endY4j++0PpEgJ0Ia+jouQhRt7o=
Received: from MW4PR04CA0073.namprd04.prod.outlook.com (2603:10b6:303:6b::18)
 by DS0PR12MB6630.namprd12.prod.outlook.com (2603:10b6:8:d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 05:37:17 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::58) by MW4PR04CA0073.outlook.office365.com
 (2603:10b6:303:6b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 05:37:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 05:37:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 00:37:16 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Jun 2025 00:37:15 -0500
Message-ID: <958b71f4-fa5b-6aee-df9b-0b4b35c2fe0f@amd.com>
Date: Mon, 16 Jun 2025 22:37:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Revise device bo creation and free
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
References: <20250616091418.2605476-1-lizhi.hou@amd.com>
 <3e8e19f2-29dc-4644-82cc-85aae6b2598d@linux.intel.com>
CC: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <3e8e19f2-29dc-4644-82cc-85aae6b2598d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|DS0PR12MB6630:EE_
X-MS-Office365-Filtering-Correlation-Id: 005bb1b8-5f8c-49c4-317a-08ddad610569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlIzUnhwUWttWDhpNWlENlo5UWlXczUwalRpM2lQa2I5Q3g2eEJic0l4U1Zv?=
 =?utf-8?B?S011bURNZmdMTmp3RTFESmYrWFJjUk8zSGFQRmY5cmI3UVA1U050QlVWdmd0?=
 =?utf-8?B?TjJxSC9Xd0ZXS2lhUTdsdHc1YnU1TDk4UzZRQURlT0Q5eXBseHQ3SWg4UGJP?=
 =?utf-8?B?MWJoOWFkYldaQVN4Mmd6cGQyaEF5N084TFRGSVc2S0FRR3gzdCttNlVpRW1C?=
 =?utf-8?B?TFkyTTdCemsxTFVFdWROdThuZTgxQ1lsUEpaajRsR09ZRW9lbHk0VzQzWVVs?=
 =?utf-8?B?OFBVTVBiZU9jSkNEcnFhcDVTc3dwY1pXTUFoTDd5Q0lhK1gzdmtKT0dndUFJ?=
 =?utf-8?B?RDZYVG53MlUwWVllbjZTYzNHbWsvWWNBcmU2ZTdBT2xBQ25CYlZmT3MxVW4y?=
 =?utf-8?B?ZTllUjV1d1VoOUY1c05BOXF6R3hEWU92Z0xJRENoL0hSeHF2UXJORlNiTVlI?=
 =?utf-8?B?c3BCTktVNGMxNkYvSFRLTUd0T29aSDRTU2Zja3J3UlJ2cXNCcDljWExzYVVK?=
 =?utf-8?B?TCs0b1VDdTRrMUZrTVpBUGtpeDh5VkdUSC9yYUNXN0lYWEZpUFAwMFhNRyt4?=
 =?utf-8?B?R1BwdElMVXVtVURaTWxBaEc1QWs5bm1xUzZjSVdnMnBtVVNzTHgrZ3F0K3lr?=
 =?utf-8?B?ZmtoejUzTHM5WDVkdUhRSGU0dkYvREtLYWZWcDBLZ1lXUjl2VkY5WkRkakJK?=
 =?utf-8?B?aXN3dUdRbTY2YVArMk9mY2hhMGdTaUZCU2s3Zlo5Y0lKcEl3N2E5bFdVZ1Ba?=
 =?utf-8?B?L1FKSk1BR1A2Mnk2K0dsWHRwRmN6WUNWZFh2WjlrRWNBZnZSUjJzTnVRTnJw?=
 =?utf-8?B?Vlh5WlkvZUFseGh6ZWMxS29qcHlwVFZ3dUw1cDZ6enJ0QXdjdlJMZUZXaENa?=
 =?utf-8?B?NU9ZQ1NLUlVrRWg3elMzOHg4TGVGT1JqTjkrOVcyOGNLMVdTemp2cXQ2M0xm?=
 =?utf-8?B?TG93Z0U4MEFsWnpkeFlhMEdpVGV6MEorcTNSSG1Nd2ltU08xWVlpb2ZEWGI1?=
 =?utf-8?B?ZkY0ZmpSS01XaTB6SUcxTzhFY3pab3U2ZGpJWnR5UEJ3QlNvRng3dThPN2Ex?=
 =?utf-8?B?R25FQmUvOTdpejBPaG1zTXkxZzJTTVBXZjJ4UjJpVjZUamNqMzBSazFGc0tx?=
 =?utf-8?B?N0RPVUh1K1U3OEdocnA3bWRPUjk2Kzh2bmNhaWt2S04xaGxpbS9NRDZvSUE5?=
 =?utf-8?B?LzhweGhnM3BEekNzSnR3VkE5SUdiSzFDOC8xTEkyeEVsSlZ2eVpqK0hhdVk3?=
 =?utf-8?B?Y1N2dGhLV0pOTEM0Z0VUYWpJQjB3cVZqZ2JSSERZVUxvamY3WFBnK3o4Njc1?=
 =?utf-8?B?dnBSQnpackMvcGdIbU5sSDFOWG1hbmJFcnRvdkZoOHlwMkI3TFlaaWFiMytJ?=
 =?utf-8?B?UEFsUU0zUUY2Q25XQ1NmcTVHbnVjK0VmUWpjREpLbFp3NUovZmQ3N1pGcWxN?=
 =?utf-8?B?bUdlQnBEcUVwTSs3c2w0S0VZdW9aaC9iekg1QVE2dXY1ZW9zNUREdGZ4ZEwy?=
 =?utf-8?B?QWZPSDFMa25xRHlvdElQL2NSNy9tU2NrSG9xWUxxSjEzQnZlbWx0WGxaRzBh?=
 =?utf-8?B?K0Z5eWpiMmlMVWkvZzR0cmltWjE0TDlaYU5BWFZKaDRWMzZhSks1WmtKVmJP?=
 =?utf-8?B?L2pHVW04REdZckc3cnpjOWpRei9hVEMrR3pBWmN4bzdTeHBGL2NPV0lYdFE5?=
 =?utf-8?B?by9GcVZHTGQxMFZORm1TaXNmdjRhM01vdWpXRVdWS0l3L1JZa1liVndzSEVL?=
 =?utf-8?B?a3hicldnMzRjbTlqd1FDU1ZMcks0RmFKQzZHcG1QS2tXWmxScXdzczhTWjdS?=
 =?utf-8?B?RGVmaDRSOVp1bVI5RWs3MUVYM0VsVGxJd3RqZ1dxVk13RFhwUlFJc3E3MXZx?=
 =?utf-8?B?b1l0dnZ6NzZWSlNXWlp2aUZURDZldEd0M011cC9iOVU4YVRPSVpjcUJBam10?=
 =?utf-8?B?Q2xMc3d3UVltQUFaYzVyMWw1TGZXOVhxdmJHcnJnOE82cVVWVzlnQzJQQVRC?=
 =?utf-8?B?b2FjWTM1SWNRUFZWRVJlNWN3NklOVWtHY2gvdVBBMXZORVNIdjM3ZXJrWFUv?=
 =?utf-8?Q?TUi+0P?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 05:37:16.9344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 005bb1b8-5f8c-49c4-317a-08ddad610569
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6630
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

Pushed to drm-misc-next

On 6/16/25 04:30, Jacek Lawrynowicz wrote:
> Hi,
>
> On 6/16/2025 11:14 AM, Lizhi Hou wrote:
>> The device bo is allocated from the device heap memory. (a trunk of
>> memory dedicated to device)
>>
>> Rename amdxdna_gem_insert_node_locked to amdxdna_gem_heap_alloc
>> and move related sanity checks into it.
>>
>> Add amdxdna_gem_dev_obj_free and move device bo free code into it.
>>
>> Calculate the kernel virtual address of device bo by the device
>> heap memory address and offset.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c    |   2 +-
>>   drivers/accel/amdxdna/amdxdna_gem.c | 193 +++++++++++++++-------------
>>   drivers/accel/amdxdna/amdxdna_gem.h |   3 +-
>>   3 files changed, 106 insertions(+), 92 deletions(-)
>>
> ...
>
>> @@ -855,10 +868,12 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
>>   
>>   	if (is_import_bo(abo))
>>   		drm_clflush_sg(abo->base.sgt);
>> -	else if (abo->type == AMDXDNA_BO_DEV)
>> -		drm_clflush_pages(abo->mem.pages, abo->mem.nr_pages);
>> -	else
>> +	else if (abo->mem.kva)
>> +		drm_clflush_virt_range(abo->mem.kva + args->offset, args->size);
>> +	else if (abo->base.pages)
>>   		drm_clflush_pages(abo->base.pages, gobj->size >> PAGE_SHIFT);
>> +	else
>> +		WARN(1, "Can not get flush memory");
> drm_WARN() would also give you the device that caused the warning in case there may be multiple xdna accels.
>
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>
> Regards,
> Jacek
>
