Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBA5738876
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63F310E4A6;
	Wed, 21 Jun 2023 15:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2086.outbound.protection.outlook.com [40.107.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D44B10E4A7;
 Wed, 21 Jun 2023 15:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QN2LgjbvO2YyMfn4Wm0mkDTXZ+5SRLGClt6y14pV3d1XPb6LtEcM2Is6N5PoZnouUasZN3ybvpqB4cNo90QrFHeiXgW86uEgzwIuI8NNmmNDbAQ/8qR+PByqBY6i480R06OODDSfGQPdGVXU6O3A2/cBDhuOCpDSiwNfnhkRIDKmgjQ9Z9TTdbCq3A1No0uHgXTK9N+PL1WeZsJDqed0DI9kp43XJh2XEAeIApEJqq8W/daoBCC1OP1EBfPy0MD1WvihLRaTniA510kXOcmu0hSQvF9rozpkHvlRLZmSULg8pmj2vdnNQHiYICrWXK6o3ppCVgbuoaWWA5M9i3CmIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXJ3+1tIZZBkckweCsw6P/W1DXjQ8b2e3DS6pCapJVI=;
 b=SCWVxote7bV/aH4nJRRv8ATqILgAyCukVtjUFdqMpGlcgaxtcWXsS2Hq0uPj8vJeouPyk4n8vHxfSvQ+GBSB0O0sjfkOCgllHwjrUSgmccscpdOv0M5NkcwYycyyNa3esDYzdNHDlNGhgnNtyQtR0v6/WKZTVUcYXAe8yHesHhNe1IHZUlRz/DlaAx916muFCsPfgzAawBXvQZGuKjh7ieKQsT+jIr7Ez8LC+1hUYUtSCa9g7GhXfn2XlObFGhJkBfwTIDMKaZkeiEQLHvIfR5zNjDvVvsmBnri5EJVcQzfRqZqXUr0EDsAXmgKDJNFGu6gx113YvfRqhOSj41uwPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXJ3+1tIZZBkckweCsw6P/W1DXjQ8b2e3DS6pCapJVI=;
 b=MtneHrAe4fr+LkIJ/44eJmo8Wvv8TzEqctNdMrZ6kzrpYJWmHRDigV7FJJnJ5S4be84O568lItfbUALysOek2d7SUscrBQTH3oJ2hY5zo0c8YY0aolsVaPQyOUgUUhDxzz6tZmNrRRW/tHcDj5fcsPNFPtzU6IeOlVodH+boKyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6247.namprd12.prod.outlook.com (2603:10b6:208:3c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 15:09:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 15:09:21 +0000
Message-ID: <e5eacc1e-36f8-be9d-dfac-a68c1663498c@amd.com>
Date: Wed, 21 Jun 2023 17:09:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v3 0/4] drm: Standardize device reset notification
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
References: <20230621005719.836857-1-andrealmeid@igalia.com>
 <caa69e8e-f330-d819-e8cd-7b06aa8eb855@amd.com>
 <195dd084-a97b-ef08-a221-e39ffcd7cc09@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <195dd084-a97b-ef08-a221-e39ffcd7cc09@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bda986b-ca0c-412b-1681-08db72697daf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JvTLcGjwmSKaoy5tqvhoryVmCZEBgHQTpfGdyk1SPJBlcYkwTddxfx1tTdBz+wQKqpWmb5swTtQYQTugD7gtr7tOjuOyfvHUjseYFsrCLuaiK79rOF0OLUViz3U2rbF7TlSPow48X6zD9EcNlvRrf2tKTlP62FeFP5wvQxs6oEKtcfTgL0VgSh//FU1fy64O2Dpdnmjo1V2/J3oujvcC3hDuNGhfTG5pLo5SxnysSqT/KwTgHjtCxdCA2s97vDgQGpW4wMb33Krvhfp2qvVKD3BmjQUhSFCS1+2/8angPCmvh2QbOU5sPJ/zIqPvE5gcUsuRKyF6Qju3+IF+YtRI3gCG/Sg0r1YrQ5ig7khN0lR71aqk4FI4RVhhDDbbw4x3G6f2fPXfGI5u5n37k2e5FslFrbZpBjrSYepq9zWTb6BnbmXnmlW1Ukp7UJR7uD4RrEkA9JFUWANPBq9V8FVAC4BIB9CBRlNrmoBzSJXkE+DPt5XUi/NhGowxvmGHtdKe2sPPZThhIpWfkPt99g8mHal3SqmxFbFCC8aw2Kxuz9I7ruU8IqVVq3XtN9PIVarsgiHU1mH4p896F19BOeg33B1tNwfF+PZl11kKI2Sx68/8AtjH3pSARG90XVD2ebwOAy+Zd03qaF41HhE4E8HPdpVa/pAka6Sh3gH4uGIPRKk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(316002)(8936002)(8676002)(5660300002)(7416002)(31686004)(4326008)(66556008)(66476007)(6916009)(66946007)(66899021)(41300700001)(2906002)(54906003)(6666004)(966005)(478600001)(6486002)(6506007)(186003)(6512007)(36756003)(66574015)(83380400001)(38100700002)(86362001)(31696002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2J2bGxEcFpmd2hIckpXQmY2bmt5a1dRazlNMnk5aS9mOFhMRmxsOGdXTTRN?=
 =?utf-8?B?ZWhQT2Q1c3NwdndHazQ1V3BURDdONENGTGV3eGVFbVV5K1hiUS9IR0hXT3RJ?=
 =?utf-8?B?K0JHbE1US1Z3aCs3bzNDSnhjaXhUMnQvWmNsdEFuWVliZnBpVW1INjZpenJ4?=
 =?utf-8?B?ZnFkNmhjSHBSdElEMEVTNC83QzBwUU91MURwTnpSK1ZVZEFwYVdNZEpIZWpl?=
 =?utf-8?B?bE5OekhIWmJCUmhxQnl2SGdzRmZvekhQYXhEdFZHYjUxeWFDaXJHUEU2U0pa?=
 =?utf-8?B?LzBIUXBkMHVrQnFiQStqZGpGbzh4ZVZnOS9VcVcvNDFERzVFQVBxNTgrOUtH?=
 =?utf-8?B?NGlTUE9qeFVEWGN6SDlkYTFscWFOdURma3VaRDhtSThaSDcrRFNEZDk1dmxy?=
 =?utf-8?B?MmdhSGpobkFlVllsWDFZT3pSckhJTGt2bDhVUFlHQzBGUWZDT1hDbnFGZVgw?=
 =?utf-8?B?YktYbk1teFlYNWpFUXliVEptVU0zRi9FdGdIUE5DS2kyNkR6M0FzMENpNXgx?=
 =?utf-8?B?MHkyTnc2ZTdJZENHcXFBOVlZblE5WkxGNTBJc000aHNEaHZtaG5SVEMyYnU4?=
 =?utf-8?B?TFp3S1FNcW4vK1JYRGF4d1N2Yk01UktGUVIzdy9HaVkramk5ZCtmZUpORHpT?=
 =?utf-8?B?dzFrbkw1cEhnWFN1dHhOWDdmOURPUldubFNyNjViclhsaWNOaTJMM2VQdFZZ?=
 =?utf-8?B?VytkUlMwbm1sY29zTnBoYnlIY3BpK2xrLzhjMmd0Sy9HazRoRmFBaHZhVFBG?=
 =?utf-8?B?ZXoyZ21MQzhMN0MzL1IzWHhvQ0hocXBMaE93VlhWa1pkQTNvWTBVcXFkU0Fz?=
 =?utf-8?B?Nk9JQ28xRVY4MnZNT0VjR2t0V0V5QXpERlhMWHBDV2hVWG1aaXhFdXFKQ2Nq?=
 =?utf-8?B?WW9sTEhvOVA3cld5WlNuN2tVWitSL1NEV2tYcWZpRWpDWjVtejFaRStBZHZx?=
 =?utf-8?B?MHZzNmQ3QmRVbEhVRFg0MFdtQldNV1cvMlEzTjRmekVSV2VyM2VJcmlPY0RR?=
 =?utf-8?B?aW5uWlVLWGVHUzgzSzM1NW12VTNOZFg4TlUxMlMvRE9vQnhYbituODNyZlM1?=
 =?utf-8?B?L29CYTdxWXlVZkFJSnFiSHhwcTBaZm84ZkkyTUdUbmp6cnhFOGM1SnBoQTBP?=
 =?utf-8?B?V2l3NXlqak5SNlN6RGtEcGRuaWF3YjN0L3F3M3FEV29OVkZQangydzZNOThT?=
 =?utf-8?B?UVAxSUorVEVHcW5LNllPbVF2VXpsTFJzV3NQbVRLcEtXLzI2ZlRZbnNQSFpE?=
 =?utf-8?B?SjZEdFM3OGRwZjl5MGROaEFlV2NkSDh3V1FYNnlUZ3BlQmVlRG9vVDM3NCtw?=
 =?utf-8?B?T0VvaC9yMGdubHBaUG5YL0NwSS93RUZkem4zMC8wbnptOHpKVXFyVFV0MW1z?=
 =?utf-8?B?RGhXTXZKWENnWWZDS3FHejhDaGY0Y2tQLzFGWjZiaXJPR0UyS0E3MHd6VkhQ?=
 =?utf-8?B?UVZRVnRNaEZnNHA2WkhWd0VPaDh5ZFpXNnBDVFMrR0JwUzFFTXpXUkJPc1ZW?=
 =?utf-8?B?bkt4VGU0M0I5UCsyMzlVY3hRZ29JZjFsWTN5emFBT2piaHNJamw0VWJJTE4y?=
 =?utf-8?B?cWJGM2QreFJpWXBleE4xY2w1MGlLaGY1LzVUNTFjTC81Wm5wRWNGRW42OURR?=
 =?utf-8?B?bHk1VThaRWx2TVM5cnV6Zk80aU01NjRUcURyNmx5ZTYxWUVEZUZ2TkduQjJZ?=
 =?utf-8?B?MmtYUStGdHk4TjdBZTA0ZDd6OUdQbDBHZU92c0hvWlZmM1RTTmU4dktQRG52?=
 =?utf-8?B?U2NUZ1N2M1VCRElpaW52cWpWTGF2UmVqcitRakRSekRoakFYSjZ4cHhDMXRM?=
 =?utf-8?B?SXVBRUJFZWZwSVp6cDdPblpkOGltdlI2QVRzTnZGQnZWSklIV05EQUxFYVdX?=
 =?utf-8?B?YmRlMHlJSWxwZUsydkFJczRVSEpLZXhnQnlabDFaVGFSeHdheW9SaUIxajVJ?=
 =?utf-8?B?YUFmMmNOM1F5eWxzU1JVcm95U0N6aE9wbitNaTJiRHZsbm9HWUljQldTRE5y?=
 =?utf-8?B?Vnp6SDdQSDh0RFVmaXVZbmtlRjN6TitKcU9vREhDWnJPVmJacGJyVU8rVi8r?=
 =?utf-8?B?ZTA2ZGtod0RFcXBCMWMxWjA5Y2FOTDJJOG0xejFuNVM5TERkVXFBcTJZN1hD?=
 =?utf-8?B?S0hkbkdFbGRtdmtKZ290Y3JLbE8wSEo4QmkzMkdyQXUzRlJqSkhMelA4ekJq?=
 =?utf-8?Q?sSTKlD/Ywx7jzMpCgjz9K74zQZ/e35DfaiUqFfYWkWK2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bda986b-ca0c-412b-1681-08db72697daf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 15:09:21.4346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhR7MsDS3B7hyVwGenVEM/bz9NpZ3p9O3cW3EF4S0BE5euhLD9i1TX+mIq6n7FBo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6247
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.23 um 17:06 schrieb André Almeida:
> Em 21/06/2023 04:42, Christian König escreveu:
>> Am 21.06.23 um 02:57 schrieb André Almeida:
>>> Hi,
>>>
>>> This is a new version of the documentation for DRM device resets. As 
>>> I dived
>>> more in the subject, I started to believe that part of the problem 
>>> was the lack
>>> of a DRM API to get reset information from the driver. With an API, 
>>> we can
>>> better standardize reset queries, increase common code from both DRM 
>>> and Mesa,
>>> and make easier to write end-to-end tests.
>>>
>>> So this patchset, along with the documentation, comes with a new 
>>> IOCTL and two
>>> implementations of it for amdgpu and i915 (although just the former 
>>> was really
>>> tested). This IOCTL uses the "context id" to query reset 
>>> information, but this
>>> might be not generic enough to be included in a DRM API.
>>
>> Well the basic problem with that is that we don't have a standard DRM 
>> context defined.
>>
>> If you want to do this you should probably start there first.
>
> Any idea on how to start this? I tried to find previous work about 
> that, but I didn't find.

I'm not aware of any work in this area, maybe ping on the Mesa list as well.

Could be that someone looked into that but never send anything out.

>
>>
>> Apart from that this looks like a really really good idea to me, 
>> especially that we document the reset expectations.
>
> I think I'll submit just the doc for the next version then, given that 
> the IOCTL will need a lot of rework.

Yeah, agree completely.

Thanks,
Christian.

>
>>
>> Regards,
>> Christian.
>>
>>>    At least for amdgpu,
>>> this information is encapsulated by libdrm so one can't just call 
>>> the ioctl
>>> directly from the UMD as I was planning to, but a small refactor can 
>>> be done to
>>> expose the id. Anyway, I'm sharing it as it is to gather feedback if 
>>> this seems
>>> to work.
>>>
>>> The amdgpu and i915 implementations are provided as a mean of 
>>> testing and as
>>> exemplification, and not as reference code yet, as the goal is more 
>>> about the
>>> interface itself then the driver parts.
>>>
>>> For the documentation itself, after spending some time reading the 
>>> reset path in
>>> the kernel in Mesa, I decide to rewrite it to better reflect how it 
>>> works, from
>>> bottom to top.
>>>
>>> You can check the userspace side of the IOCLT here:
>>>   Mesa: 
>>> https://gitlab.freedesktop.org/andrealmeid/mesa/-/commit/cd687b22fb32c21b23596c607003e2a495f465
>>>   libdrm: 
>>> https://gitlab.freedesktop.org/andrealmeid/libdrm/-/commit/b31e5404893ee9a85d1aa67e81c2f58c1dac3c46
>>>
>>> For testing, I use this vulkan app that has an infinity loop in the 
>>> shader:
>>> https://github.com/andrealmeid/vulkan-triangle-v1
>>>
>>> Feedbacks are welcomed!
>>>
>>> Thanks,
>>>         André
>>>
>>> v2: 
>>> https://lore.kernel.org/all/20230227204000.56787-1-andrealmeid@igalia.com/
>>> v1: 
>>> https://lore.kernel.org/all/20230123202646.356592-1-andrealmeid@igalia.com/
>>>
>>> André Almeida (4):
>>>    drm/doc: Document DRM device reset expectations
>>>    drm: Create DRM_IOCTL_GET_RESET
>>>    drm/amdgpu: Implement DRM_IOCTL_GET_RESET
>>>    drm/i915: Implement DRM_IOCTL_GET_RESET
>>>
>>>   Documentation/gpu/drm-uapi.rst                | 51 ++++++++++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  4 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       | 35 +++++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h       |  5 ++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  1 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       | 12 +++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |  2 +
>>>   drivers/gpu/drm/drm_debugfs.c                 |  2 +
>>>   drivers/gpu/drm/drm_ioctl.c                   | 58 
>>> +++++++++++++++++++
>>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 18 ++++++
>>>   drivers/gpu/drm/i915/gem/i915_gem_context.h   |  2 +
>>>   .../gpu/drm/i915/gem/i915_gem_context_types.h |  2 +
>>>   drivers/gpu/drm/i915/i915_driver.c            |  2 +
>>>   include/drm/drm_device.h                      |  3 +
>>>   include/drm/drm_drv.h                         |  3 +
>>>   include/uapi/drm/drm.h                        | 21 +++++++
>>>   include/uapi/drm/drm_mode.h                   | 15 +++++
>>>   17 files changed, 233 insertions(+), 3 deletions(-)
>>>
>>

