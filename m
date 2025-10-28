Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC641C160ED
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B45110E617;
	Tue, 28 Oct 2025 17:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="r6HVY8Nq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6tmxbhnC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r6HVY8Nq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6tmxbhnC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E3510E617
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:09:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8363921A58;
 Tue, 28 Oct 2025 17:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761671357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=bcgwgXncznYqsuYEz9kPT8bVLBBlMYSeLHSo2Z0n/DA=;
 b=r6HVY8NqqNIf8Y5dc6HLoRJSbcPN7adZfoc/YZWdYSREn+7jBx+A9uotz9uoUaajku/hCl
 7jV4vCWx71b3wd8uefoXoj7+Otr6OAz0FszqG5bmjiN2xVjc7Be3ovqSLgGlfy4cWp3G/B
 QTix0bQvInQu3ZtXzYUsVRlrEZAKbig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761671357;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=bcgwgXncznYqsuYEz9kPT8bVLBBlMYSeLHSo2Z0n/DA=;
 b=6tmxbhnCUTs7K2uCn6RuCYNmxFfPbu5PrZNmmhtAX7AVZ435mjU/59DiftXGtcp6Skh3n4
 CO0LFE3V3YrzaxCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761671357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=bcgwgXncznYqsuYEz9kPT8bVLBBlMYSeLHSo2Z0n/DA=;
 b=r6HVY8NqqNIf8Y5dc6HLoRJSbcPN7adZfoc/YZWdYSREn+7jBx+A9uotz9uoUaajku/hCl
 7jV4vCWx71b3wd8uefoXoj7+Otr6OAz0FszqG5bmjiN2xVjc7Be3ovqSLgGlfy4cWp3G/B
 QTix0bQvInQu3ZtXzYUsVRlrEZAKbig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761671357;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=bcgwgXncznYqsuYEz9kPT8bVLBBlMYSeLHSo2Z0n/DA=;
 b=6tmxbhnCUTs7K2uCn6RuCYNmxFfPbu5PrZNmmhtAX7AVZ435mjU/59DiftXGtcp6Skh3n4
 CO0LFE3V3YrzaxCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19C0113693;
 Tue, 28 Oct 2025 17:09:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +NcMBL34AGkjZQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Oct 2025 17:09:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de,
 lee@kernel.org, danielt@kernel.org, simona.vetter@ffwll.ch
Cc: linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel test robot <lkp@intel.com>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH] arch: sh: Include <linux/io.h> in dac.h
Date: Tue, 28 Oct 2025 18:07:55 +0100
Message-ID: <20251028170913.16711-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,suse.de,intel.com,gmail.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_SEVEN(0.00)[11];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
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

Include <linux/io.h> to avoid depending on <linux/backlight.h> for
including it. Declares __raw_readb() and __raw_writeb().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510282206.wI0HrqcK-lkp@intel.com/
Fixes: 243ce64b2b37 ("backlight: Do not include <linux/fb.h> in header file")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Thompson (RISCstar) <danielt@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <danielt@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: dri-devel@lists.freedesktop.org
---
This is fallout from a recent cleanup of the backlight header file. I don't
have the option of building or testing this change, though.
---
 arch/sh/include/cpu-sh3/cpu/dac.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/sh/include/cpu-sh3/cpu/dac.h b/arch/sh/include/cpu-sh3/cpu/dac.h
index fd02331608a8..323ec8570bcd 100644
--- a/arch/sh/include/cpu-sh3/cpu/dac.h
+++ b/arch/sh/include/cpu-sh3/cpu/dac.h
@@ -2,6 +2,8 @@
 #ifndef __ASM_CPU_SH3_DAC_H
 #define __ASM_CPU_SH3_DAC_H
 
+#include <linux/io.h>
+
 /*
  * Copyright (C) 2003  Andriy Skulysh
  */
-- 
2.51.1

