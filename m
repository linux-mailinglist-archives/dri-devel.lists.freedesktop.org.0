Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B9DBDD746
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 10:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E9410E73B;
	Wed, 15 Oct 2025 08:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="WFrWyntZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB32E10E73B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:40:14 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b3f5a6e114dso90772866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1760517613; x=1761122413; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fDsY2VBapz+UptqvTnMcZt7pORUL703BjZYmcP5YKY0=;
 b=WFrWyntZJDqB24JMOQxYQh9ZmNUpTWAjSERuF6fnMWQyLp9M32Gf+naIVcsRnjKePD
 y7UKE/PztCX+M/bbLw/omOHt1E8kMTPjWd+BUXf9AlQWPpSv2psJo9dPqa3ZEfHD9/7w
 6WPkCqGZZNcmKwxDoC/2CHVu1sE8Gx/fSsqX6rTY7p0br162aVckol+I7lr5gOMpxPsc
 VLYwUBcDN41sNCIxPo9d/vJDHO64abZA4LgdcrTTCZw6+MtJXOaokHb883UkuQzFoU+d
 eFVh5Y1Zc2tYGBC7C6z6Mif1JlXEH/26sxjS1g+cXK5WiBqHb/MXtC++06lsPvwnWZXR
 A5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760517613; x=1761122413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fDsY2VBapz+UptqvTnMcZt7pORUL703BjZYmcP5YKY0=;
 b=ivs0UKtvUeqgkjPMbrieA/Y2Y16yOCL3ABuyj3ws3UhhRp51t8cVBsSxKBoOHdJ3Pe
 JzZLtYil5GsUHtCdAkDrj5ijIC5D2q3FKTvFFwVDXkgxJ8H3GM6fU2ZNm7u1wIVvKFnh
 9xSQa2/7rGXn7Zwmyi6GtYVwG5QOui153ZZDfgJlCOXhCgasBU3Jjtp0vJDCpoAkL+r+
 OzmrviXZ2Xs5QUALf8E4Jz/eEJJ/tA9lUxkqabuZ0/Q70tLY6fUBOwCl99no29oSz2gO
 GaNu7dbcs4YoLpz7oyrHVTMJWBhe9lfbR+cqEKUTyB+yEcoyvb+hEQfWbTIub/0Ct7L/
 GKZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW583OdNIAVxLhbCqwpQr3uQeAh/HsTaAlbkMxTq7wK/0qBtr5TF8Cur4EQtEs5xhzoTaFBEXvefuA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkjhwJ5LFW11l1VX5c5LCeyFc0g3SDWz8AgQLL4HQzKllsDjQL
 QVjhwxMhdDEQYY4gJTicoR3rG3nCthL1/5LY3VWm+/DzIoxD5sxT02iixnlWXfpWjeY=
X-Gm-Gg: ASbGncth3E8k5LLxBVVL6Yd85LtJzBDBRVb4gbRjpJB0DlLI6hKR2ZfEmZKbbnSBEGs
 nfmblys3r/3lYvqHTPS6+tIDDdfzlbDzuzWg5gEc0SMkLgX/poEXboAZEj+fvpWWN8dnXNnRpDl
 SKMQ77I0CMYPGqQTqlhDIV+GsNgRJi19tJuFsWxjhDVw4thHaBhO2JLklVTnrxYbj+/oI71vPmo
 KAXolnj289j6/xdoPP+CT1OUrW9qXPycuHI4sSjS7bdxEIsnUUMLcQuOCafv+jSM7sY8MhEieRk
 iPmvNjTly/hOycZFfvCKQWD0TQ6o90l6sRf59/tjmmGSbxSrMvgZCGD13KrsNzJe2cvtSpMxZXH
 cHu2RfpG/3NJNqHDAEH0eYFoYmxubzRT5OkeaL1bMXKcQ09C/kY1u76Q7kC2nX/jufCotlQ8f+S
 l9IB7Jv2qDF4ZGMrI9xnlsVYwdGF0B2wigLi8uyJMCxAxvXOqzdc3FM+V4rA==
