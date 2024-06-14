Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411FD908C86
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 15:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E246C10ED1D;
	Fri, 14 Jun 2024 13:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Gwb28lzW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s3/iCzQV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gwb28lzW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s3/iCzQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791E810E55B;
 Fri, 14 Jun 2024 13:36:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6F6B13386F;
 Fri, 14 Jun 2024 13:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718372159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9JOJjVl5Nksmgb1NU5hRG/PLRyBVvGwRQDLWAnPEpE=;
 b=Gwb28lzWQTc/PKzo14uoSn9n9Dzb5aWgDF1gajDOGstkFuzASSpwXbChLFunXbPcY0KolN
 rxq0AVHr1Y/b+lm1fkCD/L0k52EOeN+nOaGWvRkez9Kxh5YpA16H77XoxuT18dod6i6LG/
 87YW4mPkI/cj3oNts92j5Xlcbw3iD4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718372159;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9JOJjVl5Nksmgb1NU5hRG/PLRyBVvGwRQDLWAnPEpE=;
 b=s3/iCzQVO4XRuHFmirPoZ0tfXx7H4u0JVJvU9u406l8RoV0mPGPv1Oq/Sxh489AYdvTZ51
 95z3ZNL8EDu+LWAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718372159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9JOJjVl5Nksmgb1NU5hRG/PLRyBVvGwRQDLWAnPEpE=;
 b=Gwb28lzWQTc/PKzo14uoSn9n9Dzb5aWgDF1gajDOGstkFuzASSpwXbChLFunXbPcY0KolN
 rxq0AVHr1Y/b+lm1fkCD/L0k52EOeN+nOaGWvRkez9Kxh5YpA16H77XoxuT18dod6i6LG/
 87YW4mPkI/cj3oNts92j5Xlcbw3iD4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718372159;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9JOJjVl5Nksmgb1NU5hRG/PLRyBVvGwRQDLWAnPEpE=;
 b=s3/iCzQVO4XRuHFmirPoZ0tfXx7H4u0JVJvU9u406l8RoV0mPGPv1Oq/Sxh489AYdvTZ51
 95z3ZNL8EDu+LWAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 099D113AB5;
 Fri, 14 Jun 2024 13:35:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WNgZAT9HbGavPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Jun 2024 13:35:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, ray.huang@amd.com, christian.koenig@amd.com,
 kraxel@redhat.com, airlied@redhat.com, suijingfeng@loongson.cn
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/6] iosys-map: Add allocator flags
Date: Fri, 14 Jun 2024 15:21:55 +0200
Message-ID: <20240614133556.11378-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614133556.11378-1-tzimmermann@suse.de>
References: <20240614133556.11378-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,intel.com,amd.com,redhat.com,loongson.cn];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Add the public field alloc_flags to struct iosys_map. It allows for
the allocator of the mapping to store additional flags, such details
about the internal alloctor operations. This will be helpful with
DRM's TTM memory manager, which supports various types of memory in
it's vmap functions.

The new field fills existing padding bytes in struct iosys_map, so
instances of the type do not grow in size.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/iosys-map.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index 4696abfd311cc..f3b351094bca0 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -97,6 +97,11 @@
  *
  *	iosys_map_memcpy_to(&map, src, len);
  *	iosys_map_incr(&map, len); // go to first byte after the memcpy
+ *
+ * The only public field in :c:type:`struct iosys_map <iosys_map>` is
+ * alloc_flags. It allows allocators to store additional information about the
+ * stored memory. Helpers will initialize or clear it to zero, but the values
+ * are only used by the allocator.
  */
 
 /**
@@ -105,6 +110,7 @@
  * @vaddr:		The buffer's address if in system memory
  * @is_iomem:		True if the buffer is located in I/O memory, or false
  *			otherwise.
+ * @alloc_flags		Allocator private flags
  */
 struct iosys_map {
 	union {
@@ -112,6 +118,7 @@ struct iosys_map {
 		void *vaddr;
 	};
 	bool is_iomem;
+	u16 alloc_flags;
 };
 
 /**
@@ -122,6 +129,7 @@ struct iosys_map {
 	{				\
 		.vaddr = (vaddr_),	\
 		.is_iomem = false,	\
+		.alloc_flags = 0,	\
 	}
 
 /**
@@ -132,6 +140,7 @@ struct iosys_map {
 	{						\
 		.vaddr_iomem = (vaddr_iomem_),		\
 		.is_iomem = true,			\
+		.alloc_flags = 0,			\
 	}
 
 /**
@@ -260,7 +269,8 @@ static inline bool iosys_map_is_set(const struct iosys_map *map)
  *
  * Clears all fields to zero, including struct iosys_map.is_iomem, so
  * mapping structures that were set to point to I/O memory are reset for
- * system memory. Pointers are cleared to NULL. This is the default.
+ * system memory. Pointers are cleared to NULL. The allocator flags in
+ * struct iosys_map.alloc_flags are cleared to zero.
  */
 static inline void iosys_map_clear(struct iosys_map *map)
 {
@@ -270,6 +280,7 @@ static inline void iosys_map_clear(struct iosys_map *map)
 	} else {
 		map->vaddr = NULL;
 	}
+	map->alloc_flags = 0;
 }
 
 /**
-- 
2.45.2

