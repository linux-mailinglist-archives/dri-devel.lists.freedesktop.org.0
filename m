Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78D5556EE7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 01:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C5E10ECC1;
	Wed, 22 Jun 2022 23:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008C610ECA2;
 Wed, 22 Jun 2022 23:16:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5q5kVQSlfXUpeEOmGXclUaQ1w3XOO2zbGcl3iQo/ZuCJOxAe4Z8fMtKgBNkcJsUT0aXXTjHO1Fpp2BvcUOWOk+ocMlFEmsruf2f68M3OXUVb7nImLnGysBrYNrMdETkmtt+g7EYhv72er7y9YV/gGYEWSck3CmUG1voYLzGrUd561AebxQhDx7GX2+de7MYEsh6Z/tSOXS63Px92EZn+k9wxAee8nMBRpU5wItt+KiLQmcQc9iAeNeLRackWqqqNuiS663vrIQFe9GB31PGbSaknlZNUFNyrRqXFIYEcxB9tOGx1zHeP/FAsXSTghZpeVVbEOwcyZebLCpLzzmreQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2syBHGVDcU/yQTOHDLctpp6hlDHmwTJzfZKqV6lcVI=;
 b=DXTBJXoYlUo1Cioa6wOeodO4Mm29XFMpzXnCpO7ii90FWxo+5HCDGQEN6QNMzvX+7knyHGLblrql3GfwSDnWE3Zl2l904+TtcgCbXSqHcnjmhrgptrXNINQT4Jp++txhMFrZuy3XVmuM+OBjY+i4oFi2OGpmNskCIfjlE7yu6bbfrXAAtOOWuQa1gojoGKAsriPS05T7+KHe6u2y81BMesL85+19Fuys+xAO9Z9E+OyI8eKCmOyrCTxpbwymW0AF+8wCbOryhp9IGXgRKPUQUy/8nRz8xpy+VMIcQsTrJqNzFKyFqgWMTaLi39U7uTlm83zS0L7v+0J+L4HplTSacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2syBHGVDcU/yQTOHDLctpp6hlDHmwTJzfZKqV6lcVI=;
 b=1Ect/09y3KsCk1DXQD+S5xaVcP64OxunEK/8vrWu01zDUCTKJCjmrnEd7KLJllDZgBz7HFhT4VHPu6MiAdXsPMfiKWxxTocazk7NP2bEki2dC9+EzxwTbWxStkIuMTO//i9VU3x+ccusGcUCg4d4mqcInBmtMBNURPtF/MPSpOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by PH7PR12MB6417.namprd12.prod.outlook.com (2603:10b6:510:1ff::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 23:16:25 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db%5]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 23:16:25 +0000
Message-ID: <01cad0cf-9937-8699-6df3-7d5dfa681922@amd.com>
Date: Wed, 22 Jun 2022 18:16:20 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Alistair Popple <apopple@nvidia.com>
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
 <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
 <7605beee-0a76-4ee9-e950-17419630f2cf@redhat.com>
 <ddcebcc1-fb0a-e565-f14d-77c9d48f2928@amd.com>
 <6aef4b7f-0ced-08cd-1f0c-50c22996aa41@redhat.com>
 <65987ab8-426d-e533-0295-069312b4f751@amd.com>
 <34e94bdb-675a-5d5c-6137-8aa1ee658d49@redhat.com>
 <87letq6wb5.fsf@nvdebian.thelocal>
 <643c44e7-48be-375b-c7ab-6a30b5ee2937@redhat.com>
 <f5b9f777-85a2-9c38-17f3-0c9be1eeb867@amd.com>
 <01cf9f24-d7fc-61e9-1c28-85dc5aabe645@redhat.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <01cf9f24-d7fc-61e9-1c28-85dc5aabe645@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0312.namprd03.prod.outlook.com
 (2603:10b6:610:118::21) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aac52e99-ac53-4247-459f-08da54a53a73
