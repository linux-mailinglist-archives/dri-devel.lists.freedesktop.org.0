Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1609DA89E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 14:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A4410E141;
	Wed, 27 Nov 2024 13:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QPtpmpYm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G/tUoNRM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2Hb/P3aK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="slhvYJCr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C29410E141
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 13:37:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D161D2117E;
 Wed, 27 Nov 2024 13:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1732714659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XNPL7LqEgCIjs++Im54WF28XZHo2gJCUPKoWiw5mmZk=;
 b=QPtpmpYmrDXz/DSv7nP+gFhBElhkJeWxvzvwLoN1GfSoyVQw2nfp4rqXewLTZuC3Fof74j
 +uLK5t5OS6OZlYMVEofi+HW4IrFD1Kif9ti2pu2rA6BZVcbQ2x3/2i438AN1tT0mQQ7Nw9
 zo3gmyw5QGKRHhuVBNMeUuEuOsNGP88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1732714659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XNPL7LqEgCIjs++Im54WF28XZHo2gJCUPKoWiw5mmZk=;
 b=G/tUoNRMpU0rqsUmuDlJ1+D80VVXUsvNjtBut75I92OTlmK+uAgRG3fAkVJJhmQkzGOViG
 CBPEk2DOc4r1KcBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="2Hb/P3aK";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=slhvYJCr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1732714658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XNPL7LqEgCIjs++Im54WF28XZHo2gJCUPKoWiw5mmZk=;
 b=2Hb/P3aKuiPhwFG/zV6016CVJEd/9PZAXkCUew4bFBpMmoTaND5yOZQHuBdPdpIfZ3a9Ed
 iIb2lG8J5OcyW4GTVk+BDauG80vh0A3yfdwoVolWc4Mp9FE4SA8WK5SmIJu4flZyjYD0vU
 CcJ4GX+cYM83gKrz9wS06ZOBzBnJ4t8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1732714658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XNPL7LqEgCIjs++Im54WF28XZHo2gJCUPKoWiw5mmZk=;
 b=slhvYJCrNdWhQHN4TBJEvN9vqMKS78vi4pAyKqb7KDX8e5R4fYbXfE449QegXgwZbuU6Zn
 2VtzbqlNyEoRyxCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 81129139AA;
 Wed, 27 Nov 2024 13:37:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UnAaHqIgR2dSCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Nov 2024 13:37:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 kong.kongxinwei@hisilicon.com, sumit.semwal@linaro.org,
 yongqin.liu@linaro.org, jstultz@google.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/hibmc: Drop dependency on Aarch86
Date: Wed, 27 Nov 2024 14:37:15 +0100
Message-ID: <20241127133732.470414-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D161D2117E
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[12];
 FREEMAIL_TO(0.00)[linaro.org,hisilicon.com,google.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

There exists x86-based hardware with HiSilicon BMC chipsets. This
driver works well on these systems. Drop the dependency on ARM64.

Tested on RH1288 V3.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
index 80253d39664a..93b8d32e3be1 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
+++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_HISI_HIBMC
 	tristate "DRM Support for Hisilicon Hibmc"
-	depends on DRM && PCI && (ARM64 || COMPILE_TEST)
+	depends on DRM && PCI
 	depends on MMU
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
-- 
2.47.0

