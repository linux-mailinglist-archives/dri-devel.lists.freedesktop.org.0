Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D4C557E9E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 17:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD7810E41F;
	Thu, 23 Jun 2022 15:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8814610E41F;
 Thu, 23 Jun 2022 15:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655998284; x=1687534284;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sWKYpcg5/woUDih4PLncZFJ+ub2fa/KEo+aWVf93uoY=;
 b=mf56Z/PJyV7lKQlKJMpNLPd/NM1eUb5yhkxLaVyuq3YiEdQQtge8Obs4
 3BgzSLHWKohu9+CiQ4bLWoi/Pm++kQDvZkrTK8D5cWKZBpK7aZfQktZjl
 npRoLmSRwGM8GGu9iVZia7CNgCpVpWNaif4k94aMj9FNHuCdurvCdLdEI
 cyIMeZ14zPUb8emm0vT5JNEKAaVW5/ToDb+wb1KXmVk77W39O9x5lKI4E
 oQ9+oIfJEOnkyKJ5WLWIMMTmkBcxijphIKW1sTAOssEOEPSToTc1jD2Nm
 +wIj4FfOnZjt9MPu/kwMDXRefBRIUrWmgS32gBTuXVMCHSmyI+IWa42qp Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="269476197"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="269476197"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 08:31:23 -0700
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="563491889"
Received: from mlloyd-mobl1.amr.corp.intel.com (HELO [10.213.238.120])
 ([10.213.238.120])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 08:31:20 -0700
Message-ID: <ac9e3b86-64c5-9e89-7a9f-4249b918f5e0@intel.com>
Date: Thu, 23 Jun 2022 16:31:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v2 10/12] drm/i915/ttm: handle blitter failure on DG2
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220621104434.190962-1-matthew.auld@intel.com>
 <20220621104434.190962-11-matthew.auld@intel.com>
 <142c82a44dc1ea6ec1d501d783679c3a513282b5.camel@linux.intel.com>
 <27334c5e-6ee0-361a-cc93-9785f6c7136f@intel.com>
 <5c5eec72-1dfd-4f66-c162-1556aa51ec9e@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <5c5eec72-1dfd-4f66-c162-1556aa51ec9e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2022 15:52, Christian König wrote:
> Am 23.06.22 um 16:13 schrieb Matthew Auld:
>> [SNIP]
>>>> TTM_BO_VM_NUM_PREFAULT);
>>>> +               /*
>>>> +                * Ensure we check for any fatal errors if we had to
>>>> move/clear
>>>> +                * the object. The device should already be wedged if
>>>> we hit
>>>> +                * such an error.
>>>> +                */
>>>> +               if (i915_gem_object_wait_moving_fence(obj, true))
>>>> +                       ret = VM_FAULT_SIGBUS;
>>>
>>> We should check with Christian here whether it's ok to export
>>> ttm_bo_vm_fault_idle() as a helper, so that we release the proper locks
>>> while waiting. The above is not a bug, but causes us to wait for the
>>> moving fence under the mmap_lock, which is considered bad.
>>
>> Christian, any chance we can export ttm_bo_vm_fault_idle() for use 
>> here? Or is that NACK?
> 
> Well question is why you want to do this? E.g. what's the background?

Right, so basically we need to prevent userspace from being able to 
access the pages for the object, if the ttm blit/move hits an error 
(some kind of GPU error). Normally we can just fall back to 
memcpy/memset to ensure we never leak anything (i915 is never allowed to 
hand userspace non-zeroed memory even for VRAM), but with small-BAR 
systems this might not be possible. Anyway, if we do hit an error during 
the ttm move we might now mark the object as being in an "unknown state" 
before signalling the fence. Later when binding the GPU page-tables we 
check for the "unknown state" and skip the bind (it will end up just 
pointing to some scratch pages instead). And then here on the CPU side, 
we need to sync against all the kernel fences, before then checking for 
the potential "unknown state", which is then handled by returning SIBUS. 
The i915_gem_object_wait_moving_fence() is basically doing exactly that, 
but it looks dumb compared to what ttm_bo_vm_fault_idle() is doing. And 
then while all this going on we then also "wedge" the device to 
basically signal that it's busted, which should prevent further work 
being submitted to the gpu.

> 
> Regards,
> Christian.
