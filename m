Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0DA9D4317
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 21:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6C010E3FE;
	Wed, 20 Nov 2024 20:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="E8rYxIAM";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="DigfWKYZ";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="E8rYxIAM";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="DigfWKYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E62B10E78E;
 Wed, 20 Nov 2024 15:49:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AC4D7211D7;
 Wed, 20 Nov 2024 15:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1732117767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R/vAdDCZ7AeI7ZWvAk/xK249zyMaEemAZqVttREVMeI=;
 b=E8rYxIAMrCCxvfVPy7qYYwHg37yNshTpZWzKYkIYiCJiMHDtuOgciGF30kylmRGl4FPgha
 37d45Z0M1QyAZ+Bg+iOVbdM1iPBnYT1qW6PW00FoInpjC8bRc3kFcGrLM8ya1cljnBKhpF
 vKYEQq5DhwNY4StGTqVWCYsOZ/4hOqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1732117767;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R/vAdDCZ7AeI7ZWvAk/xK249zyMaEemAZqVttREVMeI=;
 b=DigfWKYZNJUi43jog02pGeKbgezxBHqHYbmhJdp8OCK5HaKbl69dyUT3c+nqYVWE+YSDgQ
 7+W1BLgRbe3nTbCA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=E8rYxIAM;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=DigfWKYZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1732117767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R/vAdDCZ7AeI7ZWvAk/xK249zyMaEemAZqVttREVMeI=;
 b=E8rYxIAMrCCxvfVPy7qYYwHg37yNshTpZWzKYkIYiCJiMHDtuOgciGF30kylmRGl4FPgha
 37d45Z0M1QyAZ+Bg+iOVbdM1iPBnYT1qW6PW00FoInpjC8bRc3kFcGrLM8ya1cljnBKhpF
 vKYEQq5DhwNY4StGTqVWCYsOZ/4hOqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1732117767;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R/vAdDCZ7AeI7ZWvAk/xK249zyMaEemAZqVttREVMeI=;
 b=DigfWKYZNJUi43jog02pGeKbgezxBHqHYbmhJdp8OCK5HaKbl69dyUT3c+nqYVWE+YSDgQ
 7+W1BLgRbe3nTbCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 098B713297;
 Wed, 20 Nov 2024 15:49:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dEf7AAcFPmc4SgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 20 Nov 2024 15:49:27 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-arm-msm@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>, Masahiro Yamada <masahiroy@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [RFC][PATCH 1/1] drm/msm: require python3 and xml.parsers.expat module
Date: Wed, 20 Nov 2024 16:49:19 +0100
Message-ID: <20241120154919.814593-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AC4D7211D7
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_SEVEN(0.00)[7];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
X-Mailman-Approved-At: Wed, 20 Nov 2024 20:33:14 +0000
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

0fddd045f88e introduced python3 dependency, require it to quick early.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi all,

RFC because I'm not sure if previous failed build wasn't better:

	GENHDR  drivers/gpu/drm/msm/generated/a2xx.xml.h
	/bin/sh: python3: not found

This way it's documented, but CONFIG_DRM_MSM just silently disappears
from .config. Also because depends on $(success ..) is not evaluated
(understand, some expressions can be really long) one see only:
Depends on: n [=n].

I was thinking about testing via $(PYTHON3) -m "xml.parsers.expat",
but because expat parser (and other modules) should be part the official
python3 and are installed even on minimal python3 installations (e.g.
python3-minimal on Debian). Therefore depending on "$(PYTHON3) -V"
should be enough.

Kind regards,
Petr

 drivers/gpu/drm/msm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 90c68106b63b..2cf4573a2ff1 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -11,6 +11,7 @@ config DRM_MSM
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
 	depends on PM
+	depends on $(success,$(PYTHON3) -V)
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
@@ -36,7 +37,7 @@ config DRM_MSM
 	select PM_GENERIC_DOMAINS
 	select TRACE_GPU_MEM
 	help
-	  DRM/KMS driver for MSM/snapdragon.
+	  DRM/KMS driver for MSM/snapdragon.  Requires python3.
 
 config DRM_MSM_GPU_STATE
 	bool
-- 
2.47.0

