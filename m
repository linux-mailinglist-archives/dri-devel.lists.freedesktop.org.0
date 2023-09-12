Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3730879CD29
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 12:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5460310E3DF;
	Tue, 12 Sep 2023 10:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3B710E3DE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 10:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694513219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nhu9Hfcl5nhmV58zXZR/UKIjUFImL82+R6FawNNB6I=;
 b=QvZxPK4R3a1z4bf4ZE2Z/7wSchnQC1gAaVF3IOUiV/niQBBBH+ix5WK7byg64rSIBn6meO
 8d6r/OUHXI+geSepJOoH7iCUMfBEC3ATiBSs8+Frz6dyfn+j06nuixAUrS5AE3IQWyzrU3
 VpvMCZhUr2zRKIljlitjBW/ddDDmDoA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-gBqzKjVENZibMgGUszNWsg-1; Tue, 12 Sep 2023 06:06:58 -0400
X-MC-Unique: gBqzKjVENZibMgGUszNWsg-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-52a3e9c53e7so3678146a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 03:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694513217; x=1695118017;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7nhu9Hfcl5nhmV58zXZR/UKIjUFImL82+R6FawNNB6I=;
 b=Ww3059hmZ9NgH78Y/pjdeMDPyn7uIa8gRjUHBVYFZWbv5EflySpoaJls+c9LHTs3d4
 hqwej58zjCGHXYcAxACrZb6wfipmHtLtpJN8+JdHUjyCTbc2lCIGvlV7E0VpRPXysDPL
 Q1kSrKw/m0TP0XXF7k2tQiLh36kcOKwtvqo7ByvQb/aIrRDAUXCkSA2RmQpFYimjlSx4
 byDB7HO7MWesOR6/FuCYLPW0iV3a8BjXWy8vcp0MqY74zoF4UJ9k1rX5Yb0i54FY3ESK
 /zGDdxqRXlSw5M4oyzp/glPzgpzInq8JprdSlrRh9+4wUbh8qeTXTMFqeLmdmFaA8e4i
 kD8g==
X-Gm-Message-State: AOJu0Yy7N2afYUFxofvTlVbb5wdmqUPMIjRwwv9QT+E4pIjl9JQuN5qk
 mq0amszYg6lBZOwXUt2XN0LjpwByFCEfOjqQtjVIKo4NnRXr0G6Kp+idCJVa9CwfcPSWPpP5gHO
 qHVjeX9gkR2EIBjli4I6PSkiWotZP
X-Received: by 2002:aa7:d043:0:b0:525:440a:616a with SMTP id
 n3-20020aa7d043000000b00525440a616amr9923852edo.20.1694513217166; 
 Tue, 12 Sep 2023 03:06:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsWMTNKfhf/YNj5Ad2aInIyy8u38T7zVmNtgZ2pHSOw2xoAVOFPucZK+C3TiE0/jZuAMyRVA==
X-Received: by 2002:aa7:d043:0:b0:525:440a:616a with SMTP id
 n3-20020aa7d043000000b00525440a616amr9923831edo.20.1694513216863; 
 Tue, 12 Sep 2023 03:06:56 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 fi23-20020a056402551700b0052f66414ec6sm2427990edb.56.2023.09.12.03.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 03:06:56 -0700 (PDT)
Date: Tue, 12 Sep 2023 12:06:54 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v3 5/7] drm/gpuvm: add an abstraction for a
 VM / BO combination
Message-ID: <ZQA4PkxEKsuukwOW@pollux>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-6-dakr@redhat.com>
 <0a8799c3-1d4c-8d87-ebca-013f6541fbc4@linux.intel.com>
 <06bbb49d-974f-e3bb-f844-1509313066cc@redhat.com>
 <05b06e5d-03aa-14f4-46b1-6057c4437043@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <05b06e5d-03aa-14f4-46b1-6057c4437043@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 09:42:44AM +0200, Thomas Hellström wrote:
