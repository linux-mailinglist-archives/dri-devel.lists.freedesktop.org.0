Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C7D569A0A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 07:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DE710E398;
	Thu,  7 Jul 2022 05:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81D310EB34;
 Thu,  7 Jul 2022 05:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657172920; x=1688708920;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=neGEHU50yc8y2Cq1JQUqvXoEs1/0B45ggjQ75mkZhc8=;
 b=fOkcrwjNnb0UazPBe8MDUcXByewBJCVdLtoyqxeDVGsOK96pUtyxPsLq
 rq8l1gn6eA4FeOnH6ZBJk6xP0Uvcjbx6annTV9xlKksj0/YbwaZ0MJvdj
 x2BHWxL3PG+H9Te8utPDRyg5+3lSXF8Tv8VkrcQvBv4nwoclttk8N3Ir/
 rltEJxmSRaqaYYU/zRv5t7EKa6KLFYepB6KngHR7lsdOePD1D3BYqiUoL
 O80/7+l0S42cp7oZcMHovXruyqhKb/6rPdPVqiDPLfNkF3C7D3vAtm7bw
 m9y89OhjD2NkGm+0oTj+wpR7xb4GEvlrtHAgo+kO9sqD9ftFSOOgQAeUQ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="281485416"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="281485416"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 22:48:40 -0700
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="920459758"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 22:48:40 -0700
Date: Wed, 6 Jul 2022 22:48:21 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC 02/10] drm/i915/vm_bind: Bind and unbind mappings
Message-ID: <20220707054821.GN14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-3-niranjana.vishwanathapura@intel.com>
 <8a21c7a72aeb74f80bd471496c3dcd7b6dcd1df1.camel@linux.intel.com>
 <YsY5xoqu3VdZhHfY@alfio.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsY5xoqu3VdZhHfY@alfio.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 paulo.r.zanoni@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.auld@intel.com,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 07, 2022 at 03:41:26AM +0200, Andi Shyti wrote:
>Hi,
>
>[...]
>
>> > @@ -28,7 +28,6 @@ static u32 object_max_page_size(struct
>> > intel_memory_region **placements,
>> >                 max_page_size = max_t(u32, max_page_size, mr-
>> > >min_page_size);
>> >         }
>> >  
>> > -       GEM_BUG_ON(!max_page_size);
>> >         return max_page_size;
>> >  }
>>
>> Should this change be separated out? It's not immediately clear to a
>> reviewer why it is included.
>
>no, it's not, indeed... and is it correct to assume that the
>default size is I915_GTT_PAGE_SIZE_4K?
>

Currently, supported minimum page sizes are either 4K or 64K.
So, we start with 4K as default and check if there is a bigger
min_page_size.

Niranjana

>[...]
>
>> > +#define assert_vm_bind_held(vm)   lockdep_assert_held(&(vm)-
>> > >vm_bind_lock)
>> > +
>> > +static inline void i915_gem_vm_bind_lock(struct i915_address_space
>> > *vm)
>> > +{
>> > +       mutex_lock(&vm->vm_bind_lock);
>> > +}
>> > +
>> > +static inline int
>> > +i915_gem_vm_bind_lock_interruptible(struct i915_address_space *vm)
>> > +{
>> > +       return mutex_lock_interruptible(&vm->vm_bind_lock);
>> > +}
>> > +
>> > +static inline void i915_gem_vm_bind_unlock(struct i915_address_space
>> > *vm)
>> > +{
>> > +       mutex_unlock(&vm->vm_bind_lock);
>> > +}
>> > +
>>
>> Kerneldoc for the inlines.
>
>do we really need these oneline wrappers?
>
>Andi
