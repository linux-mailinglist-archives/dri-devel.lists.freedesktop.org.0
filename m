Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB02446A0F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 21:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE906EA94;
	Fri,  5 Nov 2021 20:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2976EA94;
 Fri,  5 Nov 2021 20:47:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXAQKmcdFI2wwatAB/H9uYEP0emqgdXfcGcfHzURz2vb4tfFLKbvHDMRoIyRxaozCcVxkJhkHofLvkO0SwIYnDy/X/iIAL1NOt4NYhQ1vSsFckMGfdF0aCuQfp4r5gZVDqLSVIvBZRCFueFyZX8WAXezCK352UZ0DHFwlKZQqmY2mtj4k3HvO9+RPqNmDfRWGegL6H8mpb5vpIO6eA0nBl2Rk0g1EE+e3M/qEKx5u+qh7WSoJlzjULQgFNRzDZx+iDt4QjDVGJXYl/Ei95sncBV0ACSlL1JZdryibjhCsdYO+39Ul7qLjAHY0pHwVOw0nRs1zpza6rUtp38SE5tTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkDE27auDtwzeOoCEyVIE2S5ws4XBjFAbJMdsBvWgdo=;
 b=jpmILowR6sXl6wLN06dCMCA7SZ0g4uuGr/EMTDgaM7E7dBRJbHyyTqrfEGaNck+IrzSI/aFbkHqBTPuOD3IsHMiygNqGT4YH915sNB3QF5ZbazHQkAbbMWupPzHS4wRJRi7OHEeEEl8sfZG5xJ2YJFIVPAYRfwliBfgoU4Ez+550tEGeKKZDbUF6PB580Az3jz1t84Z1tION8rdV6J7jVu/IrSdOzT9qs3qQ1heoX89uXJVfKmYH6LV8unQIl+tWEti3MqLvjiw1oi09QLG4iRvHPdLO6Oa/AiwwDYfW7vOLW/r9ZbQwyxdk2ZllaXdaHbNZ7m8Owl7F1nMUQ9LrNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkDE27auDtwzeOoCEyVIE2S5ws4XBjFAbJMdsBvWgdo=;
 b=Iv4M6bKC4hB6PyaykI9nmRZSZLHLNhjO9iXmdeqrf5X/SEiZVNbrXjBy6StAQh0llAK8wG5LMH5mu1VHDZp1r9fJLpQ3Nu82+Srw3GRhHjfjvdgxr+a7q2AoX9ngiw4S71pHn+4x1pFObY6bxEiNtnVwR2DHjJTYVyGNdvODGGY=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5182.namprd12.prod.outlook.com (2603:10b6:5:395::24)
 by DM8PR12MB5495.namprd12.prod.outlook.com (2603:10b6:8:33::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Fri, 5 Nov
 2021 20:47:38 +0000
Received: from DM4PR12MB5182.namprd12.prod.outlook.com
 ([fe80::3c90:18ad:1198:48c3]) by DM4PR12MB5182.namprd12.prod.outlook.com
 ([fe80::3c90:18ad:1198:48c3%8]) with mapi id 15.20.4669.011; Fri, 5 Nov 2021
 20:47:38 +0000
Message-ID: <f94cd203-b0a6-bb41-8768-c64d68aac483@amd.com>
Date: Fri, 5 Nov 2021 16:47:29 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] drm/atomic: document and enforce rules around
 "spurious" EBUSY
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200925084651.3250104-1-daniel.vetter@ffwll.ch>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
In-Reply-To: <20200925084651.3250104-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0002.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::7) To DM4PR12MB5182.namprd12.prod.outlook.com
 (2603:10b6:5:395::24)
MIME-Version: 1.0
Received: from [172.31.16.161] (165.204.54.211) by
 PR3P189CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Fri, 5 Nov 2021 20:47:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 063d6e5d-1aeb-4f6a-695b-08d9a09d810f
