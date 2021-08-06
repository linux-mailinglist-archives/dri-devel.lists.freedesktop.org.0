Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5513E276B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 11:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2886EB6E;
	Fri,  6 Aug 2021 09:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AF86EB6E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 09:38:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvzOQuawnN2UQ6bnAkhjsOFn40XtMng/PWvi3qSjXFALAzEGyWvoZnc87hKGFm4HfxUiJIaQK5trfycFMnElC+TvmMyNLQNifo7QHDHIRqJzmVuyv45r+Z698p3D9FcA7S4x4UxzKmOa3NdbPT0IvpUc+tbviESkAeg/AsLJzby1xXnWOcU2WDsvSlXdWvyZTCT2VIu3fbO/F3lFpiyFIhTvffFUvuExEyq6yBVBpD9AMlfAuzi+oZMBFZ5ntAXbDvlEb0/O+J3TPW/NPisPcZdrp1B9kkilmMBTAjaM6JOK+WehYG2FeevZwP07PCTqSXK7iS6te+X0PC4pIcH55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckoisSXQKGAgMdk+x4Tr+IgfRelryh9GfwQ612igMEQ=;
 b=Rru8s+ZwPClj/jdym/QOKbpacob3VKF2gOh5cgU+p5PvydLLt5y/lESFoVoNDdsqZ/EQjCAizOLVdaJcTNPOPeZdXIVIMX4ciZqtOKDAOS2zQ6+A76REzJJdNInH29/sdEd3A2Wqnmg5Odm2IZ1QJ2acD7e/C8ktQipwR8fyZmHUJZOavLqsiapgr4tv2ICfZ1rAd1Z3a3l0RbgL8VP7nGu1JzqZNqn4pcH4Dx53e9yn+rMWLmIuZl7AfJ7v+Zpd72XwY5mWxBp4+3J0fyPgQkvyXNm6JHy2z3P1xdNYTpExeB2jLOwJoIovITg9TdKv2Qq5wPWSBRDi3rn0Kb5rwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckoisSXQKGAgMdk+x4Tr+IgfRelryh9GfwQ612igMEQ=;
 b=vGaueLgqybmzjfBRNfKkideMUOfKrlCYKcRJldsX9CvPFne5RvF/EWHbPu9WidfF9aEOW2RCKTudqhN9ORU7vRCv6EOPiI/YBx+lSshfYZLCHgjhHHj09d299PkgEnrIotPEr/PLWpqMwEO6u21XcxBNeO/CEOFsjeLoJNI0YK4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4191.namprd12.prod.outlook.com (2603:10b6:208:1d3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Fri, 6 Aug
 2021 09:37:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 09:37:59 +0000
Subject: Re: [RFC PATCH 13/15] mm: convert MAX_ORDER sized static arrays to
 dynamic ones.
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Michal Hocko <mhocko@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 Dave Young <dyoung@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, kexec@lists.infradead.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210805190253.2795604-1-zi.yan@sent.com>
 <20210805190253.2795604-14-zi.yan@sent.com>
 <586dda97-dc64-ade2-6736-a531e225acbc@amd.com>
 <0D3441BA-2A11-4BCA-BFD5-CAB8EB915B8F@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bdec12bd-9188-9f3e-c442-aa33e25303a6@amd.com>
Date: Fri, 6 Aug 2021 11:37:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0D3441BA-2A11-4BCA-BFD5-CAB8EB915B8F@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0069.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:a560:2e33:6830:4c15]
 (2a02:908:1252:fb60:a560:2e33:6830:4c15) by
 PR3P189CA0069.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 09:37:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9310f180-02f7-42b8-8b5b-08d958bde0da
