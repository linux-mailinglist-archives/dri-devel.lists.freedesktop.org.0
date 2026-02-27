Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ORuLB9SDoWkRuAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:45:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706F41B6B8C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8394710EB10;
	Fri, 27 Feb 2026 11:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xQLKD1nK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kASjKmx5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xQLKD1nK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kASjKmx5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE3F10EB10
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 11:45:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 13DCD3F9E8;
 Fri, 27 Feb 2026 11:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772192718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQgi0mAQvK89FMPv4awd74cL08jT16i82SijXBsUUSY=;
 b=xQLKD1nKq4mLWqWZuhSS2N24p2CDqKypGitrdKJjeD74xnQua10Kqn29ox2lGUA/MPyqUq
 SXkebGBF1RbNuYLmOajjJdtzI/3TkfY37ZmhuFFb0aSTSmOpUWQUynfHtCmHJnZRUqDIh0
 fxWodQb27o4obnBLAey8qCIQ/ncx+1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772192718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQgi0mAQvK89FMPv4awd74cL08jT16i82SijXBsUUSY=;
 b=kASjKmx5I38cajM3Vezm4OyY/kn1sqJGuHEIzPQNngkQSzdcjPziyKsBNdlwYstS+bh6AA
 eIITTrO3Ji1DuuDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772192718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQgi0mAQvK89FMPv4awd74cL08jT16i82SijXBsUUSY=;
 b=xQLKD1nKq4mLWqWZuhSS2N24p2CDqKypGitrdKJjeD74xnQua10Kqn29ox2lGUA/MPyqUq
 SXkebGBF1RbNuYLmOajjJdtzI/3TkfY37ZmhuFFb0aSTSmOpUWQUynfHtCmHJnZRUqDIh0
 fxWodQb27o4obnBLAey8qCIQ/ncx+1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772192718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQgi0mAQvK89FMPv4awd74cL08jT16i82SijXBsUUSY=;
 b=kASjKmx5I38cajM3Vezm4OyY/kn1sqJGuHEIzPQNngkQSzdcjPziyKsBNdlwYstS+bh6AA
 eIITTrO3Ji1DuuDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B33083EA6A;
 Fri, 27 Feb 2026 11:45:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MICOKs2DoWkvOwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Feb 2026 11:45:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, loic.molinari@collabora.com,
 willy@infradead.org, frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 1/6] drm/gem-shmem: Use obj directly where appropriate in
 fault handler
Date: Fri, 27 Feb 2026 12:42:06 +0100
Message-ID: <20260227114509.165572-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227114509.165572-1-tzimmermann@suse.de>
References: <20260227114509.165572-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.35
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:loic.molinari@collabora.com,m:willy@infradead.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-mm@kvack.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,infradead.org,imgtec.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,kvack.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 706F41B6B8C
X-Rspamd-Action: no action

Replace shmem->base with obj in several places. It is the same value,
but the latter is easier to read.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 7b5a49935ae4..1e3bfbf0cb97 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -584,7 +584,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	/* Offset to faulty address in the VMA. */
 	page_offset = vmf->pgoff - vma->vm_pgoff;
 
-	dma_resv_lock(shmem->base.resv, NULL);
+	dma_resv_lock(obj->resv, NULL);
 
 	if (page_offset >= num_pages ||
 	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
@@ -602,7 +602,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	ret = vmf_insert_pfn(vma, vmf->address, pfn);
 
  out:
-	dma_resv_unlock(shmem->base.resv);
+	dma_resv_unlock(obj->resv);
 
 	return ret;
 }
-- 
2.52.0

