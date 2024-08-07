Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ED294ACDB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 17:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A813310E570;
	Wed,  7 Aug 2024 15:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MXHQWiq3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q/J78puK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MXHQWiq3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q/J78puK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E369B10E18A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 15:26:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 820CD21CFF;
 Wed,  7 Aug 2024 15:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723044410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tADxz/0yhbC81kKO8/23h1vQ6FFpecaRf/di915epZk=;
 b=MXHQWiq3cHR1EZT1eHHePh8EZXJTtYBkY/9sPLslUejgW0QvBBiA3EFvf71IvnQVWN0Kmj
 S2zwRC0Z+Wbanvh9Nq7XxIQlN/Qb6Etu6yVRkAYIPIDlStR+4fk5nxsOIt7OSMB3Ya7dvP
 qSosRVAbdzcIwyYBfIIr3Igw/82caSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723044410;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tADxz/0yhbC81kKO8/23h1vQ6FFpecaRf/di915epZk=;
 b=Q/J78puKCjVrziqO7FFGoRKOTvOZG9/ISjOICgbG67qEBbjrRJxxVSeXHxEKW+1YZdXtud
 Op93dSpjzcVMNyCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723044410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tADxz/0yhbC81kKO8/23h1vQ6FFpecaRf/di915epZk=;
 b=MXHQWiq3cHR1EZT1eHHePh8EZXJTtYBkY/9sPLslUejgW0QvBBiA3EFvf71IvnQVWN0Kmj
 S2zwRC0Z+Wbanvh9Nq7XxIQlN/Qb6Etu6yVRkAYIPIDlStR+4fk5nxsOIt7OSMB3Ya7dvP
 qSosRVAbdzcIwyYBfIIr3Igw/82caSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723044410;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tADxz/0yhbC81kKO8/23h1vQ6FFpecaRf/di915epZk=;
 b=Q/J78puKCjVrziqO7FFGoRKOTvOZG9/ISjOICgbG67qEBbjrRJxxVSeXHxEKW+1YZdXtud
 Op93dSpjzcVMNyCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36F8E13297;
 Wed,  7 Aug 2024 15:26:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EBU4DDqSs2bxewAAD6G6ig
 (envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 15:26:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] ALSA: pcm: Drop PCM vmalloc buffer helpers
Date: Wed,  7 Aug 2024 17:27:23 +0200
Message-ID: <20240807152725.18948-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807152725.18948-1-tiwai@suse.de>
References: <20240807152725.18948-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *
X-Spamd-Result: default: False [1.70 / 50.00]; SUSPICIOUS_RECIPS(1.50)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCPT_COUNT_SEVEN(0.00)[11];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: 1.70
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

As the last-standing user of PCM vmalloc buffer helper API took its
own buffer management, we can finally drop those API functions, which
were leftover after reorganization of ALSA memalloc code.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     | 42 -----------------------------
 sound/core/pcm_memory.c | 59 -----------------------------------------
 2 files changed, 101 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index ac8f3aef9205..3c56a648bdcd 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1355,48 +1355,6 @@ snd_pcm_set_fixed_buffer_all(struct snd_pcm *pcm, int type,
 	return snd_pcm_set_managed_buffer_all(pcm, type, data, size, 0);
 }
 
