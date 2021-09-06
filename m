Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EF3401A56
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 13:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7E689939;
	Mon,  6 Sep 2021 11:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2064.outbound.protection.outlook.com [40.107.100.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A445789935;
 Mon,  6 Sep 2021 11:05:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELRbqQ7RIv00vLvEmlds8wFoo4PxR62vNxRsbYfKD3vGJj2CMqHtAQZeENbQFh8pIbKHjB/TxHe2PXA6zlCa1h5dDmXS2vSxs5cEZAv3rZv2xg9AKZ5J9LAgy5W/FyW3HpN6oZYegQbopF2OaSLGmsg5MB3hDf7Xc/6jymWdbGT95JMgR6SOg4r2g7GzjWhP0STKclvNYpLTOyl8aoI1CtiSIHxNK7tkMR2Cae9jYakeF0hFuFMG2HkMl9aQqPGSffFEW2nLmfGgsKKNeNKJJYYL0q7MVm34m48NzPUzN1G4cT9fWwJaNz4xpzNtxSjrJ8HRj4IIk7RJW5y11CbTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=G2A30dNClCflSrn33h/V5C5sPwKxo90NdwUqtqL8iOE=;
 b=Qt7l6DdfQ6RFOaYyEcci87oNHRXccyGRjFV76MpZgUl0mnORMWO9Q8llkf4l8QWF/GXzUYKlu3uVsdLeyRKQmfPWDNwX7PFy9LCbCkfR5M/5OKtJBEH9CmDaz6m9WgJBR/R+VI5qr0vxTO2tZo4pqS7jDwTIJ0hUTpKF/tCT+pCMEaCtr9vSXTuiGsXh/yKWtb/dOF9Y5g77QVFtdKuq2Uo3oxWNB4luGpRV+jV+ZkqeQblcZlsh347YNoyHhgo1NydZSOPWH5EPrW79RTb+DilM1Rft4kHUGyDUQEU0nrWLBh0be9EPw3zhQ6HskAtM3r/CsR5pv4V0AtHieJTKYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2A30dNClCflSrn33h/V5C5sPwKxo90NdwUqtqL8iOE=;
 b=k655smi57XaQ/oz2Dlu7+ShNGz56YDueWNpR9lEGQvWoetZsYHpytssW1/ZNCPoiA+R07w1n5ql9PFQbTbm975+GW1xQmkmaH3rv4goFxF3tb3xyZ7UCZJwr8Ea5xJU+pz3aHYjwKATiN6snf1yyw8Z2qYdz5ukgBE0WaV29Fz8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 11:05:02 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 11:05:02 +0000
Subject: Re: [PATCH v2 0/2] Fix a hung during memory pressure test
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "chenli@uniontech.com" <chenli@uniontech.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210906011210.80327-1-xinhui.pan@amd.com>
 <6e225a21-aa39-d196-9d11-82705599445b@gmail.com>
 <0B48D156-01F0-4D17-B7F9-59EEECAE31B1@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <722b81e4-04f5-c951-00a6-c5c083c80712@amd.com>
Date: Mon, 6 Sep 2021 13:04:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <0B48D156-01F0-4D17-B7F9-59EEECAE31B1@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0089.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:e317:935c:f697:77f0]
 (2a02:908:1252:fb60:e317:935c:f697:77f0) by
 PR0P264CA0089.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 11:05:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70e77377-36b9-4f16-6855-08d971262cc9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43905E3223C6B0092DC7362383D29@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0rV9aNF13KJxM42zR2Zg3sJIha0SBb5XLU4+gZ8R337PaK7wKryJw38k3n/MUHIUxzDrL/7GUSUAPKm2/XY7f7GjISygGD+xWeI0ebI2pB/owAt+HSR18MjjjyoG3Tbcrtz96gsCsc98U9Gi5vj/kpYjMZx/Mm/lcTV12gkj7JZr7+5zpUGxdOy5pKY9m6CDqkb2Lo8UcdOFUsa1e1rQSflLvF3JHuvcTxVOgaz7EvnXAc3MCdgfh8z3sdUlYJczRjRzH3kfhN+VomOSFsSeTJDeOd8Rb6YfGTlkCLkcwSXIIcmre/qtrDMX2N55uWnSAc60Rn5ajFNbh1G9LI/H1qoOJ15yHpwUxoRp8oh2hv/v3brcNLCBHnAPWnEd2qHuw+vP+Mu9QtEPEhfpiEH6yytpsuSzstHmzq0obsrpTnUnelB2jV9AaBqGJPTRbEs2EaSrzXnvMwq7lY8IHOP1+wEEyoEg11endqK7Xh6AhY7nl6zX5S3XkAAhpnShaycbnJxNEg8eSnnVZhHCKAAi+vNKFX19AbP5iB813pe6HD+2KZcoWH+YQlX3zo7PQLgd/2giKsT6u7tCmhO3Olxz+C5T1XWvUBQv+NRD9aLoNAUO4JqaoVm8ZxpefbYZzZad83wnWQ631PPMkU4n0+7yUjQPUuedXr/hNv0HGV21pVZhj1ARrNPIW7d/JhsI9eY8ZlBu+FFLHft6p71uQjhFnI5oryJ+gxH/k8oezSLQUF43ZqyKtJ0DDcjwSFj/ta9b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(86362001)(2616005)(54906003)(66574015)(2906002)(31696002)(6486002)(31686004)(5660300002)(4326008)(66946007)(83380400001)(478600001)(66556008)(36756003)(38100700002)(6666004)(8936002)(8676002)(66476007)(186003)(110136005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFU2aGp4NnA0YmxjdDRoUVlXQm5UUUtuTm9Ray9VMERPL1dDTmxVcVpmTWRK?=
 =?utf-8?B?UmlDZkVRODI0NEx6ZU50UWl4cTEvb01ubytManBSaktjbXRGeTNsaGVTT0FZ?=
 =?utf-8?B?eEdkc2gzdThqdzhGSUtSaDY2MGFTbmgwdGR5bG5JZVZaSmdncGtxRVRUdkdZ?=
 =?utf-8?B?S3ltaWY4MmxlV0s2RG9ybWV1TjJVcXBYczBNSVpxd3Rzb1g1S0dYUW8zMkR6?=
 =?utf-8?B?bzU2V2lRTkJlVUZsM1NEbEx5NzNlZzJwWUtOM3F4ZWJoZHZkL3JHbEt1dHJs?=
 =?utf-8?B?K3l1d0xrSmtvZTdpQWRiUkZCeXFHZ1dMRkNDWWZNVExLNmNlVkUxdUovcWhO?=
 =?utf-8?B?bW9TVVVFNzUrOFhQM3VJMktudDBLM1k5ajlNTlFPMVV3MkUvd1VELzE0L0Nq?=
 =?utf-8?B?UTUyRU5hSGFPd2ltV2pnU0tsdEZmejllWjNpMUgyNHBzRWlHYTFmVmdQa3Jw?=
 =?utf-8?B?cVVKOFJEdVlUOENzWjJ1N3JUMERXWDdTdFZXS2puZnhUQStBSVJON2dTMG9G?=
 =?utf-8?B?QkRta2JjUzhMWU1TY1pMVXk4SllqZXo2RmhraVZTZnZ4cHRUN01vRWJ1Vk52?=
 =?utf-8?B?ekVaSzNNTjFraVh0SWE2aGRJV1VUUUM2MUtBUUJyRGlFWjUyRkpPaXYreTdS?=
 =?utf-8?B?Z3NaR3Vqd21pZE1XS3EzZ0Fnbmt2RHhZaHV0UjhuTGdvSEV1K3RKZW93R0Vp?=
 =?utf-8?B?U25sbEpNb1BicGswSDlFN2dQMW9RSldaSmdQVkZjbkxSZU4wd1E3VDYwNHlC?=
 =?utf-8?B?SEN3K1RXblViQlh3Q294azNlU1VpV2RCSy9FUUdkdXNIenRaaW9NYjJ6SU55?=
 =?utf-8?B?MkJCVU91b00waG05eldGNGZxWHFIWVNqVW9ibE5Obk5kZmJBTjhtNnJya0Vx?=
 =?utf-8?B?a095WkNDR2cyK3Nvc3ViTFBjR0RLZTdTNGZCQlZ5d1VwS01lRDMrSjYzbDlo?=
 =?utf-8?B?RGsyMHBNWDJlcHpCM3FhZEJ0Njdjd0doWHJrbzFpaTRLL21WYm0yaUNRc0M3?=
 =?utf-8?B?N1dTZ1YraWlGTXRidS9relBrRjVmaTVJZS9IaHVtOVE3Q1BIdGJTSmUyeVY4?=
 =?utf-8?B?NzZZYjNiazVuNm5VejZqWHU2elkzbUtEQW1ndW1NMjg2OXhoZ21ZVTdVblBl?=
 =?utf-8?B?L3Z0MGNzMUlDa0xwY3haeWJDcklLbkNPRm1oN24xMGZvMHl5akY1cHR2dE5L?=
 =?utf-8?B?RThNVExVZFdXWVBFekdjdURZbzhDVmltZmczSzZKSGMxSDAyWVBGS0VoVDM4?=
 =?utf-8?B?R3gwcUJrV1VVQW9xRVltaEIxVkpDU3hub00zZUxBK1IwL0k4Z0JsODk5cEh3?=
 =?utf-8?B?blAwcnJSZVZlSm5pRVgvK2lMZEh5M2t3d25EcXI1UWdpay81MVlSd3NRSURw?=
 =?utf-8?B?WDQycVh4TVFnbjBlQzBKVjBZOWY1S1I4UW9jR09jTVRCNGlQODE5ZHQ0OEh0?=
 =?utf-8?B?R05sVnRoeGpFSThNUkJRRVZjYzRBMWVBNG9ob0s0b3p2RTczcHpKcXE2N09w?=
 =?utf-8?B?TGJGbUg4d3JTNHpmZlVDTmw2VkErenN0alE1RTlGNmRJRU10UnJrdmRnVUUz?=
 =?utf-8?B?OXRnbXJPZStOYnNNLyt4QUZZSXdFNUVPRjBmakF4Mi9FVEVKU3R1OURaSERv?=
 =?utf-8?B?R0RaZ20zTndrUnV1WEpxeFF1TWpuSG5vSXo2Y1N4cStKWDR2ZEM1SER6dnJS?=
 =?utf-8?B?TUN5TzVkclBOcHB5b3h6TjhUUWxtYnZoTTJocFFhMCtIYWxhWEpDT0p4YnNG?=
 =?utf-8?B?ZEY1SlhzMlhYdlNrYW9rWURhaWI3d05SZFBoMm1ITWdTSE9Hb1pxL1BwaEpa?=
 =?utf-8?B?N2tSQ3RNQk1tYytHUWNtdnJlaUJiTWZ5dk96TEU2WGJSWlVXYlZRUWhyN0Vn?=
 =?utf-8?Q?sDGE3HkartmMz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e77377-36b9-4f16-6855-08d971262cc9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 11:05:02.5717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LromJD6XDG6nui2IY1s0/7DOGSVcSf3i0QYDFLgBxQdfA+S3dcZ9fwK0N9ac3amn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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

Am 06.09.21 um 12:16 schrieb Pan, Xinhui:
>> 2021年9月6日 17:04，Christian König <ckoenig.leichtzumerken@gmail.com> 写道：
>>
>>
>>
>> Am 06.09.21 um 03:12 schrieb xinhui pan:
>>> A long time ago, someone reports system got hung during memory test.
>>> In recent days, I am trying to look for or understand the potential
>>> deadlock in ttm/amdgpu code.
>>>
>>> This patchset aims to fix the deadlock during ttm populate.
>>>
>>> TTM has a parameter called pages_limit, when allocated GTT memory
>>> reaches this limit, swapout would be triggered. As ttm_bo_swapout does
>>> not return the correct retval, populate might get hung.
>>>
>>> UVD ib test uses GTT which might be insufficient. So a gpu recovery
>>> would hung if populate hung.
>> Ah, now I understand what you are trying to do.
>>
>> Problem is that won't work either. Allocating VRAM can easily land you inside the same deadlock.
>>
>> We need to avoid the allocation altogether for this for work correctly.
> looks like we need reserve some pages at sw init.

Yeah, something like that should do it.

But keep in mind that you then need a lock or similar when using the 
resource to prevent concurrent use.

>
>>> I have made one drm test which alloc two GTT BOs, submit gfx copy
>>> commands and free these BOs without waiting fence. What's more, these
>>> gfx copy commands will cause gfx ring hang. So gpu recovery would be
>>> triggered.
>> Mhm, that should never be possible. It is perfectly valid for an application to terminate without waitting for the GFX submission to be completed.
> gfx ring hangs because of the command is illegal.
> the packet is COMMAND [30:21] | BYTE_COUNT [20:0]
> I use 0xFF << 20 to hang the ring on purpose.

Ok that makes more sense.

Thanks,
Christian.

>
>> Going to push patch #1 to drm-misc-fixes or drm-misc-next-fixes in a moment.
>>
>> Thanks,
>> Christian.
>>
>>> Now here is one possible deadlock case.
>>> gpu_recovery
>>>   -> stop drm scheduler
>>>   -> asic reset
>>>     -> ib test
>>>        -> tt populate (uvd ib test)
>>> 	->  ttm_bo_swapout (BO A) // this always fails as the fence of
>>> 	BO A would not be signaled by schedluer or HW. Hit deadlock.
>>>
>>> I paste the drm test patch below.
>>> #modprobe ttm pages_limit=65536
>>> #amdgpu_test -s 1 -t 4
>>> ---
>>>   tests/amdgpu/basic_tests.c | 32 ++++++++++++++------------------
>>>   1 file changed, 14 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/tests/amdgpu/basic_tests.c b/tests/amdgpu/basic_tests.c
>>> index dbf02fee..f85ed340 100644
>>> --- a/tests/amdgpu/basic_tests.c
>>> +++ b/tests/amdgpu/basic_tests.c
>>> @@ -65,13 +65,16 @@ static void amdgpu_direct_gma_test(void);
>>>   static void amdgpu_command_submission_write_linear_helper(unsigned ip_type);
>>>   static void amdgpu_command_submission_const_fill_helper(unsigned ip_type);
>>>   static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type);
>>> -static void amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
>>> +static void _amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
>>>   				       unsigned ip_type,
>>>   				       int instance, int pm4_dw, uint32_t *pm4_src,
>>>   				       int res_cnt, amdgpu_bo_handle *resources,
>>>   				       struct amdgpu_cs_ib_info *ib_info,
>>> -				       struct amdgpu_cs_request *ibs_request);
>>> +				       struct amdgpu_cs_request *ibs_request, int sync, int repeat);
>>>    +#define amdgpu_test_exec_cs_helper(...) \
>>> +	_amdgpu_test_exec_cs_helper(__VA_ARGS__, 1, 1)
>>> +
>>>   CU_TestInfo basic_tests[] = {
>>>   	{ "Query Info Test",  amdgpu_query_info_test },
>>>   	{ "Userptr Test",  amdgpu_userptr_test },
>>> @@ -1341,12 +1344,12 @@ static void amdgpu_command_submission_compute(void)
>>>    * pm4_src, resources, ib_info, and ibs_request
>>>    * submit command stream described in ibs_request and wait for this IB accomplished
>>>    */
>>> -static void amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
>>> +static void _amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
>>>   				       unsigned ip_type,
>>>   				       int instance, int pm4_dw, uint32_t *pm4_src,
>>>   				       int res_cnt, amdgpu_bo_handle *resources,
>>>   				       struct amdgpu_cs_ib_info *ib_info,
>>> -				       struct amdgpu_cs_request *ibs_request)
>>> +				       struct amdgpu_cs_request *ibs_request, int sync, int repeat)
>>>   {
>>>   	int r;
>>>   	uint32_t expired;
>>> @@ -1395,12 +1398,15 @@ static void amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
>>>   	CU_ASSERT_NOT_EQUAL(ibs_request, NULL);
>>>     	/* submit CS */
>>> -	r = amdgpu_cs_submit(context_handle, 0, ibs_request, 1);
>>> +	while (repeat--)
>>> +		r = amdgpu_cs_submit(context_handle, 0, ibs_request, 1);
>>>   	CU_ASSERT_EQUAL(r, 0);
>>>     	r = amdgpu_bo_list_destroy(ibs_request->resources);
>>>   	CU_ASSERT_EQUAL(r, 0);
>>>   +	if (!sync)
>>> +		return;
>>>   	fence_status.ip_type = ip_type;
>>>   	fence_status.ip_instance = 0;
>>>   	fence_status.ring = ibs_request->ring;
>>> @@ -1667,7 +1673,7 @@ static void amdgpu_command_submission_sdma_const_fill(void)
>>>     static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type)
>>>   {
>>> -	const int sdma_write_length = 1024;
>>> +	const int sdma_write_length = (255) << 20;
>>>   	const int pm4_dw = 256;
>>>   	amdgpu_context_handle context_handle;
>>>   	amdgpu_bo_handle bo1, bo2;
>>> @@ -1715,8 +1721,6 @@ static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type)
>>>   							    &bo1_va_handle);
>>>   				CU_ASSERT_EQUAL(r, 0);
>>>   -				/* set bo1 */
>>> -				memset((void*)bo1_cpu, 0xaa, sdma_write_length);
>>>     				/* allocate UC bo2 for sDMA use */
>>>   				r = amdgpu_bo_alloc_and_map(device_handle,
>>> @@ -1727,8 +1731,6 @@ static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type)
>>>   							    &bo2_va_handle);
>>>   				CU_ASSERT_EQUAL(r, 0);
>>>   -				/* clear bo2 */
>>> -				memset((void*)bo2_cpu, 0, sdma_write_length);
>>>     				resources[0] = bo1;
>>>   				resources[1] = bo2;
>>> @@ -1785,17 +1787,11 @@ static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type)
>>>   					}
>>>   				}
>>>   -				amdgpu_test_exec_cs_helper(context_handle,
>>> +				_amdgpu_test_exec_cs_helper(context_handle,
>>>   							   ip_type, ring_id,
>>>   							   i, pm4,
>>>   							   2, resources,
>>> -							   ib_info, ibs_request);
>>> -
>>> -				/* verify if SDMA test result meets with expected */
>>> -				i = 0;
>>> -				while(i < sdma_write_length) {
>>> -					CU_ASSERT_EQUAL(bo2_cpu[i++], 0xaa);
>>> -				}
>>> +							   ib_info, ibs_request, 0, 100);
>>>   				r = amdgpu_bo_unmap_and_free(bo1, bo1_va_handle, bo1_mc,
>>>   							     sdma_write_length);
>>>   				CU_ASSERT_EQUAL(r, 0);

