Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF95274ACFE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 10:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D9310E52E;
	Fri,  7 Jul 2023 08:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02A110E528
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 08:34:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 71F95227BF;
 Fri,  7 Jul 2023 08:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688718867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMwLIko/n0DlYoocrVnbzMjwujsIFsQzXunnsYrfOew=;
 b=ZTgvS2Hnu5DfHwlerwmCmX/X/rN3wSxLrGOo50U3pVZbebV6lsaa4CGtxXDKyXrfkJzUfC
 A9pODJuUuIQoBXaorEz3cNAr9dhI/aXiFB8I3v5YTxvXTIi3igAi7Gp/FbZ2R37A67pkKV
 c+0fL8VEfXJUusF8IJh2Mz97w7R43k8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688718867;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMwLIko/n0DlYoocrVnbzMjwujsIFsQzXunnsYrfOew=;
 b=y9QgbtOFwty2wuxsMqAeTPaQHu/VGEM7f3J+JoFxhlrN9q8tySeyveOSdS+Ft/JQF6WOz/
 /06SkcDmyRH4A3Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 376931346D;
 Fri,  7 Jul 2023 08:34:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +D6FDBPOp2RdQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Jul 2023 08:34:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 04/12] drm/tegra: Set fbdev FBINFO_VIRTFB flag
Date: Fri,  7 Jul 2023 10:31:55 +0200
Message-ID: <20230707083422.18691-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707083422.18691-1-tzimmermann@suse.de>
References: <20230707083422.18691-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mark the framebuffer with FBINFO_VIRTFB. The framebuffer range is
in DMA-able memory and should be accessed with the CPU's regular
memory ops.

v2:
	* drop FBINFO_DEFAULT

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/fbdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index 82577b7c88da..d8460c5dc91e 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -132,6 +132,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 		}
 	}
 
+	info->flags |= FBINFO_VIRTFB;
 	info->screen_base = (void __iomem *)bo->vaddr + offset;
 	info->screen_size = size;
 	info->fix.smem_start = (unsigned long)(bo->iova + offset);
-- 
2.41.0

