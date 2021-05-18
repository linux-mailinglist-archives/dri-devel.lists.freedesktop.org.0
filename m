Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B96E738798B
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 15:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B546EB66;
	Tue, 18 May 2021 13:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D10A6EB66;
 Tue, 18 May 2021 13:08:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyzxS2r3McqHoE/Wro5v7lgHeJyybZPw6VcdG3MIj6NlncVrvO4+a0UyGCVJU1zvqP7TmIe4jY0NPDhMXa5e3TSjl+sxqwnvLiFNHptv7Mh/SWqWezlKwmAbU0DwXVFmNkRmgkxNA1DWbT13DyFuvnDBowbzwHsFBdLmXpiIRvVLvrT6VBTEGsUTu2yj0ZoGhM2QXfvUe/X9xEqnhI5OK0HmFJk/r3rbpREm52r/NyYn8eoi7U+RKG4ndWTshLjKZdNUNwPJsugX2UsCQoq6m8+xGqLfcEBuVECKdBU5UE4dToDBCq1fxyFQi+75EvGc6vL+2/MH21YkprJIrgcQzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/2IowwNCQqC+N6T76Wm80/OjOqRMASJIWTarS59QKM=;
 b=JHTg6RDezxHpfPlUGpAssc0qG1f99KvQh03CF/3xmlZMeHcmdf1Df+amlo/2YmQ79KmpenIG8U9PiYwkH7H10sbVQEVb30dQUPUXRGnJgALGH7Aq90few+jmVRmGhujjioMW3JW+n/pW4ycaDRHweOhnmbL3qDVCdNbfxDyIZUdYW44oVMAkLjc8jSyfuwB1iaGFWM4Pv5mpCR+jlRVo9Le8T7xIQm+vC/DELPZGGMSjOqG/N/MlseX+OEWQ/lD5hltik6q2ltnThZ7CW8kOWrwnnccenrHxOL+VJGjS/cYk0C8JmeT3I0wjWlW2V/i/GsXwY5S1zF7y5bOY3Z80fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/2IowwNCQqC+N6T76Wm80/OjOqRMASJIWTarS59QKM=;
 b=0AGvrIBoM1PscM2SlcQTg9xZZvClDmVIEGl2IRRmaNUPXjPlvGSwQ91/hSGIZESb4NqTolWuBz/fKVSRuP25TYTfQA28KA5qashLbpRJav9rlq1lbrjHjNMydQyzXSItEhkI98X6BzK6sTPtBUrGGN3izAUqd3Lz1WuREsvZeQ0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 13:08:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 13:08:22 +0000
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b8e062c5-6b63-09c5-e98a-be9bf4813c61@amd.com>
Date: Tue, 18 May 2021 15:08:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <400de9b7-f385-0581-ebb5-e07247d4c996@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8470:36a5:2010:f0c4]
X-ClientProxiedBy: PR3P189CA0073.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8470:36a5:2010:f0c4]
 (2a02:908:1252:fb60:8470:36a5:2010:f0c4) by
 PR3P189CA0073.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.32 via Frontend Transport; Tue, 18 May 2021 13:08:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4562468-3571-416c-181b-08d919fe03b1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4549:
