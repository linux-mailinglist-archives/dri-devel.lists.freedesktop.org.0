Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24887C6E2F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 14:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E31A10E13C;
	Thu, 12 Oct 2023 12:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F1910E03A;
 Thu, 12 Oct 2023 12:35:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTbzTcz4NBss9+v4yUTqcbgu8Z5ut+K5D5wXA1O6UNnbp9ASBAjj5mbRW5FKJl6njWWU0oujzW6QWYVMRIIiEer7AocM8j5eN31zsp7a88jLujFJ9AxPgf774e7VTvcP5xL9YOkBUKksPmDojzoPAIHaMX4iuBF160NrmDfsKhhOnFpyAVVuQe2/hz20OzogJ4+t3E4lYsv1rh164bH1FRcVrKID7/1+SHD9IVaPMSwdjJn9AE0v02b4TG6fOPH292dhl4AzoJu5ZiPY9EuaMfBEb/KnhfAbT2a5WItruzPu06Pjc4Um4tKISOqDGOpbnzezA6iKGrQGVJqrUKAxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8i1QDQRgnEcNFH71h9YiSG/SvH2Vp96L3nXHeGTJf4=;
 b=ksi5+I/u9lJ8rW3phDKHqmMlJDRI/xv8DoPyuNEmk5BByYJfbzGFwLotC3f49roEXKb+phfRUq8yLEaZRwd6AZRj96Ib1ukUrIRcGHIILSqYF7lBImhIi852q3FP0au/a1yY7GAr4QzX5jfDX5zTIdpz+d1sFDULsHM1KumKCVOSdqNO3UBRd+/sG/PMAmJOXRCZfPcqvKCpfKGKIHmOdHhPfm+C3kF8aXMOkABLjByDNXSSOmn2HN9PXHAJUic4DGdd1hXURm2SHA9Z+ysSYEzdSTWDPOhcpX5Pld2nCgU4FWyE+dmowIDrttF1L14CRdOi2sr/LZ1HWWFu2tuaEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8i1QDQRgnEcNFH71h9YiSG/SvH2Vp96L3nXHeGTJf4=;
 b=w8cwqlMFH59ADI23w3QdBgiGVRluVFSsZC4Rgm89+pou4AejuSgBZjgUpgKGCScs2mSNMuXTtvbNA+lfwmEceCwJliK8HNmeh5u4/cd11CHX7po/0pgc/yU2KaY+fjciGRqH09pX5BwRjRcuCE56ojia6OdkyXY2WXsplX6pwt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB7865.namprd12.prod.outlook.com (2603:10b6:a03:4cc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 12:35:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 12:35:23 +0000
Message-ID: <1333e15b-f229-460a-8965-01ff3e778a4d@amd.com>
Date: Thu, 12 Oct 2023 14:35:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next 2/3] drm/gpuva_mgr: generalize
 dma_resv/extobj handling and GEM validation
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>
References: <20230820215320.4187-1-dakr@redhat.com>
 <20230820215320.4187-3-dakr@redhat.com>
 <0c50ff22-0f11-1e27-c32e-694ce2b1e6c5@shipmail.org> <ZO864yp3UyVEfEjz@pollux>
 <88c45fe6-0942-707c-9ea7-8486c177fcd7@shipmail.org> <ZO9Zq2RhbX8EeHrn@pollux>
 <736b6b6d-9e04-a27d-7d60-0c45d696b304@shipmail.org>
 <ZPB26A0/oLHTmyqk@cassiopeiae>
 <a8f28d62-daec-927a-a33d-5be3eec6a1ed@shipmail.org>
 <ZPDk/lao1JlBNGoJ@cassiopeiae>
 <8a8253ae-0b85-df90-b480-64eeebfafc6d@shipmail.org>
 <CAPM=9tz3o-m+8VJJ6hxWhykat0kpp1UE7dBJE3X91aHHo1Y2VA@mail.gmail.com>
 <76963abd-77a1-4bbd-9537-7b230e648a90@amd.com>
 <CAPM=9twSHGRoSoXxG+hz1T8iBX2VgPFvFsNCDnK_nHW9WJYBtw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9twSHGRoSoXxG+hz1T8iBX2VgPFvFsNCDnK_nHW9WJYBtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: 96370a12-b4ca-4826-9e0f-08dbcb1fb3fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ci4UcZ2SkZhGpgeXpxS2yhJefqnsjuUP0U3dhKg4c6Abm/dahCqEVZB7TSYxv7MUsDD/pIbS/sxkBqF5Y3bITNm8LVWVvUOS06v6cXDOc44xU1dkj5L7YyZwaxjk6BNEWWSNauQWkepupmFz2FJlZyKAw2XTxb0jYe7pbyqiIONgLbHncF1ekEHM0Z6U7HyDXhzimsA74ihqz3apBWDp8MB4W5pVtQq1H5Q6f/XTtZWxcc0DQamNQ1N3YJeKCfHpWNbIURPVnVEt1APYQ/DIbLGOeQZpUfsX5A32ZucsQS6+VoT9yyeKZ5LGdQRNmPIgubiKIS9RyPQfB76mR55lanGbS8iwtkLKe49/6xLCyy4JB2Jrk2iyLiQznOW/Q7AkjurffkO6XcQswWxgTYN3vcnubfhFYT/HJ29bl/B8flY/442vXJt2LH2xYjYvJbZzaZ1KbqqbfMIjinqgjJTu/rSYSo1kOZRBFzeJI4vC9wfiX2oYV01MOldjV4eMBIjP09Qq9912cuf7IFNRo6I5fRto8nBswGf4EEm9e/0DhHnkB+3dPGFbCpRZGREwP2k9mRVcaVQ1sjCt+OwUbnoIWLooccHrgT7a34cv82DATZaxgc30vfQosqn/1yJZA25eKg2OgjFRawd2dxRh4YRSWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(376002)(346002)(396003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(66556008)(66946007)(316002)(6916009)(54906003)(41300700001)(6486002)(5660300002)(66476007)(4326008)(8936002)(7416002)(8676002)(31686004)(2906002)(83380400001)(6512007)(26005)(86362001)(2616005)(31696002)(66574015)(6666004)(38100700002)(6506007)(36756003)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEFtZmdjSGxsM25wNlFVdk1ReWtwUGJFditKZThDdFRSL0hJQU5mNVpQY016?=
 =?utf-8?B?TGQxYXNlRitBNEZ0dklZZjVraTNHR0xMZWxIVWt1MWxEQm5jeXJTZnFaSDRE?=
 =?utf-8?B?Yk90dWQwVTZ2NjIwSVB5blpPaDJQaTZjOG1yVjdEYitaakZYd3loUzFwNHBJ?=
 =?utf-8?B?aGdtNFBwYnlLWjE3Wmd5NksyMlBhbXhjbGw5K1JMVEZtN2g4bGhYOTJPR2hU?=
 =?utf-8?B?cWlYbklUK0lNVnB0VEtjNlowQnlUM3lCeUNPNG0yYkcvcm9ITmVJYkM0bE1R?=
 =?utf-8?B?K2p2QytPb050RThjUVF2SlZJOHZPb3Y3cjZvbktORkZUTEt2ZVFzaHd2MjFO?=
 =?utf-8?B?ZHg5d3N2U05DMHpodk9FMmtrTlVrTTNhWjNFNUhQTTFzMzkrOVhCbVh0Qm1J?=
 =?utf-8?B?ZUhwbXdJZFA0NnhuWXQ0cFFseEpMOTJVb2ZWa2hVZ0ZnWER5VXFERXRYUnEv?=
 =?utf-8?B?ZiszYm15aVl5bzhDVE9CTVdwR2JHNFFHMXlqRXdURUY4RHZWRmozZjBxemZZ?=
 =?utf-8?B?L21nMGxGWmJKcjdZSFNKdncwa3NGYWtsL1Rncko4STRDcWNVNzN0SW5Pemti?=
 =?utf-8?B?QlNMN0VOUk05cFp1dWRiOFREb1IzUWlqUVUyeWVrZlE1QzV2WUUwaHRKdjYw?=
 =?utf-8?B?djJ1QjN0M0pkQTNiYVNNcTNzb3Q4QUs5WG1aQ3JySVREMTNrdmxzVnZGVDND?=
 =?utf-8?B?VFhuQy85MlY0RGdIVU1iaUZSZzlibnJWTzJwMTZrTjBPQmtUbExpSGRiOVZa?=
 =?utf-8?B?ZXdUVW9tZmZpSDJvWC9GU0xpQzI5VEI2Vkk3TUZOKytXaU12RDRkaVZKazls?=
 =?utf-8?B?KzJ3b3dobERVSTBoRC9MRThCSDF0QkgwV1dZSkc2RnJhc292Q00zelU3RzRJ?=
 =?utf-8?B?cmhtS1RYNDdwb3RhSm5qWlhGMDZRUFIxSWdWcUdGOTA4VHJMMEhpQW5xWm5z?=
 =?utf-8?B?ZWI5d2d5aFFPcUVNN0R1R3F5c3U1eUpONzRoMUVnOVZhaHJlQ2ZYcThtb3Jz?=
 =?utf-8?B?LzNpb1VRcW1Id2NoUm1HNHJjZy9iN05reld3TkxQdG5OS0wzN2FPNVRCclFa?=
 =?utf-8?B?SEhRaHdPMnJjTjBJeS9EREpIUk1MYmJGL3ZhQmJaRW02d0wvTEdYTzRKUFdI?=
 =?utf-8?B?WTEzeWJieS9ua0w3TkxuWWRRbU9kYk1yOXZWQ3A4UktWbDhBdm4vS3hqa2o2?=
 =?utf-8?B?WnpOMU9nbGlpQ2JvZmtyMytUMitpM1ZBZDV1MXMxMC9TWDRZZmQyNTQ3OU1h?=
 =?utf-8?B?NUZYdW9YZ2Q0Z3VnNmpySUNZeUpzeitaTlZwSkNFeThSeC9rWE5halVXekJN?=
 =?utf-8?B?WVhRaldpdlUzQU1lWXFERGxnZHJPQjJXR0NIVnVwNm04NE5rdGMxZk9UTE53?=
 =?utf-8?B?WTljSE5FRnZ5TzNXdFNuMTFVRkpjaWxlaGhBcS9Ta3N6UTVZU0tzbVpTMEg1?=
 =?utf-8?B?RkxEWkZkYW5EcHB5Z2s1Wkl0VGovTTFGMkxrSGNhNnJjUWVlMVNoclZHelhx?=
 =?utf-8?B?OHpMOVVHbE9jY0RVTVJjaXhkOU9jbnpzSWNjUWlZek8vQTlweUhWcDNoZTE0?=
 =?utf-8?B?WHFvVlBEOUFVOHJ5QmpwZEZiVklWQlowcktLUHh5Z3FzRlMrQnpOTUNHeUhZ?=
 =?utf-8?B?S0RoVVpVNkovUyt1UU9PN1paSWs0RHZ0RlNidkt0SWFwcGNZQ05VcmZKSjFv?=
 =?utf-8?B?enRlUU45ck9qSkRRQkVwWkVuZ2cyS0ZYOHlFcFdMQy9HK3BCY3ZnbHphT3NE?=
 =?utf-8?B?cnpmbi9JNE9BQWhrc3ZCU1dLZVc2ZWtVVHNSTWJyR0NLZU1GazQrajlVUGxt?=
 =?utf-8?B?YnVLM21rWTR5eTJhckZUOGhhUGxtVWthenhOQXNxcW43YWNIS1gwaisxLzB4?=
 =?utf-8?B?YkZRVlZva0lNa25zby9aYVpIbjdqam5DaE01bWhLd3plSmJzVGRuNEN2RHNG?=
 =?utf-8?B?M2pVM3ZCblBCdnZDT3czYXVpOGNrUXMzQUJmU1dIOGtEZXBVNFh6M25IU3JF?=
 =?utf-8?B?ZHhBbmZlclQydWdzS3o4Wi9SYS93K0hmcmdjT3NYZDUvbW40dUFHbm9SeWVH?=
 =?utf-8?B?aWY3eWhSdEtKSlg5bC9SR2JmUHk2MTJyVzlkMW5XMW1UUEYzd1J5dDY4U3Ey?=
 =?utf-8?Q?Ur9I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96370a12-b4ca-4826-9e0f-08dbcb1fb3fd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 12:35:23.0084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgHHwSzxgMW3YrU/YGnrvOnDOncICu37EJGAU9uTVTVAugFwn6fMmgASDJKPlhpQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7865
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>,
 linux-kernel@vger.kernel.org, Liam.Howlett@oracle.com,
 boris.brezillon@collabora.com, Danilo Krummrich <dakr@redhat.com>,
 donald.robson@imgtec.com, faith.ekstrand@collabora.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.10.23 um 12:33 schrieb Dave Airlie:
> On Wed, 11 Oct 2023 at 17:07, Christian König <christian.koenig@amd.com> wrote:
>> Am 10.10.23 um 22:23 schrieb Dave Airlie:
>>>> I think we're then optimizing for different scenarios. Our compute
>>>> driver will use mostly external objects only, and if shared, I don't
>>>> forsee them bound to many VMs. What saves us currently here is that in
>>>> compute mode we only really traverse the extobj list after a preempt
>>>> fence wait, or when a vm is using a new context for the first time. So
>>>> vm's extobj list is pretty large. Each bo's vma list will typically be
>>>> pretty small.
>>> Can I ask why we are optimising for this userspace, this seems
>>> incredibly broken.
>>>
>>> We've has this sort of problem in the past with Intel letting the tail
>>> wag the horse, does anyone remember optimising relocations for a
>>> userspace that didn't actually need to use relocations?
>>>
>>> We need to ask why this userspace is doing this, can we get some
>>> pointers to it? compute driver should have no reason to use mostly
>>> external objects, the OpenCL and level0 APIs should be good enough to
>>> figure this out.
>> Well that is pretty normal use case, AMD works the same way.
>>
>> In a multi GPU compute stack you have mostly all the data shared between
>> different hardware devices.
>>
>> As I said before looking at just the Vulcan use case is not a good idea
>> at all.
>>
> It's okay, I don't think anyone is doing that, some of the these
> use-cases are buried in server land and you guys don't communicate
> them very well.

Yeah, well everybody is trying very hard to get away from those 
approaches :)

But so far there hasn't been any breakthrough.

>
> multi-gpu compute would I'd hope be moving towards HMM/SVM type
> solutions though?

Unfortunately not in the foreseeable future. HMM seems more and more 
like a dead end, at least for AMD.

AMD still has hardware support in all of their MI* products, but for 
Navi the features necessary for implementing HMM have been dropped. And 
it looks more and more like their are not going to come back.

Additional to that from the software side Felix summarized it in the HMM 
peer2peer discussion thread recently quite well. A buffer object based 
approach is not only simpler to handle, but also performant vise 
multiple magnitudes faster.

> I'm also not into looking at use-cases that used to be important but
> might not as important going forward.

Well multimedia applications and OpenGL are still around, but it's not 
the main focus any more.

Christian.

>
> Dave.
>
>
>> Christian.
>>
>>> Dave.

