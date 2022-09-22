Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1105E633F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 15:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD9910EB07;
	Thu, 22 Sep 2022 13:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813DA10EB09
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 13:09:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4068421A32;
 Thu, 22 Sep 2022 13:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663852186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWulg/l5ehfBHtpylPIBX5JoO8RkZNmReDRxQ7q4NE8=;
 b=r8FVB3rLS9io3O6x/Gg816YrTS8BN1NI+UDLNxZ+MwIWgJy6zurJ3ZtUaqURnJaxjtkvP9
 CuJimWa7QSdUA4tpNJ205dmA296MbQSHNVqYW/1C0eJFEbJ010J+e+bIB5nnUOFDCIRBJi
 u8qIrK96VgJAl7OxXSir6yDk9SFHBcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663852186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWulg/l5ehfBHtpylPIBX5JoO8RkZNmReDRxQ7q4NE8=;
 b=uDWcKE9Ath63I3s/8qlTUdtGHZavZBG+oZ0nmY/44P3spbNMXyCV31tDKhr7a8CuXx0HyU
 AeXCAlqVTIfKMJBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 20FA613AF0;
 Thu, 22 Sep 2022 13:09:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kN4qB5peLGMSbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Sep 2022 13:09:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 1/5] drm/simpledrm: Compute linestride with
 drm_format_info_min_pitch()
Date: Thu, 22 Sep 2022 15:09:40 +0200
Message-Id: <20220922130944.27138-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922130944.27138-1-tzimmermann@suse.de>
References: <20220922130944.27138-1-tzimmermann@suse.de>
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

If not given, compute the stride with drm_format_info_min_pitch(). It's
the standard helper for this purpose.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: fd9e3169e42b ("drm/simpledrm: Compute framebuffer stride if not set")
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/tiny/simpledrm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index ea5b3239a659..51d01e34d5eb 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -687,8 +687,11 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		drm_err(dev, "no simplefb configuration found\n");
 		return ERR_PTR(-ENODEV);
 	}
-	if (!stride)
-		stride = DIV_ROUND_UP(drm_format_info_bpp(format, 0) * width, 8);
+	if (!stride) {
+		stride = drm_format_info_min_pitch(format, 0, width);
+		if (drm_WARN_ON(dev, !stride))
+			return ERR_PTR(-EINVAL);
+	}
 
 	sdev->mode = simpledrm_mode(width, height);
 	sdev->format = format;
-- 
2.37.3

