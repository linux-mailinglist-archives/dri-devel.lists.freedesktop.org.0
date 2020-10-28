Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C6929CF98
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 11:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED936EC5E;
	Wed, 28 Oct 2020 10:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ADA6EC5E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 10:57:38 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id g19so1137925pji.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 03:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W33YKVE+vIQUjqJmcEzgED3JxXxgJJnTqejIz5dWMio=;
 b=Hy4ATO4/8bpMwbG9MepKQdZG8/CTf1/4URUhZZcmbcdWvW8+gkJ6cAXoyIwHrFIPTG
 ph2he7bXY8k2pSLmYEZgpOpWlep9MeKw4VWXCdPayFqCN/QzcXzph26cbhGIMNKVkPoX
 XjTfYkGXonGwT3mBLeJG8PqiJNAErVxFMoJ9vz/9LsRmSAVvCxLTSrC/iR0NgA9MZ8QY
 4p37kPfhvWgpLp2517tIc3KmbGgehxrWRETTxFwC31QI9ZMO4iskheUBicyPAK7kvHS6
 tpKR71qatexkU73Utm71Opjb8YHXxeBdlTjUDuKoP/T0wFnOL0/KjJzJfPtNDR5C7HVg
 bWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W33YKVE+vIQUjqJmcEzgED3JxXxgJJnTqejIz5dWMio=;
 b=rO8LXuEUDappGXDGqGhoZfed4X80gJ1WlyBfCTSLbDRojd4yNSsSUPqVD4d0aKkcvf
 lFQrN1fvVc7LqoouKjx/ZiC6ZWt3htj/wT38Vk8AcKzqurbXst9V3afOElxdzXKPZy27
 2jNThYVsJFEZWEpR6ShHcgpa1Yy09KX8w3zU+UKmy5K9RLwnmCQ/FWH1Dye8O+Ahy3qF
 bfI6mAi0vp1+M/taWpDUE0Ngg42jTcyPqxUTzG8rt0FxxOATMHkfesrIV6XpnDl2Rlep
 cAKDvDhTNcuQ99Wz697AAq/q5P6Ngsmr3IdKCD7JT6erEq5TTkRSzA9h5f9CU3/jR8Rh
 Ot0g==
X-Gm-Message-State: AOAM5325iYbBBl43cSvqJ7R1hPv+v6wsEMx5iJ2PjNgO8kpRMqWh2YIn
 qUwjs9+Q/9jHBQZ+EL5yKw==
X-Google-Smtp-Source: ABdhPJx7TI8kNqRv/CrbnxiDniRSurjnwwLGWS8CtOJHMecJHTWQceZLiEtKvb0qCu+u9Y22egpfOQ==
X-Received: by 2002:a17:90b:20a:: with SMTP id
 fy10mr6294642pjb.20.1603882658040; 
 Wed, 28 Oct 2020 03:57:38 -0700 (PDT)
Received: from localhost.localdomain (n11212042025.netvigator.com.
 [112.120.42.25])
 by smtp.gmail.com with ESMTPSA id i24sm5377303pfd.15.2020.10.28.03.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 03:57:37 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v2 2/5] Fonts: Make font size unsigned in font_desc
Date: Wed, 28 Oct 2020 06:56:47 -0400
Message-Id: <20201028105647.1210161-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
References: <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`width` and `height` are defined as unsigned in our UAPI font descriptor
`struct console_font`. Make them unsigned in our kernel font descriptor
`struct font_desc`, too.

Also, change the corresponding printk() format identifiers from `%d` to
`%u`, in sti_select_fbfont().

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v2:
  - Mention `struct console_font` in the commit message. (Suggested by
    Daniel Vetter <daniel@ffwll.ch>)

 drivers/video/console/sticore.c | 2 +-
 include/linux/font.h            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/console/sticore.c b/drivers/video/console/sticore.c
index 6a26a364f9bd..d1bb5915082b 100644
--- a/drivers/video/console/sticore.c
+++ b/drivers/video/console/sticore.c
@@ -502,7 +502,7 @@ sti_select_fbfont(struct sti_cooked_rom *cooked_rom, const char *fbfont_name)
 	if (!fbfont)
 		return NULL;
 
-	pr_info("STI selected %dx%d framebuffer font %s for sticon\n",
+	pr_info("STI selected %ux%u framebuffer font %s for sticon\n",
 			fbfont->width, fbfont->height, fbfont->name);
 			
 	bpc = ((fbfont->width+7)/8) * fbfont->height; 
diff --git a/include/linux/font.h b/include/linux/font.h
index b5b312c19e46..4f50d736ea72 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -16,7 +16,7 @@
 struct font_desc {
     int idx;
     const char *name;
-    int width, height;
+    unsigned int width, height;
     const void *data;
     int pref;
 };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
