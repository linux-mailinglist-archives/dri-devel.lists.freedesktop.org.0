Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A48D1FE9A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 16:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB78F10E2C2;
	Wed, 14 Jan 2026 15:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PeErgJ/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A706110E2C2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 15:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768405631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gzUsW5No6dGH8ZciSrcNEaMmqaGyJ5Qr5Ou1SRqIt3k=;
 b=PeErgJ/tmV0XNSk70zoPZN7G7MFkKlkdRGHB6QgyWQ7WX6quAbctiiH6P5pVwjhrxU7OR0
 zGHmef8a9zi57wUL8tXCzVEFJg9GJxLcAGWZN2V6wV61cN1iZrHg3hjNfaP66nDe04Lwwm
 82v1KxsDalTkcOHfHWZo8//bat3waMg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-mFPuL0OQPAetsbMgEKlzxw-1; Wed, 14 Jan 2026 10:47:09 -0500
X-MC-Unique: mFPuL0OQPAetsbMgEKlzxw-1
X-Mimecast-MFC-AGG-ID: mFPuL0OQPAetsbMgEKlzxw_1768405629
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-50147745917so42690481cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:47:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768405629; x=1769010429;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gzUsW5No6dGH8ZciSrcNEaMmqaGyJ5Qr5Ou1SRqIt3k=;
 b=L2nvyAQ5r0k8ejmIcYpYFc/V+f29SK+Iorj52xiBcFPIQIVQPl0Vz9dGyxYzfRbUou
 W2BrSoKp8JU5asVl9/Juqocr8A0QjUUD4h3aETaHGCv56UNbv1wjDsR3V90yvzXMWMZ0
 yXdalgnqHZctrl1a83lAAPsrWE9+1PByw4Vq50Hs5k9ACFe5+Fhje4Qzzxs2tSKETQ7h
 VPPGux5f/5MXNN+aMpWdSYemRZs4ptP4g1hEEpNsjx4rbOOblileeKlUtkuAOyvcq+4r
 IzP1UNtumlZWGlwjIoCCAmT3nJ4MhtTOfmhHLxJqwXzA5fPtL5b9XXb6g+SF1PPTWQ6m
 VNWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBc0DGXgYsODoVhkuBV+HnkHxhblNu+YEcxQC8vjJQ6/RoszHVM2htHbvDxQHuCWoVnVaC6WXJKFI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoEWI33Z1z6iEiftWWCaVoV7c5PUAr3IRuy7M8kj8DqOqzH/Ru
 eBpdtgQIAKSXb8JzUzLGVEBSxct6hIdO/GlWlCwNZUYuTXR2zjW9wI4AUYXytXNCG3EhAgSPMNo
 qOwMn9CFGLFmXWcIzmIVD2QiqdayyuTnCX13gdmXiyz2oyp9V9sK+WxaJrzOCjneP+f2fkQ==
X-Gm-Gg: AY/fxX7Ta9RuYApbzusMcQSHadG1L4r/8HBFLZoZVSiGyI416JaISbR4olAKt3+lINq
 XvTw1pWBVmOg0y7sskRxOioCU1v9B6cpu3NcWhD4fscAegpmDl3zPz5DM0byqgjuN95tN+P7XGk
 q8PnB9QA37hIi9pKgCOOvY/Y8D/02aybA09zndh3KrMYOdLpSYrNnGvtGQ4Hca6LFYdnluOHmja
 LQoWAJb8o7XWNTeV7zI2W0XX2smnNdDBRKmOxF9U1lRISJjlOQ/psySJzZuvNCULcBLKcctySfF
 YbXCDFCahR3PFO58kNOSszNZHaDpaR+evskn9qA6DdJzxGVc9YOzZ3ed42CGv5O5ui/z7YupW4e
 oYV+svKHhMDX6l20WZy6OCamT4ALgDrQ8O2RiyOr65JcS7hL8mlA=
