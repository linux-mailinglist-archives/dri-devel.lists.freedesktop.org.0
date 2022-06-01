Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B4453ADA9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 22:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE4C10E20A;
	Wed,  1 Jun 2022 20:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F67C10E20A;
 Wed,  1 Jun 2022 20:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654115701; x=1685651701;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jnUHBzgfXUi4/uKEbszKU8+nNWapNef6UnYTisusHgM=;
 b=G7DzTAgrKTcGcuJ5KS3RQ02jV4dG2mf1y/HlLjbZpk/1ByaY5f9o4Ew7
 Ep/1BlF0aOGxerRUqUC54W3BCjjvH1EfUdHkLU4kejsf5P7fFWWzBP55Z
 aM67bT3RFmOZwyF3KGdqOXBDjNYqBNpJ/UKQv8R8g5cMY7D11LLIUSKE8
 raVh3SywTdfI88id7DID/CO1TX9vWlWQkZNV4TUxpw72OUhF+oj4NFD7y
 coQGotidBZ+cTunOp4OrxsDAIOnTUZ4QGPZVF8GGtRsxLfzUVP8AJzsUP
 ocnarrOb7RBJn+yz0MWiZxjIKy3cSpvCQVHT7F9izeEwyz7edUW0J/43s Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="274523759"
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; d="scan'208";a="274523759"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 13:35:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; d="scan'208";a="606463092"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 13:34:59 -0700
Date: Wed, 1 Jun 2022 13:28:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
Message-ID: <20220601202836.GA15346@jons-linux-dev-box>
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

My opinion is rework this but make the ordering via an engine param optional.

e.g. A VM can be configured so all binds are ordered within the VM

e.g. A VM can be configured so all binds accept an engine argument (in
the case of the i915 likely this is a gem context handle) and binds
ordered with respect to that engine.

This gives UMDs options as the later likely consumes more KMD resources
so if a different UMD can live with binds being ordered within the VM
they can use a mode consuming less resources.

Matt

> 
> Sorry I noticed this late.
> 
> 
> -Lionel
> 
> 
