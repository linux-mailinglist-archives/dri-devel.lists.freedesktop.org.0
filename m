Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81917D12E04
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 14:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565B410E3CD;
	Mon, 12 Jan 2026 13:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="eXDhQoVq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C177C10E3CD
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 13:45:13 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4ee1939e70bso72171571cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768225513; x=1768830313; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oQVWjYpPCtwp4dXF89g7hQK6KDriflVp74tvOjx72Jc=;
 b=eXDhQoVq3DMjGm5amCRpyKArZcwdgs2ArRllGGKXLAhTvyOCAV8NrxAUn3MBMtS9Hv
 QZKutUpEg7Ub18ivE5xPSF+9WjWeQ/j2WcwfB9+Dv9S8IQQcLqcw3p54jKGtTO/pwc/G
 7B86l3qmVRclekBUeBYL3iCPW6STIadaC7zPkwDlQ31W04dtRczLinamSP8DHI4awyra
 XO9HUxy2Ijp1TXBErwBsQecD55vN+2Uf4CrPxtaJQiLnZVHMTo6fHX/JObgUK4SdSlUZ
 owY21399n1OxhTzu8nl5jztfAaK9oE6Z3LUO8F9r9dzmDB3+ZDO4Wxb40mQi75uxcrYL
 NZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768225513; x=1768830313;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oQVWjYpPCtwp4dXF89g7hQK6KDriflVp74tvOjx72Jc=;
 b=vWhTTaZDjNGPiQ2FZcGgVwHj3tNpxbS9grWHiRNoiHVC7V0I+FqRrdVacAKgklfFaz
 pv2onPrbKtOKztsoiaqycsf6Sn5fI2c2aUOr+3+dfveeMMbNqAxOH+idtmtBC8VshFqY
 3yhuELyHqgnoRasi4iEN1eoqQFdqTqm1G/RwzJDlmYNaYVOz3Y7QiHvCbiNmUFT68cPg
 UKemuQXTTGR52DVH+hp8ll6St5NMmAa6tsYC457+SGophvANkStsYFDzlf1UF8qOQ9qh
 xaodJYksHgXJEd2+UJXYo+qrOW0kuNLInfhXB0wpiHcMTpF1gUkAJh/rnImKtgcCAumM
 fjtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhaQhAdaODZmvyu4h+GmnSHZHOq1Z8WeuVYOxizlxf65gyn9Rl763QFqCJjqqp6OkTrGS6xmpIm3M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgSHMM/m3SOr/1qtQz7JqwqtGiC5MJzpPIVslkdxH60QngS1ei
 rFlUHAKv2hIXKQb/R6zhfrC2SMa1h+njHKSKm+4LAzRBbfzFoDZqfwLsV/lL3jTJ3jM=
X-Gm-Gg: AY/fxX6hHug+B32N30XrBgW824cY4WyfxSXhG+y60AlvLAHeZkB2D12N8lqXyuMro0Z
 g4OwHZwW4loJiMSUtuH1ogKdOdyts3X77yYhx2v/Idt1FNVfci3yJtQZOEfqaeVB9UumWynSEZV
 bZR9kb6HU3raxpf7yYMftb6ZH//SMOKsdreyWrf68syKULcxvMnWjJs6Ea/+kduJ6j41p24VhEb
 7c89MuSzOgw3e2HiI8cX+xH5fo4LdZG1VMS/i6qc9hlr5GllWNeTYCJEgOFVIO6lRgso7RzI84N
 +Jr7d+wTOaukia9HQEXkGxg2wD9+Q2aFvbb6EFHDaR7LURbD8lh0Z6i1/lscx38ozuYCStpxdT+
 oAFrSxFKBov0NkQsHAowd7rG3cU9p9ts42S0rclZzWGZv0A2p3pGaohSlRXbG6QUbHDALVjIwlS
 eMIRg5L6dtyeT1ZKCsE4I1eJmFIx6Jfc+QrNO6HslIQjabZ/6nOYzGg2k+qkvxPpv9J1XFAxbM+
 mPQeA==
X-Google-Smtp-Source: AGHT+IG20+wZaR0cdbZzmqo1CbORIU0XkpxQP0kdASvCc3hNxGR2kbLwFGbi9bRoyfQYpJE34s/36Q==
X-Received: by 2002:ac8:7f4e:0:b0:4ed:6803:6189 with SMTP id
 d75a77b69052e-4ffb49998dfmr285683391cf.53.1768225512643; 
 Mon, 12 Jan 2026 05:45:12 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ffa8e36232sm124159891cf.22.2026.01.12.05.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 05:45:11 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vfIEI-00000003Q1m-3fo1;
 Mon, 12 Jan 2026 09:45:10 -0400
Date: Mon, 12 Jan 2026 09:45:10 -0400
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
Message-ID: <20260112134510.GC745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
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

On Sun, Jan 11, 2026 at 07:51:01PM -0500, Zi Yan wrote:
> On 11 Jan 2026, at 19:19, Balbir Singh wrote:
> 
> > On 1/12/26 08:35, Matthew Wilcox wrote:
> >> On Sun, Jan 11, 2026 at 09:55:40PM +0100, Francois Dugast wrote:
> >>> The core MM splits the folio before calling folio_free, restoring the
> >>> zone pages associated with the folio to an initialized state (e.g.,
> >>> non-compound, pgmap valid, etc...). The order argument represents the
> >>> folio’s order prior to the split which can be used driver side to know
> >>> how many pages are being freed.
> >>
> >> This really feels like the wrong way to fix this problem.
> >>
> 
> Hi Matthew,
> 
> I think the wording is confusing, since the actual issue is that:
> 
> 1. zone_device_page_init() calls prep_compound_page() to form a large folio,
> 2. but free_zone_device_folio() never reverse the course,
> 3. the undo of prep_compound_page() in free_zone_device_folio() needs to
>    be done before driver callback ->folio_free(), since once ->folio_free()
>    is called, the folio can be reallocated immediately,
> 4. after the undo of prep_compound_page(), folio_order() can no longer provide
>    the original order information, thus, folio_free() needs that for proper
>    device side ref manipulation.

There is something wrong with the driver if the "folio can be
reallocated immediately".

The flow generally expects there to be a driver allocator linked to
folio_free()

1) Allocator finds free memory
2) zone_device_page_init() allocates the memory and makes refcount=1
3) __folio_put() knows the recount 0.
4) free_zone_device_folio() calls folio_free(), but it doesn't
   actually need to undo prep_compound_page() because *NOTHING* can
   use the page pointer at this point.
5) Driver puts the memory back into the allocator and now #1 can
   happen. It knows how much memory to put back because folio->order
   is valid from #2
6) #1 happens again, then #2 happens again and the folio is in the
   right state for use. The successor #2 fully undoes the work of the
   predecessor #2.

If you have races where #1 can happen immediately after #3 then the
driver design is fundamentally broken and passing around order isn't
going to help anything.

If the allocator is using the struct page memory then step #5 should
also clean up the struct page with the allocator data before returning
it to the allocator.

I vaugely remember talking about this before in the context of the Xe
driver.. You can't just take an existing VRAM allocator and layer it
on top of the folios and have it broadly ignore the folio_free
callback.

Jsaon
