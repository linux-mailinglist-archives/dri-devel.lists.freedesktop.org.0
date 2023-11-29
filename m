Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9AD7FD127
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 09:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B9A10E0AA;
	Wed, 29 Nov 2023 08:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FA910E0AA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 08:41:28 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6cdd584591eso216136b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 00:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1701247288; x=1701852088; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oDNpb1kX9Q5D1FTRF5Xg6UxOao23a7KP3eBk4wJ9fv4=;
 b=pJi2euA53966vjcZcpeu2jsimTENMBYLUeltqnNDIS2YSyFIhjlSC35kWA1mGuRVaS
 ICF1YX62S9ttE1JV+y2e7TjEQOnthADI+wgtEKGZnzgi1Gp49OSuTjr4jOTkHaSDwO+A
 +xtriDCIlbb2/X1BkOcqbqMYoFf4+DoRdjCJ1unAyQHmumk7NT4rCj4Oyj+KoJGEDVUA
 ejXn3KsNFfRxlHBa04nk0K6cEJvhXWFrNlbVdDCzAHHdvJf3n6c6TEQhzN+ET2EWeOZ4
 VpeJrIyanRjtyIt5bsXlhFsbsFmdPbDkZ7fpSMwWmk5KAsOxI+Ws1Jbe1A7SQxdbkGd8
 jM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701247288; x=1701852088;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDNpb1kX9Q5D1FTRF5Xg6UxOao23a7KP3eBk4wJ9fv4=;
 b=J1ZFnWfpk/DrmcQFd/9/a5fyEoJvaffE9YWab0TV/SVNxKq8iez5X7vqNxXdDpC2RT
 R9JJ/DQTNN5e0ccJEjipEm/4NjrAvop0d5GhVtfms+8M3IHEsvdG8yxExdYgHKgtVD+b
 8F/jvUXQtlnEcFsVb5tGyJQjbQrap9lE82kmGudXWt0AeHPrCNcUVj6APa7DNPKsQFmk
 KEn3uhZ5puNFbun3ubv1BuY4VLCfLEAUd0RlY4xZoUESNCRQ1rfSCKVZ1cPETf+kpTtr
 WEN7tlo6W5W/6wTx9iLbpysVfoBoMIPJhFER2YcW4dPCCtOtD5fxvVb/G+JtcEbMZ5Ln
 TfSA==
X-Gm-Message-State: AOJu0Yzwi1mGijugtc9Rarxb/FLrDJr1lQ0t4F9DFvYooh95z72emHoU
 Z+nONjJZqu+YZMFctVNOE0o7hhvQp/vnAAODjuo=
X-Google-Smtp-Source: AGHT+IFnmBuy8UZMdr06KgTPqDrbJ/BCRK6FtSwx8+sJZqtK1bI1u1VFDMCVbD+pyD+NOKGy/rw2AA==
X-Received: by 2002:a05:6a21:a59b:b0:18c:2ce6:ae9b with SMTP id
 gd27-20020a056a21a59b00b0018c2ce6ae9bmr15459485pzc.48.1701247287924; 
 Wed, 29 Nov 2023 00:41:27 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a170903120e00b001c613b4aa33sm11584753plh.287.2023.11.29.00.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 00:41:27 -0800 (PST)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND] drm/panel: starry-2081101qfh032011-53g: Fine tune
 the panel power sequence
Date: Wed, 29 Nov 2023 16:41:15 +0800
Message-Id: <20231129084115.7918-1-xiazhengqiao@huaqin.corp-partner.google.com>
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 neil.armstrong@linaro.org, mripard@kernel.org, dianders@google.com,
 tzimmermann@suse.de, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the "starry, 2081101qfh032011-53g" panel, it is stipulated in the
panel spec that MIPI needs to keep the LP11 state before the
lcm_reset pin is pulled high.

Fixes: 6069b66cd962 ("drm/panel: support for STARRY 2081101QFH032011-53G MIPI-DSI panel")
Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 4f370bc6dca8..4ed8c2e28d37 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1765,6 +1765,7 @@ static const struct panel_desc starry_qfh032011_53g_desc = {
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 		      MIPI_DSI_MODE_LPM,
 	.init_cmds = starry_qfh032011_53g_init_cmd,
+	.lp11_before_reset = true,
 };
 
 static const struct drm_display_mode starry_himax83102_j02_default_mode = {
-- 
2.17.1

