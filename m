Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3123543E754
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 19:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B106E069;
	Thu, 28 Oct 2021 17:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECCC6E0CB;
 Thu, 28 Oct 2021 17:26:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1ugMDBh2soeelDod5HtSd7oFTaUTdN3VxuJMXyqH/KGTG+VylZEXDgrOr2iiLmmZQeQsMM8UaRTDGgQszs2jPEo2TOVHuImRbjEUDpIQZbH4GynhG/jcg+fA47OoGLwU8dnyXZtUhvQia1RzbeSostXJ8hzwgH1Bdg85PCiLa/s15BBF74U6t9i5eCIgSdmmlw0zohkK25o41kLkIz2kx2COyxj666UjNj3sQBO+dxAPxT8QOLJci6+jW+GT+NYmNl75MHJcIVE5/ZwQPmapXBite14roL9TeGGwxH7dtcW7Y5Mhj/NbnG0GR49nDPGemuFIjpOU9+OptklhB6+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKU/bYZi1YbhwKeWsqJkTALBwJ4/Jg4UwTKSPHV/B8I=;
 b=PoPLPwtDbQCGfHXDCPzaTnHfCu9+kWazTY+WqdWG0zovdORnJ3vbAkuh08rx30V5oAHjynlk447mb7/5BibpnfqUQXSTeT1ygImPn8nVQEwNVWYiwrzWC1PlzFgeHh1fS6N/tMN1P+kpiYbLAk3knomCNgoaONYLrXcrOqkmC+HJVwzR0HYYARKUEPjlLkQxUx8jAS3HKX5UqsB2z8VFRh/OwhTW0uVpQOPEG4K4cm4rBlsoZiXYSyJPGORKLd7KQFLLPJJ0003V7jcpUdeMQx4hP7ZO8BA9VfwrVitDAzysS1EV12G++dIG/s3Np6nfAbYrOW+lzpsIyMgFmlaZcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKU/bYZi1YbhwKeWsqJkTALBwJ4/Jg4UwTKSPHV/B8I=;
 b=LnO5ELsTLFMssm5syfvQKHfA+P/ghfIsjjOB5x1bZg1ZwLkqgWAStg+WPZsO2SCr9Ex01I4DXvMf1rUfpS0oVE74cmWO/MzwJfnFLV6f2KM+dDSHgoHHtHQWzF1QQ1FIHdoQacxpEw01cB1F1jnU9Ggy1gj6iziddpz9UxrX8OE=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 17:26:28 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::710e:dfc2:4247:8568]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::710e:dfc2:4247:8568%12]) with mapi id 15.20.4649.015; Thu, 28 Oct
 2021 17:26:28 +0000
Subject: Re: Lockdep spalt on killing a processes
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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
Message-ID: <a0a54261-f83a-8402-31dd-009588adece6@amd.com>
Date: Thu, 28 Oct 2021 13:26:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <f1a7093f-1872-3a8a-820e-ada11b1293bb@amd.com>
Content-Type: multipart/mixed; boundary="------------02D54C5EE1022BADD6092DB8"
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0115.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::26) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:b55f:1c8d:d03d:ea83]
 (2607:fea8:3edf:49b0:b55f:1c8d:d03d:ea83) by
 YT3PR01CA0115.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:85::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Thu, 28 Oct 2021 17:26:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cda7a7d4-c6ce-47f1-005f-08d99a381361
