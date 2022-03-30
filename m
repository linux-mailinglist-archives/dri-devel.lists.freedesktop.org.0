Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B5B4ECDFF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 22:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A85589C84;
	Wed, 30 Mar 2022 20:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B129189C33;
 Wed, 30 Mar 2022 20:34:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzPdfIFObJtMLenBDKxdsCxoxlG81UBowaJkDedXDuOrL7Hs9qEMT79T+WOteVFgDfwLg6oMS2IiStN8ggRyzgzS5mY1I6brHWT6B3oeFmAd8V5bLZB175KvIuGV66PaZPAH6Gimkir/nOUlRzkw0JHjsWF1r3LTOKASKuy/plW3SN6nBzThMorKGbV3qT2/Xa++cfjMzwiaiYSWaNv4vcFaqPiGyb/hUoFp//jjHebrPduF0wi8V6XqVRRx8nFzOK4vwFcbqfB90Y1PBMWmuwVs5MvYH0EpaqE7U0j0tekYraKrzSCdun8taXXrfWeKTsMFGsO8iB34xk3bqHlUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnCDtxB9XISBK9MW4uWZ4chTOzPqXKhmE0ppTtjncSA=;
 b=O+P4e0n2RJ9A+JbrDtLUNLnVB1UXXNemAtqwNpFjzezbPCWiwG4mDp8GcwclJakF5DQaBzPkpKqLu4t2a4/CfgvPbHmxrcZxf9KmLBOq88h+3LzN0/3ymRvY7cseyxFMvGsDUTOT4G/pg1omBH92vB/NpVrs5T/HdS43+gLjJh3uimesuXGpDgouO9I8UpjQeGV9mqSRt1pH6S7xnnLItRQOHaCZQbgPHUmrezAW+omp2Kohfi3Y6TODVG2oPIEiQpa2m02DVs1GEsXpIPm1ebz1DD8swtW8nluHxBkrVGKbA27Fl5wsFo6Y4NyXXfruM6GbtsQS3Pj9fFQIhyFSqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnCDtxB9XISBK9MW4uWZ4chTOzPqXKhmE0ppTtjncSA=;
 b=HFUvnYnl3xwZigOjWnAyQ5pSnjpmOd+3MB9WmpVRTSO7r+Shi4mcLiJxDA+/aQaA3yA3zMyuYbtls9u+78IucQtRjPMMvW5XobMsnMSCaQQLzO3RLYiQ4QtNaSvw1VBn3p678fMOEjbdocI8I6GuD4JDF27MdUMoZXLKNysB/TQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SN1PR12MB2495.namprd12.prod.outlook.com (2603:10b6:802:32::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 30 Mar
 2022 20:34:38 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 20:34:37 +0000
Message-ID: <fc1ca7d7-fd95-7094-56d4-cd9254fdb8a2@amd.com>
Date: Thu, 31 Mar 2022 02:14:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm: round_up the size to the alignment value
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220330090410.135332-1-Arunpravin.PaneerSelvam@amd.com>
 <c0b22bc3-8bad-fd19-6d1d-164bfee851c4@amd.com>
 <65d77a10-897a-fce6-28c9-321f3c723129@amd.com>
 <c943b565-9011-a285-8caa-5cdb37571688@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <c943b565-9011-a285-8caa-5cdb37571688@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR0101CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::22) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed3d1ad3-d0b3-4666-406b-08da128cb563
