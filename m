Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E150D142A3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8652510E41E;
	Mon, 12 Jan 2026 16:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Bat6wu0U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EB610E422
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 16:50:03 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-8908f5ed4aeso52226406d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 08:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768236603; x=1768841403; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eAxh70JY3ShLNfnDxBWsRZWpalCHcaRfsM5YzKZ+W9w=;
 b=Bat6wu0UmG9fuCZn5Iq+jd5OxvWiNpQdIq69eBLJAYXkYQWDeAMwNBJ5Y0b1/2B+d+
 B0G6komz5bqCZYsgSITfSNPdBzcVf0tjViU4xq+Txkgph+iNLcPkLZ7PFGAwpPwOuPkc
 iY8Czei3UIRUh5uOIZpQCl0QZHn9eYXAXI4kazYPlVShGUvbzk4nBmWxDV6oTIgkP4Bx
 qLNRohAt09eNZp4HJdf0cNdSZ1JNHeIBe75r/rx+lcKZhSuyD7Vclo2NzLgLCLq7nwoa
 dbeoOYpcoH3Mkui+6mbyEz1OJkRvlSAW+/48hQ3LQ754slxzzgbwEFseE7AAscvSfFVg
 8WOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768236603; x=1768841403;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eAxh70JY3ShLNfnDxBWsRZWpalCHcaRfsM5YzKZ+W9w=;
 b=g45+V8DLeogpAESdb5Ac1gCSpjqDDoOsQFhnmjrUsz6Gd4V1Fqqp25yyaBIJY0NflR
 oRoO4P2gFD+m57wJC+GNzgQwiP58F/UIFz1mCXUya/Q1FZR8TD5RtS9tcMBzQKET6PBg
 hzwo32y5eT4qZlaukg18yCS71ojjnpQTdQB7q+6h5JBLG6125otK3pZaCp3sIIQW6fJD
 Lin3SfXIL9LegiV0eFsV7v2Dq0iOgLxVUrAiK1IV3Tyox1nQdJc4oTMkg3A5MEd3ed9/
 gr/WkSzT/TmHSKB4rXbFJAD3ObmeA8LoUawzcQvZy+L5bE6soX02pxX3PcDlLZpMamTj
 zL7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwIJgluqJeeDFKdQNvQJzVuDDxESI3o8t+1FgLHWDtYaxwLPZ0XHM52nWGcZzrhb0du8lW5+IqQN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpQGzai+OwyGEwHbLXhMhcDqw5pRPp8F2lKdVwpCZmHVATfF5P
 7iOZDEwJf4v9qZXMmwF93a6vmg3DUGsc9NYVWQvyG8gUpYqW73s78d+Cgh368v6SLOI=
X-Gm-Gg: AY/fxX6TEao+4CdslCiW9gIypB+nDGKve6+lODtqt4sOdvuGQ6GLdwEA6UYd/C95tVo
 2yzB3Bbd2jp8f1fPmbJKBk7V80FsVm/CSSxEinyTIy3r9I4ZZUqQuA42VT0X0J/YZOMlrdRuYjW
 7tZGoENj5QEo4AMPYYn6QPG+Y58s/cndhxgh/suZQIM071r9anDvndIjc4FFw6YDGC9BES4XEa7
 fKRGqaxnoGWhodhGaRR8Xg419qb/Z4KZEgw2ebOj66UN0NaRAcYZzZ+pAaU+HKr40Tkk0RGAFeJ
 1zycG9d5E7sPKsVr4aj4vgnvc56CqvMsBpeFKr47yi1QryHnq5pdvDOe7JPRQGHkvDTv+jZ3kdt
 CRTUO+dNc0MEXH1/kkgUKkBNcagmdJ7eWN3xBrIcCl/dcCP5Ylxe1ixxzuAdbdi+/QQGB234CRO
 vBS+pY7BQwsYKSqyHilUR1lGbEtlPN7od4kzJYBOhadAOeFKgpgLE0a1EtSb/wXCzsnCA=
X-Google-Smtp-Source: AGHT+IE/A98Uf8f6ySXPvh9xamBlLANpUoYS4iXttzp8YDJn905I/7mcjcPxPkNVMXbRPnmf8UaJPg==
X-Received: by 2002:ac8:6f1a:0:b0:4ee:208a:fbec with SMTP id
 d75a77b69052e-4ffb4a1ed32mr255276771cf.66.1768236602551; 
 Mon, 12 Jan 2026 08:50:02 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89077253218sm139285396d6.43.2026.01.12.08.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 08:50:02 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vfL7B-00000003RcK-2R9k;
 Mon, 12 Jan 2026 12:50:01 -0400
Date: Mon, 12 Jan 2026 12:50:01 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zi Yan <ziy@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>, Balbir Singh <balbirs@nvidia.com>,
 Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alistair Popple <apopple@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <20260112165001.GG745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
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

On Mon, Jan 12, 2026 at 11:31:04AM -0500, Zi Yan wrote:
> > folio_free()
> >
> > 1) Allocator finds free memory
> > 2) zone_device_page_init() allocates the memory and makes refcount=1
> > 3) __folio_put() knows the recount 0.
> > 4) free_zone_device_folio() calls folio_free(), but it doesn't
> >    actually need to undo prep_compound_page() because *NOTHING* can
> >    use the page pointer at this point.
> > 5) Driver puts the memory back into the allocator and now #1 can
> >    happen. It knows how much memory to put back because folio->order
> >    is valid from #2
> > 6) #1 happens again, then #2 happens again and the folio is in the
> >    right state for use. The successor #2 fully undoes the work of the
> >    predecessor #2.
> 
> But how can a successor #2 undo the work if the second #1 only allocates
> half of the original folio? For example, an order-9 at PFN 0 is
> allocated and freed, then an order-8 at PFN 0 is allocated and another
> order-8 at PFN 256 is allocated. How can two #2s undo the same order-9
> without corrupting each other’s data?

What do you mean? The fundamental rule is you can't read the folio or
the order outside folio_free once it's refcount reaches 0.

So the successor #2 will write updated heads and order to the order 8
pages at PFN 0 and the ones starting at PFN 256 will remain with
garbage.

This is OK because nothing is allowed to read them as their refcount
is 0.

If later PFN256 is allocated then it will get updated head and order
at the same time it's refcount becomes 1.

There is corruption and they don't corrupt each other's data.

> > If the allocator is using the struct page memory then step #5 should
> > also clean up the struct page with the allocator data before returning
> > it to the allocator.
> 
> Do you mean ->folio_free() callback should undo prep_compound_page()
> instead?

I wouldn't say undo, I was very careful to say it needs to get the
struct page memory into a state that the allocator algorithm expects,
whatever that means.

Jason
