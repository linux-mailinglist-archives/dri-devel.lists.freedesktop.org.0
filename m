Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817E43F7A8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 09:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E656E9F5;
	Fri, 29 Oct 2021 07:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAA16E9F4;
 Fri, 29 Oct 2021 07:08:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNCWPuFVnBh65uwHLHP554eHqYTuoDITO8z8AtrATH5toLhu9lhOoezyNPOO69xK7Bjh/dJ03biKHTOglGjHhQxNgvsirTS4MQN2zM1uqcTQrqomUYY9nL1SrUqTITaqGt/G4P0DwBazX5ARN9HC+oTE8isNNH8TkS1S7ww8iIpV+pU+xB8kkm8hAOzsk+/NSY1aoPVbC5nqZM4Mu1++8EzcY1ulDzPpqObkhEeamJT8u86zMgs6p24CKc0qr82926rgeMW869oEWRbXHZ9Nq0XmC34Bf0Eh0ViU3BkLhg1CS+AMAGfsdjhPyE8cghRrdbM7mBtvZrnvtwcOSv2elA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxDj3FKPySRGHsMJL8wBNt50QV3jvX/X5moekP+XeZw=;
 b=MuqXRZyP4ABf06XTOmxrB3G0d0/+tTMJnzOvyM1nzdO2yxOx3ryN9Z12i9QIkzc8kwQe4jzXVaFyIfGUW7MNBGEIYwtJ1UggaREaQROFkbiNPqbD0/nuwu8FGzfEp6wbAFvR98W4kEOxwxXBUSkBBoCDmI1HZN1dxCEotJNtApySLuoJIlalhV2lRMCvPA7VL1BWM97MS5gfQKUgvN2VfjgtgVf9Pu8SuL8goiv2BJ3Z4QsMkWza5HydAY7oxUwwhAk5KwJpgmBAeVbtrYAjN1WM7KXbdZ6Odl+xtrMPhVwOGd/xSZ2W43z78dAOGSXl/EHbvD59y3p8V55d7iShvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxDj3FKPySRGHsMJL8wBNt50QV3jvX/X5moekP+XeZw=;
 b=qpQzMeYi/iVlzfCEr+0UlFxH8huR7XhUpGZBxeOOpHvEd9PvNXcBkk8mKsaq26cKpY/0up9fV47pBHr6mJEvPMJKdIq7xR65s2Wkr38ryMjT4DgdG7BVootCO46O6obSTVBlIEu8DDrxzzpvpd8cCARD4jynTvc8yRTli5oAuac=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com (2603:10b6:4:5b::9)
 by DM6PR12MB2746.namprd12.prod.outlook.com (2603:10b6:5:41::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 07:07:49 +0000
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::9d0d:c67d:2610:ae74]) by DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::9d0d:c67d:2610:ae74%10]) with mapi id 15.20.4649.015; Fri, 29 Oct
 2021 07:07:49 +0000
Subject: Re: Lockdep spalt on killing a processes
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, chris@chris-wilson.co.uk,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
 <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
 <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
 <5e67d2d2-f5ce-2669-6ad9-7e40c74ce853@amd.com>
 <696ac3f9-4b45-b8a5-5300-79093d2cd1a5@amd.com>
 <2639d027-b6c8-ee09-5e9a-564308949c53@amd.com>
 <cbeac930-84c3-7a62-0b3d-4cef3074139d@gmail.com>
 <da1ed5da-59ad-d12a-906c-c84b7462d8c4@amd.com>
 <bb70e916-e71b-9968-78d9-d7de8fef9e91@amd.com>
 <5c70c6a9-8867-506a-1e7b-32f85589a070@amd.com>
 <c5fc1be1-eaec-a57c-79ee-9a63123ed9a2@gmail.com>
 <a1f594de-e326-6150-c787-35a4fde648d7@amd.com>
 <ca590ce0-ea1c-0d40-f157-2e3b5c657b01@amd.com>
 <f1a7093f-1872-3a8a-820e-ada11b1293bb@amd.com>
 <a0a54261-f83a-8402-31dd-009588adece6@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6aa79474-e998-368b-bb53-b43f135f5a0c@amd.com>
