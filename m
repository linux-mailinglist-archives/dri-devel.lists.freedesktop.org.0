Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED27553766
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 18:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFE010E2DA;
	Tue, 21 Jun 2022 16:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625B110E2DA;
 Tue, 21 Jun 2022 16:08:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oECKY0rh9j169i+rr/2rQDHCwCTnsUTGzgsInPxB02Bgr7gR0zmYqpiVGcIs11jXLBg/yOQW0k3Qvm6kHLdp70+3iqRF7pJ3YIRlQLwoHaugY05GH+iA2BUP0THxWYG/5VXwTXw/0dJS10PSpX6ZSmZj8VxKPaDSLq8ZjIhriDwFr2H8bZ/BqcHwHp42nnjiQc66LYkFtCpJjbTxaPir+dT+5NehFk//whDkGwkRJUAEn2rL6Wj/4ZDLRjY2tYcNSSkPzZ3wPqmYD6W6VNYIl88ATj8caWw5cofJR6LtH3CAIYJy/o9KTbC2SK/H5vjEotZEDMBdippahBnwVb+18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APJDdO65p4hUS9zgSTcPzaiUDEXFV4gjEnJBWmRUH6c=;
 b=EY1xx5Qnfd3Q8ey5j9I/N85QqiemVgOrEa8ihTc7At9eAJy3EjpGJtRy8oKNCTqVBUj0MoLijhyCjQnQvvW6cgpCG8p7hAcG4nkmDEtlwHDDpxX1KUs9Cp5Sc6yeAYNvV16WMp/L/JoXX4t79DMVfOBNVWfLdg9bdY9k3Rfr/tmBDJuZVFRU41whLcfe84SsjJQFZE97p+DqxDABASzQDElcc7e47yAHvJ7wUzQR8hu5/0jNvHB+JCycqgUagiZwoAJQzi+DDeXt1vMsWWSfj912wKQy1B4H+kUUqsHU1xoRXiJvAfsKkJniCm/DsnsyZRx3peNWKtE05qOPQoWlzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APJDdO65p4hUS9zgSTcPzaiUDEXFV4gjEnJBWmRUH6c=;
 b=UoFBqhqAb+k2WZm0wEj6WchAxpAz7swV5UEg1BL2+Ha88ovY76hH4IO3ArqAvwsCE1G7whkR56wta8lcZPRh/gJfLfuPPZwKtVKS34uwLUJ8NPOIwRYE4hZgj2qpJkHONceAVSYy/F6zZHj1p05oNT1bWxT3SLkiBhxp9oc8wsU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by IA1PR12MB6234.namprd12.prod.outlook.com (2603:10b6:208:3e6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Tue, 21 Jun
 2022 16:08:48 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db%5]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 16:08:48 +0000
