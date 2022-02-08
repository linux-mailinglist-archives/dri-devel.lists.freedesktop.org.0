Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FA54AD21D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 08:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAC510E370;
	Tue,  8 Feb 2022 07:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DFE10E370;
 Tue,  8 Feb 2022 07:21:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0Gkk1fENmBXlAltTR3hCHMgeB3RJMNhn+k9iUS9dYzXOQb/oBMEKayAtFeqMTMw3KQTFgjui7aHaSxg8KtojH5zPSoch6TtwVpCpdSY6+i/uLumRt/ozo7BDL0QLhObJUJOWS3vxnuzvvDpiHJPy0lWotlN+9WkJNWgH3eyBSI0r3wSE8PlqG+WND7clgBjeosj4S94HfDTqGqrofYI9r/9CL5BOVcuI1sbn1YAULa0cNFlRoMdXiF7hVbLMGZMjIfgKZu04FUIefVtZBEw6wmTD7f8oprg87irRwgJXOwxCp6MyZno6jIBXw4grxj2Hl4bWQPGvJxOuX4ImlELZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsS57SeoGSh88S250Y6HuJ6Ji7xpmL9iKfdvVhR62P0=;
 b=hTGZZpktE9bo+qibx7YvbvKOmIeR1bUgiDHDlw9VnF5E6tcpI9DW/JPkO1wlEK3x5i4Q+PdLyIXiaTO+g7gF2T7Zxf5p8PGfhHAjxaM4HH1VH2tu8NR/lUdgNaWurOQVhcnSs8xWdr08XnlpGsCuizbYeyVccnu14xDLzK37H//jZelFEIp5Tw1i5TwlZeq6l7/iADEX9ZVnbrsMQ9E5eGXOuUHNvp0dTx7PmuVEyx899460CqwH6N75zyPlBXXE9xgKZBq+mLiOk0NqajeNv44tb3EiMN5qxwdAi3w2+B20rMr+18Mo8XQEC8rzkca12+u1cmt4jv706awQ4IKqYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsS57SeoGSh88S250Y6HuJ6Ji7xpmL9iKfdvVhR62P0=;
 b=wZKNMwJyXDG1qYv9uEJTJTAerJMsh8vmRhIxGqJBpsoTBdsNIy/2kB4nXsmYgIGs2MYJgUEWzH414fwdgwzfi/srIurSpoCnIPF4hC9BU7M/Cs8jSjC54OqgZHbF+ngHIJDensnLaihO91DCgBeAwWCJi9LvoTbhJp1qAguYaU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4571.namprd12.prod.outlook.com (2603:10b6:303:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Tue, 8 Feb
 2022 07:21:58 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:21:57 +0000
Message-ID: <5fb99532-fd59-3a16-a543-4a01ae0e0407@amd.com>
Date: Tue, 8 Feb 2022 08:21:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/3] drm: Extract amdgpu_sa.c as a generic
 suballocation helper
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20220204174809.3366967-1-maarten.lankhorst@linux.intel.com>
 <20220204174809.3366967-2-maarten.lankhorst@linux.intel.com>
 <28be9b4b-dbe1-28fa-e013-570c45a5c705@amd.com>
 <7b33c013-354d-ed46-9c7e-00690ec02bd0@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <7b33c013-354d-ed46-9c7e-00690ec02bd0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0343.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::26) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6082abcc-cbd5-4b15-3d6d-08d9ead3b0c5