X-MS-TrafficTypeDiagnostic: DM6PR12MB4298:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4298ABFFBD1181C0C26603F8EA869@DM6PR12MB4298.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wJxV4jW5aOSqvCR9TEeROrm8CR4GBPutDLj2ZzkV9CjDzp5VfkomkOfAYGdHWye3J9oEXXvqt40AsEUVgECJ/m+BpSQ+2H0brxHltoNRg88rGv/Wuz2RSpSMkac5Y08R6AdwE9hCjayOlbD+HOAlP+cJUSRByJXGyd/K/2zL79QsVgfcdSKovgFFZlCu6NbzRcFyFuhALPzArY2B7er9YoED5H9vfE4vwcVwzceHzO48aN/VKcJl6GUpSj265KZZzsrkilgI4kLAI2IlZb4LfwxWsm9HLgM28LgrrI1hV/6iHSG4iRxFQnqAg0BLrE9XxxYoEqxHUyjNK75pT1GliIfvgBsAd+8LDf0VHsX4hxvpEhqQbMZWBBhv+oZ8i34qMpX+GtrlfhlRrA8aOFXX2P4sh9zxLbYeqiyjI0IQ5EWZWn1NHxcQOneB0AsNvEmpJjRVfH4vtZ36aQzleOC9kDTkvYbpmScmScaDa1PelUCjsvLbEdEGO/Lc9N1lwky274XkFS6m+APNeb3iftH8tE6LYQhXRoOefWgLApKEby+6X5EbutUh0Vmjg+lE6cg4I40yKR/WQNALN+jIaFXUyuMEmGUQ4OcBFq6kGfJZGSVs7eQfSpDa8JeWOVBWSJbPbSUgKq0+PUOWN66Eos8mwLq5WpFQwDg6k5KwaPdbbhA8y48m5cSvKut2vAA9URIK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(38100700002)(186003)(66476007)(508600001)(66946007)(8936002)(66556008)(66574015)(36756003)(33964004)(6486002)(44832011)(2906002)(235185007)(5660300002)(316002)(4001150100001)(86362001)(2616005)(31696002)(53546011)(8676002)(110136005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Umh2ZWRWNEpaaHdHNlM5YWZZZldXU2k3LzFSdHB1UjU0MGNkTmRzUnlXSEFR?=
 =?utf-8?B?YWZQWjhGeWFiakphSVZmWUMwMWtWT3JiaS82RTROSzc5MGpITlBXR2FzT01F?=
 =?utf-8?B?V2g3a0p6emJmZi9WOWtzOTE2OTgxSHIwZWN4TnpYU1lJWE5aV1RwMUlCZ3Bh?=
 =?utf-8?B?QkI1RFYxYUtWWHllK0RxWTY4QWhBMFExbnE5c0lsUm9OZ3BRNEtHWGY4M0FW?=
 =?utf-8?B?YUJxcGxHRmxDeXVHbGcyeEhLVUJpay9jWkFWSUdWV2krbU8zMnZFTHlLaHJV?=
 =?utf-8?B?Nm54R1IxVXBXV1lKWmtOYkJScVlHOFBFOVFUaGJUN1N0UmNSOU4xa2pQTlZk?=
 =?utf-8?B?SzVoNEM0MmQvNFNucWVKcmkyRGdvQ3FSNWo0Yi93NXp4WHpVMGloRUI5SmFv?=
 =?utf-8?B?UjlwTWM0alZYZnd3eXRVbzJ6Qkw3ZTd2cmFyaWRjVXlnZXFTZS81Skw3Vll0?=
 =?utf-8?B?M3ZHMlpwUEVBRkJseVJ2cGcxcG1mcVg0VFJjSGJaVUIzSGt0YzlwMERuQjd3?=
 =?utf-8?B?R1o3cFk5eU04YVZrR05qRUFBUTNUQUpRUVdHeU5SNy9hWXJNbnJER25hb3J5?=
 =?utf-8?B?QlpZemtFUktHaXRCUk43VW1hUGlnY3RPaXhzdE1JaUJqTTUyRUhPYStjV3hC?=
 =?utf-8?B?Y0FuenRIbHJMdUt5NDBxRTdKWDZTVzVybFhPLzI2U3FFTE80a0NFRFNDQThv?=
 =?utf-8?B?Vk81RTUyU0dJdzlPeFNybGpwdCtnZXBOUlhoczc4WVNVTmorbkRpRTVuWnNS?=
 =?utf-8?B?MGtrdUd6SXhlbjNpdW1ndXhjRGNoSmtXbVN0V1o3U0NTTHU2NnV6bDdXNlk3?=
 =?utf-8?B?QUNKcWtOcHR0M2Y0b1pDSHFFSzhVcCs3Y3pvNGJZdEc3VFo1cThwV3kvMEhZ?=
 =?utf-8?B?Qk5pLzBkUTBnZ3BoemhzTWxTM3E0Z080Vld6VDRhUitmSW5xNVNKK0oyaFpq?=
 =?utf-8?B?Y0xqUGNtYks3ZXU2Vy8vcS80K29TeG5Uem9EQ2N0cEtvWTYwRWxpaEdrcGpa?=
 =?utf-8?B?VEx5WXBNa1dtcURsZTJ4anVmVUdNYVlJN1VGeEQ3MVVxWTRLRmhrWDRhTnZ1?=
 =?utf-8?B?QTBOak5FOXE1Q3JHT2hRdVVhZHlWVGNkbmt3U3FsRGlxeWxnS3B4dkdEZWFk?=
 =?utf-8?B?TnhRZ3dBZ3UxWmRkd0NsamhsRW9JQ0cwNVRVZkhRVHU1a2o4Um9xTklVcEt1?=
 =?utf-8?B?SFppTkNYcndHS3lndnlIQ1B5TjVwOWRhWGNmcXhmN05admxhUjl2RzJaTlly?=
 =?utf-8?B?QzJQbUphKzNkalRXUzdzWGpYUjMrNmZsOXBXUExVeFhqWWhIWWc4SHJJUC9x?=
 =?utf-8?B?OE1zaDRnSXdSeDQyakJLSGo2ZnNWSU5Ba2FVQmpkRWpLQW5XcXFlU04vTEZX?=
 =?utf-8?B?WWE4aGNYcDdsS2VrMWV3NzE3NnZ4NnNpQlFGV25veGhTaW9jbWhMdHVaY0R4?=
 =?utf-8?B?TFhlbVdxQ0p5OExtU3RCTnIrbXRwRzZMVk1uYWNPSVFLcG1XdUlvd29TNUJ2?=
 =?utf-8?B?R2lnWE1vMHhuaWxBTnNHeHhwbU8zY1FCS21MVklaajF0eTNBK01uOTBZVTB1?=
 =?utf-8?B?TTZraHJhb0JJa3FPK2JJQU5jWDluUE16U0YraGFnbFNUNzhDTUY4OGpPdzRi?=
 =?utf-8?B?bytRYkNUc1FmZTFrWkV0ZmFFTEZjWGpnYnVESk9UK0h3UVlDNnhvTmYzUjZI?=
 =?utf-8?B?Y1hDU2dmOXNIczY2Y1YxbCtic0ZmbTFmUmd2T29UZVlpUGdMcmxiY3UwLzhM?=
 =?utf-8?B?QlhGV2ZiMnpsWlF1OGE3TEIvNElOdWZtNURYVW90aWZsU1RYeTVxRlVBR1Fw?=
 =?utf-8?B?SU43STlHeE9uUDdCZWVjcjZWLzdUUEdHOHpHcEVMckJxVXpHYjF4NHJGRUZU?=
 =?utf-8?B?TkVoVjA1V1VMY21LbmRYcXFrSTl3UlNoR284dnV4SThrcTJmYjB5ZjJlVmp2?=
 =?utf-8?B?bjhoeG5PN2pGcXp2dmlrZll0SklMejkvWSthYm8rdVRBdTJJRjR4ZlViWkNu?=
 =?utf-8?B?NWRNTWxlekw1a0FQc0drNll6aDJqTGVVTk9QbE5EWTk4aGsyVDZTVWd1b0p1?=
 =?utf-8?B?TjBpR2JIc1VycmVkNWtMVmYwdlFyYS9tamlZUk9VUUM4MFJlVnBoTXhMVHl1?=
 =?utf-8?B?cGRWNXlCV09lak1TSE10aWh4dEY4WG5mbDBtQWU4ZFBqUmY4NGM5WGZrcUth?=
 =?utf-8?B?WlFuc3BOVzlxd0U1VWJDTXJTam9ZME5CL3BkaUJTT1l0aW55SGpsK3dHVks0?=
 =?utf-8?Q?+RhiYeAd9QgPhano1hZ9lVTL/aJD5fPaYNeLfDQEZY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda7a7d4-c6ce-47f1-005f-08d99a381361
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 17:26:28.6564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/IYuvbXXC7mJfAcxqE4P6RJEcZRu3+kiooefLCzG56GoIXSQFe1tm/8HO5b8rs8385aEBk0FGksEoCmZ8hcGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298
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

--------------02D54C5EE1022BADD6092DB8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-10-27 3:58 p.m., Andrey Grodzovsky wrote:
>
> On 2021-10-27 10:50 a.m., Christian König wrote:
>> Am 27.10.21 um 16:47 schrieb Andrey Grodzovsky:
>>>
>>> On 2021-10-27 10:34 a.m., Christian König wrote:
>>>> Am 27.10.21 um 16:27 schrieb Andrey Grodzovsky:
>>>>> [SNIP]
>>>>>>
>>>>>>> Let me please know if I am still missing some point of yours.
>>>>>>
>>>>>> Well, I mean we need to be able to handle this for all drivers.
>>>>>
>>>>>
>>>>> For sure, but as i said above in my opinion we need to change only 
>>>>> for those drivers that don't use the _locked version.
>>>>
>>>> And that absolutely won't work.
>>>>
>>>> See the dma_fence is a contract between drivers, so you need the 
>>>> same calling convention between all drivers.
>>>>
>>>> Either we always call the callback with the lock held or we always 
>>>> call it without the lock, but sometimes like that and sometimes 
>>>> otherwise won't work.
>>>>
>>>> Christian.
>>>
>>>
>>> I am not sure I fully understand what problems this will cause but 
>>> anyway, then we are back to irq_work. We cannot embed irq_work as 
>>> union within dma_fenc's cb_list
>>> because it's already reused as timestamp and as rcu head after the 
>>> fence is signaled. So I will do it within drm_scheduler with single 
>>> irq_work per drm_sched_entity
>>> as we discussed before.
>>
>> That won't work either. We free up the entity after the cleanup 
>> function. That's the reason we use the callback on the job in the 
>> first place.
>
>
> Yep, missed it.
>
>
>>
>> We could overlead the cb structure in the job though.
>
>
> I guess, since no one else is using this member it after the cb executed.
>
> Andrey


Attached a patch. Give it a try please, I tested it on my side and tried 
to generate the right conditions to trigger this code path by repeatedly 
submitting commands while issuing GPU reset to stop the scheduler and 
then killing command submissions process in the middle. But for some 
reason looks like the job_queue was always empty already at the time of 
entity kill.

Andrey


>
>
>>
>> Christian.
>>
>>>
>>> Andrey
>>>
>>>
>>>>
>>>>>
>>>>> Andrey
>>>>
>>

--------------02D54C5EE1022BADD6092DB8
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-sched-Avoid-lockdep-spalt-on-killing-a-processes.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-drm-sched-Avoid-lockdep-spalt-on-killing-a-processes.pa";
 filename*1="tch"

From 8ba5c089939b79a6567411c33d4db40e5846eef3 Mon Sep 17 00:00:00 2001
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Date: Thu, 28 Oct 2021 12:24:03 -0400
Subject: [PATCH] drm/sched: Avoid lockdep spalt on killing a processes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Probelm:
Singlaning one sched fence from within another's sched
fence singal callback generates lockdep splat because
the both have same lockdep class of their fence->lock

Fix:
Fix bellow stack by rescheduling to irq work of
signaling and killing of jobs that left when entity is killed.

[11176.741181]  dump_stack+0x10/0x12
[11176.741186] __lock_acquire.cold+0x208/0x2df
[11176.741197]  lock_acquire+0xc6/0x2d0
[11176.741204]  ? dma_fence_signal+0x28/0x80
[11176.741212] _raw_spin_lock_irqsave+0x4d/0x70
[11176.741219]  ? dma_fence_signal+0x28/0x80
[11176.741225]  dma_fence_signal+0x28/0x80
[11176.741230] drm_sched_fence_finished+0x12/0x20 [gpu_sched]
[11176.741240] drm_sched_entity_kill_jobs_cb+0x1c/0x50 [gpu_sched]
[11176.741248] dma_fence_signal_timestamp_locked+0xac/0x1a0
[11176.741254]  dma_fence_signal+0x3b/0x80
[11176.741260] drm_sched_fence_finished+0x12/0x20 [gpu_sched]
[11176.741268] drm_sched_job_done.isra.0+0x7f/0x1a0 [gpu_sched]
[11176.741277] drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
[11176.741284] dma_fence_signal_timestamp_locked+0xac/0x1a0
[11176.741290]  dma_fence_signal+0x3b/0x80
[11176.741296] amdgpu_fence_process+0xd1/0x140 [amdgpu]
[11176.741504] sdma_v4_0_process_trap_irq+0x8c/0xb0 [amdgpu]
[11176.741731]  amdgpu_irq_dispatch+0xce/0x250 [amdgpu]
[11176.741954]  amdgpu_ih_process+0x81/0x100 [amdgpu]
[11176.742174]  amdgpu_irq_handler+0x26/0xa0 [amdgpu]
[11176.742393] __handle_irq_event_percpu+0x4f/0x2c0
[11176.742402] handle_irq_event_percpu+0x33/0x80
[11176.742408]  handle_irq_event+0x39/0x60
[11176.742414]  handle_edge_irq+0x93/0x1d0
[11176.742419]  __common_interrupt+0x50/0xe0
[11176.742426]  common_interrupt+0x80/0x90

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Suggested-by: Daniel Vetter  <daniel.vetter@ffwll.ch>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 15 ++++++++++++---
 include/drm/gpu_scheduler.h              | 12 +++++++++++-
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 27e1573af96e..191c56064f19 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -190,6 +190,16 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 }
 EXPORT_SYMBOL(drm_sched_entity_flush);
 
