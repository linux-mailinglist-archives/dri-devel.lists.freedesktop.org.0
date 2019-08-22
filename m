Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B12FF9A2E0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 00:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AB66EA71;
	Thu, 22 Aug 2019 22:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDAD6EA71
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 22:28:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 15:28:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,418,1559545200"; 
 d="scan'208,217";a="173286264"
Received: from rgcayeta-mobl.ger.corp.intel.com (HELO [10.249.34.110])
 ([10.249.34.110])
 by orsmga008.jf.intel.com with ESMTP; 22 Aug 2019 15:28:37 -0700
Subject: Re: [PATCH] drm/syncobj: Add documentation for timeline syncobj
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20190822145503.24630-1-lionel.g.landwerlin@intel.com>
 <CAOFGe96fLwPhmpuh8v2E7rcsrubxW6CA_sbU6yZOVdOQKSw9wQ@mail.gmail.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <dc853f51-0800-17f8-ee56-3ff0d292d0bc@intel.com>
Date: Fri, 23 Aug 2019 00:28:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOFGe96fLwPhmpuh8v2E7rcsrubxW6CA_sbU6yZOVdOQKSw9wQ@mail.gmail.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Christian Koenig <Christian.Koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0441815979=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0441815979==
Content-Type: multipart/alternative;
 boundary="------------20EF83C6E3641A402125E0D4"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------20EF83C6E3641A402125E0D4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/08/2019 21:24, Jason Ekstrand wrote:
> On Thu, Aug 22, 2019 at 9:55 AM Lionel Landwerlin 
> <lionel.g.landwerlin@intel.com <mailto:lionel.g.landwerlin@intel.com>> 
> wrote:
>
>     We've added a set of new APIs to manipulate syncobjs holding timelines
>     of dma_fence. This adds a bit of documentation about how this works.
>
>     Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com
>     <mailto:lionel.g.landwerlin@intel.com>>
>     Cc: Christian Koenig <Christian.Koenig@amd.com
>     <mailto:Christian.Koenig@amd.com>>
>     Cc: Jason Ekstrand <jason@jlekstrand.net
>     <mailto:jason@jlekstrand.net>>
>     Cc: David(ChunMing) Zhou <David1.Zhou@amd.com
>     <mailto:David1.Zhou@amd.com>>
>     ---
>      drivers/gpu/drm/drm_syncobj.c | 87
>     +++++++++++++++++++++++++++++------
>      1 file changed, 74 insertions(+), 13 deletions(-)
>
>     diff --git a/drivers/gpu/drm/drm_syncobj.c
>     b/drivers/gpu/drm/drm_syncobj.c
>     index b5ad73330a48..32ffded6d2c0 100644
>     --- a/drivers/gpu/drm/drm_syncobj.c
>     +++ b/drivers/gpu/drm/drm_syncobj.c
>     @@ -43,27 +43,66 @@
>       *  - Signal a syncobj (set a trivially signaled fence)
>       *  - Wait for a syncobj's fence to appear and be signaled
>       *
>     + * The syncobj userspace API also provides operations to
>     manipulate a syncobj
>     + * in terms of a timeline of struct &dma_fence rather than a
>     single struct
>     + * &dma_fence, through the following operations:
>     + *
>     + *   - Signal a given point on the timeline
>     + *   - Wait for a given point to appear and/or be signaled
>     + *   - Import and export from/to a given point of a timeline
>     + *
>       * At it's core, a syncobj is simply a wrapper around a pointer
>     to a struct
>       * &dma_fence which may be NULL.
>       * When a syncobj is first created, its pointer is either NULL or
>     a pointer
>       * to an already signaled fence depending on whether the
>       * &DRM_SYNCOBJ_CREATE_SIGNALED flag is passed to
>       * &DRM_IOCTL_SYNCOBJ_CREATE.
>     - * When GPU work which signals a syncobj is enqueued in a DRM driver,
>     - * the syncobj fence is replaced with a fence which will be
>     signaled by the
>     - * completion of that work.
>     - * When GPU work which waits on a syncobj is enqueued in a DRM
>     driver, the
>     - * driver retrieves syncobj's current fence at the time the work
>     is enqueued
>     - * waits on that fence before submitting the work to hardware.
>     - * If the syncobj's fence is NULL, the enqueue operation is
>     expected to fail.
>     - * All manipulation of the syncobjs's fence happens in terms of
>     the current
>     - * fence at the time the ioctl is called by userspace regardless
>     of whether
>     - * that operation is an immediate host-side operation (signal or
>     reset) or
>     - * or an operation which is enqueued in some driver queue.
>     - * &DRM_IOCTL_SYNCOBJ_RESET and &DRM_IOCTL_SYNCOBJ_SIGNAL can be
>     used to
>     - * manipulate a syncobj from the host by resetting its pointer to
>     NULL or
>     + *
>     + * If the syncobj is considered as a binary (signal/unsignaled)
>     primitive,
>
>
> What does "considered as a binary" mean?  Is it an inherent property 
> of the syncobj given at create time?  Is it a state the syncobj can be 
> in?  Or is it a property of how the submit ioctl in the DRM driver 
> references it?  I'm really hoping it's either 1 or 3....


