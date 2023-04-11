Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCE76DD621
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 11:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5500710E50D;
	Tue, 11 Apr 2023 09:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716D810E50D;
 Tue, 11 Apr 2023 09:03:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwwniWI91XgmZ4U/X/mQumJauH55fp/jCwSmOL+m1/jm+jWcq+KUmQUz+cpi6y6Bsb6N5VNMNxixO21DjuAha90fQP4MxUJ3T9+tHXW7q9StE+xjkWB/3tSUioj6RfglUTD7hUNEOY4WePNLcc7xta1qGHTzYzmjEjYqVZaT0QrGiw83ivr2uzdwaLBPNrgAP1VJxsMahPIaqRMSreAglg0D4/2bRyfVQGlCljiz/AKYwHgZEfaCq3TAxHWtZSnSTi6Qb5DYT6oKdFfFO0JVI7uEvd+Wdo5bzUfElpgU2riHwv/ta0lieLevkuac4Cob22De4/2uAo+kT8TfN2p/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4imJnHRg1MY1LoesjUsCknXUhH+vc/ctvgddJbL2Bkc=;
 b=jRKpdel7n+Lhkz3T63hwLcIMvR/+SJkR+/fnY3qE5BS2YmtYykrWbgualV6rKb/Wfb0eDytQnmMBeNI1HzLNxARvsv0JAJYZxJln+6wZVmc1erz8By/wP3yW9JwJjm48H0xFuka6SaIyR2cPzTJl8AG3Cc2Tk5co2gGRiE8wWnkmn9lwjlGl5HDjFNWoJV8I/006MskjMOx1MZUEcgiF79lAsjA1MAjk3oGDC5KyvkZRYSiIh41dJ2yA5mfm0yBEDBfBFoznR5mRVqsVj7qnazHl5qre30YSBmWs0YmEV5siv1KHz+tXjXymd5iTC7ZPGwFXuQC2bj929ey5RAjIjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4imJnHRg1MY1LoesjUsCknXUhH+vc/ctvgddJbL2Bkc=;
 b=FS1P8f29HlnBiyoPGTvBBwvGHWgvycSEtkBMxrKz166GL3tjc+05XbWM/n/3Z6Hp8xQljAlOYP4bbRkGP6LNosGmKepfJAJOYR20nDZ0/fF/6CJ97mpCsDUfM0Ez4rDzNeG3AwJAd6vXdF5vAa/84hGZmIUI7drMumbgSqwgQCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB7514.namprd12.prod.outlook.com (2603:10b6:930:92::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 09:03:03 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 09:03:03 +0000
Message-ID: <ce82debe-127b-045d-26ac-7900b81ec36e@amd.com>
Date: Tue, 11 Apr 2023 11:02:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <SA1PR11MB69913F0A0038DA307701D44092939@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZCxnuCvmknUuLydM@DUT025-TGLU.fm.intel.com>
 <018b891d-ec31-b8c2-f987-45a204ed77ed@amd.com>
 <SA1PR11MB69918B99750334B368E196B992909@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZC3Dmno7s05/5VPN@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB699131A9F895F4A7AE28FEB492969@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR11MB699131A9F895F4A7AE28FEB492969@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: bc963934-48d5-4cf2-a4ac-08db3a6b8e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8gj2+8JkV10w07+joSNmCTgF0pWvp+CzMjTD+KaY+dt3BLfSsRljVqHQc2gNInB4c7fbb/5CuYtZcd1uTeyYG6W9DKY3Usl88T7AhrLBJS4epcUE0JGzEJWzRczwxzTB8ZcdtOvOs0Z88/ttb4y36BK1BSxUDHH8dP5MwoL7tErZDM+7GMM4L7ZfsFoITQQSYs0VLgY1P0ase1vEjFl42EUyuhRFKUP/RbQd/A0/W+u4OcedW+VirkM5jCNW9Ak8HEqS8OqfrSCfm61FnGYR9hRT8eqzjnNLjSrVyqNYwgcsHMjINMdylRs5w3Uxh9fB2sRmuTScUFEhm/XuD8yBSk2ZvywErd9nP81gj7D9H+kwEXgZVbLRRN5quIJLFXa77Wshve7ra0tjZOOEf3On6a/HiLq9c00k1e37tA+533XSeg1mm4yNtFgohEqgvybOi11fqzFUGr1LAuyAWth5WB6ZvQBTMFrkTHoea39KnSjE6dQl7LirjarsS2htq7uq9que+tF8nxb9tzZYGmhBYwhJteI28OVDtys6j9RgJS1pOuW9Lu3FSNbVVt7YnWDhfUvvaMYzzR+CkWx4B9tKdHucMfrCD4RuM8iXkcX93o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199021)(478600001)(6486002)(966005)(86362001)(8936002)(2616005)(83380400001)(5660300002)(4326008)(8676002)(66946007)(66556008)(30864003)(66476007)(7416002)(66574015)(31696002)(2906002)(36756003)(186003)(316002)(38100700002)(54906003)(26005)(6506007)(6512007)(53546011)(110136005)(6666004)(41300700001)(66899021)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajNJN0N2TEREUnUyM092dUV1YmNhcHFmMTNuT0hHUUhXNlVQaVluWGJna2Y1?=
 =?utf-8?B?T1hzQ0FoL3NvRTN5S2JIejZ6a2FYKzV2ZCsyUUVuTnRFZEZvRTZXR1VtT1Qw?=
 =?utf-8?B?czEreERBMjlpTDR3UlZTTzlSZC9IWnNiOWoxSmdZR3VJR3AxaUIzRGNseVRT?=
 =?utf-8?B?dDBOQmZSNjRIUml1V3dlKzhRekVFeU4rY0NINlErczJiUWtIS251N25LUHkw?=
 =?utf-8?B?TVJVdkljYzYyYkRpMS92Um8zYlI1TytrRmgvaU9PYVhHaHJKZVhwcUIyUmZQ?=
 =?utf-8?B?Vzh1b0hZRnRuU3N4aVNDQm84Q0VkZU1YTkg0YW9acENXZWVoQ1hwVXBYY2Yz?=
 =?utf-8?B?YlI5ZEJaVUhSZlY5c1VqYVRobUxRWHJhd1cwYW1JcGsvdmhabVlscnZCTkx2?=
 =?utf-8?B?UURCZW9lVzMyNlhvZWt0NFBQWFl3SWRBeUg1dUtlMkFkaENTckh6TzBUY1Mr?=
 =?utf-8?B?OG10bVJzRTRxbks1bUtyUldoei9GRk04c0wxUGcyZVhkQlErdG9nUnlmdzVT?=
 =?utf-8?B?T3k5a0F3WmY5SkxneWZ2ZmI2VFNzVzVTSzEvcU90YWI2VEpRQjBlZkdheGdH?=
 =?utf-8?B?MUVCQ0hnVEd3MWdjdXcrbjllZW5ZZ1FJbGN5K3BZc2xhc2NoY0xxSmlWQlJH?=
 =?utf-8?B?MnhFQlhNTGZmS1N2Z1NkTlRaWFFhOHd5VmRzeUN6WUNMaG5DSThFN1E2bEgv?=
 =?utf-8?B?SW9JV3daMGVXcTRNalhaaGRMcERqeVZaR3pjOEZVUkwvZ01XMWZ4VDJBUGVZ?=
 =?utf-8?B?Z1RxUjZoZjdKSFRtSzFGQXdrdEVWVkdWcFJoUTVhbXQ4cFBPVDBtNEV1RFFU?=
 =?utf-8?B?V3RyZFdaSkRCSFhWQmcyTTJWekljai9oNHV0MzdZc1NqeW1aY1UxdS9pbHFS?=
 =?utf-8?B?ZDhGRm0wYUUyeWVDK0dsRmpBN0dYVEdERkdWZmhYNlE5aXgyVkZHTXdLcWVT?=
 =?utf-8?B?VUpjMy9rVy9nV09VTktoMzRyd000bUxXL1RFRXhhYm0yM3N4WmhkeWtKMmx1?=
 =?utf-8?B?K3k4RXZUR1ZSUHo5c2dlWk9IdEJUbFIwZ0U0ZVAxSHRMaDF2eHg0V0hjVlE1?=
 =?utf-8?B?RjZQUytlYmZwMWNSQXhLblQyUmpzSFowRE5KdXdqTFlsdHdhZUtXNkxmRXRh?=
 =?utf-8?B?bUNyT1c5MGRMWEwvQ3QzckpVSnowWmg3RHh6bFZTWks2d1VWOFo0OXVldnV4?=
 =?utf-8?B?QmFVSHVsNVY4TlVQQWNOLzVkczVkNGE1L3Blc3EvdE81d05IUTJuS2U0bDJ6?=
 =?utf-8?B?QnhpamFoRDFZallQSHBESHBzRnZxWmtoWE0zRHE0RThEV2djV0NZTDVjUXlm?=
 =?utf-8?B?ekxrZWtNUEpJTE5JMWxzeERGcGF6NG5PS3ZvOFlMbEVxZ05qWDg5SnkvZHBW?=
 =?utf-8?B?RzkzbVZoWTBqRkRNWnhLQW9WUVoyVXVaUk5aTE1pVnlXYzRMek1UbjhBRHl2?=
 =?utf-8?B?WkJsSFVsdzVCQ3JvdGJEcFdhNTFYa1h3V2haZzczNWprNGhPMDNpOXRNbUFh?=
 =?utf-8?B?M21KS0Q5TDRZcEdyZ2tmKzNmMTRvcmkrVmw4YWNjK1ZORjNHUGRDSE9rYXFV?=
 =?utf-8?B?d243MkoxZm54S0IxQ21hWllZRzhFQzF0Q3pka2pLVEZxL2JMcGkrbkV1cDBL?=
 =?utf-8?B?MDJ4THBrLzFETkg1R212RkZEa2pTdlM2K0hTVDdIK2FFTVVmSk0wT2VadGMw?=
 =?utf-8?B?c3dBVUlVcGlMdXh2cWs5cnZ1alFRZXFFTGE3bTBmS0ZoSmdOeE9YVEdrZE1t?=
 =?utf-8?B?Ly9EdmQ5cXE4VTFvYVFYamwvY2krU0ZEbmdQSnpaNDJJZEoxMVVDTWF2Tklx?=
 =?utf-8?B?SE5XVTdGY1hmOHFnN3dWakdNcFFFUDIxN3ZqWlJXNlF1ZTYvYlJST0h2Ky9V?=
 =?utf-8?B?dTlUQzhvS1htVEhTV0gyQTk2N2tSOWdod0JNTmdrVS91T2lNeTNKK2JJS014?=
 =?utf-8?B?NTZyUmdxZ09qN2ZCQ1oydUFpb2NMVThBdERydVNDdFBXWmZmelM2STYrS3JH?=
 =?utf-8?B?Nms2ZXgvclBPbG5FSVRpTXBZNGNXTHhWczNGa2tmOTVHWk5yMkdvVng4bHUx?=
 =?utf-8?B?MXE4SmhTSFFUaVRvVVExWS9VYnhIbU5vN3RNL0tFVUdJSmJyMmkwd0N3TFVn?=
 =?utf-8?Q?o4+XSakqfogxl1OTqu4GU+sDT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc963934-48d5-4cf2-a4ac-08db3a6b8e7f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 09:03:03.1136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRIIImMi1G7mStu0m4hgAZjSEAnNBsoDwyfueCR/UTlKLg/xsLF/321HsLZIfex+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7514
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "lina@asahilina.net" <lina@asahilina.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The point is that this not only requires some work in the drm_scheduler, 
but rather it then makes only little sense to use the drm_scheduler in 
the first place.