> Hi, Danilo
> 
> On 9/11/23 19:49, Danilo Krummrich wrote:
> > Hi Thomas,
> > 
> > On 9/11/23 19:19, Thomas Hellström wrote:
> > > Hi, Danilo
> > > 
> > > On 9/9/23 17:31, Danilo Krummrich wrote:
> > > > This patch adds an abstraction layer between the drm_gpuva mappings of
> > > > a particular drm_gem_object and this GEM object itself. The abstraction
> > > > represents a combination of a drm_gem_object and drm_gpuvm. The
> > > > drm_gem_object holds a list of drm_gpuvm_bo structures (the structure
> > > > representing this abstraction), while each drm_gpuvm_bo contains
> > > > list of
> > > > mappings of this GEM object.
> > > > 
> > > > This has multiple advantages:
> > > > 
> > > > 1) We can use the drm_gpuvm_bo structure to attach it to various lists
> > > >     of the drm_gpuvm. This is useful for tracking external and evicted
> > > >     objects per VM, which is introduced in subsequent patches.
> > > > 
> > > > 2) Finding mappings of a certain drm_gem_object mapped in a certain
> > > >     drm_gpuvm becomes much cheaper.
> > > > 
> > > > 3) Drivers can derive and extend the structure to easily represent
> > > >     driver specific states of a BO for a certain GPUVM.
> > > > 
> > > > The idea of this abstraction was taken from amdgpu, hence the
> > > > credit for
> > > > this idea goes to the developers of amdgpu.
> > > > 
> > > > Cc: Christian König <christian.koenig@amd.com>
> > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > 
> > > Did you consider having the drivers embed the struct drm_gpuvm_bo in
> > > their own bo definition? I figure that would mean using the gem bo's
> > > refcounting and providing a helper to call from the driver's bo
> > > release. Looks like that could potentially save a lot of code? Or is
> > > there something that won't work with that approach?
> > 
> > There are drm_gpuvm_ops::vm_bo_alloc and drm_gpuvm_ops::vm_bo_free
> > callback for drivers to register for that purpose.
> > 
> > - Danilo
> 
> Now after looking a bit deeper, I think actually the question could be
> rephrased as, why don't we just use the
> struct drm_gem_object::gpuva struct as the drm_gpuvm_bo in the spirit of
> keeping things simple? Drivers would then just embed it in their bo subclass
> and we'd avoid unnecessary fields in the struct drm_gem_object for drivers
> that don't do VM_BIND yet.

struct drm_gem_object::gpuva is just a container containing a list in order to
(currently) attach drm_gpuva structs to it and with this patch attach
drm_gpuvm_bo structs (combination of BO + VM) to it. Doing the above basically
means "leave everything as it is, but move the list_head of drm_gpuvs per GEM to
the driver specific BO structure". Having a common connection between GEM
objects and drm_gpuva structs was one of the goals of the initial GPUVA manager
patch series however.

> 
> Sure, this won't be per bo and per vm, but it'd really only make a slight
> difference where we have multiple VMAs per bo, where per-vm per-bo state
> either needs to be duplicated or attached to a single vma (as in the case of
> the external bo list).


Correct, one implication is that we don't get a per VM and BO abstraction, and
hence are left with a list of all drm_gpuva structs having the same backing BO,
regardless of the VM.

For amdgpu this was always a concern. Now that we want to keep track of external
and evicted objects it's going to be a concern for most drivers I guess. Because
the only structure we could use for tracking external and evicted objects we are
left with (without having a VM_BO abstraction) is struct drm_gpuva. But this
structure isn't unique and we need to consider cases where userspace just
allocates rather huge BOs and creates tons of mappings from it. Running the full
list of drm_gpuva structs (with even the ones from other VMs included) for
adding an external or evicted object isn't very efficient. Not to mention that
the maintenance when the mapping we've (randomly) picked as an entry for the
external/evicted object list is unmapped, but there are still mappings left in
the VM with the same backing BO.

Now, a way to get rid of the VM_BO abstraction would be to use maple trees
instead, since then we can store drm_gem_object structs directly for each VM.
However, Xe had concerns about using maple trees and preferred lists, plus
having maple trees wouldn't get rid of the concerns of amdgpu not having a VM_BO
abstraction for cases with tons of VMs and tons of mappings per BO. Hence,
having a VM_BO abstraction enabling us to track external/evicted objects with
lists seems to satisfy everyone's needs.

- Danilo

> 
> To me that looks like a substantial amount of less code / complexity?
> 
> /Thomas
> 
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > Thomas
> > > 
> > > 
> > 
> 

