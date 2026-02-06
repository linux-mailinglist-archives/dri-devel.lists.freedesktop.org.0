Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAqOGA3uhWlvIQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:35:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B039DFE2F6
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E5010E6CC;
	Fri,  6 Feb 2026 13:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="v4zdQ/lH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fQDAwjqd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v4zdQ/lH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fQDAwjqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8509D10E6CC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:35:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9CFDC5BCC5;
 Fri,  6 Feb 2026 13:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770384902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MXFujCIM8Dm0kMzcwLRfUsHgSIfAs7nQ850kbWQuK6U=;
 b=v4zdQ/lHJbLbeiASDotbIZ6x0AlL/BrlUgYcuJPZuJC3tbtIvVWkLfjeuUY85uoppc6q70
 Q50oWjuM+NgRZ45zpM3/YErYweZJIIoltDfre+WEpdbaQ0FfosxCAZmANOAawcw2R6ZiQ1
 0jypTXmzfVbTo0iFYdbTrGBW/jo8Wvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770384902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MXFujCIM8Dm0kMzcwLRfUsHgSIfAs7nQ850kbWQuK6U=;
 b=fQDAwjqdRLqjUABbr3zcHSUPThlDWHVXm8FbMyXAC2nfH6Hu07lC3kUg9js2KATt6Bxtf/
 RxiUJ1JHhrmQhfAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="v4zdQ/lH";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fQDAwjqd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770384902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MXFujCIM8Dm0kMzcwLRfUsHgSIfAs7nQ850kbWQuK6U=;
 b=v4zdQ/lHJbLbeiASDotbIZ6x0AlL/BrlUgYcuJPZuJC3tbtIvVWkLfjeuUY85uoppc6q70
 Q50oWjuM+NgRZ45zpM3/YErYweZJIIoltDfre+WEpdbaQ0FfosxCAZmANOAawcw2R6ZiQ1
 0jypTXmzfVbTo0iFYdbTrGBW/jo8Wvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770384902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MXFujCIM8Dm0kMzcwLRfUsHgSIfAs7nQ850kbWQuK6U=;
 b=fQDAwjqdRLqjUABbr3zcHSUPThlDWHVXm8FbMyXAC2nfH6Hu07lC3kUg9js2KATt6Bxtf/
 RxiUJ1JHhrmQhfAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 597BD3EA64;
 Fri,  6 Feb 2026 13:35:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ED2oFAbuhWnncwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Feb 2026 13:35:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/5] drm/client: Export drm_client_buffer_create()
Date: Fri,  6 Feb 2026 14:21:54 +0100
Message-ID: <20260206133458.226467-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206133458.226467-1-tzimmermann@suse.de>
References: <20260206133458.226467-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.51
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B039DFE2F6
X-Rspamd-Action: no action

The helper drm_client_buffer_create() will be required by various
drivers for fbdev emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client.c | 3 ++-
 include/drm/drm_client.h     | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index a82d741e6630..f36c110b55db 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -204,7 +204,7 @@ void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 }
 EXPORT_SYMBOL(drm_client_buffer_delete);
 
-static struct drm_client_buffer *
+struct drm_client_buffer *
 drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
 			 u32 format, u32 handle, u32 pitch)
 {
@@ -265,6 +265,7 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
 	kfree(buffer);
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL(drm_client_buffer_create);
 
 /**
  * drm_client_buffer_vmap_local - Map DRM client buffer into address space
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index c972a8a3385b..49a21f3dcb36 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -195,6 +195,9 @@ struct drm_client_buffer {
 	struct drm_framebuffer *fb;
 };
 
+struct drm_client_buffer *
+drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
+			 u32 format, u32 handle, u32 pitch);
 struct drm_client_buffer *
 drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 height, u32 format);
 void drm_client_buffer_delete(struct drm_client_buffer *buffer);
-- 
2.52.0

