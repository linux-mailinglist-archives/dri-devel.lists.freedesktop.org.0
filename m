Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7342DA21CCE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE2E10E7E8;
	Wed, 29 Jan 2025 11:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GrfG76jF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66BA10E7E9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d2VUZOG2JXQGulr/59KbaCbJaaQXiPGDaZBI3uCTMkc=;
 b=GrfG76jF7oQ499ALHq7S2EmqzAIN/0OEjnGR/CbhIjOf+ZfM4T4bN3AIUTrAgdGODs51Lb
 CKroefUpP5ZZbxNmlw127IlWuIsWVraA7ySsfJ9A2dtmbfBSwTGQkUiRsoCGe4bbGe5Ufp
 5pfI8LbPmI5nzCxRzNBQ1HcBV0iL7TE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-bn_7kgVGN6eGr9vCvkGHMA-1; Wed, 29 Jan 2025 06:58:08 -0500
X-MC-Unique: bn_7kgVGN6eGr9vCvkGHMA-1
X-Mimecast-MFC-AGG-ID: bn_7kgVGN6eGr9vCvkGHMA
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-385fdff9db5so2368836f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151887; x=1738756687;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d2VUZOG2JXQGulr/59KbaCbJaaQXiPGDaZBI3uCTMkc=;
 b=Kc2wc96UUXYZWREeDHHQ2HKV8+c4LP5qQFyUsKtGTTJw84FVBaw7Oq6CoxLnC535Fl
 9+Gne595sDHvxdOp4u9GNGg3Kc++Nm96e8Ar9pavy4NFZVkrfPO/G3ZdzpTNjCUwkJs0
 izySrXHbv9wmmYir7qvjjYBzAfQFR5aaVUB4MqgcAIoI5VEa4QbUZ3k/X2i2ym/UzyiW
 OGx7DAWkou9f/9nIUo6rR2e3qYMybKwNmEwtaI0NCcn1eVlyohMtXbJ7l8OqqpFjeuR/
 sBR0TM3FNNREK/BApSMLCojL5nL/6dOE6V2QrQX7l5hcFo35p6LdLhYcNp+dxNiGrve3
 l5nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5BhZhlsfm39gTumxOOyVkdyUN8k3ZBr7hO/+8Ck0/1BwQn7Ni2LGVIumtc7lbRGZprqgKqKNWFqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMdLUG7/gMs2Mjcu4TQzA57vzkDytz/OBVmyiuFGGzIoVlSUBz
 ne4uiV8qKTIwadYzvqTcgoI/YhfqrHWa9DpoIMgWM8ES24bpt3nkQxxLsLn98wLd/2Wm7yYCg4t
 ZokxOuqrLXAz6OuoKISjjE7JNZ5gu6l/TXrSvV8AB3dgnAVrtJ1wUwqToF0fCz9jl5g==
X-Gm-Gg: ASbGnctk8mf4hw0qOllqrfBxwQgKKgLMr2VYzaT2n7U4CpbxRsemCDcLkM2x6OgcUpX
 AJpq6b+xwxchEE0I+OJ9R6VWqVG8JpnUYtxS0BBXxltKMuF2bNelZ0VKyRtrKehR+KVmjcmPbUu
 ZGt8y3HfY0TzvpduWDXGETfdmtGJlsAZjnOMlzigZUtwE326d6b36yi3qgC/Vz8laZ7V95xrSJy
 jfNzPtfBPR7TlXXkAeeeS+LDbxm7Ufvp7465GDTnH4qssxS4OEtrlGDkXbKavDTlbmVcHFsmOGK
 tS7UBbir759aEYn6bwrfgE8drjpsg9Si1TEpHwz6dD/PZe1jBhVdXASRp8+u/2LN6A==
X-Received: by 2002:a5d:5f4a:0:b0:385:df84:8496 with SMTP id
 ffacd0b85a97d-38c5194ca26mr2531076f8f.3.1738151887068; 
 Wed, 29 Jan 2025 03:58:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7JXtANqVSB26MQ84y3Q20UL5y0GbKL9q7LZjVMoQlUkfabdqXk/TfkO91TOMW4G3rYudCgA==
X-Received: by 2002:a5d:5f4a:0:b0:385:df84:8496 with SMTP id
 ffacd0b85a97d-38c5194ca26mr2531049f8f.3.1738151886670; 
 Wed, 29 Jan 2025 03:58:06 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1bad87sm16858323f8f.74.2025.01.29.03.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:58:05 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v1 0/4] mm: cleanups for device-exclusive entries (hmm)
Date: Wed, 29 Jan 2025 12:57:58 +0100
Message-ID: <20250129115803.2084769-1-david@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jXUEgVeNx1PjxFBd3hqoHuxpZJt-O3cYbXUwp5rktT4_1738151887
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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

This is a follow-up to [1], performing some related cleanups. There
are more cleanups to be had, but I'll have to focus on some other stuff
next. I might come back to that once I'm stuck on (annoyed by :) )
other things.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>
Cc: Yanteng Si <si.yanteng@linux.dev>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>

[1] https://lkml.kernel.org/r/20250129115411.2077152-1-david@redhat.com

David Hildenbrand (4):
  lib/test_hmm: make dmirror_atomic_map() consume a single page
  mm/mmu_notifier: drop owner from MMU_NOTIFY_EXCLUSIVE
  mm/memory: pass folio and pte to restore_exclusive_pte()
  mm/memory: document restore_exclusive_pte()

 drivers/gpu/drm/nouveau/nouveau_svm.c |  6 +--
 include/linux/mmu_notifier.h          |  4 +-
 include/linux/rmap.h                  |  2 +-
 lib/test_hmm.c                        | 35 ++++++-----------
 mm/memory.c                           | 54 +++++++++++++++++++--------
 mm/rmap.c                             |  3 +-
 6 files changed, 54 insertions(+), 50 deletions(-)

-- 
2.48.1

