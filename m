Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B011C76088F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 06:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB8A10E1A4;
	Tue, 25 Jul 2023 04:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E0510E1A4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 04:30:37 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5700b15c12fso59562387b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 21:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690259437; x=1690864237;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tWKrZ8NMo9KjvgbMCd1iW7SDFdHQCt2OBtFdcss9lZc=;
 b=CE9bJwrf+HXcVDH1yn1NMvtDB/tKmGMcmxcPhvTSnayjAQIUfAR2tq2shodChL5BMx
 LavTI+JdXslwJDgMKIS1QtSWg0lM9e32p/Hpy8QlStv4fzMQWiKi2+Za/F1jRsTUrxiK
 +1fG8uw8y7gW6CNslT/qJ2jq+OYpaot8r4PMEyEEw2yGyGzhGemXUTK7Af+u8A5zy8ub
 TZJaFM5biNEfJq2JHbnMFcEEsPFKa8rhpquYRRGDf3AWWx1ZRhrJzh04u+rhAMGDhvRO
 EewYPcumzYjWfxbRMB9sTPn9iQBjKAw1v7fGpoVu2/lcpNVUnQi6mTscxK9PCoQHZ1K0
 JG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690259437; x=1690864237;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tWKrZ8NMo9KjvgbMCd1iW7SDFdHQCt2OBtFdcss9lZc=;
 b=eEaY3CkP1lTsKJHxFExhUbMSDhILQ2WE63u4+DVohx6fgiiXWzpTTX9HVbJ0EHYe+X
 eyYrKeBVV8j8cLBWlq1+9Z8AEW/fV+GN9wrmNFZVruwH/b8JCNvrlPjcN4DBXVo2QGgd
 kX2n8KjMMdvc+EIv+tWTeoZ9FzaYjgHyhNlLooE9W/vSm4cf0dNqxTClXHB+vNz4Czap
 siFFQ5v5cJrIGdEUIV8MPLVF8YVuKfulyoH+QykwbfCWB6Cq9mtQaVQzu6dzIOMjIS/9
 npN8Gp6xcpfQpAQ/kOHyeTLm21/m5N/gvrV/jhMJoSJd1m34HDAk0SN/qiD3Rt3HYcXw
 yo7Q==
X-Gm-Message-State: ABy/qLZ6N5lZBZLK6RY4Bh+rbkGcb8N9zkp6NN/iZ5tYirb2b5O7qdir
 H91xPlCgbzIMMSVEjiQz1L1y/w==
X-Google-Smtp-Source: APBJJlG+mO4DwCgSfS/gtyCr3I03uItKFvF6sEcfEK53Q9NIL9QUKg1Anii7JyMzLhh/QmA8BAGWyA==
X-Received: by 2002:a81:66c4:0:b0:568:8fa1:7a3 with SMTP id
 a187-20020a8166c4000000b005688fa107a3mr8995069ywc.5.1690259436826; 
 Mon, 24 Jul 2023 21:30:36 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 t70-20020a0dea49000000b0056d443372f0sm3297041ywe.119.2023.07.24.21.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:30:36 -0700 (PDT)
Date: Mon, 24 Jul 2023 21:30:27 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
In-Reply-To: <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
Message-ID: <75e3a74a-68f5-df-9a49-a0553c04320@google.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Jul 2023, Kasireddy, Vivek wrote:
> Hi Jason,
> > On Mon, Jul 24, 2023 at 07:54:38AM +0000, Kasireddy, Vivek wrote:
> > 
> > > > I'm not at all familiar with the udmabuf use case but that sounds
> > > > brittle and effectively makes this notifier udmabuf specific right?
> > > Oh, Qemu uses the udmabuf driver to provide Host Graphics components
> > > (such as Spice, Gstreamer, UI, etc) zero-copy access to Guest created
> > > buffers. In other words, from a core mm standpoint, udmabuf just
> > > collects a bunch of pages (associated with buffers) scattered inside
> > > the memfd (Guest ram backed by shmem or hugetlbfs) and wraps
> > > them in a dmabuf fd. And, since we provide zero-copy access, we
> > > use DMA fences to ensure that the components on the Host and
> > > Guest do not access the buffer simultaneously.
> > 
> > So why do you need to track updates proactively like this?
> As David noted in the earlier series, if Qemu punches a hole in its memfd
> that goes through pages that are registered against a udmabuf fd, then
> udmabuf needs to update its list with new pages when the hole gets
> filled after (guest) writes. Otherwise, we'd run into the coherency 
> problem (between udmabuf and memfd) as demonstrated in the selftest
> (patch #3 in this series).

Wouldn't this all be very much better if Qemu stopped punching holes there?

Hugh
