Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD1CD15E18
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 00:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8174510E43B;
	Mon, 12 Jan 2026 23:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="feqa8xza";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE49010E440
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 23:53:08 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8b1e54aefc5so624097685a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 15:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768261987; x=1768866787; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MFAPVPPrTQcXGzmX4uMQny5ONRwVZsvoYJMZG32QBJM=;
 b=feqa8xzaI2PGqHAXING1kUF3gh9XohkXBW2JeIHEgAPKO0lGL9J9eKMP4iOHOZbUMT
 5eT2qKWaez4z+FvlofahN5HD+fod6+fF7TRPKrAhsbiiuZdIsQtQwxLkBxEfVjQCee9Y
 BldS7KGYkthMXZdAtCcjC3cQDiAkk+dx+m7fj/dgn9S0NCzG3IdYEPNqGhoofcYsDmYb
 XSRQxTOmyioFGd1dR7mZlos2baQb0KtU1VivsGEtqD66RLLlnA4/TBQJMkY0Trq14j1Q
 6RQ0VYCgjYNb7f0Oz2UMIcv9ZB/CzUNyEXXcINiMva4G03ISKtwI6eOZo0fBw6LQjNHL
 HUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768261987; x=1768866787;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFAPVPPrTQcXGzmX4uMQny5ONRwVZsvoYJMZG32QBJM=;
 b=BAUuHyGVpC79u2dxEnOuyLtmGxwc4iKNngEye9AtYiAeV/MOdpDUGPQETEnjorj/5S
 cHwoPa0IfUmXJ9Jgsre3w8SpE2FwF2i1p2MjrSfhFH1T/NCPRDA7YGQDjoURY52k7E9X
 L2XNgF5VH7rJTQptimUfzOhgZdx+MhlDvMRnbyJm9DebaIj7w7MeL0gjUI4RNx0i8jLo
 T+f3mxbWG9XC6lnwoTwln2WBy/vgmYxZPMFUqbrjcpymRPi11ybBrzOZF8DPiZ03Z+Zw
 q085huEURz2fDqtYCgc0JR56tyWapa5cJnutG3gSmyPOhzfg185tGFq5Prny4aTj6GOR
 0s8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWutoaDTY5hKXiA4vSrwwXsX/H8Y+ITo7Nn2Wn5YPDEhyt/bS9zl5UtfkVaHX9L0ydB0JBDdP/FsII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkzNwWQ6Etuxrdj89dK3zDvnc+BQSuZVD2354urjOzBwCupx/q
 5wwglrEYYlGJAE4tDw+sAoctXL2VxRwwA4HCLVnRKD8jHP6oPeB/5Bg7CG0u4FtTvho=
X-Gm-Gg: AY/fxX4Xj2ClNDKQFKiQxfiKdxkFWvD9bv4Ih/097pq7hNRhWGjAzZZ+jUr8Zb/jjHX
 JT2DtZkkdMM+8uK10LVLgZvfFg3VVPTzdPZFoiv8+w2Q+6KS1Iu4sQhbsqrvfYsfD3c9UmhPBm7
 ISR0ZX8FLQ1/sjL8in+3hESWM8voFk/kda24aRryEQ9XxxxasYrfxWOSGZvllvtfxSTVAJwAhmu
 Bo7HmV6VT8xU6pv3XwsagrLglj1A8upcKRsCjWo8p/pmu71HOEYZ/ErmS2+tQJasyxWFIkZTyxv
 0eSpr9LRi6IseDpzf8uNFZyMJ9xZL2cVgNyMSFbIpMsvjBTL83WOAH80wp/e7BNkvSBXf8ugifT
 kv1mJi71Vwe0a8wrNxZF5FoNrYZm5TFoaZ/Z2JkRHRtPrllkEIsjIarCjlqsDOZ81Ny6p0x1bxK
 m3c+gSs4dljMujq6FU9AnfCJUAUjFEdfzhSf+c1K30aQpESSpO9GkfJQWePoozw6gdhCWyfvler
 I+fSA==
X-Google-Smtp-Source: AGHT+IECCLtz04Q1g6y58MlK+cu2G+IQ+shlJTLlvJFkV+wtTDGmcQVfka7R8tosUNuc3dGp+UEbDg==
X-Received: by 2002:a05:620a:4804:b0:8b2:7536:bd2c with SMTP id
 af79cd13be357-8c3894188a8mr2759937485a.78.1768261987580; 
 Mon, 12 Jan 2026 15:53:07 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f530907sm1597443885a.39.2026.01.12.15.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 15:53:07 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vfRic-00000003fUQ-2VnR;
 Mon, 12 Jan 2026 19:53:06 -0400
Date: Mon, 12 Jan 2026 19:53:06 -0400
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
Message-ID: <20260112235306.GN745888@ziepe.ca>
References: <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
 <20260112165001.GG745888@ziepe.ca>
 <86D91C8B-C3EA-4836-8DC2-829499477618@nvidia.com>
 <20260112182500.GI745888@ziepe.ca>
 <6AFCEB51-8EE1-4AC9-8F39-FCA561BE8CB5@nvidia.com>
 <20260112192816.GL745888@ziepe.ca>
 <8DB7DC41-FDBD-4739-AABC-D363A1572ADD@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8DB7DC41-FDBD-4739-AABC-D363A1572ADD@nvidia.com>
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

On Mon, Jan 12, 2026 at 06:34:06PM -0500, Zi Yan wrote:
> page[1].flags.f &= ~PAGE_FLAGS_SECOND. It clears folio->order.
> 
> free_tail_page_prepare() clears ->mapping, which is TAIL_MAPPING, and
> compound_head at the end.
> 
> page->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP. It clears PG_head for compound
> pages.
> 
> These three parts undo prep_compound_page().

Well, mm doesn't clear all things on alloc..

> In current nouveau code, ->free_folios is used holding the freed folio.
> In nouveau_dmem_page_alloc_locked(), the freed folio is passed to
> zone_device_folio_init(). If the allocated folio order is different
> from the freed folio order, I do not know how you are going to keep
> track of the rest of the freed folio. Of course you can implement a
> buddy allocator there.

nouveau doesn't support high order folios.

A simple linked list is not really a suitable data structure to ever
support high order folios with.. If it were to use such a thing, and
did want to take a high order folio off the list, and reduce its
order, then it would have to put the remainder back on the list with a
revised order value. That's all, nothing hard.

Again if the driver needs to store information in the struct page to
manage its free list mechanism (ie linked pointers, order, whatever)
then it should be doing that directly.

When it takes the memory range off the free list it should call
zone_device_page_init() to make it ready to be used again. I think it
is a poor argument to say that zone_device_page_init() should rely on
values already in the struct page to work properly :\

The usable space within the struct page, and what values must be fixed
for correct system function, should exactly mirror what frozen pages
require. After free it is effectively now a frozen page owned by the
device driver.

I haven't seen any documentation on that, but I suspect Matthew and
David have some ideas..

If there is a reason for order, flags and mapping to be something
particular then it should flow from the definition of frozen pages,
and be documented, IMHO.

Jason
