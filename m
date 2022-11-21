Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AF2632C00
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 19:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EFE10E32B;
	Mon, 21 Nov 2022 18:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3A910E32B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 18:23:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HayqF3TLbBXrras7ayX89FXEwzVdu2pOXZQg26baejbdFbWXQpqiRHiiAhyI1uUKpLeSefYZZDPacYVFaaHCN+VZ9ufHCocdUPysP1R/z7FzNjFm7ogxHUYQZKgL/qlGastgJ4s+xDOtG736gQLcO3dgO8P47WvR+fJduXTBny9XmmfKYWdp0Z6RLB+mlqVUCv0T0fdNnB8GPowMS0Q05KxzyvufXAutEQV0iM1RQmtn5XMmBT3E60V7UBKuQbh1k34f1UFXJsvMCuM36QuqXvCe/9i+UWlEaQEaTebn24RZxpFSVBmuetKCtrfTkg7mr4U9D5mqxfnV3KB7Q5uU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sd94KIH+sYGgce1JYwwhFgKO/8+i5k7+bIB5l8KNU/s=;
 b=nZOuktSnQQEjeOvDx2BXcOl+cVtMv3kXeeWcApAF84sC5iuQYxnKCQIWxZkHsG+gfUfBJgUn8F3JyfBcNhTuiGXYw7pFDhLW7QHLlJpyXvanyacU1hP+TtMgOTy2g2UGFdMOa7TBaFJRJ8r5osspAgx/rpW4DDJeycEpBsEwgNVIA3FvYJXhh3MvGTEfZSWtQzGU66YMHEDwC72eq8r1alzWveUlFf0SH2Z5QxOwASQxCffyMTeg8VS0XXPY2AbRoOshdG+1TXzYLXUfbYxwCo2HyaafyjDPbGu4ai/cEUthI/iV/AnBXfFEephE63olm1bGXOtY9H1YMNxfU/RLOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sd94KIH+sYGgce1JYwwhFgKO/8+i5k7+bIB5l8KNU/s=;
 b=AQI+ZXKd6bAOcRtNPJCjVCE+vjmt1MB5mVitzux1c6Rk3iX6ql+secg5Mdn9/leT0XJ3lvckk0tC5BgmZOBy724EbTtAoR/2SyWLAYs4ovhYTPoVJCcluwrUJUoijLIoVI654hW9GWdazVZDYkJMKQt/+MSn5zUlAb0A2tHaRL8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM8PR12MB5461.namprd12.prod.outlook.com (2603:10b6:8:3a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 18:23:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5834.009; Mon, 21 Nov 2022
 18:23:56 +0000
Message-ID: <56393e84-485b-42ba-5fce-d4a0d0017653@amd.com>
Date: Mon, 21 Nov 2022 19:23:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4] dma-buf: fix racing conflict of dma_heap_add()
Content-Language: en-US
To: Dawei Li <set_pte_at@outlook.com>, sumit.semwal@linaro.org
References: <TYCP286MB2323873BBDF88020781FB986CA3B9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
 <TYCP286MB2323894F9939C27291FD998CCA0A9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <TYCP286MB2323894F9939C27291FD998CCA0A9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM8PR12MB5461:EE_