X-MS-TrafficTypeDiagnostic: PH7PR12MB6417:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB6417816D5213AD7B47E6BC51FDB29@PH7PR12MB6417.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qu6/whOlGVIZDT8CfAP7EolW30o4jzVpS6IjeZSiiKfkufAfc6i6A2vyMlHeb2D1mOlpTbQSa2l9SiR0bs9d9htoss4lTbUXN2eW4iEnQd/heIjGAptCPn0Ow8YFT1zSShkuDhyBZpqEP8uSGt9XohDcrCUGeJLfSRfeEQ/vZ23XqLBmTs6ZAkrJZmj0/tcA0PLlmiZutB2ofQVWs5248rpyZ6CDjAyj04dx2qlDPx8cPx0SdvXCWrJ2c5l5P7Lm/TAEiqT8FdgBW5GvnTRu4k8CR6cEt6Z5NHR7Pq6PE8VIb6Dt0/n2kuIctplPfh5Njy0KoD9zrYHY2pujGWe+5yg2kkGK+dEv3bc+JTuenTb6XeIYZEsRX6EudqfwmsBnNkxnHjy2VyAjbm8cB6p0Bwvx7Sqv5k475P98xN4GkO4t7f2maaeuoc7xrZiFMf7CHWVwcmE5W6kurVwz/pJQRUmZvVdlS29IidzBVSHmMgEtNevgzIbGA5qPbzsVoZzbl+QEBLthsU9/aetwqivaqh0gbn/u7c1rXFYuidbAZyF46WOFquFeRp17WurwBDS4J8S8FK4vFuJUNMZvG0HkE3xMk6jpL6axpZWxXd3UzZDzA5xSKK44oI8p0xxnPMqah/NBd+G7i+z0G82BgOBMFceUDc6MtYNSrig1ahdXuRmzGStfqKQYF/6Z//u9qA2JFqSy/tJqlZa6U2OT0qtntVGn4KD9KXOAGSf4vHT3ppxTL0zYMDgQMcE8hQpXvjzpf3DczRNeyiymX2VQUm+t/FLAOZQZPE4WslUJ5lYKQ7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(6486002)(31696002)(66946007)(38100700002)(8936002)(4326008)(66556008)(2906002)(66476007)(478600001)(30864003)(5660300002)(186003)(8676002)(83380400001)(31686004)(2616005)(6506007)(6666004)(316002)(7416002)(110136005)(36756003)(45080400002)(86362001)(53546011)(41300700001)(6512007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzBhTmZBdnRUNS90N3pCQ0lXQVliQm9xVlpBZk9zclRLYlpEbkc2L0RBUWpZ?=
 =?utf-8?B?VlVXZXg4ZUFobFZOS2dBdnA4d3l1MXVVYWxmTG1LSCsvVko1NXpSSTcwaElS?=
 =?utf-8?B?dUM5TVRNN0tYb1VxWGd0bGcrcENZUlRES3dpTWRiMXZwWU5qaFdZQ3huTlhJ?=
 =?utf-8?B?dEpkSnVkQlI0U21wM20zMVBFK3pEdGs1WFNFRmpXTEllQS81OWZaQ3RDdFJs?=
 =?utf-8?B?L3pibk5qbVZXb0x2dVJXbjBQOEVHS0I5WHY0dWZwRXk3VTIrV21PU0UvZkJE?=
 =?utf-8?B?ZFkxdnlXcWNKbHhVN0tKdUNuVnl1QW1BNnByZGw1a2J3TUlYSHN1c2JnU2R1?=
 =?utf-8?B?VzhRdE5JajNLSVNwcHlGQW5oeXBTckZZQnNDYnVwNnJ4QmtBenNIbnAxbW4w?=
 =?utf-8?B?TE9tVUI3eVMrV0ExMFExWTZEbUVsZWZDNGNlQncrbmJqWXhHSW80SlpDWkV0?=
 =?utf-8?B?TXpNTkM4ZEVZWTVDTHJWN3F1TlNpTTVMRVhLQjhac21tNytzV2xETlgycTVS?=
 =?utf-8?B?TUJraTFjQ3I3Zms0cDBRU2NidkpHNzlOZEdhdDdGVm9FN3lNQlhLVmJyNFBD?=
 =?utf-8?B?RXBCMkM0b3VLZytCOVROQzVtd05zM2xEcGVwUVZPaHRzMENsTTNBQkNDM1Y4?=
 =?utf-8?B?ZDhLVWx0R0VBTnJ5ZGZyRnlIbjYvdk9GaG9tU3d0aHI4QmtGbkZxNjRnR0xk?=
 =?utf-8?B?OUFLU2JGV1crNGZ6YXVBWGJ3aWlmczM1dHYyTStxVnlvd1VwVmdxdjdSMjMw?=
 =?utf-8?B?SU4yK0VhaGErOUh2UXZXVGJTbTZxVXZHY1JmeUFrbTBWLzkxREZjd3IrUnE2?=
 =?utf-8?B?ZEs3WnlMMDdkR2ttZzZrcmVWNXlZdjREdWxPR0VoOG45dW1HOHh6anhrN25E?=
 =?utf-8?B?VU82Mk45Nlg3NDBmZEJtSVAwZCtEaUVPU2VTcTRxSkhiS09vRDNWYTJjbFJJ?=
 =?utf-8?B?bnBYTS9NYkY1aVlXWVprcUJnYkowUVlmTkVDQXdYUUJ0dDB3SEkwUUI4K3JL?=
 =?utf-8?B?cnJESFdqcGt2M0l1RXNqM3Q2Y2p1WTN5Q3FabWRkZVgxd2RGb3lNN0wxSDlC?=
 =?utf-8?B?VjBxUmdFZGlFRVdXb3NBb3dsUGFkOHNNa0hRYmVJaGlhSEoyTTZhVmFlOHNP?=
 =?utf-8?B?STBEellDSkZsNS9jUjNQVEZkQUFtQTlScnVJSXpxb2hyS0VhdEh1WStXV1Yx?=
 =?utf-8?B?eStoZzdwbzJXT3RRY1ZyR2hoYlg4SUdyWEw3ZFcwUURJN2NMZGZ0bENZWm5W?=
 =?utf-8?B?WXNIM3U5WThkaTJYNFBPdnFuaE5QVHNBQlpnVHYxNnkwWjg2TFRldkVBZjZ0?=
 =?utf-8?B?c1hyN0VDbTl3clNJSnpkZldBNnlYbXVhWXZiSUozNXIwa2NXSkxMWGxNeUsw?=
 =?utf-8?B?a0Nmc3BkWGtTeitjamliU1JqQkpCbythVW9lTW5UaERCanBBK1FpSFBxOEFC?=
 =?utf-8?B?MWJFZm5nTzdycHFjSzdGaUdTZGxOdkM0U3lsb1hueXlmdnU3bUtQOC9hZHBI?=
 =?utf-8?B?NTlJSS9IbHd4THJia3BiWDZFa1ZjZVJVdVRhVVBuTHMvemtzR0RrVG41a2FQ?=
 =?utf-8?B?QVV3REUxVEVBRFgrc05VbytPMlRJU2VxRHAxb29qd2h6WGw1bDk2ZU9GbXZE?=
 =?utf-8?B?ZGpNb1ZCd3l4cm9OYnl0dm9UU3h0T2hSZlZNU050aFE5VThic0dUbWdKOElz?=
 =?utf-8?B?OVRIbDVLWDBrelVxZjN2cVl4RG0zMTRXVjIxNzA0QzdIUjlObXFRWmF6UkU2?=
 =?utf-8?B?VXNwN1FJZFNzZjZyelNBK0hPeTB4ai9nZGdxSUtEWVF6Z3RWd24rMzFkUlVX?=
 =?utf-8?B?K2gyQWpKVGwyWmtFUzFBR256RTVuRGtSazZCTXkyVnlSQVJ1anZnT3VQYWhp?=
 =?utf-8?B?UUl0STFaenRQZHZwR1I3V2JKNndTTktIOVVkNkxGaDVSOWZqS2pxbEVVeFRQ?=
 =?utf-8?B?ZTJPalRzTzYrZ2RwYXMrbEkrTTVKM3YwKzJCTHJRaVBwNGl0ekFqWXQ3WG5j?=
 =?utf-8?B?TXp4dHNOeDBIWG5CQlNQMnhxMVlKc2NaWTQ4bVhLbXdMTXpBeUhZVExtdjI4?=
 =?utf-8?B?K3BVRklDVG5LVERsd3hxU3NpWjlyVnJ1aXNDMTRYTGtyc1NKSkdnWHBnMkpi?=
 =?utf-8?B?blJpS0tad2FGUEU4TDNkQ2JsYWJpUVVBdmhWbEhnQ0l3WFE1RGFQZnd0MVJt?=
 =?utf-8?B?TEpqQzJpbThxVDlRZHVGcGhLMnRydU1INzAxamRxOERjRUVuTC8rNGMwWm5N?=
 =?utf-8?B?MkVzak10YjVSa3lrKzY4MEM2SjBPc3NNM2hwZWhYbjlsalVqdGpoNU9vN010?=
 =?utf-8?B?U29BSDdzRmNoNlZObmZacmo3cytqcndpOW5zSytoK0ZTT2cvRk8wQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac52e99-ac53-4247-459f-08da54a53a73
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 23:16:25.5035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Ebd2RRWtpGyo37LIFaL/F/uT9k+zJzDAChQY93+g47GxNxleJlxC4Ulg6U2HzykwYIRUd85Hy0JvhelpFD2/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6417
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
Cc: rcampbell@nvidia.com, willy@infradead.org,
 Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/21/2022 11:16 AM, David Hildenbrand wrote:
