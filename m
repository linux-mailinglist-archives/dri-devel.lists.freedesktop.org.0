Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE669D14FFD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 20:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C4710E063;
	Mon, 12 Jan 2026 19:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ccmkqi1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3FC10E063
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 19:28:19 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8be92e393f8so608774185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768246098; x=1768850898; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=a9AdLI7uJUYtOYd89GixDifcE7N5970uW2swaB6ncSw=;
 b=Ccmkqi1SsEOtm3ZU7Ws11jAuKhWF/D0sLD5Hn2H58ZM+OktVgBJ6+CH+PmPrcm34TT
 qoEfEP6dPxpWYw3+VCcB83NU8BoPJ30yUGNUsa42KnIK8pdX2ysoZzq2QkGVrFSW4S/+
 EoUfbuloGWx5kmzvViEb0QTUePypfweEdIYbsu9jdkgxIRF6CLjmXvkKAF0RusP4d9Xj
 DWhJXqBuzCnh1P7RqbQZzyBFeZNadxI/baj6zyKneT5Ihfz/RPRFoRKV2M83EjlIGvZO
 2b+j5EggJAM9goErNaStya+xrhi+v6icfYEJINtTCtBjXJQaOp/7ZCXqC7i2PVHJe82q
 bQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768246098; x=1768850898;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a9AdLI7uJUYtOYd89GixDifcE7N5970uW2swaB6ncSw=;
 b=HLlqPoWPNGwpVNfBK+mtUVDyFCwHN7Wv3aUp+uDEVPV7IEhydZDXfY1t5fDoUZSMoN
 zgaO7UkCLFkh19QBNCM43vvPp1wJJJM+OA6v+cTNTl3ZiDdxQadXhoHPG3HogUr/NNXh
 eeXah3YzNVdhQQiNJ1C5AeiUI1fVAOYWXMUIAtV3JQzHs7td7r+Ywn03zTJrhf3Cbbk2
 +8gVUGH2IpslK4ykC69uglmuYlUpax2NZRBv5Za2KJBALZt3dASzW2TROz0f5c2P7lqQ
 FnG+YeS/lNUMgrpmHDjzcCgPBROtnBQtmEiSI4NIORe7J2u9qFlkeBDwrweBjgnR+quJ
 5y7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5rVQ1gwXcSEXJB62LNfYb0IQSq85NsUNtuqEPtB4gJ71OiyvaxxIK2eFuFKXXsO3UNks4nIqWWL4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg5KiSxfzpEMylGCO2zwdj4tXPkP2nSWBgJy7lUCXoBp/tDC6z
 aGd/OU1qlqJt5/cWqYd0I0kCakhxOgsz6/TW/ghj93039wVY0Nb1HijyHX2GMmJXkAM=
X-Gm-Gg: AY/fxX79LO2ByVpEK4ypPszT7ptnksCBf3nTjTUByR/RBjVVUj3xwQ0f2jBDryQymBI
 ywT24LtpM/2WyPXjnBjIl6tQLxPqWeRs9PWhL6ZIv0IFmbwylPxU879zKVoQZEmTS+iEguchqJZ
 fDvfZUkejbCv0U1y2Yl6iz32DWc8YtcmlUkJlFAW7a4AXWujzNV9xNYsfE+fwI1qD96DjexPb/h
 sOxU9qWGCoQ0BAJH5k/eypWJJWeidQEyswAEmcYdGwVMXe6g8E/QIsnUvyTrC+P2zL0D1q+lfyB
 eoKrXj31gOAlS/2BXGo8TwX+neM8iQ/xriBWIcdYEXW8HAZRvyNXeFVVFh7sgMHoU99I6vs+g/5
 4qA4c6PO0ymiJzZ9HwMxcfCZi6kQRDSnX87xUIMruiM4e4WAYgu4OzhgNP6F8eNVCcKI7KYZwMk
 3uclmxBcMROMZhlF/p81ZRrhiVrZgtPLqjZ5h4cyrr0pLJtRPGL5G+eknVcanZbMGgWpE=
X-Received: by 2002:a05:620a:1726:b0:8b8:7f8d:c33b with SMTP id
 af79cd13be357-8c5208f18e3mr71372585a.43.1768246097807; 
 Mon, 12 Jan 2026 11:28:17 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f4cd7a3sm1609425185a.24.2026.01.12.11.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 11:28:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vfNaK-00000003cxB-192v;
 Mon, 12 Jan 2026 15:28:16 -0400
Date: Mon, 12 Jan 2026 15:28:16 -0400
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
Message-ID: <20260112192816.GL745888@ziepe.ca>
References: <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
 <20260112165001.GG745888@ziepe.ca>
 <86D91C8B-C3EA-4836-8DC2-829499477618@nvidia.com>
 <20260112182500.GI745888@ziepe.ca>
 <6AFCEB51-8EE1-4AC9-8F39-FCA561BE8CB5@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6AFCEB51-8EE1-4AC9-8F39-FCA561BE8CB5@nvidia.com>
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

On Mon, Jan 12, 2026 at 01:55:18PM -0500, Zi Yan wrote:
> > That's different, I am talking about reaching 0 because it has been
> > freed, meaning there are no external pointers to it.
> >
> > Further, when a page is frozen page_ref_freeze() takes in the number
> > of references the caller has ownership over and it doesn't succeed if
> > there are stray references elsewhere.
> >
> > This is very important because the entire operating model of split
> > only works if it has exclusive locks over all the valid pointers into
> > that page.
> >
> > Spurious refcount failures concurrent with split cannot be allowed.
> >
> > I don't see how pointing at __folio_freeze_and_split_unmapped() can
> > justify this series.
> >
> 
> But from anyone looking at the folio state, refcount == 0, compound_head
> is set, they cannot tell the difference.

This isn't reliable, nothing correct can be doing it :\

> If what you said is true, why is free_pages_prepare() needed? No one
> should touch these free pages. Why bother resetting these states.

? that function does alot of stuff, thinks like uncharging the cgroup
should obviously happen at free time.

What part of it are you looking at?

> > You can't refcount a folio out of nothing. It has to come from a
> > memory location that already is holding a refcount, and then you can
> > incr it.
> 
> Right. There is also no guarantee that all code is correct and follows
> this.

Let's concretely point at things that have a problem please.

> My point here is that calling prep_compound_page() on a compound page
> does not follow core MM’s conventions.

Maybe, but that doesn't mean it isn't the right solution..

Jason
