Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB73CCC950C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 19:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4642510E12B;
	Wed, 17 Dec 2025 18:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gfLkdtGE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011014.outbound.protection.outlook.com [52.101.62.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3778410E12B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 18:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gauvw2+oU/LHXPQR2cU0wfPKJAXpWLNpYTfZdPHNJEUJGRmsku+OZoIoJS0H9JerZsPGXaDMdHkk6tdb7TtuNSNolI9Jw1YMpuOGQxMNIhjBTVd4MNXJLTkYFqacG5R1+s5j1zfd+LM96r9HiiII6DgBtrztdSL0zE7shwA7g3uLCj6HOJbg9h7BfrgS/ezjTJJGd0wknfLjKyYjnUM3nAmcNJ1UX2YrLYEcdCKEs21lsHI52GjiWE1NR8q69eT4FE5D+sDZetcDs5lnkD73B15+P7GUoMTnL3SMZ3sb8sFAWmuh4LvHG269775fdjeTfjFBog7XgwwmYx4POIvIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RB/rzw1qFhlH+pOk7gVOCIgqag044dAgEYsLjxKZ0B8=;
 b=hRQnaE60aSFSnXZTFJMn9pYY5cg5PgMDS/VlGbsu0FywkTlH9irIE3m1en1mbysnKUKypwlMH7YXwRnvFrLBvWQaNatLWiiScoJCdFk5IdyVz8dCoKPlmrmily4wud9tzLTea0+fsVBZPkyEVx9S45Ubs8aC/al5Qdxqd6CD1NbfzEM7AhIFUdfYpn0uPS7Oa4QPBaTnYAKM0Gp/m6VW9+r17OMMW2DGnaorc/Ic9UmgRXH+W34qIkdFoY9bIOvj3o/bXwW8Gbs4l1T8vRijsvgiOpoyUasncnRtABJFAj+jiuzssBz5/oSVmdZkm99CXGUoHTvRubwg09CR/7yRgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RB/rzw1qFhlH+pOk7gVOCIgqag044dAgEYsLjxKZ0B8=;
 b=gfLkdtGEH9q7ZoyLAyVNencQPJbniBVw7wZkEblUDppck+PRXUODgsGAckdQyLkm1UF3VOH9gwkc4O3L3PjEZrdGT6MsuiKAauo3NxVlYzHWenYnhce/wgquECx2hQAuNoTI1vROpQhqI8cVQDQ/poktnA7TSEspiRGrhzIlpj0=
Received: from SA0PR11CA0115.namprd11.prod.outlook.com (2603:10b6:806:d1::30)
 by SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 18:44:42 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:d1:cafe::d2) by SA0PR11CA0115.outlook.office365.com
 (2603:10b6:806:d1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 18:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 18:44:41 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 12:44:41 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Dec 2025 12:44:40 -0600
Message-ID: <82d2d957-650f-9523-9090-cb1c5a3ae5f7@amd.com>
Date: Wed, 17 Dec 2025 10:44:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Enable hardware context priority
Content-Language: en-US
To: Mario Limonciello <superm1@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251217171719.2139025-1-lizhi.hou@amd.com>
 <ef6e71e2-ee6f-49d8-981b-97ba2fe13e92@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <ef6e71e2-ee6f-49d8-981b-97ba2fe13e92@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|SJ2PR12MB9161:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f23f49e-4fe8-476f-c40b-08de3d9c56fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTZUcC9CWmpLRFRMMWtNV3BTdEhmdW9FVzBuS0JRbUxROWNnRWxYM3BqYlJo?=
 =?utf-8?B?TUtLUEF4eGZPMnJwUS9JWHJyOW5nNm5pUDRQZmxtS0wzdUtSRExlWHpHRThr?=
 =?utf-8?B?bHlCRlFUV2p6NEs5YzNpOTFjMnZQNEF4MlFlU2NMclIzdW83cTdPK0tZb2ZB?=
 =?utf-8?B?TkZoRGhaWld2aWZDbVhJcGUrbEhVakpJb1U3MWY1MDJDYnhTWlY5c00wZzls?=
 =?utf-8?B?aUpZVGhnV0doM1hJYXppKzRmcUtqRnA2aWFoelRhMFltek9neEw4ZzlIZjdv?=
 =?utf-8?B?SnZCclB1KytsUWhSTzh6VUZLekZ1YW0reXNGZkladG9VSEtzNFd3WTBMVGs3?=
 =?utf-8?B?MUFmaWVJMThlRWVBWHdHUnd2a3NabVA5dVM1a2xNc2F4TzVKUlJDd1pkZXhk?=
 =?utf-8?B?ODdwOEpGUnRzQ1N4Q0V3dmxUQ3BpbjJ6ZU5qclEvQS9rNEQ4UHBTOG1ZTkt1?=
 =?utf-8?B?VUNLTWE2UjR6anM1VDhyOE9lZHMyMmRNZjVhdndMY0NsSU5wRGdEVHg1TUlx?=
 =?utf-8?B?d0dQdjdYb1dXMHJuWkJWeVZVTmFpWHIzZzVSU3VNbjRSY2lzVDFuM29KUTRQ?=
 =?utf-8?B?d3NyS2kzZTh0bDBuZy9UYUtqTUd6SExtTDVHR0cxMmNUMmdMTE9pcnlOU2RK?=
 =?utf-8?B?S1JmSzk3NzlrQnoyUXhaLzl2WXF1aTc4ZmMySVJRN2RxL1E4Z0liNWJWOHdl?=
 =?utf-8?B?cVAyUjh2SXMrTkQ2SlJNSDBWMTZ3QlpnYlQwek1ONGlpMk5pd1IwaVg1OEhI?=
 =?utf-8?B?NlFXVytUY0hPZytDekdtZGx2YldWRTJqMXNTVjdBRDZkdWVoOHJDQ0FVckVT?=
 =?utf-8?B?dFlVWWVCSTFmRjRoeXJLNUVjbzcrTmZrMTBBdGNmQnVsTXhIYmx5UzNxNEdX?=
 =?utf-8?B?NUszOEpQek9vcHhXVkY1ODBiYU9oTGwreEpVYVZTMVJCazdzdlE2OVlFOWkw?=
 =?utf-8?B?Q09ESldGSzhmM01aTVlDMFFpN0VsL1J6VzFjRVNxNTQ3dmNxRExacDg5Y29F?=
 =?utf-8?B?SUZucWpMNnRUMjJIOTV0bVBNeEFPSGd6MWV6MUl1V2d3Z3EyVHd1eDNsdmEr?=
 =?utf-8?B?dHdscUpIUjl4OVRCNUtPVUVvVjNWaHo4UjFINC9tNitaTkdnQ0NEckhBYkh6?=
 =?utf-8?B?TXdDVEtjM2FYc3EwdXA4Y3dxU2Q0NVkxTW80MkdLUkNyVVlhTXZXQ2t5YU0r?=
 =?utf-8?B?L1pkNktXQis1dDVpYXZFUUtKeWxHOTJHNnh0MXB0S2NPaTVRbnptUU5CWlhZ?=
 =?utf-8?B?djlQM2VwQjkvYTR2b3RNS3U4ZE80WmJPR0VsREV5a1dRYVFScjVoT1BidmVq?=
 =?utf-8?B?MzArbGpmUHlrUGF4RXVXTHFVZWlwdXIvV0lYRC9lUDFWMmlzTFJGS3hsVlor?=
 =?utf-8?B?ZEFyRW5VK1pnOUk1VzROZGU4a2MxYXpxaUFneitoZ2FQYlVTVEY1bUtvSkxk?=
 =?utf-8?B?cDNLYVptV2JlTlM2R21RdGdFUFFvTUJESEVDdUpLMDI4MmJvdHhVcDZaTnI3?=
 =?utf-8?B?eW01MHp4YTc0bnZUeTlOd0VadGdtZ20vRDRHRnRjK0w0SkhMRmx4V1pxSHNr?=
 =?utf-8?B?dWpRNGVBSVNXWCtaQ25WVzg0aDJVWGZKVHk1WjVGbE9yUEE5akd0ZElwSVhw?=
 =?utf-8?B?Nk4wclM5MHRub3RSbGRyU2tYOXBFS1JScjhSa0w1WW0wM21HUC9jNFdKMUg0?=
 =?utf-8?B?bkhkRFVUTUJNZDJwYTFCSEtaQnhlTjJBWDRsZ2VEK2hGNUdvTU5weklyWnhu?=
 =?utf-8?B?MVEzMTQwbzg1RVFlem41Z0ZHUG1SVjd3UVI5cmpTOGVkbDRLbXFwTW91U3Zr?=
 =?utf-8?B?b2h2Y2o3M2luR1pHbXBQQldwcUN4NXA4SFltNnAra0wvT3RjdGwzQjRGazlL?=
 =?utf-8?B?WVJVb2Q1YmZBRHdUR2gvdTM4ZXI2bFVVNlJ0UGJNNk1Da3Q5cmpnbkNXdGNY?=
 =?utf-8?B?VXF6dENPQTl6NFZsWG53dmgvTEI5Q0FBdmcyNVRRb0FBcXpOTG9sYU9IUUdG?=
 =?utf-8?B?UmVQQnFoSkovSmFDK2lzQkNZblE1NlFlWnZMM3ZoelZnUFBmR3hxQjJBQnEr?=
 =?utf-8?B?WE40MUlsWDlSRUcxYVRJVHpDV0pRMVNlRHBNa0JEYTBmZXlibDRVeVVjdFpB?=
 =?utf-8?Q?D9MY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 18:44:41.6169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f23f49e-4fe8-476f-c40b-08de3d9c56fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9161
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


On 12/17/25 09:59, Mario Limonciello wrote:
> On 12/17/25 11:17 AM, Lizhi Hou wrote:
>> Newer firmware supports hardware context priority. Set the priority 
>> based
>> on application input.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>
> This change itself is fine, but while reviewing it I did have a 
> question to ask.
>
> I notice that NPU2, NPU4, NPU5 and NPU6 all use npu4_fw_feature_table. 
> Is this feature really present in F/W for NPU2 devices too?  Or it's 
> really only NPU4 and later feature?
>
> IE I just wonder if it's a non-obvious problem that npu2 device should 
> have it's own fw feature table rather than re-use NPU4's. NPU1 has 
> it's own feature table.

Thanks for checking this. Actually, NPU2 hardware is obsoleted. I will 
create a patch to remove NPU2 completely.


Lizhi

>
>> ---
>>   drivers/accel/amdxdna/aie2_message.c  | 23 ++++++++++++++++++++++-
>>   drivers/accel/amdxdna/aie2_msg_priv.h |  5 +++++
>>   include/uapi/drm/amdxdna_accel.h      |  8 ++++++++
>>   3 files changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index e77a353cadc5..051f4ceaabae 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -205,6 +205,27 @@ static int aie2_destroy_context_req(struct 
>> amdxdna_dev_hdl *ndev, u32 id)
>>         return ret;
>>   }
>> +
>> +static u32 aie2_get_context_priority(struct amdxdna_dev_hdl *ndev,
>> +                     struct amdxdna_hwctx *hwctx)
>> +{
>> +    if (!AIE2_FEATURE_ON(ndev, AIE2_PREEMPT))
>> +        return PRIORITY_HIGH;
>> +
>> +    switch (hwctx->qos.priority) {
>> +    case AMDXDNA_QOS_REALTIME_PRIORITY:
>> +        return PRIORITY_REALTIME;
>> +    case AMDXDNA_QOS_HIGH_PRIORITY:
>> +        return PRIORITY_HIGH;
>> +    case AMDXDNA_QOS_NORMAL_PRIORITY:
>> +        return PRIORITY_NORMAL;
>> +    case AMDXDNA_QOS_LOW_PRIORITY:
>> +        return PRIORITY_LOW;
>> +    default:
>> +        return PRIORITY_HIGH;
>> +    }
>> +}
>> +
>>   int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct 
>> amdxdna_hwctx *hwctx)
>>   {
>>       DECLARE_AIE2_MSG(create_ctx, MSG_OP_CREATE_CONTEXT);
>> @@ -221,7 +242,7 @@ int aie2_create_context(struct amdxdna_dev_hdl 
>> *ndev, struct amdxdna_hwctx *hwct
>>       req.num_unused_col = hwctx->num_unused_col;
>>       req.num_cq_pairs_requested = 1;
>>       req.pasid = hwctx->client->pasid;
>> -    req.context_priority = 2;
>> +    req.context_priority = aie2_get_context_priority(ndev, hwctx);
>>         ret = aie2_send_mgmt_msg_wait(ndev, &msg);
>>       if (ret)
>> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h 
>> b/drivers/accel/amdxdna/aie2_msg_priv.h
>> index cc912b7899ce..728ef56f7f0a 100644
>> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
>> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
>> @@ -108,6 +108,11 @@ struct cq_pair {
>>       struct cq_info i2x_q;
>>   };
>>   +#define PRIORITY_REALTIME    1
>> +#define PRIORITY_HIGH        2
>> +#define PRIORITY_NORMAL        3
>> +#define PRIORITY_LOW        4
>> +
>>   struct create_ctx_req {
>>       __u32    aie_type;
>>       __u8    start_col;
>> diff --git a/include/uapi/drm/amdxdna_accel.h 
>> b/include/uapi/drm/amdxdna_accel.h
>> index 62c917fd4f7b..9c44db2b3dcd 100644
>> --- a/include/uapi/drm/amdxdna_accel.h
>> +++ b/include/uapi/drm/amdxdna_accel.h
>> @@ -19,6 +19,14 @@ extern "C" {
>>   #define AMDXDNA_INVALID_BO_HANDLE    0
>>   #define AMDXDNA_INVALID_FENCE_HANDLE    0
>>   +/*
>> + * Define hardware context priority
>> + */
>> +#define AMDXDNA_QOS_REALTIME_PRIORITY    0x100
>> +#define AMDXDNA_QOS_HIGH_PRIORITY    0x180
>> +#define AMDXDNA_QOS_NORMAL_PRIORITY    0x200
>> +#define AMDXDNA_QOS_LOW_PRIORITY    0x280
>> +
>>   enum amdxdna_device_type {
>>       AMDXDNA_DEV_TYPE_UNKNOWN = -1,
>>       AMDXDNA_DEV_TYPE_KMQ,
>
