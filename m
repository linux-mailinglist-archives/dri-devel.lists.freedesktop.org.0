Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGPWKZ1Gl2m2wQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 18:21:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0917D1611EE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 18:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6413D10E71F;
	Thu, 19 Feb 2026 17:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RCydY3dT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B81410E71F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771521687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a+MlxWO2a/5NxxDnoLl6rDcBacWRef25tqpr85yXgBM=;
 b=RCydY3dT5Jp4U4g1nemVhH64THAWDmlvyGQ3FaoONVfx2dx6Qlmkrzrap1h2QUfB9fiuV+
 lD3EHW4pVGKPc4vXXKRSYffU7151knNUkee6Sq6rMkn5NrYZxKgF6yAbyhdztaNUDQpBBT
 UzCpyfatzJCnkpizn6nsKx2uBnfLgIg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-GInqFSuLMkmXMNDR8aKivQ-1; Thu, 19 Feb 2026 12:21:26 -0500
X-MC-Unique: GInqFSuLMkmXMNDR8aKivQ-1
X-Mimecast-MFC-AGG-ID: GInqFSuLMkmXMNDR8aKivQ_1771521686
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c70ef98116so975822985a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 09:21:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521685; x=1772126485;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+MlxWO2a/5NxxDnoLl6rDcBacWRef25tqpr85yXgBM=;
 b=pY1kEVVEzqFtELzOxzMoks4mIWPYcP1MmbRSpDDJiL4XDqOiFvvCW/gw0v0YByC14q
 PdFIOfAMJBT9phGcyc3yEaYV6iIO4hNhvSzUYYMBzs+qPWNWzFbHYJLQkYSBAtuDBkIC
 12sbQ2Q06lPyVoxPBsjjixWLaQaJlS9u2vgfqchyCC3pkgNUOEE72Imr1LsMg5MNK5OH
 ezzsfTUqEbm6xSYMuWGy81GiZNq0fsZnS4gr91Tcly5GE6zXpVDyOgI8F0gyqwK+LFMQ
 m1BpsZJdZr4kf/ltVJt7hyPYNZeD3osvMoOle3QtNh/2cRleitZfkUTzp5fztJheUOdY
 Q9gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS8eSaJziXkXQUbfAKpiBmZtpgQXJqAV7jNWG2gD52U9MBm7d21/yUCbojOU79DjDsbqLGdH9rY60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlLTr41qyN9osLHDXcU0sipY0FeGYIs2H6x/DEJmQj13wKCnGT
 fwrq1lL3Xm4fhYPDyy1fr9bcyW0lI00mSZWnW6c3Is/VTAQFYyH0s2erReIasyeLJOJJQu/OV1j
 MlQkFRI/LNwxBzaHedHVVStVqj4+ZEegv67GIH4yNPecK9oLyYz1bMizfucU/swNk1D9lvNtlsJ
 bghA==
X-Gm-Gg: AZuq6aIzSAHrgY4S/3Ksw8rmpCGN4WQq++Bc9YdaXZocrHyoDSmk2NouojmhnCITxcJ
 b52L8ve/aspQvUmUBoWhOOtAnEaktRwr5TuxR6shYe8jHjlh9/6vynITkCUeTMXpOnmQoxlV4EM
 aT4O31+zNlvoXm2PooDCbOlq8FCkR69FkCZOKjneIj5CSaHQArlOAdqKyifeSGU6qqhcFZzaFLO
 1sdgJDMzy4gBGbV+fzdbLvX7ZpS+TdUaS4SvJnmEcvOHOlDjNKC89tw8LSoPicXY/toN1mqxD51
 KDY5eQffOeRe42394OxsG5Txwmwqc5adyybfdL4olaRN3Y4ny682vRP4JZEw3QrDjpOpQx8JkIP
 2Pd4z3/HXaEotvLyohAIYnG09x573FKVp/cIlSxLbJbXx8cG/IMOhQ7yr+HKajlM=
