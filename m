Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB52E781106
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 18:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB2010E0A1;
	Fri, 18 Aug 2023 16:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE11E10E004;
 Fri, 18 Aug 2023 16:54:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/k560Dfga+mSqnH4xHfefMZb6hLcBZFPPEjEA9ISSC32swzEXSLvab6cFb+yDUd2VHXDSgrU8D+LBcwITdsiwpbcfR6duNf976E+AmX/KUUtoBUN0u1Xup3tHz9HzVMSiG88VbacU4ZRLACJ6YFBv+QtafdKgMIZp01+877g5+DmWwf0lE2VPW9pZ3OPgEVWuEsp/2kZu0Y4OtAX2my+z6gtTHuY2zq0tqnFRZ2AngIrS6mak+Qd1lUGmxiTKlqDUN8J91RH6h1uD2g5rT4D/vHbANFfTjJjc7o7CE5BEBGVglMPXF7MvRq9YU6f9WIpxwD2bm86bMgAZ+jpVIo4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4eCNe933eBie+Jft5c/Uh/XRP16SYFnMZcYX+/0cKc=;
 b=megIA6IgFCAt/k7p4y8mjvAjq4beq5PMDPSebOtXr+o/sdle+WU3iIcJbuJzrBZt03z5ra4AaGrvv6F9DS4Dcn4r7OF9jiFqS2aKFSsXTY4+OOMtZUl+u9oMnJHQ+sKvpfZxcsSYlfh16SzyvRZu3a9E3peu9HhTngrNOcN/EaySplerDjw5woT8B0DRSXY3J/Oqj2Lqd2fDHlrF16fDXH+0be99a5sM/oORIMPz37IHSRohAAwNytoux+xCqVXqUVChcBgzwcBwA/eQJbHKqhCCd8g0chZHk+ylSTXmtNow4/jNd3h4ve8vstWDLzTVhX18epcvwwJtk3Cqq5gRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4eCNe933eBie+Jft5c/Uh/XRP16SYFnMZcYX+/0cKc=;
 b=fg+6bOBYiv2koHtsCMPhBngmCjXJyLa7Sudxkeh+kL74qMT1qW42DfAsNncN6KnPvVrgNqu9YDTxerDxrDGyUeSRiPMwMXuE6/ZWAS9e0b2ZRxIBiU455pRytNImTeemt+ag657j0TF/pAXxEDNqvOwSNvsB97lXAP+qGRLRZNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MW3PR12MB4411.namprd12.prod.outlook.com (2603:10b6:303:5e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 16:54:40 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb%4]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 16:54:40 +0000
