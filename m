Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038B53879E7
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 15:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA35D6EB7A;
	Tue, 18 May 2021 13:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2058.outbound.protection.outlook.com [40.107.101.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC696EB7A;
 Tue, 18 May 2021 13:26:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYgV/D/DwaWKRiNrBX6vLqGBKpmGVSyrE97H1Sgq5tTJH9X7aDylT0exyED0iUKzIsajC+CU5XbflXZN9qZPBjbKCzaH+kbA8xrW263WUiEUSV/SFX6aPwC/25tHc3rYifq8uAvXc6c4Zb9dV7oLLqQCIldO99TvHoZeaaXGpCpkA06u9z1Pn9lEopgWbHG43RsLBE7+R2dPiOJ5SU4sb+DUQNCrEC6AGZ2U3NqpdO5AR6lCaL32bjJduqfEE3iSoXpB1h1yXY32AHqnW1RpIevGXCSA35Sccw6JIuRVJa+kJbt/ukIdp7ht+lwVAWsMXDN4KRJDhGLVw0O8xdguzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nnlc4pMs9YoIFI+ahDtZ1ZiOKWZH1Wrqbna6SDAXvU=;
 b=klWkPn+A44GIu0W2PtHTr580PkaME5yJlmF0ahFhybxhz+LfXbPnXWKes9BR4UuhU83y265eV4PisdsWxxUNEa7AT1cahAHQ55XenrYKuwgM5RT8C1TouZxOWv24UgbUIjqI9K03KKQ556P1CTTMIq+k5ujw4GZly7z3QbJU+x2D6I/LNmSjfLFqVjbZK2agegb4tyyWw1vmadANVpJQit41Za0brAbXblk8eZT5DRHR1PPXb9H6bZMmcyExNXZ9VzGjr20WOpcKXuAdZQHByx0c2m6LKXWxeo/6OLwFDuOk+ptECh5stGnkPnArdwzutGExcmyZkKs1wAGHj3sFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nnlc4pMs9YoIFI+ahDtZ1ZiOKWZH1Wrqbna6SDAXvU=;
 b=VZD+FeeKqKg5WaLDtnvhuFdq6RKaknzFKb9nbN9jTsJDeMb4SSf5gyXsN0QUcgJAScrfD5JcXJLuX48jjcywzefaZkmyG3PfHXFoAs0P1ub/lkK9nnCIQFBsEuypFTqbSpOzFAJqAn6hx8IloVsZyb8NQOCu1mApl4hyWvpSyu4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4963.namprd12.prod.outlook.com (2603:10b6:208:17d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 13:26:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 13:26:55 +0000
Subject: Re: [PATCH v2 08/15] drm/i915/ttm Add a generic TTM memcpy move for
 page-based iomem
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-9-thomas.hellstrom@linux.intel.com>
 <6149ee00-fa4a-3757-117a-8d622eb42070@amd.com>
 <45054121-954d-f20c-52b5-f375db7096e0@linux.intel.com>
 <d547a037-2aa8-76a8-375c-5da580fab631@amd.com>
 <400de9b7-f385-0581-ebb5-e07247d4c996@linux.intel.com>
 <b8e062c5-6b63-09c5-e98a-be9bf4813c61@amd.com>
 <0eb87fe5-439d-5077-cf19-015966bc3f5f@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <93b3d7f4-3a82-e3e6-657e-877eac9aaddd@amd.com>
Date: Tue, 18 May 2021 15:26:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <0eb87fe5-439d-5077-cf19-015966bc3f5f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8470:36a5:2010:f0c4]
X-ClientProxiedBy: AM0PR07CA0016.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8470:36a5:2010:f0c4]
 (2a02:908:1252:fb60:8470:36a5:2010:f0c4) by
 AM0PR07CA0016.eurprd07.prod.outlook.com (2603:10a6:208:ac::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Tue, 18 May 2021 13:26:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07b8cae1-168a-4574-9f00-08d91a009abe
X-MS-TrafficTypeDiagnostic: BL0PR12MB4963:
X-Microsoft-Antispam-PRVS: <BL0PR12MB49635179F22737181A319706832C9@BL0PR12MB4963.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XeOAGUZf/NRes5M14Is9NIGuZbIDvSQQihxx0MkSpzTtpIXRyojFWmrtMS1rL4TwmWP4sCgP7T40fgdlO+7imZvTV0eujpwYBvOJGVeP3JPUD2s5XlnxnIaHzjj05GHPQGorfTjZPD42Tjes91Q/synwYjtYlPVkioLmOnM6js2aiyR4B3jhQAFj/Z7cK+PFVlZtKTlehY+h43frc7iscTCLmMWRU8KjUxhQuvjLy3Jgoh8cSt7Iz2lf2qUARBBTLndZr9m2RhJE9TxWQ2YaDZ4evXdsNbzksHNOYVQBihg3FC04iBeO+OHfvsq2HFy9EwG09BWwp5m1kVhy6KmkwJBpEGI8OrXPJTjku6n/VKESXmRI+/Ampzu2JZST9cmvmb2duUvM64Lc0Mna2USBHje4lbej8tQ496m+KdVCoglPEghtPCZSCx6sFvPst6HzWf7ovUr5LEuOVUp0dcM5rZvG3wPY7H3Fh8p0PbjlwTQklc1u+Mylf/bJlBka+pllRfRt97JJUg2hI4q7igQF6oU5NJPn5nGdJIVtmuzKMnoZeif/eOCKGlMGZR4dYilvRZbJBb2nj+tUBkwi1+MVlnQlQg8N/yJu+DfMUzppT/vRfuhlkNGKamLbHMtj0+iPLSevhVIkIiXYJ3QyaJ4H897pI0yZiDT3cWj/5JknkNxqp1EY/QhY6tMCzH5ACd3QB+YsHic/l40hAOt2qG6zSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39850400004)(6486002)(5660300002)(8676002)(83380400001)(31686004)(38100700002)(36756003)(66946007)(8936002)(478600001)(66574015)(16526019)(86362001)(53546011)(186003)(66476007)(66556008)(2616005)(52116002)(31696002)(6666004)(2906002)(316002)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NllwOE5yNW1qTzd1d0RmTDF6U0JHTHpFQjNiZktvWHhyM21lQWY3eXIxd09S?=
 =?utf-8?B?SjNhZHQ3a2tnUEc3RW90eFpiZFVrazVVcHVEeWRRYTZwVmprdjVNUllXd09W?=
 =?utf-8?B?OWxoRkxVUlhRS2VvaWVYWHl0eHh4RXhxMWdMSmtGbjNpdTFMaXV1dTdnUTJ4?=
 =?utf-8?B?N3ZyRDlhekxSd0Q5SGFTZGl2em4zS0lVZkVUM2p3d0gwdGMwSEk3Z09Ja0dr?=
 =?utf-8?B?alBrQlcweTNhUWVIL2VzMjNNdzZ4ZE1SSnAxY2h0VmJMTE9FMnE4aDA5eG95?=
 =?utf-8?B?L211eGI3UG5jSjNXVlFBMTlta00rdXpFWXFOMnB5TXVrbkFNUG1LeTZWT0dx?=
 =?utf-8?B?RlVNQlA0Wm5wL1l3bGJPM0tJMk8xYjVPdWJySzdNelBuckwxVnhOa21sUWly?=
 =?utf-8?B?ODEzYkJxbmwrb3c1eTJJdFJFMUFBVXU5Z1NsOHcrbVlLcC81bEEyNU9WYk5i?=
 =?utf-8?B?ZmEzTkxpRUhmSjlsS0JNUitneEpkUmhySFl5N1o5S3BkaU43a2VJWG9seU80?=
 =?utf-8?B?aTVPS0Vva2FnT3FRU0I5RmhSdWw0eEF5OGtXejE4NVFhRTNYWHdVRUtjUHdl?=
 =?utf-8?B?aWNCdDZzWkdFNXgrekxzRmV0TWJIRkFlYkJoajBFNGlMcmMxMjRwbkdvTUhl?=
 =?utf-8?B?ZXc3bC9tQm9HbmlHNzgzSlJmY3Q1Vi9Da1BKb2dJSlBaNCtFTGNKZ2pFZGJ6?=
 =?utf-8?B?OVQrTXBBZFFmNndKc2dmMzFIeDYzTVIrZGVTbVQ3d0pDZFNmZW0wUGJzaGFE?=
 =?utf-8?B?Z1BWakVRM0Fja1kyRXVhWWUvbFJ6SXFxMGNIRTdkem42cWYzQkxXK3JRc2h5?=
 =?utf-8?B?UmRHTFlCVFBMWXdtWVZFeXhFT0NvbGFUVHhMVSsxVlQzVWtYZWFHNTUwS0RI?=
 =?utf-8?B?M1lFZ1hmVVlXUFBtSC9FYWdhdUp0MS9ZSnQvbkdKaWdLLzQ4b0sycTRqMTFV?=
 =?utf-8?B?N3V6SW1IU0dxTlhFOE5MTGNuNzQycExPVFVLckhSckpHUGJyT293alU1Q3hm?=
 =?utf-8?B?cmdNdnBncDU4WVpuV0Zid1ZFZHg3YmlFdkVKKzREcXduSzJDWEM1bzhYVEpP?=
 =?utf-8?B?QnpLUkNsOFFvQ05nVTJnWHBTd0FKWE96VHl4VTlsMVl1TGVsa2xyL1l0eW44?=
 =?utf-8?B?OVVXbHdzbHhTRFpRUy9ITmd2KzBiVEQ1dUh5OWwvbUphQmd3d09pSUZEM2Ft?=
 =?utf-8?B?S3BrTDZxVUFjeHk2UWxURXpVUUVyOXpBRE5kS1JyQXM1Z3RSQnA0RUcyK25Z?=
 =?utf-8?B?RjVlNlIyMGJkVkR5blo2aVQ1OTM5Ykk0WEtzSTJxYno2c2ozeGMxdWFsQUxz?=
 =?utf-8?B?QnpLKy91eUFFckhGRnZiYmV3UUk1RnZzb3c3VWlXbXBFeHlldEJJVENOL01t?=
 =?utf-8?B?YUhpOEczbEZmb0puUCt1YXFRV21OcEllSFlRSWhBN011TEFHY2FUL2tlSDZI?=
 =?utf-8?B?Sm5ZU2ZNblV1Nmw5RXZ1STUxVE0rLzRXemVsejJxY1FWejcxVnFSV0x5clZN?=
 =?utf-8?B?NUwyMmRXS3BJaURBUklYYXNGM2J2VmM5c2wvTEs4MGFpOXkwWDRWbjBPUHZN?=
 =?utf-8?B?RVVFYzFpeDJ4Z2o0cm92VitCNmoxUFZvV2FKdVpGM1FnYlJoSWtEL1B4U0Ew?=
 =?utf-8?B?RnRNWElTQnl0ZWtpYXl0bnhzWnU4RkJWSnM3SjcwUHNWYW5ycis4bGdwaEpz?=
 =?utf-8?B?ZjI4eCtpdmpqc01qOTdLTVdnL01WaTg5MlEwOWJPN0tiQ2RnOVQ4UmU2ckZE?=
 =?utf-8?B?ZENrUE5meXBMM2JFK09UWGxidFFlRGZPMlFYM1JqZUdCMmRwOVJCRVdQUjlS?=
 =?utf-8?B?ZUx3REpIc3NGTFRncGZjYlQ3bWpLTE1VdWdSdktvd0s2dmUvbmhGckppSVRr?=
 =?utf-8?Q?ARb0THw0w8Gf/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b8cae1-168a-4574-9f00-08d91a009abe
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 13:26:54.9431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VPA4pFa+/bBK9ujhj1iLylRwHOC7ib+xQ7rlANFscA5pO290iIUFLu6Rl+vzfXK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4963
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