X-Received: by 2002:a05:620a:4148:b0:8cb:3f0e:7740 with SMTP id
 af79cd13be357-8cb79f3269dmr425869985a.51.1771521685030; 
 Thu, 19 Feb 2026 09:21:25 -0800 (PST)
X-Received: by 2002:a05:620a:4148:b0:8cb:3f0e:7740 with SMTP id
 af79cd13be357-8cb79f3269dmr425866385a.51.1771521684499; 
 Thu, 19 Feb 2026 09:21:24 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net.
 [100.17.19.56]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50684b94e9fsm210902201cf.24.2026.02.19.09.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:21:24 -0800 (PST)
Date: Thu, 19 Feb 2026 12:21:23 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Albert Esteve <aesteve@redhat.com>, linux-mm@kvack.org
Subject: Re: [PATCH v2 3/3] dma-buf: heaps: cma: charge each cma heap's dmem
Message-ID: <aZdEMlKE_kGheI-b@fedora>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <20260218-dmabuf-heap-cma-dmem-v2-3-b249886fb7b2@redhat.com>
 <20260219-illustrious-tungsten-starfish-5dad8c@houat>
MIME-Version: 1.0
In-Reply-To: <20260219-illustrious-tungsten-starfish-5dad8c@houat>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BW80uIzkPA0msh81DRWBmyCU9W72im62YY5PQmaJ0Vs_1771521686
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:aesteve@redhat.com,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[echanude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[echanude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0917D1611EE
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 10:16:37AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Feb 18, 2026 at 12:14:12PM -0500, Eric Chanudet wrote:
> > The cma dma-buf heaps let userspace allocate buffers in CMA regions
> > without enforcing limits. Since each cma region registers in dmem,
> > charge against it when allocating a buffer in a cma heap.
> > 
> > Signed-off-by: Eric Chanudet <echanude@redhat.com>
> > ---
> >  drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..bbd4f9495808da19256d97bd6a4dca3e1b0a30a0 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -27,6 +27,7 @@
> >  #include <linux/scatterlist.h>
> >  #include <linux/slab.h>
> >  #include <linux/vmalloc.h>
> > +#include <linux/cgroup_dmem.h>
> >  
> >  #define DEFAULT_CMA_NAME "default_cma_region"
> >  
> > @@ -58,6 +59,7 @@ struct cma_heap_buffer {
> >  	pgoff_t pagecount;
> >  	int vmap_cnt;
> >  	void *vaddr;
> > +	struct dmem_cgroup_pool_state *pool;
> 
> I guess we should add an #if IS_ENABLED #endif guard for dmem?
> 

Sure, I saw the other user (ttm) didn't, but that makes sense as the
field is useless if dmem is not enabled.

> >  };
> >  
> >  struct dma_heap_attachment {
> > @@ -276,6 +278,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
> >  	kfree(buffer->pages);
> >  	/* release memory */
> >  	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
> > +	dmem_cgroup_uncharge(buffer->pool, buffer->len);
> >  	kfree(buffer);
> >  }
> >  
> > @@ -319,9 +322,17 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
> >  	if (align > CONFIG_CMA_ALIGNMENT)
> >  		align = CONFIG_CMA_ALIGNMENT;
> >  
> > +	if (mem_accounting) {
> > +		ret = dmem_cgroup_try_charge(
> > +			cma_get_dmem_cgroup_region(cma_heap->cma), size,
> > +			&buffer->pool, NULL);
> 
> This alone doesn't call for a new version, but adhering to the kernel
> coding style would look like this:
> 
> +		ret = dmem_cgroup_try_charge(cma_get_dmem_cgroup_region(cma_heap->cma),
> +					     size, &buffer->pool, NULL);

Will add to v3 with the other changes.

Thanks,

> 
> It looks good to me otherwise,
> Acked-by: Maxime Ripard <mripard@kernel.org>
> 
> Maxime



-- 
Eric Chanudet

