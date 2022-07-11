Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC7856FD98
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAD689230;
	Mon, 11 Jul 2022 09:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339AA8D51A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:57:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5ZVs3UiLZBBLECwYlllWQWTHAnHuQtAbDsAawcdoCe4Av8hcgX9mvcWXfNaLD8twsntmUaqy3q7zNoBblgK9UmEUgTihZDGz1+thYtcq7W6gKMLg+ku7nUm/TCQsz3ytYx6QNO/Ig4UxnD1lxKwJjwQw5HY0nzxs1YMRsEkubBBqp/JLE6fnFI8NH9MCUOOc3pKFVIJj86WTEMkby23ZMWhe0lYbhUuMCCVrEtM0uk92VYf/v6t4F0hq0BeBi5K8JHOC6psE4hSQvUk31bJhDfafPFvnew9/nSrDhQcKyXZUvhFwhM8ZZ0wiR9KXLPjw+Y995Ty4SiOzOHRxo1o/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HzPb9jLZgm6sgjgq3xC/p2rHa1k86Fkd3q0LpfM6uE=;
 b=Q9KfHvHVMefdYMDVAHg/vYxeKW0wUQaoQaK1LdcnNXmY2C/oHz2xcDLOE9AuR8mI8iGwj2BcBk6pdgxNRjp3csFe8DqZCLSZnW32e2CF7efAtzwuB65epryv+AJYXceCMW+/d3Bd0dPpWtYk9Imm1/Y+bA/SaDKyxmfmc8YcMVJgVcGUrSsQLPU5pr8k22gyvt27uYxTIhBE5UlWhgX097skZ78ETKOFOk+AzTr3rIL9j73igI7PlF8pqurTT1rYmXQhoJvUq9FXCmk9Zc4E39zebeABhPlbwVzs0W0NPj0deI9niABU5XGfITE6jmjau2B73D++OC9Gmkn2xiQ2yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HzPb9jLZgm6sgjgq3xC/p2rHa1k86Fkd3q0LpfM6uE=;
 b=5OX+uwjKw9MjbmO1BL5jAve6aIQaEyWdj/UGs1lsD2O/v5GneXEU2Vg0t9XP2BajiZ/cGuFs1qP8lcAS14eUdUXf1fzMHzqGkMdEQpFWbVRb5K6lvt6R2XK3GDZqYy9BIumucQjmLKxw/eyXpL98AaPDcyEaxdIaUJH0RJQTtjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3900.namprd12.prod.outlook.com (2603:10b6:5:1c9::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 09:57:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 09:57:37 +0000
Message-ID: <4c9598f0-4ba7-c18e-2ccd-f508769a72e9@amd.com>
Date: Mon, 11 Jul 2022 11:57:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/5] dma-buf: return only unsignaled fences in
 dma_fence_unwrap_for_each v3
Content-Language: en-US
To: Karolina Drobnik <karolina.drobnik@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220506141009.18047-1-christian.koenig@amd.com>
 <20220506141009.18047-3-christian.koenig@amd.com>
 <f67d23e2-3953-7717-9c41-65075929525c@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <f67d23e2-3953-7717-9c41-65075929525c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aede7385-5df9-4d94-760e-08da6323c8c9
