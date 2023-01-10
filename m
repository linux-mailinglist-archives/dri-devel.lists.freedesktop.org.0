Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48820663BFB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1EE10E12B;
	Tue, 10 Jan 2023 08:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCDF10E56F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 08:58:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4930267AEB;
 Tue, 10 Jan 2023 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1673341100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MQLMOsWeyfQ9OMwOEPpBfSY/zX1K5gLRGoJXs0PRFhQ=;
 b=d0/gJhZr3338arujv292RDCpaFVCNpNRhfmbIWIBvXye7cZy8BnXDKXCy9uBlP+DXmqzhv
 vH5AzxAF9dGjzxCxyUj1ty+EwLrjZ3mqqo1g8JsfnV+KA79R00NSzTgm9DNtTFXOX4Gf8S
 h+jlN7NEV2XA5L/y7LnIoWd7unR8GQs=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 28CB313338;
 Tue, 10 Jan 2023 08:58:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 36wFB6wovWP/IgAAMHmgww
 (envelope-from <mhocko@suse.com>); Tue, 10 Jan 2023 08:58:20 +0000
Date: Tue, 10 Jan 2023 09:58:19 +0100
From: Michal Hocko <mhocko@suse.com>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH 1/4] memcg: Track exported dma-buffers
Message-ID: <Y70oqxejnUqkJVPx@dhcp22.suse.cz>
References: <20230109213809.418135-1-tjmercier@google.com>
 <20230109213809.418135-2-tjmercier@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109213809.418135-2-tjmercier@google.com>
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
Cc: android-mm@google.com, Muchun Song <muchun.song@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, daniel.vetter@ffwll.ch,
 cgroups@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 Shakeel Butt <shakeelb@google.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 jstultz@google.com, Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 09-01-23 21:38:04, T.J. Mercier wrote:
> When a buffer is exported to userspace, use memcg to attribute the
> buffer to the allocating cgroup until all buffer references are
> released.
> 
> Unlike the dmabuf sysfs stats implementation, this memcg accounting
> avoids contention over the kernfs_rwsem incurred when creating or
> removing nodes.

I am not familiar with dmabuf infrastructure so please bear with me.
AFAIU this patch adds a dmabuf specific counter to find out the amount
of dmabuf memory used. But I do not see any actual charging implemented
for that memory.

I have looked at two random users of dma_buf_export cma_heap_allocate
and it allocates pages to back the dmabuf (AFAIU) by cma_alloc
which doesn't account to memcg, system_heap_allocate uses
alloc_largest_available which relies on order_flags which doesn't seem
to ever use __GFP_ACCOUNT.

This would mean that the counter doesn't represent any actual memory
reflected in the overall memory consumption of a memcg. I believe this
is rather unexpected and confusing behavior. While some counters
overlap and their sum would exceed the charged memory we do not have any
that doesn't correspond to any memory (at least not for non-root memcgs).

-- 
Michal Hocko
SUSE Labs
