Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF0pE9a9eGn6sgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 14:29:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012C994E9E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 14:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AD910E572;
	Tue, 27 Jan 2026 13:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356E210E572
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 13:29:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6139A5BCE4;
 Tue, 27 Jan 2026 13:29:48 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8F323EA62;
 Tue, 27 Jan 2026 13:29:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0LPDNcu9eGmeDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Jan 2026 13:29:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, loic.molinari@collabora.com,
 willy@infradead.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, frank.binns@imgtec.com,
 matt.coster@imgtec.com
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] drm/gem-shmem: Track folio accessed/dirty status in mmap
Date: Tue, 27 Jan 2026 14:16:37 +0100
Message-ID: <20260127132938.429288-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127132938.429288-1-tzimmermann@suse.de>
References: <20260127132938.429288-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
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
X-Spamd-Result: default: False [0.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:loic.molinari@collabora.com,m:willy@infradead.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:linux-mm@kvack.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,infradead.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,imgtec.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Rspamd-Queue-Id: 012C994E9E
X-Rspamd-Action: no action

Invoke folio_mark_accessed() in mmap page faults to add the folio to
the memory manager's LRU list. Userspace invokes mmap to get the memory
for software rendering. Later compositors will do the same to create the
final on-screen image, so keeping the pages in LRU makes sense. Avoids
paging out graphics buffers when under memory pressure.

In page_mkwrite, further invoke the folio_mark_dirty() to add the folio
for writeback, should the underlying file be paged out from system memory.
This rarely happens in practice, yet it would corrupt the buffer content.

This has little effect on a system's hardware-accelerated rendering, which
only mmaps for an initial setup of textures, meshes, shaders, etc.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index b6ddabbfcc52..30cd34d3a111 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -562,8 +562,10 @@ static bool drm_gem_shmem_try_map_pmd(struct vm_fault *vmf, unsigned long addr,
 
 		if (folio_test_pmd_mappable(folio)) {
 			/* Read-only mapping; split upon write fault */
-			if (vmf_insert_folio_pmd(vmf, folio, false) == VM_FAULT_NOPAGE)
+			if (vmf_insert_folio_pmd(vmf, folio, false) == VM_FAULT_NOPAGE) {
+				folio_mark_accessed(folio);
 				return true;
+			}
 		}
 	}
 #endif
@@ -605,6 +607,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 		get_page(page);
 
 		folio_lock(folio);
+		folio_mark_accessed(folio);
 
 		vmf->page = page;
 		ret = VM_FAULT_LOCKED;
@@ -653,10 +656,23 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
 	drm_gem_vm_close(vma);
 }
 
+static vm_fault_t drm_gem_shmem_page_mkwrite(struct vm_fault *vmf)
+{
+	struct folio *folio = page_folio(vmf->page);
+
+	file_update_time(vmf->vma->vm_file);
+
+	folio_lock(folio);
+	folio_mark_dirty(folio);
+
+	return VM_FAULT_LOCKED;
+}
+
 const struct vm_operations_struct drm_gem_shmem_vm_ops = {
 	.fault = drm_gem_shmem_fault,
 	.open = drm_gem_shmem_vm_open,
 	.close = drm_gem_shmem_vm_close,
+	.page_mkwrite = drm_gem_shmem_page_mkwrite,
 };
 EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_ops);
 
-- 
2.52.0

