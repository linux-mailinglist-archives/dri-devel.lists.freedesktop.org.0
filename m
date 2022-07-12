Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBDE571969
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 14:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73ECC9127A;
	Tue, 12 Jul 2022 12:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A85B932F4;
 Tue, 12 Jul 2022 12:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsaQmoZ+Vhyx39pP1gIVKlfiOuNfevVrOUm7+vVgnJHzqm7aXt1nvq4tg+RPiQ3GusrJPzlovFfL5EDqFTFskg1F3pcZlTQ8NarYn50qa6oPhCsSN028KADl28Hw9qo3ulFxJbp2C+kzgMzmGmLlINhmkR0aQ7+P6aT0rRfYzZmY+Le0jujKXqgZp9ul2Smkn9RdcH8H19n2aI/TpEUEoKc+CWmHbM7yd2VZgzBzPHS/RccP8iezzEP4mwvZBqfB49LtBafswKyIRQx211rjhlFr3r2VYHNSeJv01vCVHVrgleFJzPc1hODbTvFRhBLOWT+nEvhMHOaUs7/XI73WvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCcH7gCi1Qj2smb0MhinIXfpri3rX7VaXblIpQ7ZOv8=;
 b=YLznCgsHyKQMH7k5q2Y05Vu1xsJB+uk8sYi83WOrDSdVPQIaqy7nkXsSFpwa6p0yC2py23heVdtHqHBUKDf0JxpNoxsGqtN9ApjqppEeCmAfZ+JzQhf2DSshGlwX+kJbyssmvIuz9pN0mLGAc6rSEAvYSbW7W8Nrk0amxUxRhvncRW7axU+tvBGQNWpc42T4mAGWQKOqHvMF4QXJcSCuuv0iH0KGYRUnjyym+I84WFibEUQPTYFDusVE9B711h2ZDMjXAoQ+c1cHxh0pZFGt4xKFfmINVMJbgj3Pvp2kOnxi1v6tXTN3IedLG5PYvLPWdMdm18U8U3K51YsDqCllcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCcH7gCi1Qj2smb0MhinIXfpri3rX7VaXblIpQ7ZOv8=;
 b=RGEL9BcsWjZaxQBp8E9veJFb0+2KD0UqE5XZaBY69Nhw+MVV46i12KtKmzqcT8jN+TxjGOdo3Gu8bzyutxvZ02Zjsi0z6hUTUoC7Fs+o3mdLeAYX/OQhzbwKlkqBkZX0NRpus7z3wWRDgn4Jn4SNnU2hedRKBKSE2/5+xVL4eMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB4615.namprd12.prod.outlook.com (2603:10b6:a03:96::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Tue, 12 Jul
 2022 12:06:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 12:06:28 +0000
Message-ID: <f4804bb1-4f0e-2755-6b00-8aa0ba1c5c90@amd.com>
Date: Tue, 12 Jul 2022 14:06:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dma-buf: revert "return only unsignaled fences in
 dma_fence_unwrap_for_each v3"
Content-Language: en-US
To: Karolina Drobnik <karolina.drobnik@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220712102849.1562-1-christian.koenig@amd.com>
 <6570e584-7ddc-4029-0555-276020750dd2@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <6570e584-7ddc-4029-0555-276020750dd2@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6d04337-4eee-4e3c-9dce-08da63fef385
X-MS-TrafficTypeDiagnostic: BYAPR12MB4615:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4eJt/gaitCrn1dRN3wSVLoVB5z4gZJNuzleHQAoFL7mNXdvlTnXxTBGHZEbo1TZBfrqBgER1NdnDXxRKoDt67ITR21ZTFxhaNBJSyM9n2UTswWfWj4lumfbIIx/AeYED01Ix1GE5psYQThcLHPVllqOeeoFi2mDlOFb6NsKM62GrAkO2bpBWhqlCQ1L2Ndb+y/4R7+P9neKGpZ7jwen2GJG5OU/wj3ZHOx4facvP6nbtcMWb43znWB1wUJf1cQe4UeUu8NT51/lc8AspnoOs10qwQVwBlOzWtxbuZIpiknCPuiUpbuOVoZ0q4G23y87urEAXtcwoLRxbI8nEo1+PF4acpDz//Q3je8bpAxzKnldsIfEe7GnWPrSu/Y6LN4Mm4H4TZCx8+qGm/r3j1/CH+NDpCNn57ATrx6AkoEHJxOVM+7NiWyUqCT50mYuXQOsOUVmLJLB8VoqldGieA84s95Jbj2Z0x+XOaEDpm2BxePU9leV/fXddkW1GlzB8r4Q5mGufZHHvR3acCXgppfbscg3QKU8bm55W/Y21fnCPPRPp9lVEZ+8/sXsWUotYOLShiDsKw8jV/tSAjwbcjdM1IAY+l9cVxRnZe1AA28YtNt08Rpa+5bbGvhcBD1HZA8wRfM5k5TbdgsPy5Y065tUrreiDgaXf+os0B799pwUE32Rw1QGr9vnXDa0oA3omWnIBiD2wPHkzQGSGJkcEsrrzLbZP6NH/Fe0d/F4Xx7wf6R461yfbRefAwOOj6/9tAQnT3S8xDO3yak287Uq4b0/5INt4/MyBMLXnfl/YIHodZqpL53TDsvUpALT8aFJYMqr4/dTGtmxBhEq7+F2oY9SwrNrejWzm8cjG7eb8EquGJ2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(36756003)(86362001)(31696002)(38100700002)(186003)(6512007)(53546011)(2616005)(83380400001)(26005)(6506007)(66574015)(110136005)(2906002)(478600001)(316002)(8676002)(6486002)(66556008)(41300700001)(8936002)(66476007)(6666004)(5660300002)(31686004)(66946007)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVpHOVFYR2NoT2ppNTZVcnRTNmhCSkhwSmNxRG9DWEJhTXBMN0lxdlZLRmRa?=
 =?utf-8?B?ZkRtbEcxc0dKVUVHeXNxbzFQS3c5TWlkWjhrWjAxMzduTnN5bW1jSGpra2FI?=
 =?utf-8?B?Vkx4S1BBSnpUL1hyczFhL01IOU96NnBzTjNkRWJacmFMMk1DM1g3dy9sK0NM?=
 =?utf-8?B?dlNzRmdRc0JkU3g5OVRvK29jdUd3WG1td2szUityQzJsZ0VNTjZqWGJiRS91?=
 =?utf-8?B?RzRDeUlNZ21zRnRVMURIWmsreERkKzdaQnd3d0pDQ25QN1lEQ1phL2VoQkZy?=
 =?utf-8?B?cm9DTUd1UUhBUGVmQTVHNk5yUlM4b2tTN09Uc2VmVXp6Sk5Ca1JXK2NDbi8y?=
 =?utf-8?B?Qzk1TStVekc0SlJEUVpFTmlyTHo3Z2liVUpEM2J3WWRYMTRidndRNDNxVHZ6?=
 =?utf-8?B?MFJDNnVwTDQ4L01vSElmVTBjTWI3NEt4RHNDWVVXVWlGQW5SNmlDSHhuZEFU?=
 =?utf-8?B?a2MvQUpndWVIbXNiN2FVYlc1MDRLYmp0Wm5OVisrVndCTFo2TlY0ckhCSEdD?=
 =?utf-8?B?WmZRNEppcFlEVTRuN0xhc1doRjN0eGdTS2M4dGNRc2NnQ1RKUFhyMDdnVVBM?=
 =?utf-8?B?V2VSbW0veUVDQ2ZLTVBrVU5uK2dqTmJ3d2xoeks1a0pwcENPY1MrZS83Ukt4?=
 =?utf-8?B?TFdDcWZkb2tueTFEekRGUk8xUnpua3ZyVHVUQk9SZFkwU1hmSStDR2Nub3VN?=
 =?utf-8?B?TVhocW04bFEva0JCNG13Ry9mVmxqbTMyQnZTdk1vSjhWVlRDTDZxMHZDYUIr?=
 =?utf-8?B?eW9kcG8yRU1ZeTVFOGFOMW5mTkIrdkhXelZvOTFYcVJBV05JWlN0c0hnYXQ4?=
 =?utf-8?B?dkRaanMxWjFDZUVnK1FQSElqTW8welBZTkh4bWhrT0NkUSswZFBaMGJCQ21j?=
 =?utf-8?B?cGNqamxGcGZoaDBva0pycmNaWTcxODZwa3lKOFBBekUxNUt6T0JJUFZBUXFD?=
 =?utf-8?B?YUJleFhvb3NKMXFRVDJDK1g4dGJmTkMrdHdaMW1ORW9FWDhwRVFzWFdCNVhH?=
 =?utf-8?B?d04rOHZnNWIxd1NLTDd3a2h6eSs1SHJpcTlOd0VQZzVLZ2xIRmlpemZGeUcy?=
 =?utf-8?B?UVEveUVhdVZXcENQZDdEc0wxZ1I0RTlZMjEvYnk3d0lqUmlZTkhhbGV5YWZ1?=
 =?utf-8?B?R3UwVm40RzBIRTcrL2Y3TnpvS084QmRTSkZaSUdMVUNMSDJtMjIxb29zbW5p?=
 =?utf-8?B?RlVMOU9UdVlOQ3hXZG0xRkx0NFNKT3I0UFp6UkNYNHZOVjlHd0tVcWtYcFNT?=
 =?utf-8?B?dnpCV2RMMFFpbGtQR3FVL3RPOXBLS1IxMVFuMTR6aFZBVnE4V2YrbkZyMk0z?=
 =?utf-8?B?ZkJkNWtPUHZYWFFUMDJheHhxQ3ovaVFOZUtFbU80ekdDZzFROGMySnJhRXRu?=
 =?utf-8?B?amdVNzJ5SE9obkpCd3FmL09Da1NjeVRYWmY5SjZZd0h2bi9OQzdvaWZtei83?=
 =?utf-8?B?NEk2bmlqM3ZTdW1WK1pjNHc0UllHdHVxZU9jdVpuTEFZeEpOVEZhbm53UXJv?=
 =?utf-8?B?bFZ0Z3B2ZmFFMTFVQzc1ekRhMysyQzkzQ0tvSWFyUHVHL3NuZmU4SCt4Qldr?=
 =?utf-8?B?YURmemI1eWFYYmoreGU5bmx1N29CT1dzMm80SURGWHZ5ajNzTkkvSUNCMEk5?=
 =?utf-8?B?dHZFMnhzUGF3clZmTnQ4bklJckc2eWFsUi9BamFvMmpySm1aMXB2SzFiR2dJ?=
 =?utf-8?B?dVJDWEdWck1rYXd2NWk0YXNqNGpTZnlFeVMxZUxSL3M5c2xubUxsdUw4SGZX?=
 =?utf-8?B?ZlVGZDJkNWxmN3lWNHpQeU5YcVJQa2l5WjNCaGpST1dYaFJtbC96d0hxbTly?=
 =?utf-8?B?TGZVNlpkc0phMGF1bGRlVm44ZEx6R1ZsT0ZQZ0o5YmRldGY1V0QzUDhBKzlG?=
 =?utf-8?B?LzhLWlZROG9LcS9vUklLL0l1dnpVVGN1Vm91MjZUc0dTUU10U1BhUjF4aWVW?=
 =?utf-8?B?OWVzSHhIcTJNNlhCcUtkZlpSd1hnTDBsa0s4dWxhYXB5OU5tZjVqZ1JWVkUw?=
 =?utf-8?B?b2xpOEtVVCtnajdrUmZIbDc0QmNSRmNabXJtOHdhaWpJTkhDWWlWYzJ5N3Rt?=
 =?utf-8?B?cmtJTWpsTFJZb2RyYjhnL3ViaXJYVmJHRFZaL2o2MVNhNmtSd1NOYXlnbzB6?=
 =?utf-8?Q?nWyZfweQN3t4Rap8Ibo+5fnka?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d04337-4eee-4e3c-9dce-08da63fef385
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 12:06:28.7153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1gLbpyFdWYFymIeRVjeSgG4Kvi+yG2eTqOJJzO3vWyY1M7OHms6FGd0SYlv3e5G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4615
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
Cc: linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Karolina,

Am 12.07.22 um 14:04 schrieb Karolina Drobnik:
> Hi Christian,
>
> On 12.07.2022 12:28, Christian König wrote:
>> This reverts commit 8f61973718485f3e89bc4f408f929048b7b47c83.
>>
>> It turned out that this is not correct. Especially the sync_file info
>> IOCTL needs to see even signaled fences to correctly report back their
>> status to userspace.
>>
>> Instead add the filter in the merge function again where it makes sense.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>
> After applying the patch, fence merging works and all sw_sync subtests 
> are passing. Thanks for taking care of this.
>
> Tested-by: Karolina Drobnik <karolina.drobnik@intel.com>

can anybody give me an rb or at least an Acked-by as well so that I can 
push this upstream?

Thanks,
Christian.

>
>> ---
>>   drivers/dma-buf/dma-fence-unwrap.c | 3 ++-
>>   include/linux/dma-fence-unwrap.h   | 6 +-----
>>   2 files changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c 
>> b/drivers/dma-buf/dma-fence-unwrap.c
>> index 502a65ea6d44..7002bca792ff 100644
>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>> @@ -72,7 +72,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned 
>> int num_fences,
>>       count = 0;
>>       for (i = 0; i < num_fences; ++i) {
>>           dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
>> -            ++count;
>> +            if (!dma_fence_is_signaled(tmp))
>> +                ++count;
>>       }
>>         if (count == 0)
>> diff --git a/include/linux/dma-fence-unwrap.h 
>> b/include/linux/dma-fence-unwrap.h
>> index 390de1ee9d35..66b1e56fbb81 100644
>> --- a/include/linux/dma-fence-unwrap.h
>> +++ b/include/linux/dma-fence-unwrap.h
>> @@ -43,14 +43,10 @@ struct dma_fence *dma_fence_unwrap_next(struct 
>> dma_fence_unwrap *cursor);
>>    * Unwrap dma_fence_chain and dma_fence_array containers and deep 
>> dive into all
>>    * potential fences in them. If @head is just a normal fence only 
>> that one is
>>    * returned.
>> - *
>> - * Note that signalled fences are opportunistically filtered out, which
>> - * means the iteration is potentially over no fence at all.
>>    */
>>   #define dma_fence_unwrap_for_each(fence, cursor, head)            \
>>       for (fence = dma_fence_unwrap_first(head, cursor); fence;    \
>> -         fence = dma_fence_unwrap_next(cursor))            \
>> -        if (!dma_fence_is_signaled(fence))
>> +         fence = dma_fence_unwrap_next(cursor))
>>     struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>>                          struct dma_fence **fences,

