Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F664A2F8E7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B38610E60A;
	Mon, 10 Feb 2025 19:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Nrelez0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D32110E60B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTEWxPe8B8Wum8eXVDX5hUwjNBhNNdMWJNli9ItwISM=;
 b=Nrelez0Okav55ARJLkfm+qqrceoMnlR7IrL0XVbPou2/EbswXQLfATuakvOZhSx0VRfZRh
 61Wr6On1w9CqbWFhpEZdULEGO5HiRmKCbFAulzP7wCLkjOXCDPSLOmnD9s5Kg1RIYvrW3j
 brP2zX3puxzBFXtp96g+hIv4hRpxcz0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-0hIS53pPM9i3ltFKNvvSyg-1; Mon, 10 Feb 2025 14:38:51 -0500
X-MC-Unique: 0hIS53pPM9i3ltFKNvvSyg-1
X-Mimecast-MFC-AGG-ID: 0hIS53pPM9i3ltFKNvvSyg
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43933eb7f7eso13411615e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216330; x=1739821130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LTEWxPe8B8Wum8eXVDX5hUwjNBhNNdMWJNli9ItwISM=;
 b=BvlHCW18Vb2+VoRxSpFWNDUt4jZB5GfRc0B+XtoM07ItPpcUvAiCWgwfeFWL04YPeT
 4xvINzATmwqLSgIi9QQmE76FpeyRuuGkGIL4P2ghKoPkWHol1AChCJwcsWTI8GJnIC9g
 chXS7mZLk5wgfFbO3xshCeGooZJWVwKWfESX0yWaWwKzcfDBtqOvmXhwv4M9yMxER7Rx
 L/MdEp2Ac8IACNyQAA4Ddt0lorDw3J8Wv0DpzMArtUPMFnAPfnVnnF5UBLej1u3nH67X
 9wPZXk9//FV4AT2ODhP8MeOnSZ3VOWysSRoWDyseTId9mNgb39GiXBJ1zCGH9jbU3LnB
 I6Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzXMPQKHw7eV2rzh5yM9e3n/CIIPa5R41ckxy4hl1F/CKsTKJOzLTcjkQ1Kp6QrVfhTeIHfA2v7KM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkXq6CM+SF6PhyBDFNdTpwvY7olcw8XAjj6Cg8GJbvIqzwUyMd
 EaOtz9C3pg6UgRsxaO+jcIoYOlUGvCNJ8q49+sYbhtQJfli0aHFmMJQvE2caa/gO0GZrFGtSOwq
 NfrKMpebM97hC+61zy0d6bOfwPD2s61UnKFHOfwCi+WA+U8LmetngKejIK9++tFbdDw==
X-Gm-Gg: ASbGncubl6EGt8qruH2CmWQHQIkMO5JMtSFRnj+k4xaa7D8nhfB/ZvIFlavPOAb1j4L
 r6C9ziHe7Ublc+9SILl8zQsXZgiOvcz2TgM2VIfSzYwOAfmuz4KmXQozu8mg/fKGx5bUVE9ahEz
 r0p+hRhwryJdhMfquswTuOH3QBUK+EN0cIuvSTU8XFH3NK9dUAlBc9MgMDtPRFGHRdE+FO0QKyq
 Pc3uAJfhiSpvR3QOrq7Q2we74/qJaHRRkB0B8q/gjC6tSgSxJIPSdKa9YP+sN1hjcIotLMOK0OW
 ACtnlcE06L972+AHXgeSHGpPjqVjoQbUQbBdp8tLVbtP5vS/Hd92PybhbIdHO9U2bQ==
X-Received: by 2002:a05:600c:4f89:b0:439:4bb0:aba0 with SMTP id
 5b1f17b1804b1-4394bb0adb6mr17902715e9.8.1739216329958; 
 Mon, 10 Feb 2025 11:38:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0Un4mhmMUf8CyrAHOSxNb3M+hrifrlRxr2GMjHtCC/u6kqhVG2aMU260gZj/4uoW1cKICNg==
X-Received: by 2002:a05:600c:4f89:b0:439:4bb0:aba0 with SMTP id
 5b1f17b1804b1-4394bb0adb6mr17902495e9.8.1739216329619; 
 Mon, 10 Feb 2025 11:38:49 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43947bdc5c4sm26951255e9.23.2025.02.10.11.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:48 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 damon@lists.linux.dev, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, SeongJae Park <sj@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 12/17] mm/rmap: handle device-exclusive entries correctly
 in page_vma_mkclean_one()
Date: Mon, 10 Feb 2025 20:37:54 +0100
Message-ID: <20250210193801.781278-13-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NTAbYp7EB75K465zCprlgPgPGvryNKWpfWpmRSy1qWY_1739216330
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

Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
we can return with a device-exclusive entry from page_vma_mapped_walk().

page_vma_mkclean_one() is not prepared for that, so teach it about these
PFN swap PTEs. Note that device-private entries are so far not applicable
on that path, as we expect ZONE_DEVICE pages so far only in migration code
when it comes to the RMAP.

Note that we could currently only run into this case with
device-exclusive entries on THPs. We still adjust the mapcount on
conversion to device-exclusive; this makes the rmap walk
abort early for small folios, because we'll always have
!folio_mapped() with a single device-exclusive entry. We'll adjust the
mapcount logic once all page_vma_mapped_walk() users can properly
handle device-exclusive entries.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/rmap.c b/mm/rmap.c
index 7c471c3ea64c4..7b737f0f68fb5 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1044,6 +1044,14 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 			pte_t *pte = pvmw->pte;
 			pte_t entry = ptep_get(pte);
 
+			/*
+			 * PFN swap PTEs, such as device-exclusive ones, that
+			 * actually map pages are clean and not writable from a
+			 * CPU perspective. The MMU notifier takes care of any
+			 * device aspects.
+			 */
+			if (!pte_present(entry))
+				continue;
 			if (!pte_dirty(entry) && !pte_write(entry))
 				continue;
 
-- 
2.48.1

