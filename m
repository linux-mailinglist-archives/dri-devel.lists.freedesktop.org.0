Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6132B7FB880
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94E410E4C8;
	Tue, 28 Nov 2023 10:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C0810E4B7;
 Tue, 28 Nov 2023 10:47:28 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2814F1F74D;
 Tue, 28 Nov 2023 10:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701168447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GlbV1AMis5WhR4RYiVpHv6K91/iOI9c1hHapYA4Li2M=;
 b=TgoMgYHt0XwUMl3MuU09q+J7nnC7DyKcg328BpB55MDnyw2qWf7VCjAZ/yFNNT0R1VfH31
 1h68oOsNV9jibAsEF3Ovm5XXaGxI6EgmxW5GZC/5+u/JajgjzFxzXohXkoX4vSqlD/x0fx
 0v9CgdDUkSZDnD0V7/2ambw94xW/W7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701168447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GlbV1AMis5WhR4RYiVpHv6K91/iOI9c1hHapYA4Li2M=;
 b=09KeOwxKdoa0HjBCN1wmOIeixQRrkXxp49ySxybGDmUPeKqtPXmZxa2i2XxTGRcN1ulAOl
 cPedifzPGXc78vAw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D2998139FC;
 Tue, 28 Nov 2023 10:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 6IxJMj7FZWXpagAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Nov 2023 10:47:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org, maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 airlied@gmail.com, suijingfeng@loongson.cn
Subject: [PATCH 4/8] drm/shmobile: Do not include <drm/drm_plane_helper.h>
Date: Tue, 28 Nov 2023 11:45:20 +0100
Message-ID: <20231128104723.20622-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128104723.20622-1-tzimmermann@suse.de>
References: <20231128104723.20622-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: 4.29
X-Spam-Level: ****
X-Spamd-Result: default: False [4.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; BAYES_SPAM(0.01)[42.42%];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; R_MISSING_CHARSET(2.50)[];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-0.42)[-0.416];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_TWELVE(0.00)[12];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,ffwll.ch,gmail.com,loongson.cn]; 
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[]
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
Cc: dri-devel@lists.freedesktop.org, javierm@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unnecessary include statements for <drm/drm_plane_helper.h>.
The file contains helpers for non-atomic code and should not be
required by most drivers. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 8f9a728affde8..07ad17d24294d 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -14,7 +14,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
-#include <drm/drm_plane_helper.h>
 
 #include "shmob_drm_drv.h"
 #include "shmob_drm_kms.h"
-- 
2.43.0

