Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8107A21CD2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F89810E7E3;
	Wed, 29 Jan 2025 11:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gyDacMND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE8410E7F0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7tz66Q1mh6b9biGlGMq1Dqed0aye0/ijzbhQ2yLKo0=;
 b=gyDacMND/LhZRFD7mSoTy71Jwlz0dNSoMnvaa/EL86MuK5chqkPYGpwIXNdXKbjCvuCovx
 Gkxy8DbQWMGeiLIeyZKNJv8UDEqBQnaJXh6QFMPoDG9RDuaek4AoOl3TqwGFsUzyQGXPVZ
 PLwp9lFZ8AGepAVyHKfDdJ7U0WR4fV0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-ux0plfAsPTmv1RfZJpxrKg-1; Wed, 29 Jan 2025 06:58:14 -0500
X-MC-Unique: ux0plfAsPTmv1RfZJpxrKg-1
X-Mimecast-MFC-AGG-ID: ux0plfAsPTmv1RfZJpxrKg
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38bee9ae3b7so4422973f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151892; x=1738756692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b7tz66Q1mh6b9biGlGMq1Dqed0aye0/ijzbhQ2yLKo0=;
 b=jY4bBc0oxPf24moC9Hkho0KSePQWrXZFezvgU9qqg+dXtHPNcHAqQD/77NnI/uU6pQ
 7WKd3vRluxcV1lnR7wrTQgZhd2DJ/IOiJkTAra1DhspBmeYvi0Jpl1Prhw/lHtAvptbj
 LIsCF+lDVYgGUih+DWei2unEkOQgXEWPhyHAwKINbs9qmFlrb3zHa7USs1ViljzkD2Ns
 GiSTiisEGWATRPReOBJJGJ1yWN+4qljX9Tne2ziSQurAtM1BF5G43rPj4t8aw1RgB0x5
 YtEN/wRDTt3Q1QMMThBDnVnKhjwwVy8EUhwyH/zfkY4vhFKmsLzB2Ma/cgXKezs9muNV
 /TIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+Q65qgjuVd9bPm3jP6Oj+f8kzwT/sBOwxEASdRHXl6DALJriuArdHEtuwJsWgDI+jWuyI0kr4i8c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFmbjnPPTTO+hWl72iP4CqpVW/u9SKLYvfoinodWXQ35cNRYiH
 82/EX6fz+j7Ey1gLYYQOZJEOyIXbFiH23UURNH540avjNAq6+MLHcd64z1t79SIHeuQjbpqW+r3
 X8ACEW3sjEKEKLa/JyjWSF9JHM7lhq5PghAmKzOeIWDzN+5KjGMkkE19UW1GPArxoKzinjTH6ge
 xW
X-Gm-Gg: ASbGncubP7DzcH4Unu7SVBiVQr8QoP/IIq/itV2Hly43wOr1bmnCB6hNiHnp7WuwKeL
 /sL8TZi1jU0VaHbQzBI2jXwhk1vdocwi+9qFh4+vGW+JLr3VEDMG/t5uwPo+akD/pEoaGJ68Yf+
 IUykouaMytVdtoIcdNKB+y+4lpX9H3A6BIwJ9VcObWqCm1w1uW6ow3nAIf6HRV8Zaz1xQXgnKJp
 DvJsEMAbwDKy6AGw4ltIeK4HF4lrji8LTgb43ET98JkxUG3eFQhgNBGE8/grnlXxwPsQxEH7hiL
 OyeDOR5XQZDUSV2ImGykpzoao6df7/fD/W78PYXIHTxaJPEjRjdg7kVWe2d9HDpS/A==
X-Received: by 2002:a5d:5986:0:b0:38b:e1b3:16dc with SMTP id
 ffacd0b85a97d-38c520b0b02mr2139370f8f.50.1738151892500; 
 Wed, 29 Jan 2025 03:58:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkkUWuvL/Qi4Q+ZXMjYaW+MERJXy55kjeOBJGiA5aHVhI3t0Ux4qagc7L275aZnwYNWB5ItA==