X-MS-TrafficTypeDiagnostic: SN1PR12MB2495:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB249519C120F4FD4DF847DE31E41F9@SN1PR12MB2495.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HmfEey53V/uVFO/eEDmxf+WsniPoLipMI8sSCSmmckQJ52rEpyF6ocBglveVr/ePtM+FDBFxtSmpGzOOQgZyZ0FWiFhwK4cLDzDQvJAJ4KR9vzxZCFCytAIWAxhTOQWO4gERfEjMlkw5nC8WMIP7fMf4VcMZdvxNXU5PZBJjjQbvJZvdsnO6Mca/1+5d6YDJxzbPFgDnu6owOoPzemp8jh46wsbTHmhNjBPg6JxM3RxXqEqJMgQ2sqhXckh5vKDe/f3j5xmcz11Uu7HoKXsPeGgiZCIYKk8M+KuLIaizE49P5a1TIi2MRQaif+df1ztXhng+FU9UtJFEDrihp/ixzkk+12yQ3+9D5+Q0dMw6z0m7ogs2253oQNHPbkZwIlTj8cj1WRVinvdPuSWVy7v2vlpB51wFImO77Y2pRH8PyVhrQQPNneAPQUddzSN9gLq++gTlm9esHML1YWYDY2GbtWnq/DnFSEYbWb1Zm3Qf0E4lpnQbic440ix213MdTNyvZCzuYffbQjB1AcWcHPxUpyKI+iyOtufUG2J8inm+IAW8zY+SSJXkvBc8trZAz+XPWmLUt8iSs0UMvXWZbiL4+kt7UiNSQcs/MBplGW8e3BCQSVHSHIxGFX523nBiNGUhzS0QJmlfIex2IUD3E/xO0TwnFWAB7u5etugw/LX+1G7wS7u38Kh0lCV9qjozlCU+KOVjmhIZelnH4YczgucbqX7SN1AjjTWhBuDeCLnysLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(86362001)(8936002)(38100700002)(6512007)(2906002)(66556008)(66476007)(8676002)(4326008)(31696002)(5660300002)(66946007)(6506007)(2616005)(36756003)(186003)(508600001)(66574015)(26005)(83380400001)(31686004)(6486002)(6666004)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXR4TnFZSHNMU0ZFWnhINi83eTg3aURaNFQ0SkZ2TGl6ZjJhTDRkVE9LTXBO?=
 =?utf-8?B?QVdLajFISWJBR0N3YXE4TitmMlNrRFdsdjR5VThBRjZnbWw0ZGcvdUxOK0Ns?=
 =?utf-8?B?Q1ZmRC8yR1RZeSt2V0t2SCthazNtVnYyYzFVWjl4UTJ4NGorU3hOYkxwbHZK?=
 =?utf-8?B?WHNYckJyaXk2clprUDlNazBmZDNkbW1yOFFyenNjaTBjY056dG9iK05OTVJ2?=
 =?utf-8?B?UlRxY0FraS96S1lpU04yODlYRzZWK3BNOFF2U3VOcjFjUEpvZWRkbVZ0ajhz?=
 =?utf-8?B?cVR3NTV1a2kvbXdZUlZ1TjA3a0doeE1jWFhPZ0JrcHFFUnVRNWxhaGZpKzV0?=
 =?utf-8?B?RHQwTVU5QjI1REdXYTdmNGUrK05pL0F3WmhHNWNralF4UlU0RHJaZWxxZjFl?=
 =?utf-8?B?T2dURUo0MGdjTkI1RldhOWc0UXdrdk9kblBjWjFselg0YVRpZ1JpSmFjOWVP?=
 =?utf-8?B?K255YlJiOXYyZm41ZVJuWWxPVm5KQllGZmxpY1czOUY3TWlzemovU0VIcEVH?=
 =?utf-8?B?VjJHTDZzaEJ1c3gzUVJSV2luNC8wYkpoTVNFdG1rcmhSWjdUbGZ4VUJkL05a?=
 =?utf-8?B?SGo0UjVNbVhkNDRHUU9BY09hWHRkOUlwKzhxMWhyTm44bXM0WnpKSnBVdG00?=
 =?utf-8?B?RFk3d2pySG82eEo0RnhxOE1HdEJjWDJHTW5NaURPMHQ1clg3TDJGZm9YSnh3?=
 =?utf-8?B?a29iaWtLSnJ6dUplNDhxVy82a1NUdVFmTVh4VUI4RkQ1bFFZUnJ1WW1oZWUy?=
 =?utf-8?B?OUNXMVRmdnkyN0thTGdmZXBYMWNweWsyaE9kU0MrL0NnVi90aU13dzdpWEcx?=
 =?utf-8?B?UFkwbmM5YllMZlFtL092NG5ZaHZubllIQ0JaOFFoMi8zRG91a2dXTU5sZm0x?=
 =?utf-8?B?c3VnUmRRaExCaCtod25ZWmVhaWVZemk4TnkyMUlhVnZGak5HeXltODVCRVM0?=
 =?utf-8?B?TlZoWUZFTVpvLzY0cXhabHdrQ0IzMkd3ZWtUQlpTRVRzeXFvUG8xK3hkS2p3?=
 =?utf-8?B?cmdvS1hsa2JWN3VUTkVBSEVDaXRFaEdFMmVoQUJIVVJ6cVM1N3JndjNpSW84?=
 =?utf-8?B?SFBkU1VVWFJWZVpoNWJNQXozTUdGVTVxVnZIaU5MS2N2S0laV1BhNmVKT0Jp?=
 =?utf-8?B?eUwxcnVFSUUvRERqNDNWaGtLNk5iUU9HYmZxQnFWTTdOcEYxM3g3REk5REQx?=
 =?utf-8?B?Zi82clFCaUt2QkdPZmV0endsMllsQTBuUEJURXk2VVI3YUFYOUlVdjk3WjhW?=
 =?utf-8?B?b3pEZVlMWlFrQVRCMDhvVTljRTBGQ3NaQk5VZ2M1Qk5jUEtKUTNwUFVtV2Zt?=
 =?utf-8?B?cTVyMlpyQlN3WUtRQW0vanBxa1U1RUZyNm15OFVaRGljL09qTytHRzcyT0p0?=
 =?utf-8?B?eDljRkJlcXo4UHJlS2ZIbTBiaHpzMkxZcURkNFYvcTdER0lVbnNBSHRXZ1gr?=
 =?utf-8?B?Zy93c0s1bDhHTytob1Zncm9TT1p2bUMya3lEZVdUQUhNVEFqS3EyK2lWeFph?=
 =?utf-8?B?R1JvamRPR0pLQVZKbldsc2tUak1RYTdiTFFmdEJPMzF0dWJubUxUSmhIYnNS?=
 =?utf-8?B?dWxidExzaWVDU3dtUUtoRUpFaXpIcVpoVDdKNDRPM1d6MUYvVkhjS2V6ZXpP?=
 =?utf-8?B?aHArQ1JCTTkzTlZpM3B1cmMvRWdGVnVWaTIvdFMzTGk5dFJtbElhaXQyaXJj?=
 =?utf-8?B?RUtUc0Z4amdmNUx3MWZnZnFPWUI5UjgzaE41RU5ZQldZcW42bTlKUmp2a3NY?=
 =?utf-8?B?SlV6eDlYNThBTzRMbHFQU2d3ZjhhK3kveVp4b3o3VGZ0cUplQWtRZklUTlda?=
 =?utf-8?B?a3lkblczVjhVSGdkcThUb0V3akF5bFRTNlVMcjJDOXBhdmRPQTE3Qjg3R2tY?=
 =?utf-8?B?REQ1SnVuZUtTT3I4cTk1ZHNrVkpBNUVtWDZvaUc1OXJVcTFGZzMwVldjWG9x?=
 =?utf-8?B?Zk4xRVl6RGs2QVR0MWd6VVZ2enQ5QXdJTGViZFhQYnpXRXdRNTVZUStFQy9N?=
 =?utf-8?B?OElCd3V6M0RkUHp3dmpTRXhkWGxZYkwzdWY3b05iQXR0SkllS1VUc3lWQlk0?=
 =?utf-8?B?WlpsdExZNS9hQUZ0STV4eHA3alVJd1hoM28zaHVoTVNUTUw1ZVJ4Z3hnS2Zo?=
 =?utf-8?B?VzN4N29wbmZHWjdIYitVSlgxeTZ6aGM0blVReWQ5ajVKZzdPdFU0OXVtc3ZM?=
 =?utf-8?B?K2Flakl2TUlTZ3N4VDZobXVSTXlsa0lCRVh2cytweFd4S3VRdDBwVkUwQWRL?=
 =?utf-8?B?OFo1TkYvVTErcDZjV3NoZkFMdTA4VUZ4MkxJK2xINm0yM1o5WDZ4RUdTRlNF?=
 =?utf-8?B?dVYrUTZucTdIaFFOREtRTU1ZdlI3UTltb1hYWXdYZ0s1Z05DL3JIdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3d1ad3-d0b3-4666-406b-08da128cb563
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 20:34:37.7373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hoKLEbWdNTziITwj6QOWHmXOEjsOCBjdFI3JZRrSaOTtjs3FwMqzU+88ha6pz1CBgz6sUElLZaXNRJ7vO/t00g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2495
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30/03/22 2:42 pm, Christian König wrote:
> Am 30.03.22 um 11:20 schrieb Arunpravin Paneer Selvam:
>>
>> On 30/03/22 2:37 pm, Christian König wrote:
>>> Am 30.03.22 um 11:04 schrieb Arunpravin Paneer Selvam:
>>>> Round up the size value to the min_page_size and trim the last block to
>>>> the required size.
>>>>
>>>> This solves a bug detected when size is not aligned with the min_page_size.
>>>> Unigine Heaven has allocation requests for example required pages are 257
>>>> and alignment request is 256. To allocate the left over 1 page, continues
>>>> the iteration to find the order value which is 0 and when it compares with
>>>> min_order = 8, triggers the BUG_ON(order < min_order). To avoid this issue
>>>> we round_up the size value to the min_page_size and trim the last block to
>>>> the computed required size value.
>>> Well, Matthew and you convinced me to *not* do it like this.
>>>
>>> Has that conclusion changed somehow?
>>>
>> Yes, now he is ok to handle rounding + trimming in drm buddy
> 
> Yeah, but I'm no longer :)
> 
> How do we then handle the detection of contiguous allocation?
> 
> As I said we can do that like:
> 1. alloc
> 2. check if we only have a single node
I think verifying the list is a single node would allow all the power of
2 requests(1 page, 2 pages, 4 pages etc..) single node and CONTIGUOUS
flag not enabled cases entering into the trim function and simply return
since the original size == roundup_pow_of_2 size.

