Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88998666F78
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 11:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1CD10E18D;
	Thu, 12 Jan 2023 10:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42F910E18D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 10:25:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 900FC3FB4E;
 Thu, 12 Jan 2023 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1673519138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RFRkZ+Fj3t8T5BZaiHz5NCYqROwzY9AM/nVOyatEKtk=;
 b=kXlRU9udXbFgZotDjntGowEBuvchX+T2tPOQt4l2B/QItP41pyuGf09UekzD58fu0LIxRc
 w76yu+pkH0Ua7YBS6uJ2rwWDxCoFeyaVSAeCGGeNdqLbR3tAQh+xq9uDiO7GTSj2Wj7bNn
 HineNr8vyQXh2nAR99gNAKtfqxMYBuI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6650E13585;
 Thu, 12 Jan 2023 10:25:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9ozhGCLgv2PZJgAAMHmgww
 (envelope-from <mhocko@suse.com>); Thu, 12 Jan 2023 10:25:38 +0000
Date: Thu, 12 Jan 2023 11:25:37 +0100
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeelb@google.com>
Subject: Re: [PATCH 0/4] Track exported dma-buffers with memcg
Message-ID: <Y7/gIRv9aJfPK7/f@dhcp22.suse.cz>
References: <20230109213809.418135-1-tjmercier@google.com>
 <CALvZod4ru7F38tAO-gM9ZFKaEhS0w3KqFbPwhwcTvgJs4xMUow@mail.gmail.com>
 <Y78+rfzXPq5XGs9O@phenom.ffwll.local>
 <20230112075631.wc6fd54ci55drhkp@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112075631.wc6fd54ci55drhkp@google.com>
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
Cc: linux-doc@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>,
 Carlos Llamas <cmllamas@google.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, jstultz@google.com, Zefan Li <lizefan.x@bytedance.com>,
 cgroups@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, android-mm@google.com,
 Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Todd Kjos <tkjos@android.com>,
 selinux@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Eric Paris <eparis@parisplace.org>, Suren Baghdasaryan <surenb@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Muchun Song <muchun.song@linux.dev>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 12-01-23 07:56:31, Shakeel Butt wrote:
> On Wed, Jan 11, 2023 at 11:56:45PM +0100, Daniel Vetter wrote:
> > 
> [...]
> > I think eventually, at least for other "account gpu stuff in cgroups" use
> > case we do want to actually charge the memory.
> > 
> > The problem is a bit that with gpu allocations reclaim is essentially "we
> > pass the error to userspace and they get to sort the mess out". There are
> > some exceptions (some gpu drivers to have shrinkers) would we need to make
> > sure these shrinkers are tied into the cgroup stuff before we could enable
> > charging for them?
> > 
> 
> No, there is no requirement to have shrinkers or making such memory
> reclaimable before charging it. Though existing shrinkers and the
> possible future shrinkers would need to be converted into memcg aware
> shrinkers.
> 
> Though there will be a need to update user expectations that if they 
> use memcgs with hard limits, they may start seeing memcg OOMs after the
> charging of dmabuf.

Agreed. This wouldn't be the first in kernel memory charged memory that
is not directly reclaimable. With a dedicated counter an excessive
dmabuf usage would be visible in the oom report because we do print
memcg stats.

It is definitely preferable to have a shrinker mechanism but if that is
to be done in a follow up step then this is acceptable. But leaving out
charging from early on sounds like a bad choice to me.
-- 
Michal Hocko
SUSE Labs
