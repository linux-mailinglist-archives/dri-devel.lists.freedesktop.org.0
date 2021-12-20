Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363DE47B39F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 20:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE1611295E;
	Mon, 20 Dec 2021 19:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B476112948;
 Mon, 20 Dec 2021 19:22:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGKiH92UGveDdtnJO3/Q6Mtw4ZN9mT8E78xBtq3i+2X/TgQT3CGhtZWwNP8wC/cNFhrfkMa6aSIkISPaaaTcM8qjlH1cIAwl3IZ4wFInIbzAKGFu7RCJfr/Ao091utGnuBy8Se4AD4dWH1AwUYOII+jSaKAYNpb56gDdQorQqk05mFOgB3cF2r6wJPBk5p+jr+cuOx1XWy9NgXhq2UGuyiCjbw1EwBcIDwBTxZkC2RAWdO7VdJiRQN6BbkTI6CBBjxv36oSApiI+afJY6M6dmqwD9oVi6wq2oLkWAT7xIO3Py5rmMPXimAMQ5+cXU4iz5WKF/nuRqFYcpfMAecqt1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jtdm4ktODZ37tyYrngFMG64l//tPFl93RTWjX/MzAQQ=;
 b=CrRMXyg/vu43M1DkX/l0ndveK0QjVOkncd8iaVx+jFgRsyvEyvUct2CeR/v0c+H60tahlPo8c02YWHgzJaXHvqG0BITFgMg3wsvYAeoY2Pi04PBsBmIElBFTyPmN949E3C9AfzLeU8sur+f0JNEA9Qe/3JK79btLDmWvcjZlPugg0lfBcWzMN6JS/cO2k34IlEjrbeChE+9w5iFDFoaj52pKIx21P2DfGZ5wWvKvXPWAw+472aPnKzAqMzg5l2+xDjsEvVxWiq1aW9eAzl8IogCSGMYES1sb7ckuvUX/6hgrSDioNV8+ym1e7pxwC3iplgY05eWVQ6ol90ow+74N2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jtdm4ktODZ37tyYrngFMG64l//tPFl93RTWjX/MzAQQ=;
 b=WVoOummi9fDz/YSO5oC6PXDU6jZCppCLucHavhesVn6/Tf1hAZayk1APqI9I0LdWNgcdvrD4Urs6g0D3XFqnHvvvZE3Ed9uVq17VPDmX4LY4kL64YAXgt4iPutkG1EyRjCjMZBKVrGjfcuKXGI6ZP75ksMTlBfT8/J30zO4xN3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB3194.namprd12.prod.outlook.com (2603:10b6:5:184::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 19:22:54 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 19:22:54 +0000
Subject: Re: [RFC 3/6] drm/amdgpu: Fix crash on modprobe
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <20211217222745.881637-4-andrey.grodzovsky@amd.com>
 <bdbb195f-a9a7-2129-deaa-93e4e49cc8a2@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <72fe2521-ef31-63d8-6bcf-67af5a74330e@amd.com>
Date: Mon, 20 Dec 2021 14:22:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <bdbb195f-a9a7-2129-deaa-93e4e49cc8a2@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: CH0PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:610:b0::31) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c2f3519-7ca2-4071-29da-08d9c3ee1f0f
X-MS-TrafficTypeDiagnostic: DM6PR12MB3194:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB319487EE100787C444FB441CEA7B9@DM6PR12MB3194.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36icOxgxaMOdId13cmjagflXai2mO9/pOZUd9J1d0K/zxW/ApYB7OYnHJ2srYeXAw1uWMNT4ZXFS89fnFVSM/jwuL2m7Btw9DUyiPbUpf3dfirstkKOrd9xUhB+X3PsFLKuk9lnOCZ1AeVa3BOSBYLlbzxpRDPEdOzjbtegm4MGJQJ8hlXZjzDD/SXFu3/o8Wc3pfNhzNh9nRyg2cUyDKiceqFY2OY1s1T/Vm161c3lSYli2AKPnMPu3Kq2WxhJ25KjpCRP/ZLAmLS6UsacKCIaAQ6WPSptqCtXflTPdAYM4qXwSOWsx63+dme2RWmZ8e5qtlXqazq6zxFM4zwGf+/FEe/tUUBzQMNxz7CfrPBm0zU4RvJE0TxYzCSg40KyLOH3A5sZa10H1MWmqidAMnqrThcJRXfnVqsSTXbX5jxOs+o5JwgSRwm0+pxTOdU0y/BBmhp8yMwh5HXaOzbaQKvmmmTGmias+l8t5fMv9nYPQWYPeka4/jPuOAQ1C1rJNE/Ni3Cb6G5QTD5LHbIsn9WZFvCwCfV658Lui2rHfn8FVHfMWJbPtsCB7k6YgnHQfmg9HrQYcVhykc803xKXAL08qXF2A4OrJA+ODLTtGilNwbklsadx7/mLuyp3dD0Txexd3mieDZ1UrnuaBhijtx7mtdxyoaei68r9RqoRKeR0WzJBR8OM1i9JxD7bH6IS2EUqC00zz1zIAWOQhQ1B1TdyFIC/7eolLsQLRghgAHZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(6512007)(36756003)(53546011)(6666004)(86362001)(6506007)(8936002)(2616005)(66556008)(4326008)(66946007)(66476007)(2906002)(508600001)(186003)(8676002)(83380400001)(31696002)(38100700002)(31686004)(5660300002)(44832011)(4001150100001)(316002)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1lkdVFzTDQ2OHBNSDUrRFdwQ0xEKzFIb3J1M2podzhaYXpLdFdWakFaZUds?=
 =?utf-8?B?UW5vVHpncXNaOHBPRUd2UENlZ3pMVmJRY2RoenNwa0h0dHNoUnBWazl3TWJR?=
 =?utf-8?B?YlVabGhJODcrVC9EQWFuUDgxd2pVdG1YVjM4MytVa2ZMRFRENjZzY0hHc0Zi?=
 =?utf-8?B?THp5R1ZBUW83QSswZGRjYlBIbGNXN3JZek1JdVE4Uy9pWHAzWGdWOHBNK1cz?=
 =?utf-8?B?V0FRYUZqNkcyUExvNVpXNks1cllhc3V6bGsvRmxvT0s1djUxcVNuazBERzVi?=
 =?utf-8?B?cVNyS1dXejB2MmpqMG5SS0JMd3lab2dGR2padHcyenRUOWQ5MVN0UWluSHda?=
 =?utf-8?B?aUgyZWtzaGZ1T0NZQTlCMFh6cERFR0hqOE41dWpRSXZhWDhhdUw5QTdoZVAv?=
 =?utf-8?B?c1FOdGtpRUZwMU96SkdRNDJTVUprVVdPeU5Ya2Y3MVBLQnBGU3hxYTVpemMx?=
 =?utf-8?B?S1owSFFlbVZHNnFjTjhMdzlaM3dLRFF2MnhpM2pIL0dPV0xlOHBNS0pHdmt3?=
 =?utf-8?B?K0c3aGNRT1ZveGxzRWtYR2tyZDZYSUFSa1BUTXIrK1NzRXlTbVdGUEIxYnZZ?=
 =?utf-8?B?a0pNdjM5and3WGpFQW1iU1BkZThlRUMvNzZiUnpobnpaREVDUXRsQVZPYU1l?=
 =?utf-8?B?M2xUQisrTE01Q1F3YzZlNmpQK292WWtFckRWakFHczc1RENVY2pILzF1bFhs?=
 =?utf-8?B?aVdwZWcxTk9HcVZQSTRZUzl2OEVzYmVYQ0h6cmltenlpVmgrTWtJTWZJazdq?=
 =?utf-8?B?NHFockxtUmVCMWxGeHRBRVFiRzB6WFlpYWlKZThqTm9qSnhZQlZ4Uk9XMnhz?=
 =?utf-8?B?Q2lydUordVRselJMcW9OU3RlRHFqZ2lJa0VESSs4MFJIRFpzdlJrSXlVRWtl?=
 =?utf-8?B?bHZORFhHR0RWdlRYVnpjS1ZkRWNPWVJROUtMdmtxTWlmcEI1MkRUeHJWbXUx?=
 =?utf-8?B?a0J4S3A5bWRPdFNlZXc1SEllNmNYNmpmZnhJRC9VMDM0MGpHb0phTGVKdHFM?=
 =?utf-8?B?R2g4b2tMZUdkdXkzNy9lc2VrUmVzMm5jdTVtSzFNUENUemhyVnF3L2cyV3JU?=
 =?utf-8?B?ZmNPY2xLTnFTSTBTdWJadUdmUm5ycytiWmJLOFhsM0pmM2Y0ODY3eWV2MWUw?=
 =?utf-8?B?UlNBajErdmgxWDZ4SXdIS1gyNmpVWU5RcUlYRnM4TVRXNWRpVWRST1UxRXk3?=
 =?utf-8?B?U1IxUDYyWnFOSEsyekVuR0toY1I2djU0dkUwMm5pZVViM3hKTERzODArdk0x?=
 =?utf-8?B?NjNBandYanBodnpqQUUxOWswZ3lOT1V3U2dKZjZJNzRsUDIvQ0RKZm9RNitk?=
 =?utf-8?B?Y2haUXpSV2xndjRIQUJLWUVSTUxaRVhvRXZFWSt3cEJ4R0ROVmZYMUhFT1Nm?=
 =?utf-8?B?eFc4SjEzaTlWSlNtSHoxQng1T0pqM1I2dWtwaDA0S1I1aXJRZ1o0a09Uak1K?=
 =?utf-8?B?QmRaV3k3V2RBdU11QThoT3MzeVRjckljVzRJK0Z4QWMxWm5kRXEwcDlGbkFF?=
 =?utf-8?B?L3IvSUptYTBjL3ZKeitlcHlnbGZWTlRDcEtLbkIyQXo2MFdvYXJWa2ZCZEpz?=
 =?utf-8?B?czh6ZGRsYkpUeWRaMTkycTZZM3N4ZVFINUhiOU1UZ2NNZjF6eGlpTTcxT2Mx?=
 =?utf-8?B?eDRZWXpHNThtTmNMZlRUZzhVR2hSTktTZ1grV1BQelpDQUMyeTBOam1zRzVM?=
 =?utf-8?B?SWhDNzhIY2FiRjYvNjR6WjFpNllYZWlXZG9Fc3VzM3ZZV283VDdla1JPUVJ3?=
 =?utf-8?B?enRqM3RlVXJSVVVjUjkxSFRLWUxzdGJBNDFuM2Fxalk0ckJwRCtXeW1ObUhx?=
 =?utf-8?B?UG0zTFZMZTRQWURlL1RxdTdUVzJ5WmZ6M1pJWGI2dDJYZzRzZWlVUzFnSjRI?=
 =?utf-8?B?MWhFWnF6RGQvVWtsdEVIY09HdXBnR2NDbTJoNnZCZGU2bTZWTjdtSkhLbjc3?=
 =?utf-8?B?NkVrTXJXd1NLN2xjamFxV3RoVFR2WkNWaldGeFZLRk5CT210U0gzTlpjWVBj?=
 =?utf-8?B?a000LzBoQzEwQk5mYXV5YW9JU3NHaC95OUZYTlNBZFVBOCs2REtZSXA1bU5R?=
 =?utf-8?B?MzZXQmlXNHZlRzZGT21Ndm1BS1ZtMGJTaDFzY3huRmdUR052VHBnOWY5bU44?=
 =?utf-8?B?cE5rblFhaExJYlZucCt3N3E5Qis4TEFJOFZoU2R3R1hORkl0WWEwYzlnUXZV?=
 =?utf-8?B?eGxDU1dvUURkRHVrMll5K3Zod0xSMHVyVjdBYjh6Q2tRelYwdHZZcS8xam9C?=
 =?utf-8?Q?uBMzqQ0RKaPvmO2f/PKt/GnaHxAgTvUG9NlnxaKjQw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2f3519-7ca2-4071-29da-08d9c3ee1f0f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 19:22:54.1762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gU3k6in8EqoxTb68gFVTNTCWrfMLLCYuXsZxY+MKPMSZAljy4btdCBmJXovrHLpPhp6vJGkiCq/6gkx0bS9brg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3194
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
Cc: horace.chen@amd.com, christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-12-20 2:17 a.m., Christian König wrote:
> Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
>> Restrict jobs resubmission to suspend case
>> only since schedulers not initialised yet on
>> probe.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> index 5527c68c51de..8ebd954e06c6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> @@ -582,7 +582,7 @@ void amdgpu_fence_driver_hw_init(struct 
>> amdgpu_device *adev)
>>           if (!ring || !ring->fence_drv.initialized)
>>               continue;
>>   -        if (!ring->no_scheduler) {
>> +        if (adev->in_suspend && !ring->no_scheduler) {
>
> Uff, why is that suddenly necessary? Because of the changed order?
>
> Christian.


Yes.

Andrey


>
>> drm_sched_resubmit_jobs(&ring->sched);
>>               drm_sched_start(&ring->sched, true);
>>           }
>