Message-ID: <3aca3459-b4db-918f-ab00-232978574eff@amd.com>
Date: Fri, 18 Aug 2023 12:54:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Implement svm without BO concept in xe driver
To: "Zeng, Oak" <oak.zeng@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
 <SA1PR11MB69918E5603E286961789DE6D9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <3c125b60-df60-2037-c23f-918734e4973f@amd.com>
 <SA1PR11MB69916E51CE5A9217D447B91C9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <7ae5f112-d0e9-cc52-2b22-7265ea435cc2@amd.com>
 <CAPM=9tyots9C8wEU0TgGnFmLOkfqn62ngaYYjV2yuTf7jwDGFw@mail.gmail.com>
 <SA1PR11MB6991D7E239EAB23CC8A9A36B921AA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <7e655c2b-211f-6ea0-9dc1-feb0131a90e4@linux.intel.com>
 <SA1PR11MB6991C5F03C7F2850FE6ACF4B921BA@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <SA1PR11MB6991C5F03C7F2850FE6ACF4B921BA@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::28) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MW3PR12MB4411:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e55da37-5275-4e72-397c-08dba00bd04e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5dMGF0BIyPYA0PEnEVhF4kifu4f2Rbt5GIDiqUcJl+wgk6/dKNzSFHPTVEYfaQ0V7Se81gDn3o1KF+kkVA3TKQuDCG1P1P7Mt7MWQTd4Yh3mEznA2NxLD21/+X6mJEmy33S1GSfxGnfTeyaSQFjVUi6QpISsFlTIx9CBsoxwcigHYSDDZlaXzc6FVXflVMIJi0/7si4G8sR2S8pl3KJRr5hmX15hQ7pHPe9zltljM1z2yP3DEGztsRp58HsDfOiZQ1ManRgTgNPCpy5csWhXWN3/wJwA00oxYAvtXtFMoqQRI+LewuBG+pENE0jl+vKBL6BQ2WIVy/4IK+vfKmxetBRXOCpCsrggYEcLLGrEVGThyhWak8KjQXpkwC5Pv4M41R7JGQUOYp+/K8irMjNE5k2z/VWH884X7iKeG4HDeDHxgt4i2ottn3mh16rZwgJAzJSmuhcpX5BQI2/uwbyan51RSlofXwRtX0NjY5XY7hts00yEFK4eb5dTMYEiQaG6o8Xrd2dOzSPwbrfIwEqcm/9POQovH//qlrJ4bcw19iH+h7FeR3sV2Lk8+DUzDIowd6ltmeYQFk3fLIrdybIMUGg4rPtwzTUadJcoYsVF0+A/QNCDnAINtRtll61GBFur/iHVSY1Z3o+s1w+b+A4WBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199024)(186009)(1800799009)(110136005)(5660300002)(44832011)(2616005)(41300700001)(2906002)(66556008)(316002)(66946007)(66476007)(54906003)(31686004)(8676002)(4326008)(8936002)(478600001)(86362001)(31696002)(6666004)(6486002)(53546011)(36916002)(38100700002)(6506007)(6512007)(36756003)(66574015)(83380400001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2t4OVJiVnBRcEE0TnNITWxQSElBbFl0NVNDUFhRZmluS3paV3J3YnU2L0tO?=
 =?utf-8?B?NnYzano4Q3BJbFNrK3BKcC9jSlprSGNVaHl3YlJNWXFtdGo1amI5emV1Y2Fk?=
 =?utf-8?B?SDRqK0ZLdFNXMGpraGxpWDRSVDJhM2pOa1NEWHZBS0ZBVXZkckhqWXlzZFJt?=
 =?utf-8?B?V3pZa0ErQ3hkcFNRb21laTZCdmlxdWpPK1o4SHoyRE9zMVV1NXZJL1RwVHlZ?=
 =?utf-8?B?Q3ZJOVdOOW02ZW15N3NkMXRrN3dDSlJHbXI4dHVIMFR5TCs5bG1ucS9PUnIv?=
 =?utf-8?B?ekVNMDZXVUZjcVBKWlRrSGMxRFVPeHBtNWJ0TjVOUDdVd3IzWE1hRU9Fcklr?=
 =?utf-8?B?enM1MGRGOSttQUVxc0lPMktmMVk4dXZnS1RLd3kvYnUvQjFVRFcvd05yZHM5?=
 =?utf-8?B?a2FrSFRFeWpvZnZMOFltNWNQVlEvK2JaUk9WeElHeEJIY2xWSkZqRVBvUTVz?=
 =?utf-8?B?a1ZNYWFrYTVnT21VVURPYWd4Qmp3VzJ3Z20yYUcwNk1kakJwQVlkc00vK2xN?=
 =?utf-8?B?U3V3VGpTbUFKVk1UK1pPYktQSDhpUWxIWnEyM2NZb2NYbmFZYXQ0YThIV1Fv?=
 =?utf-8?B?WlpEK2h3TllyN1JTZWQ1NFBaUE5tWXp6TGdQa1cxdDBSZjhiR25yWWVLdnBl?=
 =?utf-8?B?d3hkZ1ZiT1BDRHlVMm83aGlJWngwUVU4SC9xeDhKbnRBazhxbTdua1BFa1Uz?=
 =?utf-8?B?RFd6WkpDeGV0RTJjVmFWeTJyY2NxSEliejk2Rkw5MWg2a3Z4S2dlL2YvQ0tj?=
 =?utf-8?B?ZUxLNWYxOTdtNXNUeG9GamRyOGgzWmhTeHdCbHNMZ2lBeG1lZm1wMVA5VFBl?=
 =?utf-8?B?Wm5TOWkvc3cwUXZlamlvS3VZcDhqVWgySGZKTWYrbFA1VlVpbjZSM1lLWWkr?=
 =?utf-8?B?Sm1ETWpXdzlFZmhOMC9LQjJZWTV1bGZhdHFjYnhUUzdXMUVpUFU2aWIzTEE4?=
 =?utf-8?B?d09VcHZmR3pCeTNobWQ1QWg2KzRxbE5MYVo1OXJjU2hlLytRZG1zVDBmejJ4?=
 =?utf-8?B?UmQ4WUROdzJJVllia2tKanF1M3haWEl3RmU1WFFmem96MHBwTUVuOGllTFpm?=
 =?utf-8?B?bXVnOUpaNHVPVmE5OFFIalpiM1dtYUtIUEhWTXJuWVExaGhqU1Z3OGtVdE9k?=
 =?utf-8?B?cGNyVnI3cUw2U3p0ZFBEeUxSS3VHUzZBTEVxTUxXU0RkcUwxZ3BRNzJIbGky?=
 =?utf-8?B?M1F2OUJOKzN0TXIzQitRMzVxQkpOZ3hZRDNpUGJleUVyVjg1bTlrM0ZtclVs?=
 =?utf-8?B?TmU3NVhsL1lXU3U5QWtCSk9RVXlTR09Sb09FRnNRY3NKRGVVMEUxbEszKzN3?=
 =?utf-8?B?MjYwaW5FZ0t4bWovdlI3cDhHRnY1UnluNzkreEdidUtaMUt6aUJXK2piUUc4?=
 =?utf-8?B?cmk5VHl5aStZUkk3WGNSVi9UeEhGL051RE4vMWpmNWhwekdRZHYyZEl6Y2NP?=
 =?utf-8?B?bnAwZGJRYWVJa2h1YXk3WVlMaDBmNzlDWW93RWQrYjVsMmJiazN2bVVoWGZE?=
 =?utf-8?B?OUJIcW4xVWZhdXRrVnpQT2NyaE5vK1o4VkRSdWhwb1IzaGE0SG9hZGU1clAw?=
 =?utf-8?B?TjFvMTNKZXB1bnd3Nk1uMUpUV2FkOTBJTUo4QlRtNDZseEV2K1hOeTRSU1g1?=
 =?utf-8?B?aE9Edmlla0xlOUFqRGxxYXZkZktGcm1IT3dpejhQajBPUXo2SGNWZ1FvZ1hR?=
 =?utf-8?B?eG9wZjZaUTk4b25OWklldUdhUEFXMUFBZXgyYkhBaWRJZWdrN2VPVStlQ2xJ?=
 =?utf-8?B?c1ZtYnVvdGNaYW5IRE5GSGhLclB2aHpiVTkxMXpYR2JhQzRPMGM1MTg4NXdY?=
 =?utf-8?B?WEVKL1B4NWdWSVhvdmNRY3VmeDA0NVdhUDRWSWFCQzlHV0I4WmZvNE5BdE05?=
 =?utf-8?B?OTJ0bkpGUVBaZ253bzhKcng0YVVUVUtRWlRabGhtQS83cjdQRC9NR3hMTUJM?=
 =?utf-8?B?RTdGdzB6YmhCbHpOTnZGaDFnREhvTnBJbW5jbThlWXp2aUxUK0dBOER2MGw1?=
 =?utf-8?B?eHJ6Q0NkcEQzTjNUdTl6RkZFN1R1UlFqcEQxTG1na0g0eTArekNIRnVISGpp?=
 =?utf-8?B?ZUlhVEpmS3o2REZMWENSY3lhb3BzZ0owSzdLOFMxRUY1Nmh2QnRvL1RPRGV2?=
 =?utf-8?Q?Ya3GBo9AL01qHH5kA1Suwi2cO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e55da37-5275-4e72-397c-08dba00bd04e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 16:54:40.4400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+01NKets3nGCJrAMmKTySGVBzLjTG1CS77Jn76n2hdfMzWKRjVWXdJQURuIGILpWN17loMbokzz7sGVSVZNvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4411
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 Philip Yang <Philip.Yang@amd.com>, "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-08-18 12:10, Zeng, Oak wrote:
> Thanks Thomas. I will then look into more details of option 3:
>
>     * create a lean drm layer vram manager, a central control place for vram eviction and cgroup accounting. Single LRU for eviction fairness.
>     * pretty much move the current ttm_resource eviction/cgroups logic to drm layer
>     * the eviction/allocation granularity should be flexible so svm can do 2M while ttm can do arbitrary size

