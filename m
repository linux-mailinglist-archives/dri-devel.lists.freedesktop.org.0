Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A384DA21CAA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1036310E7D2;
	Wed, 29 Jan 2025 11:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PyMluvrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C24010E7D1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1V8bFv4UpnBG412679q6Wat0SbxTmvFr7JjVIwnpoX4=;
 b=PyMluvrVFEVhWOvU701IA6uIKr6lGAir04szbsaYqBAGNS55WI/tolZ79NfBkD/phwmC1E
 PhZjed1S9WOdOdYX82hHItlno81InGZCdQJWgjJE+SozHX6YZU0DtWLEVNggFUkmnSTzIK
 SHI/+dwC/fOBsdUHKCqDfKF9PKMCwH8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-pBAilTOfMbyofSTjiyP8iw-1; Wed, 29 Jan 2025 06:54:46 -0500
X-MC-Unique: pBAilTOfMbyofSTjiyP8iw-1
X-Mimecast-MFC-AGG-ID: pBAilTOfMbyofSTjiyP8iw
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38bf4913659so5053307f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151685; x=1738756485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1V8bFv4UpnBG412679q6Wat0SbxTmvFr7JjVIwnpoX4=;
 b=B5HuCbxh3PKcRxoI01NtgaKitIou6HcWXO91GFCuqX7c0lSXD3k9DzXX+/KzdTMLqb
 2aZQgoniyOZor7ioKSg+ppDV0SEJo2i2WZfxHn+iFvEiHmvBb8YLbMLF0AImefNQHGGZ
 lGmmBSMjIlHzvqD1Blm60tpF6m77xXAKBEC/HTKy51lksThU3pqNJS6L1IU849u+gKsT
 YznLTAM92+yL5ObtwCz1DCXzeXkG5/dzZSW2hhkTj4sy42c7+kXej8rqMD5rfwJn5zQH
 ohaJiZeOA9Ur6bwc47WvAGADPNnvEg064FN190s2AuA1TEZGOsXrXg9WDlIkyw+9VCSA
 T9vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDn6ZD5juEw9WxwG6KrWbPUb30F0gamk5JIo07/qGAeQ/32nG/IT/B4sjs15KFGvstGJYr/Jbuq+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqRa/4CZsZg4DLXVgU9kwUH7STN5AVIHoL5Z4b/IQZUwzwWBCs
 DFfJLiba+KoVmnD56lzvOe32GjMiob4Dkl5ri1F8sh2ig2tOSbqbCusdQws62JzMZivKEdt6fwy
 Xsst8GSlFT9qQocFjrP+OtRHMqU9gI04iK8ky/0XzKHOn2ASHuo7rl+s7blAmt75hyNER9XgWRq
 3j
X-Gm-Gg: ASbGncukPF1ZEqbQ2hbyR/qE5aggQ6MYONH4OiC+j2WAeTXV2oWnjam0yJ/RJKOuvVP
 KJ9v8ZkBMfXZupFfgQSZs9wqIoAO61C1fYvyU5NZqRbh3NUIT6pOtSXEIMdVqi8XVoHnsi6y6XI
 SdNFAhX+Tre98nVpJskUst/aG09jzbr76PCi2crfs1XGwXD4X0q+MsmulIhnXziu6oHBpeh+PLb
 YkD2vcAg8sQbMq+fw4KCOTwo0bISBZcjmJ74+QrCyJug4vXR87uS2zW7BJMFGcWDlWAH9qMADHC
 P5GYSgZfUwDNGEN9nycspZPKRCY052LDuHoAH5D8Hd97txA+zyRC5jDLXFKLEAH4wQ==
X-Received: by 2002:a05:6000:1f88:b0:385:e176:4420 with SMTP id
 ffacd0b85a97d-38c5194da70mr2305429f8f.10.1738151685464; 
 Wed, 29 Jan 2025 03:54:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUbIgz0SPBde6y+6m4GBK9jxdSxFJzhj9pSmwm9jjlsojNxFlCvTBxohQUGPQAzMIjP8ET+w==
X-Received: by 2002:a05:6000:1f88:b0:385:e176:4420 with SMTP id
 ffacd0b85a97d-38c5194da70mr2305401f8f.10.1738151685052; 
 Wed, 29 Jan 2025 03:54:45 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-438dcc2ef08sm20681625e9.22.2025.01.29.03.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:43 -0800 (PST)
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
Subject: [PATCH v1 11/12] mm/rmap: handle device-exclusive entries correctly
 in page_vma_mkclean_one()
Date: Wed, 29 Jan 2025 12:54:09 +0100
Message-ID: <20250129115411.2077152-12-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6Q8IWMUJmXdLT78DO5VXhK0k092gHTkK92HyCvuWb80_1738151686
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
non-present nonswap PTEs.

We'll likely never hit that path with device-private entries, but we
could with device-exclusive ones.

It's not really clear what to do: the device could be accessing this
PTE, but we don't have that information in the PTE. Likely MMU notifiers
should be taking care of that, and we can just assume "not writable and
not dirty from CPU perspective".

Note that we could currently only run into this case with
device-exclusive entries on THPs. We still adjust the mapcount on
conversion to device-exclusive, making the rmap walk
abort early (folio_mapcount() == 0) for order-0 folios. We'll fix that
next, now that page_vma_mkclean_one() can handle it.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/rmap.c b/mm/rmap.c
index 77b063e9aec4..9e2002d97d6f 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1050,6 +1050,14 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 			pte_t *pte = pvmw->pte;
 			pte_t entry = ptep_get(pte);
 
+			/*
+			 * We can end up here with selected non-swap entries
+			 * that actually map pages similar to PROT_NONE; see
+			 * page_vma_mapped_walk()->check_pte(). From a CPU
+			 * perspective, these PTEs are clean and not writable.
+			 */
+			if (!pte_present(entry))
+				continue;
 			if (!pte_dirty(entry) && !pte_write(entry))
 				continue;
 
-- 
2.48.1

