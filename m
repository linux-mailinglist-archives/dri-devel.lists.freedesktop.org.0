Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDBxE676oWlkyAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 21:12:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC7A1BD58C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 21:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC5410EC33;
	Fri, 27 Feb 2026 20:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XV3R41u2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E72C10EC33;
 Fri, 27 Feb 2026 20:12:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EAAFE41843;
 Fri, 27 Feb 2026 20:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047EBC116C6;
 Fri, 27 Feb 2026 20:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772223146;
 bh=aB5tiNSbiWIs8J38wzKTGn9gBoLw1Ed2QFc8m6G1lhE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XV3R41u27yOs3AucAXItd/ZxAZjAbvL9zkvtgql+u+4ijDgzXZEbk77WEppDG6XbQ
 RaRDFQEIdi93XVV3MnYwhO+PQuYzL6HPudiNqhTkElOIxON9zpQ28ddXnRauD5K7xI
 pPAPZLRWc+u8ZveolZp8sk3xfxpltOLQDdxGrANzjZcI65k2mZV2C7NoEkTTWxEEvR
 CAFqu7YxseHBUNNfvGMccb+W5iBgk9khfRU0vAq0qlcZ/q5lDlnaLNcSa+FLgrhULj
 YjzvWS5u0pea0U3pcj1C2Qe1JsARvSTKUCz1+bSDPl3+jOtxbrGUap4h/9n2umCd7p
 tlC/aFeo6fWmw==
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 David Rientjes <rientjes@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
 Dimitri Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, x86@kernel.org
Subject: [PATCH v1 12/16] mm: rename zap_vma_pages() to zap_vma()
Date: Fri, 27 Feb 2026 21:08:43 +0100
Message-ID: <20260227200848.114019-13-david@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227200848.114019-1-david@kernel.org>
References: <20260227200848.114019-1-david@kernel.org>
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kvack.org,kernel.org,linux-foundation.org,oracle.com,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[74];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CDC7A1BD58C
X-Rspamd-Action: no action

Let's rename it to an even simpler name. While at it, add some
simplistic kernel doc.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/powerpc/platforms/book3s/vas-api.c | 2 +-
 arch/powerpc/platforms/pseries/vas.c    | 2 +-
 include/linux/mm.h                      | 6 +++++-
 lib/vdso/datastore.c                    | 2 +-
 mm/page-writeback.c                     | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index ea4ffa63f043..e96d79db69fe 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -414,7 +414,7 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
 	/*
 	 * When the LPAR lost credits due to core removal or during
 	 * migration, invalidate the existing mapping for the current
-	 * paste addresses and set windows in-active (zap_vma_pages in
+	 * paste addresses and set windows in-active (zap_vma() in
 	 * reconfig_close_windows()).
 	 * New mapping will be done later after migration or new credits
 	 * available. So continue to receive faults if the user space
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index ceb0a8788c0a..fa05f04364fe 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -807,7 +807,7 @@ static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds,
 		 * is done before the original mmap() and after the ioctl.
 		 */
 		if (vma)
-			zap_vma_pages(vma);
+			zap_vma(vma);
 
 		mutex_unlock(&task_ref->mmap_mutex);
 		mmap_write_unlock(task_ref->mm);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 4710f7c7495a..4bd1500b9630 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2837,7 +2837,11 @@ void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
 		  unsigned long size);
 void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
 			   unsigned long size);
-static inline void zap_vma_pages(struct vm_area_struct *vma)
+/**
+ * zap_vma - zap all page table entries in a vma
+ * @vma: The vma to zap.
+ */
+static inline void zap_vma(struct vm_area_struct *vma)
 {
 	zap_page_range_single(vma, vma->vm_start, vma->vm_end - vma->vm_start);
 }
diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index a565c30c71a0..222c143aebf7 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -121,7 +121,7 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
 	mmap_read_lock(mm);
 	for_each_vma(vmi, vma) {
 		if (vma_is_special_mapping(vma, &vdso_vvar_mapping))
-			zap_vma_pages(vma);
+			zap_vma(vma);
 	}
 	mmap_read_unlock(mm);
 
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 601a5e048d12..29f7567e5a71 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2645,7 +2645,7 @@ void folio_account_cleaned(struct folio *folio, struct bdi_writeback *wb)
  * while this function is in progress, although it may have been truncated
  * before this function is called.  Most callers have the folio locked.
  * A few have the folio blocked from truncation through other means (e.g.
- * zap_vma_pages() has it mapped and is holding the page table lock).
+ * zap_vma() has it mapped and is holding the page table lock).
  * When called from mark_buffer_dirty(), the filesystem should hold a
  * reference to the buffer_head that is being marked dirty, which causes
  * try_to_free_buffers() to fail.
-- 
2.43.0