SVM will need smaller sizes too, for VMAs that are smaller or not 
aligned to 2MB size.

Regards,
   Felix


>     * both ttm_resource and svm code should call the new drm_vram_manager for eviction/accounting
>
> I will come back with some RFC proof of concept codes later.
>
> Cheers,
> Oak
>
>> -----Original Message-----
>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Sent: August 18, 2023 3:36 AM
>> To: Zeng, Oak <oak.zeng@intel.com>; Dave Airlie <airlied@gmail.com>; Felix
>> Kuehling <felix.kuehling@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>; Brost, Matthew
>> <matthew.brost@intel.com>; maarten.lankhorst@linux.intel.com;
>> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; Welty,
>> Brian <brian.welty@intel.com>; Philip Yang <Philip.Yang@amd.com>; intel-
>> xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Subject: Re: Implement svm without BO concept in xe driver
>>
>>
>> On 8/17/23 04:12, Zeng, Oak wrote:
>>>> -----Original Message-----
>>>> From: Dave Airlie <airlied@gmail.com>
>>>> Sent: August 16, 2023 6:52 PM
>>>> To: Felix Kuehling <felix.kuehling@amd.com>
>>>> Cc: Zeng, Oak <oak.zeng@intel.com>; Christian König
>>>> <christian.koenig@amd.com>; Thomas Hellström
>>>> <thomas.hellstrom@linux.intel.com>; Brost, Matthew
>>>> <matthew.brost@intel.com>; maarten.lankhorst@linux.intel.com;
>>>> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; Welty,
>>>> Brian <brian.welty@intel.com>; Philip Yang <Philip.Yang@amd.com>; intel-
>>>> xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>>> Subject: Re: Implement svm without BO concept in xe driver
>>>>
>>>> On Thu, 17 Aug 2023 at 08:15, Felix Kuehling <felix.kuehling@amd.com> wrote:
>>>>> On 2023-08-16 13:30, Zeng, Oak wrote:
>>>>>> I spoke with Thomas. We discussed two approaches:
>>>>>>
>>>>>> 1) make ttm_resource a central place for vram management functions such
>> as
>>>> eviction, cgroup memory accounting. Both the BO-based driver and BO-less
>> SVM
>>>> codes call into ttm_resource_alloc/free functions for vram allocation/free.
>>>>>>        *This way BO driver and SVM driver shares the eviction/cgroup logic, no
>>>> need to reimplment LRU eviction list in SVM driver. Cgroup logic should be in
>>>> ttm_resource layer. +Maarten.
>>>>>>        *ttm_resource is not a perfect match for SVM to allocate vram. It is still a
>>>> big overhead. The *bo* member of ttm_resource is not needed for SVM - this
>>>> might end up with invasive changes to ttm...need to look into more details
>>>>> Overhead is a problem. We'd want to be able to allocate, free and evict
>>>>> memory at a similar granularity as our preferred migration and page
>>>>> fault granularity, which defaults to 2MB in our SVM implementation.
>>>>>
>>>>>
>>>>>> 2) svm code allocate memory directly from drm-buddy allocator, and
>> expose
>>>> memory eviction functions from both ttm and svm so they can evict memory
>>>> from each other. For example, expose the ttm_mem_evict_first function
>> from
>>>> ttm side so hmm/svm code can call it; expose a similar function from svm side
>> so
>>>> ttm can evict hmm memory.
>>>>> I like this option. One thing that needs some thought with this is how
>>>>> to get some semblance of fairness between the two types of clients.
>>>>> Basically how to choose what to evict. And what share of the available
>>>>> memory does each side get to use on average. E.g. an idle client may get
>>>>> all its memory evicted while a busy client may get a bigger share of the
>>>>> available memory.
>>>> I'd also like to suggest we try to write any management/generic code
>>>> in driver agnostic way as much as possible here. I don't really see
>>>> much hw difference should be influencing it.
>>>>
>>>> I do worry about having effectively 2 LRUs here, you can't really have
>>>> two "leasts".
>>>>
>>>> Like if we hit the shrinker paths who goes first? do we shrink one
>>>> object from each side in turn?
>>> One way to solve this fairness problem is to create a driver agnostic
>> drm_vram_mgr. Maintain a single LRU in drm_vram_mgr. Move the memory
>> eviction/cgroups memory accounting logic from ttm_resource manager to
>> drm_vram_mgr. Both BO-based driver and SVM driver calls to drm_vram_mgr to
>> allocate/free memory.
>>> I am not sure whether this meets the 2M allocate/free/evict granularity
>> requirement Felix mentioned above. SVM can allocate 2M size blocks. But BO
>> driver should be able to allocate any arbitrary sized blocks - So the eviction is also
>> arbitrary size.
>>
>> This is not far from what a TTM resource manager does with TTM
>> resources, only made generic at the drm level, and making the "resource"
>> as lean as possible. With 2M granularity this seems plausible.
>>
>>>> Also will we have systems where we can expose system SVM but userspace
>>>> may choose to not use the fine grained SVM and use one of the older
>>>> modes, will that path get emulated on top of SVM or use the BO paths?
>>> If by "older modes" you meant the gem_bo_create (such as xe_gem_create or
>> amdgpu_gem_create), then today both amd and intel implement those
>> interfaces using BO path. We don't have a plan to emulate that old mode on tope
>> of SVM, afaict.
>>
>> I think we might end up emulating "older modes" on top of SVM at some
>> point, not to far out, although what immediately comes to mind would be
>> eviction based on something looking like NUMA- and CGROUP aware
>> shrinkers for integrated bo drivers if that turns out to be sufficient
>> from a memory usage starvation POW. This is IMHO indeed something to
>> start thinking about, but for the current situation trying to solve a
>> mutual SVM-TTM fair eviction problem would be a reasonable scope.
>>
>> Thanks,
>>
>> Thomas
>>
>>
>>> Thanks,
>>> Oak
>>>
>>>> Dave.