X-MS-TrafficTypeDiagnostic: DM6PR12MB3900:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GAOT+uUnDMY6E1anmM88imCW3bMJqvibp3tddXnbZILkKRl1MjU0Yw2PHyhfUSTS7l6qpg8nh2e69gKVQfdQOiISyuxlbF4r1Bq4827akXgmSDogvmqsZkiIhmpL2QI8Z+/O67Rhs6uZ3hCKNkmQx6DGJLhxF1KLgEzWwdNVGZ7A+lgiFgdfLCosUFlak9JEMTsRQaDxY48VgFIZAAVt7T9t9yRkrNc4l86g5AlxB9Qp3dFXphsbMSBbiXrF6fxRiRB0V8qw1VqT35HHld4t/uWNOHcJaSHm7zgbvxUS/CUoVVYDZ3Enrl5yitnsZc8xeatwur3EuZCjeBqD5yKK/x4RTVzuZ3gOeX7+aoAqVoxtrbBx0M+CuOMLMjgRpDcaRhLXRX1nNNhPDKG7uJuBfKHtvl2dbW7VSgLitVkU5jbfkmhIdLByRCABHg5D/jLBNTzMv4w5ZcnYAYii+oLWztp2QK397JyZhpvfnYoshDPeGGeTeZlUB2vImkdLDsGAP8PDAZp8jdVZD60m/8/qGQ4SshLRCxBNoeBHnR2FrVjsCQYm9mJQozo7jNoUQNYf9B40RxrpXnY5V6czYzbvFERTzVy4O3c+7/eZnCjcpeDAfQgduMtH6GbiFsfvs2fyRz/5j6JUxILl2ybutOz5elGN6eDaPnvzxI06qEIL5n2k2KCh0gWjvbXZN0jha6CSB28MEWEqW2rq9FA/YOxLbcfR1JEx8iR9+d8XOXnV4HKkmAtiu35xlXiWODSpyGD4uw3zB6dI3t4DZ7Y2Xl13b5ZsHpVVqXwtnZ8DAMO+anKmDAgd5B6IZAl+QmMD94dbwIdYzsGc4Se3itaA8LyZKwG/IxdAHGeXNdXshD3wvIz6OfuhtduQdSS0Ngxb1S5B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(36756003)(86362001)(31686004)(38100700002)(2616005)(186003)(83380400001)(66574015)(6512007)(31696002)(26005)(2906002)(6666004)(478600001)(6486002)(966005)(316002)(110136005)(41300700001)(45080400002)(53546011)(6506007)(8936002)(5660300002)(4326008)(8676002)(66476007)(66946007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajB1WmVsRjNxeThQdlBiSVFCRndzemszMjNKZHYza3lncStZRGxaaDQydWZn?=
 =?utf-8?B?UTg4OUZLNjJrZ3kreElKUEg5Q3pvb09hdnRiYzlSc005Z0FnV2xiRERENkV5?=
 =?utf-8?B?ak9pMkp6YlZIUWl2d2tveHc4ZE0wYTNOclBpUCtCZks4UURSQWFUSVB1WE9T?=
 =?utf-8?B?bnJzcDBKN3ByajdabnZubWR0M280R1VFclI4eVNZYmtIdlNKVXlQVEM5dTdQ?=
 =?utf-8?B?QnRqM3BZVGZneHNuN0g3TFJDOVdyRjl2UzFra2lYeWQ4UDhVRXN5RXZrMVA0?=
 =?utf-8?B?UFZtaUtvUkZoN2JGbWdlcnpNMWdXVTJ1SExUMER2UGlOc3U5YzlVTWhsajZr?=
 =?utf-8?B?OFJ1SGtETUxZa3lVQ05UOXRaVVdMS2lDa3dQS1Z5eGdGVlMyYzlRcEI0U2JD?=
 =?utf-8?B?OVpjVmVNNFQwNFlPZUFHN2xjUG5rVDFieG96RGtoSDJmb1J5WENQZFI2c2wx?=
 =?utf-8?B?ZjRGTWhZb1BtNG5qZnFsQ2hUQk9NR3V1SjBLdEtEelZ3eGZSeWl6WHBkNGlt?=
 =?utf-8?B?VFhBV3JFWU41VklOYnMwNW1sZEdFWmxpWlliODVBK2tnM3YxbmtMTmJ5Z3Bl?=
 =?utf-8?B?cW55OXAxbUhyNm1EblB6cDZEeE9wMkVoZnE3ckVDQ3c3QUlSQUxpUmtIdmJm?=
 =?utf-8?B?elJTdHpDWHh5ckFUdGJiRlBwMHZLTG15NmxQUG85SC85STZUbmdtcUgvcDVi?=
 =?utf-8?B?UGdCRTZQMk9DNU5XVkVQNHhnbHFVaUpPY2JtNXVPbEQvQU9xdmhocnljd2NV?=
 =?utf-8?B?Z3kxa2FwaGxBenAxOEFCYXpsYVhyY1ZJenRnSTJUUCtTQTVTbUdUek1Fa2h2?=
 =?utf-8?B?Nkw4U2dhOTF4bEQ0N3dSQThMTFRqSWJYd0pVRnJIN25KdVNxNFJjdnFWaWY5?=
 =?utf-8?B?QTZBUEkraWI2OEZHU1ZiZGtxeHk3RDFCZDV1clNyUlY3KzB3WjcyZzlJT2Z2?=
 =?utf-8?B?dUJDN2xSNGVNSWxjY09YeGRiMi9RZnhpV1k3djMva2pUZXN3Q3BqTnQ1bzFP?=
 =?utf-8?B?SHdNYk93bGxDMExVQkowaXAxbkJVbkwybTZRRVYzMkdhSDN3Yy9qYjNkalNN?=
 =?utf-8?B?eXVlRlc5aCs3TkNGOWlQVEw5YmNPMGxCbTEzNmI2M3lJTUt6NmhMVUh3RUVv?=
 =?utf-8?B?ZjZqcW4wY0NjQVczdnZvVXNhRk13UW90cXhJelNGRHp5bTFMaTkxOVp3VG9H?=
 =?utf-8?B?K3Y3L1NacGxwTUYxTHpISHZlWW81aTl2UEJoOUVObzFUM3lkSkZCdDBXYUow?=
 =?utf-8?B?YWY5Y1FFb3FhTjdzQzNnbEk0anFROWwwdkhkYjhQNEk0aWdPN1RxNlBUUGVB?=
 =?utf-8?B?dC9tQ2wxUzFuQlAvZmdLWUxjZFh1TDEyMVBBaHBrUENiY3R4K2x3d2VONktC?=
 =?utf-8?B?dlNxdUR0c3FhTk9jOE1sVis3Z2dwM3hXc2h0SFhYbGdyRVRjVnJYdmdDb1Yz?=
 =?utf-8?B?N0Eyakg3bTJrRDlsYk52TXM0UFQ5b3JlNEdDRndQcU5FK25BVklKQ1EzeWov?=
 =?utf-8?B?amswUy9sNzFPc2ltVWtYcTREKzFOZ1crengzWHdET3IrbzNKMjNqdkEvWkFV?=
 =?utf-8?B?c1VRamZ6MWs5azJIOHBKSDB1dWU0TStYSUFvOFpKVkN5S3lhQm5OaEsrK0lD?=
 =?utf-8?B?SXZLU0drTStOelJaRVJ0UXlTOWFjcjk2eGRPSDVrM0ZXbkR1cVlWSERmYkE4?=
 =?utf-8?B?QVQ5SEFENjFkWGtyZ0ZtaHY4eTVMUGJWOWV5Q1kyQ3dyTnQ3cGhpdlpsTmlh?=
 =?utf-8?B?dWJkU0JWTklEZGQrNjFGMEtDQWpaSU5qeU1wU1JDbU9ESTdLNFZ6VmllSDk0?=
 =?utf-8?B?VFg1Qi9SbDhIaGpHdUEwYTk1aVFZNTJhNFV2Y0IwVk1hOW5iWjd2UHI1Rm5Z?=
 =?utf-8?B?MzluMnF6WS8xYmRUNHVjWWhjY3g3L2k5dmNETTgzSEFFVnU4VGRJL0ovbTVh?=
 =?utf-8?B?TVhIcDJKYXdLMVVFeG0zTlZHL3h5M1BOQTJ1YW1LQU1nejRGRDNuQ3ZqbGxF?=
 =?utf-8?B?MU9kYUk1T21iVzZNOWdxa1RQekJEUDA2WXJtUjdDdWZCcWNyNkJ1YXNUZWtQ?=
 =?utf-8?B?NmJGWEsxV09LMW9iUUg0bkJoNnJ0UVo5QTVtVnZ2Z2t4Y0lrak16YnEyeG12?=
 =?utf-8?Q?yL1dCL/UKb9FInd2WmP8b7KzH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aede7385-5df9-4d94-760e-08da6323c8c9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 09:57:37.2341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mD7rwyH8O5Eop7Wo6OoTeWzkq+OoX4PGwBpip0kpZt9d9JvOixNJk38n+zJREkn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3900
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Karolina,

Am 11.07.22 um 11:44 schrieb Karolina Drobnik:
> Hi Christian,
>
> I'm sorry for digging this one out so late.
>
> On 06.05.2022 16:10, Christian König wrote:
>> dma_fence_chain containers cleanup signaled fences automatically, so
>> filter those out from arrays as well.
>>
>> v2: fix missing walk over the array
>> v3: massively simplify the patch and actually update the description.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   include/linux/dma-fence-unwrap.h | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/dma-fence-unwrap.h 
>> b/include/linux/dma-fence-unwrap.h
>> index e7c219da4ed7..a4d342fef8e0 100644
>> --- a/include/linux/dma-fence-unwrap.h
>> +++ b/include/linux/dma-fence-unwrap.h
>> @@ -43,9 +43,13 @@ struct dma_fence *dma_fence_unwrap_next(struct 
>> dma_fence_unwrap *cursor);
>>    * Unwrap dma_fence_chain and dma_fence_array containers and deep 
>> dive into all
>>    * potential fences in them. If @head is just a normal fence only 
>> that one is
>>    * returned.
>> + *
>> + * Note that signalled fences are opportunistically filtered out, which
>> + * means the iteration is potentially over no fence at all.
>>    */
>>   #define dma_fence_unwrap_for_each(fence, cursor, head)            \
>>       for (fence = dma_fence_unwrap_first(head, cursor); fence;    \
>> -         fence = dma_fence_unwrap_next(cursor))
>> +         fence = dma_fence_unwrap_next(cursor))            \
>> +        if (!dma_fence_is_signaled(fence))
>>     #endif
>
> It looks like this particular patch affects merging Sync Fences, which 
> is reflected by failing IGT test (igt@sw_sync)[1]. The failing 
> subtests are:
>   - sync_merge - merging different fences on the same timeline, neither
>          single nor merged fences are signaled
>
>   - sync_merge_same - merging the fence with itself on the same
>          timeline, the fence didn't signal at all
>
>   - sync_multi_timeline_wait - merging different fences on different
>          timelines; the subtest checks if counting fences of
>          various states works. Currently, it can only see 2
>          active fences, 0 signaling (should be 2 active,
>          1 signaling)
>
> Reverting this commit on the top of drm-tip fixes the issue, but I'm 
> not sure if it wouldn't impact other places in the code. Please let me 
> know if I can be of any help.


Thanks for letting me know. Not sure what's going on here, but I can 
take a look today if time permits.

Do you have a description how to easy reproduce this? E.g. how to run 
just those specific igts?

Thanks,
Christian.

>
> All the best,
> Karolina
>
> ---------------------
> [1] - reproducible locally, but can be also seen in the CI:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fintel-gfx-ci.01.org%2Ftree%2Fdrm-tip%2Findex.html%3Ftestfilter%3Digt%40sw_sync&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C2af59c808f664f0cf04908da6321e708%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637931294507736831%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=NTI04OpP7kMsCu%2BDWsJ0%2FRIVJGJbxy36tJBImD2MQDU%3D&amp;reserved=0 
>

