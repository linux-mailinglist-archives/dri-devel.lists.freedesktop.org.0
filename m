Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BBB586C85
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 16:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B7E14B1BF;
	Mon,  1 Aug 2022 13:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB80DC0AC6
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 13:50:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE3DF4DF11;
 Mon,  1 Aug 2022 13:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659361831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raR5oTMFAEw6H259zs6BoIPEDKNiUxVjC/LRRvYTjK8=;
 b=JUiNd1l/BNhZwbvfwfQMWcDN0yvPIR0HmRA811JVm80m52a3Igp2of/acg2J/Z436r4TY3
 3wbrn6r2t40SJ3vG37YTe768dXjbEWj3MvyendWv9abeJr5u8B7Xb5zjW9Da/xBW8+5My+
 Bn/fpRXyE4mH7//5JxSYJn5pLI9QaoE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659361831;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raR5oTMFAEw6H259zs6BoIPEDKNiUxVjC/LRRvYTjK8=;
 b=LggrkZvKzIHAwedVCv1gx13kJOW6zb/TM2nJijcoSNYoh9nCXJxSrVuUyx2GaSFPQbIFgg
 /iI7o04cYwls2zDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CAA0213A72;
 Mon,  1 Aug 2022 13:50:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6FmcMCfa52IDRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Aug 2022 13:50:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, geert@linux-m68k.org, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 4/5] drm/simpledrm: Compute framebuffer stride if not set
Date: Mon,  1 Aug 2022 15:50:27 +0200
Message-Id: <20220801135028.30647-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801135028.30647-1-tzimmermann@suse.de>
References: <20220801135028.30647-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compute the framebuffer's scanline stride length if not given by
the simplefb data.

v3:
	* get pixel size from drm_format_info_bpp() (Geert, Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 9d27608d7369..11a7348ccf4d 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -743,6 +743,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		drm_err(dev, "no simplefb configuration found\n");
 		return ERR_PTR(-ENODEV);
 	}
+	if (!stride)
+		stride = DIV_ROUND_UP(drm_format_info_bpp(format, 0) * width, 8);
+
 	sdev->mode = simpledrm_mode(width, height);
 	sdev->format = format;
 	sdev->pitch = stride;
-- 
2.37.1

