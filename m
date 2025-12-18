Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3BDCCD36A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A5310E866;
	Thu, 18 Dec 2025 18:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0brW89Sn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082D610E866
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 18:43:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVWBQrdlwnHteqHVmif5FaMCu7SI1BZdOfFE8Lfc5B8YYhiO7IR301Kw9WQ0cfkJ/rrkBD0LAG80gwlemrRDy73oygl0Wttso3pd0vS/HdnpeWmV3b52LFOzK5U5ZGdWG/Y3ztpOx0V4HMSvwTdiDrF2FFeg8RDCcbT3rb4maq7T68tuha8G7znuGfHotxVwtRiy48pYsW28dMyyxi2fxqXctAROtCsgx2//vqa4wRVhVQSet0u/D+1AWFQ2iHPmCsh6gP4uG9F9zSxMV3tw1bRkGLqvPbgD4FEg4yaee/8FIszk6HI/m5PsUxztYPUntYSagQkWC5f2ptik9bV8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHMZrJ7Di/aT7g+n8LffbEFMXXXyD7OqdVLO+KWnBXI=;
 b=NUHGHPQsw2DGV2cryltXoDmZBPP91ijiRTRpiEv0mFkk7GB8WMbvshTzSUv1dbtgjH7um0wNAZk4TS+nDj1/BmTCtdXGDm+riU2/H4Dvs+ZI3tzhqGi2DE23TbRdHThG56LI1d5J8YseoNxouBc6XpkEjCmWIcDEwkiyRtkKEJCsUScx5C0AMsEGHZDkQLcrL5H8fwX3ToLYQMlNg89K7nJuPEUrumgqR2tC6iGMh9yZ8JPWHGB3uRbF50tqfZBs7XN0dYBka6MNi1CzUDJlx8h3EYYRa6ag9CpUzwNEWXEZdX99xNPjeqS/kY/VgwzllR17yPf/4dg0LozOgDRViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHMZrJ7Di/aT7g+n8LffbEFMXXXyD7OqdVLO+KWnBXI=;
 b=0brW89Snnecd6J1IFqdrQkPo6noXfOinj5Qc1RdqysFawweLyApSBNEw9iNvpdg0SY4oMJs3k8GrwYYLViCUyPaXFMc/2O/J4V4dEFqjrnVXBj4g85VX+/YXoV0Y0vNVeSyfugFIkcw1nHDxi8PouPYCNvPtAKXD0/5t062Xz1Y=
