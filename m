Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A9BAB36FD
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D667B10E3D5;
	Mon, 12 May 2025 12:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EiqSqx7B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671DA10E3CF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747053271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AsNfuXk++hQsXcSMH0/ZpoD/Dq28xwSeg936k+p2z/0=;
 b=EiqSqx7BvCevIQt6Dyf+XfBRUFGfMYLa6xlrlpJMx+Ny03URQBAgF1Pk2R8LF/hU/XGcdk
 MwptCJAbHV5mdq8Zg8izMk3nlEBD2Lh7X7YXTY1QRXrZ573i8UchXvLTCPAeJPPp3Pq6om
 t4ln7b7fUHpBRinhDTVkzxXoqPV40XM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381--A4cbvTXMMSuQ62zG6gmwA-1; Mon, 12 May 2025 08:34:28 -0400
X-MC-Unique: -A4cbvTXMMSuQ62zG6gmwA-1
X-Mimecast-MFC-AGG-ID: -A4cbvTXMMSuQ62zG6gmwA_1747053267
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a205227595so449960f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 05:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747053267; x=1747658067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AsNfuXk++hQsXcSMH0/ZpoD/Dq28xwSeg936k+p2z/0=;
 b=vRlBafibQAuVJrLfqC0okhL5jTQ/KojBB34kw+cPeotMhHtEjuskUkd8kJKer8BMXx
 ARgCWj6Txs8U9GDsOmL7KHd83kYoMUR8crSPub2IoevciF8AHqDH3fcaAIpqj57j+lbb
 dqELxXkXDJVGOfV7OI4C4UWJGZlchSk8KE31MepBuTkApkpSzSCEQWnQIG0OimJCp2mB
 vbDRV33He4kohHw/XUhldNONFnLXm/tC20PFDGwfNoVEVnuCuMkhYVkJodGCrPZQN2re
 nicsOleORNLeakx0xn6r1Kkco509LixHkbe4zOF8D9H2ErgvjnyJpgerFJjjinXEGynv
 rkag==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/sbhLLTpvXadj3BCIvhCEv1TTIR0gzFXQiC+pC6Utcy95BirVIT2Ii9590qLlpPWeInq0dDO+8j0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZyPZLq5S6WpICXjv7CUjy1lZwaJb2fFY9hu5uspxDxZndrife
 LCZ+2gZcLVWf+h9XlTJ8UkTObIx5BIbLVyx/StdQgyQWBXX10Bm96VWhGDSFPFaTzxGfeIC1Vz4
 h/M5wM+gi5vIvvlp4wIf0r4iAjGl+bjobAISb+4P0xmW8jT1UKaO7q56iUZvCQmoGNQ==
X-Gm-Gg: ASbGncsZtVgEe28XzG1P5A6XLQd0G75rpu+CCiU2kZfDyFVAOy6bTq0Yy9QR0vTSKPi
 8TyfPPVahJyz0lL5FfpYzoo5ddkmBXbGcpz+UsX1n4+QRtwpy/oKAnC9IAtQv3XAxgbT+jM4YNj
 uGcgsVsleQ59fHGQjEpujL3EuJxvBa8EDWJ7qO32wpCMbyRYFV7HaohlQ/w0Wkel+K9Aq/uX7VY
 iscHYgcNxH4EQGvlM+/B1d023IkGGXt+zkyukZznqdAIrULr8FapWtKDZ596X8mWAge603uCYwn
 VTuMRyZO2ffm7tveyZvm9ExVCb3o68MIh55Tl3R2rStRI7Y7EzysmYfs3UmiaCh6T5Kpfsw+
X-Received: by 2002:a05:6000:1a8a:b0:3a2:6bc:3f25 with SMTP id
 ffacd0b85a97d-3a206bc6568mr3282304f8f.36.1747053267151; 
 Mon, 12 May 2025 05:34:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbVOvWh8aR7BY5sT0iHvCaoLmEQsNhObrlGdsawBm2VmjmvFE+wMDlxjPW6z9Q2DtavCs6CQ==
X-Received: by 2002:a05:6000:1a8a:b0:3a2:6bc:3f25 with SMTP id
 ffacd0b85a97d-3a206bc6568mr3282274f8f.36.1747053266780; 
 Mon, 12 May 2025 05:34:26 -0700 (PDT)