3: you either use it binary/legacy apis, or timeline apis. timeline apis 
also provide some binary compatibility with the point 0 (in particular 
for wait).


>     + * when GPU work is enqueued in a DRM driver to signal the
>     syncobj, the fence
>     + * is replaced with a fence which will be signaled by the
>     completion of that
>     + * work.
>     + * If the syncobj is considered as a timeline primitive, when GPU
>     work is
>     + * enqueued in a DRM driver to signal the a given point of the
>     syncobj, a new
>     + * struct &dma_fence_chain pointing to the DRM driver's fence and
>     also
>     + * pointing to the previous fence that was in the syncobj. The
>     new struct
>     + * &dma_fence_chain fence put into the syncobj will be signaled
>     by completion
>     + * of the DRM driver's work and also any work associated with the
>     fence
>     + * previously in the syncobj.
>     + *
>     + * When GPU work which waits on a syncobj is enqueued in a DRM
>     driver, at the
>     + * time the work is enqueued, it waits on the fence coming from
>     the syncobj
>     + * before submitting the work to hardware. That fence is either :
>     + *
>     + *    - The syncobj's current fence if the syncobj is considered
>     as a binary
>     + *      primitive.
>     + *    - The struct &dma_fence associated with a given point if
>     the syncobj is
>     + *      considered as a timeline primitive.
>     + *
>     + * If the syncobj's fence is NULL or not present in the syncobj's
>     timeline,
>     + * the enqueue operation is expected to fail.
>     + *
>     + * With binary syncobj, all manipulation of the syncobjs's fence
>     happens in
>     + * terms of the current fence at the time the ioctl is called by
>     userspace
>     + * regardless of whether that operation is an immediate host-side
>     operation
>     + * (signal or reset) or or an operation which is enqueued in some
>     driver
>     + * queue. &DRM_IOCTL_SYNCOBJ_RESET and &DRM_IOCTL_SYNCOBJ_SIGNAL
>     can be used
>     + * to manipulate a syncobj from the host by resetting its pointer
>     to NULL or
>       * setting its pointer to a fence which is already signaled.
>       *
>     + * With timeline syncobj, all manipulation of the timeline fences
>     happens in
>     + * terms of the fence referred to in the timeline. See
>     + * dma_fence_chain_find_seqno() to see how a given point is found
>     in the
>     + * timeline.
>     + *
>     + * Note that applications should be careful to always use
>     timeline set of
>     + * ioctl() when dealing with syncobj considered as timeline.
>     Using a binary
>     + * set of ioctl() with a syncobj considered as timeline could
>     result incorrect
>     + * synchronization. The use of binary syncobj is supported
>     through the
>     + * timeline set of ioctl() by using a point value of 0, this will
>     reproduce
>     + * the behavior of the binary set of ioctl() (for example replace the
>     + * syncobj's fence when signaling).
>
> I know I've asked this before but I feel compelled to ask it again.  
> Why do we allow them to mix and match?  Why not just have a create 
> flag and enforce meaningful behavior? I'm a bit concerned that 
> userspace is going to start relying on the subtlties of the 
> interaction between timeline and binary syncobjs which are neither 
> documented nor properly tested in IGT.


For one, you might have to mix both types of syncobjs in a given 
wait/signal operation. So 0 ensures we can do that.


Second, drm-syncobj is a container and its payload is an interface 
(dma_fence) which has several implementations.

The kernel primitive is just less restrictive than the Vulkan API here.

I guess we could add a flag at creation to ensure the replacement of the 
fence in a timeline syncobj cannot happen.

I haven't thought of all the implications that might have though... 
Should we allow reset on a timeline syncobj?


-Lionel


>
>     + *
>       *
>       * Host-side wait on syncobjs
>       * --------------------------
>     @@ -87,6 +126,16 @@
>       * synchronize between the two.
>       * This requirement is inherited from the Vulkan fence API.
>       *
>     + * Similarly, &DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT takes an array of
>     syncobj
>     + * handles as well as an array of u64 points and does a host-side
>     wait on all
>     + * of syncobj fences at the given points simultaneously.
>     + *
>     + * &DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT also adds the ability to wait
>     for a given
>     + * fence to materialize on the timeline without waiting for the
>     fence to be
>     + * signaled by using the &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
>     flag. This
>     + * requirement is inherited from the wait-before-signal behavior
>     required by
>     + * the Vulkan timeline semaphore API.
>     + *
>       *
>       * Import/export of syncobjs
>       * -------------------------
>     @@ -120,6 +169,18 @@
>       * Because sync files are immutable, resetting or signaling the
>     syncobj
>       * will not affect any sync files whose fences have been imported
>     into the
>       * syncobj.
>     + *
>     + *
>     + * Import/export of timeline points in timeline syncobjs
>     + * -----------------------------------------------------
>     + *
>     + * &DRM_IOCTL_SYNCOBJ_TRANSFER provides a mechanism to transfer a
>     struct
>     + * &dma_fence of at a given point from a timeline syncobj to
>     another point
>     + * into another timeline syncobj.
>     + *
>     + * Note that if you want to transfer a struct &dma_fence from a
>     given point on
>     + * a timeline syncobj from/into a binary syncobj, you can use the
>     point 0 to
>     + * mean take/replace the fence in the syncobj.
>       */
>
>      #include <linux/anon_inodes.h>
>     -- 
>     2.23.0
>


--------------20EF83C6E3641A402125E0D4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 22/08/2019 21:24, Jason Ekstrand
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAOFGe96fLwPhmpuh8v2E7rcsrubxW6CA_sbU6yZOVdOQKSw9wQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Aug 22, 2019 at 9:55
            AM Lionel Landwerlin &lt;<a
              href="mailto:lionel.g.landwerlin@intel.com"
              moz-do-not-send="true">lionel.g.landwerlin@intel.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">We've added a set of new
            APIs to manipulate syncobjs holding timelines<br>
            of dma_fence. This adds a bit of documentation about how
            this works.<br>
            <br>
            Signed-off-by: Lionel Landwerlin &lt;<a
              href="mailto:lionel.g.landwerlin@intel.com"
              target="_blank" moz-do-not-send="true">lionel.g.landwerlin@intel.com</a>&gt;<br>
            Cc: Christian Koenig &lt;<a
              href="mailto:Christian.Koenig@amd.com" target="_blank"
              moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;<br>
            Cc: Jason Ekstrand &lt;<a href="mailto:jason@jlekstrand.net"
              target="_blank" moz-do-not-send="true">jason@jlekstrand.net</a>&gt;<br>
            Cc: David(ChunMing) Zhou &lt;<a
              href="mailto:David1.Zhou@amd.com" target="_blank"
              moz-do-not-send="true">David1.Zhou@amd.com</a>&gt;<br>
            ---<br>
             drivers/gpu/drm/drm_syncobj.c | 87
            +++++++++++++++++++++++++++++------<br>
             1 file changed, 74 insertions(+), 13 deletions(-)<br>
            <br>
            diff --git a/drivers/gpu/drm/drm_syncobj.c
            b/drivers/gpu/drm/drm_syncobj.c<br>
            index b5ad73330a48..32ffded6d2c0 100644<br>
            --- a/drivers/gpu/drm/drm_syncobj.c<br>
            +++ b/drivers/gpu/drm/drm_syncobj.c<br>
            @@ -43,27 +43,66 @@<br>
              *  - Signal a syncobj (set a trivially signaled fence)<br>
              *  - Wait for a syncobj's fence to appear and be signaled<br>
              *<br>
            + * The syncobj userspace API also provides operations to
            manipulate a syncobj<br>
            + * in terms of a timeline of struct &amp;dma_fence rather
            than a single struct<br>
            + * &amp;dma_fence, through the following operations:<br>
            + *<br>
            + *   - Signal a given point on the timeline<br>
            + *   - Wait for a given point to appear and/or be signaled<br>
            + *   - Import and export from/to a given point of a
            timeline<br>
            + *<br>
              * At it's core, a syncobj is simply a wrapper around a
            pointer to a struct<br>
              * &amp;dma_fence which may be NULL.<br>
              * When a syncobj is first created, its pointer is either
            NULL or a pointer<br>
              * to an already signaled fence depending on whether the<br>
              * &amp;DRM_SYNCOBJ_CREATE_SIGNALED flag is passed to<br>
              * &amp;DRM_IOCTL_SYNCOBJ_CREATE.<br>
            - * When GPU work which signals a syncobj is enqueued in a
            DRM driver,<br>
            - * the syncobj fence is replaced with a fence which will be
            signaled by the<br>
            - * completion of that work.<br>
            - * When GPU work which waits on a syncobj is enqueued in a
            DRM driver, the<br>
            - * driver retrieves syncobj's current fence at the time the
            work is enqueued<br>
            - * waits on that fence before submitting the work to
            hardware.<br>
            - * If the syncobj's fence is NULL, the enqueue operation is
            expected to fail.<br>
            - * All manipulation of the syncobjs's fence happens in
            terms of the current<br>
            - * fence at the time the ioctl is called by userspace
            regardless of whether<br>
            - * that operation is an immediate host-side operation
            (signal or reset) or<br>
            - * or an operation which is enqueued in some driver queue.<br>
            - * &amp;DRM_IOCTL_SYNCOBJ_RESET and
            &amp;DRM_IOCTL_SYNCOBJ_SIGNAL can be used to<br>
            - * manipulate a syncobj from the host by resetting its
            pointer to NULL or<br>
            + *<br>
            + * If the syncobj is considered as a binary
            (signal/unsignaled) primitive,<br>
          </blockquote>
          <div><br>
          </div>
          <div>What does "considered as a binary" mean?  Is it an
            inherent property of the syncobj given at create time?  Is
            it a state the syncobj can be in?  Or is it a property of
            how the submit ioctl in the DRM driver references it?  I'm
            really hoping it's either 1 or 3....<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>3: you either use it binary/legacy apis, or timeline apis.
      timeline apis also provide some binary compatibility with the
      point 0 (in particular for wait).<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAOFGe96fLwPhmpuh8v2E7rcsrubxW6CA_sbU6yZOVdOQKSw9wQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            + * when GPU work is enqueued in a DRM driver to signal the
            syncobj, the fence<br>
            + * is replaced with a fence which will be signaled by the
            completion of that<br>
            + * work.<br>
            + * If the syncobj is considered as a timeline primitive,
            when GPU work is<br>
            + * enqueued in a DRM driver to signal the a given point of
            the syncobj, a new<br>
            + * struct &amp;dma_fence_chain pointing to the DRM driver's
            fence and also<br>
            + * pointing to the previous fence that was in the syncobj.
            The new struct<br>
            + * &amp;dma_fence_chain fence put into the syncobj will be
            signaled by completion<br>
            + * of the DRM driver's work and also any work associated
            with the fence<br>
            + * previously in the syncobj.<br>
            + *<br>
            + * When GPU work which waits on a syncobj is enqueued in a
            DRM driver, at the<br>
            + * time the work is enqueued, it waits on the fence coming
            from the syncobj<br>
            + * before submitting the work to hardware. That fence is
            either :<br>
            + *<br>
            + *    - The syncobj's current fence if the syncobj is
            considered as a binary<br>
            + *      primitive.<br>
            + *    - The struct &amp;dma_fence associated with a given
            point if the syncobj is<br>
            + *      considered as a timeline primitive.<br>
            + *<br>
            + * If the syncobj's fence is NULL or not present in the
            syncobj's timeline,<br>
            + * the enqueue operation is expected to fail.<br>
            + *<br>
            + * With binary syncobj, all manipulation of the syncobjs's
            fence happens in<br>
            + * terms of the current fence at the time the ioctl is
            called by userspace<br>
            + * regardless of whether that operation is an immediate
            host-side operation<br>
            + * (signal or reset) or or an operation which is enqueued
            in some driver<br>
            + * queue. &amp;DRM_IOCTL_SYNCOBJ_RESET and
            &amp;DRM_IOCTL_SYNCOBJ_SIGNAL can be used<br>
            + * to manipulate a syncobj from the host by resetting its
            pointer to NULL or<br>
              * setting its pointer to a fence which is already
            signaled.<br>
              *<br>
            + * With timeline syncobj, all manipulation of the timeline
            fences happens in<br>
            + * terms of the fence referred to in the timeline. See<br>
            + * dma_fence_chain_find_seqno() to see how a given point is
            found in the<br>
            + * timeline.<br>
            + *<br>
            + * Note that applications should be careful to always use
            timeline set of<br>
            + * ioctl() when dealing with syncobj considered as
            timeline. Using a binary<br>
            + * set of ioctl() with a syncobj considered as timeline
            could result incorrect<br>
            + * synchronization. The use of binary syncobj is supported
            through the<br>
            + * timeline set of ioctl() by using a point value of 0,
            this will reproduce<br>
            + * the behavior of the binary set of ioctl() (for example
            replace the<br>
            + * syncobj's fence when signaling).<br>
          </blockquote>
          <div> </div>
          <div>I know I've asked this before but I feel compelled to ask
            it again.  Why do we allow them to mix and match?  Why not
            just have a create flag and enforce meaningful behavior? 
            I'm a bit concerned that userspace is going to start relying
            on the subtlties of the interaction between timeline and
            binary syncobjs which are neither documented nor properly
            tested in IGT.<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>For one, you might have to mix both types of syncobjs in a given
      wait/signal operation. So 0 ensures we can do that.</p>
    <p><br>
    </p>
    <p>Second, drm-syncobj is a container and its payload is an
      interface (dma_fence) which has several implementations.</p>
    <p>The kernel primitive is just less restrictive than the Vulkan API
      here.<br>
    </p>
    <p>I guess we could add a flag at creation to ensure the replacement
      of the fence in a timeline syncobj cannot happen.</p>
    <p>I haven't thought of all the implications that might have
      though... Should we allow reset on a timeline syncobj?</p>
    <p><br>
    </p>
    <p>-Lionel<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAOFGe96fLwPhmpuh8v2E7rcsrubxW6CA_sbU6yZOVdOQKSw9wQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> <br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            + *<br>
              *<br>
              * Host-side wait on syncobjs<br>
              * --------------------------<br>
            @@ -87,6 +126,16 @@<br>
              * synchronize between the two.<br>
              * This requirement is inherited from the Vulkan fence API.<br>
              *<br>
            + * Similarly, &amp;DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT takes an
            array of syncobj<br>
            + * handles as well as an array of u64 points and does a
            host-side wait on all<br>
            + * of syncobj fences at the given points simultaneously.<br>
            + *<br>
            + * &amp;DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT also adds the
            ability to wait for a given<br>
            + * fence to materialize on the timeline without waiting for
            the fence to be<br>
            + * signaled by using the
            &amp;DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE flag. This<br>
            + * requirement is inherited from the wait-before-signal
            behavior required by<br>
            + * the Vulkan timeline semaphore API.<br>
            + *<br>
              *<br>
              * Import/export of syncobjs<br>
              * -------------------------<br>
            @@ -120,6 +169,18 @@<br>
              * Because sync files are immutable, resetting or signaling
            the syncobj<br>
              * will not affect any sync files whose fences have been
            imported into the<br>
              * syncobj.<br>
            + *<br>
            + *<br>
            + * Import/export of timeline points in timeline syncobjs<br>
            + * -----------------------------------------------------<br>
            + *<br>
            + * &amp;DRM_IOCTL_SYNCOBJ_TRANSFER provides a mechanism to
            transfer a struct<br>
            + * &amp;dma_fence of at a given point from a timeline
            syncobj to another point<br>
            + * into another timeline syncobj.<br>
            + *<br>
            + * Note that if you want to transfer a struct
            &amp;dma_fence from a given point on<br>
            + * a timeline syncobj from/into a binary syncobj, you can
            use the point 0 to<br>
            + * mean take/replace the fence in the syncobj.<br>
              */<br>
            <br>
             #include &lt;linux/anon_inodes.h&gt;<br>
            -- <br>
            2.23.0<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------20EF83C6E3641A402125E0D4--

--===============0441815979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0441815979==--