X-Microsoft-Antispam-PRVS: <MN2PR12MB45492DD95A66C8E0803FED8A832C9@MN2PR12MB4549.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n+QUi1xGKspw+m+chexmhcao+KDY60TW35uPqsAj+NRO5Tfbskz/XCazg6jT764wMQMi+MOjhqLED9smg6xAF8snuiYtCtTpDOObfrNZT74IY150OSR4Vq0X/yy+cR80AU0sw0wmFneu5VbaGWwaImLmih2A9zYNSi/upN+7KZd2Djq+g59hXPjgdeAGs0tuYZPoIBSGL5szlGGH6yE8tytK5CohJFdadVjhsVyEdKxO1oD/XeqEjY8KC6myKILaWEou3o5zJMbX6Rv20sO+yW4FkU8PnJPJFSFbu0wT7EfVaCdmvprLhzCTYNSWaecjorG5bCPx67JAUuZSzGM4+5dgUkodPkmJfP6pSp5goFVUIYjmTC3Lx3d4LB/8BiazDXywSZxV5etZa/4n4LIOAvCtTKZaRCasz3wCPMFcUmWgpgDoG1SVM6GTAwnGqWGSHWpJpayASQqKM8tJKSiEDI5DXEDDzlRm/yUMdMdoxxA7JQRUZKh6dFnlxLr9Rl7M7V2BzNjhKrMnZXSKNHnCVm2k+tHyEPYmAllGngXlYs8ENyNyRnXbdDdrGMcMvBNrh/CUl3bYxj9JJlL8DryVi7K7DUjZj2D53bcIF+6qmoSnkgaY4vPyvNxfuTCRhOtal6SWAdnW0x0u4D1JrkdYf6/QQZxNlfujo+PNTTDA1g4zhHL8IZ5ohQgFku0+a/heDF+KwJqoP91bnd/6rE/3mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39850400004)(366004)(136003)(316002)(478600001)(38100700002)(5660300002)(53546011)(16526019)(8676002)(66556008)(186003)(31696002)(8936002)(66946007)(86362001)(52116002)(6486002)(6666004)(36756003)(66574015)(2906002)(2616005)(66476007)(83380400001)(31686004)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y2V3Vkhjc2ZKemxxSWhSQWxjemtnek9RbnFkRGdFTGlBdzZ2T2F5Y2xRVlNn?=
 =?utf-8?B?MnJTUXRueTRUUGU5WDFOYmYyeEh6bkJtSUJUMXkwVk9rc1cwUjdPMjY5T1FU?=
 =?utf-8?B?SzlBS3VjVXl4MStVQURFQm5VUm4raFFKYkkyK2FIUHdLZ0Q4dWFMdEQ0NWtv?=
 =?utf-8?B?YUI5TUtTUGRIalhIT2hHVEhaZ2pvK3MyOUVNTzdpcktOam9za0t0RDk2OGlP?=
 =?utf-8?B?TUxBZ3pyd1JCL3p6STNVRXAzV3JHT0srclVpR0ovTGZmYS83Y1oxK0djQWVV?=
 =?utf-8?B?cVp2VVlXTlJ5V1R5VS9jZWdxeUFQU0dIOVUzR1pVbG83UUhLb0FubGtRTTJm?=
 =?utf-8?B?WEhKWDV0ZVgyeC9VN3lpY3QrQlJ6MUpubmFzUVowZG9yTkphK0pTenVwOXJr?=
 =?utf-8?B?ME52dmpnMzB4VyttNUx6ZEFhV1BNYWV3ays2bm9Da3FMUUVvOG0vcyt2OUFG?=
 =?utf-8?B?WGFHUmZlTEFlbTZLTVM1SDRUS3UvbGVKSWRsK3RnQ2pVVXhmVW55aXpHVDVO?=
 =?utf-8?B?VE5Ha0tFbzV1bCttbkoxcXpUdXZycENSZ2ZhYy85RWN4WENDbXpkT0x5SUw0?=
 =?utf-8?B?alo1OWhlU0lYUXJrQzdMc0l2b2RLcjZSanE5WkdLZU1GQUxqdVJVbTNJRW8y?=
 =?utf-8?B?RUdlVmhEWktudEFkN3RGZElhNlRnbEg3WjZmY3IxeWg2dkEzN2d3Vld6UlF3?=
 =?utf-8?B?NHJXLzBpOE5kc2FkVlhycHdQTHpYM0dodHBFaXhTMjhoaHprZGkyN1Axa1Q4?=
 =?utf-8?B?SEpVYUxORmRDUTc4Wi9WUXo3TUswZElyNUxIZGcyZWdyRFM0Y0ZnSGpFNFF6?=
 =?utf-8?B?TEpmVStCbWQyMWhOTVFXUTZmM1NWZWg4SGp0Mlpta3NSRUZoZzVGWFA2azEx?=
 =?utf-8?B?T1pGejZ0Myt0cWwwa1lhNVpNRjg0SCtGbSthNVFDL3NVK1ZzZC85N212dWNT?=
 =?utf-8?B?ZERuRStrSWNBYXhxdVlsUjAwRGRnZU5UN2J2ZFBvS2ZRWmM4bzJiWHhkM3VJ?=
 =?utf-8?B?U1ZTTU1CYVVUUy9PUmkxNXl3WHEzVFdpTlZlODhCRm9CcFpyM1liMDNpRzJh?=
 =?utf-8?B?Yjg1MTE3QTcyRkdPVkJzWnJPM0grNGtyL3ZLeTB5b0JERFJGL1VKMVIrZzlE?=
 =?utf-8?B?cnNDaXVZTVZwcnpJMVk2R2ZIclA2eVplTkxQV2l4cGhtNlozMGVRZUx1ZXpG?=
 =?utf-8?B?cGZ5U25GZkhMaVg3SlNHT3ZLSDFnQUVhRlJOUWJlMWNyNGU0SW1DcDUrdHU3?=
 =?utf-8?B?dnIwajQ5OVdPNDhFMGg0dGhXS2ZlUldNTjkvbkNTNXBmWXNINHpkajhGWEl0?=
 =?utf-8?B?NmZYSjh1ZmpJNnpaK1RJbkpYckhsMkFVV0UwZWU1RlRBUWg5dkY4ZDZrOTQ0?=
 =?utf-8?B?c01ZSHEyZmduT0gvVWx0SjJUMHNNc3NtYWdsdVBYcnp6OWQrbXRhZ2hXczRw?=
 =?utf-8?B?VXN1b2pFc1laWmFTczJ6V2VQSEczUzMyTVNIbUpQSVpJV1ZkODlqYWlZckkw?=
 =?utf-8?B?K0VUK1c1cHNZVUJORFdRR0czQmZTMUk3OS9MSFdPc0o3emVvbVk2UVNINmp2?=
 =?utf-8?B?NHcwNDBlYzgybG1NQkRmcEhaalRzVk16SG9icUxZMkRMZFRSSEkycU1CWHdi?=
 =?utf-8?B?WWpFRFRjVDFxY200Ri96ZlFZWFd3NUpZTVBEYnAwWDcwdDZFN3hKU2FrWDhj?=
 =?utf-8?B?TlNKSmFqM0M2UTZtQlViN0gxaGhzTTlTaWpwNDJqZnlqcWllUEpRYkZHbmJj?=
 =?utf-8?B?MGFmN3p1K3dhQTc0RnYvM3R6QmVPdzFNN1RrM3ZhazVlUlJmOGxHTWRSRE1h?=
 =?utf-8?B?RStoSC9rcEFaLzFJNlZRVy9Sb3AvYzI4NGtHY0cxWGZ0bFRHamRZclF1SU9Y?=
 =?utf-8?Q?LBcNrrRKjrlfG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4562468-3571-416c-181b-08d919fe03b1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 13:08:22.6659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUGLoIFhWzXgO2jjvS3KekXI19Vtyi4PfsenMCB1pPfp9Y/TeZwo2SgFli6iyuGH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4549
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

