Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B9D679CC8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 16:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069F010E692;
	Tue, 24 Jan 2023 15:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3091B10E692
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 15:00:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6431210E7;
 Tue, 24 Jan 2023 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1674572399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XLqxBQfQ00tnQcihjlqxyWWIteOiPhmeVkN+U5n5QiU=;
 b=ioVsAhbBdV1YHrLBEs6yIdAAV1QXNCZMBuzPaF312N9LCK2343XbyDbjM+FY8t1ZkxHq4n
 Oiz2oPGK3yovgBjLtnfOF0kKVLRWhKt1RSD2ksahTFWRZVbES3/JrtXujjXbbOKWjgqA2O
 iC2w/WyjLdNarJQAiedANs3mQbkKCFc=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DC75139FB;
 Tue, 24 Jan 2023 14:59:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ScUvIm/yz2PoFgAAMHmgww
 (envelope-from <mhocko@suse.com>); Tue, 24 Jan 2023 14:59:59 +0000
Date: Tue, 24 Jan 2023 15:59:58 +0100
From: Michal Hocko <mhocko@suse.com>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v2 1/4] memcg: Track exported dma-buffers
Message-ID: <Y8/ybgp2FW+e3bjc@dhcp22.suse.cz>
References: <20230123191728.2928839-1-tjmercier@google.com>
 <20230123191728.2928839-2-tjmercier@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123191728.2928839-2-tjmercier@google.com>
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
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 cgroups@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 23-01-23 19:17:23, T.J. Mercier wrote:
> When a buffer is exported to userspace, use memcg to attribute the
> buffer to the allocating cgroup until all buffer references are
> released.

Is there any reason why this memory cannot be charged during the
allocation (__GFP_ACCOUNT used)?
Also you do charge and account the memory but underlying pages do not
know about their memcg (this is normally done with commit_charge for
user mapped pages). This would become a problem if the memory is
migrated for example. This also means that you have to maintain memcg
reference outside of the memcg proper which is not really nice either.
This mimicks tcp kmem limit implementation which I really have to say I
am not a great fan of and this pattern shouldn't be coppied.

Also you are not really saying anything about the oom behavior. With
this implementation the kernel will try to reclaim the memory and even
trigger the memcg oom killer if the request size is <= 8 pages. Is this
a desirable behavior?
-- 
Michal Hocko
SUSE Labs
