Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DCE6B2093
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 10:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06AB10E7D3;
	Thu,  9 Mar 2023 09:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEE010E7D0;
 Thu,  9 Mar 2023 09:48:46 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F5B56603007;
 Thu,  9 Mar 2023 09:48:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678355324;
 bh=A50/72yir9yl+4D3pjJl/L2YPO9X4ebuwpQ6QWEfGK8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BlA9bNQGTwENVcuchUmZU0zKRIQtfqHMv+XEHNt1n1px6HtnR7et8gClwpnnVdkIn
 IsLWvioyN29w7AqACudpFr57ZctauG6ZIgJFd8LftSXgf0CS38ZZzV83iRogQTFBWL
 sF11OCF68vbVN1Q1lGeMs89xhkNjZOMZN8s386GpenrH5dhZ3C9kzlB0ljekHfrbZ+
 aTBlrwC1DbsFNIaqc0c5qjzOEExd2mkcY8NUCtPlSfxkj0CgG9FVWYKTW4BaEycQ9Z
 SR9E5bo+zEr5A5xTgQqQyb0UFurgErllvE2vblGYI1jIncZB+DGGb/blpuN+cDwku2
 /qsm7DdJQybZA==
Date: Thu, 9 Mar 2023 10:48:41 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 00/16] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
Message-ID: <20230309104841.7c03d5b4@collabora.com>
In-Reply-To: <20230309101243.1150506f@collabora.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230309101243.1150506f@collabora.com>
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

On Thu, 9 Mar 2023 10:12:43 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hi Danilo,
> 
> On Fri, 17 Feb 2023 14:44:06 +0100
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > Changes in V2:
> > ==============
> >   Nouveau:
> >     - Reworked the Nouveau VM_BIND UAPI to avoid memory allocations in fence
> >       signalling critical sections. Updates to the VA space are split up in three
> >       separate stages, where only the 2. stage executes in a fence signalling
> >       critical section:
> > 
> >         1. update the VA space, allocate new structures and page tables  
> 
> Sorry for the silly question, but I didn't find where the page tables
> pre-allocation happens. Mind pointing it to me? It's also unclear when
> this step happens. Is this at bind-job submission time, when the job is
> not necessarily ready to run, potentially waiting for other deps to be
> signaled. Or is it done when all deps are met, as an extra step before
> jumping to step 2. If that's the former, then I don't see how the VA
> space update can happen, since the bind-job might depend on other
> bind-jobs modifying the same portion of the VA space (unbind ops might
> lead to intermediate page table levels disappearing while we were
> waiting for deps). If it's the latter, I wonder why this is not
> considered as an allocation in the fence signaling path (for the
> bind-job out-fence to be signaled, you need these allocations to
> succeed, unless failing to allocate page-tables is considered like a HW
> misbehavior and the fence is signaled with an error in that case).

Ok, so I just noticed you only have one bind queue per drm_file
(cli->sched_entity), and jobs are executed in-order on a given queue,
so I guess that allows you to modify the VA space at submit time
without risking any modifications to the VA space coming from other
bind-queues targeting the same VM. And, if I'm correct, synchronous
bind/unbind ops take the same path, so no risk for those to modify the
VA space either (just wonder if it's a good thing to have to sync
bind/unbind operations waiting on async ones, but that's a different
topic).

> 
> Note that I'm not familiar at all with Nouveau or TTM, and it might
> be something that's solved by another component, or I'm just
> misunderstanding how the whole thing is supposed to work. This being
> said, I'd really like to implement a VM_BIND-like uAPI in pancsf using
> the gpuva_manager infra you're proposing here, so please bare with me
> :-).
> 
> >         2. (un-)map the requested memory bindings
> >         3. free structures and page tables
> > 
> >     - Separated generic job scheduler code from specific job implementations.
> >     - Separated the EXEC and VM_BIND implementation of the UAPI.
> >     - Reworked the locking parts of the nvkm/vmm RAW interface, such that
> >       (un-)map operations can be executed in fence signalling critical sections.
> >   
> 
> Regards,
> 
> Boris
> 