X-Google-Smtp-Source: AGHT+IELGd1QIrFF53QcX+I76rx+ZG0TLeQwEgYCUqwVFMJIjoxdZrhJJkMTqEZ8KN0QoxSWe07NSA==
X-Received: by 2002:a17:907:e8f:b0:b44:fb0c:5c37 with SMTP id
 a640c23a62f3a-b50ac1c480dmr1491862066b.6.1760517613246; 
 Wed, 15 Oct 2025 01:40:13 -0700 (PDT)
Received: from mordecai.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz.
 [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cba45afc5sm170229166b.37.2025.10.15.01.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 01:40:12 -0700 (PDT)
Date: Wed, 15 Oct 2025 10:40:08 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Zhaoyang Huang <huangzhaoyang@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Suren Baghdasaryan <surenb@google.com>,
 "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Mel
 Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
Message-ID: <20251015104008.4bcd99e7@mordecai.tesarici.cz>
In-Reply-To: <CAGWkznFG2_WGmLRmHnjV-49iTX0mrt9jxQBzZYK=K9U7eKJD0g@mail.gmail.com>
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
 <87953097-a105-4775-88a5-9b3a676ff139@amd.com>
 <CAGWkznGN7W-txq_G+xpZ6DtH_1DNorYc=CxqUjebo7qfB4Sxsw@mail.gmail.com>
 <ecba7133-699c-4f3e-927c-bad5bd4c36a3@amd.com>
 <20251014171003.57bbfd63@mordecai.tesarici.cz>
 <97da9924-9489-4d30-a858-8ee5c87bc031@amd.com>
 <CAGWkznGnmb=8GgcrfDvY2REHdRZYVXZy=F3thXhK0FaSoiK7tw@mail.gmail.com>
 <aO8TKQN6ifOSMRSC@casper.infradead.org>
 <CAGWkznFG2_WGmLRmHnjV-49iTX0mrt9jxQBzZYK=K9U7eKJD0g@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 15 Oct 2025 13:52:57 +0800
Zhaoyang Huang <huangzhaoyang@gmail.com> wrote:

> On Wed, Oct 15, 2025 at 11:21=E2=80=AFAM Matthew Wilcox <willy@infradead.=
org> wrote:
> >
> > On Wed, Oct 15, 2025 at 09:12:07AM +0800, Zhaoyang Huang wrote: =20
> > > > Could be that we need to make this behavior conditional, but somebo=
dy would need to come up with some really good arguments to justify the com=
plexity. =20
> > > ok, should we use CONFIG_DMA_BUF_BULK_ALLOCATION or a variable
> > > controlled by sysfs interface? =20
> >
> > No.  Explain what you're trying to solve, because you haven't yet. =20
> Dma-buf works as a memory allocation backend could loop thousands of
> times alloc_pages for allocating order-0 pages to fulfill the dozens
> MB demand, this commit would like to replace the loop by once
> alloc_pages_bulk. Whereas, alloc_pages_bulk_array perhaps introduces
> extra memory allocation along with direct-reclaim which could be more
> expensive than iterating the list. so call back the API
> alloc_pages_bulk_list as well

This does not quite explain it. IIRC you mentioned allocating 18M as an
example. The ideal outcome in that case is:

- 16 order-8 compound pages
- 32 order-4 compound pages
-> total 48 calls to alloc_pages()

But presumably, that's not what happens, because fragmentation makes
(some of) those order-8 allocations fail. Since you talk about
thousands of loop iterations, it looks like even order-4 allocation
fail in your case. Then I agree there's not much value in trying to
avoid further fragmentation, and after so many order-0 allocations,
it's probably also pointless to do memory reclaim.

OTOH I can see why the opposite approach is a bad idea in situations
where fragmentation can be avoided. To make things even worse,
alloc_pages_bulk() will rather split pages in the preferred zone than
try allocating from the next best zone.

To sum it up, Zhaoyang, can you please describe in more detail what
happens in your scenario and what you believe should happen instead?

Petr T