> On 21.06.22 18:08, Sierra Guiza, Alejandro (Alex) wrote:
>> On 6/21/2022 7:25 AM, David Hildenbrand wrote:
>>> On 21.06.22 13:55, Alistair Popple wrote:
>>>> David Hildenbrand<david@redhat.com>  writes:
>>>>
>>>>> On 21.06.22 13:25, Felix Kuehling wrote:
>>>>>> Am 6/17/22 um 23:19 schrieb David Hildenbrand:
>>>>>>> On 17.06.22 21:27, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>>>> On 6/17/2022 12:33 PM, David Hildenbrand wrote:
>>>>>>>>> On 17.06.22 19:20, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>>>>>> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
>>>>>>>>>>> On 31.05.22 22:00, Alex Sierra wrote:
>>>>>>>>>>>> Device memory that is cache coherent from device and CPU point of view.
>>>>>>>>>>>> This is used on platforms that have an advanced system bus (like CAPI
>>>>>>>>>>>> or CXL). Any page of a process can be migrated to such memory. However,
>>>>>>>>>>>> no one should be allowed to pin such memory so that it can always be
>>>>>>>>>>>> evicted.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Alex Sierra<alex.sierra@amd.com>
>>>>>>>>>>>> Acked-by: Felix Kuehling<Felix.Kuehling@amd.com>
>>>>>>>>>>>> Reviewed-by: Alistair Popple<apopple@nvidia.com>
>>>>>>>>>>>> [hch: rebased ontop of the refcount changes,
>>>>>>>>>>>>            removed is_dev_private_or_coherent_page]
>>>>>>>>>>>> Signed-off-by: Christoph Hellwig<hch@lst.de>
>>>>>>>>>>>> ---
>>>>>>>>>>>>       include/linux/memremap.h | 19 +++++++++++++++++++
>>>>>>>>>>>>       mm/memcontrol.c          |  7 ++++---
>>>>>>>>>>>>       mm/memory-failure.c      |  8 ++++++--
>>>>>>>>>>>>       mm/memremap.c            | 10 ++++++++++
>>>>>>>>>>>>       mm/migrate_device.c      | 16 +++++++---------
>>>>>>>>>>>>       mm/rmap.c                |  5 +++--
>>>>>>>>>>>>       6 files changed, 49 insertions(+), 16 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>>>>>>>>> index 8af304f6b504..9f752ebed613 100644
>>>>>>>>>>>> --- a/include/linux/memremap.h
>>>>>>>>>>>> +++ b/include/linux/memremap.h
>>>>>>>>>>>> @@ -41,6 +41,13 @@ struct vmem_altmap {
>>>>>>>>>>>>        * A more complete discussion of unaddressable memory may be found in
>>>>>>>>>>>>        * include/linux/hmm.h and Documentation/vm/hmm.rst.
>>>>>>>>>>>>        *
>>>>>>>>>>>> + * MEMORY_DEVICE_COHERENT:
>>>>>>>>>>>> + * Device memory that is cache coherent from device and CPU point of view. This
>>>>>>>>>>>> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>>>>>>>>>>>> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>>>>>>>>>>>> + * type. Any page of a process can be migrated to such memory. However no one
>>>>>>>>>>> Any page might not be right, I'm pretty sure. ... just thinking about special pages
>>>>>>>>>>> like vdso, shared zeropage, ... pinned pages ...
>>>>>>>>> Well, you cannot migrate long term pages, that's what I meant :)
>>>>>>>>>
>>>>>>>>>>>> + * should be allowed to pin such memory so that it can always be evicted.
>>>>>>>>>>>> + *
>>>>>>>>>>>>        * MEMORY_DEVICE_FS_DAX:
>>>>>>>>>>>>        * Host memory that has similar access semantics as System RAM i.e. DMA
>>>>>>>>>>>>        * coherent and supports page pinning. In support of coordinating page
>>>>>>>>>>>> @@ -61,6 +68,7 @@ struct vmem_altmap {
>>>>>>>>>>>>       enum memory_type {
>>>>>>>>>>>>       	/* 0 is reserved to catch uninitialized type fields */
>>>>>>>>>>>>       	MEMORY_DEVICE_PRIVATE = 1,
>>>>>>>>>>>> +	MEMORY_DEVICE_COHERENT,
>>>>>>>>>>>>       	MEMORY_DEVICE_FS_DAX,
>>>>>>>>>>>>       	MEMORY_DEVICE_GENERIC,
>>>>>>>>>>>>       	MEMORY_DEVICE_PCI_P2PDMA,
>>>>>>>>>>>> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
>>>>>>>>>>> In general, this LGTM, and it should be correct with PageAnonExclusive I think.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> However, where exactly is pinning forbidden?
>>>>>>>>>> Long-term pinning is forbidden since it would interfere with the device
>>>>>>>>>> memory manager owning the
>>>>>>>>>> device-coherent pages (e.g. evictions in TTM). However, normal pinning
>>>>>>>>>> is allowed on this device type.
>>>>>>>>> I don't see updates to folio_is_pinnable() in this patch.
>>>>>>>> Device coherent type pages should return true here, as they are pinnable
>>>>>>>> pages.
>>>>>>> That function is only called for long-term pinnings in try_grab_folio().
>>>>>>>
>>>>>>>>> So wouldn't try_grab_folio() simply pin these pages? What am I missing?
>>>>>>>> As far as I understand this return NULL for long term pin pages.
>>>>>>>> Otherwise they get refcount incremented.
>>>>>>> I don't follow.
>>>>>>>
>>>>>>> You're saying
>>>>>>>
>>>>>>> a) folio_is_pinnable() returns true for device coherent pages
>>>>>>>
>>>>>>> and that
>>>>>>>
>>>>>>> b) device coherent pages don't get long-term pinned
>>>>>>>
>>>>>>>
>>>>>>> Yet, the code says
>>>>>>>
>>>>>>> struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags)
>>>>>>> {
>>>>>>> 	if (flags & FOLL_GET)
>>>>>>> 		return try_get_folio(page, refs);
>>>>>>> 	else if (flags & FOLL_PIN) {
>>>>>>> 		struct folio *folio;
>>>>>>>
>>>>>>> 		/*
>>>>>>> 		 * Can't do FOLL_LONGTERM + FOLL_PIN gup fast path if not in a
>>>>>>> 		 * right zone, so fail and let the caller fall back to the slow
>>>>>>> 		 * path.
>>>>>>> 		 */
>>>>>>> 		if (unlikely((flags & FOLL_LONGTERM) &&
>>>>>>> 			     !is_pinnable_page(page)))
>>>>>>> 			return NULL;
>>>>>>> 		...
>>>>>>> 		return folio;
>>>>>>> 	}
>>>>>>> }
>>>>>>>
>>>>>>>
>>>>>>> What prevents these pages from getting long-term pinned as stated in this patch?
>>>>>> Long-term pinning is handled by __gup_longterm_locked, which migrates
>>>>>> pages returned by __get_user_pages_locked that cannot be long-term
>>>>>> pinned. try_grab_folio is OK to grab the pages. Anything that can't be
>>>>>> long-term pinned will be migrated afterwards, and
>>>>>> __get_user_pages_locked will be retried. The migration of
>>>>>> DEVICE_COHERENT pages was implemented by Alistair in patch 5/13
>>>>>> ("mm/gup: migrate device coherent pages when pinning instead of failing").
>>>>> Thanks.
>>>>>
>>>>> __gup_longterm_locked()->check_and_migrate_movable_pages()
>>>>>
>>>>> Which checks folio_is_pinnable() and doesn't do anything if set.
>>>>>
>>>>> Sorry to be dense here, but I don't see how what's stated in this patch
>>>>> works without adjusting folio_is_pinnable().
>>>> Ugh, I think you might be right about try_grab_folio().
>>>>
>>>> We didn't update folio_is_pinnable() to include device coherent pages
>>>> because device coherent pages are pinnable. It is really just
>>>> FOLL_LONGTERM that we want to prevent here.
>>>>
>>>> For normal PUP that is done by my change in
>>>> check_and_migrate_movable_pages() which migrates pages being pinned with
>>>> FOLL_LONGTERM. But I think I incorrectly assumed we would take the
>>>> pte_devmap() path in gup_pte_range(), which we don't for coherent pages.
>>>> So I think the check in try_grab_folio() needs to be:
>>> I think I said it already (and I might be wrong without reading the
>>> code), but folio_is_pinnable() is *only* called for long-term pinnings.
>>>
>>> It should actually be called folio_is_longterm_pinnable().
>>>
>>> That's where that check should go, no?
>> David, I think you're right. We didn't catch this since the LONGTERM gup
>> test we added to hmm-test only calls to pin_user_pages. Apparently
>> try_grab_folio is called only from fast callers (ex.
>> pin_user_pages_fast/get_user_pages_fast). I have added a conditional
>> similar to what Alistair has proposed to return null on LONGTERM &&
>> (coherent_pages || folio_is_pinnable) at try_grab_folio. Also a new gup
>> test was added with LONGTERM set that calls pin_user_pages_fast.
>> Returning null under this condition it does causes the migration from
>> dev to system memory.
>>
> Why can't coherent memory simply put its checks into
> folio_is_pinnable()? I don't get it why we have to do things differently
> here.
>
>> Actually, Im having different problems with a call to PageAnonExclusive
>> from try_to_migrate_one during page fault from a HMM test that first
>> migrate pages to device private and forks to mark as COW these pages.
>> Apparently is catching the first BUG VM_BUG_ON_PGFLAGS(!PageAnon(page),
>> page)
> With or without this series? A backtrace would be great.

