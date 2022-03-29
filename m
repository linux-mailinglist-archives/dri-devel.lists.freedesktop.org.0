Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C713B4EB0FE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 17:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C8F10E8B9;
	Tue, 29 Mar 2022 15:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B22910E0D3;
 Tue, 29 Mar 2022 15:50:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FI51LeLk0rPkZwH+UregSqwhtOBCdb5qQ7yMKnKFqtVj7Xvd7mnCTYALcHWmkckW3JCdL5B4kiaSYzWE1EqrgIjMiZsuc3XUjTcjmkiHb8ozni35P8gzL0n1YtM5O9YhplDjojqngHMVYhqgkTLKzza2Xvky1ceYksV08qUuN3HE+ueXsuw+AFbiYcn03ZroW6g3uB7cUhoeqjNZkBtlK0fa9vj3Yt0B6ZPuJjij4Bi2eOvPyRWxqW7D5OgukJ3m4m5RUaOEF2x4JH0cP/7ta5qICaubp7YTiabF+Fo1FVPKGDNnl/0AVOjQPStMehny2wZ0dYo0Jnx1z2vIDhErug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+jR6bGKMmpAf72VlssZbrKOARpeXIjfeB1AxRStcsw=;
 b=OD27CYVYzRHFBKWbsptBV57BtCVrwn0B3HwJQ5xkSTohYBFGlXdcMUdOO6td6EGeTR4uJA5vq+Jp0fm4qsOfyTwL1LLjtRc+ePZqPACul1UZ7SfSFhYgJbAFqQZaamy9z10SVSCK5xApMZxoq62GSdnFWSKgUtBxunCfrhSwoqy4nVxbR96pvG+C0/USYIMhFamywCVZqAvz5J0jH2J9DGO17/hlGN1SgkNEhnKRyF/CymzC55ucVKBYyVKFmbASzI+HZjwo64DZKW+ueEL70L+GNf6BpbpCY4YkVZdCO5lWsgOcAVD++5TqStCmdrh7nRg3i0aemoK8qxQ0c0FsDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+jR6bGKMmpAf72VlssZbrKOARpeXIjfeB1AxRStcsw=;
 b=0H3XauiFyibDjNkNnmPeQSYIcMplPE1l6r+knltLEhWX6mPmECsPPiCe5+ntOXZyVNHIaR/yOSUbjyT3eCX9DZno43DxnCgfQrBWpGzMtLaqX2/4UzBI7GainH/IsH8s7oDMhlFRJqKZDACiJ8k7sfEC0t+HuYYYTWZK9baO73U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB3263.namprd12.prod.outlook.com (2603:10b6:208:ab::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Tue, 29 Mar
 2022 15:49:58 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 15:49:58 +0000
Message-ID: <1eaf81e5-84c5-dbf2-b0ec-5ca59e872242@amd.com>
Date: Tue, 29 Mar 2022 21:30:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <c255f3ea-a269-1886-f79a-2d8a38b956b1@gmail.com>
 <MN2PR12MB4342B7FD0CC5C480DEEF8A77E41D9@MN2PR12MB4342.namprd12.prod.outlook.com>
 <2b77dca5-df7e-5a65-eb3e-f186e1037e4d@amd.com>
 <417bc262-17db-551f-1334-3cfafe997c60@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <417bc262-17db-551f-1334-3cfafe997c60@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::14) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1ee67f1-5716-45dc-ed24-08da119bc6c7