Received: from DS0PR17CA0024.namprd17.prod.outlook.com (2603:10b6:8:191::29)
 by CH3PR12MB9252.namprd12.prod.outlook.com (2603:10b6:610:1ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 18:43:22 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:8:191:cafe::f2) by DS0PR17CA0024.outlook.office365.com
 (2603:10b6:8:191::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Thu,
 18 Dec 2025 18:43:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:43:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 12:43:22 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 12:43:21 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 18 Dec 2025 12:43:21 -0600
Message-ID: <0edb5e8c-0fb4-1e15-2e07-22034382490d@amd.com>
Date: Thu, 18 Dec 2025 10:43:21 -0800
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|CH3PR12MB9252:EE_
X-MS-Office365-Filtering-Correlation-Id: 05053029-c333-4f19-2e34-08de3e65524c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azg5ZFVyWmJIaDdIV2lCamIxenluN0tyTy9DbDluWEcvK0FwdktBMXROSERH?=
 =?utf-8?B?V0VkdUd6eWplOExSME8yOGxHTkpBQnoyblRQWnhjb1FLZGhtRjVRSmp2NFNW?=
 =?utf-8?B?d2NDR0s4ck5NR3AzRkd3YWRjR3VYQU1jQjhJRWJQSk9VS1Q2cVh0QTk3aXNa?=
 =?utf-8?B?QUtPdkN3V1ovU1l4L2o2emt6VmpCeklpYk94UDlCemJzcHJ1S0c0L1dWQk5H?=
 =?utf-8?B?TTlUL1c0MVFJMVQ3ckt0dytib0EybkVPNUdJendlYWtydklMLzRQS05KUWw1?=
 =?utf-8?B?WVVvdXl5dnVTNm4zbUJiNExRYlRZNFNQN054S0M0NDltNURKSTd2VmxQNTFV?=
 =?utf-8?B?MFJhOFpuRU5rS052KzY5VjNTeFUraStaTzJqN09wMDlxMlZnSHBvRjFPOStP?=
 =?utf-8?B?QUVQMlcrM3MvRGlmOFVLc2V0SDMwcGtkbzMraERzUUJLcHphZjk3RFYvMXhK?=
 =?utf-8?B?bnF1ajFDUTl3SThyYUJCYk1yWGdIbWlZbGFqS2VOQ2RPdG1WYVJvakZ3VEdk?=
 =?utf-8?B?S1VDcVR3WjgwT3ZUbWpmbk5IYS9tcm9meVJnUFpZNU9OaFVRdS8xVjhERGIy?=
 =?utf-8?B?SEpIa01jNjcrQmkrLzR2aFA2cndiMW9ESzZaM2JCcGJuWm1xSjUzVFZ5MkFv?=
 =?utf-8?B?djFaWDVzVW5xT0t0aWpGOUtMQjdBRE15WklWRjBydFlKK21BbmdmSGx3ckhD?=
 =?utf-8?B?ZEQxVmpjS043Q1ovTWVXZUpiQjVvQllGMkswTklSRVkwLzYvdDl3ZUd6OUNq?=
 =?utf-8?B?L2c1aHN5SFFSQWVnbjlVSnV4aytSN1hYYzZFa0pxbFFpTHJrUkhSY0ZSa0c2?=
 =?utf-8?B?em5ZY3c0MVlYd2JvclN2d3YrUUVzWWlXWmd6dkszd0NPWnh0QUpFaHRwbWZD?=
 =?utf-8?B?Rml3UVIvTEw5K1d3OEltRWxkS0JCWGNpbzdwcG5XUTNHbFdCZFlsM0U3dHJT?=
 =?utf-8?B?aEI1Rkh4MWZrOU51bTc2alE2QUVPSlZqakIxZ2dJNFNKVnJTZnJqK0xZMDFp?=
 =?utf-8?B?OW0vRVY0ck84L09KSDVQU0lER0R0R093NGRIbDhkRVNIRmkyUXdHTlhKelVS?=
 =?utf-8?B?MXhCNDRLVXRMVzdKdjZHT1dDZEk0TXVXYXpUN29IUmIyNU1maGdDUnN2Wk13?=
 =?utf-8?B?eW84TkZFZTR1QkI0djBHNVNuUzQxZVpYZVphdnFvY3Y1cytyS3pSbUNDbFFa?=
 =?utf-8?B?OHZzMnV5TXpzU3RUYzRIa2xQVnNxRGUwTnFOd0xNN0xpaWp3cjJvRDJVZXhi?=
 =?utf-8?B?Sm9FZHcvN1U5T2tZYmFJZkF2enR4cHk1Y29hckZwOVZaOVJFUk1HSFNLWGwy?=
 =?utf-8?B?YkhEd0tnMWFUWksvM2pkeW0xL0padFZ0YUdaZzNCR2VjbjRlaXgwak1IRkt4?=
 =?utf-8?B?N1ZDdXh2dnhNQ0JmZVJJUE1UTjFoaVRvWTdKMUlWZVNmS0JHNFBiWFRNV0Fs?=
 =?utf-8?B?Z1JsRmVVUWVCamhtVWxPV0ZSNFFRS081Q01MNTZxbG13bStYV2VXbzVyenEr?=
 =?utf-8?B?eDdhVmRlbUtROTNZWGs2MzU3TjljM2FtaGMxQmFRemMrcmdGZE40UThVQmUv?=
 =?utf-8?B?SkVpWTQ2TGxLakYvQmRUQnZhREFzc3Y5N1piSytVQXJQZXpYTTRUMFZVZXI5?=
 =?utf-8?B?cHVUUVc2UGxtSExvekFhcjFIcTJKYWFDaXhzNFdkcTA3K1BKTndGcTN2WThs?=
 =?utf-8?B?L2FFdllERDZpeS91c0p3TEwrMGxORnRTU1h2UHlxVXFudEtvV2gxWHpRWWJh?=
 =?utf-8?B?MHlqcklKQ2srQW44QnpJcmVMSGNKVzBJYnRPUEFjQVJrVU91NVB1UHlaMTBB?=
 =?utf-8?B?OFpyYlB0dml3ektmLzVYM0t4NUZoeENRcDFKR1ZoR2YzTlY2Q0RVT1pPQmd3?=
 =?utf-8?B?RUorWm5ObUJWcmR1R2ZURGpHQTRNaHVORFkrTHVWSFRDVENQQm1Sc3IwQ0N2?=
 =?utf-8?B?d2QzK1NVWVQwaUhEdGx3QlJjYmdzQ0NicW5vV1FqUW5URmRRVE9rbkJiM0V1?=
 =?utf-8?B?YURSUkg1ZmtEU2lBd3lINURBQXdWbktNUDJCaTIwcDBRMXc4TU5zNE9VbHk5?=
 =?utf-8?B?REhoZGtkcmFOL1F0dEVhRHlWckdBandyTGdjWWkyaGdLTGt3c3ZVVzQ3MWNw?=
 =?utf-8?Q?/6HA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:43:22.5787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05053029-c333-4f19-2e34-08de3e65524c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9252
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

Applied to drm-misc-next

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
