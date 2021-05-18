Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 660C4387F4D
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 20:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAA06EC62;
	Tue, 18 May 2021 18:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2065.outbound.protection.outlook.com [40.107.212.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFB86EC62
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 18:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8QDGXNe0xrl7SCzUo0lUc6KKJlwpYQO7GokKpSH5y7Z/2rVL8zg6DHjPIsX364aWJU93Z7Rxn0IN0/kXvYpGKjCO6qgaBIq7XMkzd2Mkezo0S5Ups0OJI2X68G0Bw8XV0uT1hVhqRVSmUafHoRrzh4elnm3uvzseYShZHcYTqx6YUOcg9pnc4dgH60OoAaMN1RodntH8D3qt1r6wBmQ5CR3GgeujZ3T9/6POoZhb6cxcRSc0Yykyw3ysWiGbpjWVJb08LtTnhv/j+4kCsh/y7Mg0FyjNo4tb8eOhdz8C/XhFRLa743swjhIOpeOmNChxQq0myKBIhD8Q3RDlfe7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVuWqPV0tKTXH+dIfYsah6t/t9vzQ+C7kT6zl8m7+vk=;
 b=L4jPKIx/eIk37KQv//zIKGkTBRaeystg0jU/jDoHMX+B2b9vNvR6sH/OiAfwDI0lAzYciw1SWjwRw+baJnrz/AFaQvI8VErNG5ZKCwvPwPWWb+fRRN612Fq33k1xyVRlyIVvMPjwwqTFxh+66MWH1ti5FBmDsJccZvKf1EvOsNMuQDhEa9csdGQ6bzubdBPA0QGF1u8WdKcC1x1CVyPQ0XnXIQPwu6CZbhYhvbndDTURtpf1rVHAkYJetGLbEBGjn07kty/xi9tJrk+qrVPt9LAxFzOwrQbKmGjtNtAvd+H1Xp7Gtp0zM+ao9r5wQMzQNQVgQFvnmTwrU1KFxYa0WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVuWqPV0tKTXH+dIfYsah6t/t9vzQ+C7kT6zl8m7+vk=;
 b=RUiDkegX+7pwhRB8KqQDX1w5XFqziRcUbsnEnLzkRs6uOx4IY9cOolYSiQQ/lYuoM3LbLFW+lYuWbmZQajrzLbB9BRKF1DVcdZyFhdFb6ccfK/VBFtJNUQWIRJUQHXvqA4Vw7F66SLu30T+BCqM40MKIxa/skIFy7u0pObjsZB4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4095.namprd12.prod.outlook.com (2603:10b6:208:1d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 18:11:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 18:11:43 +0000
Subject: Re: [PATCH v2 13/15] drm/ttm: Add BO and offset arguments for
 vm_access and vm_fault ttm handlers.
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210518145543.1042429-1-thomas.hellstrom@linux.intel.com>
 <9e465ab2-4272-4a41-2ebf-4b34d4724f77@amd.com>
 <0beb46d3-96c8-dcfd-6540-e23ff7207888@linux.intel.com>
 <151faa7d-c4c0-4f8b-f127-9e82a5432774@amd.com>
 <07c9239c-1d72-26d8-4fe3-378bf826bae2@linux.intel.com>
 <01128dfc-fb5f-6247-9feb-9cd05586d790@amd.com>
 <a924457e-321e-9f16-82c8-2462c2ae7043@linux.intel.com>
 <51be0ce4-9698-2a1b-fcd7-0a42e4acc83a@amd.com>
 <c0e9957b-1da7-e195-e65c-ee4ad22ca10a@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bfa959dc-7a75-ff96-98f6-d6d27dfed846@amd.com>
Date: Tue, 18 May 2021 20:11:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <c0e9957b-1da7-e195-e65c-ee4ad22ca10a@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:88c7:d7d9:22ef:f850]
X-ClientProxiedBy: PR2PR09CA0013.eurprd09.prod.outlook.com
 (2603:10a6:101:16::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:88c7:d7d9:22ef:f850]
 (2a02:908:1252:fb60:88c7:d7d9:22ef:f850) by
 PR2PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:101:16::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 18:11:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9869ece3-f9f5-443b-e3b4-08d91a286400
X-MS-TrafficTypeDiagnostic: MN2PR12MB4095:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4095273022606BC12C1FAC94832C9@MN2PR12MB4095.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wl7kQwFH+wLX70zomAT3MWWC3qGt8yvR5EKJG4SDmbCl4qLhtPZdghiVBC4T4KUIvI+UwGJNbB9nXBc99woJF8RaTyoyiXkZdQUe1dLmhxW0QefX9ca2WWNpiy/QYHBe2QaV/NR15WqDJfBWxQyRZnQ8KWHRstG7SmUc+hVZt/b4OzVOgw+F/wJE+tP4ouAVg8JJiOPFbkZrlAucCsmlYWy1GTyBQMqCulp78IIgHZHixScpDfLzjUxu+XcBmOFjAU/KmfN8D/9w+I74ICQLvjUd/x08I6FlvuJN+B6lCnjwIY1ByqJL62PkvbT27nPWYVrXGGeLh7LNzhc1OiAKKGIKwolvIJO4ekNC0EWwTQgp7VkLUHl0iZWLI7wJEOMN6X/aGVFfnopo7gp3gxV8xqtd+DIdJ9HuSvCpN1xnDmd668ahOm+JuSVbN5o5tdyf5g97OR9oHRgvq2mM4AKCxJTmNPD6kjOHlNZnhjImDlJq421RNF7SZXMXWKQvRfe4somJXRF32IR22M7wz+pYwk7dpD5iPsgcTR8AS6KjYIbxoPB74VH+xOX5y0tmcpNiRNomTJGp+b9b99M6W7877LXVWCdQ38Jk2zv6tW7CX9BdKM04lUnBuGC3q4610ztgXMJi8R+2ZxzeB0gubmJ/cBJDQ97q3TxmSv8C9ohCIUO++2TzJC3+oCSsrWbLkNgn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(4326008)(54906003)(52116002)(38100700002)(31696002)(31686004)(86362001)(66556008)(36756003)(83380400001)(8936002)(8676002)(478600001)(6486002)(5660300002)(16526019)(66574015)(186003)(6666004)(6916009)(66476007)(66946007)(2616005)(316002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VUxtVjk2V0FIZ3lxT2NXRVhpUnBvVkx1UkpveVpscGFoUzhwb2RETTZ2RHln?=
 =?utf-8?B?NGM4aXQ0MzhqaEUySzBEM3NMalp4NGhvbnpJSUxYRjZKREZwcUZvTDRLZFZL?=
 =?utf-8?B?WDFXa0s4a203bjZrRnU5VitEVGduNHZSaHMzbEl6cE5OWGNRZmM3NUhMcG1p?=
 =?utf-8?B?ZDJOeXhwQTJ0S3lndVJKVzlwc0J3dm5ZazQxNkIwd0RxMXFEQk5RM2d0ZUVE?=
 =?utf-8?B?Z0lTY2JYclp0QWd3NmFPOHpWNHB1Y1BobjdUWi8yMHh2NHplWFNFeVB6eW1p?=
 =?utf-8?B?Q2Y0Mng3ZDdzZ1FZa0NVK29BVitOUmlJMlJhSlN3cFdZWFI3azUyVlpNMEdx?=
 =?utf-8?B?b0NyNTJiT2UwQ2RJKzhNc1JIam0xdDBmUGRGM3RkSjNmbUgwQ0xBcWdpSytE?=
 =?utf-8?B?N0hXWTVWYjdXcjF2aHJ3cXB6eWFqYUFwaW9tWW1jK0xGWnhKdHJQdHI0cEJi?=
 =?utf-8?B?RUlZTXB6ZlhaVGpqMVJIQzVaQ3RWRk9QUDcvOE1tdno1T2tiU0Nsc2lvZ2FG?=
 =?utf-8?B?cllHbmkvcUVlbDZpM3c4T0w2MWdiN211QzNZY0FKSWJIMjFYUGZ4djB1b3Rn?=
 =?utf-8?B?dW9zN3MreVYxaXo0dHAySEpjN3dBcDJBZkRYbitRUTc2b2dsMkR3S0ZDbUJh?=
 =?utf-8?B?c2F2TXpiT3plTkRIQmpVcmliamhJN2V0NnY5WHM0a0taRk9ER2FqUzFXK1lX?=
 =?utf-8?B?MmJkdGJwM1d3OXErRlJ6UWcxK3puMTRYUXhtNlZNOW1JUTFjYlZraC93dHpa?=
 =?utf-8?B?NDF6SkhKeDJ4MUY4eWQ0ZmRxTVdnODIyYmRUQmNuSFY1VG55clprb2IwRWtJ?=
 =?utf-8?B?OU4reERoVDdIU0xrczlha3VZTEIyRVA2VnRDSmNkaURHanIxaHZXY2t4Y21t?=
 =?utf-8?B?MWVjeXQwQmo1K3lqeElzS2tyNmRXSVJmdnVGbGlBSjZ2NjlqQllmSGJlT2tz?=
 =?utf-8?B?Umx5ejVINUd2b1hnS245YU8ya3NyeDR3OGczRGhSSWRYNmN5YzdNa3M2TDdP?=
 =?utf-8?B?L1NyNG41NnBNbWhkSVBhLzk3YURIUEhWYkFQTXBYWDhoTDY5TzJMbEgvMWtT?=
 =?utf-8?B?YWc0L3lDVU5TR0dkeGxISUhTU3NyVG9GMDBhRGV3ZWt1eUM0M2JmenJxQzgx?=
 =?utf-8?B?dGJXcnVrd2FZSGdIc3BJMWtCRHh5WGs1WVlRTWJjTFhwQitGYXJxUmZhTEZx?=
 =?utf-8?B?dWluVUE0UFdFcXA4MUw3RUN6Y0ZteC9zTHpNWElXemp6VkVKME4rZTZmcXFM?=
 =?utf-8?B?bE5UNmFlNDY0cW9ScmFZc3NVT005N0hZQ21sSWJLajRWS2FuUzVMYS80Z1N3?=
 =?utf-8?B?NEVmOUIyRyt4aG9mN2w5dHpMMk9BTzVEZmdCeXgzenlvc3JnZEhOb21rbXhL?=
 =?utf-8?B?SlRja1pCYXA3RStmenBKMmdxTjg2bGtoRTI1RXcwOUd2RXhGZjIxdFQzZkdC?=
 =?utf-8?B?NlozZTAzdVVaSUdhcFM1VjcrTW1Jb0dyV3lyNkh6WXkveWZManpjcEUzWWN5?=
 =?utf-8?B?S0JKdjNNY0JyNnR5dm56MWJOZjRKYUkzdXJoTDE4Ry9rZ0o0NGR5TENtUEY3?=
 =?utf-8?B?RU96RjllZTNaYWIyWVpMcDVkTFdLbE43WU5IZFJqZ1ZjS0trcjhEZ3RiUGs0?=
 =?utf-8?B?c28rcy94UlpqNjFEZGdnamFLSFEzRHJVclR1SlY3UnJIWDFCOVQrSm1ySmZi?=
 =?utf-8?B?WEF2UXBOTk1jY01JTTcrWExQRzlzZGQyUTZDUFdwZ0Z1V0hGRGtTRzdoTXhi?=
 =?utf-8?B?bnl2Y2pjdWQrNXozY1I0NktnbnJQWlBVQVhKT1VDQlpocm0vWHRnTEZRUFpo?=
 =?utf-8?B?QlBrQmt2RFFKRklRQTA1RFVJdHZCekY3VXNGN3JGQ3JScktlbmZaS3Z0THJW?=
 =?utf-8?Q?r/Ustj8CtWY0q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9869ece3-f9f5-443b-e3b4-08d91a286400
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 18:11:43.1208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6unDNN7wy5qzFQIHTEqb5Qs2mg8FIHQ5M0GeTN0UboFDmQiHL/Zhg9xShihQTqRl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4095
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.05.21 um 19:32 schrieb Thomas Hellström:
> [SNIP]
>>>> PTE handling is the domain of TTM, drivers should never mess with 
>>>> that directly.
>>>
>>> Hmm. May I humbly suggest a different view on this:
>>>
>>> I agree fully for ttm_bo_type_device bos but for ttm_bo_type_kernel, 
>>> TTM has no business whatsoever with user-space PTEs. That's really 
>>> why that bo type exists in the first place. But otoh one can of 
>>> course argue that then i915 has no business calling the TTM fault 
>>> helper for these bos.
>>
>> Well the real question is why does i915 wants to expose kernel BOs to 
>> userspace? As the name says only the kernel should be able to access 
>> them.
>
> I'd say "kernel" of course refers to how TTM handles them.

Fair enough.

>>
>>>
>>> So for discrete we can probably do the right thing with 
>>> ttm_bo_type_device. What worries me a bit is when we get to older 
>>> hardware support because whatever we do is by definition going to be 
>>> ugly. At best we might be able to split the address space between 
>>> i915's mmos, and hand the rest to TTM, modifying offsets as you 
>>> suggest. That way a TTM call to unmap_mapping_range() would do the 
>>> right thing, I think.
>>
>> Well we do all kind of nasty stuff with the offset in DMA-buf, KFD, 
>> overlayfs etc. So adjusting the offset inside the kernel is already 
>> well supported and used.
>>
>> What I don't fully understand is your use case here? Can you briefly 
>> describe that?
>>
>> Do you use different bits of the offset to signal what caching 
>> behavior you have? And then based on this adjust the pgprot_t in the 
>> vma?
>>
>> Thanks,
>> Christian.
>
> TBH I'm not completely sure about the history of this. I think the 
> basic idea is that you want to support different vmas with different 
> caching modes, so you never change the vma pgprot after mmap time, 
> like TTM does. Needless to say this only works with Intel processors 
> on integrated and the more I write about this the more I'm convinced 
> that we should perhaps not concern TTM with that at all.

Yeah, that might be a possibility.

But KFD does something very similar IIRC. They stuff the routing 
information into the upper bits of the offset and adjust it then to 
match what TTM wants in the mmap() callback.

Adjusting the caching behavior on the fly is really tricky and I'm 
pretty sure you should not do that outside of the integrated Intel 
processor anyway :)

Cheers,
Christian.

>
> /Thomas
>
>
>>
>>>
>>> /Thomas
>>>
>>>>
>>>> Christian.
>>>>
>>>>>
>>>>> While we're in the process of killing that offset flexibility for 
>>>>> discrete, we can't do so for older hardware unfortunately.
>>>>>
>>>>> /Thomas
>>>>>
>>>>>
>>>>>>
>>>>>> Christian.
>>>>>
>>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>> /Thomas
>>>>>>>
>>>>>>
>>>>
>>

