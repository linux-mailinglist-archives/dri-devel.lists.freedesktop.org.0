Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A79B91D2F2
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 19:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02F710E1C4;
	Sun, 30 Jun 2024 17:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MTP2WmP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2D110E1C4;
 Sun, 30 Jun 2024 17:00:39 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-79c03dbddb8so240119385a.1; 
 Sun, 30 Jun 2024 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719766838; x=1720371638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3+fUm0J60rhD0JfSfR+ec8NGlbRdea8idCqnnknLyK4=;
 b=MTP2WmP2eyeNLlE5IbSaJhyE3I8ToUnLJshFSkMyrvfQGuo3vmdJGtjnv07asEP3B5
 +Xc4VrGb7ip4HxCBeyW1ysDhrxg81nC2/F9tLk/BQRADV74MsGKigZNp1dsWaMaTwcvi
 ABt2IWbQvv36q+z/U/rs51zCtMI+dFAHj4r0+Bl4bQNRCcwwLu1ui5G8WD8iOE+Dbidc
 ycVVnQ3e+n2S6hVFxCTZhBRA+Uh2l6FmPWfrcw6jfclMRgQPuPkTfrMXE6EMWpLbStRP
 BI8FjVUysqc+Y/PQRQtXxwZcBgm9hhbpU9qGHkNNXnn2g79xMsojSjK+/IKbaaT0nnkE
 C+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719766838; x=1720371638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3+fUm0J60rhD0JfSfR+ec8NGlbRdea8idCqnnknLyK4=;
 b=YC6FrI7RZUjxGWpI8nC5h6/EQ7J2dDHQs7YBf2lLjvHc9ECmRPwAdwubDXr3+OzsQu
 wTLjesTNfP8X6ksf/JPS/47OUpZlSjhlmWsV3X+DoNE5EMeCIiaNvaN7FKyjutALh559
 ovEZiCLw7WOqVkhYR1IYhSVa96Qwb35RfRaG1yPpJSEuLGx7DV9U9b2UzpzCc0xXA4dK
 ufe3bNhdqa9xeUfTMJwd0KN4dW7lAqw27Nc8OFPMBggQeofn0sVBtGdkO/wOEvupOSQf
 SIgKMCsd6rQpA40eB4Lv7oTTL1rXhEOIss25uxA0Rnj792ptR0eAee5iJwuDP+cQF9Hv
 Yv3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR1QwXG5BO2rhV3mbnR4f6l+xCwmLPsJBPamB6xag9raU+5hZpuH/jTguzOpw66TNGWX2xow5HI7nJHwNSNBBvfcl2KlYblT32FMBUGvgPINz85En0ysNG9CygYSQevpBgmPAGR8mqr6IsAXbc9g==
X-Gm-Message-State: AOJu0YzfzYJ4ML1bP8uY06r+xJZ4j505fYeavkQMICGOIm2jgboEWo+/
 h6P0tY11KWEKGVHQS7T/514YS+dS/gjPl+9yebbZpqiVK+pL1C4ZBKd7NUb5
X-Google-Smtp-Source: AGHT+IGTdfbTavrCYOtrr5ya6VIyVg2UfyDv+wbK3tnZFumCzPT8mI4PkDxBQsgVXsZo2s4ZzqGaqg==
X-Received: by 2002:a05:620a:21db:b0:79d:747c:75b6 with SMTP id
 af79cd13be357-79d7b9f2333mr428624885a.40.1719766838374; 
 Sun, 30 Jun 2024 10:00:38 -0700 (PDT)
Received: from localhost.localdomain ([142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d69295f5esm263431785a.56.2024.06.30.10.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jun 2024 10:00:38 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] drm/radeon: remove load callback from kms_driver
Date: Sun, 30 Jun 2024 12:59:18 -0400
Message-ID: <20240630165949.117634-3-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240630165949.117634-1-wuhoipok@gmail.com>
References: <20240630165949.117634-1-wuhoipok@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ".load" callback in "struct drm_driver" is deprecated. In order to remove
the callback, we have to manually call "radeon_driver_load_kms" instead.

Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 739bb1da9dcc..88d3de2a79f8 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -310,6 +310,10 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, ddev);
 
+	ret = radeon_driver_load_kms(ddev, flags);
+	if (ret)
+		goto err_agp;
+
 	ret = drm_dev_register(ddev, ent->driver_data);
 	if (ret)
 		goto err_agp;
@@ -569,7 +573,6 @@ static const struct drm_ioctl_desc radeon_ioctls_kms[] = {
 static const struct drm_driver kms_driver = {
 	.driver_features =
 	    DRIVER_GEM | DRIVER_RENDER | DRIVER_MODESET,
-	.load = radeon_driver_load_kms,
 	.open = radeon_driver_open_kms,
 	.postclose = radeon_driver_postclose_kms,
 	.unload = radeon_driver_unload_kms,
-- 
2.45.2

