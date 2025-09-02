Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7275DB40C31
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 19:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE0510E7FF;
	Tue,  2 Sep 2025 17:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dX5QcnD0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DBC10E7FF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 17:37:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6uVqgmoHeQjetAYWona+HC2phqk6TXBaxnxd8DPs7LDv4GlVtBNNhOyEqyacGwVGnFMtdZj7FVI0OgFGZBu4aCLTDRUIyQs4IBT6MFnNZ5Sq02bITuw18NtRmjvQax8QuvxuWSpzSLO79F8mY6/3UuXabu/v2aXUv8dRpNqGtFIr/aqPRj0mp6ZMnUYUKKLIBj73MYkdDXMBfaJ3t7HNH7bPRLmS1tvaYosGCV5IsLbuE+/O9YXt6T5d9CnLCOtJ9qT17Vu2wUJQDGNIut2BfUS1xF+qd+GdmgqVyTvbq2DxUG8hFB+Hjj3TG90golgI4AalFyjm4MsnGo1uahGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IKrIJba5ZM7zqJzldH1x+8JxOQnf5GlpUTLhGdGmys=;
 b=h/2yBnPWFze6rHRlLYdVKNJpNhbpYwZW30jrKb4znoopK3u9Mqub/uG4CVvom3lVbTJvIA80NM7RTCPpjk3oWv1crQRDqJiS7sJfK5vzsZL9XhF6gMPVIRjjjFagr07EEVYC3yPqpS32nfD1LIx1+Pvzx05DrV3Zg0IUn6HklWlA9RsCZe9/NfVqVTFs5POT7dIkH9Pq2lAfZQF+l2UvT4s2v+DZGaQ9hFPNqzGUSRufy9WtzoJQbcFBwHg4PfElnhzd/nI63z8zjN1o+O0MUyeBUx03P08AHn/UFeYDO88tXnM1gEs1l59LWdmj71Zs6mtn5eHmyVNdp8fk2nPOeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IKrIJba5ZM7zqJzldH1x+8JxOQnf5GlpUTLhGdGmys=;
 b=dX5QcnD0tTttibr5JKLiaR861GReeKZCiDGEpRzC/VPuWVm2IPc+OnhNamUrvIG2RFPn7oBXRwCtMs0uQkh8p//JNSkSjxOpCeK8kmVKPtpzdsYoHM1v9uTfqtKai7px2MMaGfnlDN2aYwvm2A7OiWlJsPTv3NV7HH/vyP9SsjA=