can we handle all the situation (alignment rounding trimming +
contiguous trimming) in a single if condition like below,

if (cur_size != (pages << PAGE_SHIFT))

where cur_size = stores the size value before round_up(alignment
rounding up) or round_pow_of_2 (contiguous rounding up)

pages = stores the size value after round_up(alignment rounding up) or
round_pow_of_2 (contiguous rounding up)

if there is a difference b/w these 2 numbers, we enter the trim block -
- For a single node, we pass the original size (contiguous trimming)
- For multiple node, we fetch the last block and trim the computed size
(alignment rounding trimming)


> 3. trim
> 
> But if we include the trim here we can't do it any more.
> 
> Only alternative would then be to inspect each node and see if it 
> follows directly behind the predecessor.
> 

ok. Therefore, we handle both contiguous allocation trimming and
alignment rounding up trimming (only last block) in amdgpu and i915 driver.

And, in drm buddy we just have a check to return -EINVAL if size is not
aligned to min_page_size.

If yes to above statements, I included alignment rounding up trimming
(only last block) in the same place where currently we trim for the
contiguous allocation. I will send the patch for review.
> Regards,
> Christian.
> 
>>
>>> Regards,
>>> Christian.
>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_buddy.c | 31 +++++++++++++++++++++++++++++++
>>>>    1 file changed, 31 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index 72f52f293249..98d7ec359b08 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>> @@ -641,6 +641,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>    	unsigned int min_order, order;
>>>>    	unsigned long pages;
>>>>    	LIST_HEAD(allocated);
>>>> +	u64 cur_size;
>>>>    	int err;
>>>>    
>>>>    	if (size < mm->chunk_size)
>>>> @@ -665,6 +666,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>    	if (start + size == end)
>>>>    		return __drm_buddy_alloc_range(mm, start, size, blocks);
>>>>    
>>>> +	cur_size = size;
>>>> +
>>>> +	if (!IS_ALIGNED(size, min_page_size))
>>>> +		size = round_up(size, min_page_size);
>>>> +
>>>>    	pages = size >> ilog2(mm->chunk_size);
>>>>    	order = fls(pages) - 1;
>>>>    	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>>>> @@ -702,6 +708,31 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>    			break;
>>>>    	} while (1);
>>>>    
>>>> +
>>>> +	/*
>>>> +	 * If size value rounded up to min_page_size, trim the last block
>>>> +	 * to the required size
>>>> +	 */
>>>> +	if (cur_size != size) {
>>>> +		struct drm_buddy_block *trim_block;
>>>> +		LIST_HEAD(trim_list);
>>>> +		u64 required_size;
>>>> +
>>>> +		trim_block = list_last_entry(&allocated, typeof(*trim_block), link);
>>>> +		list_move_tail(&trim_block->link, &trim_list);
>>>> +		/*
>>>> +		 * Compute the required_size value by subtracting the last block size
>>>> +		 * with (aligned size - original size)
>>>> +		 */
>>>> +		required_size = drm_buddy_block_size(mm, trim_block) - (size - cur_size);
>>>> +
>>>> +		drm_buddy_block_trim(mm,
>>>> +				     required_size,
>>>> +				     &trim_list);
>>>> +
>>>> +		list_splice_tail(&trim_list, &allocated);
>>>> +	}
>>>> +
>>>>    	list_splice_tail(&allocated, blocks);
>>>>    	return 0;
>>>>    
>>>>
>>>> base-commit: ec57376fba5abc0e571617ff88e2ade7970c2e4b
> 
