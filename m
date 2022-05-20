Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CE852F540
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 23:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26124112097;
	Fri, 20 May 2022 21:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D9311208F;
 Fri, 20 May 2022 21:41:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJ7mf5w7wNME2B40Ua1gVZttxmnVhJnuLxJyO23gMJM7wE+dgWT6EbwYl5PvjAhJtfR4MJs/ZIm5L11IySGfOIQ/i/tZ7qP2A+Rnrij9df4ePJwnFog5ib2tBNb7nGYBakfJAwKiWJ7gNzHV+5qEqVzK0BjErkr57lFShv1xUsVQgcPaJX3pVqFncRWEmqccSjAodDth0G+tNYEw36Fp7vMvXeXIAAHLH1RrfYbMdTY1lGtAROEjJkM9//615sFt+wmUQFgX7YPE2VXN6tzTEv3g5zR1xVQg/cC0E3AI844xtDXssHejHdf+aBCn+N1JWURgXQyAUxkNtf5u9Fg9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYwnSgH5RlpTV9Zx1aDj897w+zVJcbdmQx/MQnZ8U1w=;
 b=Nz97xYCpoXEIgMCPVl/HYK9s4uv+H000G0RFyeMR/lRhwKNwg3GHZk4pHkjfVn322qky/c+uOSfik3ZTLUYmtsWUYWazqWEjCnOWlJ7fvbLOSiXLJX/RWkoumY8lb7NHSThs0aSbOjhJqgO8dpcmRg+KTRNidmyxiwZbyoP81pR09uZ8x8QFdPncRbxQTRW41R6ATvFO5vRB860H8U+DKA0eCByeq2sEb0T38u2ZGEfEo9Mp8c+gjESMTC0kwjb4XP5kI5klNn2hbE3kBESOzIaOHc9oeEi7q12fZ2Svhi2ZeU7l6jfV4mrRsMXeTEVMhT+71OgsGMLv3t3VdBaArA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYwnSgH5RlpTV9Zx1aDj897w+zVJcbdmQx/MQnZ8U1w=;
 b=T5rJ6ufebRwpVvcRlwErntJoiOdwUo+1K/XMPIMWih5ks7wWgGw1izM4w5oXc0p/jy5gId4e+XlfwEcFzNnDjVf95piBQXqrTm6oJoNBjdiwaLfEhmRGyucbfEJvellUOXgEV9Or5EEamJMBn+symhz5jlYN01u3RZ7OZ8sHC/mHdJb5F8Z26Omtsx1CTha3vAzazvyJAv76ZCZlb0XRDZxpSoU9a+hB9vUiS4Fn9OjNOiUv+csCelL9wCjid/QFCsLtAcIsPGiZGawk4bWQF3yH4BxYSMN970/sUcpY0jME2kp2mxQo9su/RyNfI2jgK4BNwT3kamO923iKEAEVlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 MWHPR12MB1885.namprd12.prod.outlook.com (2603:10b6:300:114::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.13; Fri, 20 May 2022 21:41:08 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::8d18:7673:ce09:c538]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::8d18:7673:ce09:c538%5]) with mapi id 15.20.5250.018; Fri, 20 May 2022
 21:41:08 +0000
Message-ID: <80fa1ee5-6204-6178-e7e2-ac98038cd8d8@nvidia.com>
Date: Fri, 20 May 2022 16:41:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 09/14] ACPI: video: Make backlight class device
 registration a separate step
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
References: <20220517152331.16217-1-hdegoede@redhat.com>
 <20220517152331.16217-10-hdegoede@redhat.com>
From: Daniel Dadap <ddadap@nvidia.com>
In-Reply-To: <20220517152331.16217-10-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0801CA0016.namprd08.prod.outlook.com
 (2603:10b6:803:29::26) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 526f4250-9872-438c-5974-08da3aa972d9
