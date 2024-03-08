Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590B9876183
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 11:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C453410F90E;
	Fri,  8 Mar 2024 10:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IoqE+VGb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8720E10F90E;
 Fri,  8 Mar 2024 10:07:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dR/Dcc15eAv1x69C4ozPKOOjTIKweWxfrEO1KIaaV/52QalnbIiH2Yp9suOGE+1ooUtnZ5IbIEesMTVhJOhmhcpbyT/TrMaVS5rz239i2r8Fvrm9pFl3d5kvKeH2q/HrhEmQ6BGTNYv1zDPwoh7536ohlADLRW1P9fduDUyExRbELpZBI0kgY2pWbpx7KNV54cguiEAvHAvhEEvii4h/Lha3Nrw4VbFq8ld0Uw4C7rRAYNI7Pj90SilKjO1t+IF90sR+Zpngxj7tjt39GM6J/uOZUP/aIaSDgG8Q7zPyarvAYA9MmcLn5FOhnzPn9lEmmhWABfuzSEBfwTS8xH6s5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flqXXHVDXyRVV3wivVo4ifSURiVTIwhC8qOUbZWXp3w=;
 b=ZU0jQrGnF0/OtEhmX+evGAmfJerVn4fmJlIwp8NUnUSs8kW6htiMAENSleyY9iaXnmQhLcCYo16QoeG0ndeaEAD8BBOpPIdTlJJV1mZLZH8kTeEZl3RJzLLqYo3UO/PQM4WptRkCMUbCIkaFoWCOHLsmJjx5BZwTOKF5ySFk+6KW0CtIV0c8p6qzFjR3rNE3koxg02BLRbsNeAq56JKwcwsVv9KW2wQXOqL32mgJ+AnP5RBj24Fbv/Qh7NFZyDABSdssdHKz3Ag123P/2JYOBy5HLt52cW7Tg37oMnm4YTzwFKXX9+JV9dCOGseHxKIyD7ytPqWhty+gUfhzOETBPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flqXXHVDXyRVV3wivVo4ifSURiVTIwhC8qOUbZWXp3w=;
 b=IoqE+VGbzqDtVzuo4tHNHwUL+jlDRl1+Gff5g3uQ0ncCGADGBoKtUHkr0DIMVSIMDvMJI+ye/17KBZPF9kw/1qQkZ1Iry4i8oaR7RJx4IBHahbdgfAgChtFfNIfbCZ3X+yKuxqVi89d44JFbsak/ZPPiVDmPhSK1SyaD3bfXrjo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYXPR12MB9340.namprd12.prod.outlook.com (2603:10b6:930:e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.29; Fri, 8 Mar
 2024 10:07:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7362.024; Fri, 8 Mar 2024
 10:07:29 +0000
Message-ID: <8ea1a148-ccad-4d53-ac5f-7cebb282917c@amd.com>
Date: Fri, 8 Mar 2024 11:07:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@redhat.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Welty, Brian"
 <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>, "Shah, Ankur N"
 <ankur.n.shah@intel.com>, "jglisse@redhat.com" <jglisse@redhat.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>
References: <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
 <7834e2fbe8052717a4e0fa44feafa544b1fedaa0.camel@linux.intel.com>
 <851e3ddb-6c74-4ec5-8d05-df12b34eb2b4@amd.com>
 <SA1PR11MB69919C19A16C007A6B01FC9E92782@SA1PR11MB6991.namprd11.prod.outlook.com>
 <5aca8bdc-1243-40e6-90dc-ece80a093a5b@amd.com>
 <SA1PR11MB6991DF41C958CA46DD715E9F927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <801c3357-d49b-4505-a1a4-ef2f36ba63e0@amd.com>
 <SA1PR11MB6991E4CF9949916C6290C232927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAMwc25pzC4PTFwXLo4304vcbFVvxjDPi7Pd1ASBVQ1t8QqizdQ@mail.gmail.com>
 <ZboPlUgU6A-9rMvP@phenom.ffwll.local>
 <SA1PR11MB69910A237BF3666C8D798AFA927C2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <6f9057af-4ec4-4869-957b-b966d9f9f610@amd.com>
 <SA1PR11MB6991045CC69EC8E1C576A715925F2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991D0A2FE27899030D8D5E792272@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR11MB6991D0A2FE27899030D8D5E792272@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYXPR12MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b1b6aed-081f-469c-74cd-08dc3f579022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6aEETTc2GknkI/Ba2+UTVnPfsOmXIM17o598T4xJDQMJ1XivH9094MoWY9xDQcdu8olW5bYyi8ot7yLxKogVmawlV+SaPlkpOsmLT4VLYc3U99Zi2Gor5rNGf0SgajCQEylWo7uSBxa7B8krHzqH2+afnaXGZqLalZiukGqAwnCuXluSRl8OfEfOofaPhTmcdAQdn2Z9X61A/QlY3Dk2ILlTyaevMKTqSZrl12RPvM30eNszpfDgKd8Uan25F5C3/zwwiEiVU4b0Hl9q+96pVU6lRN/nKIHiDueEX5enoQLSr+NbF0ye37NdK8x+sdf/84Yx8LHbiwt7lWWGa6wtw9D97ZXe7YvQ7E1ayDDEAOIz2dFiFvmiswFlR0MNi86o9b3YRNZuxPpsMPGLcoXCkoZbnSf3FlQ8WpSH9orajHFBKJc7CJfenNh7lNbRlqzuFHGYEzcxofnDKCFnUtOEEO9sescIdbOlNmQUizpD/PIH3Wd368LPaMdLloX5wavvJby1MSukujpJ5rFhhI2LO+rcaIIVP7HqcoZWdUxqGy613bz16KtDPqKTRGL3rqIvWoVQ4rh9yl0/EfWdbvADxtt4401mTRmzBLJF93w283c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3g2b2hCWUxIbHFjbDlLdFlzZ0dvYmFEdFBGVlVVTGtpTU5pb1pybnU4cUNn?=
 =?utf-8?B?ZVgzTWk5WHR5bTlQL2x4S2xGQzJMSVVzUUFvbUxObjJEYXVsK0ZGNFp2RzNq?=
 =?utf-8?B?YTlrUjJpNzl5Q0xkbXZndHdHRDAvNE4rQlFjNzg0QytROC9DTnVQb081VjZK?=
 =?utf-8?B?a29sL0JhbTJHN1NLWFpyRnRJTkQ5clBnM2YyZnlKdytKME5GelVKbzN4VjRC?=
 =?utf-8?B?NDBoYzhnRzRzazV5b1VQV01qYjVLbFNGQjc1R0VJaFVCWTFSdHQzamdBRzk5?=
 =?utf-8?B?SW1qWm9rWk04MHRscWhyQ051YlhRODRRNTZNOGx0cFNMSXZuYnRUTTRRb203?=
 =?utf-8?B?NkxCUlNMeWw4MW1VUzI2S0RXS0FMaVJrSnJpME1wRzlCSTM4K1hwMVYyN2U0?=
 =?utf-8?B?ckIvMExsMnJGbHRYajFibWlsbnJhODRjZXZWNlRQMERtOTZNeS9GT0VkWUYw?=
 =?utf-8?B?ZGREUkY3cHN5MFpkQ0hyS1ZaMGtqWndzUWRzOWZ5ZFdsdGsxTnB5TlJBN0V4?=
 =?utf-8?B?aFVJWjhURVkvMHdoTC9NMUlVL25QUTlPUmFwclZFUy9xNmFMZXh4UE9tR0d4?=
 =?utf-8?B?NGNkdHoyVUI4VTA5M00zSHptcDFaOW54OW11NXF2T2NyN3gyUHp5bDg1NXlo?=
 =?utf-8?B?WVU2L2FLOEE4ZFRaMStMcFNVZlhBcDR1OVEwR1o1SXE0bVl1NUZqRXNsT2py?=
 =?utf-8?B?bUJUZjZGUDFGQ25WSTRVZTVTbTYwTFIvWFJvbXh2NXhZNUVGNUswSmRJSUgr?=
 =?utf-8?B?akRpSjE3bFE0L3dXSmxiVE1HQlhQb3p6QjVLZzZuYzYrdkkxQUpncStaZDhH?=
 =?utf-8?B?ZjQ5VE83NVdNb0wvdmIrb2ZBUWJOLyswSTQ2dVovdGhWOXF1ejJqZXFwTjMr?=
 =?utf-8?B?UmF3M2l5ODdxODVXeThCa0lBNUdyaDVKc2x1SHJvNG5xc2s4UitWM1hzbzNJ?=
 =?utf-8?B?bVcyRzhXK3prNFV6VUVmTEN3bkRVNjBBWVZKejdiN21vQllON1F6OWRIdlQz?=
 =?utf-8?B?TnQ1ZVZSOHF3WnVKcDVNT2VOeFA3ZnBPMGViaE5KcjVmdTh6a2RTV3c3VzUv?=
 =?utf-8?B?cFBnbTJ2NDF1bGVoNnA3b2ZISy9uRnd5R0RtK3poc3k3eTJyZXpYWVRVYmpQ?=
 =?utf-8?B?UFFmMHBQM0w4UURYclovY0wwaWxCYzgzUU45cWxqTlVZSHdSZnlDWDdJTGlx?=
 =?utf-8?B?MHgybHEyc3dNTURKZkp2VEE5SVoreHRWQ2ZMZVVzeGhpRU5SUTI3bk5DNEc3?=
 =?utf-8?B?QjB6aGs0d3I4MmpKaEN2Z1Fqcnp1QW1LY3JBQzd2WlFZNklBWHJBRjBXeVJq?=
 =?utf-8?B?L3Y3bVkrUDhiMEZia3crcGhpbGo4MWI4Uk0yK2htRlpxSHVtWCs0ZlVkQ2M0?=
 =?utf-8?B?VnpxRGcwQ3RWTW5sUSswVytRVnBXZ3NiS084NnBGQmR6WW1ZVEViaWRtMjA3?=
 =?utf-8?B?cmp5czgwaUxoZURwRzh5dFhTb1ZTZ1VwdTU5WEJsR0oxU1d6Q2RVYndZV0dr?=
 =?utf-8?B?UnpqK1B6TEdaUFhBT2hrRUNKNUNheGtBMmRiWE5jTHA3Nk9uNDJXWFlCQ0Z5?=
 =?utf-8?B?bTV3RVovUThRaE9QMmN0L1A3RVFSQWZRbC9NNkhaekRNVlU0NzVxVmgyWHEv?=
 =?utf-8?B?alIzNzB6bmtmZkxZSkN0a1ZhQ3FSME02ZW5xUkJLTEZGQkFoNGRtMDZMWEFY?=
 =?utf-8?B?WmI0UFhTY1pMVXhDcWNLWW5mYWdhWmtHOFVuQ2VFaGdzOGhURHFTMVora29B?=
 =?utf-8?B?ZndYemZRcXlHeFJHOHNzZEZodnFialA4Y0JwSkF5SjNZV2RsKy9WRHVybEd2?=
 =?utf-8?B?L1k5Vk9kS2h2UHNNUnRDcWZIaHJ6UEpweklObkxJazBxNlRhSjZsWnJ3QzFV?=
 =?utf-8?B?S09weStsREo4QjFIeUZvN0VXRWpUSE5DV2JtL3JGME40V0tzTmNxZnFpQUZx?=
 =?utf-8?B?NEJtTWF1OHlpZ2I1NXNoYWIrbFBiRnRoU2tnNUJSemVoRFZKdWxNaWRmc012?=
 =?utf-8?B?ZjJxY1JtSURSblNvU3lQZFUwSXN4OE5hbEdGTG5FQ20zcExWL1ovdk5RWDRV?=
 =?utf-8?B?dnNiV2FkcXVBanVUVlFQNjJSdmE4N1VoL01XL2tDQXBsTmxNSVlxQnRvU3h4?=
 =?utf-8?Q?fT8QGZ7eoudARO0F0M9eY0ZJM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1b6aed-081f-469c-74cd-08dc3f579022
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 10:07:29.4305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlJJInLCKcXVnLDWPrI7C2b29vftix1T5e0Bq4ip5HnOrTkm/D/1GH8UX7iJpwdz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9340
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

Hi Oak,

sorry the mail sounded like you didn't expected a reply.

And yes, the approaches outlined in the mail sounds really good to me.

Regards,
Christian.

Am 08.03.24 um 05:43 schrieb Zeng, Oak:
> Hello all,
>
> Since I didn't get a reply for this one, I assume below are agreed. But feel free to let us know if you don't agree.
>
> Thanks,
> Oak
>
> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Zeng, Oak
> Sent: Thursday, February 29, 2024 1:23 PM
> To: Christian König <christian.koenig@amd.com>; Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@redhat.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; Brost, Matthew <matthew.brost@intel.com>; Felix Kuehling <felix.kuehling@amd.com>; Welty, Brian <brian.welty@intel.com>; dri-devel@lists.freedesktop.org; Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Gupta, saurabhg <saurabhg.gupta@intel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; intel-xe@lists.freedesktop.org; Danilo Krummrich <dakr@redhat.com>; Shah, Ankur N <ankur.n.shah@intel.com>; jglisse@redhat.com; rcampbell@nvidia.com; apopple@nvidia.com
> Subject: RE: Making drm_gpuvm work across gpu devices
>
> Hi Christian/Daniel/Dave/Felix/Thomas, and all,
>
> We have been refining our design internally in the past month. Below is our plan. Please let us know if you have any concern.
>
> 1) Remove pseudo /dev/xe-svm device. All system allocator interfaces will be through /dev/dri/render devices. Not global interface.
>
> 2) Unify userptr and system allocator codes. We will treat userptr as a speciality of system allocator without migration capability. We will introduce the hmmptr concept for system allocator. We will extend vm_bind API to map a range A..B of process address space to a range C..D of GPU address space for hmmptr. For hmmptr, if gpu program accesses an address which is not backed by core mm vma, it is a fatal error.
>
> 3) Multiple device support. We have identified p2p use-cases where we might want to leave memory on a foreign device or direct migrations to a foreign device and therefore might need a global structure that tracks or caches the migration state per process address space. We didn't completely settle down this design. We will come back when we have more details.
>
> 4)We will first work on this code on xekmd then look to move some common codes to drm layer so it can also be used by other vendors.
>
> Thomas and me still have open questions to Christian. We will follow up.
>
> Thanks all for this discussion.
>
> Regards,
> Oak
>
>> -----Original Message-----
>> From: Christian König <christian.koenig@amd.com>
>> Sent: Thursday, February 1, 2024 3:52 AM
>> To: Zeng, Oak <oak.zeng@intel.com>; Daniel Vetter <daniel@ffwll.ch>; David
>> Airlie <airlied@redhat.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>; Felix Kuehling <felix.kuehling@amd.com>; Welty,
>> Brian <brian.welty@intel.com>; dri-devel@lists.freedesktop.org; Ghimiray, Himal
>> Prasad <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
>> <krishnaiah.bommu@intel.com>; Gupta, saurabhg <saurabhg.gupta@intel.com>;
>> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; intel-
>> xe@lists.freedesktop.org; Danilo Krummrich <dakr@redhat.com>; Shah, Ankur N
>> <ankur.n.shah@intel.com>; jglisse@redhat.com; rcampbell@nvidia.com;
>> apopple@nvidia.com
>> Subject: Re: Making drm_gpuvm work across gpu devices
>>
>> Hi Oak,
>>
>> Am 31.01.24 um 21:17 schrieb Zeng, Oak:
>>> Hi Sima, Dave,
>>>
>>> I am well aware nouveau driver is not what Nvidia do with their customer. The
>> key argument is, can we move forward with the concept shared virtual address
>> space b/t CPU and GPU? This is the foundation of HMM. We already have split
>> address space support with other driver API. SVM, from its name, it means
>> shared address space. Are we allowed to implement another driver model to
>> allow SVM work, along with other APIs supporting split address space? Those two
>> scheme can co-exist in harmony. We actually have real use cases to use both
>> models in one application.
>>> Hi Christian, Thomas,
>>>
>>> In your scheme, GPU VA can != GPU VA. This does introduce some flexibility.
>> But this scheme alone doesn't solve the problem of the proxy process/para-
>> virtualization. You will still need a second mechanism to partition GPU VA space
>> b/t guest process1 and guest process2 because proxy process (or the host
>> hypervisor whatever you call it) use one single gpu page table for all the
>> guest/client processes. GPU VA for different guest process can't overlap. If this
>> second mechanism exist, we of course can use the same mechanism to partition
>> CPU VA space between guest processes as well, then we can still use shared VA
>> b/t CPU and GPU inside one process, but process1 and process2's address space
>> (for both cpu and gpu) doesn't overlap. This second mechanism is the key to
>> solve the proxy process problem, not the flexibility you introduced.
>>
>> That approach was suggested before, but it doesn't work. First of all
>> you create a massive security hole when you give the GPU full access to
>> the QEMU CPU process which runs the virtualization.
>>
>> So even if you say CPU VA == GPU VA you still need some kind of
>> flexibility otherwise you can't implement this use case securely.
>>
>> Additional to this the CPU VAs are usually controlled by the OS and not
>> some driver, so to make sure that host and guest VAs don't overlap you
>> would need to add some kind of sync between the guest and host OS kernels.
>>
>>> In practice, your scheme also have a risk of running out of process space
>> because you have to partition whole address space b/t processes. Apparently
>> allowing each guest process to own the whole process space and using separate
>> GPU/CPU page table for different processes is a better solution than using single
>> page table and partition process space b/t processes.
>>
>> Yeah that you run out of address space is certainly possible. But as I
>> said CPUs are switching to 5 level of pages tables and if you look at
>> for example a "cat maps | cut -c-4 | sort -u" of process you will find
>> that only a handful of 4GiB segments are actually used and thanks to
>> recoverable page faults you can map those between host and client on
>> demand. This gives you at least enough address space to handle a couple
>> of thousand clients.
>>
>>> For Intel GPU, para-virtualization (xenGT, see https://github.com/intel/XenGT-
>> Preview-kernel. It is similar idea of the proxy process in Flex's email. They are all
>> SW-based GPU virtualization technology) is an old project. It is now replaced with
>> HW accelerated SRIOV/system virtualization. XenGT is abandoned long time ago.
>> So agreed your scheme add some flexibility. The question is, do we have a valid
>> use case to use such flexibility? I don't see a single one ATM.
>>
>> Yeah, we have SRIOV functionality on AMD hw as well, but for some use
>> cases it's just to inflexible.
>>
>>> I also pictured into how to implement your scheme. You basically rejected the
>> very foundation of hmm design which is shared address space b/t CPU and GPU.
>> In your scheme, GPU VA = CPU VA + offset. In every single place where driver
>> need to call hmm facilities such as hmm_range_fault, migrate_vma_setup and in
>> mmu notifier call back, you need to offset the GPU VA to get a CPU VA. From
>> application writer's perspective, whenever he want to use a CPU pointer in his
>> GPU program, he add to add that offset. Do you think this is awkward?
>>
>> What? This flexibility is there to prevent the application writer to
>> change any offset.
>>
>>> Finally, to implement SVM, we need to implement some memory hint API
>> which applies to a virtual address range across all GPU devices. For example, user
>> would say, for this virtual address range, I prefer the backing store memory to be
>> on GPU deviceX (because user knows deviceX would use this address range
>> much more than other GPU devices or CPU). It doesn't make sense to me to
>> make such API per device based. For example, if you tell device A that the
>> preferred memory location is device B memory, this doesn't sounds correct to
>> me because in your scheme, device A is not even aware of the existence of
>> device B. right?
>>
>> Correct and while the additional flexibility is somewhat option I
>> strongly think that not having a centralized approach for device driver
>> settings is mandatory.
>>
>> Going away from the well defined file descriptor based handling of
>> device driver interfaces was one of the worst ideas I've ever seen in
>> roughly thirty years of working with Unixiode operating systems. It
>> basically broke everything, from reverse lockup handling for mmap() to
>> file system privileges for hardware access.
>>
>> As far as I can see anything which goes into the direction of opening
>> /dev/kfd or /dev/xe_svm or something similar and saying that this then
>> results into implicit SVM for your render nodes is an absolutely no-go
>> and would required and explicit acknowledgement from Linus on the design
>> to do something like that.
>>
>> What you can do is to have an IOCTL for the render node file descriptor
>> which says this device should do SVM with the current CPU address space
>> and another IOCTL which says range A..B is preferred to migrate to this
>> device for HMM when the device runs into a page fault.
>>
>> And yes that obviously means shitty performance for device drivers
>> because page play ping/pong if userspace gives contradicting information
>> for migrations, but that is something supposed to be.
>>
>> Everything else which works over the boarders of a device driver scope
>> should be implemented as system call with the relevant review process
>> around it.
>>
>> Regards,
>> Christian.
>>
>>> Regards,
>>> Oak
>>>> -----Original Message-----
>>>> From: Daniel Vetter <daniel@ffwll.ch>
>>>> Sent: Wednesday, January 31, 2024 4:15 AM
>>>> To: David Airlie <airlied@redhat.com>
>>>> Cc: Zeng, Oak <oak.zeng@intel.com>; Christian König
>>>> <christian.koenig@amd.com>; Thomas Hellström
>>>> <thomas.hellstrom@linux.intel.com>; Daniel Vetter <daniel@ffwll.ch>; Brost,
>>>> Matthew <matthew.brost@intel.com>; Felix Kuehling
>>>> <felix.kuehling@amd.com>; Welty, Brian <brian.welty@intel.com>; dri-
>>>> devel@lists.freedesktop.org; Ghimiray, Himal Prasad
>>>> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
>>>> <krishnaiah.bommu@intel.com>; Gupta, saurabhg
>> <saurabhg.gupta@intel.com>;
>>>> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; intel-
>>>> xe@lists.freedesktop.org; Danilo Krummrich <dakr@redhat.com>; Shah,
>> Ankur N
>>>> <ankur.n.shah@intel.com>; jglisse@redhat.com; rcampbell@nvidia.com;
>>>> apopple@nvidia.com
>>>> Subject: Re: Making drm_gpuvm work across gpu devices
>>>>
>>>> On Wed, Jan 31, 2024 at 09:12:39AM +1000, David Airlie wrote:
>>>>> On Wed, Jan 31, 2024 at 8:29 AM Zeng, Oak <oak.zeng@intel.com> wrote:
>>>>>> Hi Christian,
>>>>>>
>>>>>>
>>>>>>
>>>>>> Nvidia Nouveau driver uses exactly the same concept of SVM with HMM,
>>>> GPU address in the same process is exactly the same with CPU virtual address.
>> It
>>>> is already in upstream Linux kernel. We Intel just follow the same direction for
>>>> our customers. Why we are not allowed?
>>>>> Oak, this isn't how upstream works, you don't get to appeal to
>>>>> customer or internal design. nouveau isn't "NVIDIA"'s and it certainly
>>>>> isn't something NVIDIA would ever suggest for their customers. We also
>>>>> likely wouldn't just accept NVIDIA's current solution upstream without
>>>>> some serious discussions. The implementation in nouveau was more of a
>>>>> sample HMM use case rather than a serious implementation. I suspect if
>>>>> we do get down the road of making nouveau an actual compute driver for
>>>>> SVM etc then it would have to severely change.
>>>> Yeah on the nouveau hmm code specifically my gut feeling impression is
>>>> that we didn't really make friends with that among core kernel
>>>> maintainers. It's a bit too much just a tech demo to be able to merge the
>>>> hmm core apis for nvidia's out-of-tree driver.
>>>>
>>>> Also, a few years of learning and experience gaining happened meanwhile -
>>>> you always have to look at an api design in the context of when it was
>>>> designed, and that context changes all the time.
>>>>
>>>> Cheers, Sima
>>>> --
>>>> Daniel Vetter
>>>> Software Engineer, Intel Corporation
>>>> http://blog.ffwll.ch