X-MS-TrafficTypeDiagnostic: MW3PR12MB4571:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB457135C82958C13FF82F322A832D9@MW3PR12MB4571.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5AR28jvfPFUYClpO/Vgc/iJgl2JL+BCGQ4xXBRVv2Wu2TIgXf4y4GHvhiDXPgK1j9RfacypMUvAcXzS8FIbsY4HbiULqamfF/AHq2AGqA+aljNgXfZhvWObpSzEG7LfsuXt2rZjuWudolaxEA3d2iD8r/pBSuGk2044Aw5WeOYzYdR6i9kpEJMEYhivLHcThrFAj2NnTwMWwnFIzaR2S+50XU37SmwLaT9iDn0CH0KkjPC83WjE1R9k4hHTesMTKk2Vo4XgTYQrayj/5Fyfhh3TuFnWUOY7d6nHOkDijdZiLdGUNsnD5jQJs3HBAEc8wL3pCy6+SmSln5qc+CemSsQKBllOihH/sv97oQst5eUm5CWyy3/T14UKrVwPyzY9qXcR6JNX7QI+eZrtaPOFFYeWvdatQqmCrhrdGJFG6k0VkK4yWFr11o9PW0+E03raDBmdi7fj4t+2L15gzOnVE32PIdQZAdfSAs5FPaKOxX012mGxPsVkcdJGjheN79F4uLFFY56Yc1+EoxJMzvg8D/pQzLVNezShPGSMreesxjVK9koKFLw3FqpCK5kf9xn1Zd5D2tQKLzEo7OjSQX/NZ5uMvTa3nbxkWtRjHESS+XaVVG/3AcLCwfiihF5ILdsZDUPsJUfUjpBWFQMB6PlZ37DIpSnnkx+XvdfffSbj+Mq5AB5kzh/V6H5+iEUgMO3XNPFn/+Bcbi0W/BahxIpNTnAFnWWKwRyNQtYWFnWyJdGaNV/RiJW0iz54fgxXb937d6gjkNiB/A73DbuqiiXymWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(83380400001)(4326008)(36756003)(31686004)(186003)(2906002)(5660300002)(38100700002)(86362001)(6506007)(508600001)(66946007)(110136005)(2616005)(6636002)(6666004)(6512007)(8936002)(66476007)(66556008)(316002)(31696002)(8676002)(6486002)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUFCcUltMGhtUStISUs2b0tHdTQ2alk4d0VuNnlQbTdnbHNHRXlRdjhlZllK?=
 =?utf-8?B?aTh4ZndORExkanN1QzhrWng3R2drblc4YlozcitLMGdEQzhZMEJHNitodjRh?=
 =?utf-8?B?RXlpTWVyYlRnMldDb1JiVHZOSjBSbFNCT0pDQmw1TGJvbm95eGRwejlTQVhr?=
 =?utf-8?B?ci85NkN1Tzl5TFVjOTdBdy83ZTZhZlpFekU4NFpNcGpweTl6MnpOVm00dm9L?=
 =?utf-8?B?TVJKOVJXdmx6dTZ2ZjlrRTlHOWtKelh6eWpTMFM1c0ZYUmZCc1pDQkk2aEFP?=
 =?utf-8?B?ejMzbmVIbW0wZjRQcTdCSmtNWVJSYnpiellVRnNLbHRMQ0tNb1BVUkJORGtj?=
 =?utf-8?B?NkFQbEIvSEFQQVFyZWhBSzV4V1czeHpyMmJ2QlVqNkdxUENmclg0MG04MlBy?=
 =?utf-8?B?Lzh3c3NUMHZSVGx3S0J2RmEySVludUIrSnVYN2wxazhaekUyQ3Ywby9PRjla?=
 =?utf-8?B?a0xwMHl2Q0pnWGFtSWl4TzAwalpyUkZ4VzJuUUYxSnJReGNZWWlyR2F2OWpX?=
 =?utf-8?B?aGlZT1Q2TnM0cjA0WlptS1Mxb1FVMk0wR0lPVW1HUW83c3pHRm1LVk5QQjFZ?=
 =?utf-8?B?KzBwUVIxcGkxelRrV2NpYzdKcmtwTncvQjZlVXMyMDJKYWdMZFRFdDhoSzJB?=
 =?utf-8?B?cGFhcUhvMG5IMmZzdEJaL2dyc1N0a1dSazNCcnk3WTNVNGV0S0UvRFVadSsr?=
 =?utf-8?B?dVFvMHIxRXVRT1FwcEhBMktiWFNoVDZhL0hCcFYydW01TGowRENVdmZ0SE4y?=
 =?utf-8?B?ZU5ud0VjVmMxT0t2MUxHbFUwaG1kNmp4TFdzUEhGalo5eU9sTXFLZzZDLzBw?=
 =?utf-8?B?SHZSaEUxUnBFeFcyeGxjVXY0RFNhVGkwa2owMW55bDB4bkIzNUJsZkxyVzha?=
 =?utf-8?B?bEN0ays2REpEN3NlY3pnUkFlRlFyYXQrYUxRd1NLSmJHclJrOGJiN3FmVW1q?=
 =?utf-8?B?SGVESENQTElPNnhoUUd3WEdEdkxtQXB0dGc0S0I4Q2JiaVpaM3o1aWpubm9J?=
 =?utf-8?B?UXdlS1pRQU84MC94SjAwTm5aa3J4N25jZnROdk40K3RsVUxSeDBpKytFZDJr?=
 =?utf-8?B?NUlIN2lhZm5KZ3lYNE1YVE5JSEcrWUkxckF4VE16bUJoMDdYVTVrNk9NcjIy?=
 =?utf-8?B?UERWY0hVTk9WMHh2QzExemp3Nld3clZsVCtyaXBqc0NlTDNoL3UwZzJEdkt5?=
 =?utf-8?B?ZWhHUFUyeTM1V3pqcDBndUd4WEV4aldJVHdIczFucUhmdHRJRnA0VlZDUCtC?=
 =?utf-8?B?QTYwbUhKdFgzMm5Fd1VVVytaTjdNLytpZWVBTlFXcFBESzd4c2Jnc2x3WDAw?=
 =?utf-8?B?bDNPenFBcC9CUDlRc291RWdKMmZkcEJyMVVKOHZ6QTdyMXNKWldTMG1oVTNG?=
 =?utf-8?B?WkpTazJocnFvVG1DQ3l3SG02dmRNR2tROEREb2p3TU81eVpiL3ovcXFHS2FR?=
 =?utf-8?B?QlJYV2EyWDdpTXpXNmg3elR0RWx5Rzl0OVAyMjhNWG9Bbzg4dEFqUysvbXBs?=
 =?utf-8?B?U0s0ODI2ZTRrY05YaGUvNGpOdFVpLzQ1ZmdhS0Jwalh5QVBUZmFwMUpQMVpI?=
 =?utf-8?B?MndDYUdSYUMyR0xvK092SjVWU2hJQ0w2c1NkbzdLcmJUMWo0S0V2RGNndDh2?=
 =?utf-8?B?cTkrbk5PNFpMRGlIa0NUb05MWnFnYm1rZ2dsaWl2N2VYeUZsV2dEUFE1b21H?=
 =?utf-8?B?WGdyQk85eEprb1lQU0NNSHRPSlFXRmhSckNNdzVtNTlJK1JJbWhBbXM4VjRH?=
 =?utf-8?B?YmRZWHZ4Z1pQMmw4MFhqakMzc0Q2dmduSXFiNGRKbmNKOWM2Q1JUWmdxQXo3?=
 =?utf-8?B?NXJjeStkTk9lSEJXejVsZnZNcDg2ZzgwcVhaSjZIdmxCUDRyY1crV0NSNXRx?=
 =?utf-8?B?VkEvMHBQSnpHRTlOcjh3Rmx2SkxZRzRFUTA5SWNFNGh1VXNnSlhWRkVKUWlq?=
 =?utf-8?B?d2pPeWpRVis0aHB4WGpTZG9IMXBEbkpHcVdpdkUxdVdIODZaK0hkU3dKY2xS?=
 =?utf-8?B?c0hyUTNkd1lEVmJFZERLM1ZFVWtseU1rZlhCRWozUENkNS9UMmVsS0UvSVY2?=
 =?utf-8?B?UlhNdW5GYUpvZExxbXNDRHRkS3RMZHVFV2Z5VFAwUUJ4a25iMVQrLzJMcUxB?=
 =?utf-8?B?OXpBRi96T1NEdUluVnlMdXpVV3crR0NDT05GL1N0WHgycFM2YS9XckhqeUFq?=
 =?utf-8?Q?1J2A9GHcmPtxUcW9uYyrTrk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6082abcc-cbd5-4b15-3d6d-08d9ead3b0c5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 07:21:57.7476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6SvUunon33gTntuZQCscfKYdHLjDP+vjxKz4AGCIcEaOtT8WwU8ME9XQn9jCnGz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4571
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
Cc: intel-gfx@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 07.02.22 um 12:18 schrieb Maarten Lankhorst:
> Op 04-02-2022 om 19:29 schreef Christian König:
>> [SNIP]
>> I think we should put that into a separate module like we now do with other helpers as well.
> Can easily be done, it will likely be a very small helper. The code itself is just under a page. I felt the overhead wasn't worth it, but will do so.

