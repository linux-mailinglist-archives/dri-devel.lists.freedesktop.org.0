Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7CC3B34CB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 19:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137FE6EC6C;
	Thu, 24 Jun 2021 17:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299A26EC6C;
 Thu, 24 Jun 2021 17:30:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWszqQlXYZ7WngzsJnL+A7rsPEaJtZevsVxAhDZTi8A1mtEYfoHlN4tyqPVpjjvb74gHZ8fcmrJGVBEPAMbMOfjIhRZI42Tq/D1HrOKMaozf5LGiw3PRQnZbi/riAKIKe2QXqXdE/3tBgo+fvSCV2a5PHjZc+IOQB6K58npD1UdXFwi2VmHdofIiJglHJj4XSAOQhNsdBSm7FIgbVzzmN0KgmOrHesP+5LL09BOkG7NfsSWGxroSGVZOQ9tYUDYZnAus8D+NuHa5vuWQN0zVmJnQNMogxdtVSLeG3z+k9QwG5XjgrKKhLRqcMYTov/TjYDx/x8yxI48NnzWuUB5I8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IptjvwAyP4LOYa6JWdZeN9nEKeWZTi/B2gsgUWphPcw=;
 b=NLiWL5KxcNP1wtjerCxfj0ZRggs+3q/JSx5cC1r7QRVgt7BrVN5EDXDlF5DZe8XabkZEHLZqGQNiujzhjJQLu0+J17ECLRQX5vs3HEH6+59BukkA2oxovxxuW2mxRY6CET5A5zTZ6vx//NAE57/y/SR9aL+0UOm+uVB7gxH++wIJInS+nKBjCg+ELBrZtefQ85euBnfPMoVd65eIXAhh02lnjFAdc3sWrLktq9gyCKwHFzuEK8U7oKj2UWqXHFFPd7HFDLFlRjaySH6WkhRdkRmaAFI7t6rljNvFTmGOLTZsHeBggE/3/BTh2M0c9JO7/KEJEwOB6ZyDpj0PBAIG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IptjvwAyP4LOYa6JWdZeN9nEKeWZTi/B2gsgUWphPcw=;
 b=GXz9jJKLE3mP5Ks/sDqVzBg/zy8dI9MbrtI257nFzq4pnH8caMaPzBSVcywQV060STldwaBrxtAtxttzRxJUstkP7ngDPjtpGVdPHtlweSQMS/vJ+uQYKxNdmb6qobIabvArwh7NY8xyhWFgAFfVt5oy6hAPH6BGFhcmbUu6pdM=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4440.namprd12.prod.outlook.com (2603:10b6:208:26e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 17:30:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 17:30:05 +0000
Subject: Re: [PATCH 01/11] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-2-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <834f5d78-9052-8e7a-fd34-c5b4f37857cf@amd.com>
Date: Thu, 24 Jun 2021 19:29:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624140025.438303-2-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c089:94ee:b4ef:e121]
X-ClientProxiedBy: PR0P264CA0195.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c089:94ee:b4ef:e121]
 (2a02:908:1252:fb60:c089:94ee:b4ef:e121) by
 PR0P264CA0195.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 17:30:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02379eb7-8744-4dc3-ab65-08d93735b460
