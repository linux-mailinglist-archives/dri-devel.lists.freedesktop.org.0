Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AD186C8B1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 13:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB95E10E193;
	Thu, 29 Feb 2024 12:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JXrBMOQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4902610E193
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 12:01:17 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-412c1d433c4so1382775e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 04:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709208075; x=1709812875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eEAjs0RdcfPAuQlAjUQMeit5zsCbuLGbEFFZ96le7No=;
 b=JXrBMOQQmFbzpNYOPP76WdFw5OpYcDIuJvqYtexO7cnzeVZ6tXW/BZC7iy1R1jLS8i
 Ig+rd6iVaor8ae0t22c6Ixyt3B1tZ7xeLJKq7OBw2WidN+b59oAcS+PnBRb5vNh82EpP
 0yTiJfMIooQXhmsqXhKs1DIcBg56FnQkjBNH2uvhU1a5cPTwTjrPsd+yjQmIJRwo00LK
 eA5Aw6fVxjI2ynSvF/wbTva7xCJPTccfPLMvwCgK1ciP1+H2Ntd/nGfTMCneZwWTH04u
 4PLQqyDBk/z0TbR2YB7IKvUujRGr+CcnCOn1kAHGXWdETEyshRphpHyf7yvEGmUKeP0i
 1g0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709208075; x=1709812875;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eEAjs0RdcfPAuQlAjUQMeit5zsCbuLGbEFFZ96le7No=;
 b=bgnyiRJdwqgNBXN8ut4ThjVeF2vfV7Qq8gkmfD8heR+i4Im2WOgNs16kuaEwuNP6Uz
 jm8UptmzcCWySGqbbXCzWMdt7+Tm+GVO/V4/QVvlcBSwFHbeuVn/oGplkS14wsjhKc9K
 K7XuO3aalG9syhlYNTGcVyY++vQcP1qETJ3H0OoZMowHTD5rt4QHSkBdtP0iNRlQZchO
 rGLuVYJwuzLkoHmpq20RsUig0S41RsUXDi0k5wi8FNoqxWkyri+AVWiJV4GkjVpnnObq
 FgO4ZD1uEEipuOJUSh6BvEwKSmaT+qbuJ9sYv/W7sKD6i7Ln5ZQoIe5uajRbCUQJffe4
 iqHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDMiGEJhQDCqB+owOt8YuA/zPilRZIZJzxvkU97fQJ5qgcYaKh1umJml02soUy+l/goH4X756YDVh/efmltF7+tPpdyTRiKXbvyhbGugt0
X-Gm-Message-State: AOJu0YyvhxdTRaiapIKrmoSJEKFiStsDtIQLzlQV+8fHdnP9lhifg2YJ
 CUyF1JBNys018Nz3oDFCB9kZTY6dixmyJbPi+yv30+rqVtCdNAOX
X-Google-Smtp-Source: AGHT+IHC3vwxsZB7sP4Fov8PtZ8j3jocrLNBn1PvwUm276KL0P9EU9+xvQoaqFjvMvY+vAlNTY8CIg==
X-Received: by 2002:a05:600c:4ed4:b0:412:9842:c4f2 with SMTP id
 g20-20020a05600c4ed400b004129842c4f2mr1610641wmq.12.1709208075311; 
 Thu, 29 Feb 2024 04:01:15 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b00412a31d2e2asm1908421wmq.32.2024.02.29.04.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 04:01:14 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] staging: fbtft: remove unused variable 'count'
Date: Thu, 29 Feb 2024 12:01:14 +0000
Message-Id: <20240229120114.219085-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable count is being initialized and incremented but it is never
actually referenced in any other way. The variable is redundant and can
be removed.

Cleans up clang scan build warning:
drivers/staging/fbtft/fbtft-core.c:330:6: warning: variable 'count' set
but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 68add4d598ae..38845f23023f 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -327,7 +327,6 @@ static void fbtft_deferred_io(struct fb_info *info, struct list_head *pagereflis
 	unsigned int dirty_lines_start, dirty_lines_end;
 	struct fb_deferred_io_pageref *pageref;
 	unsigned int y_low = 0, y_high = 0;
-	int count = 0;
 
 	spin_lock(&par->dirty_lock);
 	dirty_lines_start = par->dirty_lines_start;
@@ -339,7 +338,6 @@ static void fbtft_deferred_io(struct fb_info *info, struct list_head *pagereflis
 
 	/* Mark display lines as dirty */
 	list_for_each_entry(pageref, pagereflist, list) {
-		count++;
 		y_low = pageref->offset / info->fix.line_length;
 		y_high = (pageref->offset + PAGE_SIZE - 1) / info->fix.line_length;
 		dev_dbg(info->device,
-- 
2.39.2

