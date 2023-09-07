Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E497971A1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 13:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B51710E22A;
	Thu,  7 Sep 2023 11:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A61B10E0BA;
 Thu,  7 Sep 2023 11:05:33 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 72D2F66072FD;
 Thu,  7 Sep 2023 12:05:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694084731;
 bh=/BGR+k5kMjVpHjfIB+KbwyCu8DU9Orv1m5bgDUGoE6o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L8YhjNezYCG9/QwpE0CA0ZBVQPQhWirL55mxzjmlqC79NcHQXcyDUdIhE+NUDh8T/
 zmkB6ddXvqg/omh0GUOBOmaSZe9KwFpR+djLfKpmZmC4GG+OdeiIvwitpuM26T74wK
 CSeRAaxEpAC3hGdngzEvCxael83pjgIW1S/d6l2rR+c6tc3E4/fO/dX5H/hR7XFZJC
 U5Ztq4k1Vvd8TcjeVoxUs4vvZ4HIXiOy0/vwqoMMPdPJhYk9YqK8R2iNN/j/tb8cBd
 Upd6h6sGGwdNUW7w7MYCx7VTX7pBhSam3YmQwvQ/fIQJxsEJ9PHDC/NaGy8bUmnOWB
 YPI5OL9GlApdA==
Date: Thu, 7 Sep 2023 13:05:28 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v2 5/7] drm/gpuvm: add an abstraction for
 a VM / BO combination
Message-ID: <20230907130528.5ec58bfd@collabora.com>
In-Reply-To: <b3a322f0-9b0b-0ad8-be5d-e081f4061f13@redhat.com>
References: <20230906214723.4393-1-dakr@redhat.com>
 <20230906214723.4393-6-dakr@redhat.com>
 <20230907104252.4e15acb9@collabora.com>
 <b3a322f0-9b0b-0ad8-be5d-e081f4061f13@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Sep 2023 11:41:11 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> On 9/7/23 10:42, Boris Brezillon wrote:
> > On Wed,  6 Sep 2023 23:47:13 +0200
> > Danilo Krummrich <dakr@redhat.com> wrote:
> >   
> >> +void drm_gpuvm_bo_destroy(struct kref *kref);  
> > 
> > I usually keep kref's release functions private so people are not
> > tempted to use them.  
> 
> I think I did that because drm_gpuvm_bo_put() needs it.

Yeah, but you can move the drm_gpuvm_bo_put() implementation to the C
file and make this one private.

> 
> >   
> >> +
> >> +/**
> >> + * drm_gpuvm_bo_get() - acquire a struct drm_gpuvm_bo reference
> >> + * @vm_bo: the &drm_gpuvm_bo to acquire the reference of
> >> + *
> >> + * This function acquires an additional reference to @vm_bo. It is illegal to
> >> + * call this without already holding a reference. No locks required.
> >> + */
> >> +static inline struct drm_gpuvm_bo *
> >> +drm_gpuvm_bo_get(struct drm_gpuvm_bo *vm_bo)
> >> +{
> >> +	kref_get(&vm_bo->kref);
> >> +	return vm_bo;
> >> +}
> >> +
> >> +/**
> >> + * drm_gpuvm_bo_put() - drop a struct drm_gpuvm_bo reference
> >> + * @vm_bo: the &drm_gpuvm_bo to release the reference of
> >> + *
> >> + * This releases a reference to @vm_bo.
> >> + */
> >> +static inline void
> >> +drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
> >> +{
> >> +	kref_put(&vm_bo->kref, drm_gpuvm_bo_destroy);  
> > 
> > nit: can we have
> > 
> > 	if (vm_bo)
> > 		kref_put(&vm_bo->kref, drm_gpuvm_bo_destroy);
> > 
> > so we don't have to bother testing the vm_bo value in the error/cleanup
> > paths?
> >   
> >> +}
> >> +  
> >   
> 