X-MS-TrafficTypeDiagnostic: DM8PR12MB5495:
X-Microsoft-Antispam-PRVS: <DM8PR12MB54954CC808FBA95F9F03100AEC8E9@DM8PR12MB5495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8mRTFwL0+oSSAADVMCplvdfJNecMf8jL2S5H4p4ixatNQBh3sXhvCbTAqAYIFsnGlMgHmLGT7FAngy8Vf04NUhiyR/+E8355BgAI7iI0TDy+zUT/4YXMvD42eyJVLTFmq5vDDA3AQIuENJNozDKBIXVWNHu/pBuXU39Y+wIEnLl3+DrfQFI2H9el+aRLkf56xREgMkYHtRwygHMFLo6H7MfGxB4ZRFiipxtfACsDpbNtdw2/xw16zkg2kCiGfVtdyeqA284GywYa4j3LC4g2+Dwe5WWDXjykxssXuv99pndh4i1McsauAhLj/KbE8UdIc0Pls9bbKuN8+d4r/NyDB2ZKoTvx/uPz1iJ49FSGXt73aQ6OAqmwmPVqrscxOPcUdppfow0OEvnKvjirV2xjuBD72lUR3gOvBDQDS91/QBGDrz3ScBhb9paK5mLLeiEvX60T6E168vk+CiWOvKPFq/DaSxBl1Rq7CkK0VvZT8eMVutx+yfAszN2Uan8unKiarTNyKSC0YgUNkJ8xR/eVjyGQERFh7ed6FquSLt7X9d0GykYXXXu2SLfwOt/GdTXzDfAxuSG7rCjT8bBl221EWOqbfxSJv16jsKqMbmgDG2xMfKkPg1nyPxT2UGMBmj1HGQSlkHO/AHm5hlNKbSM8HGMHxGhXXoDpOsqxmGxDvk+1Co8Wc/hcQ4TnJV8w4xyYOK72qgCXXKW1wB0+BJk8TSCNybEJezX1NGG0WlXvH5Job1Cbi0usLtqEIMFOG34a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5182.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(316002)(6486002)(508600001)(186003)(31686004)(66946007)(966005)(6666004)(86362001)(110136005)(54906003)(66476007)(53546011)(2616005)(26005)(5660300002)(956004)(2906002)(38100700002)(83380400001)(66574015)(4326008)(31696002)(8676002)(8936002)(36756003)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWZtOE5IOGJ3WnBxajl5SHRGWkVrMUJORll0RFdZMDlRVzEvc1d4UnZ1TTdz?=
 =?utf-8?B?NVJkWmRLNGZaTEdFR2FEY1VPcHZPclVucTEyRk9Fa05QZStVL2NCNk8xOUZO?=
 =?utf-8?B?OXhZQzlMYmlaNFQyM3c5d1d0STlqUDJCb09lUE51dzRmbDlma2s2ZDZiQTJE?=
 =?utf-8?B?Mk9PNGZCcnlJc0VoSkVJWTNGRDlhUnArdVd1SnE3SFNtVittdzlCMHhmbWNz?=
 =?utf-8?B?WVdmT29RRHgxZjhZY1R3YVowWVBKaVlBaWwyanVFRk1LYUpOSjJsb1JKY2k0?=
 =?utf-8?B?bGRpZ2xLalgzbmNDaUE4SlYyWVZKTEdKd2VqbHlCWTRXaTdOdTNHaFlTV3ZV?=
 =?utf-8?B?bjJRaHBuZktLYW1ITDQrWWxjeFJpcnRVMlFhMEtNNjJldi85bVlKU0l2bEZS?=
 =?utf-8?B?TWV6NGxIWU1MMnk3QWNJcTZnQjBsbFBPbDhkOU1SeFZBVmtkWGdYRjJTcjhO?=
 =?utf-8?B?SEs4UkFnMnhoV29PVWJSUWtERyt1S3cyakQrNXgySTQ2TnRycDY5Q1gxaUFQ?=
 =?utf-8?B?aDlRbTIxQk9zVFhIUGtRamR6ZUxRcmhyaS9nZVZiWVdNWm0ySlVoUVdNV2Qy?=
 =?utf-8?B?Mmd5TkNSNXh5RkhDNUsrUHB6UTM5em80ZERFaWgxV0dNME9pa1BDWXRlMlk0?=
 =?utf-8?B?dXZ2NDhxNW9BMk1JNTUwRnBjRVNuMEJ2dmNWYjBRc0NydUpKbmJxWjR6R2k2?=
 =?utf-8?B?Y0dvRnpERU1HaHdiVnNXa1hOSEZnRVYrUHlkVW5VdUFNa2tsdG1Hb1ZmaE1E?=
 =?utf-8?B?ZHloU3NMalVTeDVzLzBiR1FiM2lCUkE3NWJmT3cyYXd5ajlIZ1BTaUZqbE4v?=
 =?utf-8?B?Q1dJVEhSYm8zTUZqelFZQVlBTC9kNXhLRGUzRnBTZ1I5OHRLa3c3d1RSeWRt?=
 =?utf-8?B?L1ArdEZVK2xUNWVWUm9zZm1hcEZlVTdOdCtPcm9PeG01UklaNWhWRGllQjlM?=
 =?utf-8?B?QXRTY0RCeXNUdjY0OUhqNFRRK0U1ckwyWmQxWUZHeWo4Zy8rOWF5bEkwbGpM?=
 =?utf-8?B?UmdwSTdXamlXM1puMlJpWHRaWmdrY3JsUk9TSU94eUlUNXhRUXpROFppRXBR?=
 =?utf-8?B?RDEvaUxEWUdtRUVpRXZsR1VJRkc2dVZrcHJYUTJ2VXV1OWJuS2JManVydUtr?=
 =?utf-8?B?R0E4SUprdzJ3LytRVm5ZVnBvQ2RNRVBUeE1JUWRTL29SUXZURnFIdXVGSjds?=
 =?utf-8?B?L0pPLzNrSXZFa09iekwzcXl2eGZHSUN2TXRBaEx0SVR3VnRGZlRSYXlVeFo2?=
 =?utf-8?B?MWtwMDZnakhWR0FicFVGZFRQeXN5ZnovTDJkK0FhYTJiMVFQWG8zZHJUUVpu?=
 =?utf-8?B?bFRvSUhwU2RUK0hVRFhBeE1ZZUFnSnpNYTR1elRYR3hBVEdsV0tGMTlObmcx?=
 =?utf-8?B?K3p1QXNjS0E4WktuZE1BL0RaVnhiSk9DY1pReVl4Y0xUTTk4Q1dmUjFhZm92?=
 =?utf-8?B?WHA3eWFOWHBRV09INHJHUVZZUUdPUDdLY0tRRHo0REpwajdoMjVtRndPYmxz?=
 =?utf-8?B?Wm9RbkhuZEhnSGVNVDkrdWRGMVEzUGpQRGZFVldGbDFpQkg5ekFYbU9keEQ0?=
 =?utf-8?B?cG9CbE83S081bUpXZ0ZDeDJxcllOTXNVVTI2MHp1ZjE1cG4vcGtvaDc3dU0w?=
 =?utf-8?B?ajEyNEx6enlVZFRvaHY2dGZiTHN3dnFXbmxKYWljemhmckVtd3Fncjd6OUlK?=
 =?utf-8?B?emRPNHFqd0FyUE82VFVKVFhpMGtIcU1PWWpSeUlaeVhrdlJJbTJ5ejZLUGd3?=
 =?utf-8?B?K0JoMWhtRUV3VUVWZlRzdWlGc3YwZ1FrWkNTRHV3UXRNUy9rNWJBN3JuT3dm?=
 =?utf-8?B?KzFmYzBOM1Z6dE8wcXVYVDRqWlNMUitXM3lxWlJEeGFEUTZ1S0lXSnorazB4?=
 =?utf-8?B?Z2w5dXd2eC9Pbi9Ed0IxbmFxLzIwRXUxb2NQeVl4RjZRcC9zKzdpMlU5bHFa?=
 =?utf-8?B?aGV5TjY5Y2I5clFUSjMxaldpd0xDTmtCUXJpMHpSR3dwcjJnWTlybXo3RnVH?=
 =?utf-8?B?Z0w0WVNMNkU3YWNPVDFicVhHLytRSTU2ZUNyMk1LeGU1UWw0Q1FWNkx5Z2dt?=
 =?utf-8?B?TG1UeFY4QlI2UXdsRlV6SlhOb1JKb0M3RzIxNkVOZ0p5UDBSSEVOWUs4Ynln?=
 =?utf-8?B?cXdtak1CbDNvbFVUZjJGNWY4aVNtWkI4bm1GR09VV1NXSTF2VCs2dmIwT1Aw?=
 =?utf-8?Q?JdargiWLOvQnEsVdpprV7Tk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063d6e5d-1aeb-4f6a-695b-08d9a09d810f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5182.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 20:47:38.7944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTlu4uVzfmIz2CMhIxWwmiy7ODwEdPBgeFaEYRbP/2DVWXri7fuv0IJMybyliArTHA/7Nvkq8ZZ7mqm699h6fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5495
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Just got bitten by this warning when trying to do some refactoring in 
amdgpu for trying to get rid of the DRM private object we use for our DC 
state.

 From a userspace perspective I understand that we want to avoid judder, 
