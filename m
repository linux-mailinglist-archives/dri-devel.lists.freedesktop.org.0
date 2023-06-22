Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFD273A154
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 15:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44E610E55D;
	Thu, 22 Jun 2023 13:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA99A10E55D;
 Thu, 22 Jun 2023 13:01:07 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AA5C660710F;
 Thu, 22 Jun 2023 14:01:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687438865;
 bh=DawHN/kgeGUc0r6R53Kz7YkrkviLw7KmhaDFh7F4fGU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kTF0QbpyzfXuRXwgqlfE/UFqs2ZUYOwMSMiMt7CMwN1uyJ4Yn2U4WoIqK7frxHa8Q
 E+hZeOCMaU26twMoOYR3vTunVkUHr/ogevdQR8ENG86KD4iD/FiNa1bN7dLVwjSFvM
 ExLSK9aq9ASDr07ZhC5OJH+xmZpnbGVrBDEarmDA/QwerEVOjjqj3lM63S2hykT6FP
 0UZZKprOtG5J8HZskHc3ZffXo85w2RJyi4UwKutCzHhkFusQGlXIJPOs2DjB1zcvVl
 FZJMr72pfDovwNT91NtUVujGIBisEIYWPuaKuSP0I5jPxXWVsyGyb5Lkzw+7bpl1Sd
 8slUa4N/7lu6Q==
Date: Thu, 22 Jun 2023 15:01:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v5 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
Message-ID: <20230622150101.229391e5@collabora.com>
In-Reply-To: <94adfd82-e77d-f99c-1d94-8b6397d39310@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620112540.19142ef3@collabora.com>
 <94adfd82-e77d-f99c-1d94-8b6397d39310@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-mm@kvack.org, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

On Tue, 20 Jun 2023 14:46:07 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> > The only thing I'm worried about is the 'sync mapping requests have to
> > go through the async path and wait for all previous async requests to
> > be processed' problem I mentioned in one of your previous submission,
> > but I'm happy leave that for later.  
> 
> Yes, I'm aware of this limitation.
> 
> Let me quickly try to explain where this limitation comes from and how I 
> intend to address it.
> 
> In order to be able to allocate the required page tables for a mapping 
> request and in order to free corresponding page tables once the (async) 
> job finished I need to know the corresponding sequence of operations 
> (drm_gpuva_ops) to fulfill the mapping request.
> 
> This requires me to update the GPUVA space in the ioctl() rather than in 
> the async stage, because otherwise I would need to wait for previous 
> jobs to finish before being able to submit subsequent jobs to the job 
> queue, since I need an up to date view of the GPUVA space in order to 
> calculate the sequence of operations to fulfill a mapping request.
> 
> As a consequence all jobs need to be processed in the order they were 
> submitted, including synchronous jobs.
> 
> @Matt: I think you will have the same limitation with synchronous jobs 
> as your implementation in XE should be similar?
> 
> In order to address it I want to switch to using callbacks rather than 
> 'pre-allocated' drm_gpuva_ops and update the GPUVA space within the 
> asynchronous stage.
> This would allow me to 'fit' synchronous jobs 
> between jobs waiting in the async job queue. However, to do this I have 
> to re-work how the page table handling in Nouveau is implemented, since 
> this would require me to be able to manage the page tables without 
> knowing the exact sequence of operations to fulfill a mapping request.

Ok, so I think that's more or less what we're trying to do right
now in PowerVR.

- First, we make sure we reserve enough MMU page tables for a given map
  operation to succeed no matter the VM state in the VM_BIND job
  submission path (our VM_BIND ioctl). That means we're always
  over-provisioning and returning unused memory back when the operation
  is done if we end up using less memory.
- We pre-allocate for the mapple-tree insertions.
- Then we map using drm_gpuva_sm_map() and the callbacks we provided in
  the drm_sched::run_job() path. We guarantee that no memory is
  allocated in that path thanks to the pre-allocation/reservation we've
  done at VM_BIND job submission time.

The problem I see with this v5 is that:

1/ We now have a dma_resv_lock_held() in drm_gpuva_{link,unlink}(),
   which, in our case, is called in the async drm_sched::run_job() path,
   and we don't hold the lock in that path (it's been released just
   after the job submission).
2/ I'm worried that Liam's plan to only reserve what's actually needed
   based on the mapple tree state is going to play against us, because
   the mapple-tree is only modified at job exec time, and we might have
   several unmaps happening between the moment we created and queued the
   jobs, and the moment they actually get executed, meaning the
   mapple-tree reservation might no longer fit the bill.

For issue #1, it shouldn't be to problematic if we use a regular lock to
insert to/remove from the GEM gpuva list.

For issue #2, I can see a way out if, instead of freeing gpuva nodes,
we flag those as unused when we see that something happening later in
the queue is going to map a section being unmapped. All of this implies
keeping access to already queued VM_BIND jobs (using the spsc queue at
the entity level is not practical), and iterating over them every time
a new sync or async job is queued to flag what needs to be retained. It
would obviously be easier if we could tell the mapple-tree API
'provision as if the tree was empty', so all we have to do is just
over-provision for both the page tables and mapple-tree insertion, and
free the unused mem when the operation is done.

Don't know if you already thought about that and/or have solutions to
solve these issues.

Regards,

Boris
