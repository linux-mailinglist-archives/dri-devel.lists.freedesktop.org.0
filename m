Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FBB93116B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 11:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4920D10E24F;
	Mon, 15 Jul 2024 09:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cvnlohfP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cq9lcSoQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cvnlohfP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cq9lcSoQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8738410E1A5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:39:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 05BC621B50;
 Mon, 15 Jul 2024 09:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721036387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5c7+u4uXG459eRwlJagF6Q6qpQOqS7yvnHiftj/fG3A=;
 b=cvnlohfPgJzrNt/Xbc+bLKYth+8vTvgSm1zFZZtD/4+ii8vhPj5PkBhjPlpTrlQy+d6QwY
 NMj+DyzHdZvtxeAgDimM5BYuAVYYJ09WShXxx8XB065vAYDib5wQCw0cyG97rgX6u5Vsq7
 f7YqQDals2MUAReGn9UsHIwH5kdThsY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721036387;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5c7+u4uXG459eRwlJagF6Q6qpQOqS7yvnHiftj/fG3A=;
 b=Cq9lcSoQhzawD/UrWiW2MKxjwl/BsaNAZuYvn3yRp7b6niCjlubS3uhjPFqNv0ZY9f8KBZ
 kyvWqbFRY6a24VDw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cvnlohfP;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Cq9lcSoQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721036387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5c7+u4uXG459eRwlJagF6Q6qpQOqS7yvnHiftj/fG3A=;
 b=cvnlohfPgJzrNt/Xbc+bLKYth+8vTvgSm1zFZZtD/4+ii8vhPj5PkBhjPlpTrlQy+d6QwY
 NMj+DyzHdZvtxeAgDimM5BYuAVYYJ09WShXxx8XB065vAYDib5wQCw0cyG97rgX6u5Vsq7
 f7YqQDals2MUAReGn9UsHIwH5kdThsY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721036387;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5c7+u4uXG459eRwlJagF6Q6qpQOqS7yvnHiftj/fG3A=;
 b=Cq9lcSoQhzawD/UrWiW2MKxjwl/BsaNAZuYvn3yRp7b6niCjlubS3uhjPFqNv0ZY9f8KBZ
 kyvWqbFRY6a24VDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A94361396E;
 Mon, 15 Jul 2024 09:39:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GAEeKGLulGbTEgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Jul 2024 09:39:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/7] drm/ast: Set connector priorities
Date: Mon, 15 Jul 2024 11:38:59 +0200
Message-ID: <20240715093936.793552-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715093936.793552-1-tzimmermann@suse.de>
References: <20240715093936.793552-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
 RCPT_COUNT_SEVEN(0.00)[8];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 05BC621B50
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

Call drm_probe_helper_prioritize_connectors() to set connector
priorities. Guarantees that only a single output is connected at a
time.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index dc8f639e82fd..ac8a3c6b8bf8 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1970,6 +1970,9 @@ int ast_mode_config_init(struct ast_device *ast)
 	if (ret)
 		return ret;
 
+	/* All connectors interfere with each other. */
+	drm_probe_helper_prioritize_connectors(dev, GENMASK(dev->mode_config.num_connector, 0));
+
 	drm_mode_config_reset(dev);
 
 	ret = drmm_kms_helper_poll_init(dev);
-- 
2.45.2