Am 18.05.21 um 15:24 schrieb Thomas Hellström:
>
> On 5/18/21 3:08 PM, Christian König wrote:
>> Am 18.05.21 um 14:52 schrieb Thomas Hellström:
>>>
>>> On 5/18/21 2:09 PM, Christian König wrote:
>>>> Am 18.05.21 um 14:04 schrieb Thomas Hellström:
>>>>>
>>>>> On 5/18/21 1:55 PM, Christian König wrote:
>>>>>>
>>>>>>
>>>>>> Am 18.05.21 um 10:26 schrieb Thomas Hellström:
>>>>>>> The internal ttm_bo_util memcpy uses vmap functionality, and 
>>>>>>> while it
>>>>>>> probably might be possible to use it for copying in- and out of
>>>>>>> sglist represented io memory, using io_mem_reserve() / 
>>>>>>> io_mem_free()
>>>>>>> callbacks, that would cause problems with fault().
>>>>>>> Instead, implement a method mapping page-by-page using kmap_local()
>>>>>>> semantics. As an additional benefit we then avoid the occasional 
>>>>>>> global
>>>>>>> TLB flushes of vmap() and consuming vmap space, elimination of a 
>>>>>>> critical
>>>>>>> point of failure and with a slight change of semantics we could 
>>>>>>> also push
>>>>>>> the memcpy out async for testing and async driver develpment 
>>>>>>> purposes.
>>>>>>> Pushing out async can be done since there is no memory 
>>>>>>> allocation going on
>>>>>>> that could violate the dma_fence lockdep rules.
>>>>>>>
>>>>>>> For copies from iomem, use the WC prefetching memcpy variant for
>>>>>>> additional speed.
>>>>>>>
>>>>>>> Note that drivers that don't want to use struct io_mapping but 
>>>>>>> relies on
>>>>>>> memremap functionality, and that don't want to use scatterlists for
>>>>>>> VRAM may well define specialized (hopefully reusable) iterators 
>>>>>>> for their
>>>>>>> particular environment.
>>>>>>
>>>>>> In general yes please since I have that as TODO for TTM for a 
>>>>>> very long time.
>>>>>>
>>>>>> But I would prefer to fix the implementation in TTM instead and 
>>>>>> give it proper cursor handling.
>>>>>>
>>>>>> Amdgpu is also using page based iomem and we are having similar 
>>>>>> workarounds in place there as well.
>>>>>>
>>>>>> I think it makes sense to unify this inside TTM and remove the 
>>>>>> old memcpy util function when done.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>
>>>>> Christian,
>>>>>
>>>>> I was thinking when we replace the bo.mem with a pointer (and 
>>>>> perhaps have a driver callback to allocate the bo->mem,
>>>>> we could perhaps embed a struct ttm_kmap_iter and use it for all 
>>>>> mapping in one way or another). That would mean perhaps land this 
>>>>> is i915 now and sort out the unification once the struct 
>>>>> ttm_resource, struct ttm_buffer_object separation has landed?
>>>>
>>>> That stuff is ready, reviewed and I'm just waiting for some amdgpu 
>>>> changes to land in drm-misc-next to push it.
>>>>
>>>> But yes in general an iterator for the resource object sounds like 
>>>> the right plan to me as well.
>>>>
>>>> Christian.
>>>
>>> OK, so then are you OK with landing this in i915 for now? That would 
>>> also ofc mean the export you NAK'd but strictly for this memcpy use 
>>> until we merge it with TTM?
>>
>> Well you can of course prototype that in i915, but I really don't 
>> want to export the TT functions upstream.
>
> I understand, I once had the same thoughts trying to avoid that as far 
> as possible, so this function was actually then added to the ttm_bo 
> interface, (hence the awkward naming) as a helper for drivers 
> implementing move(), essentially a very special case of 
> ttm_bo_move_accel_cleanup(), but anyway, see below:
>
>>
>> Can we cleanly move that functionality into TTM instead?
>
> I'll take a look at that, but I think we'd initially be having 
> iterators mimicing the current move_memcpy() for the
> linear iomem !WC cases, hope that's OK.

Yeah, that's peefectly fine with me. I can tackle cleaning up all 
drivers and move over to the new implementation when that is fully complete.

As I said we already have the same problem in amdgpu and only solved it 
by avoiding memcpy all together.

Christian.

>
> /Thomas
>
>
>>
>> Christian.
>>
>>>
>>>
>>> /Thomas
>>>
>>>>
>>>>>
>>>>> /Thomas
>>>>>
>>>>>
>>>>
>>

