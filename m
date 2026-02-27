Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJYyNt/6oWl4yAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 21:13:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3121BD5EF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 21:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9AC10EC36;
	Fri, 27 Feb 2026 20:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BoKOHAuN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A0310EC38;
 Fri, 27 Feb 2026 20:13:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CC4A4401C0;
 Fri, 27 Feb 2026 20:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152E5C19421;
 Fri, 27 Feb 2026 20:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772223195;
 bh=DPPIBtN2jxViPTx92f0FRSM/ZG0jW4iTVJwPfrqzIh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BoKOHAuNZ9Lyo7Qtb0Xof+aunTUAVWSO8ZoPbTGOPgLQXtV0Yd5aS+UZIgyjqPWyG
 vZmzq/IjgABznEGt/QBHMye+nvxDauSyr1ob8vYx++A8qeditQSZhx0juhW4Ku3jLI
 EtPn/NcjeZf5E8HIOEKZaesHsYySld9X2Gq2lh2UwrWDeRAQwg7S8EQwWCpzWOPF3h
 02mpsuNIVLh3B+yx1arHr+zdp9OkH7YJ2G8iXKu8/U/Is9ylU8rZYRnHH3VXp0Rngh
 IFj2yD+bA6f/hZFicveu86BbVaR/MWonPQjll+u10qmI3mZsQJPdrOpCxQ5+dIctJ1
 g6P8BOcpXbHBw==
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
Subject: [PATCH v1 15/16] mm: rename zap_vma_ptes() to zap_special_vma_range()
Date: Fri, 27 Feb 2026 21:08:46 +0100
Message-ID: <20260227200848.114019-16-david@kernel.org>
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
X-Rspamd-Queue-Id: 5D3121BD5EF
X-Rspamd-Action: no action

zap_vma_ptes() is the only zapping function we export to modules.

It's essentially a wrapper around zap_vma_range(), however, with some
safety checks:
* That the passed range fits fully into the VMA
* That it's only used for VM_PFNMAP

We might want to support VM_MIXEDMAP soon as well, so use the
more-generic term "special vma", although "special" is a bit overloaded.
Maybe we'll later just support any VM_SPECIAL flag.

While at it, improve the kerneldoc.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/x86/kernel/cpu/sgx/encl.c        |  2 +-
 drivers/comedi/comedi_fops.c          |  2 +-
 drivers/gpu/drm/i915/i915_mm.c        |  4 ++--
 drivers/infiniband/core/uverbs_main.c |  6 +++---
 drivers/misc/sgi-gru/grumain.c        |  2 +-
 include/linux/mm.h                    |  2 +-
 mm/memory.c                           | 16 +++++++---------
 7 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kernel/cpu/sgx/encl.c b/arch/x86/kernel/cpu/sgx/encl.c
index ac60ebde5d9b..3f0222d10f6e 100644
--- a/arch/x86/kernel/cpu/sgx/encl.c
+++ b/arch/x86/kernel/cpu/sgx/encl.c
@@ -1220,7 +1220,7 @@ void sgx_zap_enclave_ptes(struct sgx_encl *encl, unsigned long addr)
 
 			ret = sgx_encl_find(encl_mm->mm, addr, &vma);
 			if (!ret && encl == vma->vm_private_data)
-				zap_vma_ptes(vma, addr, PAGE_SIZE);
+				zap_special_vma_range(vma, addr, PAGE_SIZE);
 
 			mmap_read_unlock(encl_mm->mm);
 
diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
index 48a8a607a84c..b91e0b5ac394 100644
--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -2588,7 +2588,7 @@ static int comedi_mmap(struct file *file, struct vm_area_struct *vma)
 	 * remap_pfn_range() because we call remap_pfn_range() in a loop.
 	 */
 	if (retval)
