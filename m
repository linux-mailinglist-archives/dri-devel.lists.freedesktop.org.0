Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FEED1B1EE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 20:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC6D10E540;
	Tue, 13 Jan 2026 19:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y1ldhYgj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8AD10E53E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 19:59:49 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-7c6da42fbd4so4433083a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 11:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768334388; x=1768939188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dJ3Ahf49hlWnxKtsDsKhHCo3RwD4rUKnAOeXD4F8idM=;
 b=Y1ldhYgjpg6xVtjeUfp9C2GpE7lOMl8yuZPyIFFvpoLWUXdk/5QQFvrXI4mIE/Vd5b
 6JpVbl4/9OCtmrzORFCoDD5fSXcMOhGMPLOI3gPeStIOAOZ7cl+7wvVPPAJY3Uknusqh
 16t1+lcuZq5qr4MqyukspvFW72OoYF3xASDahczRdEMC+2vReoYjlkKFr/NL0pIbXJB3
 Tw+z7jk5qe6aZVxKUxsxkT2mlych+bOrNBPyhqE2i9cVsRTJ4T2CN990e8GVHdypByAY
 1ZEzSpAEsRrOIJcWowyjp+8By+M7eowTMuvuuCqH9smOX9ESZK8QTezJRkh+cPjUpKSo
 jILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768334388; x=1768939188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dJ3Ahf49hlWnxKtsDsKhHCo3RwD4rUKnAOeXD4F8idM=;
 b=Ww1VaiM09YgffPUexTsuKFgMsUBJCqEc4VhgWX7Xi3j6kMbJIZ9QWMSci5uuZvPofW
 gX9ze9PnzA6kSx4iNJlwA96S3vwy2cGwY/7H3WPn6vD6+blHlyYbLkUbSYGiQ4nVKzPZ
 uk9WQA2aIGKnzrbDwPwBEsBbssErumhL2G6ajSFr+4vg6mtqyfiOsCCXo+Jh9MbtZjiK
 yKDn7eukIyJtqnTQDkFQogsE19bqS0P+Slhq/c+YiWW+bIhAox1XxLkk3NOLK8Nqxal1
 MmCuBfFltiVUFjFhQeXbNQFG1ZlZ6JXfyUFFEyjGBVNMnZJN5MEDfEIvhTUc1m3PUb52
 JXug==
X-Gm-Message-State: AOJu0Yyr1A1mc0/fD2VBEMhStjUoDDu3WRcz6BAIpkapgiGRzT232RTf
 m6GguFUhNneRhHEZZV75PCEsV0D8DbnX6TLFaPNBnTpilXX19aAI4q48
X-Gm-Gg: AY/fxX7LHHTGuM85p2B41BKhe+PcwzqoHN/eiA2LH/6+tZfMQgbbeCE5ZXBeOQvjMpm
 gaeBw53a/wbH+JitpBi7oADt1sovhmGxwWZZmwL40FYo2XwNSB8WNWQ8xiqMzTC8TSNI7DjTubT
 yOTpYNL+sIkQp2OEQiKIs0q5nx8ODzebeJpbcUau9+Y4/1Er2f6oICoz3rlotwyWOZwLMyqKODl
 dt/qBw+ECFZWpfqXIXM8nQWgIXIh8yxhFfWmkuZBjKTeX9FWB53/E5R611QJ8n8DB+rUWux5SML
 s+8RDUOYGsv5EKTvBXcW89WX7JwgaLvp1G7NISvUNBb0FcF0klZhyHMkiZ8CYR3WyvjdnjQOc46
 J1U7Eq8qDLSskvAlSEBqGLpgdp4qGpELh8cNXM8GTOznH44ne8oiLdT7bAQWJvvYU7u7d9NCzlF
 ojBwOFjTFG
X-Received: by 2002:a05:6830:6408:b0:7bc:31fe:57a9 with SMTP id
 46e09a7af769-7cfc8b3b8f6mr195237a34.31.1768334388271; 
 Tue, 13 Jan 2026 11:59:48 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ce47801d4dsm16221119a34.5.2026.01.13.11.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 11:59:47 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jesszhan0024@gmail.com, neil.armstrong@linaro.org, jagan@edgeble.ai,
 heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 aweinzerl13@yahoo.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/6] drm: panel: jd9365da: Use gpiod_set_value_cansleep()
Date: Tue, 13 Jan 2026 13:57:16 -0600
Message-ID: <20260113195721.151205-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113195721.151205-1-macroalpha82@gmail.com>
References: <20260113195721.151205-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Change instances of gpiod_set_value() to gpiod_set_value_cansleep().
Uses of gpiod_set_value() generates warnings when used in instances
where desc->gdev->can_sleep is true.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index aa05316dc57b..063ed9646d53 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -109,13 +109,13 @@ static int jadard_prepare(struct drm_panel *panel)
 	if (jadard->desc->lp11_to_reset_delay_ms)
 		msleep(jadard->desc->lp11_to_reset_delay_ms);
 
-	gpiod_set_value(jadard->reset, 0);
+	gpiod_set_value_cansleep(jadard->reset, 0);
 	msleep(5);
 
-	gpiod_set_value(jadard->reset, 1);
+	gpiod_set_value_cansleep(jadard->reset, 1);
 	msleep(10);
 
-	gpiod_set_value(jadard->reset, 0);
+	gpiod_set_value_cansleep(jadard->reset, 0);
 	msleep(130);
 
 	ret = jadard->desc->init(jadard);
@@ -129,11 +129,11 @@ static int jadard_unprepare(struct drm_panel *panel)
 {
 	struct jadard *jadard = panel_to_jadard(panel);
 
-	gpiod_set_value(jadard->reset, 0);
+	gpiod_set_value_cansleep(jadard->reset, 0);
 	msleep(120);
 
 	if (jadard->desc->reset_before_power_off_vcioo) {
-		gpiod_set_value(jadard->reset, 1);
+		gpiod_set_value_cansleep(jadard->reset, 1);
 
 		usleep_range(1000, 2000);
 	}
-- 
2.43.0