+static void drm_sched_entity_kill_jobs_irq_work(struct irq_work *wrk)
+{
+	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
+
+	drm_sched_fence_finished(job->s_fence);
+	WARN_ON(job->s_fence->parent);
+	job->sched->ops->free_job(job);
+}
+
+
 /* Signal the scheduler finished fence when the entity in question is killed. */
 static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 					  struct dma_fence_cb *cb)
@@ -197,9 +207,8 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
 						 finish_cb);
 
-	drm_sched_fence_finished(job->s_fence);
-	WARN_ON(job->s_fence->parent);
-	job->sched->ops->free_job(job);
+	init_irq_work(&job->work, drm_sched_entity_kill_jobs_irq_work);
+	irq_work_queue(&job->work);
 }
 
 static struct dma_fence *
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index f011e4c407f2..bbc22fad8d80 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -28,6 +28,7 @@
 #include <linux/dma-fence.h>
 #include <linux/completion.h>
 #include <linux/xarray.h>
+#include <linux/irq_work.h>
 
 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
 
@@ -286,7 +287,16 @@ struct drm_sched_job {
 	struct list_head		list;
 	struct drm_gpu_scheduler	*sched;
 	struct drm_sched_fence		*s_fence;
-	struct dma_fence_cb		finish_cb;
+
+	/*
+	 * work is used only after finish_cb has been used and will not be
+	 * accessed anymore.
+	 */
+	union {
+		struct dma_fence_cb		finish_cb;
+		struct irq_work 		work;
+	};
+
 	uint64_t			id;
 	atomic_t			karma;
 	enum drm_sched_priority		s_priority;
-- 
2.25.1


--------------02D54C5EE1022BADD6092DB8--
