Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 451F63BF900
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 13:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3936A6E8AA;
	Thu,  8 Jul 2021 11:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2052.outbound.protection.outlook.com [40.107.100.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F426E8B0;
 Thu,  8 Jul 2021 11:28:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRJzJZQD4v+tXHzT57CmVHqIUlGP1VeMAoQLnsuZLfrelPeYOHLKkcJhat2lNOMAmIfjiNgscr6FWS44RuYLBdTzVNY/KuW98AoKMEMcme0TLnA24t7hOq9yyDddBncbmfN2NdvqEGVrUqR4kRd3MFGZURL84UH/1zeJ7+QWOkF632Uc7i0GKR3BOOP3ZjGXawGp0JzCS2XUiYXVcsyDMrDEvqVkJY4CK0Amiu0k6FySK2RyNe8deb99N55RsobKkCs7bC7lX3Z1mffkpL3sie5CAkryBNLtIQxl3wsbsm17ycbWBZ2vPBOVMUHBZ3AcIgSQmgEKlteGt85ww9vXSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DO/vjImT24Z5cObG8d/Zwo5Rf9rm+llga0Ey213MNdM=;
 b=dSfX1G399W6fp5iNQFo01W+e5VwD10gqEKRK+8bZc3ByOwKa4eSOiz1G88DuRaZef2gFbUvHFtJFYJtjKhdRxwUYJjCrFMrO1BxtZtGhAZPuJc15vtoaIUHk/xw7LRYo6/sag++6n9i6lzxs5XcnGyFubi9Ol1gG2e9g6lQnQ+Pg/H9tBCsFFPQTHLk/wTKS9ojvo+a0cj47bCACHm4mLWf5Er/VVvyMKE6ahu1IAnNJk+tDfUyddfPMAvnw8sBm04tf2xfOVYowchIbWidNOJUxJs29OKQN+u3xu2SMSgelxACu+GJit+Cz0qmsuxlSMVvsk0wpKa0fu8pS2xsIiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DO/vjImT24Z5cObG8d/Zwo5Rf9rm+llga0Ey213MNdM=;
 b=dGF4X3N8r8fe2tKhF/YifpJ6a3pvGd4WQbTvyx1Tc2oYRW+sopMI5Z05AandKJkyrkPK415bLvh67ieP50VNlyJQT1GM0ovQa2MZelb5MnuOH7A/TSZaFDEjMLsPhO7ePXcCX1x2LGuGcRaXeATYr6DQI0cqRtdEVzlvTukoruM=
Authentication-Results: anholt.net; dkim=none (message not signed)
 header.d=none;anholt.net; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4913.namprd12.prod.outlook.com (2603:10b6:208:1c7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Thu, 8 Jul
 2021 11:28:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 11:28:22 +0000
Subject: Re: [PATCH v2 01/11] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel@ffwll.ch>
References: <a5c5647e-e0ce-cc6d-c473-685679739051@amd.com>
 <CAKMK7uGTSe9FZCup=6D2G3MWGuxoUiV3Qjau-pQyaqOAX8OTug@mail.gmail.com>
 <8387b5f8-a5f6-fc2d-48e6-4bb0768ac642@amd.com>
 <CAKMK7uFu7V0QzsbMGPJPnMjXOB7FrKB_d+oDwkFMVaEvgy5EOQ@mail.gmail.com>
 <7933a995-0c95-9339-5385-a24681f6df3a@amd.com>
 <CAKMK7uE3bd2whKVBA4uWmzKBp7fjcVKexVFc=TB+ZRxdYT7VNg@mail.gmail.com>
 <b4824514-4ffd-a5f0-9bbc-d89cdd4e7b50@amd.com>
 <CAKMK7uF7E4G9D_W+YRV_ZrJLtUFXqWZfN78VdrVC=byMux78LQ@mail.gmail.com>
 <CAKMK7uEwFUq2KnSjk0YgdbKKvhh2ifsyURO0E5RzzhWzzMtovQ@mail.gmail.com>
 <4369ee92-7eba-3faa-4d9c-08901d3506aa@amd.com>
 <YObNNcSZL0CBXvQK@phenom.ffwll.local>
 <700b6419-4d3c-9cc8-f8bd-0d7d134df546@amd.com>
 <CAKMK7uE4H2nsAYSAQGB0R7YTHUFvfNmshE2Bqy0uSdHomPxo=A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3c8a29f4-07c0-63ce-703e-9d652534642d@amd.com>
Date: Thu, 8 Jul 2021 13:28:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uE4H2nsAYSAQGB0R7YTHUFvfNmshE2Bqy0uSdHomPxo=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0092.eurprd07.prod.outlook.com
 (2603:10a6:207:6::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bc19:c1e3:6307:7e3e]
 (2a02:908:1252:fb60:bc19:c1e3:6307:7e3e) by
 AM3PR07CA0092.eurprd07.prod.outlook.com (2603:10a6:207:6::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.11 via Frontend Transport; Thu, 8 Jul 2021 11:28:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a51d864-d939-4c14-5859-08d942037e61
X-MS-TrafficTypeDiagnostic: BL0PR12MB4913:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB491391868F0489F1CFC3D4C983199@BL0PR12MB4913.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TbfS5n7/jMheRRE9EMoJX+cGn6lo9dDEEkbin7wbnQXbYNhWADy9ifxMf1gVYC3ch6z0c/t4wh4KF3oy+tF0z3Rejjlil87qBu8nxAiUyldKO3jAXTdJx4b77DT/OdioF3sNQeMoV+/cd9s88pgIrbvE8+Iy2Reu/BY0jufQkmb93obFXvJp/HaT68pUFME4Z4dE3yAB83AzGolhjuMoYwY6DSkSTjaTv7kM+xatPTNaoE8XrpJjDNYfiNP2dFiSkZYKWkgfHGsjJIkggWuzSTZi6z2uvIQ07Pu4Tv+PpQ2/Z5y3D5fHoeJY3xgNnNE0ftJozvJuPWV1fv1ZQXoav/B+cUYULYKI8C4k/bWyuKr0cBPqfD7yMDKr+894we3m+7aiKeewLlTeUriXJ+o183vknw3d2ONhJYfbYwh9voSYi7V6AZuu6ZMgS5Lz/SeCwN2jfsdUxYl1VuKimeRNhEO86/3r2NGS+0Eghv6B+GMfJb4NlhLVCRkOwiaEMaecxRJZL9n3YHfEflm3D2uGGBX47utsKKXVsGqovkiOI4ap3u35jhs06NX4hf5oEIS7yk4ZgrXt2OC9g88lFeoaN6RPd96viY6cNNKDEXThVYYJwnn4+YOPCmTXdM2GG/CMr3+zbtLQ4ochUrPgDh9u05aSQHOXaoHP6wpB09oDLf0xM9K8VV7FdaAH1CamAdYIvpK/t5jufEQzbDeykxVFlE2qa3X8ce748zlt6rSDndEal3hoqG9eWcp7thLyVeqIfP5dzCvbgcM3cBWxPuB7ZB5gobNsOImwH89wyn2qFUC0VZMPbPfJSo5i2rWel8BX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(316002)(54906003)(186003)(45080400002)(38100700002)(966005)(478600001)(7416002)(7406005)(2616005)(31696002)(2906002)(66556008)(66946007)(8936002)(6486002)(6916009)(5660300002)(86362001)(66476007)(53546011)(6666004)(4326008)(30864003)(8676002)(31686004)(36756003)(66574015)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU1TWjVhL05DNzJBV2oxUFQyMkpHNlNPYkZJRkI0Vnp4Y0pXS1o2ZzZjQ2R5?=
 =?utf-8?B?K1dtYngvTTkyZk9XMkxnS1hRQURLVzcyZzh4NlRmazdXc1NXWnNNbGcrVEtn?=
 =?utf-8?B?dGtsYUZZcDNxSGdCQUc4N0EvRGRGSEczbHZHSmc1bVJ0TDJMMU1WeE9FVUp0?=
 =?utf-8?B?QnNZa0djck1DV3VwcUNEVmVSWXUydzF5aDZxMXhWNGUwTmFnSTJvb0hma1Rt?=
 =?utf-8?B?K1VSVjlrMVV5VWRiMzBUMktEVTFxN3dGZ1Vuczh2Z3dKdkdXSGhkOVVoOVln?=
 =?utf-8?B?R3FGUEFsYlJ1NVg5NGNmTlRHRS9KZHcrRVhiQUpuMHhyQlFRWFd2QzV5NDI1?=
 =?utf-8?B?UGtIemlHVjNDanM1OUJYdlNDa1JFMExXNkxvckVNblhDeHVURVB0bDdlclFx?=
 =?utf-8?B?RFU1WHArYi8zd281QVF2MDQvS09yVTVZR1RPc0VaZ2JZZ2g4N1dUd2YyN09I?=
 =?utf-8?B?Q1Q4aFpYSXpWSmVocGhwYitSTW5MbEd4akJ3aTR2bGF1NXFhNkZQdjVIelo0?=
 =?utf-8?B?bHE0WnZnOVlnVVhOSHJORlVZYVlWeW8vUC9ITWFTNnVEZkV5bi9FMFBZSUZW?=
 =?utf-8?B?Vzc5OUJKTGkyYU0relBDdjFnQWJqVXVHcjFKTjFxbm9KQ21RWnRERFBhaUtR?=
 =?utf-8?B?Y0hVOTJiNnAxVkNad01xRlZNVVFQL3Z4c3J5RWxMUmw2SFdwanRZU1FFZGxQ?=
 =?utf-8?B?WDVzdEhzZ0EwY2pQWlNYcURXdkJTa3JPMGZvVTRxV3BYVEg0dDVPYy9RT2Vz?=
 =?utf-8?B?QjFySHNWQnFEbWhneEpsOTVpQ2dNZ2VGc1EzQTBGYUJ4Z1NMcnFxMThvcXlL?=
 =?utf-8?B?UkRicXFzSm5UTEpLTEFXUjE4VjdrWkQwcm5laDgycjJmemI4akdNOS9RUWls?=
 =?utf-8?B?UjVTaFdSS052NWpWZG5rVy9scXM0OVZ1QzU1ZTlweDlQeUJNZnZDNDhoOVlL?=
 =?utf-8?B?a1gyM012MzNWc0JzUzM2VUFURlpBUzhoVFZVWUtyU3NYZnVIT3VWR0swNlY1?=
 =?utf-8?B?dDR4NG5JMzU1enhycys2YzkrbkNSSEpobzh0TnJFQkd6Z1A0UDVDNThnU2VF?=
 =?utf-8?B?OUN2eTdUUC85eGVVV1htUGhXL0Z4a3hNN2I0WUZtNlZhREtNWElRK2E3dzBF?=
 =?utf-8?B?TloyNDZLVWZFRnd1YUZCbDE2R1pKL2ZyY0tPZFdXd3EveXNiYW1NSlFEZ0Nx?=
 =?utf-8?B?Z2NmbXFibGVUSEZUNUJ3RlRxZzFxWjExemcwY2VUSFV5aXEyN2gxQUY2WXhN?=
 =?utf-8?B?dG1EL2RHdTkxOHlwM0ZOWjQ5NmxLYytNNTZWYWJ2WHdiNzQ4dGh2WGdIQnBJ?=
 =?utf-8?B?VWZCdmNOeTU4dlY3eWpHdk16VXJKN1dlOUE2a0hHUjdSSVltQnhtcXMxdXdG?=
 =?utf-8?B?UUxDUjFIYTVUNEU5T296Tjd3WWdzMUZlODB3Tk85aDQvVFZYZTUyZ1d3d0J6?=
 =?utf-8?B?NFB4ekhraEZNR0tNM01SRmhGam5hOHRTWS9XVUliN09iNGltZ2RaODhOdVEz?=
 =?utf-8?B?aTBFZ0psNGFLTW40VmFtcWUwQW03aGF0NDBQQ3ZhMG04YWZ6d3pnYXp3ekVD?=
 =?utf-8?B?Ni84MjJMVnkvWk0zUXRhWXRUTnFtajlFa0VvNlMyc280RU82ZkR6eWtpRzFj?=
 =?utf-8?B?MElOeGRPZTBacW1CREhxM0ttemJtUGdSNnlxYUNGb2dpbFVRa1ZVRTVrWkFK?=
 =?utf-8?B?ci93YXBpWWt1U3NHMXJBbWROaXUveEJuN2ZQMmI2dDBGZXdyU1VOU29rY1Yx?=
 =?utf-8?B?ZkNINnNFdUdKU3h5a1ZTRjBYS1hVdkE2VTZVV0RvNmoxcEFrSlF4WU43Qkhy?=
 =?utf-8?B?YkNXL2NvMktjTm91VmlhZE5mRXRuL0VveGI1RUQ1WjY5eW5IU2FTN3lDMjBi?=
 =?utf-8?Q?HDKqqYAsqTnFM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a51d864-d939-4c14-5859-08d942037e61
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 11:28:22.7067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHL0WQXV0binJQB5Io6OUvNPNXwj7KW8YndvMLWbveswqOrQk/1iPPkjOLTjDLrH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4913
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
Cc: Emma Anholt <emma@anholt.net>, Adam Borowski <kilobyte@angband.pl>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sonny Jiang <sonny.jiang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Jack Zhang <Jack.Zhang1@amd.com>, lima@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Nick Terrell <terrelln@fb.com>, Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 08.07.21 um 13:20 schrieb Daniel Vetter:
> On Thu, Jul 8, 2021 at 12:54 PM Christian König
> <christian.koenig@amd.com> wrote:
>> [SNIP]
>>>> As far as I know that not completely correct. The rules around atomics i
>>>> once learned are:
>>>>
>>>> 1. Everything which modifies something is a write barrier.
>>>> 2. Everything which returns something is a read barrier.
>>>>
>>>> And I know a whole bunch of use cases where this is relied upon in the core
>>>> kernel, so I'm pretty sure that's correct.
>>> That's against what the doc says, and also it would mean stuff like
>>> atomic_read_acquire or smp_mb__after/before_atomic is completely pointless.
>>>
>>> On x86 you're right, anywhere else where there's no total store ordering I
>>> you're wrong.
>> Good to know. I always thought that atomic_read_acquire() was just for
>> documentation purpose.
> Maybe you mixed it up with C++ atomics (which I think are now also in
> C)? Those are strongly ordered by default (you can get the weakly
> ordered kernel-style one too). It's a bit unfortunate that the default
> semantics are exactly opposite between kernel and userspace :-/

Yeah, that's most likely it.

>>> If there's code that relies on this it needs to be fixed and properly
>>> documented. I did go through the squeue code a bit, and might be better to
>>> just replace this with a core data structure.
>> Well the spsc was especially crafted for this use case and performed
>> quite a bit better then a double linked list.
> Yeah  double-linked list is awful.
>
>> Or what core data structure do you have in mind?
> Hm I thought there's a ready-made queue primitive, but there's just
> llist.h. Which I think is roughly what the scheduler queue also does.
> Minus the atomic_t for counting how many there are, and aside from the
> tracepoints I don't think we're using those anywhere, we just check
> for is_empty in the code (from a quick look only).

I think we just need to replace the atomic_read() with 
atomic_read_acquire() and the atomic_dec() with atomic_dec_return_release().

Apart from that everything should be working as far as I can see. And 
yes llist.h doesn't really do much different, it just doesn't keeps a 
tail pointer.

Christian.

> -Daniel
>
>> Christian.
>>
>>> -Daniel
>>>
>>>> In this case the write barrier is the atomic_dec() in spsc_queue_pop() and
>>>> the read barrier is the aromic_read() in spsc_queue_count().
>>>>
>>>> The READ_ONCE() is actually not even necessary as far as I can see.
>>>>
>>>> Christian.
>>>>
>>>>> -Daniel
>>>>>
>>>>>
>>>>>> atomic op, then it's a full barrier. So yeah you need more here. But
>>>>>> also since you only need a read barrier on one side, and a write
>>>>>> barrier on the other, you don't actually need a cpu barriers on x86.
>>>>>> And READ_ONCE gives you the compiler barrier on one side at least, I
>>>>>> haven't found it on the writer side yet.
>>>>>>
>>>>>>> But yes a comment would be really nice here. I had to think for a while
>>>>>>> why we don't need this as well.
>>>>>> I'm typing a patch, which after a night's sleep I realized has the
>>>>>> wrong barriers. And now I'm also typing some doc improvements for
>>>>>> drm_sched_entity and related functions.
>>>>>>
>>>>>>> Christian.
>>>>>>>
>>>>>>>> -Daniel
>>>>>>>>
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> -Daniel
>>>>>>>>>>
>>>>>>>>>>> Regards
>>>>>>>>>>> Christian.
>>>>>>>>>>>
>>>>>>>>>>>> -Daniel
>>>>>>>>>>>>
>>>>>>>>>>>>> Christian.
>>>>>>>>>>>>>
>>>>>>>>>>>>>> Also improve the kerneldoc for this.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Acked-by: Steven Price <steven.price@arm.com> (v2)
>>>>>>>>>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>>>>>>>>>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>>>>>>>>>>>>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
>>>>>>>>>>>>>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>>>>>>>>>>>>>> Cc: Qiang Yu <yuq825@gmail.com>
>>>>>>>>>>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>>>>>>>>>>> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>>>>>>>>>>>>> Cc: Steven Price <steven.price@arm.com>
>>>>>>>>>>>>>> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>>>>>>>>>>>>> Cc: David Airlie <airlied@linux.ie>
>>>>>>>>>>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>>>>>>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>>>>>>>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>>>>>>>>>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>>>>>>>>>>>>> Cc: Kees Cook <keescook@chromium.org>
>>>>>>>>>>>>>> Cc: Adam Borowski <kilobyte@angband.pl>
>>>>>>>>>>>>>> Cc: Nick Terrell <terrelln@fb.com>
>>>>>>>>>>>>>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>>>>>>>>>>>>> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
>>>>>>>>>>>>>> Cc: Sami Tolvanen <samitolvanen@google.com>
>>>>>>>>>>>>>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>>>>>>>>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>>>>>>>>>> Cc: Dave Airlie <airlied@redhat.com>
>>>>>>>>>>>>>> Cc: Nirmoy Das <nirmoy.das@amd.com>
>>>>>>>>>>>>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
>>>>>>>>>>>>>> Cc: Lee Jones <lee.jones@linaro.org>
>>>>>>>>>>>>>> Cc: Kevin Wang <kevin1.wang@amd.com>
>>>>>>>>>>>>>> Cc: Chen Li <chenli@uniontech.com>
>>>>>>>>>>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>>>>>>>>>>>> Cc: "Marek Olšák" <marek.olsak@amd.com>
>>>>>>>>>>>>>> Cc: Dennis Li <Dennis.Li@amd.com>
>>>>>>>>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>>>>>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>>>>>>> Cc: Sonny Jiang <sonny.jiang@amd.com>
>>>>>>>>>>>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>>>>>>>>>> Cc: Tian Tao <tiantao6@hisilicon.com>
>>>>>>>>>>>>>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
>>>>>>>>>>>>>> Cc: etnaviv@lists.freedesktop.org
>>>>>>>>>>>>>> Cc: lima@lists.freedesktop.org
>>>>>>>>>>>>>> Cc: linux-media@vger.kernel.org
>>>>>>>>>>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>>>>>>>>>>> Cc: Emma Anholt <emma@anholt.net>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>         drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
>>>>>>>>>>>>>>         drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
>>>>>>>>>>>>>>         drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
>>>>>>>>>>>>>>         drivers/gpu/drm/lima/lima_sched.c        |  2 ++
>>>>>>>>>>>>>>         drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
>>>>>>>>>>>>>>         drivers/gpu/drm/scheduler/sched_entity.c |  6 ++--
>>>>>>>>>>>>>>         drivers/gpu/drm/scheduler/sched_fence.c  | 17 +++++----
>>>>>>>>>>>>>>         drivers/gpu/drm/scheduler/sched_main.c   | 46 +++++++++++++++++++++---
>>>>>>>>>>>>>>         drivers/gpu/drm/v3d/v3d_gem.c            |  2 ++
>>>>>>>>>>>>>>         include/drm/gpu_scheduler.h              |  7 +++-
>>>>>>>>>>>>>>         10 files changed, 74 insertions(+), 14 deletions(-)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>>>>>>>> index c5386d13eb4a..a4ec092af9a7 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>>>>>>>> @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>>>>>>>>>>>>>             if (r)
>>>>>>>>>>>>>>                     goto error_unlock;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>             /* No memory allocation is allowed while holding the notifier lock.
>>>>>>>>>>>>>>              * The lock is held until amdgpu_cs_submit is finished and fence is
>>>>>>>>>>>>>>              * added to BOs.
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>>>>>>>>> index d33e6d97cc89..5ddb955d2315 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>>>>>>>>> @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
>>>>>>>>>>>>>>             if (r)
>>>>>>>>>>>>>>                     return r;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>             *f = dma_fence_get(&job->base.s_fence->finished);
>>>>>>>>>>>>>>             amdgpu_job_free_resources(job);
>>>>>>>>>>>>>>             drm_sched_entity_push_job(&job->base, entity);
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>>>>>>>>> index feb6da1b6ceb..05f412204118 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>>>>>>>>> @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
>>>>>>>>>>>>>>             if (ret)
>>>>>>>>>>>>>>                     goto out_unlock;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> +     drm_sched_job_arm(&submit->sched_job);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>             submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
>>>>>>>>>>>>>>             submit->out_fence_id = idr_alloc_cyclic(&submit->gpu->fence_idr,
>>>>>>>>>>>>>>                                                     submit->out_fence, 0,
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>>>>>>>>>>>>> index dba8329937a3..38f755580507 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>>>>>>>>>>>>> @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *task,
>>>>>>>>>>>>>>                     return err;
>>>>>>>>>>>>>>             }
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> +     drm_sched_job_arm(&task->base);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>             task->num_bos = num_bos;
>>>>>>>>>>>>>>             task->vm = lima_vm_get(vm);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>>>>>>>>> index 71a72fb50e6b..2992dc85325f 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>>>>>>>>> @@ -288,6 +288,8 @@ int panfrost_job_push(struct panfrost_job *job)
>>>>>>>>>>>>>>                     goto unlock;
>>>>>>>>>>>>>>             }
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>             job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>             ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>>>>>> index 79554aa4dbb1..f7347c284886 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>>>>>> @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>>>>>>>>>>>>          * @sched_job: job to submit
>>>>>>>>>>>>>>          * @entity: scheduler entity
>>>>>>>>>>>>>>          *
>>>>>>>>>>>>>> - * Note: To guarantee that the order of insertion to queue matches
>>>>>>>>>>>>>> - * the job's fence sequence number this function should be
>>>>>>>>>>>>>> - * called with drm_sched_job_init under common lock.
>>>>>>>>>>>>>> + * Note: To guarantee that the order of insertion to queue matches the job's
>>>>>>>>>>>>>> + * fence sequence number this function should be called with drm_sched_job_arm()
>>>>>>>>>>>>>> + * under common lock.
>>>>>>>>>>>>>>          *
>>>>>>>>>>>>>>          * Returns 0 for success, negative error code otherwise.
>>>>>>>>>>>>>>          */
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>>>>>>>>> index 69de2c76731f..c451ee9a30d7 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>>>>>>>>> @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>>>>>>>>>>>>>>          *
>>>>>>>>>>>>>>          * Free up the fence memory after the RCU grace period.
>>>>>>>>>>>>>>          */
>>>>>>>>>>>>>> -static void drm_sched_fence_free(struct rcu_head *rcu)
>>>>>>>>>>>>>> +void drm_sched_fence_free(struct rcu_head *rcu)
>>>>>>>>>>>>>>         {
>>>>>>>>>>>>>>             struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
>>>>>>>>>>>>>>             struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>>>>>>>>>>>>> @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>>>>>>>>>>>>>         }
>>>>>>>>>>>>>>         EXPORT_SYMBOL(to_drm_sched_fence);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>>>>>>>>>>>>> -                                            void *owner)
>>>>>>>>>>>>>> +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>>>>>>>>>>>>> +                                           void *owner)
>>>>>>>>>>>>>>         {
>>>>>>>>>>>>>>             struct drm_sched_fence *fence = NULL;
>>>>>>>>>>>>>> -     unsigned seq;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>             fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
>>>>>>>>>>>>>>             if (fence == NULL)
>>>>>>>>>>>>>> @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>>>>>>>>>>>>>             fence->sched = entity->rq->sched;
>>>>>>>>>>>>>>             spin_lock_init(&fence->lock);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> +     return fence;
>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>>>>>>>>>>>> +                       struct drm_sched_entity *entity)
>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>> +     unsigned seq;
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>             seq = atomic_inc_return(&entity->fence_seq);
>>>>>>>>>>>>>>             dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>>>>>>>>>>>>>                            &fence->lock, entity->fence_context, seq);
>>>>>>>>>>>>>>             dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>>>>>>>>>>>>>                            &fence->lock, entity->fence_context + 1, seq);
>>>>>>>>>>>>>> -
>>>>>>>>>>>>>> -     return fence;
>>>>>>>>>>>>>>         }
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         module_init(drm_sched_fence_slab_init);
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>>>>> index 33c414d55fab..5e84e1500c32 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>>>>> @@ -48,9 +48,11 @@
>>>>>>>>>>>>>>         #include <linux/wait.h>
>>>>>>>>>>>>>>         #include <linux/sched.h>
>>>>>>>>>>>>>>         #include <linux/completion.h>
>>>>>>>>>>>>>> +#include <linux/dma-resv.h>
>>>>>>>>>>>>>>         #include <uapi/linux/sched/types.h>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         #include <drm/drm_print.h>
>>>>>>>>>>>>>> +#include <drm/drm_gem.h>
>>>>>>>>>>>>>>         #include <drm/gpu_scheduler.h>
>>>>>>>>>>>>>>         #include <drm/spsc_queue.h>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> @@ -569,7 +571,6 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         /**
>>>>>>>>>>>>>>          * drm_sched_job_init - init a scheduler job
>>>>>>>>>>>>>> - *
>>>>>>>>>>>>>>          * @job: scheduler job to init
>>>>>>>>>>>>>>          * @entity: scheduler entity to use
>>>>>>>>>>>>>>          * @owner: job owner for debugging
>>>>>>>>>>>>>> @@ -577,6 +578,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>>>>>>>>>>>>>>          * Refer to drm_sched_entity_push_job() documentation
>>>>>>>>>>>>>>          * for locking considerations.
>>>>>>>>>>>>>>          *
>>>>>>>>>>>>>> + * Drivers must make sure drm_sched_job_cleanup() if this function returns
>>>>>>>>>>>>>> + * successfully, even when @job is aborted before drm_sched_job_arm() is called.
>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>          * Returns 0 for success, negative error code otherwise.
>>>>>>>>>>>>>>          */
>>>>>>>>>>>>>>         int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>>>>>>>> @@ -594,7 +598,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>>>>>>>>             job->sched = sched;
>>>>>>>>>>>>>>             job->entity = entity;
>>>>>>>>>>>>>>             job->s_priority = entity->rq - sched->sched_rq;
>>>>>>>>>>>>>> -     job->s_fence = drm_sched_fence_create(entity, owner);
>>>>>>>>>>>>>> +     job->s_fence = drm_sched_fence_alloc(entity, owner);
>>>>>>>>>>>>>>             if (!job->s_fence)
>>>>>>>>>>>>>>                     return -ENOMEM;
>>>>>>>>>>>>>>             job->id = atomic64_inc_return(&sched->job_id_count);
>>>>>>>>>>>>>> @@ -606,13 +610,47 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>>>>>>>>         EXPORT_SYMBOL(drm_sched_job_init);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         /**
>>>>>>>>>>>>>> - * drm_sched_job_cleanup - clean up scheduler job resources
>>>>>>>>>>>>>> + * drm_sched_job_arm - arm a scheduler job for execution
>>>>>>>>>>>>>> + * @job: scheduler job to arm
>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>> + * This arms a scheduler job for execution. Specifically it initializes the
>>>>>>>>>>>>>> + * &drm_sched_job.s_fence of @job, so that it can be attached to struct dma_resv
>>>>>>>>>>>>>> + * or other places that need to track the completion of this job.
>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>> + * Refer to drm_sched_entity_push_job() documentation for locking
>>>>>>>>>>>>>> + * considerations.
>>>>>>>>>>>>>>          *
>>>>>>>>>>>>>> + * This can only be called if drm_sched_job_init() succeeded.
>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>> +void drm_sched_job_arm(struct drm_sched_job *job)
>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>> +     drm_sched_fence_init(job->s_fence, job->entity);
>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>> +EXPORT_SYMBOL(drm_sched_job_arm);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +/**
>>>>>>>>>>>>>> + * drm_sched_job_cleanup - clean up scheduler job resources
>>>>>>>>>>>>>>          * @job: scheduler job to clean up
>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>> + * Cleans up the resources allocated with drm_sched_job_init().
>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>> + * Drivers should call this from their error unwind code if @job is aborted
>>>>>>>>>>>>>> + * before drm_sched_job_arm() is called.
>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>> + * After that point of no return @job is committed to be executed by the
>>>>>>>>>>>>>> + * scheduler, and this function should be called from the
>>>>>>>>>>>>>> + * &drm_sched_backend_ops.free_job callback.
>>>>>>>>>>>>>>          */
>>>>>>>>>>>>>>         void drm_sched_job_cleanup(struct drm_sched_job *job)
>>>>>>>>>>>>>>         {
>>>>>>>>>>>>>> -     dma_fence_put(&job->s_fence->finished);
>>>>>>>>>>>>>> +     if (!kref_read(&job->s_fence->finished.refcount)) {
>>>>>>>>>>>>>> +             /* drm_sched_job_arm() has been called */
>>>>>>>>>>>>>> +             dma_fence_put(&job->s_fence->finished);
>>>>>>>>>>>>>> +     } else {
>>>>>>>>>>>>>> +             /* aborted job before committing to run it */
>>>>>>>>>>>>>> +             drm_sched_fence_free(&job->s_fence->finished.rcu);
>>>>>>>>>>>>>> +     }
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>             job->s_fence = NULL;
>>>>>>>>>>>>>>         }
>>>>>>>>>>>>>>         EXPORT_SYMBOL(drm_sched_job_cleanup);
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
>>>>>>>>>>>>>> index 4eb354226972..5c3a99027ecd 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>>>>>>>>>>>>>> @@ -475,6 +475,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
>>>>>>>>>>>>>>             if (ret)
>>>>>>>>>>>>>>                     return ret;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>             job->done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>             /* put by scheduler job completion */
>>>>>>>>>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>>>>>>>>>>> index 88ae7f331bb1..83afc3aa8e2f 100644
>>>>>>>>>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>>>>>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>>>>>>>>>> @@ -348,6 +348,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>>>>>>>>>>>>>         int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>>>>>>>>                            struct drm_sched_entity *entity,
>>>>>>>>>>>>>>                            void *owner);
>>>>>>>>>>>>>> +void drm_sched_job_arm(struct drm_sched_job *job);
>>>>>>>>>>>>>>         void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>>>>>>>>>>>>                                         struct drm_gpu_scheduler **sched_list,
>>>>>>>>>>>>>>                                            unsigned int num_sched_list);
>>>>>>>>>>>>>> @@ -387,8 +388,12 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>>>>>>>>>>>>>                                        enum drm_sched_priority priority);
>>>>>>>>>>>>>>         bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -struct drm_sched_fence *drm_sched_fence_create(
>>>>>>>>>>>>>> +struct drm_sched_fence *drm_sched_fence_alloc(
>>>>>>>>>>>>>>             struct drm_sched_entity *s_entity, void *owner);
>>>>>>>>>>>>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>>>>>>>>>>>> +                       struct drm_sched_entity *entity);
>>>>>>>>>>>>>> +void drm_sched_fence_free(struct rcu_head *rcu);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>         void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>>>>>>>>>>>>>>         void drm_sched_fence_finished(struct drm_sched_fence *fence);
>>>>>>>>>>>>>>
>>>>>> --
>>>>>> Daniel Vetter
>>>>>> Software Engineer, Intel Corporation
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C9ff11edafb334411dbf508d942026d53%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637613400464979063%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=MMhNTs1WSu%2B07ho3MOap4fbbpAh2vkCd0IJ0snpYvYo%3D&amp;reserved=0
>>>>> --
>>>>> Daniel Vetter
>>>>> Software Engineer, Intel Corporation
>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C9ff11edafb334411dbf508d942026d53%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637613400464979063%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=MMhNTs1WSu%2B07ho3MOap4fbbpAh2vkCd0IJ0snpYvYo%3D&amp;reserved=0
>