Am 18.05.21 um 14:52 schrieb Thomas Hellström:
>
> On 5/18/21 2:09 PM, Christian König wrote:
>> Am 18.05.21 um 14:04 schrieb Thomas Hellström:
>>>
>>> On 5/18/21 1:55 PM, Christian König wrote:
>>>>
>>>>
>>>> Am 18.05.21 um 10:26 schrieb Thomas Hellström:
>>>>> The internal ttm_bo_util memcpy uses vmap functionality, and while it
>>>>> probably might be possible to use it for copying in- and out of
>>>>> sglist represented io memory, using io_mem_reserve() / io_mem_free()
>>>>> callbacks, that would cause problems with fault().
>>>>> Instead, implement a method mapping page-by-page using kmap_local()
>>>>> semantics. As an additional benefit we then avoid the occasional 
>>>>> global
>>>>> TLB flushes of vmap() and consuming vmap space, elimination of a 
>>>>> critical
>>>>> point of failure and with a slight change of semantics we could 
>>>>> also push
>>>>> the memcpy out async for testing and async driver develpment 
>>>>> purposes.
>>>>> Pushing out async can be done since there is no memory allocation 
>>>>> going on
>>>>> that could violate the dma_fence lockdep rules.
>>>>>
>>>>> For copies from iomem, use the WC prefetching memcpy variant for
>>>>> additional speed.
>>>>>
>>>>> Note that drivers that don't want to use struct io_mapping but 
>>>>> relies on
>>>>> memremap functionality, and that don't want to use scatterlists for
>>>>> VRAM may well define specialized (hopefully reusable) iterators 
>>>>> for their
>>>>> particular environment.
>>>>
>>>> In general yes please since I have that as TODO for TTM for a very 
>>>> long time.
>>>>
>>>> But I would prefer to fix the implementation in TTM instead and 
>>>> give it proper cursor handling.
>>>>
>>>> Amdgpu is also using page based iomem and we are having similar 
>>>> workarounds in place there as well.
>>>>
>>>> I think it makes sense to unify this inside TTM and remove the old 
>>>> memcpy util function when done.
>>>>
>>>> Regards,
>>>> Christian.
>>>
>>> Christian,
>>>
>>> I was thinking when we replace the bo.mem with a pointer (and 
>>> perhaps have a driver callback to allocate the bo->mem,
>>> we could perhaps embed a struct ttm_kmap_iter and use it for all 
>>> mapping in one way or another). That would mean perhaps land this is 
>>> i915 now and sort out the unification once the struct ttm_resource, 
>>> struct ttm_buffer_object separation has landed?
>>
>> That stuff is ready, reviewed and I'm just waiting for some amdgpu 
>> changes to land in drm-misc-next to push it.
>>
>> But yes in general an iterator for the resource object sounds like 
>> the right plan to me as well.
>>
>> Christian.
>
> OK, so then are you OK with landing this in i915 for now? That would 
> also ofc mean the export you NAK'd but strictly for this memcpy use 
> until we merge it with TTM?

Well you can of course prototype that in i915, but I really don't want 
to export the TT functions upstream.

Can we cleanly move that functionality into TTM instead?

Christian.

>
>
> /Thomas
>
>>
>>>
>>> /Thomas
>>>
>>>
>>

