Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFB9556ED0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 01:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEEA10E98F;
	Wed, 22 Jun 2022 23:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F024610E98F;
 Wed, 22 Jun 2022 23:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XF4iIxa0cv/pOo9EPEclopHihq7DO7eepny9io47gWSEJY2CBdZTGwJ5XsgdFOLQiBtFhAxHKC23UO+Zuh4MdiRpR5KPO9e57GuyryW0QI+kinDRp95GI3cWMzbBsl9FzCTQ93RPfKKN9UctGqpy6lvULELlEidAeVMCGrYXwuFp5AqJLV9og0RL3Cf75tNydDY1GXiGiXwbRfuaFyB3wsTTw/Wj5UxpQvFaU88uIJNrBpE2xtjQmXxNN2bnsgPLHOBByQNO/sXoUWCKgV6ENj/3CJUrylNkJlzJB56d1L7jiSlsCIshddDYcno/CkqNhhSxgfb0ayyiJDP0W1UxVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAai6S6dseGWGlLSzYIQJ/7Vi/LOmOi5K6YTdG4Digs=;
 b=aUyU3A2foW9dU1FCslj5/l/JHkoWa69TWzaDHdn29sx8mzU6MbJuZjYk8eqo7/QtMlm2RtP7um1JAtd7eLQaSxlOwseYYB2yaPUZU1ymxS0dLVMceq4g9hKMcI0FEBFwmzZzHV7L6c+Wb6oClqDITarm5Y50i2MmH1uNpceI4IVM2MSZtel+Vu/Eqo5cpdBDQLfyNThXOrdTMj9UBsYUR8iU7GNYOCjoHEd/9rEfNC4RFk2osadmeeevHUDBk0FqDOZu30JGBilFAo1hH9K6sRmfzKxZHzF6SzW9y3SyZHyyCrjr3nipPovow4Dz4bRCns6gOsjIYmQis6hSIArqaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAai6S6dseGWGlLSzYIQJ/7Vi/LOmOi5K6YTdG4Digs=;
 b=Mvvv4UiT8stZRJpDIadFjAyEcHAL31YKGmAlXaLj4p7SR4y6WpPXCvD980a93mWVp05LxCcZQ9MwbHTKq5Nltfbf/n2U8i662wK3Mg8lCZH5FZ2eQT07ofs0MuGDRgbuFQdYJvLbUazgFSTGeKHvVO3v/QTVWK5nwJFENsSIC0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by MN2PR12MB3328.namprd12.prod.outlook.com (2603:10b6:208:c2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Wed, 22 Jun
 2022 23:06:15 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db%5]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 23:06:15 +0000
Message-ID: <db23875c-750e-d81d-5184-3d53814eebd4@amd.com>
Date: Wed, 22 Jun 2022 18:06:10 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>, David Hildenbrand <david@redhat.com>
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
 <87h74d7dde.fsf@nvdebian.thelocal>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <87h74d7dde.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0012.namprd20.prod.outlook.com
 (2603:10b6:208:e8::25) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06e59371-5028-4a85-4ddb-08da54a3ce88
