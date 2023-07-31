Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2A07697F8
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 15:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0F710E2A5;
	Mon, 31 Jul 2023 13:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF8B10E2A5;
 Mon, 31 Jul 2023 13:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=phaaJIZq1BLWmPqCytuBa+h2XJylFF98eK0c+HuebO4=; b=Fr1NrfcLzdpJVpmcOBL17zaxcV
 zEYs26Dbdcqza8yQ2T/gXt6eJXboPEJDuFGznraLpotq5X7rjBlo3FpAmzHfseZRvk68l8JasNeG0
 +WtScm3eUB5qzFnSVptSpdbfn3qDJe20ysVK0l4UYj/pksK8xkHmndNPZ00AHymM1PT3Pm8xhyoDY
 P+N/gRHEh7Tq3zv150c3HLMnk43p8seEmT9AypoQn+WvEN1JpoUi0OMnBGLkKxGj2S7ARg8vVk7DS
 ncdBCZlrKI1aVZGJJBi4u8phMp2+tpPtCrQZpp5BoEk7L6K4hd2fVmDuvQ7SjuHtMjV1S1M4MQvp1
 CtbLs/0Q==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qQTEs-001wMI-Lv; Mon, 31 Jul 2023 13:47:11 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0F9B93001DD;
 Mon, 31 Jul 2023 15:47:10 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id EB506203EA053; Mon, 31 Jul 2023 15:47:09 +0200 (CEST)
Date: Mon, 31 Jul 2023 15:47:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v3 0/4] mm: convert to vma_is_initial_heap/stack()
Message-ID: <20230731134709.GJ29590@hirez.programming.kicks-ass.net>
References: <20230728050043.59880-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728050043.59880-1-wangkefeng.wang@huawei.com>
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
Cc: stephen.smalley.work@gmail.com, paul@paul-moore.com,
 David Hildenbrand <david@redhat.com>, selinux@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com, acme@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-perf-users@vger.kernel.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, eparis@parisplace.org,
 linux-fsdevel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, christian.koenig@amd.com,
 Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 01:00:39PM +0800, Kefeng Wang wrote:

> Kefeng Wang (4):
>   mm: factor out VMA stack and heap checks
>   drm/amdkfd: use vma_is_initial_stack() and vma_is_initial_heap()
>   selinux: use vma_is_initial_stack() and vma_is_initial_heap()
>   perf/core: use vma_is_initial_stack() and vma_is_initial_heap()
> 
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c |  5 +----
>  fs/proc/task_mmu.c                   | 24 ++++----------------
>  fs/proc/task_nommu.c                 | 15 +------------
>  include/linux/mm.h                   | 25 +++++++++++++++++++++
>  kernel/events/core.c                 | 33 ++++++++++------------------
>  security/selinux/hooks.c             |  7 ++----
>  6 files changed, 44 insertions(+), 65 deletions(-)

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
