Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4CF1257D4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 00:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19306EAA4;
	Wed, 18 Dec 2019 23:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23956EAA3;
 Wed, 18 Dec 2019 23:37:07 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 15:37:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="365891487"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga004.jf.intel.com with ESMTP; 18 Dec 2019 15:37:06 -0800
Date: Wed, 18 Dec 2019 15:25:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [RFC v2 02/12] drm/i915/svm: Runtime (RT) allocator
 support
Message-ID: <20191218232557.GD17413@nvishwa1-DESK.sc.intel.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-3-niranjana.vishwanathapura@intel.com>
 <CAOFGe95rC8A4SuwWtd1tbikw8HGm-TU52_O8iBSJKpDyY0gWNw@mail.gmail.com>
 <20191213231322.GS14488@nvishwa1-DESK.sc.intel.com>
 <CAOFGe97yh5CGTwoP-f3wRGWoTLuWMvMwYFc5Hx3KOkT9XkOxkw@mail.gmail.com>
 <157631949753.7535.12359359451927943176@skylake-alporthouse-com>
 <20191216041326.GT14488@nvishwa1-DESK.sc.intel.com>
 <CAOFGe94gcWzbizCO9N1DmV-2joXwUF-ri5f7=PTg-VJuQ9Ljtg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOFGe94gcWzbizCO9N1DmV-2joXwUF-ri5f7=PTg-VJuQ9Ljtg@mail.gmail.com>
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

