Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8583F9D4318
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 21:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3011210E7BA;
	Wed, 20 Nov 2024 20:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="vT3Jx0IV";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="HmPAbJGo";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vT3Jx0IV";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="HmPAbJGo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78CD10E02D;
 Wed, 20 Nov 2024 20:22:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 223921F79B;
 Wed, 20 Nov 2024 20:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1732134174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9sOXzjJInGiXNkoV+xMz1TiUcsm7q+4Zj1SfADWtn1k=;
 b=vT3Jx0IVXzELlSft5AXu8UxpszKWayxEo6OR7NrcSkekCDOQP4u7B2IRDciYp/29fVs3zM
 /o8yzl85TEkDt+gJv6olBU63//ZCVRBj2bcKPNOkFiyLNRysrRqD41tZvsLhM3gL+Due9E
 D05KPP0Jh0uOO5gV1Lw3ZO+3HS126O0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1732134174;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9sOXzjJInGiXNkoV+xMz1TiUcsm7q+4Zj1SfADWtn1k=;
 b=HmPAbJGoDk4DIMJHC8+dxdF5bWvoaln7NYZ7JUx9wL3lPcdbd/WAoYD3rFZ58uHjAJC+G0
 DEuy2nnXAxaoZ3DQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=vT3Jx0IV;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=HmPAbJGo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1732134174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9sOXzjJInGiXNkoV+xMz1TiUcsm7q+4Zj1SfADWtn1k=;
 b=vT3Jx0IVXzELlSft5AXu8UxpszKWayxEo6OR7NrcSkekCDOQP4u7B2IRDciYp/29fVs3zM
 /o8yzl85TEkDt+gJv6olBU63//ZCVRBj2bcKPNOkFiyLNRysrRqD41tZvsLhM3gL+Due9E
 D05KPP0Jh0uOO5gV1Lw3ZO+3HS126O0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1732134174;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9sOXzjJInGiXNkoV+xMz1TiUcsm7q+4Zj1SfADWtn1k=;
 b=HmPAbJGoDk4DIMJHC8+dxdF5bWvoaln7NYZ7JUx9wL3lPcdbd/WAoYD3rFZ58uHjAJC+G0
 DEuy2nnXAxaoZ3DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5BFE5137CF;
 Wed, 20 Nov 2024 20:22:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MMd1Eh1FPmfvFgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 20 Nov 2024 20:22:53 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-arm-msm@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>, Masahiro Yamada <masahiroy@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Subject: [PATCH v2 1/2] init/Kconfig: add python3 availability check
Date: Wed, 20 Nov 2024 21:22:41 +0100
Message-ID: <20241120202242.49131-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 223921F79B
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[suse.cz,kernel.org,linaro.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8]; DKIM_TRACE(0.00)[suse.cz:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

It will be used in the next commit for DRM_MSM.

Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v2

 init/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index fbd0cb06a50a..2561eaebd1d3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -262,6 +262,9 @@ config HAVE_KERNEL_ZSTD
 config HAVE_KERNEL_UNCOMPRESSED
 	bool
 
+config HAVE_PYTHON3
+	def_bool $(success,$(PYTHON3) -V)
+
 choice
 	prompt "Kernel compression mode"
 	default KERNEL_GZIP
-- 
2.45.2