Here's the back trace. This happens in a hmm-test added in this patch 
series. However, I have tried to isolate this BUG by just adding the COW 
test with private device memory only. This is only present as follows. 
Allocate anonymous mem->Migrate to private device memory->fork->try to 
access to parent's anonymous memory (which will suppose to trigger a 
page fault and migration to system mem). Just for the record, if the 
child is terminated before the parent's memory is accessed, this problem 
is not present.

patch name for this test: tools: add selftests to hmm for COW in device 
memory

[  528.727237] BUG: unable to handle page fault for address: 
ffffea1fffffffc0
[  528.739585] #PF: supervisor read access in kernel mode
[  528.745324] #PF: error_code(0x0000) - not-present page
[  528.751062] PGD 44eaf2067 P4D 44eaf2067 PUD 0
[  528.756026] Oops: 0000 [#1] PREEMPT SMP NOPTI
[  528.760890] CPU: 120 PID: 18275 Comm: hmm-tests Not tainted 
5.19.0-rc3-kfd-alex #257
[  528.769542] Hardware name: AMD Corporation BardPeak/BardPeak, BIOS 
RTY1002BDS 09/17/2021
[  528.778579] RIP: 0010:try_to_migrate_one+0x21a/0x1000
[  528.784225] Code: f6 48 89 c8 48 2b 05 45 d1 6a 01 48 c1 f8 06 48 29 
c3 48 8b 45 a8 48 c1 e3 06 48 01 cb f6 41 18 01 48 89 85 50 ff ff ff 74 
0b <4c> 8b 33 49 c1 ee 11 41 83 e6 01 48 8b bd 48 ff ff ff e8 3f 99 02
[  528.805194] RSP: 0000:ffffc90003cdfaa0 EFLAGS: 00010202
[  528.811027] RAX: 00007ffff7ff4000 RBX: ffffea1fffffffc0 RCX: 
ffffeaffffffffc0
[  528.818995] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
ffffc90003cdfaf8
[  528.826962] RBP: ffffc90003cdfb70 R08: 0000000000000000 R09: 
0000000000000000
[  528.834930] R10: ffffc90003cdf910 R11: 0000000000000002 R12: 
ffff888194450540
[  528.842899] R13: ffff888160d057c0 R14: 0000000000000000 R15: 
03ffffffffffffff
[  528.850865] FS:  00007ffff7fdb740(0000) GS:ffff8883b0600000(0000) 
knlGS:0000000000000000
[  528.859891] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  528.866308] CR2: ffffea1fffffffc0 CR3: 00000001562b4003 CR4: 
0000000000770ee0
[  528.874275] PKRU: 55555554
[  528.877286] Call Trace:
[  528.880016]  <TASK>
[  528.882356]  ? lock_is_held_type+0xdf/0x130
[  528.887033]  rmap_walk_anon+0x167/0x410
[  528.891316]  try_to_migrate+0x90/0xd0
[  528.895405]  ? try_to_unmap_one+0xe10/0xe10
[  528.900074]  ? anon_vma_ctor+0x50/0x50
[  528.904260]  ? put_anon_vma+0x10/0x10
[  528.908347]  ? invalid_mkclean_vma+0x20/0x20
[  528.913114]  migrate_vma_setup+0x5f4/0x750
[  528.917691]  dmirror_devmem_fault+0x8c/0x250 [test_hmm]
[  528.923532]  do_swap_page+0xac0/0xe50
[  528.927623]  ? __lock_acquire+0x4b2/0x1ac0
[  528.932199]  __handle_mm_fault+0x949/0x1440
[  528.936876]  handle_mm_fault+0x13f/0x3e0
[  528.941256]  do_user_addr_fault+0x215/0x740
[  528.945928]  exc_page_fault+0x75/0x280
[  528.950115]  asm_exc_page_fault+0x27/0x30
[  528.954593] RIP: 0033:0x40366b
[  528.958001] Code: 00 48 89 85 d8 fe ff ff eb 2a 48 8b 85 d0 fe ff ff 
48 8d 14 85 00 00 00 00 48 8b 85 d8 fe ff ff 48 01 d0 48 8b 95 d0 fe ff 
ff <89> 10 48 83 85 d0 fe ff ff 01 48 8b 85 40 ff ff ff 48 c1 e8 02 48
[  528.978973] RSP: 002b:00007fffffffe280 EFLAGS: 00010206
[  528.984806] RAX: 00007ffff7ff4000 RBX: 0000000000000000 RCX: 
0000000000000000
[  528.992774] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
00007ffff77ee968
[  529.000742] RBP: 00007fffffffe430 R08: 00007ffff7fdb740 R09: 
0000000000000000
[  529.008709] R10: 00007ffff7fdba10 R11: 0000000000000246 R12: 
0000000000400e30
[  529.016675] R13: 00007fffffffe630 R14: 0000000000000000 R15: 
0000000000000000
[  529.024638]  </TASK>
[  529.027074] Modules linked in: test_hmm xt_conntrack xt_MASQUERADE 
nfnetlink xt_addrtype iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 
nf_defrag_ipv4 br_netfilter ip6table_filter ip6_tables iptable_filter 
k10temp ip_tables x_tables i2c_piix4 [last unloaded: test_hmm]
[  529.053595] CR2: ffffea1fffffffc0
[  529.057296] ---[ end trace 0000000000000000 ]---
[  529.197816] RIP: 0010:try_to_migrate_one+0x21a/0x1000
[  529.197823] Code: f6 48 89 c8 48 2b 05 45 d1 6a 01 48 c1 f8 06 48 29 
c3 48 8b 45 a8 48 c1 e3 06 48 01 cb f6 41 18 01 48 89 85 50 ff ff ff 74 
0b <4c> 8b 33 49 c1 ee 11 41 83 e6 01 48 8b bd 48 ff ff ff e8 3f 99 02
[  529.197826] RSP: 0000:ffffc90003cdfaa0 EFLAGS: 00010202
[  529.197828] RAX: 00007ffff7ff4000 RBX: ffffea1fffffffc0 RCX: 
ffffeaffffffffc0
[  529.197830] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
ffffc90003cdfaf8
[  529.197831] RBP: ffffc90003cdfb70 R08: 0000000000000000 R09: 
0000000000000000
[  529.197832] R10: ffffc90003cdf910 R11: 0000000000000002 R12: 
ffff888194450540
[  529.197833] R13: ffff888160d057c0 R14: 0000000000000000 R15: 
03ffffffffffffff
[  529.197835] FS:  00007ffff7fdb740(0000) GS:ffff8883b0600000(0000) 
knlGS:0000000000000000
[  529.197837] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  529.197839] CR2: ffffea1fffffffc0 CR3: 00000001562b4003 CR4: 
0000000000770ee0
[  529.197840] PKRU: 55555554
[  529.197841] note: hmm-tests[18275] exited with preempt_count 1

Regards,
Alex Sierra

>
