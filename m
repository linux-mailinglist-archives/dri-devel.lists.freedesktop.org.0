Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17A4502B8E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 16:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D392B10E1E1;
	Fri, 15 Apr 2022 14:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F16810E1E1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 14:13:59 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id 12so8478524oix.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 07:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y7gbuOQcgVegOGgriZZtIkm8aICEvz3iCExryeuJnKc=;
 b=GvaYw9m9uZIuDmPB083S//D9z0YL2IzNOcCjm1pVtXOpEFOGXRHx+X57H1kiE59Nzb
 mP3GZU2c9czB//al48ZD4CELtIesdvPQrHTEj39DcZ3Eg7aMjW9iSZfnDzDVL/GdO0KG
 dNEHYTdI+4FX8KZ2SHSyqFy22CNQElYK1QbyBOaDESe/WJob8lGxEtc5r8rygJKiO3dr
 d/uKgtDagblI5ITRTB+4lac6E00qMJi9B0pOcNpzs4Lj9/hhov/MO8c0QCFVDMIOD27N
 xg11F34GLhQ2KnTp9NsVqgLJNqBe+a1+NCL71tdl7ueYhCe4bTLsms4oiEjNLtBtDdue
 GEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y7gbuOQcgVegOGgriZZtIkm8aICEvz3iCExryeuJnKc=;
 b=jQsYPYTGjGztN1KCONIwbSzI78YvVVjeUi0KQUEKA4vOzG2ZjRF5l3S+LVqBELNdby
 9SAsN0LJ5DzV3PXOPNnQ0AtM9EqYg/wmJKx3d4/Dg7bZkaBV7izeF0S8/DWIW8+2kd+S
 6nTUPlt9cAFHYYO8sFxG0elHTvI+EZWGcpUq1HX8rH19OzCtgmdgtR/5GKeX+YQYE0y+
 tnck+cstmWIq4FI3MwZNH/W+/5sA5Vsn90rkj6kEI2nQSsBfmrV2DBD6yMzN4OYj0lp4
 T1dKnYl1bGHKjDaXIzK3iup4xmzU9aPfHRgKnA5Adb89po2YLf/uoQk/AxYOaHxv7j/G
 hG/g==
X-Gm-Message-State: AOAM531Y0lwGP6RK45YLmdrqq1eULxi7TjN/4kVyyeV+VCc/Ti7qpIom
 osr5Ux7+RW2mhw869azZSfppgDzg9vEYUtJe
X-Google-Smtp-Source: ABdhPJzmxuaSXWI7XfG/E+TLAHkj5AZu4f7ORrcmrqNx258nm0FlTJZYTbFYr++Yr4QtStSKgW7fIQ==
X-Received: by 2002:a05:6808:198c:b0:2f9:f118:9775 with SMTP id
 bj12-20020a056808198c00b002f9f1189775mr1627650oib.79.1650032038769; 
 Fri, 15 Apr 2022 07:13:58 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4c2:8a9b:dcc3:45ee:2581:b4cb])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a4ae781000000b00320d5d238efsm1156189oov.3.2022.04.15.07.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 07:13:58 -0700 (PDT)
From: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrealmeid@riseup.net
Subject: [PATCH v2 1/2] drm/vkms: check plane_composer->map[0] before using it
Date: Fri, 15 Apr 2022 08:12:59 -0300
Message-Id: <20220415111300.61013-2-tales.aparecida@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415111300.61013-1-tales.aparecida@gmail.com>
References: <20220415111300.61013-1-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a copypasta error. The caller of compose_plane() already checks
primary_composer->map. In contrast, plane_composer->map is never
verified here before handling.

Fixes: 7938f4218168 ("dma-buf-map: Rename to iosys-map")
Reviewed-by: André Almeida <andrealmeid@riseup.net>
Signed-off-by: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
---
v2: detail the commit message with more information

 drivers/gpu/drm/vkms/vkms_composer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index c6a1036bf2ea..b47ac170108c 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -157,7 +157,7 @@ static void compose_plane(struct vkms_composer *primary_composer,
 	void *vaddr;
 	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
 
-	if (WARN_ON(iosys_map_is_null(&primary_composer->map[0])))
+	if (WARN_ON(iosys_map_is_null(&plane_composer->map[0])))
 		return;
 
 	vaddr = plane_composer->map[0].vaddr;
-- 
2.35.1

