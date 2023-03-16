Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D246BD2D0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 15:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE5F10E26E;
	Thu, 16 Mar 2023 14:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B510410E0BE;
 Thu, 16 Mar 2023 14:57:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNkjjFV875nF4NgxCK9KVz3ZILAUBOQ+Oz/ii6E8luSSdQp/ygls6hVtKfwgUyxUr/jBmOkFmnhLLBLO4n0RNhjajs8fcrDAtQSF9s4FqbRo3sT7TyacwkufDv2jkbkAT/RlxjJAaqgjkO6064Gc/Q1acNcmvmAwcdQ9doQecalI1cbFMplvyKjxwnOeI30MN5e8ShecGe5agqytE7nNZiHwaTrO9xU5GK/cZnhSSIYAhJr7cyZ4g6Bl/Ir40e9xIDjXP+Bc0F0hMHS5oPa8Zq+LqWDd7KSIdf+sx/zHF3rm8jPZxRpncwsEHtLoXcrieZsis/ygY4cYKoN74AP1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2dlPq4zKfz+3VpGpTFnZbvVM0ll+uak7DWtElIw2J8=;
 b=TwLcIyjdDWieTOHF1bJs155q8DUdO8HJmxLKqLBMKh0cWW6835HI8nQPLHqoss6cm66UWDOn8F4c5afflqNGjuVEbat1FaYWPUCXq3CngSnwF3dndBIR0P8S4WTuQvJ/Ajjb++Bj+GkD6cZTrekSrMnkCG9oaajuwsRLKlXPGUDxs9TE+C6pQtCJ+7U3nX/R2krILyYmq5kTm0nvRlLGM234pSCFw2eRQCjRo46qKskPrLcBWT8eGrpQQwFsgn5ramkXkSPU1IogEkdiU7YJtfaH83RjciOQGlTebuq8m6eWdqmJa9cVgM4nAFLFTo0Qkd51oCibbWtyjOMp8/dI2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2dlPq4zKfz+3VpGpTFnZbvVM0ll+uak7DWtElIw2J8=;
 b=5uZ5dt/q26TU4qXjRWeA+rMdR61tCqdvpQJh0lEwnkhzRd1VxZQTb0N9JWlI3Qo9l4iq4VkndD8wq78+SYnipzx99BoaMnqR8X9VmgLyYDBkwNc3G6st0tl5dqjXCoqSgBzWmphLjjSQJ9z0SYFvp8jHuF2XdlVHc4AxwXFb6+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by CH3PR12MB8332.namprd12.prod.outlook.com (2603:10b6:610:131::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 14:57:29 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::699d:42b8:93ed:76da]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::699d:42b8:93ed:76da%3]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 14:57:29 +0000