Received: from SN1PR12CA0101.namprd12.prod.outlook.com (2603:10b6:802:21::36)
 by SN7PR12MB7956.namprd12.prod.outlook.com (2603:10b6:806:328::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 17:37:42 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:802:21:cafe::8) by SN1PR12CA0101.outlook.office365.com
 (2603:10b6:802:21::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Tue,
 2 Sep 2025 17:37:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 17:37:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 12:37:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 12:37:41 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 12:37:40 -0500
Message-ID: <9454cfac-f546-e34e-f549-d912e8dc846d@amd.com>
Date: Tue, 2 Sep 2025 10:37:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Content-Language: en-US
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20250827203031.1512508-1-lizhi.hou@amd.com>
 <5b4022e2-d31c-434e-b68d-c2c166981c8f@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <5b4022e2-d31c-434e-b68d-c2c166981c8f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|SN7PR12MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7c6a40-5d46-4497-6840-08ddea476b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjAzUHRlU3d0S05maDJ2Z1k1cUh4ZExYcnJaMWs2dllueWt0OTdiNzI4bGYx?=
 =?utf-8?B?MWgydGhvaktQdFFsK2wwdk9XUVJiV2x6cUNRUzNjUzd0N1dyZmR3d3ZqTU1D?=
 =?utf-8?B?ODZvSVdJM1FiMXpZcFNGdzdpT0NqQkhMWks5OEVaRTFQS1lQMVo3VVVjUXlU?=
 =?utf-8?B?bFFiNFd4bGdySFhJZFdndm5lRk9nNEFVL1JPYlF6ZHJwYWxMTWl2OThqTThp?=
 =?utf-8?B?eHhkeGJvUmxhbzdtUVNqWjhTOUt6M3NVWnVmeG1nQzBMMWhJMVpyOTNFay8x?=
 =?utf-8?B?SkxrOEI4cXJFSDllNDdZVW40WmdyZlZBbWU5Y3E0YWcyNDNxbjJmeDJqRVpW?=
 =?utf-8?B?Zk9tLzFUVlQ2K1RaMUN1UVU1MGZYV21Scnc4ZForenVINVZjSWdBQTI3MWYv?=
 =?utf-8?B?cWovM0hKWEQ2NFlGWEI3WHBTMVVlbDRtUHhSNkh4QVZ0dmNreWpMUmZIMnhv?=
 =?utf-8?B?V1V6dUdIWWg5d3c2ejhDN0VFZWo5SXpCSHVseU5zbVBPSUVtMG5PNEsxemZ5?=
 =?utf-8?B?Q3ZPTVpPK3EwNGNxdWRFZ3AzUHlLYjE3aXZackFjWU96M2hTRDNnMWxSeTIz?=
 =?utf-8?B?ZWcxRVh5cEFpVnMrbHpJUXF3S2wrSDJoWW1yeUkyRHc1R3JJemFFZ2V3Q2Ry?=
 =?utf-8?B?a2ZxTkMyM2FGOXJuazRIMWJjaDRlZGNVaWRRYk5RYzE5bitFL1Zvem9LUU9R?=
 =?utf-8?B?YXpjM0VvcmtRcmVBMElTNFhmSm8rVjhCSTFqYUt0cXczTGNGSTc5Mm9SZG52?=
 =?utf-8?B?czdYdUZmVTNZUDRhZVYwODNBbzUrRm9mRHBtWmg0ek5RVlFWV1hLU0V6R2s3?=
 =?utf-8?B?ZVhqY1lPQlRucTVacUNkMjJRekYzWklicHUvWjZ0UHNiUm1TckYxRmI4NlVy?=
 =?utf-8?B?bW51Mm5VOXF1WTI2YlN6dGtPM1JpRE5mVnhkMjJrSVhVS0RhOG5ZMGNnRy9V?=
 =?utf-8?B?MUczcG1uUEFKZ0pUVUMrVGRER2tpRzFBazE1bU5DRStLSWFScE5UZnZXaWFa?=
 =?utf-8?B?VHllazZpQ0d6OFd1NmlrL0YrVlVaNzlaSWcvR0dzaGdlTUFjbjJPL21kWVAv?=
 =?utf-8?B?NWN5K1ptNndUK0lUNElNZ0hTaDlSLzI3aTlxcm9oYzB3WXhFN3B5T3k0Rld4?=
 =?utf-8?B?UHgzamNDQWxqTmpOOWlCQ3F0VmtONTl4MS94TWwvcXhPSUxvbWhPWXI1WGVj?=
 =?utf-8?B?SFBCbU84UWZSSUNObVNpQXY4ZGZoUGtuazFvVWdxODlhc3B1d29GOHRpV3Bu?=
 =?utf-8?B?NEpNdG9uMitQT0gvVHkra3BucElVK3ZoUE4zTjE3UUVjb01YSmxoWDVBcjBU?=
 =?utf-8?B?aTFRMThvRGorOXgyVHE1MEM3bUplNEowNitqKzcwNUNiT1RId3lTMTcycXV2?=
 =?utf-8?B?NkxRVEp0dTFObUJQQ0VuOTNjRENKdks3TFh5bStqbTd0MlVPQnBORDNLVHdG?=
 =?utf-8?B?YzRXZ0E4Mm5aOWdvQ3lsRlh2dHp1YVphdDBBSEl0NXFZdzA4dTZXTGlrQXVZ?=
 =?utf-8?B?VkJ6V0RTRDl1Qlg0bFA4Qi9GZHZNZnFnT1dOTU80STBtZStkSGJSK0Zoa0xq?=
 =?utf-8?B?UDVwd3orREJvNW9nRzVJOHNoSjAxNHp2Mk5lQlc1a2Rjck0rNnI5OGttTjFy?=
 =?utf-8?B?SzN6TWZudTJBRXNIZUt3RkFwT3ZPOUVxMTM4cER3SzJZVnNuRW16bTIwbjVH?=
 =?utf-8?B?amVQamRRUjRTUVpkL2tEbkhTUlVQalptZTd4R293ZDJIZHV6S0c2bmcrY1dK?=
 =?utf-8?B?ZmxSbHlxTkhhVFBON2dpQjR2Ni9iUENaYVVVdU5idDlJVHpWNm94Wkc2dnJo?=
 =?utf-8?B?RHRTTyt6N3BxdmI2cFk1ZW02TFAxaVV5VzVGTDVic3FzRERJdVdyMUU1MzBJ?=
 =?utf-8?B?QjNibENJSi9jQWFZT0RFRWU4cU1uRHdCV2doUnVQK3I0eHBENHpmZis5akw1?=
 =?utf-8?B?UHFNTG9DUVFXSXN6aTFGU20yTVBGeGlObERCZXZKY2xSMEEvZS9BdXpoNTJC?=
 =?utf-8?B?a2MybVNCd0JNclg2Sjc1SXc5T0psYzlhUFlWNityWEMvdmVBSkhkQ1dJT0tz?=
 =?utf-8?B?VkRLUmFlSTVOVTNSS3VsdmNyTlFmYTVJM2NIUT09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 17:37:42.0064 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7c6a40-5d46-4497-6840-08ddea476b5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7956
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


On 9/2/25 10:02, Falkowski, Maciej wrote:
> On 8/27/2025 10:30 PM, Lizhi Hou wrote:
>
>> Add interface for applications to get information array. The application
>> provides a buffer pointer along with information type, maximum number of
>> entries and maximum size of each entry. The buffer may also contain 
>> match
>> conditions based on the information type. After the ioctl completes, the
>> actual number of entries and entry size are returned.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.c        | 116 ++++++++++++++++++------
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  30 ++++++
>>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
>>   include/uapi/drm/amdxdna_accel.h        | 109 ++++++++++++++++++++++
>>   4 files changed, 230 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 7a3449541107..87c425e3d2b9 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -785,11 +785,12 @@ static int aie2_get_clock_metadata(struct 
>> amdxdna_client *client,
>>     static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void 
>> *arg)
>>   {
>> -    struct amdxdna_drm_query_hwctx *tmp __free(kfree) = NULL;
>> -    struct amdxdna_drm_get_info *get_info_args = arg;
>> -    struct amdxdna_drm_query_hwctx __user *buf;
>> +    struct amdxdna_drm_hwctx_entry *tmp __free(kfree) = NULL;
>> +    struct amdxdna_drm_get_array *array_args = arg;
>> +    struct amdxdna_drm_hwctx_entry __user *buf;
>> +    u32 size;
>>   -    if (get_info_args->buffer_size < sizeof(*tmp))
>> +    if (!array_args->num_element)
>>           return -EINVAL;
>>         tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
>> @@ -802,14 +803,23 @@ static int aie2_hwctx_status_cb(struct 
>> amdxdna_hwctx *hwctx, void *arg)
>>       tmp->num_col = hwctx->num_col;
>>       tmp->command_submissions = hwctx->priv->seq;
>>       tmp->command_completions = hwctx->priv->completed;
>> -
>> -    buf = u64_to_user_ptr(get_info_args->buffer);
>> -
>> -    if (copy_to_user(buf, tmp, sizeof(*tmp)))
>> +    tmp->pasid = hwctx->client->pasid;
>> +    tmp->priority = hwctx->qos.priority;
>> +    tmp->gops = hwctx->qos.gops;
>> +    tmp->fps = hwctx->qos.fps;
>> +    tmp->dma_bandwidth = hwctx->qos.dma_bandwidth;
>> +    tmp->latency = hwctx->qos.latency;
>> +    tmp->frame_exec_time = hwctx->qos.frame_exec_time;
>> +    tmp->state = AMDXDNA_HWCTX_STATE_ACTIVE;
>> +
>> +    buf = u64_to_user_ptr(array_args->buffer);
>> +    size = min(sizeof(*tmp), array_args->element_size);
>> +
>> +    if (copy_to_user(buf, tmp, size))
>>           return -EFAULT;
>>   -    get_info_args->buffer += sizeof(*tmp);
>> -    get_info_args->buffer_size -= sizeof(*tmp);
>> +    array_args->buffer += size;
>> +    array_args->num_element--;
>>         return 0;
>>   }
>> @@ -817,23 +827,24 @@ static int aie2_hwctx_status_cb(struct 
>> amdxdna_hwctx *hwctx, void *arg)
>>   static int aie2_get_hwctx_status(struct amdxdna_client *client,
>>                    struct amdxdna_drm_get_info *args)
>>   {
>> +    struct amdxdna_drm_get_array array_args;
>>       struct amdxdna_dev *xdna = client->xdna;
>> -    struct amdxdna_drm_get_info info_args;
>>       struct amdxdna_client *tmp_client;
>>       int ret;
>>         drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>   -    info_args.buffer = args->buffer;
>> -    info_args.buffer_size = args->buffer_size;
>> -
>> +    array_args.element_size = sizeof(struct amdxdna_drm_query_hwctx);
>> +    array_args.buffer = args->buffer;
>> +    array_args.num_element = args->buffer_size / 
>> array_args.element_size;
> Can the element size be zero here?
Thanks a lot! It will not be zero here but it could be zero on the other 
place.
>>       list_for_each_entry(tmp_client, &xdna->client_list, node) {
>> -        ret = amdxdna_hwctx_walk(tmp_client, &info_args, 
>> aie2_hwctx_status_cb);
>> +        ret = amdxdna_hwctx_walk(tmp_client, &array_args,
>> +                     aie2_hwctx_status_cb);
>>           if (ret)
>>               break;
>>       }
>>   -    args->buffer_size = (u32)(info_args.buffer - args->buffer);
>> +    args->buffer_size -= (u32)(array_args.buffer - args->buffer);
>>       return ret;
>>   }
>>   @@ -877,6 +888,58 @@ static int aie2_get_info(struct amdxdna_client 
>> *client, struct amdxdna_drm_get_i
>>       return ret;
>>   }
>>   +static int aie2_query_ctx_status_array(struct amdxdna_client *client,
>> +                       struct amdxdna_drm_get_array *args)
>> +{
>> +    struct amdxdna_drm_get_array array_args;
>> +    struct amdxdna_dev *xdna = client->xdna;
>> +    struct amdxdna_client *tmp_client;
>> +    int ret;
>> +
>> +    drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> +
>> +    array_args.element_size = min(args->element_size,
>> +                      sizeof(struct amdxdna_drm_hwctx_entry));
>> +    array_args.buffer = args->buffer;
>> +    array_args.num_element = args->num_element * args->element_size /
>> +                array_args.element_size;
>> +    list_for_each_entry(tmp_client, &xdna->client_list, node) {
>> +        ret = amdxdna_hwctx_walk(tmp_client, &array_args,
>> +                     aie2_hwctx_status_cb);
>> +        if (ret)
>> +            break;
>> +    }
>> +
>> +    args->element_size = array_args.element_size;
>> +    args->num_element = (u32)((array_args.buffer - args->buffer) /
>> +                  args->element_size);
>> +
>> +    return ret;
>> +}
>> +
>> +static int aie2_get_array(struct amdxdna_client *client,
>> +              struct amdxdna_drm_get_array *args)
>> +{
>> +    struct amdxdna_dev *xdna = client->xdna;
>> +    int ret, idx;
>> +
>> +    if (!drm_dev_enter(&xdna->ddev, &idx))
>> +        return -ENODEV;
>> +
>> +    switch (args->param) {
>> +    case DRM_AMDXDNA_HW_CONTEXT_ALL:
>> +        ret = aie2_query_ctx_status_array(client, args);
>> +        break;
>> +    default:
>> +        XDNA_ERR(xdna, "Not supported request parameter %u", 
>> args->param);
>> +        ret = -EOPNOTSUPP;
>> +    }
>> +    XDNA_DBG(xdna, "Got param %d", args->param);
>> +
>> +    drm_dev_exit(idx);
>> +    return ret;
>> +}
>> +
>>   static int aie2_set_power_mode(struct amdxdna_client *client,
>>                      struct amdxdna_drm_set_state *args)
>>   {
>> @@ -926,15 +989,16 @@ static int aie2_set_state(struct amdxdna_client 
>> *client,
>>   }
>>     const struct amdxdna_dev_ops aie2_ops = {
>> -    .init           = aie2_init,
>> -    .fini           = aie2_fini,
>> -    .resume         = aie2_hw_resume,
>> -    .suspend        = aie2_hw_suspend,
>> -    .get_aie_info   = aie2_get_info,
>> -    .set_aie_state    = aie2_set_state,
>> -    .hwctx_init     = aie2_hwctx_init,
>> -    .hwctx_fini     = aie2_hwctx_fini,
>> -    .hwctx_config   = aie2_hwctx_config,
>> -    .cmd_submit     = aie2_cmd_submit,
>> +    .init = aie2_init,
>> +    .fini = aie2_fini,
>> +    .resume = aie2_hw_resume,
>> +    .suspend = aie2_hw_suspend,
>> +    .get_aie_info = aie2_get_info,
>> +    .set_aie_state = aie2_set_state,
>> +    .hwctx_init = aie2_hwctx_init,
>> +    .hwctx_fini = aie2_hwctx_fini,
>> +    .hwctx_config = aie2_hwctx_config,
>> +    .cmd_submit = aie2_cmd_submit,
>>       .hmm_invalidate = aie2_hmm_invalidate,
>> +    .get_array = aie2_get_array,
>>   };
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index 8ef5e4f27f5e..cb574ad7bfc3 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -26,6 +26,13 @@ MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
>>   MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
>>   MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>>   +/*
>> + * 0.0: Initial version
>> + * 0.1: Support getting all hardware contexts by 
>> DRM_IOCTL_AMDXDNA_GET_ARRAY
>> + */
>> +#define AMDXDNA_DRIVER_MAJOR        0
>> +#define AMDXDNA_DRIVER_MINOR        1
>> +
>>   /*
>>    * Bind the driver base on (vendor_id, device_id) pair and later 
>> use the
>>    * (device_id, rev_id) pair as a key to select the devices. The 
>> devices with
>> @@ -164,6 +171,26 @@ static int amdxdna_drm_get_info_ioctl(struct 
>> drm_device *dev, void *data, struct
>>       return ret;
>>   }
>>   +static int amdxdna_drm_get_array_ioctl(struct drm_device *dev, 
>> void *data,
>> +                       struct drm_file *filp)
>> +{
>> +    struct amdxdna_client *client = filp->driver_priv;
>> +    struct amdxdna_dev *xdna = to_xdna_dev(dev);
>> +    struct amdxdna_drm_get_array *args = data;
>> +    int ret;
>> +
>> +    if (!xdna->dev_info->ops->get_array)
>> +        return -EOPNOTSUPP;
>> +
>> +    if (args->pad || !args->num_element)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&xdna->dev_lock);
>> +    ret = xdna->dev_info->ops->get_array(client, args);
>> +    mutex_unlock(&xdna->dev_lock);
>> +    return ret;
>> +}
>> +
>>   static int amdxdna_drm_set_state_ioctl(struct drm_device *dev, void 
>> *data, struct drm_file *filp)
>>   {
>>       struct amdxdna_client *client = filp->driver_priv;
>> @@ -195,6 +222,7 @@ static const struct drm_ioctl_desc 
>> amdxdna_drm_ioctls[] = {
>>       DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, 
>> amdxdna_drm_submit_cmd_ioctl, 0),
>>       /* AIE hardware */
>>       DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, amdxdna_drm_get_info_ioctl, 
>> 0),
>> +    DRM_IOCTL_DEF_DRV(AMDXDNA_GET_ARRAY, 
>> amdxdna_drm_get_array_ioctl, 0),
>>       DRM_IOCTL_DEF_DRV(AMDXDNA_SET_STATE, 
>> amdxdna_drm_set_state_ioctl, DRM_ROOT_ONLY),
>>   };
>>   @@ -218,6 +246,8 @@ const struct drm_driver amdxdna_drm_drv = {
>>       .fops = &amdxdna_fops,
>>       .name = "amdxdna_accel_driver",
>>       .desc = "AMD XDNA DRM implementation",
>> +    .major = AMDXDNA_DRIVER_MAJOR,
>> +    .minor = AMDXDNA_DRIVER_MINOR,
>>       .open = amdxdna_drm_open,
>>       .postclose = amdxdna_drm_close,
>>       .ioctls = amdxdna_drm_ioctls,
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> index b6b3b424d1d5..72d6696d49da 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> @@ -58,6 +58,7 @@ struct amdxdna_dev_ops {
>>       int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct 
>> amdxdna_sched_job *job, u64 *seq);
>>       int (*get_aie_info)(struct amdxdna_client *client, struct 
>> amdxdna_drm_get_info *args);
>>       int (*set_aie_state)(struct amdxdna_client *client, struct 
>> amdxdna_drm_set_state *args);
>> +    int (*get_array)(struct amdxdna_client *client, struct 
>> amdxdna_drm_get_array *args);
>>   };
>>     /*
>> diff --git a/include/uapi/drm/amdxdna_accel.h 
>> b/include/uapi/drm/amdxdna_accel.h
>> index ce523e9ccc52..2e363880c1eb 100644
>> --- a/include/uapi/drm/amdxdna_accel.h
>> +++ b/include/uapi/drm/amdxdna_accel.h
>> @@ -34,6 +34,7 @@ enum amdxdna_drm_ioctl_id {
>>       DRM_AMDXDNA_EXEC_CMD,
>>       DRM_AMDXDNA_GET_INFO,
>>       DRM_AMDXDNA_SET_STATE,
>> +    DRM_AMDXDNA_GET_ARRAY = 10,
>>   };
>>     /**
>> @@ -455,6 +456,110 @@ struct amdxdna_drm_get_info {
>>       __u64 buffer; /* in/out */
>>   };
>>   +#define AMDXDNA_HWCTX_STATE_IDLE    0
>> +#define AMDXDNA_HWCTX_STATE_ACTIVE    1
>> +
>> +/**
>> + * struct amdxdna_drm_hwctx_entry - The hardware context array entry
>> + */
>> +struct amdxdna_drm_hwctx_entry {
>> +    /** @context_id: Context ID. */
>> +    __u32 context_id;
>> +    /** @start_col: Start AIE array column assigned to context. */
>> +    __u32 start_col;
>> +    /** @num_col: Number of AIE array columns assigned to context. */
>> +    __u32 num_col;
>> +    /** @hwctx_id: The real hardware context id. */
>> +    __u32 hwctx_id;
>> +    /** @pid: ID of process which created this context. */
>> +    __s64 pid;
>> +    /** @command_submissions: Number of commands submitted. */
>> +    __u64 command_submissions;
>> +    /** @command_completions: Number of commands completed. */
>> +    __u64 command_completions;
>> +    /** @migrations: Number of times been migrated. */
>> +    __u64 migrations;
>> +    /** @preemptions: Number of times been preempted. */
>> +    __u64 preemptions;
>> +    /** @errors: Number of errors happened. */
>> +    __u64 errors;
>> +    /** @priority: Context priority. */
>> +    __u64 priority;
>> +    /** @heap_usage: Usage of device heap buffer. */
>> +    __u64 heap_usage;
>> +    /** @suspensions: Number of times been suspended. */
>> +    __u64 suspensions;
>> +    /**
>> +     * @state: Context state.
>> +     * %AMDXDNA_HWCTX_STATE_IDLE
>> +     * %AMDXDNA_HWCTX_STATE_ACTIVE
>> +     */
>> +    __u32 state;
>> +    /** @pasid: PASID been bound. */
>> +    __u32 pasid;
>> +    /** @gops: Giga operations per second. */
>> +    __u32 gops;
>> +    /** @fps: Frames per second. */
>> +    __u32 fps;
>> +    /** @dma_bandwidth: DMA bandwidth. */
>> +    __u32 dma_bandwidth;
>> +    /** @latency: Frame response latency. */
>> +    __u32 latency;
>> +    /** @frame_exec_time: Frame execution time. */
>> +    __u32 frame_exec_time;
>> +    /** @txn_op_idx: Index of last control code executed. */
>> +    __u32 txn_op_idx;
>> +    /** @ctx_pc: Program counter. */
>> +    __u32 ctx_pc;
>> +    /** @fatal_error_type: Fatal error type if context crashes. */
>> +    __u32 fatal_error_type;
>> +    /** @fatal_error_exception_type: Firmware exception type. */
>> +    __u32 fatal_error_exception_type;
>> +    /** @fatal_error_exception_pc: Firmware exception program 
>> counter. */
>> +    __u32 fatal_error_exception_pc;
>> +    /** @fatal_error_app_module: Exception module name. */
>> +    __u32 fatal_error_app_module;
>> +};
> This structure does not have compat alignment between 32bit and 64bit 
> systems.
> I think you will need to add 32bit field manually.
>
> Please see https://docs.kernel.org/process/botching-up-ioctls.html:
> Pad the entire struct to a multiple of 64-bits if the structure 
> contains 64-bit types - the structure size will otherwise differ on 
> 32-bit versus 64-bit.