-EBUSY and other issues affecting the compositor from kernel having to 
drag these CRTCs (or their planes) into the atomic state.

For bandwidth validation we need to understand the state of all CRTCs 
and planes in use. Existing driver code maintains this as part of a 
global state object in a DRM private atomic state. We have stalls in 
atomic check (bad) to avoid freeing this state or modifying it at the 
wrong times which avoid hitting this warning but essentially cause the 
same judder issue.

While most hardware has independent pipes, I think almost all hardware 
ends up having the memory interface/bandwidth as a global shared 
resource that software state can't really abstract around.

There are cases where we know that there will be no (or minimal) impact 
to the overall memory requirements for particular DRM updates. Our 
validation already "over-allocates" for common display changes - page 
flips, some format changes, cursor enable/disable. But for most cases 
outside of that we do want to pull in _all_ the CRTCs and planes.

On our HW you won't get a blankout unless you're actually modifying a 
stream timing itself so I think the ALLOW_MODESET flag is overkill here.

Rejecting the commit when the flag isn't set also ends up breaking 
userspace in the process since it expects commits like pageflips between 
different tiling modes to succeed with the legacy IOCTLs.

Any ideas about this? I missed the IRC discussion regarding this before 
so I'm not sure if we have any alternatives that were dropped in favor 
of this.

