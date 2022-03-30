Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7814EBD5C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE17110F85C;
	Wed, 30 Mar 2022 09:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2086.outbound.protection.outlook.com [40.107.101.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE5610F85C;
 Wed, 30 Mar 2022 09:12:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQb05xIeAEJaPsDGlKYFDQRQs5ihudCq1RifsplbnsB0r8elwN7g55YKXkksutOrUiTM17oaXn7CpSVF5NoelC7tBNgkEBV/+Ito/s2i8dcGzJ6Q5eixcL4mw3fDKNGKFia91NBz3DSKBGLnSIhJEMPTvaIzTN+hEZ7KeUH7LuluuHTpRZRgb1RsxwmrBNkpgfUiaAddxIo+pVE9JRqiyv6N54WIMvp37nRmBdvBNnjxvbU2A5Vvof/TQqRvaZl0bKEnV7sUcKGF2wvfNNecdFJ5I6rgugmWlcebfnNtA5kKbbCjXCjzKpbJajyL6Fz1BSt6f0i+9ZdhmoLJA9ePsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACuQXcyJ2nm1QW+uDYVus/MXADUiPwWTfdZx4uEO4qE=;
 b=gER4Dhx7Wc+n0Ef/YIuczk0rnWldfrrpOvp0c2TlbPCmIsuxWMdCVaGXKCDPX1bfZZnfJD3TRqpF3wPNmXPURrNN1ELBeZSuSU2hXoqbS686N0y4xuSAZATPPTIpXXF2mNk0PoMZ/MLL2kBEc/y6qKIONi6tQFragxxD10y4cxz/XqsZ0ZbvpC4j2p4o67o3+R6KLzjV8fPRSjeBvcFQSKAstQ/b+7wJ3YjxkdhmyfwYm4HQCH7uaEi4gTyPZGcuUMkmM6rm85wM6v84PZOSIUDfSgF+EKl/ugrrhovfT7w8imb1vd21b3xCY4pdH7TUOKgyuMNBU3srhtnViIv6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACuQXcyJ2nm1QW+uDYVus/MXADUiPwWTfdZx4uEO4qE=;
 b=Keea1c99e0qimi2vMU5VRdD6CFs5XTVM/m9yn1dvVLEol7TSL80lt6hVWKeuSj4zs/yndT2Ect3I2HhjijQEDq8PskhuqFVm8KCXL/GpS3kzTof6DCWNPg2mCTMdJ26tdIsmY2L2+Eb+f8veOjsC00zlXVbLgXGMzKams5sZax0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR1201MB0196.namprd12.prod.outlook.com (2603:10b6:405:4d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 09:12:32 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 09:12:32 +0000
Message-ID: <c943b565-9011-a285-8caa-5cdb37571688@amd.com>
Date: Wed, 30 Mar 2022 11:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm: round_up the size to the alignment value
Content-Language: en-US
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220330090410.135332-1-Arunpravin.PaneerSelvam@amd.com>
 <c0b22bc3-8bad-fd19-6d1d-164bfee851c4@amd.com>
 <65d77a10-897a-fce6-28c9-321f3c723129@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <65d77a10-897a-fce6-28c9-321f3c723129@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0014.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b31804bb-14d3-406e-d74d-08da122d6c03
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0196:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0196C86B86A9A5F96203955B831F9@BN6PR1201MB0196.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMwMTx5wBVIxhaWWn9y4BhUS1YrtcMaXC0reB86NigwLHP46URB/0F4djCMB23AJThG4lraB+nIeMiXVsjstsvOWHcmFdL5XvdFpE8IBbGm8mc0KldzaHKfC/k30Vt2bPqgLvJmZ/FJBSw5uvBTPAAnYU6zEQ0mtvFkiKhfxVeF9tbmccVGdntQ+azuhl7snD7T/+dkItEpI71KIyCfu0DrOSjhJElm0xt/YDQYgIJUI8eAWm6/17J/HVJSQjZEfO7FKey/MrONK8e3xGmHMBXlxjdQ072mNpr+6j+/kTJDQNoAH90XhDqlGEyguLCR34bLeLMfkh4CRwkl0i7KFlKlJ1eKnsSOmXtT9Mg1NSxdcFbnd0pe656SE24Xdgj/QyuTcfrUskgMCYPsn53F7JDlp/RiQ3a2Zlar+rPXjPLkKJ95wl361YCfvM6Bgz33Ei5y5vDLYqX4Ta/H6XD76wsWMNLvpl1AVBVIHUlDlz6+svdka+Dmz+LgHKRnHB1Y8MEq+IdQxZakb1/+QSm9Hn+xVXin+PtzrTce11fCrBpWQXVH0ysFSqdtaht0X6fUC5AIyK7vFZ+aHVGnYsBtAk+30dWBO2yKO/IW2Q/HBP3Dp0cGa6tBcPsMj6nJTVTRD8Fjp6xpNRuvxACqq5YhUeoWHfqLF++gteRF1BkVFPJwIbg7WSE3w/ECPcUBV9shEvFk0tfOL+kUGFN1AvAjf//gaUIZ8LmoGlI99/jksQjfleOFLgIn7b2C+UoCSyyz0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(86362001)(31696002)(4326008)(316002)(186003)(66946007)(8676002)(66556008)(5660300002)(6512007)(66476007)(508600001)(2616005)(26005)(31686004)(2906002)(6506007)(6666004)(8936002)(53546011)(83380400001)(66574015)(6486002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU91cklDSjVRd1lTSWttckJQOS80VnBKekMydmJ5bDdhOVBZT2VheExrcy9T?=
 =?utf-8?B?d1dmODlMdzFYN3hMQnJGbGVmTzJPNTFXd3NxcGpkdzlVT1g2cHhmY3E3anNy?=
 =?utf-8?B?QUhvcUVGa29yU0hwYmRtbEt4dXZoU3psd2Nrb0hsTThpUTZRNUc5T2VHd0Jx?=
 =?utf-8?B?ZEtGTVJYbGpEdDd0bDdtNm1wQUlOK1NvaHIrZTI0MnB4MXFLelVDbStHSjJU?=
 =?utf-8?B?MnErcmVMcnNmeVBpZndwVkh4SUgwQVh4eTdHbkpEOXJXaDZXMXl3L3I0eUN4?=
 =?utf-8?B?VkhzY0JBcnl5ZmlYREdrS1RyTmZ3ZmdSTG5FY1R0NnRqZ0dLTUlhcmFwUGVG?=
 =?utf-8?B?YTN4OUNLQS9Gdm5uc2ljT29tc1lPOExvZVVMQWEzbmwycjNQL2E4cDR0a0J5?=
 =?utf-8?B?UXFySVd4Z294VHBFbzBqOXQySGp4aGJ0QU0vQ00xTnVSWmpWLzdhTkxneFNU?=
 =?utf-8?B?emxUWXh0KzVFOVJ5ZTF5d21mVzdVUVRFOVN5Q1I1c1E2Kzg0SHEwdjNwSUxs?=
 =?utf-8?B?WmtYSGxTYmNGcHAvSzBybWxGQXZ0NUpWNyttOFdOWHc1Y1dHRDkrVHhkMGVq?=
 =?utf-8?B?SmdvSFBUT2huRXNZeTZ2Y2xmU1A1UTZSS0dIa25oMStya3V1T0hncExRK21o?=
 =?utf-8?B?UU90a0p1c2ZBRm5QeUppMDZEajhldzVpYUV3K09ZcERWOG0yYVE5MSt1WGFm?=
 =?utf-8?B?U1VJSEZZb0xaMURORDdTb3JWcGtsQUtkaE85OFRpNThieUI3R1Qxdlc1dkJF?=
 =?utf-8?B?Mk9XNlZKd002elBPSlkrYnc4SGovd0hEeEZGOStkcGFkNmJiRDZwMkFMSnNo?=
 =?utf-8?B?TkJyN0ZCcEE0YWE4S1YzNFlIVitTazdwOHVMZ3g4S2FEMVJkNENUVVJXdE5n?=
 =?utf-8?B?QnQ0MzUycXV6OEZTc1hCSlQvaFM3QnBhODhLL0lGZ1dyMk5mVlpXTVhSZVRE?=
 =?utf-8?B?bVBLeUJSTEVFNGVMalE5MWk2aWhzN2xqdzFudVp5amxUcVBJSGNuU2FscFNx?=
 =?utf-8?B?UXJYZFlNQ1FlQjgwODJXWFIvRWpsdDV6dmU5b0cybnc1Q1VGaFhGa2pFZzJP?=
 =?utf-8?B?Y2JNSzc3SGZKb0VZcnFpZ1FVSU1ZbHI1aEY1Uy9MUFFlVDJQTFBrNi9hME9l?=
 =?utf-8?B?VDFHODNRNnd5WndJZ0g2U2RKRTZLOEpzdnlKU3BITzE0clVhQ1UrNS8vNmNn?=
 =?utf-8?B?ZlVWVllPcXFrR05pSzFUTnBaVGI1QlJjT2d3QTNDdzBSK2NpUFNCVzM3S0Q0?=
 =?utf-8?B?SW9LaXd5ZFQ2WHl3dHRIbGwyV1JUTFVWYzNjOU9DOTdUbHlHS1VEV2Vja1lL?=
 =?utf-8?B?aUdvYXFlcjNqZmRmWEdBUHFQZFhvWW5TZmlhV1FkYm1pem1DbGNpeFRCd2JU?=
 =?utf-8?B?Z3ZuWERFV3U5WEpDdHYrUUpHKzJ1YVZwTklsaTNJcTlBUzQzMFMxZVdjcnZw?=
 =?utf-8?B?TXRiWjN4eGFjT2RMWHZMOXMrN3Zoa1FaZE5meWlwU1d1RngrZWFNYVdXdTFC?=
 =?utf-8?B?NVhXbVE3ZjlGcThIUGFXaUY2Y05pRHdpbjVVL0hEc1lTbExnUDRNb0hiT2pY?=
 =?utf-8?B?Q21aOUozTG9yT2ppbjQvaXovRkNDaGZUb2ZiZk9uaFlaRHI4dCtNQ1pnTE82?=
 =?utf-8?B?RloxTVR5Ni9ya01LclhWK0NVSWY5bm1wTitiUkJLMVdaZUxuUlNQeDU0WWhw?=
 =?utf-8?B?Z054d3lQNmV2a2IyTnpKMkZVOUNpdTI3blVLWElZUTFYdXU4UFpOZFZ0YzBE?=
 =?utf-8?B?SFNsTlVwRGRJQVMvaDQ5Ky9KaWxaL254RlIvL290YmpQazMwU3RHdkR0STBG?=
 =?utf-8?B?SkdJTHZIWlF5YlNwTGlRaC85a3pNQzJleHNBclh4NWYrbGtEUnAzRnpCMWRw?=
 =?utf-8?B?ZHFwclhNWSsxdDJGMk5RRXFqR21VZDN6aFB0VTJmcWNIdTlPamlXcnRuTlhs?=
 =?utf-8?B?VzRwNG9taC9PQVpHTWI5VENWa25XWnpZVStMSnpwZkxJM3JXbUlxMU1iNEtx?=
 =?utf-8?B?R0xVaE9GNmdIZHZhMDdXdGpjdHRVWG1nNm5TNkx5aEQxVzVYRkhaUEJubHJO?=
 =?utf-8?B?N0hmWERUelhXQXhFcWlxdU4yTXR1TTZXZEpkbW1qODlpc293dTVaSk43L2Z1?=
 =?utf-8?B?NktoeDRpZllqN3FqMGtZK1ZhZ0JYakZqSm5zYjBReHFidExQMHdqVVo5VVN5?=
 =?utf-8?B?NHMrSW82MkhlUXUzRjN4UkpSWFRpZXFrSVVpdW90RVN1UjNjV1Q0N3YwcWlD?=
 =?utf-8?B?ZXhlOXdNbGhzcTBuV0tlN1Qrak1Ca0xxSm1BQTFjc3NGZjBTUDN0L0VYRkNI?=
 =?utf-8?B?cGZmUEVSdjBDZ2RwQjdHQlF6M01PSWZhRkZmb2E5MGxpVk1SZUpQQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31804bb-14d3-406e-d74d-08da122d6c03
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:12:32.3084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PK7jmxDJ1pJF4UFzwdSGY3tBHRUip7OaoMe/SPi/BjfHH4Dzuuhvdk4w8Zsa/Giq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0196
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

Am 30.03.22 um 11:20 schrieb Arunpravin Paneer Selvam:
>
> On 30/03/22 2:37 pm, Christian König wrote:
>> Am 30.03.22 um 11:04 schrieb Arunpravin Paneer Selvam:
>>> Round up the size value to the min_page_size and trim the last block to
>>> the required size.
>>>
>>> This solves a bug detected when size is not aligned with the min_page_size.
>>> Unigine Heaven has allocation requests for example required pages are 257
>>> and alignment request is 256. To allocate the left over 1 page, continues
>>> the iteration to find the order value which is 0 and when it compares with
>>> min_order = 8, triggers the BUG_ON(order < min_order). To avoid this issue
>>> we round_up the size value to the min_page_size and trim the last block to
>>> the computed required size value.
>> Well, Matthew and you convinced me to *not* do it like this.
>>
>> Has that conclusion changed somehow?
>>
> Yes, now he is ok to handle rounding + trimming in drm buddy

Yeah, but I'm no longer :)

How do we then handle the detection of contiguous allocation?

As I said we can do that like:
1. alloc
2. check if we only have a single node
3. trim

But if we include the trim here we can't do it any more.

Only alternative would then be to inspect each node and see if it 
follows directly behind the predecessor.

Regards,
Christian.

>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>> ---
>>>    drivers/gpu/drm/drm_buddy.c | 31 +++++++++++++++++++++++++++++++
>>>    1 file changed, 31 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index 72f52f293249..98d7ec359b08 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -641,6 +641,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>    	unsigned int min_order, order;
>>>    	unsigned long pages;
>>>    	LIST_HEAD(allocated);
>>> +	u64 cur_size;
>>>    	int err;
>>>    
>>>    	if (size < mm->chunk_size)
>>> @@ -665,6 +666,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>    	if (start + size == end)
>>>    		return __drm_buddy_alloc_range(mm, start, size, blocks);
>>>    
>>> +	cur_size = size;
>>> +
>>> +	if (!IS_ALIGNED(size, min_page_size))
>>> +		size = round_up(size, min_page_size);
>>> +
>>>    	pages = size >> ilog2(mm->chunk_size);
>>>    	order = fls(pages) - 1;
>>>    	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>>> @@ -702,6 +708,31 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>    			break;
>>>    	} while (1);
>>>    
>>> +
>>> +	/*
>>> +	 * If size value rounded up to min_page_size, trim the last block
>>> +	 * to the required size
>>> +	 */
>>> +	if (cur_size != size) {
>>> +		struct drm_buddy_block *trim_block;
>>> +		LIST_HEAD(trim_list);
>>> +		u64 required_size;
>>> +
>>> +		trim_block = list_last_entry(&allocated, typeof(*trim_block), link);
>>> +		list_move_tail(&trim_block->link, &trim_list);
>>> +		/*
>>> +		 * Compute the required_size value by subtracting the last block size
>>> +		 * with (aligned size - original size)
>>> +		 */
>>> +		required_size = drm_buddy_block_size(mm, trim_block) - (size - cur_size);
>>> +
>>> +		drm_buddy_block_trim(mm,
>>> +				     required_size,
>>> +				     &trim_list);
>>> +
>>> +		list_splice_tail(&trim_list, &allocated);
>>> +	}
>>> +
>>>    	list_splice_tail(&allocated, blocks);
>>>    	return 0;
>>>    
>>>
>>> base-commit: ec57376fba5abc0e571617ff88e2ade7970c2e4b