Sure. I will add a pad.


Thanks,

Lizhi

>
> Best regards,
> Maciej
>
>> +
>> +#define DRM_AMDXDNA_HW_CONTEXT_ALL    0
>> +
>> +/**
>> + * struct amdxdna_drm_get_array - Get information array.
>> + */
>> +struct amdxdna_drm_get_array {
>> +    /**
>> +     * @param:
>> +     *
>> +     * Supported params:
>> +     *
>> +     * %DRM_AMDXDNA_HW_CONTEXT_ALL:
>> +     * Returns all created hardware contexts.
>> +     */
>> +    __u32 param;
>> +    /**
>> +     * @element_size:
>> +     *
>> +     * Specifies maximum element size and returns the actual element 
>> size.
>> +     */
>> +    __u32 element_size;
>> +    /**
>> +     * @num_element:
>> +     *
>> +     * Specifies maximum number of elements and returns the actual 
>> number
>> +     * of elements.
>> +     */
>> +    __u32 num_element; /* in/out */
>> +    /** @pad: MBZ */
>> +    __u32 pad;
>> +    /**
>> +     * @buffer:
>> +     *
>> +     * Specifies the match conditions and returns the matched 
>> information
>> +     * array.
>> +     */
>> +    __u64 buffer;
>> +};
>> +
>>   enum amdxdna_drm_set_param {
>>       DRM_AMDXDNA_SET_POWER_MODE,
>>       DRM_AMDXDNA_WRITE_AIE_MEM,
>> @@ -519,6 +624,10 @@ struct amdxdna_drm_set_power_mode {
>>       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SET_STATE, \
>>            struct amdxdna_drm_set_state)
>>   +#define DRM_IOCTL_AMDXDNA_GET_ARRAY \
>> +    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_ARRAY, \
>> +         struct amdxdna_drm_get_array)
>> +
>>   #if defined(__cplusplus)
>>   } /* extern c end */
>>   #endif