X-MS-TrafficTypeDiagnostic: MN2PR12MB4440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4440FC0231EB04CE4C1E3B2583079@MN2PR12MB4440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QQcwwNyBm1lz+lAP+9TbEAB0LbxgRG2uY3vcW2uRLR37dO71kNC/e/r5Z55Cx8C4gxmYlnfiCBj5T7xNY8dQZP7idQu+FszRArZz/HdGLDPmrFT96R9OllA+GE2JJl8kz3Cgl6jNXojloGInHXuWikILLrNP2t/A6vqJEItnAAdPhd+zEcCCMItI2QOXUXabVR6LyekmJ73fWjMqpT5r+7xKXdX3g4Hsjq/WJJFDlZpIAJA7gojDL6ElAWMl8MIV0Ys9bprfQjpRIsuHmCKm4b30z+2H/0/s+wniV72Co+9qhUmm5DpGbGS7fkv/88qqCSFtCTAWMGdKw/NvjceKj9NT7qMB3sejjSFCRSyMKFzbAM/cPESD16vz3XsmDoKPfh6PO1PyOdB3YGfOQs0i/H6APxYpacC13tvdVneSSxAobJr/sOUsg4J8f7zQJ0vgPDXaR5RRVF4T2hsWKUj3/5GEzVIHjsxlvqCdeH9kF/8WB3gBGxe5nwOBTO8PPVgIzmzYwWSgNqwn2XK4Niru+PSQNCRQbXCwH5+YL5BlE74pd6ZFCmvAIkG4Su/gp9QC+p+Yv5o9/s5raWkYFB98G/noBIH1Ws3b6ePYoJA36C12Q938Daf/idCCEiISuSwH4qIVpO+SnDZkJmbTfNU9Fgm5N3S4C+Tv/fj0HuKJFXwQF8EtTLbuNf1Jg6tbXcPi4MihVPcz2q60KOrzApayrQBMDVR7+NbzWR+Kg5xSfig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(5660300002)(8936002)(6666004)(8676002)(30864003)(83380400001)(66574015)(66476007)(6486002)(36756003)(2906002)(16526019)(478600001)(86362001)(186003)(4326008)(31686004)(31696002)(38100700002)(7416002)(7406005)(316002)(110136005)(54906003)(2616005)(66556008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTdFeWd6WEtvc3BydkZGMzBHUHZXbjJqQVJldDdyWmVueFlmcVR2TVA0YURi?=
 =?utf-8?B?VWlISmV3YjhsaWxncFFGWXJPbURrcGZPU25EaEJESFhybzFBRVZ3NmRxYVkv?=
 =?utf-8?B?TndHNXZCVnZSSlEwUitCWDdpTW91YUNDaTZBVEh3eVVqUXFTVlFxcVc5TDBF?=
 =?utf-8?B?MDYrbC80c0ZmMWkvTTBka1l2a3VEWFFzWDBQNnNwQkhSMW00c0NROVJuMkNV?=
 =?utf-8?B?a3Q2SGo3OWhQNVVHbkZyMyt1dTBJdWM1NmdlNHAwTS9hUDVpcVVNQk84NXAw?=
 =?utf-8?B?aW9hVUVZZjF1Q0dpcmFKS09hT1ErZGloMWxEa1hyazFPZDczYW1UNFZWS2pQ?=
 =?utf-8?B?M0lqNHdrQVdRUFJPc3lVV1I3WlVGTFoxZ2YxNlFiMWUyWDl6bDFaZFhpeTVW?=
 =?utf-8?B?NDZZS2gxKzFtLzhPcytDdGkrUWNUZ3ZRdGdEdm5zY2tLRzVkK1RMY1l1MVRK?=
 =?utf-8?B?NTdmUWk5UjJHV2lHcjRicDY0V2dLY0lZWVQwUTdYUFJmdkM4V2lnM0R4OXhu?=
 =?utf-8?B?d2lybmRiNTdZLyt1TEtDd2NLR2Mvai8xWjdrVEdqV0tYT3JremtWejNzUUpX?=
 =?utf-8?B?V1BCc0RaZmtHeHpKWWJFZndJR2lPUUJ6MGkrWmJIR0hGblVtdUJhOHJCZG8w?=
 =?utf-8?B?Tkx1UjltNUVmK2hKRFdBTGd4YmhaRVhwdHBtcmZwV3FqVzBqRXNmdVFyN3Qx?=
 =?utf-8?B?Q3Axc1ZibUpmODRNWTJ4amIvU3R1T0hTSHF5Kzk0Rlh0T0Y4MDlUbE5uMFhM?=
 =?utf-8?B?WTBac0tCTHZPV3JkUktRMGVqcXVUODNCU3kvRWxLRDJncTBka2pHaGJSUm9q?=
 =?utf-8?B?TmRTdGRZRnF0N2VQU3pmTnBQZVFwRk5WTFhIVlllWHhvcTZkK1BEYlBYN3ZG?=
 =?utf-8?B?SVZMV0thaCs1MWJXTExEbWRoQ2V3Vk9aNTJkYzZqVjUzN2haMGg5aHV0RGdO?=
 =?utf-8?B?MjZZVDVZM0NuZS9Hd0tGU0tJWU9rK3lLYUlhakhlcERRcmZFTk1GeFc3ZFJn?=
 =?utf-8?B?d1MyMU8rNVp5b29SOU9WNjdzL2djL0k4SnhUcm5mZ3pOTkVQSEcwaVNTNVdw?=
 =?utf-8?B?dGhVV01uMEJNbTdnRHZZY2JtZkhobUFVQXVrY241bGZZbHNvRXpZMTMrc3RS?=
 =?utf-8?B?bG9Rd2VOZGc1WkR2R2tFQTYyZGZQTGFlOTUwNElDcUViWktVckxNSUJxQXl2?=
 =?utf-8?B?Z1FDNExFTngrUjExbkhheU1iYk0rWHFEaStrNVBMTlViY1V6a01kd3A2cEtZ?=
 =?utf-8?B?dFQ4ODRxb3BkZHJCa01KZ3JTMlllNmlYUjFSeGdoeE1YWDRNMkgxdEl3MGR6?=
 =?utf-8?B?U3doc3JWRGUyK2RtbGZBNEgySmZFdENkSTEyWHR1N05FeFhMRVdlbVdkUWx5?=
 =?utf-8?B?b1hJU2lVRjNZY2lFVUFMdmkzeGs4d09CZlV5NXk4aDBnUDQ1VVNJRTN3ZHR4?=
 =?utf-8?B?cHRxdWlGWXU5U2czbFFFQ3pZbW5BMDRRZzdzU04vN0syWUh2b0VnQlA5YUZv?=
 =?utf-8?B?bHFoWWNQQkJuVEdGVjl2OG1sblhMU1NCbGd0UEM5ekVxYjNTQ3JnQmNlZUlY?=
 =?utf-8?B?b21xQzRMTlV5bGJEVmt5czJCRDB3L3U0bW9oMkxVdFNPZEVzcHpheW10QUZ3?=
 =?utf-8?B?WnIzSExwdTNabkFtYXJtc1g5V1g4WTRPWFg5eUJUeVVQdE1tdjJvS3VFOUlJ?=
 =?utf-8?B?R1hhUTV5amhuRFBSUkZBOEdWdzRCckZ2VnRpcXZLR1JRcjd5T0RaWWNwVG9G?=
 =?utf-8?B?SjM5TUhyNEpDd2IzdExUQ21qdm91MnkyWDRxeHJjMmVpNzZGSmZQRWNVZk5j?=
 =?utf-8?B?UWNuL3RQWm8zQ09CUHB3RndzT05tVFdjRDE5U3F5OHl0OW1rcGU0Y2Y2blgr?=
 =?utf-8?Q?E2kEzEYl2Wd+z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02379eb7-8744-4dc3-ab65-08d93735b460
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 17:30:05.2622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2HbGBuzP9JptYReDcG48C3FZ0Je9oZEGoEniIX/nQUWTZF82jhha9jZXspawBZc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4440
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
Cc: Adam Borowski <kilobyte@angband.pl>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sonny Jiang <sonny.jiang@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Lee Jones <lee.jones@linaro.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 lima@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Nick Terrell <terrelln@fb.com>,
 Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.06.21 um 16:00 schrieb Daniel Vetter:
> This is a very confusingly named function, because not just does it
> init an object, it arms it and provides a point of no return for
> pushing a job into the scheduler. It would be nice if that's a bit
> clearer in the interface.

We originally had that in the push_job interface, but moved that to init 
for some reason I don't remember.

> But the real reason is that I want to push the dependency tracking
> helpers into the scheduler code, and that means drm_sched_job_init
> must be called a lot earlier, without arming the job.

I'm really questioning myself if I like that naming.

What about using drm_sched_job_add_dependency instead?

Christian.

>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Adam Borowski <kilobyte@angband.pl>
> Cc: Nick Terrell <terrelln@fb.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Nirmoy Das <nirmoy.das@amd.com>
> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: Chen Li <chenli@uniontech.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: "Marek Olšák" <marek.olsak@amd.com>
> Cc: Dennis Li <Dennis.Li@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Sonny Jiang <sonny.jiang@amd.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> Cc: etnaviv@lists.freedesktop.org
> Cc: lima@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>   .gitignore                               |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
>   drivers/gpu/drm/lima/lima_sched.c        |  2 ++
>   drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
>   drivers/gpu/drm/scheduler/sched_entity.c |  6 +++---
>   drivers/gpu/drm/scheduler/sched_fence.c  | 15 ++++++++++-----
>   drivers/gpu/drm/scheduler/sched_main.c   | 23 ++++++++++++++++++++++-
>   include/drm/gpu_scheduler.h              |  6 +++++-
>   10 files changed, 51 insertions(+), 10 deletions(-)
>
> diff --git a/.gitignore b/.gitignore
> index 7afd412dadd2..52433a930299 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -66,6 +66,7 @@ modules.order
>   /modules.builtin
>   /modules.builtin.modinfo
>   /modules.nsdeps
> +*.builtin
>   
>   #
>   # RPM spec file (make rpm-pkg)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index c5386d13eb4a..a4ec092af9a7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>   	if (r)
>   		goto error_unlock;
>   
> +	drm_sched_job_arm(&job->base);
> +
>   	/* No memory allocation is allowed while holding the notifier lock.
>   	 * The lock is held until amdgpu_cs_submit is finished and fence is
>   	 * added to BOs.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index d33e6d97cc89..5ddb955d2315 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
>   	if (r)
>   		return r;
>   
> +	drm_sched_job_arm(&job->base);
> +
>   	*f = dma_fence_get(&job->base.s_fence->finished);
>   	amdgpu_job_free_resources(job);
>   	drm_sched_entity_push_job(&job->base, entity);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 19826e504efc..af1671f01c7f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
>   	if (ret)
>   		goto out_unlock;
>   
> +	drm_sched_job_arm(&submit->sched_job);
> +
>   	submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
>   	submit->out_fence_id = idr_alloc_cyclic(&submit->gpu->fence_idr,
>   						submit->out_fence, 0,
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index ecf3267334ff..bd1af1fd8c0f 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *task,
>   		return err;
>   	}
>   
> +	drm_sched_job_arm(&task->base);
> +
>   	task->num_bos = num_bos;
>   	task->vm = lima_vm_get(vm);
>   
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index beb62c8fc851..1e950534b9b0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -244,6 +244,8 @@ int panfrost_job_push(struct panfrost_job *job)
>   		goto unlock;
>   	}
>   
> +	drm_sched_job_arm(&job->base);
> +
>   	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>   
>   	ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 79554aa4dbb1..f7347c284886 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>    * @sched_job: job to submit
>    * @entity: scheduler entity
>    *
> - * Note: To guarantee that the order of insertion to queue matches
> - * the job's fence sequence number this function should be
> - * called with drm_sched_job_init under common lock.
> + * Note: To guarantee that the order of insertion to queue matches the job's
> + * fence sequence number this function should be called with drm_sched_job_arm()
> + * under common lock.
>    *
>    * Returns 0 for success, negative error code otherwise.
>    */
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 69de2c76731f..0ba810c198bd 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>   }
>   EXPORT_SYMBOL(to_drm_sched_fence);
>   
> -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
> -					       void *owner)
> +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
> +					      void *owner)
>   {
>   	struct drm_sched_fence *fence = NULL;
> -	unsigned seq;
>   
>   	fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
>   	if (fence == NULL)
> @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>   	fence->sched = entity->rq->sched;
>   	spin_lock_init(&fence->lock);
>   
> +	return fence;
> +}
> +
> +void drm_sched_fence_init(struct drm_sched_fence *fence,
> +			  struct drm_sched_entity *entity)
> +{
> +	unsigned seq;
> +
>   	seq = atomic_inc_return(&entity->fence_seq);
>   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>   		       &fence->lock, entity->fence_context, seq);
>   	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>   		       &fence->lock, entity->fence_context + 1, seq);
> -
> -	return fence;
>   }
>   
>   module_init(drm_sched_fence_slab_init);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 61420a9c1021..70eefed17e06 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -48,9 +48,11 @@
>   #include <linux/wait.h>
>   #include <linux/sched.h>
>   #include <linux/completion.h>
> +#include <linux/dma-resv.h>
>   #include <uapi/linux/sched/types.h>
>   
>   #include <drm/drm_print.h>
> +#include <drm/drm_gem.h>
>   #include <drm/gpu_scheduler.h>
>   #include <drm/spsc_queue.h>
>   
> @@ -594,7 +596,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   	job->sched = sched;
>   	job->entity = entity;
>   	job->s_priority = entity->rq - sched->sched_rq;
> -	job->s_fence = drm_sched_fence_create(entity, owner);
> +	job->s_fence = drm_sched_fence_alloc(entity, owner);
>   	if (!job->s_fence)
>   		return -ENOMEM;
>   	job->id = atomic64_inc_return(&sched->job_id_count);
> @@ -605,6 +607,25 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   }
>   EXPORT_SYMBOL(drm_sched_job_init);
>   
> +/**
> + * drm_sched_job_arm - arm a scheduler job for execution
> + * @job: scheduler job to arm
> + *
> + * This arms a scheduler job for execution. Specifically it initializes the
> + * &drm_sched_job.s_fence of @job, so that it can be attached to struct dma_resv
> + * or other places that need to track the completion of this job.
> + *
> + * Refer to drm_sched_entity_push_job() documentation for locking
> + * considerations.
> + *
> + * This can only be called if drm_sched_job_init() succeeded.
> + */
> +void drm_sched_job_arm(struct drm_sched_job *job)
> +{
> +	drm_sched_fence_init(job->s_fence, job->entity);
> +}
> +EXPORT_SYMBOL(drm_sched_job_arm);
> +
>   /**
>    * drm_sched_job_cleanup - clean up scheduler job resources
>    *
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index d18af49fd009..80438d126c9d 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -313,6 +313,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
>   int drm_sched_job_init(struct drm_sched_job *job,
>   		       struct drm_sched_entity *entity,
>   		       void *owner);
> +void drm_sched_job_arm(struct drm_sched_job *job);
>   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>   				    struct drm_gpu_scheduler **sched_list,
>                                      unsigned int num_sched_list);
> @@ -352,8 +353,11 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>   				   enum drm_sched_priority priority);
>   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>   
> -struct drm_sched_fence *drm_sched_fence_create(
> +struct drm_sched_fence *drm_sched_fence_alloc(
>   	struct drm_sched_entity *s_entity, void *owner);
> +void drm_sched_fence_init(struct drm_sched_fence *fence,
> +			  struct drm_sched_entity *entity);
> +
>   void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>   void drm_sched_fence_finished(struct drm_sched_fence *fence);
>   

