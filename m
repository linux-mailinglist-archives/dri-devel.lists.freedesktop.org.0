Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26237DBC6D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 16:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE2C10E2F0;
	Mon, 30 Oct 2023 15:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2055.outbound.protection.outlook.com [40.107.101.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE3310E2F0;
 Mon, 30 Oct 2023 15:11:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwN9Rj1E95Kia8Gxi3sKLz8r3YQ5+34ilH/SN1QUULpUFoJuM8GwYw6wT9qnXeWYkrhj+qlVx++brT472zpuJXBwTlsgIjkNYqyRLLReixxJG5sghV4gim5d+5MUxbpvQIhB8C82TMaSZOK+/v+UB6ML6Ms7AQXFJiX8QgJrHQVK0fjBo446KVWOD8L0wtSsjmysKhGZZAvVbOxIsEXhr26BSvy8S2+giKpxxTuwkVDeOmRjS+G9vOk/Iy72+xdYPr63FI/dDU5Y6px7fsO6ON4OlsjEsJT0wof+ThQ8yhRTueiRpPAapo8yxCzpSXknDpy3WZuMgRJqtxkP5AJoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46wAH2tmbCTagtAg9lFpUuz5S+sk8lOjyUrPey3ShD0=;
 b=L6Z0+8MxuWmXOzxHD14ChJUWFglJpyilQP8tE/5c1hVUoA0Sbhf9EdHut5g5zUkd5ubLk8doNrcdLgFcTArcVYbz6b7nMODen2+zXauE5BFw60wEqI+Jwd84jKIG7jNL4gEeMZq3Ngi83AovwlgV4+dAhq8HG96UMqkdXJm74yKlrbYLn03qdz4uKlCjdQ/9Iud5FCL1YY2yIg+FaDNw/LwdWMg2MGjsyH7PPZhPsNYF1QrozwKvLm1OsJzDZu0BqwT3VkiAxFg/yoY+b7CDUYwcgqJTA1yP3awgrojBP6r6iNUqYbMDL/vl14E55RZ6QfxkVR1sxQ+oRUMqODCU1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46wAH2tmbCTagtAg9lFpUuz5S+sk8lOjyUrPey3ShD0=;
 b=YqDihR3FFzdManZIRkjc+II9fxItJV7eLzQqz9pxKQL5EahyNYX0T5qSGYDbl0BBBSxcuDv45R6B96BbT0WsJ3mTrW94GXQzmobZ7INmVixv/vqyO9ta4K7U/daN30Ee21I/ejg52urYiYeQ31PTKZlPUmSjKVSPynOoKBAUlJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by BL1PR12MB5352.namprd12.prod.outlook.com (2603:10b6:208:314::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 15:11:46 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::8b0b:3c38:b988:ca27]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::8b0b:3c38:b988:ca27%3]) with mapi id 15.20.6933.024; Mon, 30 Oct 2023
 15:11:45 +0000
Message-ID: <04d5878f-c129-8979-87ff-0046560e2dcd@amd.com>
Date: Mon, 30 Oct 2023 20:41:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [RFC v4 0/5] Proposal to use netlink for RAS and Telemetry across
 drm subsystem
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
 <CADnq5_PLfTg6hBpSHLND9FF-B++D=BMXQKSJQknOxy8y=Qz-ZA@mail.gmail.com>
 <7b3d3e43-57f7-9a56-14e3-75d6df6dc004@amd.com>
 <2caad369-360e-44f3-a375-d69027e3e6b9@linux.intel.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <2caad369-360e-44f3-a375-d69027e3e6b9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::22) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|BL1PR12MB5352:EE_
