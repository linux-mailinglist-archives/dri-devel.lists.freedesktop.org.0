Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AF511EE6A
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 00:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF0F6EE08;
	Fri, 13 Dec 2019 23:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C116E039;
 Fri, 13 Dec 2019 23:24:36 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 15:24:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="297066984"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga001.jf.intel.com with ESMTP; 13 Dec 2019 15:24:35 -0800
Date: Fri, 13 Dec 2019 15:13:23 -0800
From: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [RFC v2 02/12] drm/i915/svm: Runtime (RT) allocator
 support
Message-ID: <20191213231322.GS14488@nvishwa1-DESK.sc.intel.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-3-niranjana.vishwanathapura@intel.com>
 <CAOFGe95rC8A4SuwWtd1tbikw8HGm-TU52_O8iBSJKpDyY0gWNw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOFGe95rC8A4SuwWtd1tbikw8HGm-TU52_O8iBSJKpDyY0gWNw@mail.gmail.com>
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
Cc: "Graunke, Kenneth W" <kenneth.w.graunke@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>, sanjay.k.kumar@intel.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason.ekstrand@intel.com>, dave.hansen@intel.com,
 jglisse@redhat.com, jgg@mellanox.com, Daniel Vetter <daniel.vetter@intel.com>,
 dan.j.williams@intel.com, ira.weiny@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 04:58:42PM -0600, Jason Ekstrand wrote:
>
>     +/**
>     + * struct drm_i915_gem_vm_bind
>     + *
>     + * Bind an object in a vm's page table.
>
>   First off, this is something I've wanted for a while for Vulkan, it's just
>   never made its way high enough up the priority list.  However, it's going
>   to have to come one way or another soon.  I'm glad to see kernel API for
>   this being proposed.
>   I do, however, have a few high-level comments/questions about the API:
>    1. In order to be useful for sparse memory support, the API has to go the
>   other way around so that it binds a VA range to a range within the BO.  It
>   also needs to be able to handle overlapping where two different VA ranges
>   may map to the same underlying bytes in the BO.  This likely means that
>   unbind needs to also take a VA range and only unbind that range.
>    2. If this is going to be useful for managing GL's address space where we
>   have lots of BOs, we probably want it to take a list of ranges so we
>   aren't making one ioctl for each thing we want to bind.

Hi Jason,

Yah, some of these requirements came up.
They are not being done here due to time and effort involved in defining
those requirements, implementing and validating.

However, this ioctl can be extended in a backward compatible way to handle
those requirements if required.

>    3. Why are there no ways to synchronize this with anything?  For binding,
>   this probably isn't really needed as long as the VA range you're binding
>   is empty.  However, if you want to move bindings around or unbind
>   something, the only option is to block in userspace and then call
>   bind/unbind.  This can be done but it means even more threads in the UMD
>   which is unpleasant.  One could argue that that's more or less what the
>   kernel is going to have to do so we may as well do it in userspace. 
>   However, I'm not 100% convinced that's true.
>   --Jason
>

Yah, that is the thought.
But as SVM feature evolves, I think we can consider handling some such cases
if hadling those in driver does make whole lot sense. 

Thanks,
Niranjana

>
>     + */
>     +struct drm_i915_gem_vm_bind {
>     +       /** VA start to bind **/
>     +       __u64 start;
>     +
>     +       /** Type of memory to [un]bind **/
>     +       __u32 type;
>     +#define I915_GEM_VM_BIND_SVM_OBJ      0
>     +
>     +       /** Object handle to [un]bind for I915_GEM_VM_BIND_SVM_OBJ type
>     **/
>     +       __u32 handle;
>     +
>     +       /** vm to [un]bind **/
>     +       __u32 vm_id;
>     +
>     +       /** Flags **/
>     +       __u32 flags;
>     +#define I915_GEM_VM_BIND_UNBIND      (1 << 0)
>     +#define I915_GEM_VM_BIND_READONLY    (1 << 1)
>     +};
>     +
>      #if defined(__cplusplus)
>      }
>      #endif
>     --
>     2.21.0.rc0.32.g243a4c7e27
>
>     _______________________________________________
>     Intel-gfx mailing list
>     Intel-gfx@lists.freedesktop.org
>     https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