Yeah, I don't insist on that. But we already have a lot of other small 
helpers handled like that.

>>>    drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
>>>    drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
>>>    diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
>>> new file mode 100644
>>> index 000000000000..e0bb35367b71
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/drm_suballoc.c
>>> @@ -0,0 +1,424 @@
>>> +/*
>>> + * Copyright 2011 Red Hat Inc.
>>> + * All Rights Reserved.
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining a
>>> + * copy of this software and associated documentation files (the
>>> + * "Software"), to deal in the Software without restriction, including
>>> + * without limitation the rights to use, copy, modify, merge, publish,
>>> + * distribute, sub license, and/or sell copies of the Software, and to
>>> + * permit persons to whom the Software is furnished to do so, subject to
>>> + * the following conditions:
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>>> + *
>>> + * The above copyright notice and this permission notice (including the
>>> + * next paragraph) shall be included in all copies or substantial portions
>>> + * of the Software.
>>> + *
>>> + */
>>> +/*
>>> + * Authors:
>>> + *    Jerome Glisse <glisse@freedesktop.org>
>>> + */
>> That is hopelessly outdated. IIRC I completely rewrote that stuff in ~2012.
> If you rewrote it, can you give me an updated copyright header please?

Done, send out to you.

Not sure if we should keep the old copyright around or not. IIRC it was 
pretty much a complete rewrite.

> [SNIP]
>> There are also a bunch of places with extra {} and constructs like "if (....) return true; else return false;" which could certainly be simplified.
>>
>> Apart from that really great idea.
>>
> I copied this from the original implementation, I didn't want to do any major cleanups, as I wanted to keep it as identical to the current code as possible.
>
> The only thing I changed is moving the alignment to init, because it removes dealing with differently aligned suballocations as simplification.

Oh, I'm not sure if we can do that. It would mean that each semaphore on 
radeon eats 256 bytes instead of 8 and maybe slow down UVD sync massively.

> By the way, does this break amd's CI in any way?

Alex is looking into that.

Regards,
Christian.

>
> Cheers,
>
> Maarten
>

