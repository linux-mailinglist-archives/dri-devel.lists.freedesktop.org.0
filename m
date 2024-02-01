Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111DF845734
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 13:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8442110E52F;
	Thu,  1 Feb 2024 12:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TgD1Bbhd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DDD10E52F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 12:18:23 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a364b5c5c19so137620566b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Feb 2024 04:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706789902; x=1707394702; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2orRofZirbGTvQ+iko65Kwmr8ByVwpBalWEASle2m+g=;
 b=TgD1BbhdpEl/gG0H1noWgDI3hnfbY9iTe2lAMgA9HMhaMEjY3ruyr40b2aB2S8RE4T
 f5/DcGfxOPdpnjx0NO9pjj8Am80Vt5uCkfSjJc+dB+ignucIu5+E/UEScH0NmxSSwxlh
 4QqsT5NnGHqPd5wRpoMz15ve/uyzeggpcWkKSyRm2xd/p/rvsFj54d5KrY5uX69D959o
 YMAR/9MUTBSgjLLR9JjdBZsihKoemWEj9LE4PksYjsPGbq8fSq7D6kFDoNP0vqkqMqob
 mULPeRHN1Znq6TGkQgBClvKLpun7tMGdASCGN1HsH2C9+UdjfYL89zduBqCy06cHcqJS
 Sfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706789902; x=1707394702;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2orRofZirbGTvQ+iko65Kwmr8ByVwpBalWEASle2m+g=;
 b=r34lo6IPb/YHmAtk8ZgxMHwtZzzfUFR/8u9walU03wlisJi+mEpQoWGzwX7m1momvK
 NhB1mbe8OQ/Frpuw5eSXsa7NoCk/2PpnKwcXj98DxlE4SUXXtMG7rR1QGP/lFPkfwkfi
 o/90qOZD67Gw1IPaoeDkerLuu+WZ6gDqH1ODJ0igldyoRoORBPAd3rl/bCneYzIzP4WE
 yfZoaWar5y9d5lKDU1pYFvK5SpJV7Qb5zVl5JbqFA6W7Ryz/ffqWgbhUXpqHX3NSFGm+
 ku7Nm5a1GgBFaGcnZk7aTnA/VcBj1YJQjNJIKu8L92Gi7CnsU4BF3hzxhenkkpQP/PTh
 itTQ==
X-Gm-Message-State: AOJu0YySN3VT2jHlla9cqqeRUUeNgGGvjl1082nADyV7m6YY+ljhohKT
 SZyBArcCxRMJw5bX6L461FworNRsZk4IGxGwR57NOOOF2K4Leb5cSf7GZLpMYdY=
X-Google-Smtp-Source: AGHT+IEI0C9CnkKb2LW+p5Sm+IWjNynh3uPDi+tNE3FOxGscu5UPewiZ0qE61L40eFIimq0qURI+uw==
X-Received: by 2002:a17:906:688d:b0:a36:72f5:af5 with SMTP id
 n13-20020a170906688d00b00a3672f50af5mr3691533ejr.11.1706789902360; 
 Thu, 01 Feb 2024 04:18:22 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXEMWMXmLPaVrc8bpUVhzoxSuuUr3Oj4BdXzjtgA7agaXhQP4eDTz3MW+pL+zUFM84Fxby4GOkiEtieTwdvxdKPiYQqOrXYWd5SAXddSwoN0MVVzatdTgjO4q5xKHhxQ0usT1lFZlNdjliW6kIoYuC1UHVBdF8zFntt88miAaq5PrZ7VQ0vnTlHierISQ5RvZPEMvyJTF2B2CmoQDPrRaNl2pHCpXS66IsILZbcbuCRJKQnwsXW0yiMuRdD6vE/IQB6xKuZbTEnSCFVEcswYmIMy0sFt3nEHtvCjSiSI5WOW3nxolRfv6I3E4s5XxfCHqKmFaGfWXNHqrhdbNdXUTTeDeo90Ieae4/yPb2S010iavMfkCBzbsRekClOoUNKUq+Or+lJm8+psdbLi4FGDT2oCEVc7eySRbHx0qhV0SusAn/Q7cWp5nRYUKWAfuPl+z51rsXaWmq7cv4smDA3Het5+dGrf9INovOc
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 vi7-20020a170907d40700b00a369fbc95c0sm944194ejc.79.2024.02.01.04.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 04:18:22 -0800 (PST)
Date: Thu, 1 Feb 2024 15:18:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sarah Walker <sarah.walker@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/imagination: Fix an IS_ERR vs NULL bug in
 pvr_context_create()
Message-ID: <cde5a0bf-0d17-4fad-9c85-c7587c73a131@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The pvr_vm_context_lookup() function returns NULL on error (not error
pointers).  Update the check accordingly.

Fixes: d2d79d29bb98 ("drm/imagination: Implement context creation/destruction ioctls")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/imagination/pvr_context.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_context.c b/drivers/gpu/drm/imagination/pvr_context.c
index eded5e955cc0..e38d3578fc09 100644
--- a/drivers/gpu/drm/imagination/pvr_context.c
+++ b/drivers/gpu/drm/imagination/pvr_context.c
@@ -315,8 +315,8 @@ int pvr_context_create(struct pvr_file *pvr_file, struct drm_pvr_ioctl_create_co
 		goto err_free_ctx;
 
 	ctx->vm_ctx = pvr_vm_context_lookup(pvr_file, args->vm_context_handle);
-	if (IS_ERR(ctx->vm_ctx)) {
-		err = PTR_ERR(ctx->vm_ctx);
+	if (!ctx->vm_ctx) {
+		err = -EINVAL;
 		goto err_free_ctx;
 	}
 
-- 
2.43.0

