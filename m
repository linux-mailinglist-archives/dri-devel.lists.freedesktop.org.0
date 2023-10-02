Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B80A7B59E6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 20:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3E710E204;
	Mon,  2 Oct 2023 18:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDFA10E141;
 Mon,  2 Oct 2023 18:12:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bo9ZjW4p171Pn1odSXiJqs3EhSNaWxD9ppJ6+fNnxObDklteU23MPBU2gR57lmG3c5CBYARZp2nM82FXYpuxIecZwrqninKtschi483kn3jnA1VnJLhPyeDybPCWgA1eZFdEocASLS9cnrlFlxi5sk2OxSSo8GYoMBbNvklflRpBARypcQtJ0SosQ6i2EZIOajagFHWISinbUDEEwvueqL13AqUOghNasIWMY95KgL6buASrAyby+rTn5IJRqPYSxLb6vSFRcQK7jkuJc7eeN7+iADbBlL+Ar/YBjtRvpSODCzKaNlJmPJD3O/BGP2uWWQHbRUiGoDZwn6bmImnzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dboc2kaAWdDgZjafVKfXS7ikUFOoB5caDxTGfAB0CRg=;
 b=FO2cxkHHIhXwqPGaZEv3+ZLof66UT8eaFzKJPAmxWRhiEl9MO0ehF+7b7Kpm/RQ1YcYpJxkFy2Poh9uB9WKLD3Fbhw6btB74g6qcDro2S1j5OxN/3ARAxMppa8X5k10RqPFwgB1KArblKbXv9JO9PMYvIMRRc5cjLltGocfu69yeCNDM7IFnxNYTpy5V1DuKSiDww29QmYUWlezsgB8StmQJOiObgHVJoffCT+7Y8/Wv1D+g8xrY+Zml4U7ZSB5ieq4dXG7AvYogU4LBQAEOhsOMkKwMVIR1xNDnUOEKkpLWdr8lu6JFoy5OF6H303eZgbdB4FCYkOpIn7HN92yvxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dboc2kaAWdDgZjafVKfXS7ikUFOoB5caDxTGfAB0CRg=;
 b=ce24og4hJBrP4UMRkdBV9++5CYBL0ORVRxioYcDBFmJ0WoPgzTyVANKIqbT8eNZ7kKvsBSKK94FDanbE2Miss4dVJQfw40cGiAa18nuEG8vOTbs5rZoEJkMVMoe/DB8Broqkz507Wxvqv3pW8DX3E/OzhWQUvfYhSqU1JTwTsvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5141.namprd12.prod.outlook.com (2603:10b6:208:309::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Mon, 2 Oct
 2023 18:11:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6838.027; Mon, 2 Oct 2023
 18:11:57 +0000
Message-ID: <0be2dfa4-b6c1-f62a-66e1-615da7aa3c76@amd.com>
Date: Mon, 2 Oct 2023 20:11:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/9] drm: Annotate structs with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230922173110.work.084-kees@kernel.org>
 <169601600138.3014939.8511343741428844249.b4-ty@chromium.org>
 <83cd056c-52ae-01dd-7576-42d41da64c26@gmail.com>
 <CADnq5_Ma2CrLYggJHKFEObsNmUoqJwb2p1xai5DfL=m43U6zEA@mail.gmail.com>
 <202310020952.E7DE0948C0@keescook>
 <10644b5f-b0a7-85ef-0658-2353ee14df0d@gmail.com>
 <202310021107.9BB46FB8E@keescook>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <202310021107.9BB46FB8E@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: f72f9241-70ee-45cd-0f82-08dbc37310a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NyIMkowZqJLx2lUCb5LFN2+2JcZEpqP8vpo/LFAYCGF8owQlNHezvm8tqMbLJBbD2CYXDVESU9AK1iMLReITkiPhwWVamefxgM7evNCbRHXj2uf3Noa6fXqu0eIgXM+hiKxJ57b/5uOlFFk0DjKSn9fiojzoGORzt6wXqqQDMu80K6ild4kCSVP0gQlxSzUZyVFSfictrhm7J2EIaOBq40y9IRDK2Pw0d73sEsvmF0pz/CAqF5CXw+4Ef1DooEceBEKfBK68Eu/D2NjpIf7ZTofyx54UKBzYixGHggnS5g1pI4IitgF4GTuqEdU/+weTTPyXNlWH25Gmf/q1fGD1R133O878jpd0HlzI3r6bZi0nKBcWd9SPwpE7J14gI6aBQTxgXdoGw5vm7EaGFslVokJwBRg7wPEHdEeV4vkw+PJo261d5dvtJ64tVtjSAtoDG+4oHKjLEgavg6BgqIxtcIsVnmob55cEoqzGp3p3ZOqKCenf2/pXhPk9+DsorzynKXB65w/mgi2coR6rEDNhaklCGycKVdSuPB+BQfJNZay188PaiIRnw66oNa3a1EzgXq6Ngyg8AjQl9IzJ7b4fMcBPwhhabkVh5EdOsBWPt+YY4pLzOdWjJKejNdZ2V8GDzSJgp1wpbm2XygaGRrh7UA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(396003)(39860400002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2616005)(26005)(66574015)(36756003)(83380400001)(6512007)(6506007)(6486002)(966005)(478600001)(6666004)(53546011)(31686004)(38100700002)(316002)(110136005)(66476007)(66946007)(41300700001)(66556008)(54906003)(8676002)(8936002)(4326008)(5660300002)(7416002)(7406005)(31696002)(86362001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2tEOW02aGdqQ3FNTzJKZk5CemRkdnZna0c5T0lMMlk1VnAzNmZCZS9GcUNu?=
 =?utf-8?B?M2VjL2VtZ3A2MFdsZUhHV3JFZVAyYVNmM3h1QzFmd2lsc2plZmI1bWNDakNp?=
 =?utf-8?B?dFAyc2tFWkgwdW93TnJSaFZkeG0vemRWYVJ1QXYrNS9QSURmM0o3bzdwY2lX?=
 =?utf-8?B?bTU4ZlM2bzkzQktWa2IrdmdrdHlGaWNJZ1NZeFcrbG9NUzhDVCs2QVZuRFVm?=
 =?utf-8?B?ZDRDamJvdnZBY1VaSEpkVXRFblNCN1RhUk9kUFE3L05rckdyZlVFbWV1bUt4?=
 =?utf-8?B?V1ZDSitaUVVpN3c1V3A3TmJ6UWpTMFdId3V0ZHcvTHE0WVVLOWZuNy9CWUIr?=
 =?utf-8?B?c0tsdVVqcUsrNXdvWitobi9nTkNsNHZ4YWtscjZkRlFaOHErQkNkNkxUTzlZ?=
 =?utf-8?B?NmREZjFxeVdVd1RuZXB6MjFGTktQbXN6aS90aXBzZkFSMFEvRytFenBsQzJj?=
 =?utf-8?B?MUZ3c0xFQXJvOHI4clZUVmpHV3hQaVBYV0VvRFJyZUM1WUY0ZU95WUJSZmFR?=
 =?utf-8?B?REpHdDlXVU5aZzQ2SkhDWjFCNHVjZ0VrZEdpdFFhS2liZndlQm11VVhRTXl6?=
 =?utf-8?B?L2hhT3cybmNTRGs3WTJ0enVHNWx6TlpQMXhSL2RrbmpDeVF5TjU4Z1I0VHBB?=
 =?utf-8?B?Q2htalpNZVVYbkJwaDdEbGYwTEd0UXlPZTN5NFFlRjQ1L1paSlFjak54YU1h?=
 =?utf-8?B?NCtaVExHYWs3RHFjSWJsVXFoNklzcE54blZwT3diNXY3U2xkd1FMTklnSElN?=
 =?utf-8?B?dGw4YkhYWlFDaTZmWXhibGFCNXZNTDdDZCthVU5zaUFRTEJGbk5sQnAxY09P?=
 =?utf-8?B?S3UybUR1cS9rT0RrbGVvb2w3eEFFa2ovaUIwcnpBWENUOFNXT0dZY2dYRW5o?=
 =?utf-8?B?UTF4bUJmbTF2dzlvMnB1Um5NOG9pRWs0K2dRSGJ0cW1HRmxqTUZKYWdGcE1G?=
 =?utf-8?B?dDQzeTI4enVJcjl5c2wwR0pRcDRqek5iY0RscitaOG9MSExFMVhBRGI0bEs2?=
 =?utf-8?B?RHJpN3F0RzFyRmM1SXhmOHlSWE5NY25jVk85elUzV205d2NUeGhQdE85b29P?=
 =?utf-8?B?cDd4UnlYY1g3aU15K0dTWmJUNlR4NnQrak0xelFkM0F4MjdQYjlWUlpwOWlC?=
 =?utf-8?B?Y2NCemdVZzEzRVRHUi9BUGNHcmoySVRYT1JrU2MwWVVpUk9CWEhtRHVsdlA3?=
 =?utf-8?B?UkZGdndpV3NnT0JXbWI2SDBmeG80emdESWpZdDY2dDRTNThQVll1d2FxTUtC?=
 =?utf-8?B?aytSSEpVL2lYeE0yeGxlZzRJcGFBb3ViZlJ6NTdoTkxPNlVURkNWamN6S3cz?=
 =?utf-8?B?RXJsVGNtYk1MNW45c0NWc3JBcHdPNjdBQWRaZWU3ZHZwYXVveWIxQ2FCdjRj?=
 =?utf-8?B?aHlibVNGZlpoNkt0VHhwUG8vY2ZrbFlpSW00bE5lbmR5T0pTSnZQaEdLNmVF?=
 =?utf-8?B?WHRSN0Z4ZVVzYkowTHF1RDV2YlRJUWlCVi9BNkliZ1BzTXJiOW5nQU42TzJM?=
 =?utf-8?B?ZU5kTXVGR3hUK3NSLzdxRmxvU0Z1VUdFdk1EcWwwQWlRL05yWFd0Wnp1eWwr?=
 =?utf-8?B?bkhqejFLeE9mNHM1bmNheGhCeHZ4aUxESlRoSVNObm41Y01nNm1QMG9NQzk3?=
 =?utf-8?B?T0N5SUtpZllScGJ4NlVqMUkwUWVJTHYyWnpGS0ZCVXpEdHNudG5pRmd2Q0Fs?=
 =?utf-8?B?R203RXRSVU9LYTY4dWhZUXdKTEEwMUhKUWJQVWZ6czc0QW56SkovdUdrL0Np?=
 =?utf-8?B?djBGWGh1SDhnb3JsaFhTTERFaGVuckg5d1V5bHg0SjFyNFFSOXh1Q05LeDhm?=
 =?utf-8?B?L2NqSkxyVVJpdzFvd2Zzc2tlTzdkZ1JBNFYzbE53ZTJPZkxGeVFKMWtaOExx?=
 =?utf-8?B?RlRJSHRxelBoZzBTSGRMendycGsrRTJVTFdldks0VHI1NmZTWCtyc2J1L2E3?=
 =?utf-8?B?ejFBUlZJaDByRjdZaXc2czJjd3pNZGJDeDBnVThKdkxXMldEMitabGxVaGRK?=
 =?utf-8?B?WlJuTTdoa0RvTkJLenRuV2hBTlA3aHZ6Q1ZENVFCNG5kbXFqTnRVZlp5RVNN?=
 =?utf-8?B?QVZyeFZ2MzhpNGF0K0tPdUVqa2FRZnVIZ3lXcnl4WDdCdi9QZmdWcXEySGI4?=
 =?utf-8?Q?6tdA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72f9241-70ee-45cd-0f82-08dbc37310a7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 18:11:57.3035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwJHfZXZXoIs9c88dAz50jEfSrfhNl+TrieykBw8uPuZ38pOysWtjZRh7aaOb+oF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5141
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>, Emma Anholt <emma@anholt.net>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Prike Liang <Prike.Liang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-hardening@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Yifan Zhang <yifan1.zhang@amd.com>, Xiaojian Du <Xiaojian.Du@amd.com>,
 Le Ma <le.ma@amd.com>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Lang Yu <Lang.Yu@amd.com>, John Harrison <john.c.harrison@intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.10.23 um 20:08 schrieb Kees Cook:
> On Mon, Oct 02, 2023 at 08:01:57PM +0200, Christian König wrote:
>> Am 02.10.23 um 18:53 schrieb Kees Cook:
>>> On Mon, Oct 02, 2023 at 11:06:19AM -0400, Alex Deucher wrote:
>>>> On Mon, Oct 2, 2023 at 5:20 AM Christian König
>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>> Am 29.09.23 um 21:33 schrieb Kees Cook:
>>>>>> On Fri, 22 Sep 2023 10:32:05 -0700, Kees Cook wrote:
>>>>>>> This is a batch of patches touching drm for preparing for the coming
>>>>>>> implementation by GCC and Clang of the __counted_by attribute. Flexible
>>>>>>> array members annotated with __counted_by can have their accesses
>>>>>>> bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS (for array
>>>>>>> indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family functions).
>>>>>>>
>>>>>>> As found with Coccinelle[1], add __counted_by to structs that would
>>>>>>> benefit from the annotation.
>>>>>>>
>>>>>>> [...]
>>>>>> Since this got Acks, I figure I should carry it in my tree. Let me know
>>>>>> if this should go via drm instead.
>>>>>>
>>>>>> Applied to for-next/hardening, thanks!
>>>>>>
>>>>>> [1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table with __counted_by
>>>>>>          https://git.kernel.org/kees/c/a6046ac659d6
>>>>> STOP! In a follow up discussion Alex and I figured out that this won't work.
>>> I'm so confused; from the discussion I saw that Alex said both instances
>>> were false positives?
>>>
>>>>> The value in the structure is byte swapped based on some firmware
>>>>> endianness which not necessary matches the CPU endianness.
>>>> SMU10 is APU only so the endianess of the SMU firmware and the CPU
>>>> will always match.
>>> Which I think is what is being said here?
>>>
>>>>> Please revert that one from going upstream if it's already on it's way.
>>>>>
>>>>> And because of those reasons I strongly think that patches like this
>>>>> should go through the DRM tree :)
>>> Sure, that's fine -- please let me know. It was others Acked/etc. Who
>>> should carry these patches?
>> Probably best if the relevant maintainer pick them up individually.
>>
>> Some of those structures are filled in by firmware/hardware and only the
>> maintainers can judge if that value actually matches what the compiler
>> needs.
>>
>> We have cases where individual bits are used as flags or when the size is
>> byte swapped etc...
>>
>> Even Alex and I didn't immediately say how and where that field is actually
>> used and had to dig that up. That's where the confusion came from.
> Okay, I've dropped them all from my tree. Several had Acks/Reviews, so
> hopefully those can get picked up for the DRM tree?

I will pick those up to go through drm-misc-next.

Going to ping maintainers once more when I'm not sure if stuff is 
correct or not.

Christian.

>
> Thanks!
>
> -Kees
>