X-MS-TrafficTypeDiagnostic: MN2PR12MB3328:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB33288831E84A6E581ACA4199FDB29@MN2PR12MB3328.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VCHxOi4DwE5ZAqddbSJAsZuC9bId5aFL5jnrWYnMNV7Bk4R58VgpjSlOjBFELfM2iUzGGJsq6rUfv/eZ1UDaW7tG95RCf/5gzqq/M8Bwvhw7Dg2+SRoZWaGHU8Z/JKSN69l1mOj3hNr1L3jpS9ArNpFe4IFnoT96v9xF5NqAxgC003b2KbZL0ck+E/U/S7LIZEhMcLqHKbw0l1sSxd/xAw0Z3AFYRk8OUtsi29Y+sn64H8pEp7o+9qwXnw87ZB2P2o1d2lHDSOkLBZcljVSvBrVioZosTZTCXh1bAFF3YPXB2fkG/n0tej3Y/6sKVBG0/A16eDUWESKp4fSKkOZQhJl2DupypHtIDpLXpqAdSz5mLMltSWde1YqdxJv7b7g9yYGQx8r08f93yIEPQu6eI0k3A6TsAQdO6NcRC6XXPW+xvBbfBoUUrHz8CbWVOUXZ0bmfXjUmqt2EK8JY2koPUhIdb0l7qTYVazhdlg5QZ+/5R+8Jo/h23VUWGSk0ygE8KDg2vDcP20OhvgiMX8FPh1W/sjGmjiH1k2Gz5YiouiNdV3oFYi8EBrTlkCSM/x5qoqNMqm4T3pEk+Rg6OGn+xvwSyr5CCPyD1J/Qy/PL1Eb0PquCbhjIzwvt56jlTEF5xlf4VCwhrB3j1rwL6YmAKNk6ZgQiN4tIxfKdKFBNc/swUm+LGAyGGGDQGCVWDFaThVzGUMZgBk9urIiraH1xU5NWD46YZMu+Qqwm3qzY+eCbdVjOFyh2z1pPVDGAHdg3C0uYZhGhG7KkhH7ISWZcDzgqMLWKvUkBEbYWiYiCtqI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(2906002)(41300700001)(6666004)(66946007)(31686004)(6512007)(5660300002)(6486002)(7416002)(26005)(6506007)(8936002)(186003)(66556008)(478600001)(4326008)(110136005)(66476007)(2616005)(8676002)(316002)(83380400001)(31696002)(86362001)(38100700002)(53546011)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1RNcXJBazVGdGIvQ0lBb0IrWmhxcjdQaVA4cFU1cHpobGdSajRDa1J3T1M1?=
 =?utf-8?B?TmVqeGtNZGM5eXBXNjBuVStVTUtsOHlQZ0hwNE9ZTXhSTzd1dkFMRDhvMity?=
 =?utf-8?B?RnBheldUNzZFQjl4bXBIVTBDSFFJVjJEdzVkTm1VcStzdGV5Nkw4RFdka3Ft?=
 =?utf-8?B?Sm9vZmtGMFdWYVBJSHZUY2daR0VzSVpUOVI0MkVVaDhLeFBhaS9VWk8xRWdP?=
 =?utf-8?B?b0hCQkR1TCtOMUE4M2NlZUo0TTk0R1FpQUlUaDFFbll2aUhhL2x6UW5hU1V3?=
 =?utf-8?B?Mk1QNHE0cCt5aEQvSG9LcmJlZ0tyb0RKMHQ4bWwvcnJyY1B3ZGtDSS82bjc5?=
 =?utf-8?B?Z0d2QUhBQ3E2L0hzeTIzL0VsaDE5NEI3NkF5aTNRd2dRenVHU1hTSEM5OFI4?=
 =?utf-8?B?Q01XR2VHem5zbEtGMitaOHJPc0gvMzI2UmRaczk2Z3NqVnMra2pWd3RUNm5w?=
 =?utf-8?B?VGx6QmREOG1SSzYrOTM3OHpWb0lid3U2OEhuTWZ6MG5nTFc3N1FGdmt0MURZ?=
 =?utf-8?B?bU40ZEZmWEE0RExaOUtzdVBHVURMazFKdzI3TGxSZTFjVnRJQjVJb0FHaHhn?=
 =?utf-8?B?SDJNZUNDUFRzbko5WWszZ1dqL1JPRHpwTXlHUHVTc1UvdnFzRFZ0Z0FISVhQ?=
 =?utf-8?B?OFpIeWEzakhDL0FxOWJIZEhiRlQxcEdtTFZVTTBWUngyUUxjK29YV2FYN1po?=
 =?utf-8?B?RTNybEdhZjNhMmdBa2JGa2twYzMySkNFYW9MdGxqMjkxWm94UjhkUTBkaDZW?=
 =?utf-8?B?ZXd2QXRyeHVqN3RYRTVwV0RUL1JROE1naGU5QmlpbXFqRzExZ3lhd2t1TmF0?=
 =?utf-8?B?YXhvcGV1UWgyVDRsQUV3MEJRZlFROVRyK1phTTlVQ0FjUHg1VFlnaUphbjZn?=
 =?utf-8?B?WnY2RjFHL0wxelJUZkw4Z3llRFpkQThIMFo3RC94RGtrMzE5OVJZdmtHaHU0?=
 =?utf-8?B?MEdVb1NCKzJ4OUNMK2liaDJ1ckR4M3Q2a1lwZE91VXUreEZXYjVrcHJBZHA5?=
 =?utf-8?B?aVhrMXhLVWFOR2g4ZVM4cmllRlQ5bjRYY05FaXNvKzUxblFTTGZpT0xhTXV6?=
 =?utf-8?B?QlFkVy9Nc09mQ1FlOVJLSXhtSnVHRE9wekVCOFA4SmlZdm44MVJMblVJOW9K?=
 =?utf-8?B?cmxvUFV0YmNxaEgwQ2dwSzVqNWZZbnFNNXFiRUFvN0NVUmxKYit4cWNjUFl2?=
 =?utf-8?B?bmIxdHRNMi9qL1Bwazc2QWZRWHdiejhMMGxnN2E2K3lWRFNHejhadHcwQ1A2?=
 =?utf-8?B?ek8rWjA1VUVpVGJORkxSb2JMd2RKOHdLY0xhV0tMM1daKytCaDhLQy9MUnlI?=
 =?utf-8?B?dmFMY1FOZWF6VkVtTEl4THhUeWJuRFRpTmtjYm5PZUpPU2ZGelpCQzBKQnpN?=
 =?utf-8?B?VW1zNUZXRy9ZejRSWHdoK0tIZDcvZ0o4eVNYcXl1c2k3TWd3enZOb2w4NjJG?=
 =?utf-8?B?TjVrN0pCUkhuRW1vN0VWTVJlcFA4YVZsQkZCM1JDWUIwUk5VWmhsTVR3bVNU?=
 =?utf-8?B?OHczSWRKNkpvZEtMMWE2Q3FHOUlHQVBJMzhvYVBFWHVJN212V3NkcEQvbEVo?=
 =?utf-8?B?K2diSXpQSndwYVM0cWg5NGRnK2prWHFMT1lPQVNBMDRQNGVwaXpHOW8rcG9I?=
 =?utf-8?B?OU0va1F5MVFmZlJUWjVwRkJpYWlKQkthMzVFaEpad0FxRHhmNWlnN0xMNmhF?=
 =?utf-8?B?L3lERkJ2VGd0cGpueTVlZ1lNa3VJNzcxaUNEUk5FMWt6Lzc4d05SbVFyRVd1?=
 =?utf-8?B?em9DUnk3SksvaHFkU3hLQzMyVWNnVUR3Y01OVzliRm54dStqVnFHT3hVSjRR?=
 =?utf-8?B?YXBXN3BadHhBcHEyQnVVczFST3Z3ZDRvUlhnTjc0cFpVVEhLa3IwOWFTd1Zy?=
 =?utf-8?B?Z2p6VTB2K2g0Q3ZrR2hDQXFkOG5uaTdDYUlyQ0RRdGVsT0MzSHE1V0Q5VThQ?=
 =?utf-8?B?UzdpMURjZmN0VlhYTW81VDZlV2R0WjRJQk5DbXNja1k2OW9wUmw1VjBkL3Fp?=
 =?utf-8?B?YTV3ZzcxbTBIb1QzYStLTGEwZjk2bnYvWjVkY1hDdzVMc3pkNVNObTcxQkZv?=
 =?utf-8?B?am90bHlrSXk3anIyMU5VOWo2M3JsMXJlL0VvQStJemNXcGhmSVJVRFhndits?=
 =?utf-8?B?VjF2b2MrWWd0UVFodU81Vlo0aFRxS2E2Y1o0TW9JVzRMVTI0VmRNekxrTndt?=
 =?utf-8?B?dlJSdnBPRlRILzM0UlMweE1CZUhpUDNBMS80R0wxeVhZZnYxNDJjbVdqOHpV?=
 =?utf-8?B?NW1zOVZhRkUxNko3b2FaTFZJZ2tCYysraitZMkJYdWV2QnUyZkdQY3Qwb1Za?=
 =?utf-8?B?UFBVQ1ozU3lsczRTVzQ5ZjRkMkQydHdzeGFvaDNCdzZpMUhzU1VhQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e59371-5028-4a85-4ddb-08da54a3ce88
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 23:06:14.9819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXyPYlrriKJZMig1L+GaVCKBpQ6VDLAJfzmfweLMBxu64T7yaJlT7TGNcttmIpZWymZnx9G9kmI4t+JYcc/8LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3328
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