-int _snd_pcm_lib_alloc_vmalloc_buffer(struct snd_pcm_substream *substream,
-				      size_t size, gfp_t gfp_flags);
-int snd_pcm_lib_free_vmalloc_buffer(struct snd_pcm_substream *substream);
-struct page *snd_pcm_lib_get_vmalloc_page(struct snd_pcm_substream *substream,
-					  unsigned long offset);
-/**
- * snd_pcm_lib_alloc_vmalloc_buffer - allocate virtual DMA buffer
- * @substream: the substream to allocate the buffer to
- * @size: the requested buffer size, in bytes
- *
- * Allocates the PCM substream buffer using vmalloc(), i.e., the memory is
- * contiguous in kernel virtual space, but not in physical memory.  Use this
- * if the buffer is accessed by kernel code but not by device DMA.
- *
- * Return: 1 if the buffer was changed, 0 if not changed, or a negative error
- * code.
- */
-static inline int snd_pcm_lib_alloc_vmalloc_buffer
-			(struct snd_pcm_substream *substream, size_t size)
-{
-	return _snd_pcm_lib_alloc_vmalloc_buffer(substream, size,
-						 GFP_KERNEL | __GFP_HIGHMEM | __GFP_ZERO);
-}
-
-/**
- * snd_pcm_lib_alloc_vmalloc_32_buffer - allocate 32-bit-addressable buffer
- * @substream: the substream to allocate the buffer to
- * @size: the requested buffer size, in bytes
- *
- * This function works like snd_pcm_lib_alloc_vmalloc_buffer(), but uses
- * vmalloc_32(), i.e., the pages are allocated from 32-bit-addressable memory.
- *
- * Return: 1 if the buffer was changed, 0 if not changed, or a negative error
- * code.
- */
-static inline int snd_pcm_lib_alloc_vmalloc_32_buffer
-			(struct snd_pcm_substream *substream, size_t size)
-{
-	return _snd_pcm_lib_alloc_vmalloc_buffer(substream, size,
-						 GFP_KERNEL | GFP_DMA32 | __GFP_ZERO);
-}
-
 #define snd_pcm_get_dma_buf(substream) ((substream)->runtime->dma_buffer_p)
 
 /**
diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 506386959f08..8e4c68e3bbd0 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -9,7 +9,6 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/moduleparam.h>
-#include <linux/vmalloc.h>
 #include <linux/export.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -497,61 +496,3 @@ int snd_pcm_lib_free_pages(struct snd_pcm_substream *substream)
 	return 0;
 }
 EXPORT_SYMBOL(snd_pcm_lib_free_pages);
-
-int _snd_pcm_lib_alloc_vmalloc_buffer(struct snd_pcm_substream *substream,
-				      size_t size, gfp_t gfp_flags)
-{
-	struct snd_pcm_runtime *runtime;
-
-	if (PCM_RUNTIME_CHECK(substream))
-		return -EINVAL;
-	runtime = substream->runtime;
-	if (runtime->dma_area) {
-		if (runtime->dma_bytes >= size)
-			return 0; /* already large enough */
-		vfree(runtime->dma_area);
-	}
-	runtime->dma_area = __vmalloc(size, gfp_flags);
-	if (!runtime->dma_area)
-		return -ENOMEM;
-	runtime->dma_bytes = size;
-	return 1;
-}
-EXPORT_SYMBOL(_snd_pcm_lib_alloc_vmalloc_buffer);
-
-/**
- * snd_pcm_lib_free_vmalloc_buffer - free vmalloc buffer
- * @substream: the substream with a buffer allocated by
- *	snd_pcm_lib_alloc_vmalloc_buffer()
- *
- * Return: Zero if successful, or a negative error code on failure.
- */
-int snd_pcm_lib_free_vmalloc_buffer(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime;
-
-	if (PCM_RUNTIME_CHECK(substream))
-		return -EINVAL;
-	runtime = substream->runtime;
-	vfree(runtime->dma_area);
-	runtime->dma_area = NULL;
-	return 0;
-}
-EXPORT_SYMBOL(snd_pcm_lib_free_vmalloc_buffer);
-
-/**
- * snd_pcm_lib_get_vmalloc_page - map vmalloc buffer offset to page struct
- * @substream: the substream with a buffer allocated by
- *	snd_pcm_lib_alloc_vmalloc_buffer()
- * @offset: offset in the buffer
- *
- * This function is to be used as the page callback in the PCM ops.
- *
- * Return: The page struct, or %NULL on failure.
- */
-struct page *snd_pcm_lib_get_vmalloc_page(struct snd_pcm_substream *substream,
-					  unsigned long offset)
-{
-	return vmalloc_to_page(substream->runtime->dma_area + offset);
-}
-EXPORT_SYMBOL(snd_pcm_lib_get_vmalloc_page);
-- 
2.43.0

