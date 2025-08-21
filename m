Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C12B3036E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CE810E3BB;
	Thu, 21 Aug 2025 20:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UTMr6Gx8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF98110E9CC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aOl+Pd7m6DQCTUATshUDhXjEbKNtUx8aQQ0CVjE/d9w=;
 b=UTMr6Gx80u/MdHhmb0nX9KR9K1Y9mBBNZdMhmiTyizUXmPVAka1kPbgfHeSrj+xq5AU449
 31vHiecKeLgib3giSO/EvygS+/4G6YvCO+CVyrFduoeJdrdAMNjkmPmttA0i9gEeMyzGSB
 6GKlHo3EyWP+28+KQHE1pqIN/h3+5rA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-eH4IXy5gPr2079oFFUo__Q-1; Thu, 21 Aug 2025 16:07:23 -0400
X-MC-Unique: eH4IXy5gPr2079oFFUo__Q-1
X-Mimecast-MFC-AGG-ID: eH4IXy5gPr2079oFFUo__Q_1755806842
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45a1b0b6466so9581185e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806842; x=1756411642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aOl+Pd7m6DQCTUATshUDhXjEbKNtUx8aQQ0CVjE/d9w=;
 b=qV1kTHfj2SMvBYCS4KX1GfXPbfK5wok3tYOQK6nIITT6NFc0shUian3WtZttwI2Wk2
 jgA44xd5Zl9Ss+ihavv8Uk6zaPNgtnJ2SJpM05j9m+hXhKUc3BlwZHOvtbdfISZgKpbB
 eZfElQrRCW5glElAHpe+D9TEMaNuz/qhncl92XSVdx445C9z7d/3K18HoTT2MNUAS6HF
 muOqUCNQMu1j058FDGl0dtXzZ2BGZUU3aT/EtiCxvuUaoCRK1fyOnq9EhrcXxO3ztP4h
 RHE2YSQ5Mp/maydNVMse4MnEML8ErVfAIqM0X8Y00Qw4tj1ucrde8cCGVdWAVXjwQAQU
 HvjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7ZBIW74+sX4k0WjjybfA7hHbRPvlNwRMnuAUjerm6t/l0RQBrqWO1bcUSAM+Q06VzLgVN5ftRDdI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweHoxFAXuJtoNJcVmYhYpma0lNQQu7C+z1OoTWGz+DlFpe4QGF
 UOzbZSQ+kTEp37s3iWgyTUYkmPpUR2J+qCOmSz1siw+ftjyn7mEsaASbwp315nReXNc7PlpCdfh
 C+zUoQmQO8P19jVpslPoImpzulQmsu98DMyM0kGNsTvzA0qe06phgDrG6oe6lCcYuXWXe5w==
X-Gm-Gg: ASbGncvXloTSuGoxETZAmSfpFspS4RaLNPaFZ3l91vvR9cozmkgF9CoKLWvjFLN5jY4
 N18kvGhSXQYbFZ9OO+gAFKTZ6B3F9/O9UQ79f3G7CzU+cl6CZtytpxSERKemM5i/FM3w0XPDt90
 O2LbwLGgJHPO8Bq7mVdanju9k9Gyxsbl5nhZTw/BUMZjLhIKz1sJ5RWfJMozuznexwiHAq3WOkl
 /AB+Vw9/bdKsHJUzIcdOQ0xKWHSC1DF7cdBm6oUkHISgGNoa2LsJ5nQl7Uf/YCL3CMN1iu6Lgca
 OB9FFKdLhssWEgzRZzphmCN6Xpgnqhj1RwmJACQ5//qTsyPy1DQF1dDjCDYUnBgiDl5ajJ7x4cs
 i6qq/0PTXG2FpB2F1N9H78A==
X-Received: by 2002:a05:600c:1993:b0:456:e39:ec1a with SMTP id
 5b1f17b1804b1-45b517ad4a9mr2412645e9.14.1755806841707; 
 Thu, 21 Aug 2025 13:07:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtBnzBdejX2oNj8vG9iZBZKJew+pPrkGWxHzVnhFEnb5RkXIsj+cBFTtJrIXnzr/4lYhSU+w==
X-Received: by 2002:a05:600c:1993:b0:456:e39:ec1a with SMTP id
 5b1f17b1804b1-45b517ad4a9mr2412295e9.14.1755806841198; 
 Thu, 21 Aug 2025 13:07:21 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b50dc00a8sm10960275e9.1.2025.08.21.13.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:20 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Shuah Khan <shuah@kernel.org>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
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
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 05/35] wireguard: selftests: remove
 CONFIG_SPARSEMEM_VMEMMAP=y from qemu kernel config
Date: Thu, 21 Aug 2025 22:06:31 +0200
Message-ID: <20250821200701.1329277-6-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tYdxb9lKaEwDDl8qGC_LXcsMXtt23PmGyQiJ-e1jSsA_1755806842
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

It's no longer user-selectable (and the default was already "y"), so
let's just drop it.

Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Shuah Khan <shuah@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 tools/testing/selftests/wireguard/qemu/kernel.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/testing/selftests/wireguard/qemu/kernel.config
index 0a5381717e9f4..1149289f4b30f 100644
--- a/tools/testing/selftests/wireguard/qemu/kernel.config
+++ b/tools/testing/selftests/wireguard/qemu/kernel.config
@@ -48,7 +48,6 @@ CONFIG_JUMP_LABEL=y
 CONFIG_FUTEX=y
 CONFIG_SHMEM=y
 CONFIG_SLUB=y
-CONFIG_SPARSEMEM_VMEMMAP=y
 CONFIG_SMP=y
 CONFIG_SCHED_SMT=y
 CONFIG_SCHED_MC=y
-- 
2.50.1

