Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800FE572FF3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7E2934A8;
	Wed, 13 Jul 2022 08:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3B893497
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 08:02:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3KDqahJunePWYUaU0RRo3bH9SYq/cFKeJBlnFAR3urJgoandLon1lFBCtVq5/MmsfdvqHfyKQf540zz8rvFQpvhVt2qEhQBSLcEBE00YGVMJ24BFBW7FWWk/d/Tdv6w7Wgoh/2wE9ccsO2hp7qK5oxiq08GUqnPa5ylsevHYtOJ+TGhwpi6VLyKnXWdWUPLSwxG7yswmIoChzI9fgAx7t/UaKMMhq3zeOFGIDflbVJuhghsHKA5nBwHiVyX1CxNvIlMaW9MW9BF32uriUX2lAlK6N1cdFXc7x+p20Dhn+9XIeGOQvt968ojFgp/OtSmp1Imtx7WwhymtjCrEZjzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zKh+qB/xQDNGCSJY/M6arJLgMgQXgnr50yUdAClRqA=;
 b=fwTlmMuLbNRBDBuE11Hrx/w5daO7ksI7IVw0Umx7x9h9qfmHQxYpCvl4825afcTjJNoa48tLoWf1AR2j3KiDd5KEKUVGI6+GdIFhRh8Qovs/Xp5Yg779uVXaAQrcpMSZb083kq6OLmqEV4jLgBB2PjIH3oUxb5K9guXx3ieI3wwPKZS4eulMh/fHn3us3gIs///JZev6aVIN+HoBCCDfJ+2cuBhYdqDwsfOyFHxGg2ffxCX9KXScFS9GaC3f6c6Fexpoa9UcXrKD6vL6gUqfL+JuHSppDnLBl1T5+F35aeclPRiL/q9F+LwmLGIxfXjhjNU+/JfKDqLkajptsEXNjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zKh+qB/xQDNGCSJY/M6arJLgMgQXgnr50yUdAClRqA=;
 b=tGMy+P/uaZTWv3/asGlmiDIhnqoV4vAHx11GhEGfhpLpf9YYV7RyHpjRSrr0xIqmYY7GcYnlPb8HmkSRB5XzhvJFQEVzNA+yWoJ9QBQDiPDfwtBBMIpW6z4w6455SDSLGAd8Nspw/W3YwBNVJPQScBNZgIh5+fXJ4UIdAW1IKWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4140.namprd12.prod.outlook.com (2603:10b6:5:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Wed, 13 Jul
 2022 08:02:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Wed, 13 Jul 2022
 08:02:19 +0000
Message-ID: <f63c0955-47df-cb4e-ac19-ec04019dcc06@amd.com>
Date: Wed, 13 Jul 2022 10:02:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC][PATCH 2/3] drm: vgem: Enable SYNCOBJ and SYNCOBJ_TIMELINE
 on vgem driver
Content-Language: en-US
To: John Stultz <jstultz@google.com>
References: <20220712042258.293010-1-jstultz@google.com>
 <20220712042258.293010-2-jstultz@google.com>
 <6e490429-e34c-fa51-c6d9-3315c4639d9d@amd.com>
 <CANDhNCo1WAUC9DhGfT19Smq2Z5duruAAwOs6AWUWUvNAjZqgAg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CANDhNCo1WAUC9DhGfT19Smq2Z5duruAAwOs6AWUWUvNAjZqgAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0502CA0043.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c83c21a1-be22-46db-ac34-08da64a60216
