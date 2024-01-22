Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF370835C7B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 09:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A94110E608;
	Mon, 22 Jan 2024 08:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D42A10E0F1;
 Mon, 22 Jan 2024 08:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705911678; x=1737447678;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FVBaX7oX3ZXeuKl41U3j1aUapAEuIUw2DPdZJJaYcrs=;
 b=nl5vJgKqc0NWubJ5yGjsf1vNDkD+SNHg1sQQ3cpMPndFS00Z+hU8+tau
 EdTcNqjYT+l1THeEmJ6FFqYsVc/eXQ6sdwu5bLFAvuXwhylmJuazOSLnn
 J9p+1Hvs/0ztQ4yk1oG94lc77MwVbTp3FZE1kkXs5To5iMYrmaQzIeOnF
 lUKyfTEQ6tTdAweQD4j2q7rciTAvMlytwB7Qk9K4E3ZogSUAL4s/tc+wG
 Y9VeKlyWmq0MxdPeqVrKmrSKkZpXBwUx789AZK4/hO4/tzQQG795VJjCB
 mqyVl1MwB3C/MC1/U00SXiESsNtiYqsCXW2SgmcQeapcgSNDOz5FnuQxy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="465406232"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="465406232"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 00:21:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1103046"
Received: from mstribae-mobl.ger.corp.intel.com (HELO [10.249.254.89])
 ([10.249.254.89])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 00:21:15 -0800
Message-ID: <f0200e2e-51c5-4bd9-a633-2e6fdc52029c@linux.intel.com>
Date: Mon, 22 Jan 2024 09:21:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/exec, drm/gpuvm: Prefer u32 over uint32_t
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240119090557.6360-1-thomas.hellstrom@linux.intel.com>
 <vmyrgwkw7zi5f234cfhl6mzkphrpmsxvb7rpruv7xbc5wjkx4d@jkxky5kmd5c2>
 <8734utpcd7.fsf@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <8734utpcd7.fsf@intel.com>
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
Cc: Danilo Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/19/24 16:32, Jani Nikula wrote:
> On Fri, 19 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Fri, Jan 19, 2024 at 10:05:57AM +0100, Thomas Hellström wrote:
>>> The relatively recently introduced drm/exec utility was using uint32_t
>>> in its interface, which was then also carried over to drm/gpuvm.
>>>
>>> Prefer u32 in new code and update drm/exec and drm/gpuvm accordingly.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>> drivers/gpu/drm/drm_exec.c | 2 +-
>>> include/drm/drm_exec.h     | 4 ++--
>>> include/drm/drm_gpuvm.h    | 2 +-
>>> 3 files changed, 4 insertions(+), 4 deletions(-)
>>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> I was surprised we have quite a few places using the c99 types rather
>> than kernel types.
>>
>> $ git grep -ce uint[0-9][0-9]_t drivers/gpu/drm/*.c
>> drivers/gpu/drm/drm_atomic.c:1
>> drivers/gpu/drm/drm_atomic_helper.c:7
>> drivers/gpu/drm/drm_atomic_state_helper.c:1
>> drivers/gpu/drm/drm_atomic_uapi.c:17
>> drivers/gpu/drm/drm_color_mgmt.c:4
>> drivers/gpu/drm/drm_connector.c:6
>> drivers/gpu/drm/drm_crtc.c:3
>> drivers/gpu/drm/drm_damage_helper.c:2
>> drivers/gpu/drm/drm_debugfs_crc.c:1
>> drivers/gpu/drm/drm_exec.c:1
>> drivers/gpu/drm/drm_fb_helper.c:10
>> drivers/gpu/drm/drm_format_helper.c:6
>> drivers/gpu/drm/drm_fourcc.c:6
>> drivers/gpu/drm/drm_framebuffer.c:5
>> drivers/gpu/drm/drm_gem.c:1
>> drivers/gpu/drm/drm_gem_dma_helper.c:1
>> drivers/gpu/drm/drm_gem_shmem_helper.c:1
>> drivers/gpu/drm/drm_gem_ttm_helper.c:1
>> drivers/gpu/drm/drm_gem_vram_helper.c:5
>> drivers/gpu/drm/drm_lease.c:6
>> drivers/gpu/drm/drm_mipi_dbi.c:3
>> drivers/gpu/drm/drm_mode_config.c:4
>> drivers/gpu/drm/drm_mode_object.c:20
>> drivers/gpu/drm/drm_modeset_helper.c:1
>> drivers/gpu/drm/drm_modeset_lock.c:1
>> drivers/gpu/drm/drm_of.c:3
>> drivers/gpu/drm/drm_plane.c:35
>> drivers/gpu/drm/drm_plane_helper.c:2
>> drivers/gpu/drm/drm_prime.c:9
>> drivers/gpu/drm/drm_probe_helper.c:3
>> drivers/gpu/drm/drm_property.c:11
>> drivers/gpu/drm/drm_simple_kms_helper.c:4
>> drivers/gpu/drm/drm_syncobj.c:26
>>
>> but maybe not worth the churn for what is already there for a long time?

This originally dates back to around or slightly after when the drm code 
was a set of template headers with the objective of sharing code with 
some bsds, and then I guess it also leaked. The reason I sent this patch 
was I made a review comment of this for drm_gpuvm and then also promised 
to send a patch against drm_exec.

> Personally, I think the one time churn is worth it to unify and keep the
> codebase in kernel types only. This is basically what we did in i915
> years ago, and new c99 types don't really even creep in because there
> are zero examples around. It's natural to follow the style around you
> instead of mixing.

+1.

/Thomas


> BR,
> Jani.
>
>
