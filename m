Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9833FCC9547
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 19:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0437B10E26A;
	Wed, 17 Dec 2025 18:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Gwc/ak+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E376C10E26A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 18:49:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaqUuE4j1xXayt1hKTJPLfz5Awk+NrKY4qSOUoIQYJePBRpt4Jm+8kLF/7KAETyfjoxWlOrYaJcB8FZsDa3LI6M97K1zNxsbUiRiFw6NaNwk0E3bPh/Lzy8OSUE+aA/mQD7qfm00L1Vr5yaVpTxDqg32H20d5CLITWgrgwcc9oowWiq7Q04zDdVtLlG9H1tyYf58pututpbElATxx74giJzr021XcxGylMLITEatO68t/mlQ3ig34djAwrPFizMnVPcN+9X1H/JmFjCq0iCLPRUaPwVwZ2ef7suzVHVhMGFb4DDGjgdhrABuz/koRI+YbQMqWgi4GmGqr1YlpSFB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yURN8AEScCvstxEB9+HCnJkCjrgu+M+durfWGWhJYs8=;
 b=Z9bgnj1/kMWsMTUWGAFctzmOd7RDCocU7rdJwf7npUvfULeOl3VMUu8rw14b6JyAprMv/UvYHL79wdYYTrB4+MLYzGafv2WcdFr/Pm50ue86+Cj7SlV8KReXb2R0KKRkFbcCFWtx/3DAt/hqf5Xm5jPbJQXL6lhMwTnNtG6OuiRFR9ShSR9D9PKpwd+twfEmcYxz4vTkShvT3YaPV0OkKEN1gz3aN8IvNNKbZZ8v5bvdV4BFOb784dJXSAMpDXs2G0HqnDMwts7OzQj2pJ2m4dFQXyd+N5V6uzMGg+ZyYnys9qD9/v7hlB/7ayI/1VlGXcTe4Kb1PccJvq12jF/gfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yURN8AEScCvstxEB9+HCnJkCjrgu+M+durfWGWhJYs8=;
 b=Gwc/ak+UPiBj6kFHgrfBgnp4QAUWw38T2kDj9QE1Obb6cxQxNLRQmzCJ5ieXzJtrg/fg7QRJ2/8tnpcF6FDFOAz5LAqk+CM7NDGnlB5IMtccj2dpffz+EgQijhWKO2H1lcezccnkaRErnQb+0QwD8NmmtjFcoW+EV/Mu0RaurtQ=
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by CY5PR12MB6600.namprd12.prod.outlook.com (2603:10b6:930:40::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 18:49:03 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::8b) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Wed,
 17 Dec 2025 18:49:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 17 Dec 2025 18:49:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 17 Dec
 2025 12:49:00 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Dec
 2025 12:49:00 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Dec 2025 10:48:59 -0800
