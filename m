Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C43225A778C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 09:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3771C10E214;
	Wed, 31 Aug 2022 07:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E3410E214;
 Wed, 31 Aug 2022 07:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661931242; x=1693467242;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vO3cJBtytltbG9KxG+8TuGCVJnjozDnp6tkaD0akGvg=;
 b=mpX5QdEYql8dGWfh/n8jkcd3DAmfQM/Dv3Uy2iJnHT+7oE5z/oENKbhe
 8/wFtwOSIpW2d0xWIHdmXb9oLXdy0G3t25aZsW7pkvfPwS+Xe4lsCw7Jw
 o5W9whgVXQX71p7nDtVZssHkpbXQAIySQfxZSlYqYRvqECHTPnEfDQgtu
 F5P2FS0PLTEA29cS9BZeVtgsd7f3oFHwzIQA7dWHqakMAKJXVFPZhBRmF
 IK0FoRBMXkhw5vN71GmaIYqbYYmoBC/4KDeuhGmaPQuJ6kbUYgBrEnRBe
 pBdXVpFw6Bxz1Tz4JQLzY+e/dPeIxSAZbn0VjIeAp0ZQEkX/HFXSVxr/1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="294134375"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="294134375"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 00:34:01 -0700
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="715608829"
Received: from rishidub-mobl.amr.corp.intel.com (HELO [10.209.163.109])
 ([10.209.163.109])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 00:34:00 -0700
Message-ID: <98d9b814-085f-1fea-3ad9-71609c4160c7@linux.intel.com>
Date: Wed, 31 Aug 2022 08:33:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [RFC PATCH v3 00/17] drm/i915/vm_bind: Add VM_BIND
 functionality
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220827194403.6495-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Ramalingam C <ramalingampc2008@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/08/2022 20:43, Andi Shyti wrote:
> Hi,
> 
> just sending the original Niranjana's patch as an RFC. It's v3 as
> the v2 has been reviewed offline with Ramalingam.
> 
> I'm still keeping most of the structure even though some further
> discussion can be done starting from here.
> 
> Copy pasting Niranjana's original cover letter message:
> 
> DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM
> buffer objects (BOs) or sections of a BOs at specified GPU virtual
> addresses on a specified address space (VM). Multiple mappings can map
> to the same physical pages of an object (aliasing). These mappings (also
> referred to as persistent mappings) will be persistent across multiple
> GPU submissions (execbuf calls) issued by the UMD, without user having
> to provide a list of all required mappings during each submission (as
> required by older execbuf mode).
> 
> This patch series support VM_BIND version 1, as described by the param
> I915_PARAM_VM_BIND_VERSION.
> 
> Add new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only works in
> vm_bind mode. The vm_bind mode only works with this new execbuf3 ioctl.
> The new execbuf3 ioctl will not have any execlist support and all the
> legacy support like relocations etc., are removed.

We should consider not overloading the term execlists when really 
talking about the array of struct gem_exec_object2. Before it gets too 
confusing. At least I assume that's what it is meant and eb3 is not 
intended to be used only with the GuC. Alternatively, correct me if I am 
wrong that the term is somehow already established and I did not realise.

Regards,

Tvrtko
