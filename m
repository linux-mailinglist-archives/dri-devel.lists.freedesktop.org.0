Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FD299A6BE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 16:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76FF10EAFF;
	Fri, 11 Oct 2024 14:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mTWGN+4q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0Xw1sBXO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mTWGN+4q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0Xw1sBXO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134AA10EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 14:46:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6BA92202C;
 Fri, 11 Oct 2024 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728657994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4puAnkEKl7QwS8jGq75AeV2svkl7bELdsm2OJOwEZfk=;
 b=mTWGN+4qr1OIlB5XciII3th7UbdWcOqsUSG8YIZFRbBW9maVHFEIG+0ZeQH22GdDNCIh7n
 OJg65TWYkiIeRqL1curwN1wiQKs3IWVjcPhWyi7w4tunp68HWd2hdOJnoUWQdmLCVowC3X
 z9YcZ7H5PzuRaSZ8VnqRxdtlwt72K/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728657994;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4puAnkEKl7QwS8jGq75AeV2svkl7bELdsm2OJOwEZfk=;
 b=0Xw1sBXOJ6Qlxzh0FZ4XOP3a7oggVdS8s5AErZlMut4S4p/fWuHricJdBS23Np+qj9EpY2
 MBv0fanbBE1mE2DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728657994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4puAnkEKl7QwS8jGq75AeV2svkl7bELdsm2OJOwEZfk=;
 b=mTWGN+4qr1OIlB5XciII3th7UbdWcOqsUSG8YIZFRbBW9maVHFEIG+0ZeQH22GdDNCIh7n
 OJg65TWYkiIeRqL1curwN1wiQKs3IWVjcPhWyi7w4tunp68HWd2hdOJnoUWQdmLCVowC3X
 z9YcZ7H5PzuRaSZ8VnqRxdtlwt72K/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728657994;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4puAnkEKl7QwS8jGq75AeV2svkl7bELdsm2OJOwEZfk=;
 b=0Xw1sBXOJ6Qlxzh0FZ4XOP3a7oggVdS8s5AErZlMut4S4p/fWuHricJdBS23Np+qj9EpY2
 MBv0fanbBE1mE2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C132136E0;
 Fri, 11 Oct 2024 14:46:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UJjrHEo6CWc/GwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Oct 2024 14:46:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH 3/6] drm/panel: panel-orisetech-otm8009a: Include
 <linux/mod_devicetable.h>
Date: Fri, 11 Oct 2024 16:41:21 +0200
Message-ID: <20241011144632.90434-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241011144632.90434-1-tzimmermann@suse.de>
References: <20241011144632.90434-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,linaro.org:email];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Include <linux/mod_devicetable.h> directly to get struct of_device_id.
Avoids the proxy include via <linux/backlight.h>

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index a9b5dad70bc1..87bbb25d119a 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -9,6 +9,7 @@
 #include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
 
-- 
2.46.0