Received: from localhost
 (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de.
 [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a1f5a4c583sm12119696f8f.84.2025.05.12.05.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:34:26 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 00/11] mm: rewrite pfnmap tracking and remove VM_PAT
Date: Mon, 12 May 2025 14:34:13 +0200
Message-ID: <20250512123424.637989-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _Z8qAFZPVcF0wy9Bjjq98kqTPBsiHADN-5RQvAr0uXE_1747053267
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

On top of mm-unstable.

VM_PAT annoyed me too much and wasted too much of my time, let's clean
PAT handling up and remove VM_PAT.

This should sort out various issues with VM_PAT we discovered recently,
and will hopefully make the whole code more stable and easier to maintain.

In essence: we stop letting PAT mode mess with VMAs and instead lift
what to track/untrack to the MM core. We remember per VMA which pfn range
we tracked in a new struct we attach to a VMA (we have space without
exceeding 192 bytes), use a kref to share it among VMAs during
split/mremap/fork, and automatically untrack once the kref drops to 0.

This implies that we'll keep tracking a full pfn range even after partially
unmapping it, until fully unmapping it; but as that case was mostly broken
before, this at least makes it work in a way that is least intrusive to
VMA handling.

Shrinking with mremap() used to work in a hacky way, now we'll similarly
keep the original pfn range tacked even after this form of partial unmap.
Does anybody care about that? Unlikely. If we run into issues, we could
likely handled that (adjust the tracking) when our kref drops to 1 while
freeing a VMA. But it adds more complexity, so avoid that for now.

Briefly tested with the new pfnmap selftests [1].

[1] https://lkml.kernel.org/r/20250509153033.952746-1-david@redhat.com

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Pedro Falcato <pfalcato@suse.de>
Cc: Peter Xu <peterx@redhat.com>

v1 -> v2:
* "mm: convert track_pfn_insert() to pfnmap_setup_cachemode*()"
 -> Call it "pfnmap_setup_cachemode()" and improve the documentation
 -> Add pfnmap_setup_cachemode_pfn()
 -> Keep checking a single PFN for PMD/PUD case and document why it's ok
* Merged memremap conversion patch with pfnmap_track() introduction patch
 -> Improve documentation
* "mm: convert VM_PFNMAP tracking to pfnmap_track() + pfnmap_untrack()"
 -> Adjust to code changes in mm-unstable
* Added "x86/mm/pat: inline memtype_match() into memtype_erase()"
* "mm/io-mapping: track_pfn() -> "pfnmap tracking""
 -> Adjust to code changes in mm-unstable

David Hildenbrand (11):
  x86/mm/pat: factor out setting cachemode into pgprot_set_cachemode()
  mm: convert track_pfn_insert() to pfnmap_setup_cachemode*()
  mm: introduce pfnmap_track() and pfnmap_untrack() and use them for
    memremap
  mm: convert VM_PFNMAP tracking to pfnmap_track() + pfnmap_untrack()
  x86/mm/pat: remove old pfnmap tracking interface
  mm: remove VM_PAT
  x86/mm/pat: remove strict_prot parameter from reserve_pfn_range()
  x86/mm/pat: remove MEMTYPE_*_MATCH
  x86/mm/pat: inline memtype_match() into memtype_erase()
  drm/i915: track_pfn() -> "pfnmap tracking"
  mm/io-mapping: track_pfn() -> "pfnmap tracking"

 arch/x86/mm/pat/memtype.c          | 194 ++++-------------------------
 arch/x86/mm/pat/memtype_interval.c |  63 ++--------
 drivers/gpu/drm/i915/i915_mm.c     |   4 +-
 include/linux/mm.h                 |   4 +-
 include/linux/mm_inline.h          |   2 +
 include/linux/mm_types.h           |  11 ++
 include/linux/pgtable.h            | 127 ++++++++++---------
 include/trace/events/mmflags.h     |   4 +-
 mm/huge_memory.c                   |   5 +-
 mm/io-mapping.c                    |   2 +-
 mm/memory.c                        |  86 ++++++++++---
 mm/memremap.c                      |   8 +-
 mm/mmap.c                          |   5 -
 mm/mremap.c                        |   4 -
 mm/vma_init.c                      |  50 ++++++++
 15 files changed, 242 insertions(+), 327 deletions(-)


base-commit: c68cfbc5048ede4b10a1d3fe16f7f6192fc2c9c8
-- 
2.49.0

