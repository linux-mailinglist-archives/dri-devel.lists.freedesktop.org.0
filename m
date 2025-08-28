Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E33B3B412
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D517410EB51;
	Fri, 29 Aug 2025 07:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hkqM/db1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21B810E872;
 Thu, 28 Aug 2025 08:18:33 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-afead3cf280so80887466b.1; 
 Thu, 28 Aug 2025 01:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756369112; x=1756973912; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CFlTc2o50xP7q9jUUn86Cat3HkUhlqoaXfvof6seHm8=;
 b=hkqM/db1vuXdLvB/xlIej8FfHZkMypxrwdWM6lQFeFIYldSM3B3cuzPxCfej4WIFCF
 M0bDOCFjoW4aI2e3sjLNSthBHh+QgwBNecA8mJEG7SFpE5L1in+vadW/EGq/7F68cA9Q
 IVm33QYjUeRs/hfhjvImHegh6Yp2EEnO7VDIPGinkpR07ZkqVVS4Lbrk8vlqtinP6Osk
 FVuacwrOU303NmzV+/YkNF81DQIfGJ6wVfjrdGOSxTDJixDQdxsstHUtuYjHqZ62CuLx
 Mdasbi3x5Fxlhq34nY9iwwcKcLrW8yasXdQKtVzHrrV++5IVq12Q6nQdzgVBWhqAmgHZ
 L1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756369112; x=1756973912;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CFlTc2o50xP7q9jUUn86Cat3HkUhlqoaXfvof6seHm8=;
 b=AW0WvMr1uStW4k14RNmvdtwQSPP9IccfsJrcqwJid8S8TOqQqKnRplg+OBb717mGxA
 87woJ5ttOYNrTjrKu/N2Ove7M7b237aynINpUQvBWC3McbVnyGjghXSTWO8L7uR+a8iQ
 Plo+e2AS2rhI7ohPsF8Glyjx0bEDHUERoRA10u+9P7B6clMXiTymClNbqJxxrgfS6oF8
 MpS1SRpT6X7q+tgTXMu/Fr+hTDqswOBVOUl+B8Cagda4wEc3DMqAEWkUQBeiEZcnfl3M
 7l0tHi9iKW4L1YWOJKviM2/YFQV0b3MGCh20ttHOJ2Yjxd/cO8jeOjwcIgrgibXI3m07
 4f2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFrkCxeBBaBD3laSCrwOhOy/8sCmnl0fQm95OQz4NM9NbS9UIpr7kbQnIqMhn+PMvRVxIsUeMgWJg=@lists.freedesktop.org,
 AJvYcCWjpC2E3Bg2qZNI+ZC3Ni8HD4gXzC0PGpJ2Gxph9DFYYUvfFaBlzAfWQ1oMXvT9Th7hb5KKEhtDe7z0@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/yrUilNSR+nTWZLbhsCIvOwmaUkbOVp2NBxBxocPZBZTpDrDb
 tfofGtilm0KhDbgrLiD/W+lWnDuQgpgJQZ5YdGz+eevWKt67H0l2kukk
X-Gm-Gg: ASbGncuIm0zAQVe8bS5ZhWlQwk59+Pywx45thyOM/N81Rm+B/Rj1RB041zK1bvBU+PR
 JFE1hGEVb6tMENnRnmj0Epe0uJB0LGVrfUniPxdwIutOUfScC6JeKjFUFShDfHMAr85bQyUGA2L
 E4xPsv3l2LyQN49VmvVjnVWuR9OnA/FwJ4oB1Q+h4VzFPHTkWs1xa7UEwBcRYjMV5brfyXfXnQy
 64y+/QyFVnJKn/h3mSlIe4u3dimc/B2lBIub+dcu1ZlTaRf6APvdmZm1QC/eREhZpSFSPZSnh68
 6871QVgqohMCU/848GeMB6KAU2gj3y+nQ+UwigFtOyzYnFzZb14JuS/vuiPSSIf+zAj1VWLa15E
 YQ5GS0il0lmOuPJARIOWYyxUIpxfIHGKR6qvX
X-Google-Smtp-Source: AGHT+IFrqyfe7g2Zl+sLgEHASy1+ip6WVy4aEpiIRxktJ8PetprRYIIgoW+xQR/WhySTtvxcEvhJTw==
X-Received: by 2002:a17:907:1c27:b0:afe:b878:a164 with SMTP id
 a640c23a62f3a-afeb878abecmr620398166b.50.1756369112172; 
 Thu, 28 Aug 2025 01:18:32 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe80daceb5sm811531866b.68.2025.08.28.01.18.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Aug 2025 01:18:31 -0700 (PDT)
Date: Thu, 28 Aug 2025 08:18:31 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
 Zi Yan <ziy@nvidia.com>, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>,
 Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
 io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 12/36] mm: simplify folio_page() and folio_page_idx()
Message-ID: <20250828081831.fv4bs77kihwbffdi@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-13-david@redhat.com>
 <20250828074356.3xiuqugokg36yuxw@master>
 <0e1c0fe1-4dd1-46dc-8ce8-a6bf6e4c3e80@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e1c0fe1-4dd1-46dc-8ce8-a6bf6e4c3e80@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Fri, 29 Aug 2025 07:17:00 +0000
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 28, 2025 at 09:46:25AM +0200, David Hildenbrand wrote:
>> 
>> Curious about why it is in page-flags.h. It seems not related to page-flags.
>
>Likely because we have the page_folio() in there as well.
>

Hmm... sorry for this silly question.

>-- 
>Cheers
>
>David / dhildenb

-- 
Wei Yang
Help you, Help me
