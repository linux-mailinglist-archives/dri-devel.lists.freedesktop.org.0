Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3FF6D9396
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 12:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A96510EB47;
	Thu,  6 Apr 2023 10:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A6C10EB47;
 Thu,  6 Apr 2023 10:04:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3i5phrzePZNuEkUijORSeDwJHPh2GhI3ROj3NDtVrHx11mCj30HUJWHXr5u/19YKZmG+G8gRWB8j8XI+XHCC/RqikdQ/CUds12WBkw5T1LcbmQJGXlS0qa0zoWSz5+phpDVVrh+fHlenQCJAbF3N0FEdXUyOVexjCxOzoZG2Sl0KAMAWJetmctWcuhgoKwE2OMaMokP4uEHvcrPUA6CgVKWqsqE8plW2Qzbc/O+UOPMFnd1LL/LS2S6zYoex65K/Myl7vY04a+aHP6iFQjDapR+xtPlgnLLS0knO/JfeKtWWjNwakAa4pJ/DcnHQRIkWeNhciDAu3zpaoH0LlWxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+d5pJhz2eAsKsoVfMMdjfhxJNPkCEs1umde5yaeBHXk=;
 b=Of0PcE16BYgSjxoeMxbLiaGKLCzD04GYA3YLeLujwF0KPg2vtDFRWJY9Gfwp2WCJ51AmbK2n2xjXoQkfrqUiH0iUOFQOfpedRP6c8PUOMwEoDKoNqEofrdNDzv0unV2SqeDW+2xGtC4Ld996YLfn7YRdINlsV9d9W5cMa2LwLSisogW28QvXXdJa2bQDbsPoE4GyUxNHZ2zr60nLpJ/IEeBIWWvOkdJ8Lq8InWJCfdTvOhG4U0vAoxhVHrxkU8T62DLxrv/nW6WYIG90cTXUfEmVZs5XS7QXmec3RhgIAiTvnufEO16bugSopSdwGKHkC8ARpjZ24LbhBtqN3IU4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+d5pJhz2eAsKsoVfMMdjfhxJNPkCEs1umde5yaeBHXk=;
 b=AKugFdrulEKNmOIc4xIrZWIE576rAu47aKOrEVsqxx22AUbx7YA2o5l6X+6QkyUkPGWFKSBd/FDPAtO4G0sCzcIJ6PB4jg2r28mmX2NbZahybl40glsTbKtatz1EDfyNMOUtuWtuBE9uC64k1pC7djW+hgTCWPyeeARQo3Hw/cI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 10:04:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 10:04:54 +0000