X-MS-Office365-Filtering-Correlation-Id: e7060fa7-e589-4a13-d494-08dacbed8d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xyjB+20I4dnPfCwVME/1x/S3iDMz9hqJ3Go7e7Z8JkvsZYUympWWEWjQeYJABO/uvvO3fp2f1A1Svl+7UhNKE3P91Jn+VRDfXji+KY6GRi+nGrzoQcFq/ddDKAgUd9+67qa6WgaLJpIzjVCjIR+MncVnyAI/7BF01lSJsoRhs9i5bJ4VunfZxVqAYowxIZ+lCZKrIdY0g4TLrkNhvGvRx+EuZ/86lyaQsLFSlkaTbaKmJ0PRCga9ogQL2aOaIAbf1CbHAcafscHL/uIvhncJ2HaOEW87VDz0xevgxqnfNAJnNi/AM8zXZtucxiW9qqTEn1RfhPE0xYWzJCHRdbtPJoYK5fF5A5vISYpuwCj3Kvv3rhTLPU5DX9N82T4E4fv+k0KA7PDC8rmWDhRsypDUy+ho01jZaHxhGnsqRadl6KwxsZqqK41k5hNAMfPBn0yOqEgst/563UTMUdWNfDlcOtBxQvE617sRu2WonappkcWBEYlJFacfi3IeeroLygDbAlV+m3wJ/p5R3mVSJeMEwFSAVQP+wYRedcapJSL4EccuyXFw1B/Sw8JnB4fVLvC2Sf9oFQAxfsc5lLCkOypy0pSXm26qJWAHq4nTpYOjQoVh6850kPo0etJurTQ4J0AaA9451+2CY9QOtM2vuQyJH0RxTsoa9n9WmDYBG/aJ3lajQhhqrFw5TgH69ym44SaPElncfNVq9kdKlcUigaaff34gd/EFOE0CyiUSFSSWPxm/tGLnhnmqULAMrxO9wz8fBHndBtUTly2fsZIwvRgMqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199015)(38100700002)(31696002)(31686004)(2906002)(41300700001)(8676002)(66556008)(66476007)(4326008)(316002)(66946007)(7416002)(6486002)(966005)(36756003)(45080400002)(478600001)(6666004)(6512007)(6506007)(86362001)(8936002)(5660300002)(2616005)(83380400001)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWY4ZUluOWowcmVYTjI1bjRVT0FLbkExa29tMHNxUEtLTDFRcFhmWEhaVXhU?=
 =?utf-8?B?UWRFWUs1bnh5bUFCbi9xVFp5bDVTZ0pUTS94OHBTNlBpdjhkTWdRUDV5Y2c4?=
 =?utf-8?B?RFVrK2Z4bnRlOGp1RUFRMXFEczQ5NkNkNmsvZE5DMnFTOW9DZWNnZGR1K2Zz?=
 =?utf-8?B?L1F5WFFXdVVTOFZJRm9QZ2UwL1B2OTlLTUlDaDBVK1BxdksrUVFRc2NvOUFr?=
 =?utf-8?B?UUEwZ3JNV2dBUDRZcGNDMHEyY2RwMERMVkh1RDlXaW9BMFl6WkdrcGF4eVlG?=
 =?utf-8?B?TVZzT3BDMjRjYW4yWUtUVHpyZWhQUHBiVFpXRHJnZjB5Mm1TOHhKa1RFKzBV?=
 =?utf-8?B?QnlLQU1jRDVVbWR1N2tmdGFyRFM4UGNVRU9salVDRXlYMWRZK0x3Zy85NTly?=
 =?utf-8?B?WURRUkpOVXNCQkhtVWZwNGxkdXNxTkVYS0xpME84M1V1aXBnRXNOejE0c251?=
 =?utf-8?B?aTJtNlBPYWdUWWVYMUtnMll3ZTh2T3dMNmZXRjhvQ3lGdWxWOWVUTm1xblY2?=
 =?utf-8?B?ZE5WOUtEVFhXK3BVYXFXUm1mSTMvbFNobFZnR0tEaTQzU2dJWVQ4bHl3Y09q?=
 =?utf-8?B?SjZFRlU3YTZrY0h1YkFCUEUxUlVvRUREVmRWbFVlMFluRTdmalJDUmhndW1E?=
 =?utf-8?B?U2lnN0pldlViNElpZlExT3FmQnU4SzQ0MXlrdTNGVTlIVkMxai8yTXpXRWFB?=
 =?utf-8?B?UHB4OFZPMzNUU1p6bzNnYUFaUHptQXJObmdkUTYzWEpaazRndXdKTGtYZHpN?=
 =?utf-8?B?K21GRTY5VGlrUStNVy90WEJTaW9YMk5hNUtsMjdsWGtSRVQvMVpQcU1YNytK?=
 =?utf-8?B?R2cxTWMyQkplL0J3MzJaV1JwSTFLcWhQbUF1ODRsUUJEQ0tMWEErMmE0dXRt?=
 =?utf-8?B?WCtwY1VueDRBc0xQRlYveWxhK2tGc1B4YUc1MEVZSGhsN0owcnNOZnlDUUNH?=
 =?utf-8?B?NUJjNkxvRFlSejdwMkRPalpTQnFvM0pxcXduejFVeGNoQUNKZzArNys0Vm1z?=
 =?utf-8?B?REVBZXBDOVBqREQxdVRwRFZaNkJQd01kQ1F1d1BpYzFnWjJRNGhpOGRRckda?=
 =?utf-8?B?RFBZWHF4Q3dFeW9aWXpLdFh1Y0YvUWVEQ094MDNDMWlFd0w1MHBaSlp3RFVl?=
 =?utf-8?B?MkZ2clR1UkJLbWl5T256RUdPY0tqaHU5NS9Pc045UDR5N25GcSs5SjUxcWdP?=
 =?utf-8?B?TnQ4aUxVc1dneU9pSGZXaVZ2czVLOGc5bFBzL3B2WjArUjNUS2JTSFNrL3Yv?=
 =?utf-8?B?dzkxdnNZbkxWMnRPSkVpbVpDTEhwNDRjT3NmRjJDY0lUOVdTK0g3aWwzdmJz?=
 =?utf-8?B?bU5BV0lZcnVuSmxaWElmbDBpdndKWjFXSWs0UEFaL3EwQy93WnJCZWJRdFMw?=
 =?utf-8?B?OUg1Q2NCc08zeTVhM2NNVEZZWEFGS1ZoaWNLRUpSNTFhK0tBMUNZOWdyVkdy?=
 =?utf-8?B?RTZlaGhOZHd0KzFjdUlRL05nT3hHYXM3cjVJSGd3eVZhNGMrSUZjV3R0eC9K?=
 =?utf-8?B?azJqOW5ySEpRc2xEM0VnUXVHS0lMUHIrN2x3T0JVZ1Fuc3dlWHJFWDNXZnlU?=
 =?utf-8?B?UW45ZmNyS1FDWWVNZzBFMktpWmpIQVFlN2FHRUpMM2lQcnpBQlBGMkRmYjRO?=
 =?utf-8?B?SU00dnQ1eENjVExhLzEzZW9UeFN3ZlVnMUFQUURVMnRZdEoycE5EUDRCZ2Ux?=
 =?utf-8?B?SFhZQzFUSEo1NVVPR0RKSXFvUjNDVFg4RmEwSHZ3Z2ppYUhCcXBadHRTMTQz?=
 =?utf-8?B?a0FHR3VpTDNVSEkxcWRaWHlYOElYN2MvK0tXY3FSZGkzOFN2WTYvbUdYbXkx?=
 =?utf-8?B?aWU1alZiai9mbWQxNy9CSTZ5Q2hwTTdwZ2U0RTFwcG1HZjJ4cXo5WkIzc2h2?=
 =?utf-8?B?M3doV1JlMmpvNHN1cVlPS3pPbFJxbXBvRkFaUlk1amIycXJ4TjQvUU1DQjVU?=
 =?utf-8?B?MWs5d3lSOTc0dXB3eUFINUc2OHlCVkkyWkMrenlkc000emgvUTh1aFhES1RC?=
 =?utf-8?B?UEFiT0JqazZoblRIT3ZPTVpQVU9ZenQ1MldhOW5VSmFvM0pDYm9BWGNwd0xG?=
 =?utf-8?B?SWhUTVpnOG9qY01KNGJ4MmVUeEh3R2Q3dVZDa2doTnlzcHh0QXdJVDNzRnRB?=
 =?utf-8?B?L1k2Z0Zqc3dMbGNxRFo0MWRBc05oMkc1TzBwZzJ0amN3SGFRRjFTTWJuVm5q?=
 =?utf-8?Q?+6qu3D3rESEtxpi+wQHC4sQ7JoqirLyhabDkGbfhh6Wo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7060fa7-e589-4a13-d494-08dacbed8d10
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 18:23:56.2287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nat/OP+eE1/vj+0q2oWKzshzQs1Hx1fP2MNYhhBGLFxS1/YEofYZQNmxCapP1h3+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5461
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
Cc: benjamin.gaignard@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 jstultz@google.com, afd@ti.com, labbott@redhat.com, sspatil@android.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dawei,

