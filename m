Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F08253BC81
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 18:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E30112B51;
	Thu,  2 Jun 2022 16:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8D5112B51;
 Thu,  2 Jun 2022 16:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654187348; x=1685723348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FUWjMY5QvrqnD4HnOuLPz0sb4eawYoYBq2yq6dyYae0=;
 b=WgW+QwHntj0n9up3H5waOARvPJjnXKE9w3fW1sczXtDPnnqk8fsu5THP
 riKXc6wfUJaUxmUQ+F/heROynDLlWYmcOxpZoBzD5+HuIfwuB28zVaRiK
 8HiY5glTxcrSeiUKAd1FuOvF5mE2onkiGRN1xFCYjTnVzJ9B8ohcB1cR5
 qLonwe8V1gme5BQqQymumm4qIEBYFFiGUYCeSclCPeS9Pf3W1uox+e2Lr
 T8V0FBFieaIr+YT3hci01ZWN8eDUSGNvM5U5AubC10xv+HRiUDS92nILl
 BVuixF37bl7mq0Z3pKYBymTedsLkhDWT2D8HCKELWvnuvJ0BNybY05W+4 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="276074814"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="276074814"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 09:29:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="668055100"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 09:29:08 -0700
Date: Thu, 2 Jun 2022 09:22:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
Message-ID: <20220602162245.GA15751@jons-linux-dev-box>
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
 <43746609-4f60-f347-5934-6680516297dd@intel.com>
 <20220601211849.GA30517@jons-linux-dev-box>
 <2508922c-dae7-af05-0feb-9c4b63411a8c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2508922c-dae7-af05-0feb-9c4b63411a8c@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, chris.p.wilson@intel.com, daniel.vetter@intel.com,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 02, 2022 at 08:42:13AM +0300, Lionel Landwerlin wrote:
> On 02/06/2022 00:18, Matthew Brost wrote:
> > On Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel Landwerlin wrote:
> > > On 17/05/2022 21:32, Niranjana Vishwanathapura wrote:
> > > > +VM_BIND/UNBIND ioctl will immediately start binding/unbinding the mapping in an
> > > > +async worker. The binding and unbinding will work like a special GPU engine.
> > > > +The binding and unbinding operations are serialized and will wait on specified
> > > > +input fences before the operation and will signal the output fences upon the
> > > > +completion of the operation. Due to serialization, completion of an operation
> > > > +will also indicate that all previous operations are also complete.
> > > I guess we should avoid saying "will immediately start binding/unbinding" if
> > > there are fences involved.
> > > 
> > > And the fact that it's happening in an async worker seem to imply it's not
> > > immediate.
> > > 
> > > 
> > > I have a question on the behavior of the bind operation when no input fence
> > > is provided. Let say I do :
> > > 
> > > VM_BIND (out_fence=fence1)
> > > 
> > > VM_BIND (out_fence=fence2)
> > > 
> > > VM_BIND (out_fence=fence3)
> > > 
> > > 
> > > In what order are the fences going to be signaled?
> > > 
> > > In the order of VM_BIND ioctls? Or out of order?
> > > 
> > > Because you wrote "serialized I assume it's : in order
> > > 
> > > 
> > > One thing I didn't realize is that because we only get one "VM_BIND" engine,
> > > there is a disconnect from the Vulkan specification.
> > > 
> > > In Vulkan VM_BIND operations are serialized but per engine.
> > > 
> > > So you could have something like this :
> > > 
> > > VM_BIND (engine=rcs0, in_fence=fence1, out_fence=fence2)
> > > 
> > > VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
> > > 
> > Question - let's say this done after the above operations:
> > 
> > EXEC (engine=ccs0, in_fence=NULL, out_fence=NULL)
> > 
> > Is the exec ordered with respected to bind (i.e. would fence3 & 4 be
> > signaled before the exec starts)?
> > 
> > Matt
> 
> 
> Hi Matt,
> 
> From the vulkan point of view, everything is serialized within an engine (we
> map that to a VkQueue).
> 
> So with :
> 
> EXEC (engine=ccs0, in_fence=NULL, out_fence=NULL)
> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
> 
> EXEC completes first then VM_BIND executes.
> 
> 
> To be even clearer :
> 
> EXEC (engine=ccs0, in_fence=fence2, out_fence=NULL)
> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
> 
> 
> EXEC will wait until fence2 is signaled.
> Once fence2 is signaled, EXEC proceeds, finishes and only after it is done, VM_BIND executes.
> 
> It would kind of like having the VM_BIND operation be another batch executed from the ringbuffer buffer.
> 

Yea this makes sense. I think of VM_BINDs as more or less just another
version of an EXEC and this fits with that.

In practice I don't think we can share a ring but we should be able to
present an engine (again likely a gem context in i915) to the user that
orders VM_BINDs / EXECs if that is what Vulkan expects, at least I think.

Hopefully Niranjana + Daniel agree.

Matt

> -Lionel
> 
> 
> > 
> > > fence1 is not signaled
> > > 
> > > fence3 is signaled
> > > 
> > > So the second VM_BIND will proceed before the first VM_BIND.
> > > 
> > > 
> > > I guess we can deal with that scenario in userspace by doing the wait
> > > ourselves in one thread per engines.
> > > 
> > > But then it makes the VM_BIND input fences useless.
> > > 
> > > 
> > > Daniel : what do you think? Should be rework this or just deal with wait
> > > fences in userspace?
> > > 
> > > 
> > > Sorry I noticed this late.
> > > 
> > > 
> > > -Lionel
> > > 
> > > 
> 
