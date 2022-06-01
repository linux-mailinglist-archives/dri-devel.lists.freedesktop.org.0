Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC6D53AE80
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 23:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCC310F894;
	Wed,  1 Jun 2022 21:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C501710F74A;
 Wed,  1 Jun 2022 21:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654118718; x=1685654718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NcLBO901OtRF8vqUzbCUOSaO4TqbKWFE+hNLqU+5gcY=;
 b=Ta0Wilr+JNBOnbUDHoaOy2+9Muck+zUZgZEKwON/AgB3AG27n3g+PDKm
 xxW8/xG5Y0cd4jzPQbLh3HZkLGnfp+xVasJ6uZmduWnWjmWz1U4lIYT0G
 gxxnG8zQtCqLNJQ0qz+n44VcvkTHbv4oURJ2vWvu3K3BMn7hju6zVNz+t
 LpngzxobMxk5jh0gRifN4oLksNJtCngfMZS5ZkQHvdb4CKeOpLT4/JPa9
 xVDOss/vs0shgTDinuh7QDJFUuZKqBzM5brrbVJVLuvQzbYd4P5GP9RYf
 a8LvzvbPhdOMzlmy1w7GDjRTwplI1tBbjSxJFItsxgfWsoYyQRAoCL2Dj w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="255604696"
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; d="scan'208";a="255604696"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 14:25:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; d="scan'208";a="756640880"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 14:25:12 -0700
Date: Wed, 1 Jun 2022 14:18:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
Message-ID: <20220601211849.GA30517@jons-linux-dev-box>
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
 <43746609-4f60-f347-5934-6680516297dd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43746609-4f60-f347-5934-6680516297dd@intel.com>
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

On Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel Landwerlin wrote:
> On 17/05/2022 21:32, Niranjana Vishwanathapura wrote:
> > +VM_BIND/UNBIND ioctl will immediately start binding/unbinding the mapping in an
> > +async worker. The binding and unbinding will work like a special GPU engine.
> > +The binding and unbinding operations are serialized and will wait on specified
> > +input fences before the operation and will signal the output fences upon the
> > +completion of the operation. Due to serialization, completion of an operation
> > +will also indicate that all previous operations are also complete.
> 
> I guess we should avoid saying "will immediately start binding/unbinding" if
> there are fences involved.
> 
> And the fact that it's happening in an async worker seem to imply it's not
> immediate.
> 
> 
> I have a question on the behavior of the bind operation when no input fence
> is provided. Let say I do :
> 
> VM_BIND (out_fence=fence1)
> 
> VM_BIND (out_fence=fence2)
> 
> VM_BIND (out_fence=fence3)
> 
> 
> In what order are the fences going to be signaled?
> 
> In the order of VM_BIND ioctls? Or out of order?
> 
> Because you wrote "serialized I assume it's : in order
> 
> 
> One thing I didn't realize is that because we only get one "VM_BIND" engine,
> there is a disconnect from the Vulkan specification.
> 
> In Vulkan VM_BIND operations are serialized but per engine.
> 
> So you could have something like this :
> 
> VM_BIND (engine=rcs0, in_fence=fence1, out_fence=fence2)
> 
> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
> 

Question - let's say this done after the above operations:

EXEC (engine=ccs0, in_fence=NULL, out_fence=NULL)

Is the exec ordered with respected to bind (i.e. would fence3 & 4 be
signaled before the exec starts)?

Matt

> 
> fence1 is not signaled
> 
> fence3 is signaled
> 
> So the second VM_BIND will proceed before the first VM_BIND.
> 
> 
> I guess we can deal with that scenario in userspace by doing the wait
> ourselves in one thread per engines.
> 
> But then it makes the VM_BIND input fences useless.
> 
> 
> Daniel : what do you think? Should be rework this or just deal with wait
> fences in userspace?
> 
> 
> Sorry I noticed this late.
> 
> 
> -Lionel
> 
> 