X-MS-TrafficTypeDiagnostic: MWHPR12MB1885:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1885DED12BA0D64973713A7CBCD39@MWHPR12MB1885.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DudgWLC176ykBn0HQKvQIPxoCoN3ZWkPs6Y7+3j7sUmv6xrIDF5vKPGo1MvGFR6YorcjLJqtCEKlNujL38zhd0+2xo7dKJEaBpsgtAKc1zTexDnJCObghFXe1/iE+5Pag3c5k5AK5z99hsP+65HsjKZmtQmVo2E/8xrCzlN8Z7BPmuIy0zto4wBUBMdwFzj4pL6di6RAqD7hEfFKf7Ms4iye7vEFOqtPx+ktZ6mDXeODXDeN/fQNKzITZO1hDWaPzpc3Dk+zOwgpnnlDvz1tXbBQZALC7HnPr6BcIzCmXuFrEmMTy2gndHljLua3rp9H///1XibzNyBuNEUo4zlTeU6noS+C1WcoCdC/7XnVIbwTYxAqsS+zU9OjXcqY2F8bkOaWXCl0C6DqVsogJeo/lthOmKvDG0Y1qW7EZ53noWeCfwGm4Ashw6vgJwfz8phzaEGm180P8LESPYrWLRY3winA/QVF7WN5acSKxJCZ88DzxvwSWzupSxcd9PZQezg/53tSWxMKtgZvPS+9+vfZljyPvJrfWmEJjH4UZpZvuNulmeTpPRAm7ksTAsDCStOKTeIHX/qjryAvd4+jUyKaNIlS2W1vp8flZK0gdElCYlxRhpMNn4aSQbcE7U2w/QpqQkc6lKLu8WtnxvgmJVGf4sfCzr59kjbCxLppHtiFAFUJm2Hd3ehqXMNnWB/hoOCt2sN3lSEu7d4iB7PjMBN29ylAVlA783JASetVOLx+g4Aa806nv9UwkUGSMlxYsE8ZIFiKGEpAZD8tIfgTyDzB7T8/i1bSITyAMIShBI9/Higjpeh835mEfTzDfZ6mUBxPrR7euqgWEygZ6WKFclzudA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(921005)(31696002)(2906002)(5660300002)(8936002)(38100700002)(86362001)(8676002)(2616005)(83380400001)(4326008)(316002)(186003)(54906003)(110136005)(36756003)(966005)(508600001)(6486002)(53546011)(6666004)(66556008)(66946007)(31686004)(66476007)(16799955002)(6512007)(6506007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjdCc24rblAzWTU0NTcrS1REdnd1TG91V1RoKzRtc1ZZbmpjWFhVT3dwemxw?=
 =?utf-8?B?VjZka1RIRkVXTC8vMzd6YThxRUlLYXVsZjZYTlJYQTNRbXZqNitFNVIxU1hG?=
 =?utf-8?B?QThCSFd1OE9DNWxxNjhOdnhoZFF1Ykx1UHB5YnZiK2p3WDRxVVBGNzlDNkhV?=
 =?utf-8?B?R1g4T042QVpFeDJHMG51dWxrSnhpVTNFT0lKUWc3K29wc1BiTGZ1K3FmZmVK?=
 =?utf-8?B?RjZoT3JaTnRtRkxHRTdzUS9Gd0hDeFNFYmlnNmFnbi9BSjBxdHNrUHZDVWlr?=
 =?utf-8?B?UC8wYjkxTGdrVEtwVEtuUTZkTkJlTmpUV1d4ZEFadERwTWt0ZkpsYkV5dUZT?=
 =?utf-8?B?MTl3TXNCOHpkUG1kSGs2Ri9LRHI4c21ZelZMaUE0UHl0UGFTbG1uZHdoaFhx?=
 =?utf-8?B?a0dRYmQwQjZCOTRVZGFYaG1QalduM1NoWHluZnFBQ203UVAxL0lxWURpblhy?=
 =?utf-8?B?ak92WmpGN1NlWlFRNG5kQTRibTJUeXZVUDV1bTZVL2dSL0ZNK1l3SmdycW4x?=
 =?utf-8?B?YmU1UWE2NmJpZWlScmU0R0ZLWTUvRURmZ0daZFlmeVhhQ3VLWVV6QXUzSFVx?=
 =?utf-8?B?SFVZTEdWVERxY1ZaWXIycnREUzQ3T01zUlJqMHVwaEJzZHhSVWJaTS8ybEdx?=
 =?utf-8?B?L0NKclM1VVg5V2ZuMk4yc2Y4U2d0WWd4dEpWOU84ZS9NMmFUVllwOEJLaDhZ?=
 =?utf-8?B?TUhNd0tXRHkwSkN6a3dNbjBueWhnQWVMOHZqVEU4U2huQktSK2p2YzBEWmN4?=
 =?utf-8?B?SllkUmpQMjJoSTYrVkZiL05ISFZHTVlEQ0NFQ0R6cEMxbEMzRlk3ZG9PVVVV?=
 =?utf-8?B?dEtFejUyMmNGVy9oVVdHWng1Z3ZtRXBVdkdDUUdZQUFTVExvbzFMVkQvU3Vk?=
 =?utf-8?B?bjRUbnUvaHhZS3FxaUJadDhTOUlxblJ6TGhwT2kvNWlUaE8xTUJ5U3lpL05k?=
 =?utf-8?B?RUJVNlc4ZVpzV21aQWxqZmxXM1ZCRE4za3U3WUlaaFl2OWFva2wzWDM0U3dF?=
 =?utf-8?B?aTdYaCtYazQxd0ZtUlpSZ2NKRzlLeHNIeEUzZXBFQ2pRMU5jTi91NldtUk9T?=
 =?utf-8?B?bTNBaWtsRFk1Ly9IaStWNFE2ekh0WGlaNmhENTJtY0tCb1laZW9EYUc4c0pY?=
 =?utf-8?B?UzFVNC9uNVVGcmtYRjZLdklyMmdQalVLN21rakxRUmdHOEhDMEhVOExYNm0w?=
 =?utf-8?B?aVlKVitrMVhkeVZYS3BHQzVCVHJ4RmQ1MGZRb3ljaXI1eE9JR3hiK2xBVUwv?=
 =?utf-8?B?VkFQaUVKaFpvUTY0NzBBZTRaeC9vVXUzY2s4K08xQm1VM1Z5TStiQ0lUeEpW?=
 =?utf-8?B?RVB2SVo3UzB3bjd3VXE5MWVKTHhEU1J2ZFA5OFFuUjBEbE4xd3N1Z2haVm5K?=
 =?utf-8?B?aFZUWXlQMGNzYzVzYzNmdTlqTndhU0JmN21tRGVlUGJrbE1XcUV4TDNYdHIy?=
 =?utf-8?B?R2R0Qzg4UkpyRjdlcXljQ0kxNkc1dEdlamk1Tm1hUlVZdGlhQVFYYTBZZ3B1?=
 =?utf-8?B?TFlPcmwvc0x5bmhtTkNVb3hwdE1BY0tuaG5uM2Q4TXh3QzdRNzRJODA2YVJ3?=
 =?utf-8?B?SHJReW1jcnRGTExQSWlNMzVWQVpyOGtFRmRuK1UzUktsWkdpbWZ4S0l1cm1o?=
 =?utf-8?B?NklJV25CS3lrcVhXaWtkUkFXNkRuVkZRcnM1MkdRRm9CWDlNY1pRZ0tCMGx5?=
 =?utf-8?B?eENqR2Y3Nnd5TVZWNVdjcEZwUjkvMmwxbmpSKzFpRmtrWHlrUmFDMDFYM0Ux?=
 =?utf-8?B?TXNCOUYwZGRrNmplc1Z0TEtHaU9lM0pQbHBhNjBRc2VNZWt4S3piOUVXQy9B?=
 =?utf-8?B?TzI4VzVhSEZWNTRFQU1lMmUwWGR0MjZWUkVHNmlJK2h6b0djZlpscmY4aWJj?=
 =?utf-8?B?V0NYei92VWZuaUNxbWt6Q01JcHRXc2pNNW9xVXR6V09SbE8yUmZpdTJzZmxP?=
 =?utf-8?B?eDVmamswRDZObHUrM1ZRMHdsaHFkMFhIcVJkV3JrQkwvVUxRU01pN0dMSzdY?=
 =?utf-8?B?UDhTZXNQaS9UYVRtQkM0K2lTZVQ5K2NiNXI0OU5zNUxCMGVDOFo1K2FRaFc2?=
 =?utf-8?B?TE9NN2ErbWZ5cFRrKytUUWVYVW1nMFAzSnZiMC9halFlMFJ4Q0R0Uko0U1A4?=
 =?utf-8?B?ZjFrOEFFR3hLeXRKRERDdk84M295ajRvLy9EeEYyY1NaQjFtdTFibzR1TjBp?=
 =?utf-8?B?alh5ZytmQXZkak05TVNncHFJcGhIUm9JYmJEbUVoQVk5TXgzNW80Y0FMYVVt?=
 =?utf-8?B?UW5UTWhNUmNxbzExa0RaNDg2TXQ4ZFVtcytKT0Q2U0t3eldBUjRJeGpKYmlJ?=
 =?utf-8?B?WEo1OTZXOHBMbjhUK2M4NlpaMEM2SlArajBhWmJ2dU50VzU1bjY4UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 526f4250-9872-438c-5974-08da3aa972d9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 21:41:07.9108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7WjxLRY7Dc8qTX2XHcp72PkdA3GcZbzZ+TewiIFXT6JWA6MbdKaPxsCJJWhvLMsTV/uHLT1T8oP8sHIEuUW1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1885
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/17/22 10:23, Hans de Goede wrote:
> On x86/ACPI boards the acpi_video driver will usually initializing before
> the kms driver (except i915). This causes /sys/class/backlight/acpi_video0
> to show up and then the kms driver registers its own native backlight
> device after which the drivers/acpi/video_detect.c code unregisters
> the acpi_video0 device (when acpi_video_get_backlight_type()==native).
>
> This means that userspace briefly sees 2 devices and the disappearing of
> acpi_video0 after a brief time confuses the systemd backlight level
> save/restore code, see e.g.:
> https://bbs.archlinux.org/viewtopic.php?id=269920
>
> To fix this make backlight class device registration a separate step
> done by a new acpi_video_register_backlight() function. The intend is for
> this to be called by the drm/kms driver *after* it is done setting up its
> own native backlight device. So that acpi_video_get_backlight_type() knows
> if a native backlight will be available or not at acpi_video backlight
> registration time, avoiding the add + remove dance.


