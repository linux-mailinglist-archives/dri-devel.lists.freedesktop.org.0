Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6955E47219C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 08:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE5110E373;
	Mon, 13 Dec 2021 07:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DE010E373
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 07:21:21 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so12548098pjb.5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 23:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=HVnnmDHMSAlLudHh2weJdjgBJk3noTgCFu3aVuhxzkY=;
 b=MAdYUJKJdsGLKqAVTkt2cBe7+7KjiOX3Aa6AEVkEwCXhRwOKzmlnnuyCrIxDdI+eTS
 98JtjgVazDST37Wp0dLG54KZ6D4GgYZMMLLoUxXIVYlO+NqgREpy4my9cHMqNsOEOsd4
 bP0FX8vsnC2fSoU3fL5SrfNOTPBkop32ML/ucRsuPfFQSvKWekqYF06QxTWy/qtTZ4If
 wHnSb27/+TyPcXsj7T/nsWQF6If0YVVNrJUPuuDoOZxPZRPSf2aoL+q4QgAYmmldDhVq
 sMxLZT8eGDB3KLcMU0CKL8llLC9VdFwforaWmkfsd9Lukb7wiefb8CGoOaIJDIIkQ8DK
 5Kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HVnnmDHMSAlLudHh2weJdjgBJk3noTgCFu3aVuhxzkY=;
 b=AbxaliTRL53Hldgj9M8koVPHUk5aD3AvUJ8WRKPqhtyf4vc65rvNnY8j/Gf5i9CEry
 1X3AkoXm+v1g1NRK3YI9EwRX6l99tFCDZxnU6dkCQ6QBL9vClYCyfkra6V3xO0Ynd6WA
 iJ7t4FxyKjk8gYtwf/1jSeOtXEWnRph23awscfEUud9S33A+og1+QVKFFveJ3J7PDWmS
 v7lm32Tvfkm8otskSLLfMKy2SLzRnb+Gf+rEFCcypCmb4uKwEBsy8nMNjh0FXcpGDCKh
 jSZEvG5f+/xzTL7nwUB8U2QfM1R/VnGMBejyFQFHkK9MKc3XKQ4JiJBldontBJt6O+tq
 gkxQ==
X-Gm-Message-State: AOAM530BuyZbr6uvihU99iBC2Zb30pzF0wi6VZ4KXn22ZqqeGO+Mo/7R
 AyOLg+1usfBT1A1znCkiod4=
X-Google-Smtp-Source: ABdhPJxxd9MY8IUrj1xFEfZXUxZ+y6bUFGcoD/7/OXAJyQ6k+fYHa2H2eB4Iw7r/NsOymwDkTrMhTg==
X-Received: by 2002:a17:902:bf4b:b0:143:aa96:f608 with SMTP id
 u11-20020a170902bf4b00b00143aa96f608mr93035834pls.23.1639380081096; 
 Sun, 12 Dec 2021 23:21:21 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 y190sm10913520pfg.153.2021.12.12.23.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 23:21:20 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] udmabuf: Fix NULL vs IS_ERR() checking
Date: Mon, 13 Dec 2021 07:21:15 +0000
Message-Id: <20211213072115.18098-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linmq006@gmail.com, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The get_sg_table() function does not return NULL.
It returns error pointers.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/arm/malidp_planes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 0562bdaac00c..2ef8feae8c4e 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -348,7 +348,7 @@ static bool malidp_check_pages_threshold(struct malidp_plane_state *ms,
 		else
 			sgt = obj->funcs->get_sg_table(obj);
 
-		if (!sgt)
+		if (IS_ERR(sgt))
 			return false;
 
 		sgl = sgt->sgl;
-- 
2.17.1

