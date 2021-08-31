Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DF13FC2AF
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 08:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C375898A8;
	Tue, 31 Aug 2021 06:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE4F898A8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 06:31:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hx94KWhkUN2o3QMnYmfCKT1ry96j8+gBWeoQvkoGyfpF3z9iI16Zk1Rbx06cCLLK679p84qcQ4jDxUJlJd+Mc04bRzrDDT8PPMZZGwsBm6iUJQ0qrQkXMrcleCcwjYWHm2r+fxGdPpMbKsgImrsOFYl7g7WjbMDHiWMVClfpX/7vCrOuKvgE9SzypIMi497WbbbgZoI736wYEeeRBtoXgLSYnyZ/Sy0uz8vlobtK03Lp1Hs2AjBzvgraIbmL5xdvatAjEvJFIZGyO92BhyqekXJg7hG9td1dgk7XfbLJA621UxYMID3J2GuOnFaDyI/40qw2/AA2W5uR2Bha3XsGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzSNFFZs4c99WXVPwgImMnSgH3KfmFLUi53AAFh/hK0=;
 b=ACM7FJDmAZnId45ttItYSAzXxb/sK4DC2HCboHqw1lPbExPjmdlbp7aO3zztRHik+60WOmLg4GrPuhFlGFnf/lkg3aBt8LlxP03Pn2ifMYGwu+SWmW00g0ufGRm66l2UXHsNynJwChZAplKnNjyGA3wq0oxaHcjOnFX7FCUDgAflVwEmoh5O9FmETrllmyNDUKEotaSYrWoWH4Bq2x5UJXN55wndETmW76WoOm8kt8zhkXMnt0fh22g/3H2x4rVmTST5PRcdEuWt4VlDCXflo6vk1HHNy3aWFbGFz1SrbBztvpbtJqw6puRnQMVPYPWrjf53k6urxIFcZI4wXlI5bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzSNFFZs4c99WXVPwgImMnSgH3KfmFLUi53AAFh/hK0=;
 b=im3KkEjY9Z5GHGHZpYjaQ2N9H/Ukdhg2ee4Fn67m9Fr1kPHXIcFUZuALkxO/tQBR6eSyUazr57BoQ94+vN8r5y9vNLTJDwvkPWJxNQYzgf8ELJ2GuaOi/V6cSYnJM7hnERTM+aqaNKgcD6EmFEAmua6CVgH1HMjP+QssCsHp5Yk=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3903.namprd12.prod.outlook.com (2603:10b6:208:15a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 31 Aug
 2021 06:31:29 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 06:31:29 +0000
Subject: Re: [PATCH] dma-buf: heaps: remove duplicated cache sync
To: guangming.cao@mediatek.com
Cc: Brian.Starkey@arm.com, benjamin.gaignard@linaro.org,
 dri-devel@lists.freedesktop.org, john.stultz@linaro.org, labbott@redhat.com,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, lmark@codeaurora.org,
 matthias.bgg@gmail.com, sumit.semwal@linaro.org, wsd_upstream@mediatek.com
References: <dd5ba603-8c9d-f6a0-cbcc-dfb353fb6701@amd.com>
 <20210831034405.41916-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0b48df29-a20f-65f6-bc4c-6c0a7522ecd7@amd.com>
Date: Tue, 31 Aug 2021 08:31:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210831034405.41916-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0181.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR02CA0181.eurprd02.prod.outlook.com (2603:10a6:20b:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21 via Frontend
 Transport; Tue, 31 Aug 2021 06:31:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6205f434-79cc-466d-18da-08d96c48f705
X-MS-TrafficTypeDiagnostic: MN2PR12MB3903:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3903F9AF510AEB4E2E88CBF083CC9@MN2PR12MB3903.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8salqPox4/I0Ive1XqPQ7ftCdr1TP1CDhvMk+ZSxTMq972c5/tyO5/+GXa8Z81VjK8z8liawVHRvNka40xMkU8h5y98PRyZGfg+SZKj8oCNrwlry/xYtJh/ESxaWDSYD/WqR4usFzqF82ZVUWKXt8gSN9hIPTtXHPe+FBfNL7I6j/r5PUD8FwAPzB4fj6ukdIHeSAzeU2NTxlrjS0moJRq3kW6eHv0VQLLQJ1VlmtOuYjLZnSCvu5zXC431J033/xOFN0+4xXWro4Jv+KNi8Abi8KyziVkFvfID//OpHNKalQ4Sdtw56i61fS+RIBqRH9eA64ijyfJ8LliVYtLNVQsp4pDt1fsjIn6FthZ2nwjgy+pfX2gxJq2ke5yrQFmNmfKpRxgXfRjqfx4bYbOLWX/2eWI8xOo9hzLPzxjsfSk8F2lXHe9zdIMRdIdBTXyYrVQv04Dad1aBfNTKCiwmBSb+N3E/RVe4tls+JGj4vP6MSC1MKQ9nOf53gWUlAO05V5TIzg2XXc8mopwL2pR1aqbvyCJIPTacp1LJUydQUgeGw3pBktT18z7QOHrUrLGBFdVFj9ynJy3IGi4qUJaobaIXZgaFeQNABeOFKZ6X/YwLn+8WK3AvkIEE2w8UU0rrEYsi2ZR3QGMFWLbE/rsWvFe4ts0Fk1MjCY4TFcMKdDPqMRU/QGupV+N99nC2A8sOf2XEQciPyE6diScGwda/TNbuh+cs1yghXkycCDchbDRQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(4326008)(6666004)(6916009)(86362001)(83380400001)(66556008)(66946007)(6486002)(5660300002)(66476007)(36756003)(2906002)(16576012)(31686004)(478600001)(38100700002)(2616005)(316002)(26005)(8936002)(31696002)(8676002)(956004)(7416002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmhoQXlpSU9mUlByNmw3d0tKSUk1cFZ3a2xKY1RPVjY1TTZNeGpRcU5pWWJh?=
 =?utf-8?B?ckFYMWtIZnphYW1rUGpHci9EM09mbFdpWW1rYXp6aXgvaDd1SGYvOEwzZFVv?=
 =?utf-8?B?UzFvd2hTdEx3a2d2RnhzZ0NuemZWWUIxN2NCR1JEMkZDVGdBYVdHRFZJRGZr?=
 =?utf-8?B?WHhIWlNUNHJzbTBUSmFDQUNuWHVMazFoTC9GT2FmTmpRTmJQOVUwZExjUHFp?=
 =?utf-8?B?TXRsV2RVaE4zbW1TZnUvZzdJZWM4bUxNMDhIb3p1SEp3SzZhSjVJUTl5VHAv?=
 =?utf-8?B?QnVqQWR1SUEvcGtvTlc2bUQzNVAxVnBwcmJlTWlHWW9JdUpreDJVT0I0RWhq?=
 =?utf-8?B?RTB2aGtRR2dWTU1NNjVaNWh2R05uVG91REFHaUZ1U0dZU2JkZlhrVmd5R3o2?=
 =?utf-8?B?c3VuZE1mc2JKMjl0LzdncHA4eEFna1BZSFNVb2VOVm1iY094R2U2ckJYMnEw?=
 =?utf-8?B?ZlBhVnlxc3FleHhvUXIxTDdCZ3FreDZvbkxBNml6ZTZ6dXFrNVFWZldId29x?=
 =?utf-8?B?b01nWkcrWXFlY04yNjlzMWtTdVBXTDU3N2VGVjZ0UFJrMnp1ZDNOMTZFZG1i?=
 =?utf-8?B?Zi94bU5DaW1oeWoyeW4zVjQzaUY3bWxmN3BCb3hLbWV5NkR3ditDVmdnQmdU?=
 =?utf-8?B?c2dhT0VyU2JJbk94TUFYNFRaTEQxZkd6S3Z2U3BoOVlpUk95QkNVbjNKbjhr?=
 =?utf-8?B?QVJLTVhyZ0luVXYvK3lZUTIyMm9kd3A5cHNXZTVTdkoxdkZ0Y0w5cUVyN2U3?=
 =?utf-8?B?bHBEVlBxcUZzbCt1YUN3K2tvWGtEWXNCRFVaT1J5VVNJZ1ZPRDhMQ085RUd2?=
 =?utf-8?B?eVJpZ0NmRkYzZFJ6MlU0b2NKeS9LMzR3ZG5DaXRFRXdpbkZhK2I0aTFPWk8x?=
 =?utf-8?B?ckwwWEhoaktpZGI5YnNKMWhkZXJKMnczNlFOYVB6OFhQYkxTOVJrTkNYc1RG?=
 =?utf-8?B?aXN6RTF2WmVMVkY2d2k2S2x5dC9VRE96OFZBQ0FtR2Y1YUN1VkpLWkg5R0ts?=
 =?utf-8?B?NmpvUlNteWxubFpqWWtvSDdXOGRSY2l1ZGw2MzJSOHFFSHdidnBnNjI2RnVH?=
 =?utf-8?B?a2VEek82WnFsbHNOY200b0g4c25CS3lzSEpjRzVicXN1MFJ5TEk1TTlRY1RU?=
 =?utf-8?B?MkJHMS96Y0F1bHFpQ1paY2lBN05uODROckZxaVNzVmUva2RaYVdEamVPYWVz?=
 =?utf-8?B?Z0JMQnlBellPZStkdUxmSmN2T1ZPZHRoVVZjMlVwckhrQzI2ZDFPMkZjcVov?=
 =?utf-8?B?cEV5SisyK3VEdXhTZ0pXc3RycStUbFV3UkI1VFJmV3Q2b2RienZ2UkprenVG?=
 =?utf-8?B?eVUrRWx5aGRPTm5teCthb0E0aCs2N2JkUE1ucmVYZHlOaTRYMjRldTNGblVK?=
 =?utf-8?B?WkFKaUZLc0p0TEJxQ3dON29scmhOa3Z5eUlYV2V1T1RnN3JYUm1lOGU2ekln?=
 =?utf-8?B?V0FGaDQrK1ZaaTV4OXNENGF5Rk8ycWJWM1A0YjVHMzAycnAyY2gwU0dGOWlp?=
 =?utf-8?B?WWZHdlVXU1pWaHZWb3BXU3B3SkR1MW1uSUNScjFTemY3czJIVkhudkRYc3da?=
 =?utf-8?B?V1Jhd1p0S2dwZzNZeTdCUDN4MVhUbFM3WG1QR05KdktLZnhPbGtBZHJJYmcx?=
 =?utf-8?B?SlUwbkR4dEpYeFlueVdlR1I4bGlESU52NUpBenVjb3NBRGRYV1VRVEIxUnhX?=
 =?utf-8?B?dHNOdWpHak9VVUpibEs5UGdkL3FBKzc0TkIzbjQxQWFwSVB3eC9HUUFlcndq?=
 =?utf-8?Q?UgwkTAq+AKtr8dnGoQ/LBZ5tJcDnMaAgC+Zz/At?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6205f434-79cc-466d-18da-08d96c48f705
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 06:31:29.7341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qte71PpFY1gxU8vMv8x0qnu6OwUUq0AvQ9HlP8BiczGzU3JwZY6upp6ixCef9jv0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3903
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

Am 31.08.21 um 05:44 schrieb guangming.cao@mediatek.com:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
>
>> Am 30.08.21 um 12:01 schrieb guangming.cao@mediatek.com:
>>> From: Guangming Cao <Guangming.Cao@mediatek.com>
>>>
>>> Current flow, one dmabuf maybe call cache sync many times if
>>> it has beed mapped more than one time.
>> Well I'm not an expert on DMA heaps, but this will most likely not work
>> correctly.
>>
> All attachments of one dmabuf will add into a list, I think it means dmabuf
> supports map more than one time. Could you tell me more about it?

Yes, that's correct and all of those needs to be synced as far as I know.

See the dma_sync_sgtable_for_cpu() is intentionally for each SG table 
given out.

>>> Is there any case that attachments of one dmabuf will points to
>>> different memory? If not, seems do sync only one time is more better.
>> I think that this can happen, yes.
>>
>> Christian.
>>
> Seems it's a very special case on Android, if you don't mind, could you
> tell me more about it?

That might be the case, nevertheless this change here is illegal from 
the DMA API point of view as far as I can see.

Regards,
Christian.

>
>>> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
>>> ---
>>>    drivers/dma-buf/heaps/system_heap.c | 14 ++++++++------
>>>    1 file changed, 8 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
>>> index 23a7e74ef966..909ef652a8c8 100644
>>> --- a/drivers/dma-buf/heaps/system_heap.c
>>> +++ b/drivers/dma-buf/heaps/system_heap.c
>>> @@ -162,9 +162,10 @@ static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>>>    		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
>>>    
>>>    	list_for_each_entry(a, &buffer->attachments, list) {
>>> -		if (!a->mapped)
>>> -			continue;
>>> -		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
>>> +		if (a->mapped) {
>>> +			dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
>>> +			break;
>>> +		}
>>>    	}
>>>    	mutex_unlock(&buffer->lock);
>>>    
>>> @@ -183,9 +184,10 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>>>    		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
>>>    
>>>    	list_for_each_entry(a, &buffer->attachments, list) {
>>> -		if (!a->mapped)
>>> -			continue;
>>> -		dma_sync_sgtable_for_device(a->dev, a->table, direction);
>>> +		if (!a->mapped) {
>>> +			dma_sync_sgtable_for_device(a->dev, a->table, direction);
>>> +			break;
>>> +		}
>>>    	}
>>>    	mutex_unlock(&buffer->lock);
>>>    