X-MS-TrafficTypeDiagnostic: DM6PR12MB4140:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VNMkZlqDfRsGvaGNJ05T+4p3XAtdB+rP2A+3cUdCUL7QhAwx/MI/RGILCDNruy01Hncik4zncxtPvH80i/pOf+zBZbPMUDknboXaz94nkvKDdUcnWJyv5s4gBcrqPJdkXkx7fctNVWl8GtFL2GYjt2pK9JEyeiN5LUr+PrcLh4THh16wMxnG/eUd7W9ZZsGL9x2VjRhcWbkNd6k6AVbMwXkFoc/itrucwHdfkkgpVeBtN9okmxRYTKyo+UewNSA7/qAGIjOd+i2MD1rBEj6Si/3OhlSszBwMmwGhK499BJz+Og1RHQgoDwXKiWBjpcuZClLYHn7wVBDGDji2cSGfC/st1Cn12l08zReo2Fddsy7RxiU2K5T3ylST3Humq4z2ySQCAuK3JF7fIsdNaYX02W1YUMDF96fC1sjTkT6GnqbYCSl6jdmLBSa3FhRdy4bkhdkcYfXupGKsI+4oVCb20CPrPOrguH0eOmYVLDhVoe9kk70HyaDotmGa6sLwzV/ywVmr+ysgUz9eO/k0KyVaYp082M6B4czt360Th1msNEe3Niw+26S1qAU2V8jD5geDrrnQeHv+DLWzO0Kyo1EFiSVYUY/y3kTkM8b3w7CoXS9jN2gstQFjGmW+DprmXWAqm5o30i6ZJf8TJRXbAUtIoqxXdgPDBOigDNOnIA0oxFX79b1H1m00j0pNtYHvo6v0Fd4QpgyKqHgYG2KdifrEQTZ4K3LavTITijDh8OXOdtztV9GJbKZ13DVSCcnomlL1YTS+uBNJ/rLvFp4QVlxLMKCoVBTe90k1rToiTHOX9eINvKcZLz81itWjAz/ajkNo+j2XIPU88E1ggtJw9hNOBWrHv/+ERGLzOOq/qzw4d58=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(6512007)(8936002)(53546011)(38100700002)(2906002)(31686004)(5660300002)(7416002)(6506007)(83380400001)(36756003)(66556008)(66946007)(4326008)(54906003)(66574015)(186003)(2616005)(6916009)(8676002)(66476007)(86362001)(6486002)(316002)(31696002)(41300700001)(478600001)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?empPc2pmeWRoOUZxUEVDaGxoTmxDMzNjVEtvQmlDaHIvQU96VTl6SHI2SUVS?=
 =?utf-8?B?NndFQXJaM3lObzFoU0Y3ejNxZlpCeFRmT05naVFOZDlPdlRsZEgydWxha3pC?=
 =?utf-8?B?eHZGaHZaYnljVUM4TTdHYk0yOHJDeUl4VzJkVTBKdDR4K0s4M25uWTluVHcz?=
 =?utf-8?B?VmViNmNLUk1OeEdaZmFZY3N2Vm5xejhrTHJ6TUpibFhDQ1FUTXk4VUR1U3Zr?=
 =?utf-8?B?QXIrSDc2Zi9Xd1NRUlFsbW5tajcwdVo5NlVSTGFEL01ON0s4aGFqcTh3SHh3?=
 =?utf-8?B?cWkzbnVscE9OT2VIeThiRFVveDhpSFVCVWpjaGk5dUNEWUFBMUZEb21BblRV?=
 =?utf-8?B?b2lMOVBMMTJHdjBnOEVGNDFjWVIwQjRXMDlIRnMwN3p4QSt3Y3hWeVBtMXN1?=
 =?utf-8?B?Q1M4WWs1UGZpcHliMzZuUmt3YTFqeU42ajNHa1FNM0hQUUY4aVpwS2Zaa01S?=
 =?utf-8?B?RmVYcDFYT1JBREtBK01UYUx6bDRkY3lYUnVwL0UzeFhaOGF1QTFaUTJjMUZY?=
 =?utf-8?B?bmxIZXNHaVBBMnA5OTJJMUFyZDRZWVVBRzduWk1iclZvNmhnMjYwVUJLUHdu?=
 =?utf-8?B?dmhtMXlia25uS0Z3ZXJjYXJUcERzY29kNG8vSy9meUp3RG1kSElKeGVtb1R6?=
 =?utf-8?B?d1RTcjJETTVqRXJGcC80dmxUMVVXL1hCWXF6bURhT0l4QUp6WEcxaUN5d25C?=
 =?utf-8?B?TFNFTGFvYVcvRzA4YTQzYzRMM29BSFZCRGNQUUZnMm9TbkVnai9vb1M0Mll5?=
 =?utf-8?B?Rm84TVJmeXF1OWV4dTVDY0ZkUC80YWdId1plR2dOcGVQYTFtbFJrOUl5eGZE?=
 =?utf-8?B?bVIwNlV6QVJRbjBiNmYvN2grekU4U21DUktDUlNCQVFNWU5YNlNORjdUWFhz?=
 =?utf-8?B?RW1XK0ZqYnJjY29mWjAwSmZqRWwzK0lFSHduVmYySjdyWnI3YzAvNkJMTVlF?=
 =?utf-8?B?SXZLRVBKTkQvend4K0xGSFUzWUNOaHhmbjgraWNiYUVMMWJCUHAxd2w4WlMy?=
 =?utf-8?B?VmdVbWN2RnFwZEcyWlR5TjFNbXRuZTBmMDlWRHBCWVlUanE3S3M3d2dkeDYz?=
 =?utf-8?B?UVcrUjRJalB2N2dHcndtclJqa0k5U3Y3T2p0QnFIcTYzMDF5TllNeTU3S2JB?=
 =?utf-8?B?VXdncmtOODdsY3MvaWNTdHFxdGxvMDFYZ2xMZmlxRU5mZCtIUnozZ0JLNkVs?=
 =?utf-8?B?RlpveVUwM3UyaEd2UEZOeU1qWlZLTjA4VTJzRVA4VUwzR3lkNTJoR0xSUFRy?=
 =?utf-8?B?ajY1TVc2VW1ZZ1BGQ291UkhQSGxXTVpjZ2k4blBBdWM2NDlDZ0d4NWU5bDBW?=
 =?utf-8?B?SG0xdCtNMTU2NFBwT1luVlBPc0huL2VyRGtiQVN3VDRYekdnWU0razZleDY1?=
 =?utf-8?B?VWp0cHFYNTFOZXc1S0ozNmU4Q3hVclRTZGF4RVdQcUxTR2M3N0F4MUpCdEdt?=
 =?utf-8?B?aHp6TjJ3anRzaGhuV0FXYk1qa2VlZlhRSVM2eEZOdVQ4UVRoUWJnR2h0Q2NS?=
 =?utf-8?B?Ym5Na0FqSWhLeVlucHNnVGxUbitQSnlWQ1Fac0ZNVC9BbllNTGtOVWVocG16?=
 =?utf-8?B?TFBpaUJ0MC9RVVRMK0ZXcy9PTHVQTjZTNm5mV3FUd2tPSGVyam10RkRTWktH?=
 =?utf-8?B?OXZMdWJWU0ZyODBNV242b01ZTVUvOFN5ZFh0QzZaM2FnYmFUWllaemdlazI2?=
 =?utf-8?B?cWZHVFdhUysvNi9aOFJqWk9Fa1ptNE1CK0h3NkVSbGxOaVVXbFpMaTBhMHZi?=
 =?utf-8?B?MXpWMmRreG9KbUd2WjR4clBFUU01STR2cUxzV0FLbEFuUHJIUFJ3bmR3MXdI?=
 =?utf-8?B?c0JQL3VrNlF0bit2ekt1Wnlka1l6cFQ0RlhUTVRXQ3pQbTBZM2trZ3ZtUVFp?=
 =?utf-8?B?eWo3aERNL1BNcG1uUUtGT08vaWpHdlN1R0NoZ3l3WEZVbUwySFVrRXN2bHN6?=
 =?utf-8?B?Y3ROOEpxenZLeVRwRFhMb3V2UUoyOUxFVFZuazRJdUVzdHlkdjlhQWVxUFlG?=
 =?utf-8?B?dHkxR1pVdjd3MkJZdnBxQjhOR2dYUG1wRlVEUkdNT2pQanpOaW12WEJYeE5w?=
 =?utf-8?B?RzdvRDNtc0MweFR1TW5rbHM5MVBWZHBjc0ZXOXlCQUlsK29yNDN6TlhCR21z?=
 =?utf-8?B?YlFjTkhlTTVUajR5TWtZQnZmb1RmM2Z0bHlEeDRhdWVzcmE3WndMaTc3K0tr?=
 =?utf-8?Q?Cas8B1pCV7lQdnT7dhjh0/OeOzZuhbbEJekiMK6uYuv7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83c21a1-be22-46db-ac34-08da64a60216
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 08:02:19.0297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2QsDpEwI+KilDzkhz+Xo43AQLHZ6megCyWJbPfc8xW+arU6e/0Un7UaGPaHfOak
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4140
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.07.22 um 18:50 schrieb John Stultz:
> On Tue, Jul 12, 2022 at 12:46 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 12.07.22 um 06:22 schrieb John Stultz:
>>> Allows for basic SYNCOBJ api testing, in environments
>>> like VMs where there may not be a supported drm driver.
>>>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>>> Cc: Chunming Zhou <david1.zhou@amd.com>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: John Stultz <jstultz@google.com>
>>> ---
>>>    drivers/gpu/drm/vgem/vgem_drv.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
>>> index c5e3e5457737..e5427d7399da 100644
>>> --- a/drivers/gpu/drm/vgem/vgem_drv.c
>>> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
>>> @@ -109,7 +109,8 @@ static struct drm_gem_object *vgem_gem_create_object(struct drm_device *dev, siz
>>>    }
>>>
>>>    static const struct drm_driver vgem_driver = {
>>> -     .driver_features                = DRIVER_GEM | DRIVER_RENDER,
>>> +     .driver_features                = DRIVER_GEM | DRIVER_RENDER |
>>> +                                       DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE,
>> Well that's rather surprising. I'm not an export on VGEM, but AFAIK you
>> need to adjust the CS interface to support that stuff as well.
> Apologies, could you clarify a bit more what you mean here?  This was
> just helpful to enable the generic userland ioctls for the example
> test tool in this series.
>
> Are you proposing to add interfaces so the vgem driver can
> attach/signal syncobjs similar to the
> DRM_IOCTL_VGEM_FENCE_ATTACH/DRM_IOCTL_VGEM_FENCE_SIGNAL calls?

Yes, exactly that. I don't see how it would be useful otherwise.

Christian.

>
> thanks
> -john

