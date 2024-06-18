Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7318390CB7E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 14:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BF710E660;
	Tue, 18 Jun 2024 12:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gqFLIg4g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+IuhtfVE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gqFLIg4g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+IuhtfVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C22210E660
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 12:20:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F2801F45B;
 Tue, 18 Jun 2024 12:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718713204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nuNLBQkTsfR+V25TRmViz6z/l9TGgt8MxTKJQZRNjBM=;
 b=gqFLIg4gld/fG1yn0eyBj7TfaGYGO9OlGnGPjYP8jAP5gYEET+f66S7hEL36PIacEcbdsB
 5TvL4QiRnoX/5KZns2Cev4LHzOlm1Vs9xnZAE5Mgn77KGlRp5qBJAx7o0qpaJiiilhHdoR
 AaGJKB/zpSOYnRL7BBDTeR99wBQ1Ulc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718713204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nuNLBQkTsfR+V25TRmViz6z/l9TGgt8MxTKJQZRNjBM=;
 b=+IuhtfVEbPt8vqETwXxupFZAddYd0pZlrgIplACwzdB64L2qcpx3wV9h/Dtia0b7vqddx8
 /zTEOzM7nlFnxoBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718713204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nuNLBQkTsfR+V25TRmViz6z/l9TGgt8MxTKJQZRNjBM=;
 b=gqFLIg4gld/fG1yn0eyBj7TfaGYGO9OlGnGPjYP8jAP5gYEET+f66S7hEL36PIacEcbdsB
 5TvL4QiRnoX/5KZns2Cev4LHzOlm1Vs9xnZAE5Mgn77KGlRp5qBJAx7o0qpaJiiilhHdoR
 AaGJKB/zpSOYnRL7BBDTeR99wBQ1Ulc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718713204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nuNLBQkTsfR+V25TRmViz6z/l9TGgt8MxTKJQZRNjBM=;
 b=+IuhtfVEbPt8vqETwXxupFZAddYd0pZlrgIplACwzdB64L2qcpx3wV9h/Dtia0b7vqddx8
 /zTEOzM7nlFnxoBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1D9F13AA0;
 Tue, 18 Jun 2024 12:20:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6QtPLHJ7cWZmTwAAD6G6ig
 (envelope-from <jdelvare@suse.de>); Tue, 18 Jun 2024 12:20:02 +0000
Date: Tue, 18 Jun 2024 14:20:00 +0200
From: Jean Delvare <jdelvare@suse.de>
To: dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard 
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Doug Anderson
 <dianders@chromium.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v2] drm/display: Drop obsolete dependency on COMPILE_TEST
Message-ID: <20240618142000.3307858f@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[9]; RCVD_TLS_ALL(0.00)[];
 HAS_ORG_HEADER(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,chromium.org,huawei.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
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

Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
is possible to test-build any driver which depends on OF on any
architecture by explicitly selecting OF. Therefore depending on
COMPILE_TEST as an alternative is no longer needed.

To avoid reintroducing the randconfig bug originally fixed by commit
876271118aa4 ("drm/display: Fix build error without CONFIG_OF"),
DRM_MSM which selects DRM_DISPLAY_DP_HELPER must explicitly depend
on OF. This is consistent with what all other DRM drivers are doing.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
For regular builds, this is a no-op, as OF is always enabled on
ARCH_QCOM and SOC_IMX5. So this change only affects test builds. As
explained before, allowing test builds only when OF is enabled
improves the quality of these test builds, as the result is then
closer to how the code is built on its intended targets.

Changes since v1:
* Let DRM_MSM depend on OF so that random test builds won't break.

 drivers/gpu/drm/display/Kconfig |    2 +-
 drivers/gpu/drm/msm/Kconfig     |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

--- linux-6.9.orig/drivers/gpu/drm/display/Kconfig
+++ linux-6.9/drivers/gpu/drm/display/Kconfig
@@ -3,7 +3,7 @@
 config DRM_DP_AUX_BUS
 	tristate
 	depends on DRM
-	depends on OF || COMPILE_TEST
+	depends on OF
 
 config DRM_DISPLAY_HELPER
 	tristate
--- linux-6.9.orig/drivers/gpu/drm/msm/Kconfig
+++ linux-6.9/drivers/gpu/drm/msm/Kconfig
@@ -6,6 +6,7 @@ config DRM_MSM
 	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on IOMMU_SUPPORT
+	depends on OF
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n


-- 
Jean Delvare
SUSE L3 Support