Message-ID: <6f39576e-1e62-bd97-643a-a6de01af5ca7@amd.com>
Date: Thu, 6 Apr 2023 12:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, "Zeng, Oak" <oak.zeng@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <SA1PR11MB69913F0A0038DA307701D44092939@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZCxnuCvmknUuLydM@DUT025-TGLU.fm.intel.com>
 <018b891d-ec31-b8c2-f987-45a204ed77ed@amd.com>
 <SA1PR11MB69918B99750334B368E196B992909@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZC3Dmno7s05/5VPN@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZC3Dmno7s05/5VPN@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dcc9678-4560-4cc8-942a-08db36865eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sApvXvjx85XYl8i9YZJdg4WDrfh29Npp2Kut5XeWD28rfDlZA7wNBr5y3q0yoA28RXPObtDGnh2u8FpNW3j+YNSlZEGW9RKjnaZR836SuPWxUs6br8DfSbl9lONPWyQyYZYqvrvyRvST/fbD64mbcvXBOesWWX7Fot3dAkwbCDw1leEwDzokvvbCad4V4fvA1mBPPobGJFPCvk5XuEE1ZUyQy1BImReloAwWSHm/TFST7x5dR/LMmcqujW4sYxyEpDTTyb0Pk66ONb1zkwPXPfNlx/igBXZdtXULVb3ccbGs2ybsWOgPL6Xvn4iBq4EutjzIYyz4PIsaghYuQtYWrWqT5PZ6+KtJ7cKs1GRkB71fSFRe2nbVfwnLW8frlWKux1d3NO0ZVBktlloXuSXBBlmpBhxyv61A3xPciGysIMccloRLqWowg/snJM1S6BmqplEwhs+WqRmSFi4OkemenutVGOOnk8WB38WBXC7KaN1qSXx9Urw2RBdn43I9m6s1uNfRYiC4nq9axTHz2UNhETkzut2tT3284H5S+Llqh3V905UUPg5/TRFQk9npZYYL1iQJs/s5iUhXIQuzpkKvc7LuOkmYoPJIuwAs9iLPfio=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(31686004)(66899021)(6666004)(316002)(4326008)(966005)(110136005)(6486002)(54906003)(66946007)(41300700001)(66476007)(66556008)(86362001)(31696002)(36756003)(2616005)(6506007)(66574015)(83380400001)(26005)(8936002)(30864003)(5660300002)(53546011)(186003)(8676002)(478600001)(6512007)(38100700002)(2906002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b293M0tFeHpsQlZMNTFWRERmMGY0UUl3TGVPTnhCdEJSS0Irc2puSXJVdmlY?=
 =?utf-8?B?QVkyU3psK3M2TGhySk04Z0pEbVJzU2F0bzE2Y3QxOC9yQ3c1YWpucHB5THpv?=
 =?utf-8?B?ZUFvVFo2MlRJZlRPWTB2UkFBM2hlbWRlZTdnR2w3UzhhMTZIOVdNdEdXTGlk?=
 =?utf-8?B?Sit6WDk5REVxYjBJU21BRXdUd2xpQVBQTGpNMk03bDZOSDRYclBHZ1ZVTjJD?=
 =?utf-8?B?TEYyS3hIeDgzSDFBOTU5TWZzcnVBZEVUWUlNMEdNVXh2Nzljb3RDSTk2b0dL?=
 =?utf-8?B?ejVqY1VIbVZUUU1PMnBFUU9ibDZPZjRudTM1ZXpDZkVhOHQzc3lvaVVNbnZS?=
 =?utf-8?B?aU1GM0wxUGRCYjFwMzYxNXQyQ0FTN3BaUm8yeXkyMUpWNTgxMkx3UHloVTAy?=
 =?utf-8?B?bmFhTFh2Zk1MME13QmFORlYzTGg5Y1A5UDQ4U0lBaEpQY1M0aitrdzhJQy9K?=
 =?utf-8?B?ZkxQNERiUDJydU9tVEcrbE0xWHMyaTFlM3U2ZVVQMGJOdHJHNWRaWEMyTHFr?=
 =?utf-8?B?eDM3Nm1kL1JITE1sYnZSdUl4SHN5S1dXbVVZY01sczNRdmp2WWplSTg4TnE1?=
 =?utf-8?B?azRnTGtxay9OMHBlRGdtUWwvY25ac2czMHFSYXp0YzM3RmxHRFgxMW1qMmla?=
 =?utf-8?B?VWJRNEpsYXFBUDFDNlhIaEh2UjN1cFhWM0dZemI3TTRFQW5mZDN0R3lZK0Rr?=
 =?utf-8?B?QVdPWWVZcU9jL2UydHlhWmpma1owa0E0MVNtb2RRQkFzTGFiWkRuZXNtN2xi?=
 =?utf-8?B?LzNVTW9tSk9jRzJRenVsS0poQWFqMHZpMkhoVXYraWkxUk5lbXRnUkV1TXY3?=
 =?utf-8?B?emd1RUVkM1FCeXJCV1RHRGZDUytDUDIwUUlLYWxOcXl1ZlJ1OVVMRmVreXQw?=
 =?utf-8?B?NHFTRGpkTFRZc0RoUHJvMU1OMStHOS81QzR1SWlETThPSUoxZHRnQ2l3bTFI?=
 =?utf-8?B?OVQzcm5TaWR5VzVHUmpwREVyUXR3eGJBS2gzb3FpTmZpaTQyNkFJWHJvZUNT?=
 =?utf-8?B?azJuSEFSQjUzQ0ZwcjY2cUtRRjJWc0VuM0loS3BybXkzSnFhUG9SdEdEejhk?=
 =?utf-8?B?aW9hamJpSWhKU3FYTlJsaEZCTUpsdlltSHlDeUJYUlNibzlHTDlqN2FMR3du?=
 =?utf-8?B?MlFmMVhuVGVJNUVKaHZUcjhYWDA0TTZsaUJsTFdDeVo4WmltN2ZGc3lCZjls?=
 =?utf-8?B?Qnk1cG55T0hxV3VCMEpDeVBTM3lmeGlJMnEvR0xXaHlLZ3VRNldMbTVoVFdQ?=
 =?utf-8?B?T1hDS1Z3MkNXYVhjVFJlVTB3UG5FaXkxdGphaHZabXl3UDRuTUhGaHFtcVlC?=
 =?utf-8?B?bjdlMVUzaklMb1BJWDdVVUVCS3BVR2lnVkdMa2NFaWhnbmxrWEJBUkpTYkQ5?=
 =?utf-8?B?TU9kK1VhOHJ2bVdLam5IVmVjYVllbmIza0U0YWlxT29OQThoYlA2a0VjNi93?=
 =?utf-8?B?NlkzS09zd3pjWDlwalNhYWY2OFpRc2xHU3FSSmI1V0pEMk5uZzVuR3V4WmJx?=
 =?utf-8?B?NEZ3YS82eHc2bjJuUExBMU9HK2tkWnNJWTVTZ3dwUzZLL3k2NEdaY3VpM3Nm?=
 =?utf-8?B?NW5MVlBSRlJHZ2ZISUorTkVlT2lKWEZ6cFJtVlJVQi9PTzROVXc5UmtWUitE?=
 =?utf-8?B?T1h0MUZFaE4rbE9oMUhlUkdrQ0tZd2tBUEsyT1hRVTJ3aGU5c1lleThLalhh?=
 =?utf-8?B?R3hyT0JEY1JKajJlQmx3WVk0b2gxUFZheTZWTDcyU1FiOGdlblc4T1hYOGhJ?=
 =?utf-8?B?OCs5QkU5Y2JrL1VObFpqMXY2VlQ3cWFHeDhsM3dRbUp2cEZaTUI3Z3FTbjZV?=
 =?utf-8?B?OUtlWTdna2FZejZuMVFxMmpMUVlXMFJidjhiaTl6dXU1clpwbkpuOUJ0V3ZH?=
 =?utf-8?B?REZQdzFLdFkzVGVSQm5iQ0M2cXZHNEkxR0M2Z3ZISzVOZmttMkJPYnpwZDY1?=
 =?utf-8?B?NVhBakc2VkE2c1lpRFY0bjZnN1p3cmJjdEhBNzZnQTNGMjkvaUh2NUI5ODZR?=
 =?utf-8?B?a29ETEpVS2d5bVFBbkN3SVpxU3B5M1gvZmFIYzBSQlVROXlSQklteHloTFVy?=
 =?utf-8?B?b2xhclpsVjg2R29Vc2ZIblczRDJIODZIQW1iUDhXVzRyUXUrU25jSSt0Rkpy?=
 =?utf-8?Q?wFKrQHai/lNNr/1aKJ3ajcw9J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dcc9678-4560-4cc8-942a-08db36865eaa
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 10:04:54.6015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alTkrQZb54nLhl/FAvWDxKLzaf3oCAPKrQ5tf9/Lhdkg2sP4h/ZZVXvYpDAFHBlk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6051
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

Am 05.04.23 um 20:53 schrieb Matthew Brost:
> On Wed, Apr 05, 2023 at 12:06:53PM -0600, Zeng, Oak wrote:
>> Hi,
>>
>> Using dma-fence for completion/dependency tracking for long-run workload(more precisely on-demand paging/page fault enabled workload) can cause deadlock. This seems the significant issue here. Other issues such as the drm scheduler completion order implication etc are minors which can be solve inside the framework of drm scheduler. We need to evaluate below paths:
>>
>> 	1) still use drm scheduler for job submission, and use dma-fence for job completion waiting/dependency tracking. This is solution proposed in this series. Annotate dma-fence for long-run workload: user can still wait dma-fence for job completion but can't wait dma-fence while holding any memory management locks.  We still use dma-fence for dependency tracking. But it is just very easily run into deadlock when on-demand paging is in the picture. The annotation helps us to detect deadlock but not solve deadlock problems. Seems *not* a complete solution: It is almost impossible to completely avoid dependency deadlock in complex runtime environment
>>
> No one can wait on LR fence, so it is impossible to deadlock. The
> annotations enforce this. Literally this is only for flow controling the
> ring / hold pending jobs in in the DRM schedule list.

