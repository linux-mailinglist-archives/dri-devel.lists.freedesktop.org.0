Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6957C56E3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 16:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86AC10E485;
	Wed, 11 Oct 2023 14:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B57410E485
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 14:32:36 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32483535e51so6653817f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 07:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697034754; x=1697639554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sTtJMo0juSmapt/R8b9SSAuK0+/FIDelqIgKW8tSTFE=;
 b=dluo9E/HfTp/gvW1p78BdT1Ec7FaN7+0QxtC60T1g3FNtbjmImXIwONncQxMlZvXF3
 fvspR9flUNK/sL6XHWJ4K6wTcbRkw+ubYkKXurwlPwx4oPHGDdbmhgJXfmR5AUXA9ija
 7UfjOJlTYo/G6gPq8JBUZNFG08Ms6iUylxnQhYztGt8YtiopIaH9Sc1NPeUzR9m3F5Rl
 DC7tACAbNR4i3cu1dG0mK04hxeQBAOUV9A66Dd/WsUXrqF1Gg9+RrQ2A8CvMUQGhm0PT
 +kuzIyGD4/YTqkQfK2F4/GF41xUvsUrmegO/ysCVgCBrskXxd/+XdO33eOfTiY/Czvnv
 B7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697034754; x=1697639554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sTtJMo0juSmapt/R8b9SSAuK0+/FIDelqIgKW8tSTFE=;
 b=PTOWHkF6m8AjKyz9DftK/CzFEnNG6uqlSTOU24c5co55MHQDBrhDnbpPqE7GTbqQ/t
 GWUw54S6LoSskCJIorM6EJ1wgMUr50pJDkaBMYFRjtHPjp7Zyk4wxASglEIdepoBD/H0
 NjxNQCDRZTdjjdXvG/ifKnGIMHNU9lA6C5SY4zZv36/bU6Iolu/Y3WoOpLTKjrk5FKPG
 NWPGJOfAKk6ecNTx8HbFnpvhkk7a1/3Losowd5YEK5cpqBs5bw0yPpGQr1ZhgZisreBa
 gOwIpM8ivX7pSAXlKP2jK2AnWbVwo1BxzEJXuav7yA42FKfJfh3V+hbIDlooXC2IKZcU
 ohtA==
X-Gm-Message-State: AOJu0YzFknCKz24dErriFezNtqsKjDWYLjmTfA57hEcrkalKIHzSJmVW
 8h7rvxqQgf/AjNy7MyX1HHOqYMEW9tc=
X-Google-Smtp-Source: AGHT+IHROD9WzgYNQrtPYlnn6WTEbZRyHoqKUPApqIQ74TTatxptjd6ef73+0cP85IVM3MmB7LYzLg==
X-Received: by 2002:adf:f084:0:b0:314:a3f:9c08 with SMTP id
 n4-20020adff084000000b003140a3f9c08mr17751151wro.39.1697034753798; 
 Wed, 11 Oct 2023 07:32:33 -0700 (PDT)
Received: from localhost
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 e28-20020adfa45c000000b0032d892e70b4sm1367341wra.37.2023.10.11.07.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 07:32:33 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH] drm/simpledrm: Fix power domain device link validity check
Date: Wed, 11 Oct 2023 16:32:30 +0200
Message-ID: <20231011143230.1107731-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

We need to check if a link is non-NULL before trying to delete it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 9c597461d1e2..8bdaf66044fc 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -506,7 +506,7 @@ static void simpledrm_device_detach_genpd(void *res)
 		return;
 
 	for (i = sdev->pwr_dom_count - 1; i >= 0; i--) {
-		if (!sdev->pwr_dom_links[i])
+		if (sdev->pwr_dom_links[i])
 			device_link_del(sdev->pwr_dom_links[i]);
 		if (!IS_ERR_OR_NULL(sdev->pwr_dom_devs[i]))
 			dev_pm_domain_detach(sdev->pwr_dom_devs[i], true);
-- 
2.42.0

