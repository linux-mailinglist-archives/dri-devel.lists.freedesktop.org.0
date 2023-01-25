Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAF867B207
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 12:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FB310E7A5;
	Wed, 25 Jan 2023 11:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F01810E7A5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 11:52:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F356B1FF27;
 Wed, 25 Jan 2023 11:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1674647547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SJ/Hov8dA5AtQwjazEvVbMXGIJ9ndLLp47N7ofQ4cx4=;
 b=pXgacsTdHgiGYyBVN9vgcoDkHPc99KMqxN2lHF4x8BCAe49JWYrvjhluYPBo8Aeiyuau/n
 HZpptJzXCIUorXumCdWJLU1ZdriRaVaJLMK8evnFcYo8OX8aItgG9bo+TU9MqtAEMbhTxh
 0FmX6ijtqb1rsOdAc8WxYlw22VbBysI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFD3E1358F;
 Wed, 25 Jan 2023 11:52:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YZ4UMvoX0WP4bAAAMHmgww
 (envelope-from <mhocko@suse.com>); Wed, 25 Jan 2023 11:52:26 +0000
Date: Wed, 25 Jan 2023 12:52:26 +0100
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeelb@google.com>
Subject: Re: [PATCH v2 1/4] memcg: Track exported dma-buffers
Message-ID: <Y9EX+usSpAjZ/8LS@dhcp22.suse.cz>
References: <20230123191728.2928839-1-tjmercier@google.com>
 <20230123191728.2928839-2-tjmercier@google.com>
 <Y8/ybgp2FW+e3bjc@dhcp22.suse.cz>
 <20230124194628.d44rtcfsv23fndxw@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124194628.d44rtcfsv23fndxw@google.com>
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
Cc: linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 Roman Gushchin <roman.gushchin@linux.dev>, cmllamas@google.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, jstultz@google.com,
 Zefan Li <lizefan.x@bytedance.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 android-mm@google.com, Jonathan Corbet <corbet@lwn.net>, jeffv@google.com,
 linux-media@vger.kernel.org, selinux@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org,
 "T.J. Mercier" <tjmercier@google.com>, Muchun Song <muchun.song@linux.dev>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 24-01-23 19:46:28, Shakeel Butt wrote:
> On Tue, Jan 24, 2023 at 03:59:58PM +0100, Michal Hocko wrote:
> > On Mon 23-01-23 19:17:23, T.J. Mercier wrote:
> > > When a buffer is exported to userspace, use memcg to attribute the
> > > buffer to the allocating cgroup until all buffer references are
> > > released.
> > 
> > Is there any reason why this memory cannot be charged during the
> > allocation (__GFP_ACCOUNT used)?
> > Also you do charge and account the memory but underlying pages do not
> > know about their memcg (this is normally done with commit_charge for
> > user mapped pages). This would become a problem if the memory is
> > migrated for example.
> 
> I don't think this is movable memory.
> 
> > This also means that you have to maintain memcg
> > reference outside of the memcg proper which is not really nice either.
> > This mimicks tcp kmem limit implementation which I really have to say I
> > am not a great fan of and this pattern shouldn't be coppied.
> > 
> 
> I think we should keep the discussion on technical merits instead of
> personal perference. To me using skmem like interface is totally fine
> but the pros/cons need to be very explicit and the clear reasons to
> select that option should be included.

I do agree with that. I didn't want sound to be personal wrt tcp kmem
accounting but the overall code maintenance cost is higher because
of how tcp take on accounting differs from anything else in the memcg
proper. I would prefer to not grow another example like that.

> To me there are two options:
> 
> 1. Using skmem like interface as this patch series:
> 
> The main pros of this option is that it is very simple. Let me list down
> the cons of this approach:
> 
> a. There is time window between the actual memory allocation/free and
> the charge and uncharge and [un]charge happen when the whole memory is
> allocated or freed. I think for the charge path that might not be a big
> issue but on the uncharge, this can cause issues. The application and
> the potential shrinkers have freed some of this dmabuf memory but until
> the whole dmabuf is freed, the memcg uncharge will not happen. This can
> consequences on reclaim and oom behavior of the application.
> 
> b. Due to the usage model i.e. a central daemon allocating the dmabuf
> memory upfront, there is a requirement to have a memcg charge transfer
> functionality to transfer the charge from the central daemon to the
> client applications. This does introduce complexity and avenues of weird
> reclaim and oom behavior.
> 
> 
> 2. Allocate and charge the memory on page fault by actual user
> 
> In this approach, the memory is not allocated upfront by the central
> daemon but rather on the page fault by the client application and the
> memcg charge happen at the same time.
> 
> The only cons I can think of is this approach is more involved and may
> need some clever tricks to track the page on the free patch i.e. we to
> decrement the dmabuf memcg stat on free path. Maybe a page flag.
> 
> The pros of this approach is there is no need have a charge transfer
> functionality and the charge/uncharge being closely tied to the actual
> memory allocation and free.
> 
> Personally I would prefer the second approach but I don't want to just
> block this work if the dmabuf folks are ok with the cons mentioned of
> the first approach.

I am not familiar with dmabuf internals to judge complexity on their end
but I fully agree that charge-when-used is much more easier to reason
about and it should have less subtle surprises.
-- 
Michal Hocko
SUSE Labs