Date: Fri, 29 Oct 2021 09:07:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a0a54261-f83a-8402-31dd-009588adece6@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16)
 To DM5PR1201MB0187.namprd12.prod.outlook.com
 (2603:10b6:4:5b::9)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.5 via Frontend Transport; Fri, 29 Oct 2021 07:07:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80ccf122-77dd-4873-6e0b-08d99aaad0bc
X-MS-TrafficTypeDiagnostic: DM6PR12MB2746:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27469B6C32CD79012662163A83879@DM6PR12MB2746.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xbARgQd053qiDWVY9fXQh8MjP93w6FM+m+cl+9VR05eEs5oBOEhmpvIwdZY95t434oCf4tE1tBdijyttyXwghNpc5KzLKh3YifPEAf16URz2ePA3TG5tcCG2jJpyxWddkz5KcPCf4w+TvGcCfZp+2lPjRBT6zRi5wnWKZ57H4Na6a/Qc59LVSokgZwE5dpfi2QwIHYR+4zNiH1lh0CsU8DLl0GQEITDd2ehSReYyO9i40vk/e1XxhfRvGJGEy75A/DoArI6ppLGesq+ZjZdX/KY0OtbSuRCRXRGkdgdce819MLw73lX4zh2Ziutqfy7Yp5nkPBc0ZwBgwcZuA2lbjQMueAkjewrLXC7MQxfA05emecRPz+k2kW+am/bMpcjvf8AQizXklJ03CpF6KSENMISIAdws/XlYom1K4hnycz8ZUKfS4U35pPRyOjJCfeYCdA2vbplkGM99S8lVGEG0yfIaEBjPZ/79IuIn8GDPBs9QcfFqtwpgicreUGaHlY+YqfwYNyGL4jCdhDZmCWO7hUc7zkmD0vqatB1TkS8rhR5eKm2s9YEjDCkcahILyrK5ZHm8aPNdrJvTwo5A1RN5aAIoLJ0tBS9tSrUndpN4cdO3VJWKOZzijE+JYxczN25MoQutNQVTR9dSpp5gV8O7EPlXJcaYYu5B+2lt2g8l+VMKqc3HCrXlSAJ5xxb0bWGBXvMKgLd587Fu/sIs8gOdQKzydHZETLwMseyTWlbE+Ms=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0187.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(8936002)(38100700002)(6486002)(4001150100001)(31696002)(36756003)(66574015)(86362001)(6666004)(508600001)(316002)(26005)(31686004)(16576012)(186003)(2906002)(53546011)(110136005)(956004)(2616005)(8676002)(66476007)(66946007)(83380400001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU8rRTY5ZXJtYWNET2NMOTRMQ094bDNaOEp0VkFnYnQyOFBzUE9tcHpHd1dE?=
 =?utf-8?B?NHAvK2tSRExid3hxQWxkVDFzdDZkTFR1TGgyYnRyS3ZnTGc1QXJNbytzSkNE?=
 =?utf-8?B?Rk51eTVrUVgxa3RXMkhCZFZmc1l1K2hSTlNldDVzQmcza3ZOOG5jUS9DM3d3?=
 =?utf-8?B?aVlsdjB2WnU3TTIwaVluRVRQdE9QZVNpUXp6RVp6TmFqcmp0R29CVGZpdlQ5?=
 =?utf-8?B?MGZHN2Nzbk1SSVlRaktOTGZBdzNBeDFtSDZRWE81VlRsZ3VKaytkYnlQMFFB?=
 =?utf-8?B?WDVENXNCNGZyUzZ3TkZxcmRxcGkzbHMxT00xK0Z5ZDdmaGYvZ3lEU3pXWHoz?=
 =?utf-8?B?VHAyRWJvY0tTemI1OFRMSEc2TmZrLzN3Q0JHNmEzMlpvN2FUVFJzdWFueTBF?=
 =?utf-8?B?NCtGWE0wdC9BTWZrSytFdjZUZCtyNlNRdXN2ZVFWL0pEbTQ4MitWK1hjYWs3?=
 =?utf-8?B?WmRoeUYxN3lrbEN0bGgxS0Z1eXVvK0F1cnBKTVV6Yy9xZkh2aERBa1JoQSty?=
 =?utf-8?B?NUQwRDBwOWU0azBkb0EzekpkZzNBdGYyVzBjaEoyb3dpWDhxS0pRL0VmTnZX?=
 =?utf-8?B?UDk2KzNwWm53eFcrMVFkRXkrS0FleFNrZFZtbW12UGZYNWFGam9uMnYrWTRj?=
 =?utf-8?B?SVN0aVg4MnNjSGRFYTI3Z0x4OXFsaFdUU09uejQxNmlXb2UvaFNpSFl5SWps?=
 =?utf-8?B?ZDJ0aXg1Y3prUXZkeFQvTzg0cW5YVFkzLzlJNFI4ck1IZWFER1JQaGdYNFdi?=
 =?utf-8?B?MC9UWFAxTXlvS1ZHSEFyWG81TTVVNS8vdUd3K1JWb2lWdEJTbEgyR1dHZGNa?=
 =?utf-8?B?ZllqUGZQdmZvNU1ZNlVCZTMwTGg3Tk9vMXlnR0Y3OFV2QXJ2S1RSU3gwbDJU?=
 =?utf-8?B?WGYwZEdBL3VudlByVEt4b2xyeVk1TS9MN245RFE3UVMyTXN0TlptYlNnUXNu?=
 =?utf-8?B?Tlk4UlZCVmc0bndyU0hvZ2pFM1NMSGVwQUNXR29EQWRjS3JUSFJUVEwxOW4r?=
 =?utf-8?B?V0RqZ2IvVTFDQ0F6ZXpJTE1aRFlKSjFVUVFUQk8rUGI1c0RzWk84dzBiQ2U3?=
 =?utf-8?B?dElHUFVyUHA2ZC8yNCsvdGFNRytpdzNGR1RwTGwraWl6UVBCblVXMkliNFFE?=
 =?utf-8?B?QzE2STYxV2ZjdkZyTlNoT2R2dlpnQVFRVFpaNjR3SS9OUXF2TmlSemdIcVhD?=
 =?utf-8?B?b2dmOHVGd0xYMmNzVWFpaGJmajJBS1NzcnpBSkRGcURhakRmbWJkU0dNWTEx?=
 =?utf-8?B?dWd2NnJVajJlWlRlVjEzcXpqWWVXNHpNL1FZRmRMZW0rNDJUcmwvYjhCZDk3?=
 =?utf-8?B?QndQY1NoUDBGc01WUnMzaitGSitiVnFUZGpaUmY5MTIyQkZpQUhxd2dlbmdF?=
 =?utf-8?B?Z0tYSStaUi9oRHBoMUFvY1NveEwvS1JIc01tZnM5K1BXekt6Zm94YjI5NmRy?=
 =?utf-8?B?SHNqaWVQSW5IYUhMWitrVTY4SzFDTHZUTlpWZFlwUXhLbzVTeG1iUkJobDha?=
 =?utf-8?B?T0VZenRrdU9YQVZCdzZtUlh4R3NYbUNMK0YwSXFkS2lKK09PeFZZamFRQWt5?=
 =?utf-8?B?SkM3VnZ5OWVydzlWbHlzdFNJYjlRWkZsenFZWGd6Rml4Yy8rdWN0KzVPbnZl?=
 =?utf-8?B?RGFOdnBOK3AwVnc1RkE4QjFVTDRKMEREUzk3QXdUV3RYYUFsb201M1lJNDMv?=
 =?utf-8?B?N0Vvc1RVV2hORnBMekwvVEhNbFNYTkZOS3ZDTjAyQjZmN3YzQlNvazBMMFJ3?=
 =?utf-8?B?R3ZsUFVxL2ZnMGVnNjJQVEVtVno1SVNZWExlOEY1L3hJZ3pxV1hGcUpzUmJ5?=
 =?utf-8?B?YkU5MWVDWG9QMVNzYjRUWFRmUm9lM3NxczFhc2E4b0lYU004ZVJzUElPSTEw?=
 =?utf-8?B?cVM4aVJaV0RmUUpEbStPWEo1cm0rRlkxOTNNbmNIeDhjZlBybFlLYUQ4WGt3?=
 =?utf-8?B?T3UyYUwrWVhJNTg2RGcyaTdNbXJVUEtIbXdIYnNZYVM0Y3hhWVUyRjZDZXRr?=
 =?utf-8?B?c3BhbEhWSXNpRWFFZGM5VkVaOHIwanhhVW9oM2FYVXZ3azJoVHYrcnQ5QXJY?=
 =?utf-8?B?azVDWEhOMmxib2xNVGg0YzhqbmtvZ0pXZitXOGdmcW1IMlZVNzc1UmdnTFhO?=
 =?utf-8?Q?wea0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ccf122-77dd-4873-6e0b-08d99aaad0bc
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0187.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 07:07:48.9082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nkpu2iJQIxA/ErRvDgGA5Cvk/XIlGvxFk9A2yQUj30baHLfXLonZQWouzDpVVExp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2746
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

Am 28.10.21 um 19:26 schrieb Andrey Grodzovsky:
>
> On 2021-10-27 3:58 p.m., Andrey Grodzovsky wrote:
>>
>> On 2021-10-27 10:50 a.m., Christian König wrote:
>>> Am 27.10.21 um 16:47 schrieb Andrey Grodzovsky:
>>>>
>>>> On 2021-10-27 10:34 a.m., Christian König wrote:
>>>>> Am 27.10.21 um 16:27 schrieb Andrey Grodzovsky:
>>>>>> [SNIP]
>>>>>>>
>>>>>>>> Let me please know if I am still missing some point of yours.
>>>>>>>
>>>>>>> Well, I mean we need to be able to handle this for all drivers.
>>>>>>
>>>>>>
>>>>>> For sure, but as i said above in my opinion we need to change 
>>>>>> only for those drivers that don't use the _locked version.
>>>>>
>>>>> And that absolutely won't work.
>>>>>
>>>>> See the dma_fence is a contract between drivers, so you need the 
>>>>> same calling convention between all drivers.
>>>>>
>>>>> Either we always call the callback with the lock held or we always 
>>>>> call it without the lock, but sometimes like that and sometimes 
>>>>> otherwise won't work.
>>>>>
>>>>> Christian.
>>>>
>>>>
>>>> I am not sure I fully understand what problems this will cause but 
>>>> anyway, then we are back to irq_work. We cannot embed irq_work as 
>>>> union within dma_fenc's cb_list
>>>> because it's already reused as timestamp and as rcu head after the 
>>>> fence is signaled. So I will do it within drm_scheduler with single 
>>>> irq_work per drm_sched_entity
>>>> as we discussed before.
>>>
>>> That won't work either. We free up the entity after the cleanup 
>>> function. That's the reason we use the callback on the job in the 
>>> first place.
>>
>>
>> Yep, missed it.
>>
>>
>>>
>>> We could overlead the cb structure in the job though.
>>
>>
>> I guess, since no one else is using this member it after the cb 
>> executed.
>>
>> Andrey
>
>
> Attached a patch. Give it a try please, I tested it on my side and 
> tried to generate the right conditions to trigger this code path by 
> repeatedly submitting commands while issuing GPU reset to stop the 
> scheduler and then killing command submissions process in the middle. 
> But for some reason looks like the job_queue was always empty already 
> at the time of entity kill.

It was trivial to trigger with the stress utility I've hacked together:

amdgpu_stress -b v 1g -b g 1g -c 1 2 1g 1k

Then while it is copying just cntrl+c to kill it.

The patch itself is:

Tested-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks,
Christian.

>
> Andrey
>
>
>>
>>
>>>
>>> Christian.
>>>
>>>>
>>>> Andrey
>>>>
>>>>
>>>>>
>>>>>>
>>>>>> Andrey
>>>>>
>>>