X-MS-TrafficTypeDiagnostic: MN2PR12MB4191:
X-Microsoft-Antispam-PRVS: <MN2PR12MB419158BD97752B615636974183F39@MN2PR12MB4191.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N5/O7YnT6vywZK/NIdTl/ijaERT34kDXeswwuTwTsORMvqM8yIyyWweCujwuuOOOpNXewbXH8NtskiXOOVWb91dv7jTKBxaIXtnfHMQGrp84J/EE8AGHSl3tDqcOK7vdQeBbOs/LNWLbcqjQH1FCRpV44wpUp8rB9af6EJtXE0GpTY1Uk0X8XWIcvFi5RoHszb1kAWUXEW+maN7iHgMYB11J5UKm1Mci3i6oIDyEvx+I0nqQ3Fxqpn+CpdFa/DiyGJzgNR504gDheVnVajQrc2FdeaDX/EvmEuLcxj8YBZ+8YPqQ5zVKh2ccOMSbJ5eUpfu62rBUE37sdvAwWvQvekR+utzjlRQmoCCe779MqVa+f3YhwHtD2DBjy+aAPDi99mCbRfwxgshVpcx1c2fxvhsQnekOcjyRrgXvteGYyIFH4kbx0rGnNOrDfQqYE83eDYzlKcRnOLUhY9SST5J5DUeotYajZ4VUg0jBJ1yalRb9hUsyd8tTubAdZQC2DoHWoFJOaf1TNOqqlXYBLMIzNqpAYRPo4k2ZNPAliBj9ArpE27zd4xgxkpkeUdtSebmWQO0ozXx2p/8gvLVoF9UhCgOOqS0KgU+W0TuTKzPIsWHEJzVwBByhvW/WYBR5d/SHueyPDYmqGtGqZJvnh5Dpel0oHP8RwIhLQ+J6mhueO8I6O4XPzR247R/BolvAQDANGg151uyFHaPNzmk78JK5MX7nujq9qgce8Zu+aoJ1v0A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(8936002)(316002)(8676002)(6666004)(6486002)(6916009)(2906002)(66476007)(31696002)(66556008)(86362001)(186003)(5660300002)(54906003)(2616005)(478600001)(66946007)(36756003)(31686004)(38100700002)(83380400001)(7416002)(66574015)(53546011)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2NDRzFtelAxK1l4cXpQd29wU0hyV1l2WjhWRG9YN0E2YnN6OGpQb3grWHdC?=
 =?utf-8?B?WmJ0dVoxd0U5cFl4SGlOR2NKR0tCMTdPZVFZU3hQOU5NMzhJazdGSjhEU0hK?=
 =?utf-8?B?L1J6bDBod2Z0dkk1cWRGanlIMkVYRGdyWTdicERBMG5FbGZVeVNPcTFDN09k?=
 =?utf-8?B?eGI0ZllRRUZnc3hmYWFmQmkxcnBrYWtJZHlUd1FNQ2cwL0hqME9yNDlyOGEx?=
 =?utf-8?B?K3FFU0tiL1plNHpCcXJoVDhOdjR1bGh6cVZNNEhJanVUWVFBdWpnRVpUU2Fk?=
 =?utf-8?B?Z2lnbkVtUDFydkFpQnllNlVMVGhQM3k0MlVpb1UrcWdZRFhYaE93ZVBFVkt0?=
 =?utf-8?B?TTBvQWRYMVhmQlk4TWlNK0d2ZG5PSTlFZlNibHdRQ0d4ZE9tRmVoMlRDeHkv?=
 =?utf-8?B?djVwSGVLZURBOENHRFBUWmJUVStxaXpmV0M1Y09KMGVXUlpCT2RiMDJBNVBL?=
 =?utf-8?B?TlBLeEZ2SGE4d0tybWMxcHp2V2VUeFFBKzhBZmZ3RmN1cjQ0ekpGVmN2cGd6?=
 =?utf-8?B?bmFTSlpyNC90Sm9WYmVJbTZ6SFFKeW5vZURyaGM0UjJSUk9QM0FIQVpXOUdq?=
 =?utf-8?B?dXNkRHRLcXQ4amYyeS9BR05BWmErRXVPS3BIYURIdzJzTi91RkRRaExWVG9U?=
 =?utf-8?B?RkUyOXBSQ3R3Sk9tc3REOTNiOC9aRTF4WnNMS0NwU3RtTDVUM0o0dXNtWWRz?=
 =?utf-8?B?MnZ0UzBHc0lLVjgrY1NZUFZ3THNBSVI2bDNQQlVCZzcwTzNZcnd2UUNQUUFm?=
 =?utf-8?B?WjE1WndhMFhuRy9PeEFHWGtpM2kwZ3FGUXdWS1lTSGx5V0Z2QTNybDJSVEg5?=
 =?utf-8?B?OEZ6eFRQQVp4Rk1YOC9PZ1NJdHYvai9wRzZkS2pNN2VrWXBRdzF6enROOEYx?=
 =?utf-8?B?T25qaldESHdXamZCMWpyYUpVSkxWcExxeFZ2RVhiRFU5Y09vWlkyQ01YSDdE?=
 =?utf-8?B?dERxT3V3ZHM1ekFoSW9maXVOZ3JDaTFneFRGODA0MHovUSt1dVlJckN1OTl5?=
 =?utf-8?B?T1hTbE5LSllzWDdYWEV1M2ZDSE1oWUlDakxrcm9qa1pEVGVzYTFTSmQ3STNJ?=
 =?utf-8?B?bWx2YmxFQU5tOXY5c1pxQmNGSHdZZEd2NFBYaWZobkVNd013YlF1d2wzUS8w?=
 =?utf-8?B?SEZLN2VMeC9LeHcyVWh2eGhDdzRNOWZOcitQNVdnV2RDZHN0UzF4MitRVXhD?=
 =?utf-8?B?R3hlNFBTSldoRHB5V3AvUlRDQUoranRyVTZEcHRNMVZwYlVObUdWVXBkWGdD?=
 =?utf-8?B?TGoyNzlpc0xBZVVTV1JtZFd5NVhDUkE4YlRSWE5sWWFqZjM3WXlXaVk3ZEQr?=
 =?utf-8?B?ZkxwQXpLa3EzODRFQkYyMzhLaGhXaDdMd3BVTVJrM1pqQllSN2toelFLWm1L?=
 =?utf-8?B?dmw3MFJnbXZkVlc1UXFPZDVKbUs2aHBoVWJNOTB3SVRsUGR6YmZBUnlJZHYv?=
 =?utf-8?B?eEJXaTBHcmJDZjlXTEI1VjMwMzB5SWxPaURJMGR5azZYMUF6MVBycmR1eWN4?=
 =?utf-8?B?dFMwTm1UMjB6azZlNkpKWndveGVsU1g3VXhvM05xeEs1MENBek83VUVkNERX?=
 =?utf-8?B?MHlOaFFoUFh2ZEtTL2FEb2xaQ2JNUFY0dEpYNVhmd1dzT1EzTGM0ajg5dWlG?=
 =?utf-8?B?ck5MS2dMUGFaOTNDTC9aU0owLzJicjBDTDdNeHY5MSsvbUo3WTY1WWNGY0l3?=
 =?utf-8?B?YVBnSWJ0bHQ0eEdSa0hzTklMUnVTWlV0SVMyVXJuUUMxVVFMWDhreDMzZ3hy?=
 =?utf-8?B?eUNveWdKc0pDWm9jK3RnYm00KzNiSU5SY1JWR1pXUUFQa0c4V3ZRK09wbVRU?=
 =?utf-8?B?WTVTZkZEMjZnaVNCd0xtU1crS0lNZlVGRklRZjFoRDBuWXFISlhIUnhPYW5U?=
 =?utf-8?Q?qcSh3lTwiCb3x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9310f180-02f7-42b8-8b5b-08d958bde0da
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 09:37:59.6376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcQo0/JWLbRNnIuCDOh3VTyj9WgFFKq5bJwEPkV+r/hhjX516NfY/Lkp3SFSfEbq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191
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