On 6/21/2022 7:16 PM, Alistair Popple wrote:
> David Hildenbrand <david@redhat.com> writes:
>
>> On 21.06.22 18:08, Sierra Guiza, Alejandro (Alex) wrote:
>>> On 6/21/2022 7:25 AM, David Hildenbrand wrote:
>>>> On 21.06.22 13:55, Alistair Popple wrote:
>>>>> David Hildenbrand<david@redhat.com>  writes:
>>>>>
>>>>>> On 21.06.22 13:25, Felix Kuehling wrote:
>>>>>>> Am 6/17/22 um 23:19 schrieb David Hildenbrand:
>>>>>>>> On 17.06.22 21:27, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>>>>> On 6/17/2022 12:33 PM, David Hildenbrand wrote:
>>>>>>>>>> On 17.06.22 19:20, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>>>>>>> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
>>>>>>>>>>>> On 31.05.22 22:00, Alex Sierra wrote:
>>>>>>>>>>>>> Device memory that is cache coherent from device and CPU point of view.
>>>>>>>>>>>>> This is used on platforms that have an advanced system bus (like CAPI
>>>>>>>>>>>>> or CXL). Any page of a process can be migrated to such memory. However,
>>>>>>>>>>>>> no one should be allowed to pin such memory so that it can always be
>>>>>>>>>>>>> evicted.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Alex Sierra<alex.sierra@amd.com>
>>>>>>>>>>>>> Acked-by: Felix Kuehling<Felix.Kuehling@amd.com>
>>>>>>>>>>>>> Reviewed-by: Alistair Popple<apopple@nvidia.com>
>>>>>>>>>>>>> [hch: rebased ontop of the refcount changes,
>>>>>>>>>>>>>            removed is_dev_private_or_coherent_page]
>>>>>>>>>>>>> Signed-off-by: Christoph Hellwig<hch@lst.de>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>       include/linux/memremap.h | 19 +++++++++++++++++++
>>>>>>>>>>>>>       mm/memcontrol.c          |  7 ++++---
>>>>>>>>>>>>>       mm/memory-failure.c      |  8 ++++++--
>>>>>>>>>>>>>       mm/memremap.c            | 10 ++++++++++
>>>>>>>>>>>>>       mm/migrate_device.c      | 16 +++++++---------
>>>>>>>>>>>>>       mm/rmap.c                |  5 +++--
>>>>>>>>>>>>>       6 files changed, 49 insertions(+), 16 deletions(-)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>>>>>>>>>> index 8af304f6b504..9f752ebed613 100644
>>>>>>>>>>>>> --- a/include/linux/memremap.h
>>>>>>>>>>>>> +++ b/include/linux/memremap.h
>>>>>>>>>>>>> @@ -41,6 +41,13 @@ struct vmem_altmap {
>>>>>>>>>>>>>        * A more complete discussion of unaddressable memory may be found in
>>>>>>>>>>>>>        * include/linux/hmm.h and Documentation/vm/hmm.rst.
>>>>>>>>>>>>>        *
>>>>>>>>>>>>> + * MEMORY_DEVICE_COHERENT:
>>>>>>>>>>>>> + * Device memory that is cache coherent from device and CPU point of view. This
>>>>>>>>>>>>> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>>>>>>>>>>>>> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>>>>>>>>>>>>> + * type. Any page of a process can be migrated to such memory. However no one
>>>>>>>>>>>> Any page might not be right, I'm pretty sure. ... just thinking about special pages
>>>>>>>>>>>> like vdso, shared zeropage, ... pinned pages ...
>>>>>>>>>> Well, you cannot migrate long term pages, that's what I meant :)
>>>>>>>>>>
>>>>>>>>>>>>> + * should be allowed to pin such memory so that it can always be evicted.
>>>>>>>>>>>>> + *
>>>>>>>>>>>>>        * MEMORY_DEVICE_FS_DAX:
>>>>>>>>>>>>>        * Host memory that has similar access semantics as System RAM i.e. DMA
>>>>>>>>>>>>>        * coherent and supports page pinning. In support of coordinating page
>>>>>>>>>>>>> @@ -61,6 +68,7 @@ struct vmem_altmap {
>>>>>>>>>>>>>       enum memory_type {
>>>>>>>>>>>>>       	/* 0 is reserved to catch uninitialized type fields */
>>>>>>>>>>>>>       	MEMORY_DEVICE_PRIVATE = 1,
>>>>>>>>>>>>> +	MEMORY_DEVICE_COHERENT,
>>>>>>>>>>>>>       	MEMORY_DEVICE_FS_DAX,
>>>>>>>>>>>>>       	MEMORY_DEVICE_GENERIC,
>>>>>>>>>>>>>       	MEMORY_DEVICE_PCI_P2PDMA,
>>>>>>>>>>>>> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
>>>>>>>>>>>> In general, this LGTM, and it should be correct with PageAnonExclusive I think.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> However, where exactly is pinning forbidden?
>>>>>>>>>>> Long-term pinning is forbidden since it would interfere with the device
>>>>>>>>>>> memory manager owning the
>>>>>>>>>>> device-coherent pages (e.g. evictions in TTM). However, normal pinning
>>>>>>>>>>> is allowed on this device type.
>>>>>>>>>> I don't see updates to folio_is_pinnable() in this patch.
>>>>>>>>> Device coherent type pages should return true here, as they are pinnable
>>>>>>>>> pages.
>>>>>>>> That function is only called for long-term pinnings in try_grab_folio().
>>>>>>>>
>>>>>>>>>> So wouldn't try_grab_folio() simply pin these pages? What am I missing?
>>>>>>>>> As far as I understand this return NULL for long term pin pages.
>>>>>>>>> Otherwise they get refcount incremented.
>>>>>>>> I don't follow.
>>>>>>>>
>>>>>>>> You're saying
>>>>>>>>
>>>>>>>> a) folio_is_pinnable() returns true for device coherent pages
>>>>>>>>
>>>>>>>> and that
>>>>>>>>
>>>>>>>> b) device coherent pages don't get long-term pinned
>>>>>>>>
>>>>>>>>
>>>>>>>> Yet, the code says
>>>>>>>>
>>>>>>>> struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags)
>>>>>>>> {
>>>>>>>> 	if (flags & FOLL_GET)
>>>>>>>> 		return try_get_folio(page, refs);
>>>>>>>> 	else if (flags & FOLL_PIN) {
>>>>>>>> 		struct folio *folio;
>>>>>>>>
>>>>>>>> 		/*
>>>>>>>> 		 * Can't do FOLL_LONGTERM + FOLL_PIN gup fast path if not in a
>>>>>>>> 		 * right zone, so fail and let the caller fall back to the slow
>>>>>>>> 		 * path.
>>>>>>>> 		 */
>>>>>>>> 		if (unlikely((flags & FOLL_LONGTERM) &&
>>>>>>>> 			     !is_pinnable_page(page)))
>>>>>>>> 			return NULL;
>>>>>>>> 		...
>>>>>>>> 		return folio;
>>>>>>>> 	}
>>>>>>>> }
>>>>>>>>
>>>>>>>>
>>>>>>>> What prevents these pages from getting long-term pinned as stated in this patch?
>>>>>>> Long-term pinning is handled by __gup_longterm_locked, which migrates
>>>>>>> pages returned by __get_user_pages_locked that cannot be long-term
>>>>>>> pinned. try_grab_folio is OK to grab the pages. Anything that can't be
>>>>>>> long-term pinned will be migrated afterwards, and
>>>>>>> __get_user_pages_locked will be retried. The migration of
>>>>>>> DEVICE_COHERENT pages was implemented by Alistair in patch 5/13
>>>>>>> ("mm/gup: migrate device coherent pages when pinning instead of failing").
>>>>>> Thanks.
>>>>>>
>>>>>> __gup_longterm_locked()->check_and_migrate_movable_pages()
>>>>>>
>>>>>> Which checks folio_is_pinnable() and doesn't do anything if set.
>>>>>>
>>>>>> Sorry to be dense here, but I don't see how what's stated in this patch
>>>>>> works without adjusting folio_is_pinnable().
>>>>> Ugh, I think you might be right about try_grab_folio().
>>>>>
>>>>> We didn't update folio_is_pinnable() to include device coherent pages
>>>>> because device coherent pages are pinnable. It is really just
>>>>> FOLL_LONGTERM that we want to prevent here.
>>>>>
>>>>> For normal PUP that is done by my change in
>>>>> check_and_migrate_movable_pages() which migrates pages being pinned with
>>>>> FOLL_LONGTERM. But I think I incorrectly assumed we would take the
>>>>> pte_devmap() path in gup_pte_range(), which we don't for coherent pages.
>>>>> So I think the check in try_grab_folio() needs to be:
>>>> I think I said it already (and I might be wrong without reading the
>>>> code), but folio_is_pinnable() is *only* called for long-term pinnings.
>>>>
>>>> It should actually be called folio_is_longterm_pinnable().
>>>>
>>>> That's where that check should go, no?
>>> David, I think you're right. We didn't catch this since the LONGTERM gup
>>> test we added to hmm-test only calls to pin_user_pages. Apparently
>>> try_grab_folio is called only from fast callers (ex.
>>> pin_user_pages_fast/get_user_pages_fast). I have added a conditional
>>> similar to what Alistair has proposed to return null on LONGTERM &&
>>> (coherent_pages || folio_is_pinnable) at try_grab_folio. Also a new gup
>>> test was added with LONGTERM set that calls pin_user_pages_fast.
>>> Returning null under this condition it does causes the migration from
>>> dev to system memory.
>>>
>> Why can't coherent memory simply put its checks into
>> folio_is_pinnable()? I don't get it why we have to do things differently
>> here.
> I'd made the reasonable assumption that
> folio_is_pinnable()/is_pinnable_page() were used to check if the
> folio/page is pinnable or not regardless of FOLL_LONGTERM. Looking at
> the code more closely though I see both are actually only used on paths
> checking for FOLL_LONGTERM pinning.
>
> So I agree - we should rename these
> folio_is_longterm_pinnable()/is_longterm_pinnable_page() and add the
> check for coherent pages there. Thanks for pointing that out.
>
>   - Alistair

Will do in the next patch series.

Regards,
Alex Sierra

>>> Actually, Im having different problems with a call to PageAnonExclusive
>>> from try_to_migrate_one during page fault from a HMM test that first
>>> migrate pages to device private and forks to mark as COW these pages.
>>> Apparently is catching the first BUG VM_BUG_ON_PGFLAGS(!PageAnon(page),
>>> page)
>> With or without this series? A backtrace would be great.