X-MS-TrafficTypeDiagnostic: MN2PR12MB3263:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3263120F1C883157BF0689EEE41E9@MN2PR12MB3263.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ZOzyY62uKQwUuS8gFPlYLi6EaDIWXYvu7ekvGABwd5OUXfz0qD5GYiLISXAzNxV5ltFUKqhVbkeKBWwflalSNktFeyk76Y/8gBKKna99L5eICt4gorZwqW02il4mFBmjIhJMknat4BnsCd37c0h951zIf34Fno+L4WekcC68iw6I+AagAexoZjF+HAnhNO7JXl4tQzNR11mPdRJ/8SOAQ/bVmSLXvgyt67DMclxmJ4d289FjqvKNiNd3SoVVl97JPC9nvTvIgPZGSWvMzguqEfLIxLp+ZgY5l0PpBJIwmkLLZchMpPACJuP4cD80Z+jUT5MnDFKBZVzPIm1H+Y/BnYJbhmCEV9X5fGWN55fTKt1X3r+23lrD0i5tSJt9k5YwDDBwFg4+v1C4LtlVNpS32tJLwOYxhOMlfXmuvpHf7MZZ+vGlzGKUkMBPVo+t6121VWrkeNWsDI0mEGQlR+YULpeP5Wa6lpVKWHJ/bT9sj84CM9MlMfSvHSuhTFLC47umrs+aHNEjjogPrNqgGgL9zUPM87bgnGmacHpTjnqhplvRwWfp2hoa9QRq7XqxupVf/Tw/0C6snO8gsv5g6viizPK9yP0HL7lwZ+bGhuTrnMEzBpkw0q0YJodancWTobQpFA5RoiL0i1vScsXjnhjpFGmN3gKLxrym+wWVoRxRZbdCKmL6AiES5oV6k2m5vHmb0Ck7mK+ohQd8FFJFdhe4UBrR8MQZ5SCiSsbZRkCAfESQ6ELr+VS4jS6g7DI/ub0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6862004)(36756003)(86362001)(8676002)(4326008)(53546011)(37006003)(83380400001)(6512007)(54906003)(6666004)(6636002)(66946007)(6506007)(31696002)(66556008)(66476007)(316002)(38100700002)(5660300002)(186003)(26005)(2616005)(6486002)(508600001)(31686004)(2906002)(66574015)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW1jc0VTZnVicGdKUkg2dnRVNnZyNzdtK2dWcVhkRXB1WUJzcEx0UVgzOGpI?=
 =?utf-8?B?V0V0a0txVFcvZ0hvOGNEdWlReUgxN0NwdEpCVzZwTlBxMUNRSjh1dmNIM1Bs?=
 =?utf-8?B?Wk0wTXlpZFh5Q0w0YnFyTEpGRi93ZnZOZnpyZ3EwWTNIOFM5Q2dxQy8zbHU4?=
 =?utf-8?B?d292RWZPRUM4MUw2ZG9nR0c5UlNmMmJrb3lKc0s2TmtIcGtlUHdtK3dyNzky?=
 =?utf-8?B?TitCd2ttUHBpTVJ6aHh5NEN3RHBHTTMrZU1hYzhXRkZJengwNEE5L1haUTFY?=
 =?utf-8?B?MXgzZXFIVFdVbE1ldTZuYnVPRnpTWmpLZUVOSTlidGhHSTlMdjcxRVFLQ3dP?=
 =?utf-8?B?T2p6aGtNd3hmVmYyMnNGaUwyQlhVYjE5cXJKSFFUZUZvcEV2RlhLMmpLZlc2?=
 =?utf-8?B?bVdoVmtBWWhIcUprakVvYWs4S3FmbVZldGxsQ2ZHTzc2bHZWcW82MDNsRkcr?=
 =?utf-8?B?KzlkVzVYcmIzMXI1VDlxTmUxa3JRbnNFaXFLbEdsNzNmaW54VGE1VmppOWhQ?=
 =?utf-8?B?YjFSU3Y1OC9DSHBGTTR0NTV4MnNURS9lWjhxUG5rclpoR09ka25YdTk4SG1u?=
 =?utf-8?B?V3lLSnNxb2JWOGQrQm8xWG9IaDJhSUZwTVZrZTloakloeWVyZGxrTDNCeTRZ?=
 =?utf-8?B?bEVTZHVwQWNBcmVyWkQzK2xjTGhrTzlQM0xmUFJDdmhXM3M2RjcxY2t2N2NH?=
 =?utf-8?B?WTNGeG9UbElaVFg5K0N3eUFidkhuWjJ4QUdIY2lNRC8weG5ZS2ZRaUNBT3VP?=
 =?utf-8?B?NmlQZFc1RmdrbUxDNTZ0TE1BRmFJdDhGeUxwV25lYTlXbVNJNWJqUjNpVWZm?=
 =?utf-8?B?NktyWExDOXMyOHRmQkxiZ2ZhSlFEQ1d1T3FZN3NZYkxmcFRrZnl6MldaTWpW?=
 =?utf-8?B?VzZmZzVaK1owMzAwYUlrcHk1OXoxSXRPQkxQdytvREhla1RMRk5leGRla3Rz?=
 =?utf-8?B?Y3pta3g2T3MrVmpXNkNIb3h4TWc1T01ySyt6WlU3WnYyQW9kRURLYSswdWgr?=
 =?utf-8?B?V2hTcG5vZDlDZVJ0Sk1seHFHbzZ4d05CaXh3RW13SmhZN1l6dSt1WkFTRVk1?=
 =?utf-8?B?NllSTExWdmZCOTcyZWJrRGF4VVdEOVdxZ0p0M2l3aHZUNHJOeGZMVWJ3ZHFa?=
 =?utf-8?B?dDVkKzU2MSttTFl4YktSOXVpdG5nU1N4SXFjWXM3OG5TYkFrazBSdUdHVkhD?=
 =?utf-8?B?UHNqQ1ZyaG9zWnQvM2ljWVRjek1YYUhJMCtiSHlSZkVxcXNUeFR3bkJGbVBP?=
 =?utf-8?B?STJWQzdTTWY5QUlnUmlWWmcxNmNBMkFDamVxTDhsYW1tWFEyU25YZVNRQmZV?=
 =?utf-8?B?ZDIyZy82eTRhREV0VFlBcWg0WjF5UkEvenFqRFNTVWlraU1XeXEyQUh2V1Zk?=
 =?utf-8?B?N0VITTRtcDgzOHh4czlmU0cxRXAyWHZqY0RRMTczMUpiWlNGUSt4RmxaaWZs?=
 =?utf-8?B?M2FlVTJMQm82MitUL2FTb3FyUmJONmFRWHVkenl6T1pKeGV1QkZFS0ZzVzZa?=
 =?utf-8?B?emNZTUplR290aW44US9pQ0kxUG5YSTJYemJhMUMzWVdiNElEdVlJc3RqdXBr?=
 =?utf-8?B?Y0lGemJETStlb2poSzVJUlRZdUFoMlBsTUplUnhXbXRuZkNNYzIweUd4WGRp?=
 =?utf-8?B?MDh0WGlCTVN4OU4zUlA3NWY5WEhUM1BncFI4dm13cUZzeW5MTmxGZGsxMVlk?=
 =?utf-8?B?bkxkYnlRZVZJb0s2UVEzdXg1QS91U0RLR01KSnhYYzFlazhrZ0pZclcyejFW?=
 =?utf-8?B?NXBpaTZ1TDFpM3pnREhOcjdEeWNZRVl3d0hhTkgvdWhVYk1mRDVmaEJWRk9y?=
 =?utf-8?B?MXBsaktaL09wbUV4NVBsRTVxQ284a0pyNlZQNFRGb0Vkd00rZWE5Slg1Smgw?=
 =?utf-8?B?ZG5DV3RjaS84c2U1NnUrSkpkZzJqeTd6WU9Pa2lXd3dFSy85WUVNZDlYVmdK?=
 =?utf-8?B?K0FqOE0zSVdwUTIxWmovTVc2Sk8xeWd2NXRwd082TktwUS9YcGpnSTlvZTJu?=
 =?utf-8?B?Ykg1QnpFNTB6ZXF5YXBYcE1ObXh3NVYxQ1hmODg5aUJXVXVIaTh3VWNxMVhw?=
 =?utf-8?B?cmRjaWNVZUZDSlhZVTlLN0xiQkJHMktsdUhGZGU2Mm91TGRsdGJKYjl6bkpn?=
 =?utf-8?B?VzhDNG92Zm1CdFRuR2NsanZ4dTVjNmFISmJPeGFpNGp1TG9WK3NZY0V2QXIx?=
 =?utf-8?B?am5OY09QMnNqVG9wSWF1dWoySHNZd2syVXp1cjhOZTRTSm8vbGFwbGk0dzRX?=
 =?utf-8?B?MnZxclJQVVpYNyt2SHZReWxweEpEd0x6RnNGVzQyRWxTbjFKS1R5Vm92d3Fw?=
 =?utf-8?B?L3Ftd2Y5aCtYR2p1UzRkZXFuUlhlK0xoMlRJU1ZRQWJJaG5TUG5nZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ee67f1-5716-45dc-ed24-08da119bc6c7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 15:49:58.1908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LalNrQ0oZbh6ZMclSIAG53Z7F6kjF3oAXVr1f7IElCUmwmRrsVKodJGE19I+tCk04QQUfcGctoD6iw7C8q+l5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3263
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29/03/22 4:54 pm, Christian König wrote:
> Am 29.03.22 um 13:19 schrieb Arunpravin Paneer Selvam:
>> [SNIP]
>>>> +	pages_left = node->base.num_pages;
>>>>    
>>>>    	i = 0;
>>>> -	spin_lock(&mgr->lock);
>>>>    	while (pages_left) {
>>>> -		uint32_t alignment = tbo->page_alignment;
>>>> +		if (tbo->page_alignment)
>>>> +			min_page_size = tbo->page_alignment << PAGE_SHIFT;
>>>> +		else
>>>> +			min_page_size = mgr->default_page_size;
>>> The handling here looks extremely awkward to me.
>>>
>>> min_page_size should be determined outside of the loop, based on default_page_size, alignment and contiguous flag.
>> I kept min_page_size determine logic inside the loop for cases 2GiB+
>> requirements, Since now we are round up the size to the required
>> alignment, I modified the min_page_size determine logic outside of the
>> loop in v12. Please review.
> 
> Ah! So do we only have the loop so that each allocation isn't bigger 
> than 2GiB? If yes couldn't we instead add a max_alloc_size or something 
> similar?
yes we have the loop to limit the allocation not bigger than 2GiB, I
think we cannot avoid the loop since we need to allocate the remaining
pages if any, to complete the 2GiB+ size request. In other words, first
iteration we limit the max size to 2GiB and in the second iteration we
allocate the left over pages if any.
> 
> BTW: I strongly suggest that you rename min_page_size to min_alloc_size. 
> Otherwise somebody could think that those numbers are in pages and not 
> bytes.
modified in v12
> 
>>> Then why do you drop the lock and grab it again inside the loop? And what is "i" actually good for?
>> modified the lock/unlock placement in v12.
>>
>> "i" is to track when there is 2GiB+ contiguous allocation request, first
>> we allocate 2GiB (due to SG table limit) continuously and the remaining
>> pages in the next iteration, hence this request can't be a continuous.
>> To set the placement flag we make use of "i" value. In our case "i"
>> value becomes 2 and we don't set the below flag.
>> node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>>
>> If we don't get such requests, I will remove "i".
> 
> I'm not sure if that works.
> 
> As far as I can see drm_buddy_alloc_blocks() can allocate multiple 
> blocks at the same time, but i is only incremented when we loop.
> 
> So what you should do instead is to check if node->blocks just contain 
> exactly one element after the allocation but before the trim.
ok
> 
>>>> +
>>>> +		/* Limit maximum size to 2GB due to SG table limitations */
>>>> +		pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
>>>>    
>>>>    		if (pages >= pages_per_node)
>>>> -			alignment = pages_per_node;
>>>> -
>>>> -		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
>>>> -						alignment, 0, place->fpfn,
>>>> -						lpfn, mode);
>>>> -		if (unlikely(r)) {
>>>> -			if (pages > pages_per_node) {
>>>> -				if (is_power_of_2(pages))
>>>> -					pages = pages / 2;
>>>> -				else
>>>> -					pages = rounddown_pow_of_two(pages);
>>>> -				continue;
>>>> -			}
>>>> -			goto error_free;
>>>> +			min_page_size = pages_per_node << PAGE_SHIFT;
>>>> +
>>>> +		if (!is_contiguous && !IS_ALIGNED(pages, min_page_size >> PAGE_SHIFT))
>>>> +			is_contiguous = 1;
>>>> +
>>>> +		if (is_contiguous) {
>>>> +			pages = roundup_pow_of_two(pages);
>>>> +			min_page_size = pages << PAGE_SHIFT;
>>>> +
>>>> +			if (pages > lpfn)
>>>> +				lpfn = pages;
>>>>    		}
>>>>    
>>>> -		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
>>>> -		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
>>>> -		pages_left -= pages;
>>>> +		BUG_ON(min_page_size < mm->chunk_size);
>>>> +
>>>> +		mutex_lock(&mgr->lock);
>>>> +		r = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>>>> +					   (u64)lpfn << PAGE_SHIFT,
>>>> +					   (u64)pages << PAGE_SHIFT,
>>>> +					   min_page_size,
>>>> +					   &node->blocks,
>>>> +					   node->flags);
>>>> +		mutex_unlock(&mgr->lock);
>>>> +		if (unlikely(r))
>>>> +			goto error_free_blocks;
>>>> +
>>>>    		++i;
>>>>    
>>>>    		if (pages > pages_left)
>>>> -			pages = pages_left;
>>>> +			pages_left = 0;
>>>> +		else
>>>> +			pages_left -= pages;
>>>>    	}
>>>> -	spin_unlock(&mgr->lock);
>>>>    
>>>> -	if (i == 1)
>>>> +	/* Free unused pages for contiguous allocation */
>>>> +	if (is_contiguous) {
>>> Well that looks really odd, why is trimming not part of
>>> drm_buddy_alloc_blocks() ?
>> we didn't place trim function part of drm_buddy_alloc_blocks since we
>> thought this function can be a generic one and it can be used by any
>> other application as well. For example, now we are using it for trimming
>> the last block in case of size non-alignment with min_page_size.
> 
> Good argument. Another thing I just realized is that we probably want to 
> double check if we only allocated one block before the trim.
ok
> 
> Thanks,
> Christian.
> 
