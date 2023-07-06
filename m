Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF00C749C71
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 14:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC13910E426;
	Thu,  6 Jul 2023 12:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DDA10E3F9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 12:49:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 71E1B200AD;
 Thu,  6 Jul 2023 12:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688647748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMwLIko/n0DlYoocrVnbzMjwujsIFsQzXunnsYrfOew=;
 b=SEiDH/lIXMKkQx+m0hz/4ozmHAsdj1lvAa0SOZXIPfMZs3l0dpZOd1pbrmxZSS4gNf1MTB
 yu+4JQaJc8ndmPiGhGKehUV3xLZ68pLIP/0vSpo/Ln5lHl+3AwCWxAstkHwFVjBgSGoYOM
 VadEl5DMfLnz51K6Z6vAbGiGLp9c2pA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688647748;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMwLIko/n0DlYoocrVnbzMjwujsIFsQzXunnsYrfOew=;
 b=m9Fcgg9K3wj9AktfjnkGzrJW8JOXVN4K7KTUc3G9qQqtGqukIg5pb2FkycgI3d198b56Ou
 6g8eJJ6RRT7ESTBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 353F01390F;
 Thu,  6 Jul 2023 12:49:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KKgKDES4pmS7QgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 12:49:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v2 04/11] drm/tegra: Set fbdev FBINFO_VIRTFB flag
Date: Thu,  6 Jul 2023 14:46:42 +0200
Message-ID: <20230706124905.15134-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706124905.15134-1-tzimmermann@suse.de>
References: <20230706124905.15134-1-tzimmermann@suse.de>
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