Message-ID: <9e79184f-8894-8773-3a30-d35d0cf36b13@amd.com>
Date: Thu, 16 Mar 2023 08:57:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/6] drm/amd/display: Pass proper parent for DM
 backlight device v3
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>
References: <20230312191751.183450-1-hdegoede@redhat.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230312191751.183450-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR19CA0028.namprd19.prod.outlook.com
 (2603:10b6:610:4d::38) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|CH3PR12MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e185105-c30b-4092-bdf9-08db262ec375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ccnzujLtyP1utS3lO1nT+XoxeA+b7ZP/nb4f/IsWLMcKjjKexVb72OZC9JKj4romygwGZOla6TmiBtmDK1BvykPOYL0yy/hSdSFeLLZvMVWcMVrVJCM7lJ24gEkh/ZrbbXC9JtN14Oj53OYaRSKsiwgWKO45S+/5jeEoNtx0pqwl10hwbAOc4A+/2Hm48xayWsWqagO/mzBKHJzQkDF2cnc8/VKfJ/fj3KleyxvhP0W/mjdIUlzAx7wYIuFuuhsuKQbXmLU7ax7ig6i5gVW4DwwayVQju+p7NABLGvBVRlmMhVZx417dXm0fpmx1rjrIczMU8DjoL4c/YKD+qhgZODVi2GugeJAud5UHmjr/5dAh54wOgOJwLvXbmc5ztRN4j6bJW/Qseknut10iGDNh4koWfGsMYrhkO1lhChU0JvK5iysCvBh1OIA8y6MmRqxNhoCBmRGU8W5THtpe7/TJdyV9FeG63hgWDdIJc6ma/ESThAZKxEo+l/TdQqAUOAHr08qXfawdCsxA15V5tnR58xrkZjqUYF4LbtImNTt4p5VXn3JEv5TGe61xxLHG9W3rK/n2booV27G1u0TpPN1JBUKCmBqhB2yiQTTsnTOkuPpSett3vhhtjAWTdlWcka0J0u201fEf8NWbYpPrknfcAfCaY9g9YV/9Dy7/bcM+Bxb2Kyd7QzEjiBhZuHIjV/YKnmLyBAU26eofEGqIw8nNrFpteEf7x7uCTKPxanRkLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199018)(83380400001)(31686004)(2616005)(186003)(5660300002)(66556008)(8676002)(66946007)(66476007)(41300700001)(6666004)(2906002)(38100700002)(6506007)(36756003)(53546011)(6512007)(8936002)(6916009)(478600001)(31696002)(54906003)(4326008)(6486002)(86362001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVh6L2c1SmZRVmFmbTJMcHAwSE5jeGx4bmNlZW9nUVdPam9oeHlJc1R3VlVL?=
 =?utf-8?B?U2RlVVJUS2h3dlpaTWpXZFZQNncxYmNmVnhHSVk3Yi9tQk5zNTVPRGd5UHVL?=
 =?utf-8?B?NGY1WktZM1pBU25zTDNva0tXQVhQQko4cmo1R250RXF2dFVYdVNHVEFocTFT?=
 =?utf-8?B?YjJCTHIzZjg1LzNpUndGUGlRU3RYVU1OaUkvMVJEUTd3VzFxaGxzc1RtbFVZ?=
 =?utf-8?B?S3JEY1NZdk1KUnhIbDcra3BjckliaXhZZVkrZHZkZTYyeWRFd3BNblJ1Q1ZJ?=
 =?utf-8?B?TXo0SXI3ZGUyaDVZUjVqdXVtVkRjaUFGeko4N0ViMG84SFoyQkJ2Ylg1WlJV?=
 =?utf-8?B?TTJqc3JhYmp5aCszdnBGeGcrQjNCbkZtSEZOM1BwWUw4SjVCVmlJMmdqZ1BO?=
 =?utf-8?B?UWZFMnRDcDdZSGhNRHZpMmQ5UUJZVUhVa09zTERNTEdheUJoYis0bXdQWlBP?=
 =?utf-8?B?bldDd29KUHFLN3V2SEFKZUdXSXg4eVV0WkdNQ0dUUlR3MmVJM1dJckQrZzdo?=
 =?utf-8?B?aHIwODMzR0xiMGU4eVpTT0REWVRkWXpjV2hIV1E2OFZJNlpwL1MyNEhxcS9n?=
 =?utf-8?B?L2haK1c3Zks5bGdaazQ2Mkl5Ymp6TjA0eVhvSG84T0IrZTdsekllYmxiL3hw?=
 =?utf-8?B?UEROYVVqUVlaZlJ3akpMS2RXYUVaL3dYU3JiNHowanJoMVNQbXNEYUd6WlU4?=
 =?utf-8?B?V2NST1k1dERRbk1iK1RSWWNxVlJ6enE0SnFEWCtNcWN6VnY5cU83ODJ4TGVa?=
 =?utf-8?B?UGx0VWQ3aUVvNTBZZjd4RC8zYzhoVHhTNU94dWViSFhyWEVzRlM1NCt6NzBU?=
 =?utf-8?B?ckx0NXlTdUlTalNUMDNwSmM5dlU1MUVVWXQvOFhSamJwY0NHNW41d3dvU2c2?=
 =?utf-8?B?VkJxcmhXTGpjL21kWUd5aDlSOU9leXh3MHJDSm5JNkQ0THFTN0x0cDBzckk3?=
 =?utf-8?B?SldMYUFFTVlMd1BhQVVBNGh5VkZEWEM5RGN1eUNWRU9wL1ZiYi9aRG11TWty?=
 =?utf-8?B?dFlVOWkyY2ZtTnY1RVlEbHlRUExrUkNBd1ZDd1lLcnJuN3I1azkyR0xUdjNm?=
 =?utf-8?B?elFmSTVCbndzT1RpNlVMOHlTaTF0RWJKc1ljUzZPc1pqckN0WkswdGM1NXVR?=
 =?utf-8?B?cEtvcmM2eG5YWE42R2orakRlMC8vZUg5eDUvWDgyWTF4S0U1ekxab2s3emY5?=
 =?utf-8?B?WU5wTXg2dTliU1pGUUVFSVZQWUUveTduU0tVTWVVbmkvNjVkZTR6WjFOQ051?=
 =?utf-8?B?Wk05ZDF5blNENFpTdGZkbmN2djZxN1R6ZnlOYUpOQ0NycGUyVFFjVFpoWUpQ?=
 =?utf-8?B?NE5jRE14K3I2eE4vNmRQMjlZUWlsZ1pPUUNqelU4VmEwL2YwcHZOZVRkdFc2?=
 =?utf-8?B?THViRndVRjlaT2tyY2xPczE4cjNyREppRW5UU3RNOWVvellLZi9YVTJwUGRN?=
 =?utf-8?B?M1FpQ0Z1bmxiME5yK3RBZ0ZYR3JkRXkyUWRyZmhaMm5XSng4WDArTHNxK0s0?=
 =?utf-8?B?Mi8rTjVNMVZDNHZvUWFtY1JENU9JMXNVQUs5YzlZUmtXcWZNdTh0RVFLVDFk?=
 =?utf-8?B?Y3B6dTZEZCtYYWNDQnk0NHAzcFJOTllvZTNZRjFVYkxkbXpOSDdtd1ZLMVRq?=
 =?utf-8?B?WjFSY0NyREhNT2h0TjZqM0xzYUlsanZndlc2TFI2bHZRVXJUMDBVNG1Gd3kx?=
 =?utf-8?B?OW9EdlBiVGs3NVYyRHlqamNsZTEzbU9keklKenY2a1VNMkt0S0tBTisrV3RG?=
 =?utf-8?B?MWx3TTFVcHZEUDZRRUxtL01WNnpWZFJvWUNaZTZkQjVkcm92RjVmNlozNmtm?=
 =?utf-8?B?WnA5Z2x5WFI3eHBIUmpiQ21STjU0V1BxSkh5VHVGcmNicnlPRkVQV2x2R3VI?=
 =?utf-8?B?NXlOZzFVNHdlUTBhSkQ0enV2UWtNNTFtWGVSbVpRZWMzRE5YUW5wK2czWDhC?=
 =?utf-8?B?TzRuR3Azc3FiTmJadWlGY2xDNTlRdXNjbEhPd0hVZ1YzQ284LzZsNjNMQ0FJ?=
 =?utf-8?B?UHVPU20xKzR4VDBRQk56ODNmMVhuREtNTjFlaWY4ZHdhVFVTZFloUTcrZGUy?=
 =?utf-8?B?cmhqRWJZS3pJSG82N3pNSlpBSlVpMEtOK3M0QVY3VUhaaEhIN0NxY0Rxdzla?=
 =?utf-8?B?MjdudTJ5Wnp3bDBIaVNadFNzL0NIVVhDZDVwUkVCTHRwZUt2VURMNlh1Wmdw?=
 =?utf-8?Q?t5ZeoiAK9uwshDZgEmz6nSgdOkLqRUuEk469PyH61zKp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e185105-c30b-4092-bdf9-08db262ec375
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 14:57:29.4244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TWwAwIMCc3cvIkCpzDRzQ9wMbwHjxAEdXiLEex6ea5ZZK+jZPux2ANOzZNrrUy+JZNLaOC+5zSD/OxYmwV3Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8332
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/12/23 13:17, Hans de Goede wrote:
> Hi All,
> 
> Here is version 3 of my patch series to pass the proper parent device
> to backlight_device_register().
> 
> Changes in v3:
> - Make amdgpu_dm_register_backlight_device() check bl_idx != 1 before
>    registering the backlight since amdgpu_dm_connector_late_register()
>    now calls it for _all_ connectors.
> 
> Changes in v2:
> - Patches 1 - 5 are new, reworking the code a bit to allow delaying
>    the registering, so this has turned from a single patch into
>    a 6 patch set.
> - Patch 6 now delays the registering of the backlight_dev till
>    after the drm_connector is registered by doing it from
>    drm_connector_funcs.late_register.
> 
> Note this no longer is RFC since this has been successfully
> tested on 3 laptops which hit the affected code path.
> 
> Version 3 has also been tested on my personal AMD Ryzen 7 5700G APU
> desktop machine and now no longer tries to register a backlight
> device for each connector there.
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (6):
>    drm/amd/display/amdgpu_dm: Fix backlight_device_register() error
>      handling
>    drm/amd/display/amdgpu_dm: Refactor register_backlight_device()
>    drm/amd/display/amdgpu_dm: Add a bl_idx to amdgpu_dm_connector
>    drm/amd/display/amdgpu_dm: Move most backlight setup into
>      setup_backlight_device()
>    drm/amd/display/amdgpu_dm: Make amdgpu_dm_register_backlight_device()
>      take an amdgpu_dm_connector
>    drm/amd/display/amdgpu_dm: Pass proper parent for backlight device
>      registration v3
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 100 ++++++++----------
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   1 +
>   2 files changed, 46 insertions(+), 55 deletions(-)
> 

Hi,

First of all, thanks a lot for this patchset.

I run your series in our CI (IGT-based), and I also conducted some 
manual tests in my ASICs. Everything looks fine.

I also reviewed this series, and it LGTM:

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Finally, I pushed it to amd-staging-drm-next.

Thanks
Siqueira