X-Received: by 2002:a5d:5986:0:b0:38b:e1b3:16dc with SMTP id
 ffacd0b85a97d-38c520b0b02mr2139337f8f.50.1738151892123; 
 Wed, 29 Jan 2025 03:58:12 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1bb057sm17068560f8f.62.2025.01.29.03.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:58:11 -0800 (PST)
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
Subject: [PATCH v1 2/4] mm/mmu_notifier: drop owner from MMU_NOTIFY_EXCLUSIVE
Date: Wed, 29 Jan 2025 12:58:00 +0100
Message-ID: <20250129115803.2084769-3-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115803.2084769-1-david@redhat.com>
References: <20250129115803.2084769-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7oJmHLDxwW5o6cKeZapaS8cq1oTYKo766ZXVOhGCLhg_1738151893
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

We no longer get a MMU_NOTIFY_EXCLUSIVE on conversion with the owner set
that one has to filter out: if there already *is* a device-exclusive
entry (e.g., other device, we don't have that information), GUP will
convert it back to an ordinary PTE and notify via
remove_device_exclusive_entry().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 6 +-----
 include/linux/mmu_notifier.h          | 4 +---
 include/linux/rmap.h                  | 2 +-
 lib/test_hmm.c                        | 2 +-
 mm/rmap.c                             | 3 +--
 5 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 39e3740980bb..4758fee182b4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -510,10 +510,6 @@ static bool nouveau_svm_range_invalidate(struct mmu_interval_notifier *mni,
 	struct svm_notifier *sn =
 		container_of(mni, struct svm_notifier, notifier);
 
-	if (range->event == MMU_NOTIFY_EXCLUSIVE &&
-	    range->owner == sn->svmm->vmm->cli->drm->dev)
-		return true;
-
 	/*
 	 * serializes the update to mni->invalidate_seq done by caller and
 	 * prevents invalidation of the PTE from progressing while HW is being
@@ -609,7 +605,7 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
 
 		notifier_seq = mmu_interval_read_begin(&notifier->notifier);
 		mmap_read_lock(mm);
-		page = make_device_exclusive(mm, start, drm->dev, &folio);
+		page = make_device_exclusive(mm, start, &folio);
 		mmap_read_unlock(mm);
 		if (IS_ERR(page)) {
 			ret = -EINVAL;
diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index d4e714661826..bac2385099dd 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -44,9 +44,7 @@ struct mmu_interval_notifier;
  * owner field matches the driver's device private pgmap owner.
  *
  * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
- * longer have exclusive access to the page. When sent during creation of an
- * exclusive range the owner will be initialised to the value provided by the
- * caller of make_device_exclusive(), otherwise the owner will be NULL.
+ * longer have exclusive access to the page.
  */
 enum mmu_notifier_event {
 	MMU_NOTIFY_UNMAP = 0,
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 86425d42c1a9..3b216b91d2e5 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -664,7 +664,7 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags);
 void try_to_unmap(struct folio *, enum ttu_flags flags);
 
 struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
-		void *owner, struct folio **foliop);
+		struct folio **foliop);
 
 /* Avoid racy checks */
 #define PVMW_SYNC		(1 << 0)
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 1c0a58279db9..8520c1d1b21b 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -786,7 +786,7 @@ static int dmirror_exclusive(struct dmirror *dmirror,
 		struct folio *folio;
 		struct page *page;
 
-		page = make_device_exclusive(mm, addr, &folio, NULL);
+		page = make_device_exclusive(mm, addr, &folio);
 		if (IS_ERR(page)) {
 			ret = PTR_ERR(page);
 			break;
diff --git a/mm/rmap.c b/mm/rmap.c
index 4acc9f6d743a..d99dbf59adc6 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2397,7 +2397,6 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
  * make_device_exclusive() - Mark an address for exclusive use by a device
  * @mm: mm_struct of associated target process
  * @addr: the virtual address to mark for exclusive device access
- * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier to allow filtering
  * @foliop: folio pointer will be stored here on success.
  *
  * This function looks up the page mapped at the given address, grabs a
@@ -2421,7 +2420,7 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
  * Returns: pointer to mapped page on success, otherwise a negative error.
  */
 struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
-		void *owner, struct folio **foliop)
+		struct folio **foliop)
 {
 	struct folio *folio, *fw_folio;
 	struct vm_area_struct *vma;
-- 
2.48.1

