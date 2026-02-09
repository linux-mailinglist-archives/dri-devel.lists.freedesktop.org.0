Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLSzDQbiiWnGCwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 14:32:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C873010FBDC
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 14:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BBA10E3EC;
	Mon,  9 Feb 2026 13:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bcOt/W9z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YAk6Ylx6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bcOt/W9z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YAk6Ylx6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C07689CAC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 13:32:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 19EFC5BD2B;
 Mon,  9 Feb 2026 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770643966; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TvEFGTp96ydlVlsv0yU/yvEpwTdFsrcKq6W5DxA6k2M=;
 b=bcOt/W9zrYkQADuDIfzbXYzl7zq1CdxN6czvOtBQ0VGdT4folRQaQQN+IeCKHLoeU+pqzB
 kHcquuf0LFPVgzxom2JgZKZZFCq6vCsQWTlOW4vEL8txsFwgSnkPpwMGGQE0GDthrBuFLV
 loKdPcylWaPrXUP6W3u/xdcX9b952y0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770643966;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TvEFGTp96ydlVlsv0yU/yvEpwTdFsrcKq6W5DxA6k2M=;
 b=YAk6Ylx6KnhX8FQ1CGUpi1HY0RpKSG6wpBbouy2iZUo6wymKPt71aKo6HlDSDb6YY+eUXu
 IzqYSwUyheJ97mCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770643966; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TvEFGTp96ydlVlsv0yU/yvEpwTdFsrcKq6W5DxA6k2M=;
 b=bcOt/W9zrYkQADuDIfzbXYzl7zq1CdxN6czvOtBQ0VGdT4folRQaQQN+IeCKHLoeU+pqzB
 kHcquuf0LFPVgzxom2JgZKZZFCq6vCsQWTlOW4vEL8txsFwgSnkPpwMGGQE0GDthrBuFLV
 loKdPcylWaPrXUP6W3u/xdcX9b952y0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770643966;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TvEFGTp96ydlVlsv0yU/yvEpwTdFsrcKq6W5DxA6k2M=;
 b=YAk6Ylx6KnhX8FQ1CGUpi1HY0RpKSG6wpBbouy2iZUo6wymKPt71aKo6HlDSDb6YY+eUXu
 IzqYSwUyheJ97mCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B688E3EA63;
 Mon,  9 Feb 2026 13:32:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1vdaK/3hiWmTIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Feb 2026 13:32:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, loic.molinari@collabora.com,
 willy@infradead.org, frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/6] drm/gem-shmem: Track page accessed/dirty status
Date: Mon,  9 Feb 2026 14:27:09 +0100
Message-ID: <20260209133241.238813-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:loic.molinari@collabora.com,m:willy@infradead.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-mm@kvack.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,infradead.org,imgtec.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C873010FBDC
X-Rspamd-Action: no action

Track page access/dirty status in gem-shmem for better integration with
the overall memory management. Gem-shmem has long had two flag bits in
struct drm_gem_shmem_object, named pages_mark_accessed_on_put and
pages_mark_dirty_on_put, but never used them much; except for some odd
cases in drivers. Therefore pages in gem-shmem where never marked
correctly. (Other DRM memory managers do some course-grain tracking at
least).

Patches 1 to 4 prepare the mmap page-fault handler for tracking page
status easily. The pages are already available; only the mmap handling
needs to be adapted. The way the shmem code interacts with huge-page
support is also not optimal, hence refactor it slightly.

Patch 5 adds tracking access and dirty status in mmap. With the earlier
patches, this change simply falls into place.

Patch 6 adds tracking access and dirty status in vmap. Because there's
no fault handling here, we refer to the existing status bits in struct
drm_gem_shmem_object. Each page's status will be updated by the page
release in drm_gem_put_pages(). The imagination driver requires a small
fix to make it work correctly.

Tested with CONFIG_VM=y by running animations on DRM's bochs driver for
several hours. This uses gem-shmem's mmap and vmap extensively.

v3:
- rewrite for VM_PFNMAP
- do more preparational patches
v2:
- fix possible OOB access into page array (Matthew)
- simplify fault-handler error handling (Boris)
- simplify internal interfaces (Matthew)

Thomas Zimmermann (6):
  drm/gem-shmem: Use obj directly where appropriate in fault handler
  drm/gem-shmem: Test for existence of page in mmap fault handler
  drm/gem-shmem: Return vm_fault_t from drm_gem_shmem_try_map_pmd()
  drm/gem-shmem: Refactor drm_gem_shmem_try_map_pmd()
  drm/gem-shmem: Track folio accessed/dirty status in mmap
  drm/gem-shmem: Track folio accessed/dirty status in vmap

 drivers/gpu/drm/drm_gem_shmem_helper.c | 77 ++++++++++++++++----------
 drivers/gpu/drm/imagination/pvr_gem.c  |  6 +-
 2 files changed, 53 insertions(+), 30 deletions(-)


base-commit: 0082025812a31eda451fb14f13f52683ed375c49
-- 
2.52.0

