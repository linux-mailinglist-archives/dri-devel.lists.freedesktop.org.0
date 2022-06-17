Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B821454FD7F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 21:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F9B10E449;
	Fri, 17 Jun 2022 19:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8841010E437;
 Fri, 17 Jun 2022 19:27:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbIKLoMtUEzXP55whEYL1W+DwNUo6AdhctOmSWtZhWGsTV5pz/pNFiJGsJ0VpckHyloHmWvIpVBOsb20BYSzD5/7DadqYIXcxddEIyx5kyLH6LpRPX0B7qS50lyYSak4RRyp6gvibnKfT2JOrSMB5mCpxsBlrhSP6kSDuOidw/e/0DKSV/ajRCnnvOrktHEqvj1dmcR83pmq0MUZ215Q3cPxhOw+kW9zQHr8wEY4Eyf53JmmS6rfRqQCgGiUWyUTA3rCUo4DWNqLyikkKH9G1BT1VMryc1hcdLyNuoKvbAC/MK0gyWzix6/V5EVeC3v6rDSXRTUrb1W1ukflcEUbcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4A54WpO8Or7yFvdqAJK3w9VlcZlbDxJd5nnTE7n1vYs=;
 b=XMDL0xakgHTvi2DWepmq9pEt4sHfcgu/lv2Mu+aiO84mwNCd84VDwTPDTD9qwChEXwMzqHZzd6pgnsjgn8AFdK+yHiWoxZucJV/9T+vHK/icmgtSE12Vi5PAzIO1HXeKL76bD+wwbSp0oLM9RBD0PwnVCYbQBWNpLM0/jDolpME3mZncUIV9+4tYj1dak95uMfO84tjUri8MrVYRrs2ZUjtfqCe9Ny8jVzQWbyVdlfekVH1d/Dq77ZxuXld+d6l+bM0bzAW+8kHibVfQgaiU7vRfK46woMKvkOypmvu4GelYf9LrGOkXZB1JofZIikJuBopEZbWOz8+G/SU8QmYW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4A54WpO8Or7yFvdqAJK3w9VlcZlbDxJd5nnTE7n1vYs=;
 b=kagjKiJrW7hyDT8Wfv7j46fGDwux7RxKQjGtOKksXVvsY+il2lNPE8mqJYvBXPQqLrlM6CPWCiPCm/ilNnZtsWZI9+9ksSwxHtOPpEkNaqnIaynQVReumMTm11CDWEi0dTZseoFVDS5QKs96ituCDhcAm1K8cGlA0TSeC0N2fHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by DM4PR12MB5961.namprd12.prod.outlook.com (2603:10b6:8:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 17 Jun
 2022 19:27:48 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db%5]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 19:27:48 +0000
Message-ID: <ddcebcc1-fb0a-e565-f14d-77c9d48f2928@amd.com>
Date: Fri, 17 Jun 2022 14:27:43 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, jgg@nvidia.com
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
 <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
 <7605beee-0a76-4ee9-e950-17419630f2cf@redhat.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <7605beee-0a76-4ee9-e950-17419630f2cf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:610:76::8) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2b1d835-9072-4ef3-d26d-08da50977689