-		zap_vma_ptes(vma, vma->vm_start, size);
+		zap_special_vma_range(vma, vma->vm_start, size);
 #endif
 
 	if (retval == 0) {
diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
index c33bd3d83069..fd89e7c7d8d6 100644
--- a/drivers/gpu/drm/i915/i915_mm.c
+++ b/drivers/gpu/drm/i915/i915_mm.c
@@ -108,7 +108,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
 
 	err = apply_to_page_range(r.mm, addr, size, remap_pfn, &r);
 	if (unlikely(err)) {
-		zap_vma_ptes(vma, addr, (r.pfn - pfn) << PAGE_SHIFT);
+		zap_special_vma_range(vma, addr, (r.pfn - pfn) << PAGE_SHIFT);
 		return err;
 	}
 
@@ -156,7 +156,7 @@ int remap_io_sg(struct vm_area_struct *vma,
 
 	err = apply_to_page_range(r.mm, addr, size, remap_sg, &r);
 	if (unlikely(err)) {
-		zap_vma_ptes(vma, addr, r.pfn << PAGE_SHIFT);
+		zap_special_vma_range(vma, addr, r.pfn << PAGE_SHIFT);
 		return err;
 	}
 
diff --git a/drivers/infiniband/core/uverbs_main.c b/drivers/infiniband/core/uverbs_main.c
index 7b68967a6301..f5837da47299 100644
--- a/drivers/infiniband/core/uverbs_main.c
+++ b/drivers/infiniband/core/uverbs_main.c
@@ -756,7 +756,7 @@ static void rdma_umap_open(struct vm_area_struct *vma)
 	 * point, so zap it.
 	 */
 	vma->vm_private_data = NULL;
-	zap_vma_ptes(vma, vma->vm_start, vma->vm_end - vma->vm_start);
+	zap_special_vma_range(vma, vma->vm_start, vma->vm_end - vma->vm_start);
 }
 
 static void rdma_umap_close(struct vm_area_struct *vma)
@@ -782,7 +782,7 @@ static void rdma_umap_close(struct vm_area_struct *vma)
 }
 
 /*
- * Once the zap_vma_ptes has been called touches to the VMA will come here and
+ * Once the zap_special_vma_range has been called touches to the VMA will come here and
  * we return a dummy writable zero page for all the pfns.
  */
 static vm_fault_t rdma_umap_fault(struct vm_fault *vmf)
@@ -878,7 +878,7 @@ void uverbs_user_mmap_disassociate(struct ib_uverbs_file *ufile)
 				continue;
 			list_del_init(&priv->list);
 
-			zap_vma_ptes(vma, vma->vm_start,
+			zap_special_vma_range(vma, vma->vm_start,
 				     vma->vm_end - vma->vm_start);
 
 			if (priv->entry) {
diff --git a/drivers/misc/sgi-gru/grumain.c b/drivers/misc/sgi-gru/grumain.c
index 8d749f345246..278b76cbd281 100644
--- a/drivers/misc/sgi-gru/grumain.c
+++ b/drivers/misc/sgi-gru/grumain.c
@@ -542,7 +542,7 @@ void gru_unload_context(struct gru_thread_state *gts, int savestate)
 	int ctxnum = gts->ts_ctxnum;
 
 	if (!is_kernel_context(gts))
-		zap_vma_ptes(gts->ts_vma, UGRUADDR(gts), GRU_GSEG_PAGESIZE);
+		zap_special_vma_range(gts->ts_vma, UGRUADDR(gts), GRU_GSEG_PAGESIZE);
 	cch = get_cch(gru->gs_gru_base_vaddr, ctxnum);
 
 	gru_dbg(grudev, "gts %p, cbrmap 0x%lx, dsrmap 0x%lx\n",
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 833bedd3f739..07f6819db02d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2833,7 +2833,7 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 struct page *vm_normal_page_pud(struct vm_area_struct *vma, unsigned long addr,
 		pud_t pud);
 
-void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
+void zap_special_vma_range(struct vm_area_struct *vma, unsigned long address,
 		  unsigned long size);
 void zap_vma_range(struct vm_area_struct *vma, unsigned long address,
 			   unsigned long size);
diff --git a/mm/memory.c b/mm/memory.c
index dd737b6d28c0..f3b7b7e16138 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2233,17 +2233,15 @@ void zap_vma_range(struct vm_area_struct *vma, unsigned long address,
 }
 
 /**
- * zap_vma_ptes - remove ptes mapping the vma
- * @vma: vm_area_struct holding ptes to be zapped
- * @address: starting address of pages to zap
+ * zap_special_vma_range - zap all page table entries in a special vma range
+ * @vma: the vma covering the range to zap
+ * @address: starting address of the range to zap
  * @size: number of bytes to zap
  *
- * This function only unmaps ptes assigned to VM_PFNMAP vmas.
- *
- * The entire address range must be fully contained within the vma.
- *
+ * This function does nothing when the provided address range is not fully
+ * contained in @vma, or when the @vma is not VM_PFNMAP.
  */
-void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
+void zap_special_vma_range(struct vm_area_struct *vma, unsigned long address,
 		unsigned long size)
 {
 	if (!range_in_vma(vma, address, address + size) ||
@@ -2252,7 +2250,7 @@ void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
 
 	zap_vma_range(vma, address, size);
 }
-EXPORT_SYMBOL_GPL(zap_vma_ptes);
+EXPORT_SYMBOL_GPL(zap_special_vma_range);
 
 static pmd_t *walk_to_pmd(struct mm_struct *mm, unsigned long addr)
 {
-- 
2.43.0