On Tue, Dec 17, 2019 at 12:01:26PM -0600, Jason Ekstrand wrote:
>   On Sun, Dec 15, 2019 at 10:24 PM Niranjan Vishwanathapura
>   <niranjana.vishwanathapura@intel.com> wrote:
>
>     On Sat, Dec 14, 2019 at 10:31:37AM +0000, Chris Wilson wrote:
>     >Quoting Jason Ekstrand (2019-12-14 00:36:19)
>     >> On Fri, Dec 13, 2019 at 5:24 PM Niranjan Vishwanathapura <
>     >> niranjana.vishwanathapura@intel.com> wrote:
>     >>
>     >>     On Fri, Dec 13, 2019 at 04:58:42PM -0600, Jason Ekstrand wrote:
>     >>     >
>     >>     >     +/**
>     >>     >     + * struct drm_i915_gem_vm_bind
>     >>     >     + *
>     >>     >     + * Bind an object in a vm's page table.
>     >>     >
>     >>     >   First off, this is something I've wanted for a while for
>     Vulkan, it's
>     >>     just
>     >>     >   never made its way high enough up the priority list. 
>     However, it's
>     >>     going
>     >>     >   to have to come one way or another soon.  I'm glad to see
>     kernel API
>     >>     for
>     >>     >   this being proposed.
>     >>     >   I do, however, have a few high-level comments/questions about
>     the API:
>     >>     >    1. In order to be useful for sparse memory support, the API
>     has to go
>     >>     the
>     >>     >   other way around so that it binds a VA range to a range
>     within the BO. 
>     >>     It
>     >>     >   also needs to be able to handle overlapping where two
>     different VA
>     >>     ranges
>     >>     >   may map to the same underlying bytes in the BO.  This likely
>     means that
>     >>     >   unbind needs to also take a VA range and only unbind that
>     range.
>     >>     >    2. If this is going to be useful for managing GL's address
>     space where
>     >>     we
>     >>     >   have lots of BOs, we probably want it to take a list of
>     ranges so we
>     >>     >   aren't making one ioctl for each thing we want to bind.
>     >>
>     >>     Hi Jason,
>     >>
>     >>     Yah, some of these requirements came up.
>     >>
>     >>  
>     >> Yes, I have raised them every single time an API like this has come
>     across my
>     >> e-mail inbox for years and they continue to get ignored.  Why are we
>     landing an
>     >> API that we know isn't the API we want especially when it's pretty
>     obvious
>     >> roughly what the API we want is?  It may be less time in the short
>     term, but
>     >> long-term it means two ioctls and two implementations in i915, IGT
>     tests for
>     >> both code paths, and code in all UMDs to call one or the other
>     depending on
>     >> what kernel you're running on, and we have to maintain all that code
>     going
>     >> forward forever.  Sure, that's a price we pay today for a variety of
>     things but
>     >> that's because they all seemed like the right thing at the time. 
>     Landing the
>     >> wrong API when we know it's the wrong API seems foolish.
>     >
>     >Exactly. This is not even close to the uAPI we need. Reposting an RFC
>     >without taking in the concerns last time (or the time before that, or
>     >the time before that...) suggests that you aren't really requesting for
>     >comments at all.
>
>     Thanks Jason for detailed exlanation.
>     Chris, all comments and guidance are much appreciated :)
>
>     I haven't looked in detail, but my concern is that implementing
>     partial object binding (offset, lenght) from vma down to [un]binding
>     in ppgtt might be a lot of work to include in this SVM patch series.
>     I believe we need the partial object binding in non-SVM scenario
>     as well?
>
>   Yes, the Vulkan APIs require both partial binding and aliasing.
>   It may be worth pointing out that we're already doing some of this stuff
>   today, although in a rather backwards way.  Our non-softpin model for
>   Vulkan uses a memfd which we then map in userspace and turn into a BO via
>   userptr.  Due to the way we handle threading in the driver, we end up with
>   multiple BOs pointing to the same overlapping range in the memfd and hence
>   the same pages.  That doesn't mean that everything in the path is already
>   set up for what you need but the VA -> page mappings should be.  Also,
>   avoiding these kinds of shinanigans is exactly why we want a "real" kernel
>   API for this. :-)
>    

Ok thanks Jason for the explantion.
Will look into supporting this here.

>
>     Ok, let me change the interface as below.
>
>     struct drm_i915_gem_vm_bind_va
>     {
>             /** VA start to bind **/
>             __u64 start;
>
>             /** Offset in Object to bind for I915_GEM_VM_BIND_SVM_OBJ type
>     **/
>             __u64 offset;
>
>             /** VA length to [un]bind **/
>             __u64 length;
>
>             /** Type of memory to [un]bind **/
>             __u32 type;
>     #define I915_GEM_VM_BIND_SVM_OBJ      0
>     #define I915_GEM_VM_BIND_SVM_BUFFER   1
>
>             /** Object handle to [un]bind for I915_GEM_VM_BIND_SVM_OBJ type
>     **/
>             __u32 handle;
>
>             /** Flags **/
>             __u32 flags;
>     #define I915_GEM_VM_BIND_UNBIND      (1 << 0)
>     #define I915_GEM_VM_BIND_READONLY    (1 << 1)
>     }
>
>     struct drm_i915_gem_vm_bind {
>             /** vm to [un]bind **/
>             __u32 vm_id;
>
>             /** number of VAs to bind **/
>             __u32 num_vas;
>
>             /** Array of VAs to bind **/
>             struct drm_i915_gem_vm_bind_va *bind_vas;
>
>             /** User extensions **/
>             __u64 extensions;
>     };
>
>     When synchronization control is added as extension, it applies to all
>     VAs in the array.
>     Does this looks good?
>
>   Yes, I think that header looks good.  It's probably fine if
>   synchronization comes later.
>   I have two more questions (more for my own education than anything):
>    1. What is the difference between a SVM object and a buffer?

SVM object is the GEM BO. By buffer I mean system allocated memory (say malloc()).
I have some documentation in patch 01.
https://lists.freedesktop.org/archives/intel-gfx/2019-December/223481.html

>    2. I see a vm_id but there is no context.  What (if any) are the
>   synchronization guarantees between the VM_BIND ioctl and EXECBUF?  If I
>   VM_BIND followed by EXECBUF is it guaranteed to happen in that order? 
>   What if I EXECBUF and then VM_BIND to unbind something?  If I VM_BIND
>   while an execbuf is happening but I have some way of delaying the GPU work
>   from the CPU and I unblock it once the VM_BIND comes back, is that ok?
>   If those questions are answered by other patches, feel free to just point
>   me at them instead of answering in detail here.

Binding/unbinding is w.r.t to a device page table (hence the vm_id).
With current implementation, Yes, EXECBUF after the VM_BIND will see those binds
and ensure that those VA ranges are bound in device page table.
VM_BIND to bind/unbind after issuing EXECBUF which is alredy running (eg., endless
batch buffer), is not currently supported by this patch. But yes, I expect your
above scenario should be allowed and supported eventually.
I agree we need to set right expectation here for some of the use cases.
Let me look into this synchronization b/w two paths a bit more and sync with you.

Thanks,
Niranjana

>   --Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