X-MS-TrafficTypeDiagnostic: DM4PR12MB5961:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5961DFC7BAA8304C022F6389FDAF9@DM4PR12MB5961.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fwt7LAsppxBZiaA4juYs1KGgc71fRgRV9eDvNiRi3win4EoF3CJiCW7Ib5vzL1gHkUxVzfbA2YgHXl7EmzGDS/cG4IqL3p60oZ+LoA9/JO9Hfl74pdmFdmZ+PbCfEYcTC8vttnQqHMNaA2QpNufw5+r2SaYRV284rStxZxkjHYZYZ4Kapw+ccFbywPlAGZ30qCgSmfpMmGsjVkQv6UaJcIvpCEnvw8tCFawsxqE+Xk34sLrrMGIWDWedP+ItpUZGNaxBOiuTeMbVqLU1DQk2WL1qtigReKvDVppr8NZ4WLe+lsS4PrpN1/N+SSAet6oxbCSQJ9vNqIMcZUAhGhz3X3k8mbHV70eGVd8dWri6yHxjOI+xkaQ+2XSMUwTGmfSSTh2tjryy4eZmTpILTxlbhTmiHSKzRMhqLsvNua1JE6VPCKtQRngx2V0RTKQ+WuhpYnyh8VGyZYhfYmJw/jojYIt1itOxXmYVKh4GgHsct67xZW9AWOBMYF0uU1hsRZ518vTm9GiR4rU4JP2L32baEEyBsqYbb+kpbPXbQg+z4kzfK5cp5p6Fout1++mQV3xPrk903BchkJ+w7fGa/SqR3OBcQUYfHmInBpY830J0X5AJ04NO/oe1nnfyxj+tPMcl2CymCcK2g9VhpFi3+/CXpIAjSbxrH/3+a4/5aBrfpm6URhHouaz59CumMloOtf0prsJ0e0bgWHS4XAf1ubRn2iZtwsCDMxqUGXtk5j5N5SAI/5hCa6HVS++0OLs9CBSu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(66476007)(66946007)(66556008)(2616005)(4326008)(316002)(186003)(86362001)(83380400001)(8936002)(8676002)(31696002)(6512007)(7416002)(38100700002)(26005)(6666004)(53546011)(36756003)(2906002)(5660300002)(498600001)(6486002)(31686004)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTBNa3RsZzQ2ZlY0KzRNNURuNEk1eTM3VlIwc2Y2SmtTVjdxdUpuODlSdFFX?=
 =?utf-8?B?ZWhoNk9kOXdmMENGYkVnWDJlbDV0d1dJendaa1FWRitwenFkRmw0eVVlNDJN?=
 =?utf-8?B?aHIwN3RxWlRzK3RaWVlhbXZwTzl3TEhLZ0wwaDZ0eCsxRmFLVDdaWENMSVVo?=
 =?utf-8?B?QUk3RDNsMktKLzZVNXRYL25sOHBiVVYzMmE2Rm40RFdXZ0JZT0Jpb3FTN1NT?=
 =?utf-8?B?TFNpWWFlZjJzSngvNVlEc0s0OGtEQjh6ZnVSYjh3Lzd4bkJJTVZseTNGSndH?=
 =?utf-8?B?ZUd4SHd4SWc0ajdyOGNldFFGb3FaNGRGRGpwdko2RXM0aTZtNjJlMGJkY1Ny?=
 =?utf-8?B?NENGZXpPZERWcUU5ZHphNktPdkh0cHVWWkhLUjk0V1VIUThXdTd1eW91akov?=
 =?utf-8?B?NFFRMlRnZUlUeUV6aU5rR2pIWVBRcTBBT2wrY1JJem9YYWxRQk5FcGRtSXJK?=
 =?utf-8?B?QkZxeUJGaWlxSHJIZ3B1VlZpeWRmaTRwWEpUYlMyZGE5S2tNSSs5a0lyQlZG?=
 =?utf-8?B?cUhPQUpVdW5JMnpoZ0VMOXZGNFc5dGNOZzBmUDJnMjlKNks2RjhvSTFWUFF1?=
 =?utf-8?B?a2lhZWE4SFcvN2U1VldhTWVjZktEdnN6RzlWb3kyVlN5TFBCclNuYVlhSFVD?=
 =?utf-8?B?Kzg2R1BKTXI1Qzk0ZXBxcExFQ0RxQ0t5YlNtRHBwdFNzTU9yUXlLQm1jZ3Vh?=
 =?utf-8?B?UEhnb2hweXAvY3hZQjlSSFpMTkw0OHd5T21yQlE2VGVVVFZKMG1udnpKV1FQ?=
 =?utf-8?B?MGZoTFFhVDZjS2lLd2FlcVI2WDhRU0p2RGFiSnZtYUdVRFFpRzBwcVpjUTUv?=
 =?utf-8?B?U1lpdENURis4MkVldUl6bGdOdm9xRkRuNzdoZFhuSUV3QlFkeStTczFvdkhS?=
 =?utf-8?B?V2JaamdnWFhJbFNoclZCb3B2eWR4TWRaTm9VTE1OQ1ZEZkdNeVh3c3JhcE1E?=
 =?utf-8?B?OTkvOWlPVFBXTUc3S1JvK0xQWDFlc3NNbWEydHc3d1dYNUc0cWx5cWhVdG8x?=
 =?utf-8?B?L3R4aTdMT0ViV0Z2dUpFd0xhOWhVYkhGSzEwUWF3TGRZMzBNNmw1QWRjU01C?=
 =?utf-8?B?aFV2MGpuR2tKV3Z5ekluNGdYV0dwS3RWaUNPVzRaOE9yZ3pDK2pDaGljenB0?=
 =?utf-8?B?R0I5em1QVGJrbC9veW9SVlluT2twSWcvdEVaNUJjVWFjNTJ4OHR4MDZpNVBJ?=
 =?utf-8?B?YnNsSDBEM1JEZFh4WG4vbk9kR2V5cTZaekxuQVRUbDlXT21FaXNEVXRXWmJW?=
 =?utf-8?B?Mm95b09iN2gzMnY1ODdwR1dpRTFFUVIwejVVZ1h1NVppc3R4am9OclFOSEF0?=
 =?utf-8?B?eDcraERveHdkc05DZk1NZU1ZeDFqSXUyYWpqeTJjSCtzTDNLQ2hrVE1Ta0ty?=
 =?utf-8?B?TEpHL3FMOEI3ZGV0dDlaTS9YTVUydWpqUTJIamdUNWtuK0RDdXgzRHRHcDc3?=
 =?utf-8?B?RkdLRVdZUW44MGFUNDdFNVk0UmxuVFlzMDNNdnZaeEpLcDhHdXl2R2gxTkdE?=
 =?utf-8?B?QlB6V0NlOHdoYlZXcUZOVUFTS2VGSU41UGlTejQrandkeG5Ua0NDUmVzcE1Q?=
 =?utf-8?B?dlgyaUUwMWhvejAySEhtaU1nQUFablFzVlJYRzZPclpoMHE0WWhXR0xjUDVZ?=
 =?utf-8?B?OFZCQk1Gcm94Q1ZkaHNwUHlRTXh4RlNjYjRtRHVwdnYrY2pEUE9jUlNNV2pX?=
 =?utf-8?B?MUFIL3o5ektHdnJqT3NKRnF4VFBZVnBtTTkxVDU1VXhzOVdxdXRVZWxEYjJM?=
 =?utf-8?B?Q0FydnBWUHJhdXA0UTJaZXJtVGZpQlRJbzdBSkk0NWpjdTFnU08wNWVPU1lL?=
 =?utf-8?B?bXB0ODVtTjdRWG5rN3FLUjdnNWFyL3pPQ0k3cmI4Tnc5VDcvdmJCNTVEZXBO?=
 =?utf-8?B?RXI1dnEyZXFZbk91ZnU5K2xZOVhHZzhVSERWMVpobEE0a1pvb3pReURpNHpo?=
 =?utf-8?B?SWxGRkFYMDIzdHhyMEhXczF4UFFabVhpMzZCbUtMYWF1RkZBVlB4NzNvNUkv?=
 =?utf-8?B?dDROTWxkekt4S0pRQk1odGgwdjNHV3dKd2lrcUZGQXVJMVhvYk12Rnovb3Br?=
 =?utf-8?B?Z1g0WmNVUFlmdmxYV1l5Tm9BaUlvQmVnY0lGOE40Rk9jZWV6Rm9TS0lZcUJT?=
 =?utf-8?B?RTg2THllWDBVa1ZNMXpoR2QwU0xyamcwUU53L1h1cWxlZGVJOUZHQy9LRGNV?=
 =?utf-8?B?RlAxSjNvcTZSYnZtSzVJSEo4ZmZEVzhHb1BjWFd3QkhiOFpTWElDNktXdFJk?=
 =?utf-8?B?aHlCWU0raklBcWtoMEpYdzhia1kzZlI1WE04eDV4Uk1jSjBqRjFJZVQ5VVJ4?=
 =?utf-8?B?dld5VVNyZ3NMMEVmTnkvTnVBUHJMZitveHFJRnp3RkFmNXZralQ2UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b1d835-9072-4ef3-d26d-08da50977689
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 19:27:48.7092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJ48FQQos3d8UVRq3VQxSO/Kts6JLKNFws5WJOiOB4lOvlk13KGsXPOnP20t7rhpp7mXTt13ndtkxYFwdNkT4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5961
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
Cc: rcampbell@nvidia.com, willy@infradead.org, Felix.Kuehling@amd.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/17/2022 12:33 PM, David Hildenbrand wrote:
> On 17.06.22 19:20, Sierra Guiza, Alejandro (Alex) wrote:
>> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
>>> On 31.05.22 22:00, Alex Sierra wrote:
>>>> Device memory that is cache coherent from device and CPU point of view.
>>>> This is used on platforms that have an advanced system bus (like CAPI
>>>> or CXL). Any page of a process can be migrated to such memory. However,
>>>> no one should be allowed to pin such memory so that it can always be
>>>> evicted.
>>>>
>>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>> Reviewed-by: Alistair Popple <apopple@nvidia.com>
>>>> [hch: rebased ontop of the refcount changes,
>>>>         removed is_dev_private_or_coherent_page]
>>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>>> ---
>>>>    include/linux/memremap.h | 19 +++++++++++++++++++
>>>>    mm/memcontrol.c          |  7 ++++---
>>>>    mm/memory-failure.c      |  8 ++++++--
>>>>    mm/memremap.c            | 10 ++++++++++
>>>>    mm/migrate_device.c      | 16 +++++++---------
>>>>    mm/rmap.c                |  5 +++--
>>>>    6 files changed, 49 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>> index 8af304f6b504..9f752ebed613 100644
>>>> --- a/include/linux/memremap.h
>>>> +++ b/include/linux/memremap.h
>>>> @@ -41,6 +41,13 @@ struct vmem_altmap {
>>>>     * A more complete discussion of unaddressable memory may be found in
>>>>     * include/linux/hmm.h and Documentation/vm/hmm.rst.
>>>>     *
>>>> + * MEMORY_DEVICE_COHERENT:
>>>> + * Device memory that is cache coherent from device and CPU point of view. This
>>>> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>>>> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>>>> + * type. Any page of a process can be migrated to such memory. However no one
>>> Any page might not be right, I'm pretty sure. ... just thinking about special pages
>>> like vdso, shared zeropage, ... pinned pages ...
> Well, you cannot migrate long term pages, that's what I meant :)
>
>>>> + * should be allowed to pin such memory so that it can always be evicted.
>>>> + *
>>>>     * MEMORY_DEVICE_FS_DAX:
>>>>     * Host memory that has similar access semantics as System RAM i.e. DMA
>>>>     * coherent and supports page pinning. In support of coordinating page
>>>> @@ -61,6 +68,7 @@ struct vmem_altmap {
>>>>    enum memory_type {
>>>>    	/* 0 is reserved to catch uninitialized type fields */
>>>>    	MEMORY_DEVICE_PRIVATE = 1,
>>>> +	MEMORY_DEVICE_COHERENT,
>>>>    	MEMORY_DEVICE_FS_DAX,
>>>>    	MEMORY_DEVICE_GENERIC,
>>>>    	MEMORY_DEVICE_PCI_P2PDMA,
>>>> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
>>> In general, this LGTM, and it should be correct with PageAnonExclusive I think.
>>>
>>>
>>> However, where exactly is pinning forbidden?
>> Long-term pinning is forbidden since it would interfere with the device
>> memory manager owning the
>> device-coherent pages (e.g. evictions in TTM). However, normal pinning
>> is allowed on this device type.
> I don't see updates to folio_is_pinnable() in this patch.
Device coherent type pages should return true here, as they are pinnable 
pages.
>
> So wouldn't try_grab_folio() simply pin these pages? What am I missing?

As far as I understand this return NULL for long term pin pages. 
Otherwise they get refcount incremented.

Regards,
Alex Sierra

>