Message-ID: <3edbfc14-eb16-7bd8-89d5-20f46ad7569b@amd.com>
Date: Wed, 17 Dec 2025 10:48:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Enable temporal sharing only mode
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251217171701.2138980-1-lizhi.hou@amd.com>
 <142f0f8e-d992-4e9a-ba98-ac4b5436fe7d@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <142f0f8e-d992-4e9a-ba98-ac4b5436fe7d@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|CY5PR12MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a5ba1c-1379-440f-a08e-08de3d9cf1c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWFlU2h5eFUvQVNtbjNlY1FDaXVPTTJUYWt0b3VmREVGM1ZDVjhWMlI3bC9a?=
 =?utf-8?B?MUdSQ2xwbmFMOUJxK1ZxeWRJS004cW13UitFYlp2aXRDVG4wcnhFY3lrdG9I?=
 =?utf-8?B?NFdlL1JrVk1SYWVzNi9GRFU4S1Y1MTVhc0wvSHFzT3RUZFlTZXh0bDRFMTBx?=
 =?utf-8?B?TW5CSS9sRUdNRWswb0dsYTljNnNITzBuOHNSVURNSU9sMkFkclNqR2l0TUFl?=
 =?utf-8?B?YUpWUTE4M0w5WC9ldDJtMHdLekpSblFZZ1duT25LOVhOL3lWUk53eXhuZEV2?=
 =?utf-8?B?TkxqQ01CWTR4a1JnS3pnZ2ZudUxlMTRhRkhMSXFOcHZsOWh3OWlqMjNuZ0Zj?=
 =?utf-8?B?YWJLWkZ5NmVOQWRLYkVMV3RkbU1najhLV2lySllCeDB5THYrY1ZzZ0s0L3JB?=
 =?utf-8?B?dUdtcFo0OVNqM0VCN0drZjc3bXk5SjB2RWdRZzR4TDVBdU9EaVdLOWI1OEZl?=
 =?utf-8?B?cm56eVBSOGRHRlVGY2J0dTU0MnhHRFNPQjcxeDUvYzFzQi9DWk8vTC9FeVNF?=
 =?utf-8?B?cXk4bW5OQUhUcnlkKzkvRElKUStDOWU0VUNPWWVaSmtTVWU0V3RyYlpQNFN4?=
 =?utf-8?B?OEhPK0tJNUMyTytSSHpQMytMblhJaU04TTE2NDRXa1FtbVE4K1ZuRG5ncmcz?=
 =?utf-8?B?aVltSk1aRDNieXY5NXM0bG1ZVlUxc1NHZjUrdUZiekhKeFF5S1ZodW9GTzdl?=
 =?utf-8?B?Z1NxUEhFbFVoNDROcEZjWURJWWdOKytIZVVjL29CaGdMS3lzZ0s2aWVUeUFY?=
 =?utf-8?B?cEhkdGxFUUsraFlwWnVlWGtUam96NmNzSlZ2dEJTd0hVcFYrNmE4SkVrUzlC?=
 =?utf-8?B?UTI2WU5DQnhKMEkrRlVLcWhoRFFKUGhCMk9VWFo0cHhFY2VTWSs1N2hCeEhx?=
 =?utf-8?B?VzdwdXRpK0ZDRHpYRmlXeW51dzJMd2VTdWlRQXc3c0diTHQ2S1RuY0xmNm11?=
 =?utf-8?B?ZVhCcU5XaURka1ZQMUhvRzJjMTh5QmVLRUdQcFZ2Qjh0YUpoK0tlbEthUmVO?=
 =?utf-8?B?cisrWC94Y1BZNTBHS2xNTm01QUtnb0Y0dmRZd3I4VE9GZFQ2SCswZGgyazJa?=
 =?utf-8?B?STJLY3B5NnMzQjg3ZFdMTHhzNjhQMlZOd1VieVBRcWFRa0lKYm0xL1E3V2ln?=
 =?utf-8?B?T0hvRVpxOWNXK1R5akxCUDRhVlh3aTZSRm1KQVR1NWJKU0gyR2diQkVRdVlX?=
 =?utf-8?B?ZmtMZ2VwUitlVThCVElDQTlkL1NnRWF5NHl3WGNiYTFiaFNwemhRTmZNYmlE?=
 =?utf-8?B?UVVlTW5nRlZ6allyM0lUK3kxbGtyNUYyU1ZTUEg4bzFpd3pueEpvQXk4bmRt?=
 =?utf-8?B?U1BUZ1dIbjBmSTlGT0w3R2RSck1rYzhwRFlneTNJdU1UTVhyOGJwanQzeEV4?=
 =?utf-8?B?RkVlb3NSQWhpQmtaSDB1Y21MSjViUjVLdXRBZ29RM0JWbGV2UlJ6Q3RrMU04?=
 =?utf-8?B?UDJ1STlaUWUzb21PMmdJZm5zSnZBem9JNERraXJQODRKNVlrdFpZMUh4YnBj?=
 =?utf-8?B?cXpTY2YraHpwR0hCQ29tQ1loLzkzeFhRaWV4VzFUcy80WFg1SWdLbHdtQXJn?=
 =?utf-8?B?c1hWclBWU0RhL2FJcnhpem5RQ21tcms0aXp6TW9pNm8zdUZFc2MzYU1WbTNn?=
 =?utf-8?B?bU1HS3RtbjZ3MHhxZmprQTZnNHIvUmRGNmJWZlNFWEpjeVNJbkcwSFlwZjZw?=
 =?utf-8?B?S0ZzckhhcTREN2J3VUtOaXRpMklKcmN4QXZiS3NKRkQxYmJxTm9Ra0ptcmF3?=
 =?utf-8?B?NnpveG9EM3ZDa2QvL1htVXVuWVEwWWhHN01NWVNoZVdndSsvaGdJOVljV1Ix?=
 =?utf-8?B?a1dwZ1BFQUxZeldINGlYa2NJRjROQjhzTnFzUS9Oa252aVJSSHdMdXVjN1Jt?=
 =?utf-8?B?Qy9XMktOWUFia0R6c0J6T2Vaejhyc2ZWT2xqd2Q4allIUnhMZkplTHhWUzNK?=
 =?utf-8?B?ZXlUKzhPSlpsd2dNSXJXeXJOOGNwc09wdUc2bENWMEVzclp3UTN5NFppVmlC?=
 =?utf-8?B?Q0pIcTZvN2dNYkRsQ1prL25GNkVwTzUrazZPUnp1YmFWa2ZzT1pFNVdtV1BG?=
 =?utf-8?B?R3VkR1I5MUMrTXcvWStJRHBlRGZHVFhpQjYvRW9jQXQ3T2k5bjZUaG1qeDg5?=
 =?utf-8?Q?XuYM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 18:49:01.2510 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a5ba1c-1379-440f-a08e-08de3d9cf1c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6600
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