Message-ID: <f5b9f777-85a2-9c38-17f3-0c9be1eeb867@amd.com>
Date: Tue, 21 Jun 2022 11:08:42 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
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
Content-Language: en-US
In-Reply-To: <643c44e7-48be-375b-c7ab-6a30b5ee2937@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:208:23d::16) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e10a1933-f369-4c26-c779-08da53a05331
X-MS-TrafficTypeDiagnostic: IA1PR12MB6234:EE_
X-Microsoft-Antispam-PRVS: <IA1PR12MB62343776F6CB5C287707B975FDB39@IA1PR12MB6234.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9yeqJ8EaXuex8XZP46Wob14eaJe33Fdjofe2PjUdwT+XMDpfwfflK/UcIdvzwrcxOWgJfuWofEK6F2KY6kqMkLTepOLyCZ66uuBPCXRa79UYps1Dyj0+hGmkUNvDjICOkxl+IBInKZ1dcBy79rda0zpEYzIe+EzWA9rhVY1zbNmlKwcWhdqgYgjdE2yHoyvmMWJlRG5xHkDEvixCmLkYLonHxidGjFPfWsgW/prVF1Gq9CdMc3qyuZknGnEASu0T1OMlgxvYyJqMrq17PQciyVN7GpWuLd/pJH7FOt9cicUN+mOwS4AHkaIfU2Z8EjUDUQBgnSfejxnDXUyoRdu/RXIpcV0rjjctE5QDAGchPNJE4puhAWDny2hMEpKLjM7ycOXjtPAJyv9da/VCvS9UhllYbIg9ziRwRnJNMk6mB5bY5312Yi9y2uEIdGyb6LVz0J2A4lEDAuh0ZTxkwaYMeAUxBlaIeFWhwnJgWvs8W0YPejz3Hj0/IXvCn8RCgVo4aR+Tw8lWUxQaHi46BO49lM4kzUtgoW0K/J1x3AhSGx5AmurjJqkZqLpzz1112xizqXtRA7QOZGWLktGhM/46zPxyk+SLdstz3skM/Ys74W0t6f8zPU0Sstv1U0KNW2MX97OQuyb9T5b5UVOqZWID3MJ4OP2eOiA7cRfPVw9zX37pJdd1G/UKoQQO0NBh7KDDBcsbZj61VNVrgDMGs+T9BzQaS4jKaosLbIhHgtHo+EQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(31686004)(36756003)(4326008)(66946007)(8936002)(6486002)(7416002)(110136005)(5660300002)(478600001)(83380400001)(66476007)(2906002)(316002)(8676002)(66556008)(86362001)(26005)(2616005)(41300700001)(186003)(31696002)(53546011)(6506007)(6666004)(38100700002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVp1SlF4VXVINzkrbFE0Sjd4bnU5bHp4YnRER3hML2tRWWNmWEQwY3l2QjZl?=
 =?utf-8?B?Y2hPWkxLamxPbDNLU0o4Y1N4MDVoR295dmludDgrQnYwUnpEV2RqU1NoQUx5?=
 =?utf-8?B?bmRWRWZRTEttbDNkWEVOdFJUVUNlakdTTmMzaHBZN3NXbEJTQTFiRU1aT0k5?=
 =?utf-8?B?bmZ0eEg1aUZoUzg1bWZZRnRZR292c0xNdmtwdFNvZlRRL0tPc2wyYTFiemlt?=
 =?utf-8?B?cVlaVG51MXpIQ1c4anB0SmpYTUNtdG9MVGduZG0zQy9JL1lGaUhFZ0Y5Z2hn?=
 =?utf-8?B?elFBejFNck1nMVYyZVVZSjVCcGNNbjZqZzNaMHJ3R2pVazlwRk8vcUQ3c0JG?=
 =?utf-8?B?MGhKMEk3ZEFmc2pNUWpISDZBVGsvSmtjTmdQYmZOTDV0cFllaVBFQ2wvalJH?=
 =?utf-8?B?Um9XcG1BWUl3bkt0V3BGbGpHbnhObmVtZG9JQzNYaDZpdWtjdmRiR3V0dklp?=
 =?utf-8?B?WHNRVXhpOTNrT1p0NEl4VkJvMGFLKzlqSXVOWU1PbE12YWlzbXBBVithT1NK?=
 =?utf-8?B?UWJwK2dKaFVyWHRvaFpTbk9NVkRYKy9oZHl5TVgvb3J4emFVeHlzVDc2SnY5?=
 =?utf-8?B?T05QYldTVHFsMCs4WG5hcjhubE1NSm9MTUwyQWt1UmhVNnhZUTZBaHRlN2J6?=
 =?utf-8?B?K0xNUzdEQXRUSUFGcm1XcTJVZXBjazZQRlZnU2NnclRoTjk5bTExZTBzUHhl?=
 =?utf-8?B?ZkM2UlhkN05lWGdGeUNjU2VYaTVoQU9scy9NdDBzYzNQcnVEUGhNdHRaeFE0?=
 =?utf-8?B?c1VLd1ZpV3V3NzR5UWVpcjd2ek5TcHB0OXNrWDMwYXFXMUphM1d1bEtKZFA3?=
 =?utf-8?B?QTIwTzgyMERqTEFDODg5c0JYOXJlVFVGcGhEZGo1OHRUYUQycERDcUFVWVhH?=
 =?utf-8?B?NjlkbUZkZWEwaVludlRkTUpUenR2UmlqaHp6TitmTGRJeWRHbDNZOGZyRE4y?=
 =?utf-8?B?ZWNMcGs3RjNVUXF6V2lkRkVRdzV4RlpEVUtYakxHREZjQ3NhK0JSOG01WFdp?=
 =?utf-8?B?L294OVZkVk9pbXVQOEI3c0pua2g0TCtqR29DQkMyQ2NGUGVNRi9QaHo5Wi94?=
 =?utf-8?B?SHRnNUU0S1JBTkh4MTFCa3Rsb2RIZmg4UXRkY1JtSEpabk5IOFpNNkcydFJF?=
 =?utf-8?B?Zmwwb01QUFU0NzlxZjYyTEpNakd5ZnJma0xUTS9YNXRMWHQ3TUZVNkFVTHFm?=
 =?utf-8?B?VlJNSnFEWkNCN2Yrc3pwMjJKOXJ5REhpU3B0dHg4V1FpZzlCUnpQSXJFcnAw?=
 =?utf-8?B?RFZ1clVJSmplVFlGZEFVM2tyK09CRmdiUjExS08yNDZzWFovZUM3eHoxZ2pC?=
 =?utf-8?B?VU1qWHN2b0dLMW8xQWo4Z2dsQ2dNdUxGMkdScjRzYkZDSHpZU2tUZmU2UGY5?=
 =?utf-8?B?UWtRYnUxMDJncUNrOTdET1huSkxvTE84Szk5QVpaWnRpb1BkemR3cDFCOFJ2?=
 =?utf-8?B?VU95N3pwNjJ3a3g1cnZwRGRoeS9LRHZFZnNEdzdtSmo2eGlWTnJmaHRzTW52?=
 =?utf-8?B?SzNoSDdEYStwdW1jcG9zNWV5RUdNcWVtUk8zMVVkMXVhbllrRllhUzJ3akY1?=
 =?utf-8?B?d0tRRE9KR0d4LzA4enorWGtveGh5M0lKbUhEVGVOdkN1Zy8yVm16dkRzcDFh?=
 =?utf-8?B?WGdFOWxPakhoNloyTWtra2JRUmQ3YlVBS3AwMmltM3NBZzB3aUk1NlZ2aGMx?=
 =?utf-8?B?ZGtRalNGK2I2Q1NPOGV1citiR0JiMmNwNEVUMnc3RVpPZk5LdTJjRm9NdHc3?=
 =?utf-8?B?MitEOElzWnhFTjFkbElOeUF5ZllORVl4YXVsYWJUTS84RTFmam9seEYrWE82?=
 =?utf-8?B?V2FqQzNob28vK0hpeE5tWkkvMko5OGcwUHk3UDRiTXJxSjVvUjdRTHk5MWVG?=
 =?utf-8?B?eG4yK1BJbDROcDhGREM2M0FFYTB1RTNuU2ZwSFd4VlFpc0Ura2cvT2xxZGNU?=
 =?utf-8?B?UEdQaFZwbG9BTHZqNjhVaHNjTTZrbWJXdFovRFpKUFBGL0F2V2UyV1VUc0I5?=
 =?utf-8?B?LzNodVgrRE1CN0hSdStjUWY0akVTMkdVVGcySzV4Qk1oNE1YM0RPQk1veGxN?=
 =?utf-8?B?WXJOcE1NZmlsVkVRS0hqNEFIU2pNbGYrSE15ZnJXMkl1VlpNNDdwUDVJb1Fl?=
 =?utf-8?B?ZVBQSy9TTFlGaDQrNTl4cU5mUnJzVVlMaTlSRkZpWWE4SEo3Zzh0RW9SR2wv?=
 =?utf-8?B?b2NoVkdQWmtjVXYrSDhFcnBxNE5hU1ZIc3JaYXN1elBBaTg3SkJRUzlCZmpY?=
 =?utf-8?B?RWVzNUhiT2p4dFl1Z1NyR2hscnFKVnhuank4bUM1S3RmdHRycWE3ZGU1SmZT?=
 =?utf-8?B?QlF2TGM1dFdWdThWUndnMGI0VWxuQkNTbkgwdm9Rc2c1RjgveWx2dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e10a1933-f369-4c26-c779-08da53a05331
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 16:08:48.3709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ceTAs9QiLq5Fx23MD0J+KYIKVItn6S2E9lB4QoGJMZ8NAbyDjFzx7zfX2Pi0n2oZOpfhhkrBTPfHeIfEE2+zIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6234
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


On 6/21/2022 7:25 AM, David Hildenbrand wrote:
> On 21.06.22 13:55, Alistair Popple wrote:
>> David Hildenbrand<david@redhat.com>  writes:
>>
>>> On 21.06.22 13:25, Felix Kuehling wrote:
>>>> Am 6/17/22 um 23:19 schrieb David Hildenbrand:
>>>>> On 17.06.22 21:27, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>> On 6/17/2022 12:33 PM, David Hildenbrand wrote:
>>>>>>> On 17.06.22 19:20, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>>>> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
>>>>>>>>> On 31.05.22 22:00, Alex Sierra wrote:
>>>>>>>>>> Device memory that is cache coherent from device and CPU point of view.
>>>>>>>>>> This is used on platforms that have an advanced system bus (like CAPI
>>>>>>>>>> or CXL). Any page of a process can be migrated to such memory. However,
>>>>>>>>>> no one should be allowed to pin such memory so that it can always be
>>>>>>>>>> evicted.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Alex Sierra<alex.sierra@amd.com>
>>>>>>>>>> Acked-by: Felix Kuehling<Felix.Kuehling@amd.com>
>>>>>>>>>> Reviewed-by: Alistair Popple<apopple@nvidia.com>
>>>>>>>>>> [hch: rebased ontop of the refcount changes,
>>>>>>>>>>           removed is_dev_private_or_coherent_page]
>>>>>>>>>> Signed-off-by: Christoph Hellwig<hch@lst.de>
>>>>>>>>>> ---
>>>>>>>>>>      include/linux/memremap.h | 19 +++++++++++++++++++
>>>>>>>>>>      mm/memcontrol.c          |  7 ++++---
>>>>>>>>>>      mm/memory-failure.c      |  8 ++++++--
>>>>>>>>>>      mm/memremap.c            | 10 ++++++++++
>>>>>>>>>>      mm/migrate_device.c      | 16 +++++++---------
>>>>>>>>>>      mm/rmap.c                |  5 +++--
>>>>>>>>>>      6 files changed, 49 insertions(+), 16 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>>>>>>> index 8af304f6b504..9f752ebed613 100644
>>>>>>>>>> --- a/include/linux/memremap.h
>>>>>>>>>> +++ b/include/linux/memremap.h
>>>>>>>>>> @@ -41,6 +41,13 @@ struct vmem_altmap {
>>>>>>>>>>       * A more complete discussion of unaddressable memory may be found in
>>>>>>>>>>       * include/linux/hmm.h and Documentation/vm/hmm.rst.
>>>>>>>>>>       *
>>>>>>>>>> + * MEMORY_DEVICE_COHERENT:
>>>>>>>>>> + * Device memory that is cache coherent from device and CPU point of view. This
>>>>>>>>>> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>>>>>>>>>> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>>>>>>>>>> + * type. Any page of a process can be migrated to such memory. However no one
>>>>>>>>> Any page might not be right, I'm pretty sure. ... just thinking about special pages
>>>>>>>>> like vdso, shared zeropage, ... pinned pages ...
>>>>>>> Well, you cannot migrate long term pages, that's what I meant :)
>>>>>>>
>>>>>>>>>> + * should be allowed to pin such memory so that it can always be evicted.
>>>>>>>>>> + *
>>>>>>>>>>       * MEMORY_DEVICE_FS_DAX:
>>>>>>>>>>       * Host memory that has similar access semantics as System RAM i.e. DMA
>>>>>>>>>>       * coherent and supports page pinning. In support of coordinating page
>>>>>>>>>> @@ -61,6 +68,7 @@ struct vmem_altmap {
>>>>>>>>>>      enum memory_type {
>>>>>>>>>>      	/* 0 is reserved to catch uninitialized type fields */
>>>>>>>>>>      	MEMORY_DEVICE_PRIVATE = 1,
>>>>>>>>>> +	MEMORY_DEVICE_COHERENT,
>>>>>>>>>>      	MEMORY_DEVICE_FS_DAX,
>>>>>>>>>>      	MEMORY_DEVICE_GENERIC,
>>>>>>>>>>      	MEMORY_DEVICE_PCI_P2PDMA,
>>>>>>>>>> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
>>>>>>>>> In general, this LGTM, and it should be correct with PageAnonExclusive I think.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> However, where exactly is pinning forbidden?
>>>>>>>> Long-term pinning is forbidden since it would interfere with the device
>>>>>>>> memory manager owning the
>>>>>>>> device-coherent pages (e.g. evictions in TTM). However, normal pinning
>>>>>>>> is allowed on this device type.
>>>>>>> I don't see updates to folio_is_pinnable() in this patch.
>>>>>> Device coherent type pages should return true here, as they are pinnable
>>>>>> pages.
>>>>> That function is only called for long-term pinnings in try_grab_folio().
>>>>>
>>>>>>> So wouldn't try_grab_folio() simply pin these pages? What am I missing?
>>>>>> As far as I understand this return NULL for long term pin pages.
>>>>>> Otherwise they get refcount incremented.
>>>>> I don't follow.
>>>>>
>>>>> You're saying
>>>>>
>>>>> a) folio_is_pinnable() returns true for device coherent pages
>>>>>
>>>>> and that
>>>>>
>>>>> b) device coherent pages don't get long-term pinned
>>>>>
>>>>>
>>>>> Yet, the code says
>>>>>
>>>>> struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags)
>>>>> {
>>>>> 	if (flags & FOLL_GET)
>>>>> 		return try_get_folio(page, refs);
>>>>> 	else if (flags & FOLL_PIN) {
>>>>> 		struct folio *folio;
>>>>>
>>>>> 		/*
>>>>> 		 * Can't do FOLL_LONGTERM + FOLL_PIN gup fast path if not in a
>>>>> 		 * right zone, so fail and let the caller fall back to the slow
>>>>> 		 * path.
>>>>> 		 */
>>>>> 		if (unlikely((flags & FOLL_LONGTERM) &&
>>>>> 			     !is_pinnable_page(page)))
>>>>> 			return NULL;
>>>>> 		...
>>>>> 		return folio;
>>>>> 	}
>>>>> }
>>>>>
>>>>>
>>>>> What prevents these pages from getting long-term pinned as stated in this patch?
>>>> Long-term pinning is handled by __gup_longterm_locked, which migrates
>>>> pages returned by __get_user_pages_locked that cannot be long-term
>>>> pinned. try_grab_folio is OK to grab the pages. Anything that can't be
>>>> long-term pinned will be migrated afterwards, and
>>>> __get_user_pages_locked will be retried. The migration of
>>>> DEVICE_COHERENT pages was implemented by Alistair in patch 5/13
>>>> ("mm/gup: migrate device coherent pages when pinning instead of failing").
>>> Thanks.
>>>
>>> __gup_longterm_locked()->check_and_migrate_movable_pages()
>>>
>>> Which checks folio_is_pinnable() and doesn't do anything if set.
>>>
>>> Sorry to be dense here, but I don't see how what's stated in this patch
>>> works without adjusting folio_is_pinnable().
>> Ugh, I think you might be right about try_grab_folio().
>>
>> We didn't update folio_is_pinnable() to include device coherent pages
>> because device coherent pages are pinnable. It is really just
>> FOLL_LONGTERM that we want to prevent here.
>>
>> For normal PUP that is done by my change in
>> check_and_migrate_movable_pages() which migrates pages being pinned with
>> FOLL_LONGTERM. But I think I incorrectly assumed we would take the
>> pte_devmap() path in gup_pte_range(), which we don't for coherent pages.
>> So I think the check in try_grab_folio() needs to be:
> I think I said it already (and I might be wrong without reading the
> code), but folio_is_pinnable() is *only* called for long-term pinnings.
>
> It should actually be called folio_is_longterm_pinnable().
>
> That's where that check should go, no?

David, I think you're right. We didn't catch this since the LONGTERM gup 
test we added to hmm-test only calls to pin_user_pages. Apparently 
try_grab_folio is called only from fast callers (ex. 
pin_user_pages_fast/get_user_pages_fast). I have added a conditional 
similar to what Alistair has proposed to return null on LONGTERM && 
(coherent_pages || folio_is_pinnable) at try_grab_folio. Also a new gup 
test was added with LONGTERM set that calls pin_user_pages_fast. 
Returning null under this condition it does causes the migration from 
dev to system memory.

Actually, Im having different problems with a call to PageAnonExclusive 
from try_to_migrate_one during page fault from a HMM test that first 
migrate pages to device private and forks to mark as COW these pages. 
Apparently is catching the first BUG VM_BUG_ON_PGFLAGS(!PageAnon(page), 
page)

Regards,
Alex Sierra

