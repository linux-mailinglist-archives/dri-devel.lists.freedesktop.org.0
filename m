Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6CFB49603
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 18:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FAD10E577;
	Mon,  8 Sep 2025 16:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.b="XK8UCkAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26C610E576;
 Mon,  8 Sep 2025 16:48:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4BD3B44910;
 Mon,  8 Sep 2025 16:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61DDC4CEFE;
 Mon,  8 Sep 2025 16:48:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="XK8UCkAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1757350098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uSnlDYAkih0wYrWYP/wGKkJTrA/JIOiBaO0koXzi78I=;
 b=XK8UCkAOFuRTAaMghbMkYhV8T2QJaLjrkIRbiSC744iVovTaic60Zp5rZ+bImztc351gHd
 RfVyIShQIvu7iaNMFAfleIQgTZHVZIHMKALN8K7z4nH5u5CE2QvEyp5Ifj4Cu887WIjTUu
 PPaVKxR6lJFHUjNXxFZY/txccNFdWt8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 44ea827e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 8 Sep 2025 16:48:18 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-7452b1964f3so4285902a34.1; 
 Mon, 08 Sep 2025 09:48:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUs/5qtbB8hpNa23iJRIFxmv8dWKPXVDRCAG8YFAnIZfK52Y7AcRugmSHpjcA5CqRcECOXZsN5pmGE=@lists.freedesktop.org,
 AJvYcCWGXQ0jm0lVTnToqn5wH/GV00jw4WBdUQtOFBG5jGhz5NFJnK+r5TqatgXNjfoC7KZt+SEolyi8jn7k@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNAF4zc3EbksIw0+DoCXgQst2bid9COx81fB9ZYP0R/8kIhGSg
 q0mPAHsWXT1E7L3TMgrhupkAOKkDrGH07SKmT/TXiTcttXy54K+XUkejWuSzVmC8yXz5s4rjPoq
 +Xn9cDPDunNRxDrkR984Jp5zl3gRcl9o=
X-Google-Smtp-Source: AGHT+IHX8XF6+e0fkSbHw/Gno/Iv8TyBoDNhQdZJKrK/fMw8uizEVVlHqvT1474ZbZbBOA/u0TsCp2SBgWidGOb2gVE=
X-Received: by 2002:a05:6808:3447:b0:43b:2976:6080 with SMTP id
 5614622812f47-43b29b4b108mr4340525b6e.23.1757350096055; Mon, 08 Sep 2025
 09:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-6-david@redhat.com>
In-Reply-To: <20250901150359.867252-6-david@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 8 Sep 2025 18:48:04 +0200
X-Gmail-Original-Message-ID: <CAHmME9okig=9NVGS_vSt525C-kR0mAyCnzSn9iypvu8uj0zA_Q@mail.gmail.com>
X-Gm-Features: AS18NWDEbovQfzN2Y035qma21yXmLeYwXyIh1FHAB52eeHDgW6bSgyj_MCTfArc
Message-ID: <CAHmME9okig=9NVGS_vSt525C-kR0mAyCnzSn9iypvu8uj0zA_Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/37] wireguard: selftests: remove
 CONFIG_SPARSEMEM_VMEMMAP=y from qemu kernel config
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Shuah Khan <shuah@kernel.org>, 
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, 
 Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev, 
 io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Jens Axboe <axboe@kernel.dk>, 
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, 
 kvm@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-mm@kvack.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>, 
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org, 
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, 
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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

Applied this one, actually. Thank you.