from the technical description, coding style etc.. it looks clean to me, 
but I'm the completely wrong person to ask for a background check.

I have a high level understanding of how dma-heaps work, but not a 
single line of this code is from me.

Feel free to add my Acked-by, but Laura, John and others do you have any 
opinion?

Regards,
Christian.

Am 21.11.22 um 16:28 schrieb Dawei Li:
> On Sat, Nov 05, 2022 at 12:05:36AM +0800, Dawei Li wrote:
>
> Hi Christian,
> May I have your opinion on this change?
>
> Thanks,
> Dawei
>
>> Racing conflict could be:
>> task A                 task B
>> list_for_each_entry
>> strcmp(h->name))
>>                         list_for_each_entry
>>                         strcmp(h->name)
>> kzalloc                kzalloc
>> ......                 .....
>> device_create          device_create
>> list_add
>>                         list_add
>>
>> The root cause is that task B has no idea about the fact someone
>> else(A) has inserted heap with same name when it calls list_add,
>> so a potential collision occurs.
>>
>> Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
>> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
>> ---
>> v1: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2FTYCP286MB2323950197F60FC3473123B7CA349%40TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C1989f31257fc458a27c508dacbd5078e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638046413707443203%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=OWPUPrIHGnzwXyQE4WlIthThwSuSK2y3Eq2Wq5zAzbo%3D&amp;reserved=0
>> v1->v2: Narrow down locking scope, check the existence of heap before
>> insertion, as suggested by Andrew Davis.
>> v2->v3: Remove double checking.
>> v3->v4: Minor coding style and patch formatting adjustment.
>> ---
>>   drivers/dma-buf/dma-heap.c | 28 +++++++++++++++-------------
>>   1 file changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
>> index 8f5848aa144f..59d158873f4c 100644
>> --- a/drivers/dma-buf/dma-heap.c
>> +++ b/drivers/dma-buf/dma-heap.c
>> @@ -233,18 +233,6 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>>   		return ERR_PTR(-EINVAL);
>>   	}
>>   
>> -	/* check the name is unique */
>> -	mutex_lock(&heap_list_lock);
>> -	list_for_each_entry(h, &heap_list, list) {
>> -		if (!strcmp(h->name, exp_info->name)) {
>> -			mutex_unlock(&heap_list_lock);
>> -			pr_err("dma_heap: Already registered heap named %s\n",
>> -			       exp_info->name);
>> -			return ERR_PTR(-EINVAL);
>> -		}
>> -	}
>> -	mutex_unlock(&heap_list_lock);
>> -
>>   	heap = kzalloc(sizeof(*heap), GFP_KERNEL);
>>   	if (!heap)
>>   		return ERR_PTR(-ENOMEM);
>> @@ -283,13 +271,27 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>>   		err_ret = ERR_CAST(dev_ret);
>>   		goto err2;
>>   	}
>> -	/* Add heap to the list */
>> +
>>   	mutex_lock(&heap_list_lock);
>> +	/* check the name is unique */
>> +	list_for_each_entry(h, &heap_list, list) {
>> +		if (!strcmp(h->name, exp_info->name)) {
>> +			mutex_unlock(&heap_list_lock);
>> +			pr_err("dma_heap: Already registered heap named %s\n",
>> +			       exp_info->name);
>> +			err_ret = ERR_PTR(-EINVAL);
>> +			goto err3;
>> +		}
>> +	}
>> +
>> +	/* Add heap to the list */
>>   	list_add(&heap->list, &heap_list);
>>   	mutex_unlock(&heap_list_lock);
>>   
>>   	return heap;
>>   
>> +err3:
>> +	device_destroy(dma_heap_class, heap->heap_devt);
>>   err2:
>>   	cdev_del(&heap->heap_cdev);
>>   err1:
>> -- 
>> 2.25.1
>>