Regards,
Nicholas Kazlauskas

On 2020-09-25 4:46 a.m., Daniel Vetter wrote:
> When doing an atomic modeset with ALLOW_MODESET drivers are allowed to
> pull in arbitrary other resources, including CRTCs (e.g. when
> reconfiguring global resources).
> 
> But in nonblocking mode userspace has then no idea this happened,
> which can lead to spurious EBUSY calls, both:
> - when that other CRTC is currently busy doing a page_flip the
>    ALLOW_MODESET commit can fail with an EBUSY
> - on the other CRTC a normal atomic flip can fail with EBUSY because
>    of the additional commit inserted by the kernel without userspace's
>    knowledge
> 
> For blocking commits this isn't a problem, because everyone else will
> just block until all the CRTC are reconfigured. Only thing userspace
> can notice is the dropped frames without any reason for why frames got
> dropped.
> 
> Consensus is that we need new uapi to handle this properly, but no one
> has any idea what exactly the new uapi should look like. Since this
> has been shipping for years already compositors need to deal no matter
> what, so as a first step just try to enforce this across drivers
> better with some checks.
> 
> v2: Add comments and a WARN_ON to enforce this only when allowed - we
> don't want to silently convert page flips into blocking plane updates
> just because the driver is buggy.
> 
> v3: Fix inverted WARN_ON (Pekka).
> 
> v4: Drop the uapi changes, only add a WARN_ON for now to enforce some
> rules for drivers.
> 
> v5: Make the WARNING more informative (Daniel)
> 
> v6: Add unconditional debug output for compositor hackers to figure
> out what's going on when they get an EBUSY (Daniel)
> 
> v7: Fix up old/new_crtc_state confusion for real (Pekka/Ville)
> 
> References: https://lists.freedesktop.org/archives/dri-devel/2018-July/182281.html
> Bugzilla: https://gitlab.freedesktop.org/wayland/weston/-/issues/24#note_9568
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>   drivers/gpu/drm/drm_atomic.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 58527f151984..aac9122f1da2 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -281,6 +281,10 @@ EXPORT_SYMBOL(__drm_atomic_state_free);
>    * needed. It will also grab the relevant CRTC lock to make sure that the state
>    * is consistent.
>    *
> + * WARNING: Drivers may only add new CRTC states to a @state if
> + * drm_atomic_state.allow_modeset is set, or if it's a driver-internal commit
> + * not created by userspace through an IOCTL call.
> + *
>    * Returns:
>    *
>    * Either the allocated state or the error code encoded into the pointer. When
> @@ -1262,10 +1266,15 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>   	struct drm_crtc_state *new_crtc_state;
>   	struct drm_connector *conn;
>   	struct drm_connector_state *conn_state;
> +	unsigned requested_crtc = 0;
> +	unsigned affected_crtc = 0;
>   	int i, ret = 0;
>   
>   	DRM_DEBUG_ATOMIC("checking %p\n", state);
>   
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> +		requested_crtc |= drm_crtc_mask(crtc);
> +
>   	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>   		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
>   		if (ret) {
> @@ -1313,6 +1322,26 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>   		}
>   	}
>   
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> +		affected_crtc |= drm_crtc_mask(crtc);
> +
> +	/*
> +	 * For commits that allow modesets drivers can add other CRTCs to the
> +	 * atomic commit, e.g. when they need to reallocate global resources.
> +	 * This can cause spurious EBUSY, which robs compositors of a very
> +	 * effective sanity check for their drawing loop. Therefor only allow
> +	 * drivers to add unrelated CRTC states for modeset commits.
> +	 *
> +	 * FIXME: Should add affected_crtc mask to the ATOMIC IOCTL as an output
> +	 * so compositors know what's going on.
> +	 */
> +	if (affected_crtc != requested_crtc) {
> +		DRM_DEBUG_ATOMIC("driver added CRTC to commit: requested 0x%x, affected 0x%0x\n",
> +				 requested_crtc, affected_crtc);
> +		WARN(!state->allow_modeset, "adding CRTC not allowed without modesets: requested 0x%x, affected 0x%0x\n",
> +		     requested_crtc, affected_crtc);
> +	}
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_atomic_check_only);
> 

