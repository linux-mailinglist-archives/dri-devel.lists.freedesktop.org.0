Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0478C9D4902
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 09:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAEE10E898;
	Thu, 21 Nov 2024 08:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="3FYwv4Ai";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="LEIi3BBs";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="3FYwv4Ai";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="LEIi3BBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C75610E02D;
 Wed, 20 Nov 2024 20:41:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B82BB2198E;
 Wed, 20 Nov 2024 20:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1732135294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XfALIRkRLxT9Gd8nEh/iFmuASz8XRiA4HZA6xP6QCeI=;
 b=3FYwv4AiyPOmKfLZ3D3/p7u7WgEVeHj/v9+ESgPuqpnU6GkA7OUzbk3WVMQ/yV6vCfve5L
 3BZI1sNYvSzK+34aIs5Cm7bNbtY131GfcDgoOQyIUOjeSNze980wHCXrXLo9/B9f8DOxBP
 AsyHmfaUE+6daSAEaxXr5CcrcuyvSuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1732135294;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XfALIRkRLxT9Gd8nEh/iFmuASz8XRiA4HZA6xP6QCeI=;
 b=LEIi3BBsaiFjRU6v0i2sWokHey6an8mChD/2LTCkavPKhCxa7lEOj382NfHsIYMjdCd/Wb
 918denJEnJKP+eBQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=3FYwv4Ai;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=LEIi3BBs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1732135294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XfALIRkRLxT9Gd8nEh/iFmuASz8XRiA4HZA6xP6QCeI=;
 b=3FYwv4AiyPOmKfLZ3D3/p7u7WgEVeHj/v9+ESgPuqpnU6GkA7OUzbk3WVMQ/yV6vCfve5L
 3BZI1sNYvSzK+34aIs5Cm7bNbtY131GfcDgoOQyIUOjeSNze980wHCXrXLo9/B9f8DOxBP
 AsyHmfaUE+6daSAEaxXr5CcrcuyvSuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1732135294;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XfALIRkRLxT9Gd8nEh/iFmuASz8XRiA4HZA6xP6QCeI=;
 b=LEIi3BBsaiFjRU6v0i2sWokHey6an8mChD/2LTCkavPKhCxa7lEOj382NfHsIYMjdCd/Wb
 918denJEnJKP+eBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C7E8137CF;
 Wed, 20 Nov 2024 20:41:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id b/6dB35JPmdiGwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 20 Nov 2024 20:41:34 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-arm-msm@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>, Masahiro Yamada <masahiroy@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>
Subject: [PATCH v4 1/2] init/Kconfig: add python3 availability config
Date: Wed, 20 Nov 2024 21:41:24 +0100
Message-ID: <20241120204125.52644-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B82BB2198E
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[10];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[suse.cz,kernel.org,linaro.org,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
X-Mailman-Approved-At: Thu, 21 Nov 2024 08:40:20 +0000
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

It will be used in the next commit for DRM_MSM.

Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v3->v4:
* Move definition to the end of the file

 init/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index fbd0cb06a50a..c77e45484e81 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2047,3 +2047,6 @@ config ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
 # <asm/syscall_wrapper.h>.
 config ARCH_HAS_SYSCALL_WRAPPER
 	def_bool n
+
+config HAVE_PYTHON3
+	def_bool $(success,$(PYTHON3) -V)
-- 
2.45.2