X-Received: by 2002:a05:6214:1242:b0:889:7c5b:8134 with SMTP id
 6a1803df08f44-89274367e44mr36520866d6.27.1768405629304; 
 Wed, 14 Jan 2026 07:47:09 -0800 (PST)
X-Received: by 2002:a05:6214:1242:b0:889:7c5b:8134 with SMTP id
 6a1803df08f44-89274367e44mr36520486d6.27.1768405628751; 
 Wed, 14 Jan 2026 07:47:08 -0800 (PST)
Received: from localhost (pool-100-17-20-16.bstnma.fios.verizon.net.
 [100.17.20.16]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890772682besm179575456d6.50.2026.01.14.07.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 07:47:08 -0800 (PST)
Date: Wed, 14 Jan 2026 10:47:07 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Maxime Ripard <mripard@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dma-buf: system_heap: account for system heap
 allocation in memcg
Message-ID: <urjkdpeypk2uln6lkfi3fd54aqjlrirq23idl7wrnouuhox5rh@amxjnxrqs4lq>
References: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
 <20260113-dmabuf-heap-system-memcg-v2-2-e85722cc2f24@redhat.com>
 <7a0fcf24-09de-4f6e-8a0b-7b631b1315bb@amd.com>
MIME-Version: 1.0
In-Reply-To: <7a0fcf24-09de-4f6e-8a0b-7b631b1315bb@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nHgcyXQFWQVVB7HqfyAfqJhk1CD6kkc1VRz4rCHSAVA_1768405629
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Wed, Jan 14, 2026 at 11:38:27AM +0100, Christian König wrote:
> On 1/13/26 22:32, Eric Chanudet wrote:
> > The system dma-buf heap lets userspace allocate buffers from the page
> > allocator. However, these allocations are not accounted for in memcg,
> > allowing processes to escape limits that may be configured.
> > 
> > Pass __GFP_ACCOUNT for system heap allocations, based on the
> > dma_heap.mem_accounting parameter, to use memcg and account for them.
> > 
> > Signed-off-by: Eric Chanudet <echanude@redhat.com>
> > ---
> >  drivers/dma-buf/heaps/system_heap.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> > index 4c782fe33fd497a74eb5065797259576f9b651b6..139b50df64ed4c4a6fdd69f25fe48324fbe2c481 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -52,6 +52,8 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
> >  static const unsigned int orders[] = {8, 4, 0};
> >  #define NUM_ORDERS ARRAY_SIZE(orders)
> >  
> > +extern bool mem_accounting;
> 
> Please define that in some header. Apart from that looks good technically.

Thank you for the review, I can move it to linux/dma-heap.h in a v3
since it's intended for other heaps as well.

> But after the discussion it sounds more and more like we don't want to account device driver allocated memory in memcg at all.

From the threads in v1 I thought adding the switch left open a
consideration to use memcg with driver allocated memory for userspace,
even with the known caveats that implies. Re-reading your last reply[1],
that's not quite the case it sounds like.

Best,

[1] https://lore.kernel.org/all/e38d87d3-a114-43f9-be93-03e9b9f40844@amd.com/

> 
> Regards,
> Christian.
> 
> 
> > +
> >  static int dup_sg_table(struct sg_table *from, struct sg_table *to)
> >  {
> >  	struct scatterlist *sg, *new_sg;
> > @@ -320,14 +322,17 @@ static struct page *alloc_largest_available(unsigned long size,
> >  {
> >  	struct page *page;
> >  	int i;
> > +	gfp_t flags;
> >  
> >  	for (i = 0; i < NUM_ORDERS; i++) {
> >  		if (size <  (PAGE_SIZE << orders[i]))
> >  			continue;
> >  		if (max_order < orders[i])
> >  			continue;
> > -
> > -		page = alloc_pages(order_flags[i], orders[i]);
> > +		flags = order_flags[i];
> > +		if (mem_accounting)
> > +			flags |= __GFP_ACCOUNT;
> > +		page = alloc_pages(flags, orders[i]);
> >  		if (!page)
> >  			continue;
> >  		return page;
> > 
> 

-- 
Eric Chanudet

