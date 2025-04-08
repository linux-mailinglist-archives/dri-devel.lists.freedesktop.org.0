Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A95FBA7F94F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 11:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F30510E20B;
	Tue,  8 Apr 2025 09:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZAIa0Pwd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q2Fl7x5p";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZAIa0Pwd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q2Fl7x5p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2088110E20B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 09:22:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C98F91F38E;
 Tue,  8 Apr 2025 09:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744104132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBiOrKmQ9pPCpIu9/vbRegRSviNMRIR6x2GYG+7EEis=;
 b=ZAIa0Pwd86LZz9f1jl4Xc1C1J5EfPa+3DbPHZYGHAWx8cKTqAm+dzDOf2/5RGlirRqzKFk
 eCEbfZ5qiRM9kAU4dK6KphXLValvadKt35mYinLRmiMZOKWaGSj1ovqJXdyxuKtZj/5pHu
 vSP0sn7quQHqK/9kIDkXb6Fq4lPcSWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744104132;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBiOrKmQ9pPCpIu9/vbRegRSviNMRIR6x2GYG+7EEis=;
 b=Q2Fl7x5pqT6+TqiCNHdOAzDcBIwHLk/d2lCAjUFiKo+MyEx9JSBGp9clffNj1smKl6uBJV
 aa+X9fK77DU1/aCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744104132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBiOrKmQ9pPCpIu9/vbRegRSviNMRIR6x2GYG+7EEis=;
 b=ZAIa0Pwd86LZz9f1jl4Xc1C1J5EfPa+3DbPHZYGHAWx8cKTqAm+dzDOf2/5RGlirRqzKFk
 eCEbfZ5qiRM9kAU4dK6KphXLValvadKt35mYinLRmiMZOKWaGSj1ovqJXdyxuKtZj/5pHu
 vSP0sn7quQHqK/9kIDkXb6Fq4lPcSWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744104132;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBiOrKmQ9pPCpIu9/vbRegRSviNMRIR6x2GYG+7EEis=;
 b=Q2Fl7x5pqT6+TqiCNHdOAzDcBIwHLk/d2lCAjUFiKo+MyEx9JSBGp9clffNj1smKl6uBJV
 aa+X9fK77DU1/aCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90F4413A80;
 Tue,  8 Apr 2025 09:22:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UEcZIsTq9Gf2YgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Apr 2025 09:22:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org, javierm@redhat.com, linux-efi@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] efi: Export symbol efi_mem_desc_lookup
Date: Tue,  8 Apr 2025 11:17:04 +0200
Message-ID: <20250408091837.407401-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408091837.407401-1-tzimmermann@suse.de>
References: <20250408091837.407401-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
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

Building efidrm as module requires efi_mem_desc_lookup(). Export
the symbol.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/efi/efi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 7309394b8fc98..e57bff702b5f4 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -558,6 +558,7 @@ int __efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
 
 extern int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
 	__weak __alias(__efi_mem_desc_lookup);
+EXPORT_SYMBOL_GPL(efi_mem_desc_lookup);
 
 /*
  * Calculate the highest address of an efi memory descriptor.
-- 
2.49.0

