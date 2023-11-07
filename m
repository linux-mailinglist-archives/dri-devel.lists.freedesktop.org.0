Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD597E32B7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 02:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853DD10E06A;
	Tue,  7 Nov 2023 01:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E9210E06A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 01:53:26 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32fd7fc9f19so770330f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 17:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1699322005; x=1699926805; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oDNpb1kX9Q5D1FTRF5Xg6UxOao23a7KP3eBk4wJ9fv4=;
 b=Uj1SyrnwWBqU5hQZMAwpmlhZ53XYX4tmLHzvESBIhp5iBXNFsK66T+OwErnoqUnK3V
 S7iFjm/jkIHIbbNL/rAhpD49O3AhGLCvncfAnYc+CHQ7nzK0S+90/zHv+JD6ZyatHj3q
 cu98Ip4wyaYboD6mvJ82Jsq8sAl3EHU7ZKQQvj5n9a088pDbDydnqOg+Hp/J0ZyghIUO
 gwAEHXACbRX7BTmd2Qf08ghdIWD7/BaFVR4OVd1KafEQtMFO/6qCMIMPyfHNcE9tnYz2
 10GkcKIRduJagkV9vlBNz+eRDRjJWHx82t8j3V8qKmRSTdnLwM654hSQusPjczHz6PKO
 1ofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699322005; x=1699926805;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDNpb1kX9Q5D1FTRF5Xg6UxOao23a7KP3eBk4wJ9fv4=;
 b=SARJWv30rhCfwKUPvMCTDywZkoBsvkDI0VHj/bl5YkA7N7lsyv+Yz62pjsMi1s3Ndp
 TyltZFsVv7yuW6fi5qxV37yfsSHuLWe8t2r+nsSfomDgzosd1ipdwrtTTI6Af4WSoJnF
 HyQu3YIjCDWagWLgFR7OhWMmvtpIpZhfl5qe9yAu5lBeJ28+Qf7ETED9VS1erasx3ngz
 kl1CaG/22k+ToxykW//hdGhKLLW7CU38YF9fLVH/wADXiOJA1nW9ppC/CJ6x4A2oYcfP
 aod5C3134OdeTse2sYlvEpg3aNhQFQyZ7bW5ws9BY6cx2Yc2sIcSNZqiH7oViaYMw3be
 8zcQ==
X-Gm-Message-State: AOJu0YwSquMMbieDc8pnzf56FX3iBzAa3XSi1Ko1PKUziiEIOJmeR1TK
 AFD/sPZUx9PQW83iZPBB2pB37tytGIDACnvLpAemEQ==
X-Google-Smtp-Source: AGHT+IEM+oaPsXFESuwpC47oh5KHNo2DmwnXhFlm/3Jzp+lMFGg9MQQnBMCTZm9rBIk+q5DkFx3lPg==
X-Received: by 2002:a5d:5381:0:b0:32d:aff1:58e6 with SMTP id
 d1-20020a5d5381000000b0032daff158e6mr21539634wrv.54.1699322004492; 
 Mon, 06 Nov 2023 17:53:24 -0800 (PST)
Received: from ubuntu.huaqin.com ([63.221.192.42])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a0560001b0900b0032db430fb9bsm940046wrz.68.2023.11.06.17.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 17:53:23 -0800 (PST)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com
Subject: [PATCH v2] drm/panel: starry-2081101qfh032011-53g: Fine tune the
 panel power sequence
Date: Tue,  7 Nov 2023 09:53:14 +0800
Message-Id: <20231107015314.714-1-xiazhengqiao@huaqin.corp-partner.google.com>
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
 xuxinxiong@huaqin.corp-partner.google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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