X-MS-Office365-Filtering-Correlation-Id: 3642d47e-4d26-4396-c5a5-08dbd95a8800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AjlMbzlKxv+ytaW38VBx0GrCRmnFLnSHvkspf1nd7yOiy6xfo4rQEL7/TansuFuDTLTdePJaW7KE833t3hahjTKdcaYHF3FbbC6OUffsIIXUnZOCBSUrW+7I2rPLGn8DCvZCiVleKkmGW7u0QdN2iUsKMVSL/HrN03tCAgFHYyxfWaSpCKZMZ0CLtf9i5nl6FYPoHOCSR8BaHv2T+AZR5dAF4+up9PRT29M8WJa/qflOfvciLV+cJ5omMlGMKK0VUgGAeAecm+GNhXA9yiu4ZRU+IX3a009Z8a4m1yXrofy6VRfYSf6hboGhxySaPg7NiCOpe/3IeKZIKVr6wbD8JwJ/Yu1Ea95Tv8ZtpU2lBc2fLjQTRkV0jO/wxkGC1R46uciUj1uMJfqN6TR3+rrqEVIjmn2fOqGWhJs0k6V8KRpoL0HlTEru4NqHRhssj0a147DXCojGyMUJo91MT0eu9xHIXWPlCFPPbgsmJMk5S2bfeGb+sioe0kgj8kXKGQFmvw9HiBpbjn8Iz3ScgtInJpp4FjqYqAG09L3CeW34ZmneVKpCdpzzbeqjaZyqLo1yfpKZFLIMWimoor1y2md5VQXkAuctIOU8sbAJ03uafmt37rFBfnbbWNsbeBQrqWYDw0cRguCuNGGFJzcLR3znzBlX6kqHMMDr9O0/OVcVJw3WLboatSu/OFPInKtUUxyA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(136003)(346002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2616005)(26005)(53546011)(6506007)(6512007)(38100700002)(3613699003)(86362001)(31696002)(36756003)(83380400001)(5660300002)(7416002)(110136005)(66946007)(66476007)(66556008)(30864003)(4326008)(8676002)(8936002)(41300700001)(316002)(31686004)(6666004)(6486002)(966005)(478600001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3l1TUV6M0xhL2VmNVFwMUpVN0x2WWRqeEV1aDBxQWRLclNQOFY4L2h3eHNX?=
 =?utf-8?B?R0ErL0NaNW13Z2kvV0d1ZEhPRmtlS1JPalQxUXhjbVhhT2RyYnpIcktscW9T?=
 =?utf-8?B?aEtxODlRS1htYXpWZUxDNEdvcGowRUNTU1laekV3RXk5VXc0VDVvb0pCYVZX?=
 =?utf-8?B?akIrdjdTekJFa1VtakJtL0JiWFZoeVM3SVJiRUNQQ2poVHQ5bFZaNnhCNVlT?=
 =?utf-8?B?elFESVpuM0FSblM3a3ZMQWFTdHVvUFhvR1JSbngwWmFGclI2VTFUcVJ6dXh0?=
 =?utf-8?B?QlA0OGNiQ2ZQVFhlSlIrSi9iSytEaXRzRW55NHFjMGV6UVJ6Qi9CYlQ4NE92?=
 =?utf-8?B?Y3U2SlkyakZKNkVaTEpKMVIrRUo2enR3ZlBSQ0M3c1JVbEI0aVoySmE1T0Z4?=
 =?utf-8?B?V0RTcWJKc1lTaDBIeGNDMXE5Z1JRTCtreXprWTdyRmhra29WWjB5ZWpWTVJ5?=
 =?utf-8?B?VWZpd0JubEpXRHIwbDBIemp4S1UzSHpHOUFpV1c1NER3RldyQVprQzR6ems3?=
 =?utf-8?B?K05iVzRQMEZGZDV2S2VhdnRPSncvcnN2bXJVZXhKR1JUZGdETnViNlE3bmNG?=
 =?utf-8?B?bHRISEd5QVpNVkhGais2eTBoL0FTZ3hjMDRSSlpzbGNqbzh2MmZFTjZlYnJn?=
 =?utf-8?B?RlF1TGdBNGpVSHNuUjhmbFNtMHZicHZvVnkwYnRGSkV1bm1RKzhzM1JFVGha?=
 =?utf-8?B?RlFoTTVIQ1dLSXFkenZ4NEE2NE1nRXNuSkRXVnVaTGU2UUhXOUFIL3pFcWl3?=
 =?utf-8?B?TzVySlN0ZDZlS2NudkI4QVROWi9acTlwOUlwSHpaaG0vSlBsclh6ODJlYjlj?=
 =?utf-8?B?dnF1YzZhT0NZT1hiSS9RcWxRTzM0VjNVeUFDeHRjNUlxeUlLeEI3YjB1Z0tM?=
 =?utf-8?B?TE1idUs1YlpoL1BkK0U1NGlLOE5ZMitHbGFRMTg5R1paVy9LaXhqNVY0WGNw?=
 =?utf-8?B?UU84SzNQQ3V3RmxYYjhCcjFrK2ZsR3dmWHJnS3lsNC9zMUFhZ0NOdEdTbG5G?=
 =?utf-8?B?OVlqazFNay9jMnovcEYvdE9Dc1Rxei9oSi9UdnZHOUU3ZHRmK0t1WC9lNDla?=
 =?utf-8?B?UGlCMzhMWUp4aURhUm9LMHNxLzBMWUxvL3p1L2pSK0NLK1h4bHRONFlTUWZE?=
 =?utf-8?B?VTJrYTI2VHpaUFdEVTFVMk5UMCtXdW04eGNIN0RhZW9EQ2NqUjJoeVduR3hI?=
 =?utf-8?B?djdHdzVoY1ZrL2FNcFArbXlHaFFUdnRnVGtnMkZwbSt1VW9QekpQZ3ViTDRS?=
 =?utf-8?B?d3lyWWoxdjBKQ05Ka0FCUENybUpqYXhIRXVjbnVFRlVadWttekd3S1VmUUl2?=
 =?utf-8?B?RDc0aVdGSStUdU04Uy9kMEF2WGpVaUFrZFRmNHZBRmVUbGEzMG5RdjNaaVRw?=
 =?utf-8?B?ZGJQY0xpQzMyY1k0Nk9XTzE0TU42Nm05b0VyZThlaWFsT3hoTkJEYVVuM3Jp?=
 =?utf-8?B?TDd4dmxhTVl4YkUrWUZYcWtrQXNCdTBBR3pRTDJMTzc4VHc0UWZjZkxUdEV1?=
 =?utf-8?B?K1dxZnQxQXZmazkzOHN1eVFIQUZnTklmajg1ZUZzUGlKNm96MzJYcFFTSEc5?=
 =?utf-8?B?aGIrbEhUbzJ2WGNsTzJKSStET3p0amdCUklMaW9xa3V2Rlh4WHJlQmNMQ3VY?=
 =?utf-8?B?MnB3amM0Uy9mRUtHT1BzOFpyMDlYc0k2VTRvcHh0dkhUa2I3TUVLSzVac2U1?=
 =?utf-8?B?Y1lLeWFXbjBjRW9CTVArNlVuNGlLQk9vU1FaWmp4aTNQMTBNNXhLNnpCZTU3?=
 =?utf-8?B?ZHRCdVF1bE9Ud3dUa3NkMHJHSkVWaTlKUDlsVzFYZUZaNHltNjk4eWtoUUhr?=
 =?utf-8?B?d0R2aHNvZjkrOXhhZGNOTWxqaVVrTUZLaUJ6eUFxZy9nSzNLVlcrQnNBVDYw?=
 =?utf-8?B?cUpITGFPaFBkdTVWNHQ4Z3pORWVhVk9iZnl3M0lXa0QvZmszTzZMSHlWKzV2?=
 =?utf-8?B?bHFjT1FRaDRnNVFjR2l0TXV3d0xDNDg1Misva0FNVFVSckxFMVFpWVNwWGJH?=
 =?utf-8?B?MVJGT1FrU2c4OFloZGdYRTl2N0FkaG5HOUNQVkpSRmxsYlRMQVlNb1VkL283?=
 =?utf-8?B?NXpIY1dSZEsvOGxBVW1PeS95UGF4ckk2SkViMHcwemcvQnVXelgyczRrNk0w?=
 =?utf-8?Q?v4iiyhT6Q7KuZLR33QEfLn9ii?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3642d47e-4d26-4396-c5a5-08dbd95a8800
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:11:45.8880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSOL8XmydyXHqLerCSs6B9Eih2BZaGr1IT7ow/tBxsXqjlmhACQ9GFGjdiJx0mz0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5352
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
Cc: ogabbay@kernel.org, Harish.Kasiviswanathan@amd.com,
 dri-devel@lists.freedesktop.org, michael.j.ruhl@intel.com,
 Luben.Tuikov@amd.com, ttayar@habana.ai, alexander.deucher@amd.com,
 Felix.Kuehling@amd.com, intel-xe@lists.freedesktop.org, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/30/2023 11:49 AM, Aravind Iddamsetty wrote:
> 
> On 26/10/23 15:34, Lazar, Lijo wrote:
> 
> Hi Lijo,
> 
> Thank you for your comments.
> 
>>
>>
>> On 10/23/2023 8:59 PM, Alex Deucher wrote:
>>> On Fri, Oct 20, 2023 at 7:42 PM Aravind Iddamsetty
>>> <aravind.iddamsetty@linux.intel.com> wrote:
>>>>
>>>> Our hardware supports RAS(Reliability, Availability, Serviceability) by
>>>> reporting the errors to the host, which the KMD processes and exposes a
>>>> set of error counters which can be used by observability tools to take
>>>> corrective actions or repairs. Traditionally there were being exposed
>>>> via PMU (for relative counters) and sysfs interface (for absolute
>>>> value) in our internal branch. But, due to the limitations in this
>>>> approach to use two interfaces and also not able to have an event based
>>>> reporting or configurability, an alternative approach to try netlink
>>>> was suggested by community for drm subsystem wide UAPI for RAS and
>>>> telemetry as discussed in [1].
>>>>
>>>> This [1] is the inspiration to this series. It uses the generic
>>>> netlink(genl) family subsystem and exposes a set of commands that can
>>>> be used by every drm driver, the framework provides a means to have
>>>> custom commands too. Each drm driver instance in this example xe driver
>>>> instance registers a family and operations to the genl subsystem through
>>>> which it enumerates and reports the error counters. An event based
>>>> notification is also supported to which userpace can subscribe to and
>>>> be notified when any error occurs and read the error counter this avoids
>>>> continuous polling on error counter. This can also be extended to
>>>> threshold based notification.
>>
>> The commands used seems very limited. In AMD SOCs, IP blocks, instances of IP blocks, block types which support RAS will change across generations.
>>
>> This series has a single command to query the counters supported. Within that it seems to assign unique ids for every combination of error type, IP block type and then another for each instance. Not sure how good this kind of approach is for an end user. The Ids won't necessarily the stay the same across multiple generations. Users will generally be interested in specific IP blocks.
> 
> Exactly the IDs are UAPI and won't change once defined for a platform and any new SKU or platform will add on top of existing ones. Userspace can include the header and use the defines. The query is used to know what all errors exists on a platform and userspace can process the IDs of IP block of interest. I believe even if we list block wise a query will be needed without which userspace wouldn't know which blocks exist on a platform.
> 

What I meant is - assigning an id for every combination of IP block/ 
instance number/error type is not maintainable across different SOCs.

Instead, can we have  something like -
	Query -> returns IP block ids, number of instances, error types 
supported by each IP block.
	Read Error -> IP block id | Instance number /Instance ALL | Error type 
id/Error type ALL.

Thanks,
Lijo

>>
>> For ex: to get HBM errors, it looks like the current patch series supports READALL which dumps the whole set of errors. Or, users have to figure out the ids of HBM stack instance (whose capacity can change depending on the SOC and within a single family multiple configurations can exist) errors and do multiple READ_ONE calls. Both don't look good.
>>
>> It would be better if the command argument format can be well defined so that it can be queried based on IP block type, instance, and error types supported (CE/UE/fatal/parity/deferred etc.).
> 
> so to mitigate multiple read limitation, we can introduce a new GENL command like READ_MULTI which accepts a list of errors ids which userspace can pass and get all interested error counter as response at once. Also, listing individual errors helps if userspace wants to read a particular error at regular intervals. The intention is also to keep KMD logic simple, userspace can build required model on top of flat enumeration.
> 
> Please let me know if this sounds reasonable to you.
> 
> Thanks,
> Aravind.
>>
>> Thanks,
>> Lijo
>>
>>>
>>> @Hawking Zhang, @Lazar, Lijo
>>>
>>> Can you take a look at this series and API and see if it would align
>>> with our RAS requirements going forward?
>>>
>>> Alex
>>>
>>>
>>>>
>>>> [1]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
>>>>
>>>> this series is on top of https://patchwork.freedesktop.org/series/125373/,
>>>>
>>>> v4:
>>>> 1. Rebase
>>>> 2. rename drm_genl_send to drm_genl_reply
>>>> 3. catch error from xa_store and handle appropriately
>>>> 4. presently xe_list_errors fills blank data for IGFX, prevent it by
>>>> having an early check of IS_DGFX (Michael J. Ruhl)
>>>>
>>>> v3:
>>>> 1. Rebase on latest RAS series for XE
>>>> 2. drop DRIVER_NETLINK flag and use the driver_genl_ops structure to
>>>> register to netlink subsystem
>>>>
>>>> v2: define common interfaces to genl netlink subsystem that all drm drivers
>>>> can leverage.
>>>>
>>>> Below is an example tool drm_ras which demonstrates the use of the
>>>> supported commands. The tool will be sent to ML with the subject
>>>> "[RFC i-g-t v2 0/1] A tool to demonstrate use of netlink sockets to read RAS error counters"
>>>> https://patchwork.freedesktop.org/series/118437/#rev2
>>>>
>>>> read single error counter:
>>>>
>>>> $ ./drm_ras READ_ONE --device=drm:/dev/dri/card1 --error_id=0x0000000000000005
>>>> counter value 0
>>>>
>>>> read all error counters:
>>>>
>>>> $ ./drm_ras READ_ALL --device=drm:/dev/dri/card1
>>>> name                                                    config-id               counter
>>>>
>>>> error-gt0-correctable-guc                               0x0000000000000001      0
>>>> error-gt0-correctable-slm                               0x0000000000000003      0
>>>> error-gt0-correctable-eu-ic                             0x0000000000000004      0
>>>> error-gt0-correctable-eu-grf                            0x0000000000000005      0
>>>> error-gt0-fatal-guc                                     0x0000000000000009      0
>>>> error-gt0-fatal-slm                                     0x000000000000000d      0
>>>> error-gt0-fatal-eu-grf                                  0x000000000000000f      0
>>>> error-gt0-fatal-fpu                                     0x0000000000000010      0
>>>> error-gt0-fatal-tlb                                     0x0000000000000011      0
>>>> error-gt0-fatal-l3-fabric                               0x0000000000000012      0
>>>> error-gt0-correctable-subslice                          0x0000000000000013      0
>>>> error-gt0-correctable-l3bank                            0x0000000000000014      0
>>>> error-gt0-fatal-subslice                                0x0000000000000015      0
>>>> error-gt0-fatal-l3bank                                  0x0000000000000016      0
>>>> error-gt0-sgunit-correctable                            0x0000000000000017      0
>>>> error-gt0-sgunit-nonfatal                               0x0000000000000018      0
>>>> error-gt0-sgunit-fatal                                  0x0000000000000019      0
>>>> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a      0
>>>> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b      0
>>>> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c      0
>>>> error-gt0-soc-fatal-punit                               0x000000000000001d      0
>>>> error-gt0-soc-fatal-psf-0                               0x000000000000001e      0
>>>> error-gt0-soc-fatal-psf-1                               0x000000000000001f      0
>>>> error-gt0-soc-fatal-psf-2                               0x0000000000000020      0
>>>> error-gt0-soc-fatal-cd0                                 0x0000000000000021      0
>>>> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022      0
>>>> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023      0
>>>> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024      0
>>>> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025      0
>>>> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026      0
>>>> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027      0
>>>> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028      0
>>>> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029      0
>>>> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a      0
>>>> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b      0
>>>> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c      0
>>>> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d      0
>>>> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e      0
>>>> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f      0
>>>> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030      0
>>>> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031      0
>>>> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032      0
>>>> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033      0
>>>> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034      0
>>>> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035      0
>>>> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036      0
>>>> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037      0
>>>> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038      0
>>>> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039      0
>>>> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a      0
>>>> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b      0
>>>> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c      0
>>>> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d      0
>>>> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e      0
>>>> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f      0
>>>> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040      0
>>>> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041      0
>>>> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042      0
>>>> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043      0
>>>> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044      0
>>>> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045      0
>>>> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046      0
>>>> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047      0
>>>> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048      0
>>>> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049      0
>>>> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a      0
>>>> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b      0
>>>> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c      0
>>>> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d      0
>>>> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e      0
>>>> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f      0
>>>> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050      0
>>>> error-gt1-correctable-guc                               0x1000000000000001      0
>>>> error-gt1-correctable-slm                               0x1000000000000003      0
>>>> error-gt1-correctable-eu-ic                             0x1000000000000004      0
>>>> error-gt1-correctable-eu-grf                            0x1000000000000005      0
>>>> error-gt1-fatal-guc                                     0x1000000000000009      0
>>>> error-gt1-fatal-slm                                     0x100000000000000d      0
>>>> error-gt1-fatal-eu-grf                                  0x100000000000000f      0
>>>> error-gt1-fatal-fpu                                     0x1000000000000010      0
>>>> error-gt1-fatal-tlb                                     0x1000000000000011      0
>>>> error-gt1-fatal-l3-fabric                               0x1000000000000012      0
>>>> error-gt1-correctable-subslice                          0x1000000000000013      0
>>>> error-gt1-correctable-l3bank                            0x1000000000000014      0
>>>> error-gt1-fatal-subslice                                0x1000000000000015      0
>>>> error-gt1-fatal-l3bank                                  0x1000000000000016      0
>>>> error-gt1-sgunit-correctable                            0x1000000000000017      0
>>>> error-gt1-sgunit-nonfatal                               0x1000000000000018      0
>>>> error-gt1-sgunit-fatal                                  0x1000000000000019      0
>>>> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a      0
>>>> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b      0
>>>> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c      0
>>>> error-gt1-soc-fatal-punit                               0x100000000000001d      0
>>>> error-gt1-soc-fatal-psf-0                               0x100000000000001e      0
>>>> error-gt1-soc-fatal-psf-1                               0x100000000000001f      0
>>>> error-gt1-soc-fatal-psf-2                               0x1000000000000020      0
>>>> error-gt1-soc-fatal-cd0                                 0x1000000000000021      0
>>>> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022      0
>>>> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023      0
>>>> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024      0
>>>> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025      0
>>>> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026      0
>>>> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027      0
>>>> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028      0
>>>> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029      0
>>>> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a      0
>>>> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b      0
>>>> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c      0
>>>> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d      0
>>>> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e      0
>>>> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f      0
>>>> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030      0
>>>> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031      0
>>>> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032      0
>>>> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033      0
>>>> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034      0
>>>> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035      0
>>>> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036      0
>>>> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037      0
>>>> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038      0
>>>> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039      0
>>>> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a      0
>>>> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b      0
>>>> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c      0
>>>> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d      0
>>>> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e      0
>>>> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f      0
>>>> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040      0
>>>> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041      0
>>>> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042      0
>>>> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043      0
>>>> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044      0
>>>>
>>>> wait on a error event:
>>>>
>>>> $ ./drm_ras WAIT_ON_EVENT --device=drm:/dev/dri/card1
>>>> waiting for error event
>>>> error event received
>>>> counter value 0
>>>>
>>>> list all errors:
>>>>
>>>> $ ./drm_ras LIST_ERRORS --device=drm:/dev/dri/card1
>>>> name                                                    config-id
>>>>
>>>> error-gt0-correctable-guc                               0x0000000000000001
>>>> error-gt0-correctable-slm                               0x0000000000000003
>>>> error-gt0-correctable-eu-ic                             0x0000000000000004
>>>> error-gt0-correctable-eu-grf                            0x0000000000000005
>>>> error-gt0-fatal-guc                                     0x0000000000000009
>>>> error-gt0-fatal-slm                                     0x000000000000000d
>>>> error-gt0-fatal-eu-grf                                  0x000000000000000f
>>>> error-gt0-fatal-fpu                                     0x0000000000000010
>>>> error-gt0-fatal-tlb                                     0x0000000000000011
>>>> error-gt0-fatal-l3-fabric                               0x0000000000000012
>>>> error-gt0-correctable-subslice                          0x0000000000000013
>>>> error-gt0-correctable-l3bank                            0x0000000000000014
>>>> error-gt0-fatal-subslice                                0x0000000000000015
>>>> error-gt0-fatal-l3bank                                  0x0000000000000016
>>>> error-gt0-sgunit-correctable                            0x0000000000000017
>>>> error-gt0-sgunit-nonfatal                               0x0000000000000018
>>>> error-gt0-sgunit-fatal                                  0x0000000000000019
>>>> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a
>>>> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b
>>>> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c
>>>> error-gt0-soc-fatal-punit                               0x000000000000001d
>>>> error-gt0-soc-fatal-psf-0                               0x000000000000001e
>>>> error-gt0-soc-fatal-psf-1                               0x000000000000001f
>>>> error-gt0-soc-fatal-psf-2                               0x0000000000000020
>>>> error-gt0-soc-fatal-cd0                                 0x0000000000000021
>>>> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022
>>>> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023
>>>> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024
>>>> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025
>>>> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026
>>>> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027
>>>> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028
>>>> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029
>>>> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a
>>>> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b
>>>> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c
>>>> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d
>>>> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e
>>>> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f
>>>> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030
>>>> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031
>>>> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032
>>>> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033
>>>> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034
>>>> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035
>>>> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036
>>>> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037
>>>> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038
>>>> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039
>>>> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a
>>>> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b
>>>> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c
>>>> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d
>>>> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e
>>>> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f
>>>> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040
>>>> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041
>>>> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042
>>>> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043
>>>> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044
>>>> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045
>>>> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046
>>>> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047
>>>> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048
>>>> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049
>>>> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a
>>>> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b
>>>> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c
>>>> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d
>>>> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e
>>>> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f
>>>> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050
>>>> error-gt1-correctable-guc                               0x1000000000000001
>>>> error-gt1-correctable-slm                               0x1000000000000003
>>>> error-gt1-correctable-eu-ic                             0x1000000000000004
>>>> error-gt1-correctable-eu-grf                            0x1000000000000005
>>>> error-gt1-fatal-guc                                     0x1000000000000009
>>>> error-gt1-fatal-slm                                     0x100000000000000d
>>>> error-gt1-fatal-eu-grf                                  0x100000000000000f
>>>> error-gt1-fatal-fpu                                     0x1000000000000010
>>>> error-gt1-fatal-tlb                                     0x1000000000000011
>>>> error-gt1-fatal-l3-fabric                               0x1000000000000012
>>>> error-gt1-correctable-subslice                          0x1000000000000013
>>>> error-gt1-correctable-l3bank                            0x1000000000000014
>>>> error-gt1-fatal-subslice                                0x1000000000000015
>>>> error-gt1-fatal-l3bank                                  0x1000000000000016
>>>> error-gt1-sgunit-correctable                            0x1000000000000017
>>>> error-gt1-sgunit-nonfatal                               0x1000000000000018
>>>> error-gt1-sgunit-fatal                                  0x1000000000000019
>>>> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a
>>>> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b
>>>> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c
>>>> error-gt1-soc-fatal-punit                               0x100000000000001d
>>>> error-gt1-soc-fatal-psf-0                               0x100000000000001e
>>>> error-gt1-soc-fatal-psf-1                               0x100000000000001f
>>>> error-gt1-soc-fatal-psf-2                               0x1000000000000020
>>>> error-gt1-soc-fatal-cd0                                 0x1000000000000021
>>>> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022
>>>> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023
>>>> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024
>>>> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025
>>>> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026
>>>> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027
>>>> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028
>>>> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029
>>>> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a
>>>> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b
>>>> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c
>>>> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d
>>>> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e
>>>> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f
>>>> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030
>>>> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031
>>>> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032
>>>> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033
>>>> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034
>>>> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035
>>>> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036
>>>> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037
>>>> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038
>>>> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039
>>>> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a
>>>> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b
>>>> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c
>>>> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d
>>>> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e
>>>> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f
>>>> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040
>>>> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041
>>>> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042
>>>> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043
>>>> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044
>>>>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>> Cc: Oded Gabbay <ogabbay@kernel.org>
>>>> Cc: Tomer Tayar <ttayar@habana.ai>
>>>> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
>>>> Cc: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
>>>> Cc: Kuehling Felix <Felix.Kuehling@amd.com>
>>>> Cc: Tuikov Luben <Luben.Tuikov@amd.com>
>>>> Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>
>>>>
>>>>
>>>> Aravind Iddamsetty (5):
>>>>     drm/netlink: Add netlink infrastructure
>>>>     drm/xe/RAS: Register netlink capability
>>>>     drm/xe/RAS: Expose the error counters
>>>>     drm/netlink: Define multicast groups
>>>>     drm/xe/RAS: send multicast event on occurrence of an error
>>>>
>>>>    drivers/gpu/drm/Makefile             |   1 +
>>>>    drivers/gpu/drm/drm_drv.c            |   7 +
>>>>    drivers/gpu/drm/drm_netlink.c        | 195 ++++++++++
>>>>    drivers/gpu/drm/xe/Makefile          |   1 +
>>>>    drivers/gpu/drm/xe/xe_device.c       |   4 +
>>>>    drivers/gpu/drm/xe/xe_device_types.h |   1 +
>>>>    drivers/gpu/drm/xe/xe_hw_error.c     |  33 ++
>>>>    drivers/gpu/drm/xe/xe_netlink.c      | 517 +++++++++++++++++++++++++++
>>>>    include/drm/drm_device.h             |   8 +
>>>>    include/drm/drm_drv.h                |   7 +
>>>>    include/drm/drm_netlink.h            |  35 ++
>>>>    include/uapi/drm/drm_netlink.h       |  87 +++++
>>>>    include/uapi/drm/xe_drm.h            |  81 +++++
>>>>    13 files changed, 977 insertions(+)
>>>>    create mode 100644 drivers/gpu/drm/drm_netlink.c
>>>>    create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
>>>>    create mode 100644 include/drm/drm_netlink.h
>>>>    create mode 100644 include/uapi/drm/drm_netlink.h
>>>>
>>>> -- 
>>>> 2.25.1
>>>>
