Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292159930B4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 17:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F52510E3C2;
	Mon,  7 Oct 2024 15:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XHkcZdqq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D151010E3C2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 15:09:17 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-71e06ba441cso643797b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 08:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728313757; x=1728918557; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U/+GSwCeOWRm/l1+CfEkkyplSY7a0N5EITYY7LFjoig=;
 b=XHkcZdqq+HfRgOIMgzKXASI4e6uVh0+lVoXn1praOo/ZRMVjCOIyk7Or636+b4cpXB
 6RdwqZIn/s899ULeNIiswC8ysb8Pyj9OPBO9USvbcdMD6VfPXYHlIw3O/7pFGPniIUKy
 0MSGzmQLB2G0NpUnUMsOyJeeNgFsM2CnQipIda3gDpIC7mGmzuK4LQwGetrzyAfYsJik
 DdvlpCc9yD6xhckeTwCQ7bfXljtabpJOuerDZaeQ2vBs+1Ce1MSR9+CAcD8zqzf2tg0V
 VIRoEJF0OM0xSpeUzgbgHhzjbNTcjLeul75PWotFu+2lTJDTZ9uUXZN7p7qvVgbKWCOl
 +Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728313757; x=1728918557;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U/+GSwCeOWRm/l1+CfEkkyplSY7a0N5EITYY7LFjoig=;
 b=Az92GSNjC0ewKTl4FOOiC0tQhnWLTwv3YiXf3J9+db0zW0F3g89Uy3bxZSIkpGjjBT
 AtGr8F1NqKcO5bgt9dwSVwTWGHqcsOAVm/OPa6ayUGFcYQCweiRr8R678vglNWQ/l7Y3
 wSsylrM72fc0gP0do3F/gEkCOwWKp7DYocIB7XrazXpjDZ4kHXRo2rtnRX5QNRSeT9hc
 RQwHxeaKHpN+pcAZh+NOr+p6iavoyzC/gl1L7rA+XgJXms9qbXfu/lgmCkTVVcuEkQY5
 OIrrbBCuA8RlOmXEz0WJ6KIfa0toyPbaWSnl8C7tKRcLlYddNeIQyRTItMbyFtueu41H
 KYTw==
X-Gm-Message-State: AOJu0YyKp6STS3+uJ50LbUDDe3KYr5GRbW9JoY9L1yn6yMZGAcXAWx44
 Bh3ilQ8xGGQfHxxFR1RjjqGDy++OrWM0utieKT9XOBCb/EBFJqOw
X-Google-Smtp-Source: AGHT+IFyaIcmre3vkQABIM8yyNZlEuDS9Fnfn9Gk+ufQWVciOVuxyxkAe1vCDGKPdT/UvjtIoXMFog==
X-Received: by 2002:a05:6a20:6f07:b0:1d3:2976:144 with SMTP id
 adf61e73a8af0-1d6dfafc08cmr16632114637.44.1728313757227; 
 Mon, 07 Oct 2024 08:09:17 -0700 (PDT)
Received: from advait-kdeneon.. ([2405:201:1e:f1d5:ffb9:ea:f539:1909])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7e9f6c3411asm5011809a12.68.2024.10.07.08.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 08:09:16 -0700 (PDT)
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 anupnewsmail@gmail.com, Advait Dhamorikar <advaitdhamorikar@gmail.com>,
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Subject: [PATCH v2] drm/atmel_hlcdc: Fix uninitialized variable
Date: Mon,  7 Oct 2024 20:39:04 +0530
Message-Id: <20241007150904.9840-1-advaitdhamorikar@gmail.com>
X-Mailer: git-send-email 2.34.1
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

atmel_hlcdc_plane_update_buffers: may use an uninitialized
sr variable when the if condition remains unsatisfied.
The variable may contain an arbitrary value left from earlier computations.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202409240320.MZPgi3Up-lkp@intel.com/
Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
---
v1->v2: add reported by and closes labels

 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 4a7ba0918eca..4150c4d0b4f2 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -559,7 +559,7 @@ static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
 	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
 	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
 	struct drm_framebuffer *fb = state->base.fb;
-	u32 sr;
+	u32 sr = 0;
 	int i;
 
 	if (!dc->desc->is_xlcdc)
-- 
2.34.1

