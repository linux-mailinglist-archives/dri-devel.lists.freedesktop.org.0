Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92949CCD364
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99A910E9FD;
	Thu, 18 Dec 2025 18:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dwm3XQLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013067.outbound.protection.outlook.com
 [40.107.201.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD8810E866
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 18:42:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQ7dP22+ixJ+sQ91ppd8AAylelwBvo7hcwDykBirZpwl+8YYhs7+FD+N2CjC2Y5l4ihF571QRluu7lE5f/NGxTeAX0aWmN4+V6R+b34EG07NLKIhjg2v0l7/sH2QWcx823gCRCmIV9Tj795gfZPia/+4KjZlia4mHmGZZTVXBpV2/rffdMrfeIBqz3wTxZSFfP+m3kmR11xBosKfe7s3jxcnzoggc28gCq7uaSll29woh9oYSC4qHhfkux+HUyekMRozISrrkJMUf9kpVJ2qrnv5ccx+OP19fTBEIjDgGKCKYyS9tlyZDO9f14eBA35KfK6oB+TAO34w3ofGuJEtNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUNbkk/b0ofxoKfuZEvdr76tQzPp7ZdKfwoKJLhoe60=;
 b=y+rdn0juqZ+O7y/SUMK2LSJ8FbapUnaYKQcYhZxYUK1vATUMAd3LKaUtY/mUeQvpjjb+UPb3r5BQOJ0ipPtiMLVoIOxgIuIevlKzediJu+sOHMv9B6LvBouIAnzaTkoWBZZk9SlyNATu0dPfEmS2y0vs89eObsYMndchtFQv/I04qcxOsfaq6/7wL9aHcWxwjykWV9qOGexAM/qer5NW3JPAHwxZ+AHOiUZ0vCYEGCJ7TF8FHmz458haaxvidJFo8A5LnUzArtyfUZj5gKhhmKV1Weh1f8aXBHpngLoR/ItxddTPDB+If0nVb9XgndpwSfT98gzmxkJuIYCg4xOdHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUNbkk/b0ofxoKfuZEvdr76tQzPp7ZdKfwoKJLhoe60=;
 b=dwm3XQLzyrGqBOiABvO1Dmd0UfymOkTyBuPrSYIg0QAOMxmzq920KZYlsoDpHIck1/MfBEj+DBmRQPxPy59KG+q5fYmuaRLHwD47E20Nl3tuSQrCg4yZXBiIlY9TH5GQ/yy50xBkLlU/NeoIIUzLOP/KHAr51iK/HqrhZ2W/lzI=
Received: from CH2PR20CA0007.namprd20.prod.outlook.com (2603:10b6:610:58::17)
 by DS4PR12MB9746.namprd12.prod.outlook.com (2603:10b6:8:2a4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 18:42:52 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::ad) by CH2PR20CA0007.outlook.office365.com
 (2603:10b6:610:58::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 18:42:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:42:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 12:42:51 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 18 Dec 2025 12:42:50 -0600
Message-ID: <17434cbf-2947-3c1b-d5b7-0ad9f5392fa8@amd.com>
Date: Thu, 18 Dec 2025 10:42:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2] accel/amdxdna: Enable temporal sharing only mode
Content-Language: en-US
To: Mario Limonciello <superm1@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251217191150.2145937-1-lizhi.hou@amd.com>
 <2f35a073-2184-4534-896a-b0d62871e12c@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <2f35a073-2184-4534-896a-b0d62871e12c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|DS4PR12MB9746:EE_
X-MS-Office365-Filtering-Correlation-Id: bc41991d-33b0-400c-3f91-08de3e653fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1ppZFdPZVNzajVGN0wvait6a0RTVXFVdFNXb3o4aWVqNUx0VFJwSUdMSEtx?=
 =?utf-8?B?Z29hMG1GRVRJd20rMkFQVlpKRmhjMDN2bXdnemZTMlZVTkM5blFUaWZ0R2Fj?=
 =?utf-8?B?MXBVZzZSUVBEYm9sdWJVZWNHMkppQ1FVbnF1WEdad3BjL0xCRmM3VElYbE14?=
 =?utf-8?B?Sm1pOWg1dWxleExJOWFiMnV5WWFuZitMUWE0d0RlS0x6Y2dHOFpkQlFBK3VG?=
 =?utf-8?B?UXRzNzlMQ25lMFFTTGlXOFF0K3E0azB1YWdQRkRBVlBGRnFkQXh0UGptT2hQ?=
 =?utf-8?B?VlFKODF4bnJsTWg3S3p1SkM1Mk0rNkdzcGZkbG5kUmM3TVlnaFpuWXlPTWFE?=
 =?utf-8?B?Q05uUlpFOHkzY3RuOUhJdEdxcVFWc3lqZElDdkN4TGxCTGtnRm5JYjJ4c2sy?=
 =?utf-8?B?WEE2SU1TaFlEdFNXVU5veVZsY2Y3YmJhV1VOcXlBRDlCYVg5OFpyYzhZamtQ?=
 =?utf-8?B?a1N1V0JqQ0UvanVuZjRxK3crb3VHZVFvc0tsTVo4dC9qS0ZMNEN4RFB2OXFK?=
 =?utf-8?B?dVp2SEQ3SGFCaHlNSTBzRVVlbjBocHBxQUFoQm9mcW9mYWljcUM4ZllsM0JD?=
 =?utf-8?B?d04yc1VEMXFnY1RqUXpIYVlaOGErb0NLcWdUOWtkRDhzbDBCcHBtN2dhRHlE?=
 =?utf-8?B?ZUJoem41dVdhVitqYjJyZHRiLzF0TDFzT0hWYVk2d29uejdsZFJrY3ljY3RJ?=
 =?utf-8?B?OXJpN1lhYUtYT2lzSGViNGJMWURzN3JBVTRqNzBuSk9zWEJnbWhVamZseHIr?=
 =?utf-8?B?czdUb1dTN2p6eTBHeVlNQlJSQlMvUlQxaFl6dFVRQjNwMkFoUjNXcXFVSTN2?=
 =?utf-8?B?QzFtc2hPZGxSd2IyQWt2WlZpVWlyY243OGcxZk9XVnpjNWV4RTRTZjFmM0hw?=
 =?utf-8?B?WncvbS83N3JOdzhuOHlwUkJFZDcrOGZObjhmeFlFblVPRWFJUVNpRTdiVjBk?=
 =?utf-8?B?bEoyQUE3YWdYaEFrOUNaWHFTY1ZiU0NoQ1ZyZHl4K1RNb0t1OWxzaFR0WmZO?=
 =?utf-8?B?THRQNWhXcnNVL1cvSGp0dmFrR3NsdTYwODJibHdBWnRVcGkvRFZWb3RTRWtz?=
 =?utf-8?B?NHJyVzdkdVFyU3dRamFOeU1BOXc2S0cvR0pBUlliMlVsS2xUMGhSempwUkdT?=
 =?utf-8?B?RzBVTG9jWlRzc0l3aEk3eWYvR2FDdmFNUFN5ZTJ3b25SL1RaZTZNNmNscFB5?=
 =?utf-8?B?OW9WUkoraktTZ0xvNTdZU3dnR3JSak1YWGtoZ1RRY1crZDJMV2dXdjlaY2JO?=
 =?utf-8?B?V1dnZWNsYks3YTY5UDl5dVZhRG1xeHlMcDJ6V3JRQmRiMFFWdmZUL010amlp?=
 =?utf-8?B?ZDNSVzNlN0F6RzZjOEtyd1JrWmxGWlNMd0V6c2dIVCt5QmJlajRuWVRnR2Rn?=
 =?utf-8?B?ejRvSHBRQ2RDRXJvQTlPRzMrWkNLZmY0V29tZUNLaDRqL2szZlFSZlRJR0VN?=
 =?utf-8?B?RkwyYjFqVkRybEIvOEdsdmtpZ0RJaVVjbldEL215cUNQK0wrNWdjNEpNY1Bz?=
 =?utf-8?B?N0RwbDhXV3RsUSs1aFp4MHVNMnZWSldBb2doMUdQZzNSVVhCSGRJM0R1RXMy?=
 =?utf-8?B?KzJiY0hPYUlGOUFSNEdMVUpCa1ZHam5NakNNMk82bE5nTXg3MDNFeDQ2bnpr?=
 =?utf-8?B?a3BaUW9HRjh1WWYyeW9zeUR2Y3lhQm5icjNBTjlNaFZ2SzZ1cHpNOG1Ic1Bq?=
 =?utf-8?B?Z2pKb3pFT1NFZmdlbFc4NjlrdWlMTHhTWGJoRGVQSVFzc29SMVVPS3ladHF1?=
 =?utf-8?B?Vk1ta0VvaERESndEMXBycW84RHBJd2o5Vnl0WW9peHA1T1dDYUxLd0pxSmM4?=
 =?utf-8?B?enBxV1JFN0dpa01EejVVMEh3cVB2ZjRIRzc5L1BLMDBROTBINnc5ZE1NSmVq?=
 =?utf-8?B?V1plZVpvK2xxK2dicjg0eEdjNHBmU05EVjRnUGIwLzRnTE9CdHZRQWZVTjJa?=
 =?utf-8?B?d3p2Z2ExOVJjOTl2aTdnb0g0eXFhc2w4c1l5QkhhYnI5bEhaOE01UUsrZ1Br?=
 =?utf-8?B?UG1uODlJc2xrNE00RG1SQUZtcFpJMGtGOS80eFBDQm1tWS85cmlHdmdxRjdO?=
 =?utf-8?B?MEh3MXI0WnRPajkzdkMxSi9YKzVEc29CaEM1UXNoUDZZQjgxS2tTOExyRmNW?=
 =?utf-8?Q?gTCg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:42:51.5882 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc41991d-33b0-400c-3f91-08de3e653fd0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9746
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

On 12/17/25 11:14, Mario Limonciello wrote:
> On 12/17/25 1:11 PM, Lizhi Hou wrote:
>> Newer firmware versions prefer temporal sharing only mode. In this mode,
>> the driver no longer needs to manage AIE array column allocation. 
>> Instead,
>> a new field, num_unused_col, is added to the hardware context creation
>> request to specify how many columns will not be used by this hardware
>> context.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>
> One minor whitespace comment below (just fix it while committing if no 
> other feedback).
>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c      | 18 +++++++++++++++---
>>   drivers/accel/amdxdna/aie2_message.c  |  1 +
>>   drivers/accel/amdxdna/aie2_msg_priv.h |  3 ++-
>>   drivers/accel/amdxdna/aie2_pci.h      |  1 +
>>   drivers/accel/amdxdna/amdxdna_ctx.h   |  1 +
>>   drivers/accel/amdxdna/npu4_regs.c     |  1 +
>>   6 files changed, 21 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>> b/drivers/accel/amdxdna/aie2_ctx.c
>> index 42d876a427c5..f99233041397 100644
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
>> @@ -499,9 +505,15 @@ static void aie2_release_resource(struct 
>> amdxdna_hwctx *hwctx)
>>       struct amdxdna_dev *xdna = hwctx->client->xdna;
>>       int ret;
>>   -    ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
>> -    if (ret)
>> -        XDNA_ERR(xdna, "Release AIE resource failed, ret %d", ret);
>> +    if (AIE2_FEATURE_ON(xdna->dev_handle, AIE2_TEMPORAL_ONLY)) {
>> +        ret = aie2_destroy_context(xdna->dev_handle, hwctx);
>> +        if (ret)
>> +            XDNA_ERR(xdna, "Destroy  temporal only context failed, 
>> ret %d", ret);
>
> too much whitespace inbetween destroy and temporal.
>
>> +    } else {
>> +        ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
>> +        if (ret)
>> +            XDNA_ERR(xdna, "Release AIE resource failed, ret %d", ret);
>> +    }
>>   }
>>     static int aie2_ctx_syncobj_create(struct amdxdna_hwctx *hwctx)
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
>>       { 0 }
>>   };
>