The whole point of the drm_scheduler is to provide dma_fence 
implementation for the submitted jobs.

We also have dependency handling, but as Daniel and I said this can be 
easily extracted into a separate object/component.

Regards,
Christian.

Am 07.04.23 um 02:20 schrieb Zeng, Oak:
> So this series basically go with option 2. The part that option2 makes me uncomfortable is, dma-fence doesn't work for long running workload, why we generate it in the first place? As long as dma-fence is generated, it will become a source of confusion in the future. It doesn't matter how much you annotate it/document it. So if we decide to go with option2, the bottom line is, don't generate dma-fence for long running workload during job submission. This requires some rework in drm scheduler.
>
> The cleanest solution to me is option3. Dma-fence is a very old technology. When it was created, no gpu support page fault. Obviously this is not a good technology for modern gpu with page fault support. I think the best way is to create a new scheduler and dependency tracking mechanism works for both page fault enabled and page fault disabled context. I think this matches what Christian said below. Maybe nobody think this is easy?
>
> Thanks,
> Oak
>
>> -----Original Message-----
>> From: Brost, Matthew <matthew.brost@intel.com>
>> Sent: April 5, 2023 2:53 PM
>> To: Zeng, Oak <oak.zeng@intel.com>
>> Cc: Christian König <christian.koenig@amd.com>; Vetter, Daniel
>> <daniel.vetter@intel.com>; Thomas Hellström
>> <thomas.hellstrom@linux.intel.com>; dri-devel@lists.freedesktop.org; intel-
>> xe@lists.freedesktop.org; robdclark@chromium.org; airlied@linux.ie;
>> lina@asahilina.net; boris.brezillon@collabora.com; faith.ekstrand@collabora.com
>> Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload
>> plans
>>
>> On Wed, Apr 05, 2023 at 12:06:53PM -0600, Zeng, Oak wrote:
>>> Hi,
>>>
>>> Using dma-fence for completion/dependency tracking for long-run
>> workload(more precisely on-demand paging/page fault enabled workload) can
>> cause deadlock. This seems the significant issue here. Other issues such as the
>> drm scheduler completion order implication etc are minors which can be solve
>> inside the framework of drm scheduler. We need to evaluate below paths:
>>> 	1) still use drm scheduler for job submission, and use dma-fence for job
>> completion waiting/dependency tracking. This is solution proposed in this series.
>> Annotate dma-fence for long-run workload: user can still wait dma-fence for job
>> completion but can't wait dma-fence while holding any memory management
>> locks.  We still use dma-fence for dependency tracking. But it is just very easily
>> run into deadlock when on-demand paging is in the picture. The annotation helps
>> us to detect deadlock but not solve deadlock problems. Seems *not* a complete
>> solution: It is almost impossible to completely avoid dependency deadlock in
>> complex runtime environment
>> No one can wait on LR fence, so it is impossible to deadlock. The
>> annotations enforce this. Literally this is only for flow controling the
>> ring / hold pending jobs in in the DRM schedule list.
>>
>>> 	2) Still use drm scheduler but not use dma-fence for completion signaling
>> and dependency tracking. This way we still get some free functions (reset, err
>> handling ring flow control as Matt said)from drm scheduler, but push the
>> dependency/completion tracking completely to user space using techniques such
>> as user space fence. User space doesn't have chance to wait fence while holding
>> a kernel memory management lock, thus the dma-fence deadlock issue is solved.
>> We use user space fence for syncs.
>>
>>> 	3) Completely discard drm scheduler and dma-fence for long-run
>> workload. Use user queue/doorbell for super fast submission, directly interact
>> with fw scheduler. Use user fence for completion/dependency tracking.
>> This is a hard no from me, I want 1 submission path in Xe. Either we use
>> the DRM scheduler or we don't.
>>
>> Matt
>>
>>> Thanks,
>>> Oak
>>>
>>>> -----Original Message-----
>>>> From: Christian König <christian.koenig@amd.com>
>>>> Sent: April 5, 2023 3:30 AM
>>>> To: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
>>>> <oak.zeng@intel.com>
>>>> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
>>>> robdclark@chromium.org; thomas.hellstrom@linux.intel.com;
>> airlied@linux.ie;
>>>> lina@asahilina.net; boris.brezillon@collabora.com;
>> faith.ekstrand@collabora.com
>>>> Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload
>>>> plans
>>>>
>>>> Am 04.04.23 um 20:08 schrieb Matthew Brost:
>>>>> On Tue, Apr 04, 2023 at 12:02:03PM -0600, Zeng, Oak wrote:
>>>>>> Hi Matt, Thomas,
>>>>>>
>>>>>> Some very bold out of box thinking in this area:
>>>>>>
>>>>>> 1. so you want to use drm scheduler and dma-fence for long running
>> workload.
>>>> Why you want to do this in the first place? What is the benefit? Drm scheduler
>> is
>>>> pretty much a software scheduler. Modern gpu has scheduler built at fw/hw
>>>> level, as you said below for intel this is Guc. Can xe driver just directly submit
>> job
>>>> to Guc, bypassing drm scheduler?
>>>>> If we did that now we have 2 paths for dependency track, flow controling
>>>>> the ring, resets / error handling / backend submission implementations.
>>>>> We don't want this.
>>>> Well exactly that's the point: Why?
>>>>
>>>> As far as I can see that are two completely distinct use cases, so you
>>>> absolutely do want two completely distinct implementations for this.
>>>>
>>>>>> 2. using dma-fence for long run workload: I am well aware that page fault
>> (and
>>>> the consequent memory allocation/lock acquiring to fix the fault) can cause
>>>> deadlock for a dma-fence wait. But I am not convinced that dma-fence can't
>> be
>>>> used purely because the nature of the workload that it runs very long
>> (indefinite).
>>>> I did a math: the dma_fence_wait_timeout function's third param is the
>> timeout
>>>> which is a signed long type. If HZ is 1000, this is about 23 days. If 23 days is not
>> long
>>>> enough, can we just change the timeout parameter to signed 64 bits so it is
>> much
>>>> longer than our life time...
>>>>>> So I mainly argue we can't use dma-fence for long-run workload is not
>>>> because the workload runs very long, rather because of the fact that we use
>>>> page fault for long-run workload. If we enable page fault for short-run
>> workload,
>>>> we can't use dma-fence either. Page fault is the key thing here.
>>>>>> Now since we use page fault which is *fundamentally* controversial with
>>>> dma-fence design, why now just introduce a independent concept such as
>> user-
>>>> fence instead of extending existing dma-fence?
>>>>>> I like unified design. If drm scheduler, dma-fence can be extended to work
>> for
>>>> everything, it is beautiful. But seems we have some fundamental problem
>> here.
>>>>> Thomas's patches turn a dma-fence into KMD sync point (e.g. we just use
>>>>> the signal / CB infrastructure) and enforce we don't use use these
>>>>> dma-fences from the scheduler in memory reclaim paths or export these to
>>>>> user space or other drivers. Think of this mode as SW only fence.
>>>> Yeah and I truly think this is an really bad idea.
>>>>
>>>> The signal/CB infrastructure in the dma_fence turned out to be the
>>>> absolutely nightmare I initially predicted. Sorry to say that, but in
>>>> this case the "I've told you so" is appropriate in my opinion.
>>>>
>>>> If we need infrastructure for long running dependency tracking we should
>>>> encapsulate that in a new framework and not try to mangle the existing
>>>> code for something it was never intended for.
>>>>
>>>> Christian.
>>>>
>>>>> Matt
>>>>>
>>>>>> Thanks,
>>>>>> Oak
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>>>>>> Matthew Brost
>>>>>>> Sent: April 3, 2023 8:22 PM
>>>>>>> To: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>>>>>>> Cc: robdclark@chromium.org; thomas.hellstrom@linux.intel.com;
>>>> airlied@linux.ie;
>>>>>>> lina@asahilina.net; boris.brezillon@collabora.com; Brost, Matthew
>>>>>>> <matthew.brost@intel.com>; christian.koenig@amd.com;
>>>>>>> faith.ekstrand@collabora.com
>>>>>>> Subject: [RFC PATCH 00/10] Xe DRM scheduler and long running workload
>>>> plans
>>>>>>> Hello,
>>>>>>>
>>>>>>> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
>>>>>>> have been asked to merge our common DRM scheduler patches first as
>> well
>>>>>>> as develop a common solution for long running workloads with the DRM
>>>>>>> scheduler. This RFC series is our first attempt at doing this. We
>>>>>>> welcome any and all feedback.
>>>>>>>
>>>>>>> This can we thought of as 4 parts detailed below.
>>>>>>>
>>>>>>> - DRM scheduler changes for 1 to 1 relationship between scheduler and
>>>>>>> entity (patches 1-3)
>>>>>>>
>>>>>>> In Xe all of the scheduling of jobs is done by a firmware scheduler (the
>>>>>>> GuC) which is a new paradigm WRT to the DRM scheduler and presents
>>>>>>> severals problems as the DRM was originally designed to schedule jobs
>> on
>>>>>>> hardware queues. The main problem being that DRM scheduler expects
>> the
>>>>>>> submission order of jobs to be the completion order of jobs even across
>>>>>>> multiple entities. This assumption falls apart with a firmware scheduler
>>>>>>> as a firmware scheduler has no concept of jobs and jobs can complete
>> out
>>>>>>> of order. A novel solution for was originally thought of by Faith during
>>>>>>> the initial prototype of Xe, create a 1 to 1 relationship between scheduler
>>>>>>> and entity. I believe the AGX driver [3] is using this approach and
>>>>>>> Boris may use approach as well for the Mali driver [4].
>>>>>>>
>>>>>>> To support a 1 to 1 relationship we move the main execution function
>>>>>>> from a kthread to a work queue and add a new scheduling mode which
>>>>>>> bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
>>>>>>> The new scheduling mode should unify all drivers usage with a 1 to 1
>>>>>>> relationship and can be thought of as using scheduler as a dependency /
>>>>>>> infligt job tracker rather than a true scheduler.
>>>>>>>
>>>>>>> - Generic messaging interface for DRM scheduler
>>>>>>>
>>>>>>> Idea is to be able to communicate to the submission backend with in
>> band
>>>>>>> (relative to main execution function) messages. Messages are backend
>>>>>>> defined and flexable enough for any use case. In Xe we use these
>>>>>>> messages to clean up entites, set properties for entites, and suspend /
>>>>>>> resume execution of an entity [5]. I suspect other driver can leverage
>>>>>>> this messaging concept too as it a convenient way to avoid races in the
>>>>>>> backend.
>>>>>>>
>>>>>>> - Support for using TDR for all error paths of a scheduler / entity
>>>>>>>
>>>>>>> Fix a few races / bugs, add function to dynamically set the TDR timeout.
>>>>>>>
>>>>>>> - Annotate dma-fences for long running workloads.
>>>>>>>
>>>>>>> The idea here is to use dma-fences only as sync points within the
>>>>>>> scheduler and never export them for long running workloads. By
>>>>>>> annotating these fences as long running we ensure that these dma-
>> fences
>>>>>>> are never used in a way that breaks the dma-fence rules. A benefit of
>>>>>>> thus approach is the scheduler can still safely flow control the
>>>>>>> execution ring buffer via the job limit without breaking the dma-fence
>>>>>>> rules.
>>>>>>>
>>>>>>> Again this a first draft and looking forward to feedback.
>>>>>>>
>>>>>>> Enjoy - Matt
>>>>>>>
>>>>>>> [1] https://gitlab.freedesktop.org/drm/xe/kernel
>>>>>>> [2] https://patchwork.freedesktop.org/series/112188/
>>>>>>> [3] https://patchwork.freedesktop.org/series/114772/
>>>>>>> [4]
>> https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
>>>>>>> [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-
>>>>>>> next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
>>>>>>>
>>>>>>> Matthew Brost (8):
>>>>>>>     drm/sched: Convert drm scheduler to use a work queue rather than
>>>>>>>       kthread
>>>>>>>     drm/sched: Move schedule policy to scheduler / entity
>>>>>>>     drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling
>> policy
>>>>>>>     drm/sched: Add generic scheduler message interface
>>>>>>>     drm/sched: Start run wq before TDR in drm_sched_start
>>>>>>>     drm/sched: Submit job before starting TDR
>>>>>>>     drm/sched: Add helper to set TDR timeout
>>>>>>>     drm/syncobj: Warn on long running dma-fences
>>>>>>>
>>>>>>> Thomas Hellström (2):
>>>>>>>     dma-buf/dma-fence: Introduce long-running completion fences
>>>>>>>     drm/sched: Support long-running sched entities
>>>>>>>
>>>>>>>    drivers/dma-buf/dma-fence.c                 | 142 +++++++---
>>>>>>>    drivers/dma-buf/dma-resv.c                  |   5 +
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
>>>>>>>    drivers/gpu/drm/drm_syncobj.c               |   5 +-
>>>>>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
>>>>>>>    drivers/gpu/drm/lima/lima_sched.c           |   5 +-
>>>>>>>    drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
>>>>>>>    drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
>>>>>>>    drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
>>>>>>>    drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
>>>>>>>    drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
>>>>>>>    drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++--
>> ---
>>>>>>>    drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
>>>>>>>    include/drm/gpu_scheduler.h                 | 130 +++++++--
>>>>>>>    include/linux/dma-fence.h                   |  60 ++++-
>>>>>>>    16 files changed, 649 insertions(+), 184 deletions(-)
>>>>>>>
>>>>>>> --
>>>>>>> 2.34.1

