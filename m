Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8953E8F85
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 13:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27ED689836;
	Wed, 11 Aug 2021 11:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA02289836;
 Wed, 11 Aug 2021 11:35:43 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id e15so2266120plh.8;
 Wed, 11 Aug 2021 04:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ocNu8t+0vPe8xDuDrmXUgxK/R5Hfv7t0v2kfkL1QOgA=;
 b=B+dx6gtSem9LSUSvN8E6giOkQHucQX2rfdWvdRiGZVmSPgioJxHNzz96Wv/7YAzK/m
 JyrlpDgL5bOF6eMtXkydeAbLGqIVrhMrKIOcRV1PJmBbaTyLJ7prchjvpW3b/9EJ4Gcf
 ateFz6QnoBeY6tSGD7pStGh857XyHpTJPAPNYmXPvvaf8f6DMcrxqyD04zVorltoKP3z
 E9/BFvyIJiHW/R/cj3ZR88UE93OebnOpVaMGRh8SMPHgat07me51s6HqtWI7CNWbMEe0
 xEtnFJU2f52n+5cz37RdDZfaSwfAZp2z2D4FqRC4OCW3n6bDmRvJZFMhXfWD/Tci4rTh
 0rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ocNu8t+0vPe8xDuDrmXUgxK/R5Hfv7t0v2kfkL1QOgA=;
 b=uSzWJV/eezSxder5xeW2IWtL58T22pc0rawYu8az8YGJuTSwoW6HQn34lrDTFU8i1k
 t6SR+BeuuuuM9TUbR8R6YHU5gh+1OibyrUh/pcYs4Ts/ModE9w9j5aj2EHFwwGndYWw8
 WzilqUHWRbgk8KT40nBAJpZFRKzS7TJkSehoC2pmE7uCMECrsa5gaPgGD8a3ThOyzjTV
 PeQEGWSyK1bLwanMdUfyLAkqRaAxTOjtbhx3nPIcVgwcNjKrv+h5CC3z6vdpOProyuoW
 s8OXGMYDrl/htM8TpjBsQ2jZtRR/dpOYtbZbO3abxufR4VDJ0OFUMwnlq7AodhbXAPV4
 v8ug==
X-Gm-Message-State: AOAM531csZKWm9wz7LhBB8V1pGz2aZJd8PVICXY1ZgkpanoW5CHUSj7W
 iAB3CwEToen9qMbuuP8ri30=
X-Google-Smtp-Source: ABdhPJz2SBVANXMZ07VbSSh4pznTgoL/y9wtPx7R4CwSyd5hF9Ctj75Fuud9mXAdwAvfcZj7S9//6A==
X-Received: by 2002:a17:902:8543:b029:12d:461f:a6a8 with SMTP id
 d3-20020a1709028543b029012d461fa6a8mr3905116plo.1.1628681743298; 
 Wed, 11 Aug 2021 04:35:43 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.103])
 by smtp.gmail.com with ESMTPSA id c12sm26423669pfl.56.2021.08.11.04.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 04:35:42 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, luben.tuikov@amd.com,
 tzimmermann@suse.de, sam@ravnborg.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 Tuo Li <islituo@gmail.com>, TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH] gpu: drm: amd: amdgpu: amdgpu_i2c: fix possible
 uninitialized-variable access in amdgpu_i2c_router_select_ddc_port()
Date: Wed, 11 Aug 2021 04:34:58 -0700
Message-Id: <20210811113458.6940-1-islituo@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The variable val is declared without initialization, and its address is 
passed to amdgpu_i2c_get_byte(). In this function, the value of val is 
accessed in:
  DRM_DEBUG("i2c 0x%02x 0x%02x read failed\n",
       addr, *val);

Also, when amdgpu_i2c_get_byte() returns, val may remain uninitialized, 
but it is accessed in:
  val &= ~amdgpu_connector->router.ddc_mux_control_pin;

To fix this possible uninitialized-variable access, initialize val to 0 in
amdgpu_i2c_router_select_ddc_port().

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
index bca4dddd5a15..82608df43396 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
@@ -339,7 +339,7 @@ static void amdgpu_i2c_put_byte(struct amdgpu_i2c_chan *i2c_bus,
 void
 amdgpu_i2c_router_select_ddc_port(const struct amdgpu_connector *amdgpu_connector)
 {
-	u8 val;
+	u8 val = 0;
 
 	if (!amdgpu_connector->router.ddc_valid)
 		return;
-- 
2.25.1