If I'm understanding this correctly, it seems we will want to call 
acpi_video_register_backlight() from the NVIDIA proprietary driver in a 
fallback path in case the driver's own GPU-controlled backlight handler 
either should not be used, or fails to register. That sounds reasonable 
enough, but I'm not sure what should be done about drivers like 
nvidia-wmi-ec-backlight, which are independent of the GPU hardware, and 
wouldn't be part of the acpi_video driver, either. There are a number of 
other similar vendor-y/platform-y type backlight drivers in 
drivers/video/backlight and drivers/platform/x86 that I think would be 
in a similar situation.

 From a quick skim of the ACPI video driver, it seems that perhaps 
nvidia-wmi-ec-backlight is missing a call to 
acpi_video_set_dmi_backlight_type(), perhaps with the 
acpi_backlight_vendor value? But I'm not familiar enough with this code 
to be sure that nobody will be checking acpi_video_get_backlight_type() 
before nvidia-wmi-ec-backlight loads. I'll take a closer look to try to 
convince myself that it makes sense.


> Note the new acpi_video_register_backlight() function is also called from
> a delayed work to ensure that the acpi_video backlight devices does get
> registered if necessary even if there is no drm/kms driver or when it is
> disabled.


It sounds like maybe everything should be fine as long as 
nvidia-wmi-ec-backlight (and other vendor-y/platform-y type drivers) 
gets everything set up before the delayed work which calls 
acpi_video_register_backlight()? But then is it really necessary to 
explicitly call acpi_video_register_backlight() from the DRM drivers if 
it's going to be called later if no GPU driver registered a backlight 
handler, anyway? Then we'd just need to make sure that the iGPU and dGPU 
drivers won't attempt to register a backlight handler on systems where a 
vendor-y/platform-y driver is supposed to handle the backlight instead, 
which sounds like it has the potential to be quite messy.