Am 05.08.21 um 21:58 schrieb Zi Yan:
> On 5 Aug 2021, at 15:16, Christian König wrote:
>
>> Am 05.08.21 um 21:02 schrieb Zi Yan:
>>> From: Zi Yan <ziy@nvidia.com>
>>>
>>> This prepares for the upcoming changes to make MAX_ORDER a boot time
>>> parameter instead of compilation time constant. All static arrays with
>>> MAX_ORDER size are converted to pointers and their memory is allocated
>>> at runtime.
>> Well in general I strongly suggest to not use the patter kmalloc(sizeof(some struct) * MAX_ORDER,...) instead use kmalloc_array, kcalloc etc..
>>
>> Then when a array is embedded at the end of a structure you can use a trailing array and the struct_size() macro to determine the allocation size.
> Sure. Will fix it.
>
>> Additional to that separating the patch into changes for TTM to make the maximum allocation order independent from MAX_ORDER would be rather good to have I think.
> Can you elaborate a little bit more on “make the maximum allocation order independent from MAX_ORDER”?

My idea was that you have a single patch to give the maximum order as 
parameter to the TTM pool.

>  From what I understand of ttm_pool_alloc(), it tries to get num_pages pages by allocating as large pages as possible, starting from MAX_ORDER. What is the rationale behind this algorithm? Why not just call alloc_page(order=0) num_pages times?

What we do here is essentially transparent huge pages for GPUs.

In opposite to CPU which can usually only use fixed sizes like 4KiB, 
2MiB, 1GiB at least AMD GPUs can use any power of two.

So it makes sense to allocate big pages as much as possible and only 
fallback to 4KiB pages when necessary.

Down side is that we potentially exhaust larger orders for other use cases.

> Is it mean to reduce the number of calls to alloc_page?

That is a nice to have side effect, but the performance improvement for 
the TLB is the main reason here.

> The allocated pages do not need to get as high as MAX_ORDER, is that the case?

Actually we would really like to have pages as large as 1GiB for best 
TLB utilization :)

> If yes, I probably can keep ttm pool as static arrays with length of MIN_MAX_ORDER, which I introduce in Patch 14 as the lower bound of boot time parameter MAX_ORDER. Let me know your thoughts.

Well you could do something like MAX_MAX_ORDER with a value of at least 
19 (1GiB with 4KiB pages IIRC). And then limit to the real available 
max_order when you make that a run time option.

Since the array elements consists only of a linked list and a few extra 
parameters / pointers we probably won't need more than a page or two for 
those.

Regards,
Christian.

>
> Thanks.
>
> —
> Best Regards,
> Yan, Zi

