Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9231F6B4E73
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 18:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1407410E2A9;
	Fri, 10 Mar 2023 17:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3258B10E2A9;
 Fri, 10 Mar 2023 17:25:42 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0886A66003B0;
 Fri, 10 Mar 2023 17:25:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678469140;
 bh=wM54TmsN2cbOzHJr/5TpGI05vTyX+Oe7JKg+tq6vv6E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TmcRYGkEuRzs7i+cH0kQa41ntt/LAH7dNLd532WuM7EUdDdyUoWKer7VEEXgoE4Wd
 Jnc1ZSfw3gKnCIXy1FccES9JiGkavm2cxV6HWPjhicEXLRBZKtuEMyRmdO4zJZAwHM
 aDLTEKR8bLrtwcaRxIoYt+ZuC7VYWLYEkHTEMmaS4+ReEwdB++QwXDBsYx2cDnyILe
 DeFr89UuUdVq9ceDu7XFxtBItyBnah1+PynhJ8hvELzQLmQHLIG/oPleydhB7e7A6b
 7rY0Vv8dTdtXYTgvR4t1pTe8EakW9eE2MxUzOpYmhnSi7gObXPPqEiJqu+puyW+Rk0
 maVtGaCIv9w5w==
Date: Fri, 10 Mar 2023 18:25:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 00/16] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
Message-ID: <20230310182536.571315f3@collabora.com>
In-Reply-To: <d0e59837-703b-964a-877e-38c244f58a85@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230309101243.1150506f@collabora.com>
 <20230309104841.7c03d5b4@collabora.com>
 <d0e59837-703b-964a-877e-38c244f58a85@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
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
 linux-mm@kvack.org, bskeggs@redhat.com, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, bagasdotme@gmail.com, christian.koenig@amd.com,
 jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

On Fri, 10 Mar 2023 17:45:58 +0100
Danilo Krummrich <dakr@redhat.com> wrote:

> Hi Boris,
> 
> On 3/9/23 10:48, Boris Brezillon wrote:
> > On Thu, 9 Mar 2023 10:12:43 +0100
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >   
> >> Hi Danilo,
> >>
> >> On Fri, 17 Feb 2023 14:44:06 +0100
> >> Danilo Krummrich <dakr@redhat.com> wrote:
> >>  
> >>> Changes in V2:
> >>> ==============
> >>>    Nouveau:
> >>>      - Reworked the Nouveau VM_BIND UAPI to avoid memory allocations in fence
> >>>        signalling critical sections. Updates to the VA space are split up in three
> >>>        separate stages, where only the 2. stage executes in a fence signalling
> >>>        critical section:
> >>>
> >>>          1. update the VA space, allocate new structures and page tables  
> >>
> >> Sorry for the silly question, but I didn't find where the page tables
> >> pre-allocation happens. Mind pointing it to me? It's also unclear when
> >> this step happens. Is this at bind-job submission time, when the job is
> >> not necessarily ready to run, potentially waiting for other deps to be
> >> signaled. Or is it done when all deps are met, as an extra step before
> >> jumping to step 2. If that's the former, then I don't see how the VA
> >> space update can happen, since the bind-job might depend on other
> >> bind-jobs modifying the same portion of the VA space (unbind ops might
> >> lead to intermediate page table levels disappearing while we were
> >> waiting for deps). If it's the latter, I wonder why this is not
> >> considered as an allocation in the fence signaling path (for the
> >> bind-job out-fence to be signaled, you need these allocations to
> >> succeed, unless failing to allocate page-tables is considered like a HW
> >> misbehavior and the fence is signaled with an error in that case).  
> > 
> > Ok, so I just noticed you only have one bind queue per drm_file
> > (cli->sched_entity), and jobs are executed in-order on a given queue,
> > so I guess that allows you to modify the VA space at submit time
> > without risking any modifications to the VA space coming from other
> > bind-queues targeting the same VM. And, if I'm correct, synchronous
> > bind/unbind ops take the same path, so no risk for those to modify the
> > VA space either (just wonder if it's a good thing to have to sync
> > bind/unbind operations waiting on async ones, but that's a different
> > topic).  
> 
> Yes, that's all correct.
> 
> The page table allocation happens through nouveau_uvmm_vmm_get() which 
> either allocates the corresponding page tables or increases the 
> reference count, in case they already exist, accordingly.
> The call goes all the way through nvif into the nvkm layer (not the 
> easiest to follow the call chain) and ends up in nvkm_vmm_ptes_get().
> 
> There are multiple reasons for updating the VA space at submit time in 
> Nouveau.
> 
> 1) Subsequent EXEC ioctl() calls would need to wait for the bind jobs 
> they depend on within the ioctl() rather than in the scheduler queue, 
> because at the point of time where the ioctl() happens the VA space 
> wouldn't be up-to-date.

Hm, actually that's what explicit sync is all about, isn't it? If you
have async binding ops, you should retrieve the bind-op out-fences and
pass them back as in-fences to the EXEC call, so you're sure all the
memory mappings you depend on are active when you execute those GPU
jobs. And if you're using sync binds, the changes are guaranteed to be
applied before the ioctl() returns. Am I missing something?

> 
> 2) Let's assume a new mapping is requested and within it's range other 
> mappings already exist. Let's also assume that those existing mappings 
> aren't contiguous, such that there are gaps between them. In such a case 
> I need to allocate page tables only for the gaps between the existing 
> mappings, or alternatively, allocate them for the whole range of the new 
> mapping, but free / decrease the reference count of the page tables for 
> the ranges of the previously existing mappings afterwards.
> In the first case I need to know the gaps to allocate page tables for 
> when submitting the job, which means the VA space must be up-to-date. In 
> the latter one I must save the ranges of the previously existing 
> mappings somewhere in order to clean them up, hence I need to allocate 
> memory to store this information. Since I can't allocate this memory in 
> the jobs run() callback (fence signalling critical section) I need to do 
> it when submitting the job already and hence the VA space must be 
> up-to-date again.

Yep that makes perfect sense, and that explains how the whole thing can
work. When I initially read the patch series, I had more complex use
cases in mind, with multiple bind queues targeting the same VM, and
synchronous bind taking a fast path (so they don't have to wait on
async binds which can in turn wait on external deps). This model makes
it hard to predict what the VA space will look like when an async bind
operation gets to be executed, thus making page table allocation more
complex, or forcing us to over-estimate the amount of pages we need for
this update (basically one page per MMU level, except maybe the top
level, plus the number of pages you'll always need for the bind
operation itself).

> However, this is due to how page table management currently works in 
> Nouveau and we might change that in the future.

I'm curious to hear about that if you have a bit of time. I'm starting
from scratch with pancsf, and I might consider going for something
similar to what you plan to do next.

> 
> Synchronous binds/unbinds taking the same path through the scheduler is 
> a downside of this approach.

Indeed. I mean, I can probably live with this limitation, but I'm
curious to know if the pg table management changes you're considering
for the future would solve that problem.

Anyway, thanks for taking the time to answer my question, things are
much clearer now.

Boris