On 12/17/25 10:20, Mario Limonciello wrote:
> On 12/17/25 11:17 AM, Lizhi Hou wrote:
>> Newer firmware versions prefer temporal sharing only mode. In this mode,
>> the driver no longer needs to manage AIE array column allocation. 
>> Instead,
>> a new field, num_unused_col, is added to the hardware context creation
>> request to specify how many columns will not be used by this hardware
>> context.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c      | 11 ++++++++++-
>>   drivers/accel/amdxdna/aie2_message.c  |  1 +
>>   drivers/accel/amdxdna/aie2_msg_priv.h |  3 ++-
>>   drivers/accel/amdxdna/aie2_pci.h      |  1 +
>>   drivers/accel/amdxdna/amdxdna_ctx.h   |  1 +
>>   drivers/accel/amdxdna/npu4_regs.c     |  1 +
>>   6 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>> b/drivers/accel/amdxdna/aie2_ctx.c
>> index 42d876a427c5..2ed087803628 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -468,6 +468,12 @@ static int aie2_alloc_resource(struct 
>> amdxdna_hwctx *hwctx)
>>       struct alloc_requests *xrs_req;
>>       int ret;
>>   +    if (AIE2_FEATURE_ON(xdna->dev_handle, AIE2_TEMPORAL_ONLY)) {
>> +        hwctx->num_unused_col = xdna->dev_handle->total_col - 
>> hwctx->num_col;
>> +        hwctx->num_col = xdna->dev_handle->total_col;
>> +        return aie2_create_context(xdna->dev_handle, hwctx);
>> +    }
>> +
>>       xrs_req = kzalloc(sizeof(*xrs_req), GFP_KERNEL);
>>       if (!xrs_req)
>>           return -ENOMEM;
>> @@ -499,7 +505,10 @@ static void aie2_release_resource(struct 
>> amdxdna_hwctx *hwctx)
>>       struct amdxdna_dev *xdna = hwctx->client->xdna;
>>       int ret;
>>   -    ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
>> +    if (AIE2_FEATURE_ON(xdna->dev_handle, AIE2_TEMPORAL_ONLY))
>> +        ret = aie2_destroy_context(xdna->dev_handle, hwctx);
>> +    else
>> +        ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
>>       if (ret)
>>           XDNA_ERR(xdna, "Release AIE resource failed, ret %d", ret);
>
> To avoid confusion, I think you want to pull the error string into the 
> if/else branch and have a unique error string for context destroy 
> failure or release failure.
Sure.
>
>>   }
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index 9ec973028221..e77a353cadc5 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -218,6 +218,7 @@ int aie2_create_context(struct amdxdna_dev_hdl 
>> *ndev, struct amdxdna_hwctx *hwct
>>       req.aie_type = 1;
>>       req.start_col = hwctx->start_col;
>>       req.num_col = hwctx->num_col;
>> +    req.num_unused_col = hwctx->num_unused_col;
>>       req.num_cq_pairs_requested = 1;
>>       req.pasid = hwctx->client->pasid;
>>       req.context_priority = 2;
>> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h 
>> b/drivers/accel/amdxdna/aie2_msg_priv.h
>> index 1c957a6298d3..cc912b7899ce 100644
>> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
>> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
>> @@ -112,7 +112,8 @@ struct create_ctx_req {
>>       __u32    aie_type;
>>       __u8    start_col;
>>       __u8    num_col;
>> -    __u16    reserved;
>> +    __u8    num_unused_col;
>> +    __u8    reserved;
>>       __u8    num_cq_pairs_requested;
>>       __u8    reserved1;
>>       __u16    pasid;
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> index c6b5cf4ae5c4..a929fa98a121 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -232,6 +232,7 @@ struct aie2_hw_ops {
>>   enum aie2_fw_feature {
>>       AIE2_NPU_COMMAND,
>>       AIE2_PREEMPT,
>> +    AIE2_TEMPORAL_ONLY,
>>       AIE2_FEATURE_MAX
>>   };
>>   diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h 
>> b/drivers/accel/amdxdna/amdxdna_ctx.h
>> index b6151244d64f..b29449a92f60 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
>> @@ -98,6 +98,7 @@ struct amdxdna_hwctx {
>>       u32                *col_list;
>>       u32                start_col;
>>       u32                num_col;
>> +    u32                num_unused_col;
>>   #define HWCTX_STAT_INIT  0
>>   #define HWCTX_STAT_READY 1
>>   #define HWCTX_STAT_STOP  2
>> diff --git a/drivers/accel/amdxdna/npu4_regs.c 
>> b/drivers/accel/amdxdna/npu4_regs.c
>> index 4ca21db70478..a62234fd266d 100644
>> --- a/drivers/accel/amdxdna/npu4_regs.c
>> +++ b/drivers/accel/amdxdna/npu4_regs.c
>> @@ -90,6 +90,7 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
>>   const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
>>       { .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
>>       { .feature = AIE2_PREEMPT, .min_minor = 12 },
>> +    { .feature = AIE2_TEMPORAL_ONLY, .min_minor = 12 },
>
> Similar to my comment on other thread, is this really NPU2,4,5,6 
> feature?  Or it's 4+?

NPU2 is obsoleted. I will remove NPU2 later.


Thanks,

Lizhi

>
>>       { 0 }
>>   };
>