You can still have someone depend on the LR fence and cause a deadlock 
without waiting on it.

See my attempted solution to this problem. It tries to inherit the LR 
flag of a fence when something depended on it.

For example if you create a fence container and one of the fences inside 
the container is a LR fence then the container itself would be an LR 
fence as well.

>> 	2) Still use drm scheduler but not use dma-fence for completion signaling and dependency tracking. This way we still get some free functions (reset, err handling ring flow control as Matt said)from drm scheduler, but push the dependency/completion tracking completely to user space using techniques such as user space fence. User space doesn't have chance to wait fence while holding a kernel memory management lock, thus the dma-fence deadlock issue is solved.
>>
> We use user space fence for syncs.
>
>> 	3) Completely discard drm scheduler and dma-fence for long-run workload. Use user queue/doorbell for super fast submission, directly interact with fw scheduler. Use user fence for completion/dependency tracking.
>>
> This is a hard no from me, I want 1 submission path in Xe. Either we use
> the DRM scheduler or we don't.

Well I don't think that this will be acceptable. Especially if you not 
only have long running submission, but things like page faults/HMM in 
those jobs.

Regards,
Christian.

>
> Matt
>
>> Thanks,
>> Oak
>>
>>> -----Original Message-----
>>> From: Christian König <christian.koenig@amd.com>
>>> Sent: April 5, 2023 3:30 AM
>>> To: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
>>> <oak.zeng@intel.com>
>>> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
>>> robdclark@chromium.org; thomas.hellstrom@linux.intel.com; airlied@linux.ie;
>>> lina@asahilina.net; boris.brezillon@collabora.com; faith.ekstrand@collabora.com
>>> Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload
>>> plans
>>>
>>> Am 04.04.23 um 20:08 schrieb Matthew Brost:
>>>> On Tue, Apr 04, 2023 at 12:02:03PM -0600, Zeng, Oak wrote:
>>>>> Hi Matt, Thomas,
>>>>>
>>>>> Some very bold out of box thinking in this area:
>>>>>
>>>>> 1. so you want to use drm scheduler and dma-fence for long running workload.
>>> Why you want to do this in the first place? What is the benefit? Drm scheduler is
>>> pretty much a software scheduler. Modern gpu has scheduler built at fw/hw
>>> level, as you said below for intel this is Guc. Can xe driver just directly submit job
>>> to Guc, bypassing drm scheduler?
>>>> If we did that now we have 2 paths for dependency track, flow controling
>>>> the ring, resets / error handling / backend submission implementations.
>>>> We don't want this.
>>> Well exactly that's the point: Why?
>>>
>>> As far as I can see that are two completely distinct use cases, so you
>>> absolutely do want two completely distinct implementations for this.
>>>
>>>>> 2. using dma-fence for long run workload: I am well aware that page fault (and
>>> the consequent memory allocation/lock acquiring to fix the fault) can cause
>>> deadlock for a dma-fence wait. But I am not convinced that dma-fence can't be
>>> used purely because the nature of the workload that it runs very long (indefinite).
>>> I did a math: the dma_fence_wait_timeout function's third param is the timeout
>>> which is a signed long type. If HZ is 1000, this is about 23 days. If 23 days is not long
>>> enough, can we just change the timeout parameter to signed 64 bits so it is much
>>> longer than our life time...
>>>>> So I mainly argue we can't use dma-fence for long-run workload is not
>>> because the workload runs very long, rather because of the fact that we use
>>> page fault for long-run workload. If we enable page fault for short-run workload,
>>> we can't use dma-fence either. Page fault is the key thing here.
>>>>> Now since we use page fault which is *fundamentally* controversial with
>>> dma-fence design, why now just introduce a independent concept such as user-
>>> fence instead of extending existing dma-fence?
>>>>> I like unified design. If drm scheduler, dma-fence can be extended to work for
>>> everything, it is beautiful. But seems we have some fundamental problem here.
>>>> Thomas's patches turn a dma-fence into KMD sync point (e.g. we just use
>>>> the signal / CB infrastructure) and enforce we don't use use these
>>>> dma-fences from the scheduler in memory reclaim paths or export these to
>>>> user space or other drivers. Think of this mode as SW only fence.
>>> Yeah and I truly think this is an really bad idea.
>>>
>>> The signal/CB infrastructure in the dma_fence turned out to be the
>>> absolutely nightmare I initially predicted. Sorry to say that, but in
>>> this case the "I've told you so" is appropriate in my opinion.
>>>
>>> If we need infrastructure for long running dependency tracking we should
>>> encapsulate that in a new framework and not try to mangle the existing
>>> code for something it was never intended for.
>>>
>>> Christian.
>>>
>>>> Matt
>>>>
>>>>> Thanks,
>>>>> Oak
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>>>>> Matthew Brost
>>>>>> Sent: April 3, 2023 8:22 PM
>>>>>> To: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>>>>>> Cc: robdclark@chromium.org; thomas.hellstrom@linux.intel.com;
>>> airlied@linux.ie;
>>>>>> lina@asahilina.net; boris.brezillon@collabora.com; Brost, Matthew
>>>>>> <matthew.brost@intel.com>; christian.koenig@amd.com;
>>>>>> faith.ekstrand@collabora.com
>>>>>> Subject: [RFC PATCH 00/10] Xe DRM scheduler and long running workload
>>> plans
>>>>>> Hello,
>>>>>>
>>>>>> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
>>>>>> have been asked to merge our common DRM scheduler patches first as well
>>>>>> as develop a common solution for long running workloads with the DRM
>>>>>> scheduler. This RFC series is our first attempt at doing this. We
>>>>>> welcome any and all feedback.
>>>>>>
>>>>>> This can we thought of as 4 parts detailed below.
>>>>>>
>>>>>> - DRM scheduler changes for 1 to 1 relationship between scheduler and
>>>>>> entity (patches 1-3)
>>>>>>
>>>>>> In Xe all of the scheduling of jobs is done by a firmware scheduler (the
>>>>>> GuC) which is a new paradigm WRT to the DRM scheduler and presents
>>>>>> severals problems as the DRM was originally designed to schedule jobs on
>>>>>> hardware queues. The main problem being that DRM scheduler expects the
>>>>>> submission order of jobs to be the completion order of jobs even across
>>>>>> multiple entities. This assumption falls apart with a firmware scheduler
>>>>>> as a firmware scheduler has no concept of jobs and jobs can complete out
>>>>>> of order. A novel solution for was originally thought of by Faith during
>>>>>> the initial prototype of Xe, create a 1 to 1 relationship between scheduler
>>>>>> and entity. I believe the AGX driver [3] is using this approach and
>>>>>> Boris may use approach as well for the Mali driver [4].
>>>>>>
>>>>>> To support a 1 to 1 relationship we move the main execution function
>>>>>> from a kthread to a work queue and add a new scheduling mode which
>>>>>> bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
>>>>>> The new scheduling mode should unify all drivers usage with a 1 to 1
>>>>>> relationship and can be thought of as using scheduler as a dependency /
>>>>>> infligt job tracker rather than a true scheduler.
>>>>>>
>>>>>> - Generic messaging interface for DRM scheduler
>>>>>>
>>>>>> Idea is to be able to communicate to the submission backend with in band
>>>>>> (relative to main execution function) messages. Messages are backend
>>>>>> defined and flexable enough for any use case. In Xe we use these
>>>>>> messages to clean up entites, set properties for entites, and suspend /
>>>>>> resume execution of an entity [5]. I suspect other driver can leverage
>>>>>> this messaging concept too as it a convenient way to avoid races in the
>>>>>> backend.
>>>>>>
>>>>>> - Support for using TDR for all error paths of a scheduler / entity
>>>>>>
>>>>>> Fix a few races / bugs, add function to dynamically set the TDR timeout.
>>>>>>
>>>>>> - Annotate dma-fences for long running workloads.
>>>>>>
>>>>>> The idea here is to use dma-fences only as sync points within the
>>>>>> scheduler and never export them for long running workloads. By
>>>>>> annotating these fences as long running we ensure that these dma-fences
>>>>>> are never used in a way that breaks the dma-fence rules. A benefit of
>>>>>> thus approach is the scheduler can still safely flow control the
>>>>>> execution ring buffer via the job limit without breaking the dma-fence
>>>>>> rules.
>>>>>>
>>>>>> Again this a first draft and looking forward to feedback.
>>>>>>
>>>>>> Enjoy - Matt
>>>>>>
>>>>>> [1] https://gitlab.freedesktop.org/drm/xe/kernel
>>>>>> [2] https://patchwork.freedesktop.org/series/112188/
>>>>>> [3] https://patchwork.freedesktop.org/series/114772/
>>>>>> [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
>>>>>> [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-
>>>>>> next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
>>>>>>
>>>>>> Matthew Brost (8):
>>>>>>     drm/sched: Convert drm scheduler to use a work queue rather than
>>>>>>       kthread
>>>>>>     drm/sched: Move schedule policy to scheduler / entity
>>>>>>     drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>>>>>>     drm/sched: Add generic scheduler message interface
>>>>>>     drm/sched: Start run wq before TDR in drm_sched_start
>>>>>>     drm/sched: Submit job before starting TDR
>>>>>>     drm/sched: Add helper to set TDR timeout
>>>>>>     drm/syncobj: Warn on long running dma-fences
>>>>>>
>>>>>> Thomas Hellström (2):
>>>>>>     dma-buf/dma-fence: Introduce long-running completion fences
>>>>>>     drm/sched: Support long-running sched entities
>>>>>>
>>>>>>    drivers/dma-buf/dma-fence.c                 | 142 +++++++---
>>>>>>    drivers/dma-buf/dma-resv.c                  |   5 +
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
>>>>>>    drivers/gpu/drm/drm_syncobj.c               |   5 +-
>>>>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
>>>>>>    drivers/gpu/drm/lima/lima_sched.c           |   5 +-
>>>>>>    drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
>>>>>>    drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
>>>>>>    drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
>>>>>>    drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
>>>>>>    drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
>>>>>>    drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
>>>>>>    drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
>>>>>>    include/drm/gpu_scheduler.h                 | 130 +++++++--
>>>>>>    include/linux/dma-fence.h                   |  60 ++++-
>>>>>>    16 files changed, 649 insertions(+), 184 deletions(-)
>>>>>>
>>>>>> --
>>>>>> 2.34.1