Recall that on at least one system, both amdgpu and the NVIDIA 
proprietary driver registered a handler even when it shouldn't: 
https://patchwork.kernel.org/project/platform-driver-x86/patch/20220316203325.2242536-1-ddadap@nvidia.com/ 
- I didn't have direct access to this system, but the fact that the 
NVIDIA driver registered a handler was almost certainly a bug in either 
the driver or the system's firmware (on other systems with the same type 
of backlight hardware, NVIDIA does not register a handler), and I 
imagine the same is true of the amdgpu driver. In all likelihood nouveau 
would have probably tried to register one too; I am not certain whether 
the person who reported the issue to me had tested with nouveau. I'm not 
convinced that the GPU drivers can reliably determine whether or not 
they are supposed to register, but maybe cases where they aren't, such 
as the system mentioned above, are supposed to be handled in a quirks 
table somewhere.


> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/acpi/acpi_video.c | 45 ++++++++++++++++++++++++++++++++++++---
>   include/acpi/video.h      |  2 ++
>   2 files changed, 44 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
> index 95d4868f6a8c..79e75dc86243 100644
> --- a/drivers/acpi/acpi_video.c
> +++ b/drivers/acpi/acpi_video.c
> @@ -31,6 +31,12 @@
>   #define ACPI_VIDEO_BUS_NAME		"Video Bus"
>   #define ACPI_VIDEO_DEVICE_NAME		"Video Device"
>   
> +/*
> + * Display probing is known to take up to 5 seconds, so delay the fallback
> + * backlight registration by 5 seconds + 3 seconds for some extra margin.
> + */
> +#define ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY	(8 * HZ)
> +
>   #define MAX_NAME_LEN	20
>   
>   MODULE_AUTHOR("Bruno Ducrot");
> @@ -80,6 +86,9 @@ static LIST_HEAD(video_bus_head);
>   static int acpi_video_bus_add(struct acpi_device *device);
>   static int acpi_video_bus_remove(struct acpi_device *device);
>   static void acpi_video_bus_notify(struct acpi_device *device, u32 event);
> +static void acpi_video_bus_register_backlight_work(struct work_struct *ignored);
> +static DECLARE_DELAYED_WORK(video_bus_register_backlight_work,
> +			    acpi_video_bus_register_backlight_work);
>   void acpi_video_detect_exit(void);
>   
>   /*
> @@ -1862,8 +1871,6 @@ static int acpi_video_bus_register_backlight(struct acpi_video_bus *video)
>   	if (video->backlight_registered)
>   		return 0;
>   
> -	acpi_video_run_bcl_for_osi(video);
> -
>   	if (acpi_video_get_backlight_type(false) != acpi_backlight_video)
>   		return 0;
>   
> @@ -2089,7 +2096,11 @@ static int acpi_video_bus_add(struct acpi_device *device)
>   	list_add_tail(&video->entry, &video_bus_head);
>   	mutex_unlock(&video_list_lock);
>   
> -	acpi_video_bus_register_backlight(video);
> +	/*
> +	 * The userspace visible backlight_device gets registered separately
> +	 * from acpi_video_register_backlight().
> +	 */
> +	acpi_video_run_bcl_for_osi(video);
>   	acpi_video_bus_add_notify_handler(video);
>   
>   	return 0;
> @@ -2128,6 +2139,11 @@ static int acpi_video_bus_remove(struct acpi_device *device)
>   	return 0;
>   }
>   
> +static void acpi_video_bus_register_backlight_work(struct work_struct *ignored)
> +{
> +	acpi_video_register_backlight();
> +}
> +
>   static int __init is_i740(struct pci_dev *dev)
>   {
>   	if (dev->device == 0x00D1)
> @@ -2238,6 +2254,17 @@ int acpi_video_register(void)
>   	 */
>   	register_count = 1;
>   
> +	/*
> +	 * acpi_video_bus_add() skips registering the userspace visible
> +	 * backlight_device. The intend is for this to be registered by the
> +	 * drm/kms driver calling acpi_video_register_backlight() *after* it is
> +	 * done setting up its own native backlight device. The delayed work
> +	 * ensures that acpi_video_register_backlight() always gets called
> +	 * eventually, in case there is no drm/kms driver or it is disabled.
> +	 */
> +	schedule_delayed_work(&video_bus_register_backlight_work,
> +			      ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY);
> +
>   leave:
>   	mutex_unlock(&register_count_mutex);
>   	return ret;
> @@ -2248,6 +2275,7 @@ void acpi_video_unregister(void)
>   {
>   	mutex_lock(&register_count_mutex);
>   	if (register_count) {
> +		cancel_delayed_work_sync(&video_bus_register_backlight_work);
>   		acpi_bus_unregister_driver(&acpi_video_bus);
>   		register_count = 0;
>   	}
> @@ -2255,6 +2283,17 @@ void acpi_video_unregister(void)
>   }
>   EXPORT_SYMBOL(acpi_video_unregister);
>   
> +void acpi_video_register_backlight(void)
> +{
> +	struct acpi_video_bus *video;
> +
> +	mutex_lock(&video_list_lock);
> +	list_for_each_entry(video, &video_bus_head, entry)
> +		acpi_video_bus_register_backlight(video);
> +	mutex_unlock(&video_list_lock);
> +}
> +EXPORT_SYMBOL(acpi_video_register_backlight);
> +
>   void acpi_video_unregister_backlight(void)
>   {
>   	struct acpi_video_bus *video;
> diff --git a/include/acpi/video.h b/include/acpi/video.h
> index e31afb93379a..b2f7dc1f354a 100644
> --- a/include/acpi/video.h
> +++ b/include/acpi/video.h
> @@ -53,6 +53,7 @@ enum acpi_backlight_type {
>   #if IS_ENABLED(CONFIG_ACPI_VIDEO)
>   extern int acpi_video_register(void);
>   extern void acpi_video_unregister(void);
> +extern void acpi_video_register_backlight(void);
>   extern int acpi_video_get_edid(struct acpi_device *device, int type,
>   			       int device_id, void **edid);
>   extern enum acpi_backlight_type acpi_video_get_backlight_type(bool native);
> @@ -68,6 +69,7 @@ extern int acpi_video_get_levels(struct acpi_device *device,
>   #else
>   static inline int acpi_video_register(void) { return -ENODEV; }
>   static inline void acpi_video_unregister(void) { return; }
> +static inline void acpi_video_register_backlight(void) { return; }
>   static inline int acpi_video_get_edid(struct acpi_device *device, int type,
>   				      int device_id, void **edid)
>   {
