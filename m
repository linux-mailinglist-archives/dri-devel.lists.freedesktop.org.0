Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3050B6A3F23
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 11:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA52610E20A;
	Mon, 27 Feb 2023 10:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F9A10E20A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 10:07:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l1so2512497wry.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 02:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qAMEtyjFDybUtWkpyE6ui7qLzDRJJ6qwM16U5VTuzlg=;
 b=e4tBYEn47Bz7XTq/47q1gAg4ykFpvq98gzdqcMJUJkKWlNHPZ9h/rzex1SoseIKQRF
 VYJFEwDvVBRz7cTK2Cfzu6dqM9fBtoLXH/S4fiNCCn+i+6X7WzO8FLO+ez0/buSL8DL2
 HhpyW9+QVXe3hTM5DqCgk09LjZaWh0USZKDutYXCqmNXVlWkW/aXTiDCjFGUoXsjVdfF
 oqZoSuspvzd4EKLS52srDlSPTtRkAm8qWb6MbadaEdOegQm1JKcaw0EHQNwGZTVAunYX
 lpZIdjozf+vlbWvvcUihfQ1u1KcELVlc72ntGEzUvzhjm84blJgS06n3uvi2F0M5Y1FQ
 mByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qAMEtyjFDybUtWkpyE6ui7qLzDRJJ6qwM16U5VTuzlg=;
 b=XvLSprW2LvIYPZPm6e4kMlr5YE0EkU75KTY6vWTlsIz1PB3w0GdZnim/ZfZAvjTxnN
 3ZbOoiWeQU257zgJeXRH0wsXSiNud1t6HBJpJTQanrLjyABccnuAmxxzj0EOE0hBkc8U
 KZYivee8tfA7wjk1akIeW2jDvo48Cl1CU37+QQiGb0jUUGa38GVSZR5RI0azIBGxiAX8
 us4Yf24yxrrB5hYrT46IX6lZdAB7WkRjEEG9VSnJ626N5AI/TMI0csDRXmNvWu2TbFKx
 GsIohN3QRBPKmz2j1JPPtWgzI6jqpz3AS3bhfj7F+Z3u6NxTIFT0FvjyEpGBpw/gupY0
 CVTQ==
X-Gm-Message-State: AO0yUKX/GZA7X3YMXIgyn4GY7cBvmMwNgeG5s9aRysk7JfjuKNhCyQ35
 2xqf+cwg83Dp6DxkmL9MTXo=
X-Google-Smtp-Source: AK7set+/ftDBmse6dEgq46GZHTuU3FWLKVD5J/HGxegFqt+baaFGyw9PDDL9gTRiJnuitgx1/F6bOg==
X-Received: by 2002:a05:6000:15c4:b0:2c5:3fce:423b with SMTP id
 y4-20020a05600015c400b002c53fce423bmr7345353wry.4.1677492423829; 
 Mon, 27 Feb 2023 02:07:03 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 p10-20020a5d458a000000b002c559def236sm6630643wrq.57.2023.02.27.02.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:07:02 -0800 (PST)
Date: Mon, 27 Feb 2023 13:06:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Fix a NULL vs IS_ERR() bug
Message-ID: <Y/yAw6sHu82OnOWj@kili>
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drmm_encoder_alloc() function returns error pointers.  It never
returns NULL.  Fix the check accordingly.

Fixes: 7a1adbd23990 ("drm: rcar-du: Use drmm_encoder_alloc() to manage encoder")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index b1787be31e92..7ecec7b04a8d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -109,8 +109,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	renc = drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder, base,
 				  &rcar_du_encoder_funcs, DRM_MODE_ENCODER_NONE,
 				  NULL);
-	if (!renc)
-		return -ENOMEM;
+	if (IS_ERR(renc))
+		return PTR_ERR(renc);
 
 	renc->output = output;
 
-- 
2.39.1

