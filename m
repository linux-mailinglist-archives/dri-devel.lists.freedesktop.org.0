Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EED18B8D5D
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 17:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2949111232F;
	Wed,  1 May 2024 15:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ig0wENJR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4986611232F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 15:43:34 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6eff2be3b33so6353823b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 08:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714578213; x=1715183013;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HNTOcUEwWeSo/t1Vf3i4ZlvXOdvImzkf0C+r8rb9unM=;
 b=Ig0wENJRMCfmPpPAbyCwhEo48B3ysPO5BScHVd1wD6Zd8FDpjpZXEQplPcWV7prf2t
 gvcfyF1ZmhSqtSh+U9QW731A3pGv9m2F4+oijYSCJDOmJiM1Cwq5tduqB8vkatyrJl/I
 4QkZcAplrbFzZ4bQ6h7pmSE0w9MIG2PUia/aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714578213; x=1715183013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HNTOcUEwWeSo/t1Vf3i4ZlvXOdvImzkf0C+r8rb9unM=;
 b=W6FDsDR2MKIA8yu2AYEAHMoo9+V0pLLrJ1Lcw8NzCdNSiQ4l4p7101hFQyug0dbeon
 /8sHSoNPZnG+Ff3XmWwLz6auSZd3OAtSnbPCNFsLgi5stRyKD5Y5rr6SXhfZGNhkR8zq
 tn5PPsgSXGnKHwQwheUibGsfDsBJH6fyRXS5+qY2EPEtGWZLicFa+Y5aTpp2aLZ4T5Ng
 h3+YNUUvevu1SKdJAFKIHsdYLxUKfWcKa1zbyiKOQuclf9ZfiE/nEJq4VhF7OVKcMQsA
 KuvCEhOdssHFCFXe0ZXDH7e+l5ldi1bSvOuFbdeCT8nolzRchGLO6ddw4q8kGX4jDMCo
 xgsQ==
X-Gm-Message-State: AOJu0YyHqjbJwWXKJq/q7bhaUAzLCxR4ptJCtHcDAVwnWChm6MsS4E72
 NF9jm/SXGXc4WUveLEue4D+lInBLlpkTyX4AgQ8LDL/TLp0LUp1ajxexCB9JUy0aHzj+4/PpUP0
 =
X-Google-Smtp-Source: AGHT+IEMWtYqzHW0IpxQIoacwb+/9u8nBpNOONz4dbRi3k16mh+dAjyFbRCl/ETBhxytGh8fI8hxfw==
X-Received: by 2002:a05:6a20:4caa:b0:1a3:c3a9:53b7 with SMTP id
 fq42-20020a056a204caa00b001a3c3a953b7mr2648875pzb.55.1714578212735; 
 Wed, 01 May 2024 08:43:32 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:e886:8de:19a2:55b0])
 by smtp.gmail.com with ESMTPSA id
 fb12-20020a056a002d8c00b006f3ec69bc09sm7717924pfb.75.2024.05.01.08.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 08:43:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, Brian Norris <briannorris@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Joel Selvaraj <jo@jsfamily.in>, lvzhaoxiong@huaqin.corp-partner.google.com,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/9] drm/panel: novatek-nt36672e: Switch to
 mipi_dsi_dcs_write_seq_multi()
Date: Wed,  1 May 2024 08:41:09 -0700
Message-ID: <20240501084109.v3.6.I3c08a7d02c467d2bc88da14e513ea4c8649fce45@changeid>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
In-Reply-To: <20240501154251.3302887-1-dianders@chromium.org>
References: <20240501154251.3302887-1-dianders@chromium.org>
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

This is a mechanical conversion of the novatek-nt36672e driver to use
the new mipi_dsi_dcs_write_seq_multi(). The new function is easier for
clients to understand and using it also causes smaller code to be
generated. Specifically:

$ scripts/bloat-o-meter \
  ...after/panel-novatek-nt36672e.ko \
  ...ctx/panel-novatek-nt36672e.ko
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-988 (-988)
Function                                     old     new   delta
nt36672e_1080x2408_60hz_init                6236    5248    -988
Total: Before=10651, After=9663, chg -9.28%

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This change is only compile tested. I don't use this panel myself but
arbitrarily picked it as an example to look at when working on the
MIPI DSI macros.

Changes in v3:
- Fix spacing of init function.

Changes in v2:
- New

 .../gpu/drm/panel/panel-novatek-nt36672e.c    | 576 +++++++++---------
 1 file changed, 289 insertions(+), 287 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
index 20b7bfe4aa12..9ce8df455232 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
@@ -51,293 +51,295 @@ static inline struct nt36672e_panel *to_nt36672e_panel(struct drm_panel *panel)
 
 static int nt36672e_1080x2408_60hz_init(struct mipi_dsi_device *dsi)
 {
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc0, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x89, 0x28, 0x00, 0x08, 0x00, 0xaa, 0x02,
-				0x0e, 0x00, 0x2b, 0x00, 0x07, 0x0d, 0xb7, 0x0c, 0xb7);
-
-	mipi_dsi_dcs_write_seq(dsi, 0xc2, 0x1b, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x66);
-	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x38);
-	mipi_dsi_dcs_write_seq(dsi, 0x2f, 0x83);
-	mipi_dsi_dcs_write_seq(dsi, 0x69, 0x91);
-	mipi_dsi_dcs_write_seq(dsi, 0x95, 0xd1);
-	mipi_dsi_dcs_write_seq(dsi, 0x96, 0xd1);
-	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x64);
-	mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x54);
-	mipi_dsi_dcs_write_seq(dsi, 0xf4, 0x64);
-	mipi_dsi_dcs_write_seq(dsi, 0xf5, 0x54);
-	mipi_dsi_dcs_write_seq(dsi, 0xf6, 0x64);
-	mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x54);
-	mipi_dsi_dcs_write_seq(dsi, 0xf8, 0x64);
-	mipi_dsi_dcs_write_seq(dsi, 0xf9, 0x54);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x2f);
-	mipi_dsi_dcs_write_seq(dsi, 0x09, 0x2e);
-	mipi_dsi_dcs_write_seq(dsi, 0x0a, 0x2d);
-	mipi_dsi_dcs_write_seq(dsi, 0x0b, 0x2c);
-	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x17);
-	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x15);
-	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x14);
-	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0x17, 0x18);
-	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x2f);
-	mipi_dsi_dcs_write_seq(dsi, 0x21, 0x2e);
-	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x2d);
-	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x2c);
-	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x17);
-	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x15);
-	mipi_dsi_dcs_write_seq(dsi, 0x2f, 0x14);
-	mipi_dsi_dcs_write_seq(dsi, 0x30, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0x31, 0x18);
-	mipi_dsi_dcs_write_seq(dsi, 0x32, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0x35, 0x1f);
-	mipi_dsi_dcs_write_seq(dsi, 0x36, 0x1f);
-	mipi_dsi_dcs_write_seq(dsi, 0x4d, 0x14);
-	mipi_dsi_dcs_write_seq(dsi, 0x4e, 0x36);
-	mipi_dsi_dcs_write_seq(dsi, 0x4f, 0x36);
-	mipi_dsi_dcs_write_seq(dsi, 0x53, 0x36);
-	mipi_dsi_dcs_write_seq(dsi, 0x71, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0x79, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x7a, 0x82);
-	mipi_dsi_dcs_write_seq(dsi, 0x7b, 0x8f);
-	mipi_dsi_dcs_write_seq(dsi, 0x7d, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x80, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x81, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x82, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0x85, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x86, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x87, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x90, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, 0x92, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0x93, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x94, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x95, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x9c, 0xf4);
-	mipi_dsi_dcs_write_seq(dsi, 0x9d, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xa0, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0xa2, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0xa3, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0xa4, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xa5, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xc6, 0xc0);
-	mipi_dsi_dcs_write_seq(dsi, 0xc9, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xd9, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0xe9, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x25);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x22);
-	mipi_dsi_dcs_write_seq(dsi, 0x19, 0xe4);
-	mipi_dsi_dcs_write_seq(dsi, 0x21, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0x66, 0xd8);
-	mipi_dsi_dcs_write_seq(dsi, 0x68, 0x50);
-	mipi_dsi_dcs_write_seq(dsi, 0x69, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0x6b, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x0d);
-	mipi_dsi_dcs_write_seq(dsi, 0x6e, 0x48);
-	mipi_dsi_dcs_write_seq(dsi, 0x72, 0x41);
-	mipi_dsi_dcs_write_seq(dsi, 0x73, 0x4a);
-	mipi_dsi_dcs_write_seq(dsi, 0x74, 0xd0);
-	mipi_dsi_dcs_write_seq(dsi, 0x77, 0x62);
-	mipi_dsi_dcs_write_seq(dsi, 0x79, 0x7e);
-	mipi_dsi_dcs_write_seq(dsi, 0x7d, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, 0x7e, 0x15);
-	mipi_dsi_dcs_write_seq(dsi, 0x7f, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x4d);
-	mipi_dsi_dcs_write_seq(dsi, 0xcf, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0xd6, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0xd7, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0xef, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x84);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x26);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x81, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x83, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, 0x85, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x86, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, 0x87, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x88, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0x8a, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0x8b, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x8c, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0x8e, 0x42);
-	mipi_dsi_dcs_write_seq(dsi, 0x8f, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x90, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x91, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x9a, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0x9b, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x9c, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x9d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x9e, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x27);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x68);
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x81);
-	mipi_dsi_dcs_write_seq(dsi, 0x21, 0x6a);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x81);
-	mipi_dsi_dcs_write_seq(dsi, 0x26, 0x94);
-	mipi_dsi_dcs_write_seq(dsi, 0x6e, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x70, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x71, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x72, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x75, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x76, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x77, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x7d, 0x09);
-	mipi_dsi_dcs_write_seq(dsi, 0x7e, 0x67);
-	mipi_dsi_dcs_write_seq(dsi, 0x80, 0x23);
-	mipi_dsi_dcs_write_seq(dsi, 0x82, 0x09);
-	mipi_dsi_dcs_write_seq(dsi, 0x83, 0x67);
-	mipi_dsi_dcs_write_seq(dsi, 0x88, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x89, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0xa5, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0xa6, 0x23);
-	mipi_dsi_dcs_write_seq(dsi, 0xa7, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0xe5, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0xd3);
-	mipi_dsi_dcs_write_seq(dsi, 0xeb, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, 0xec, 0x28);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x91);
-	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x50);
-	mipi_dsi_dcs_write_seq(dsi, 0x0a, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x0c, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x11, 0xe0);
-	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x16, 0xa4);
-	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x78);
-	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x23);
-	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x36);
-	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0x3e);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x3e);
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x3e);
-	mipi_dsi_dcs_write_seq(dsi, 0x28, 0xfd);
-	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x12);
-	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0xe1);
-	mipi_dsi_dcs_write_seq(dsi, 0x2d, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x30, 0x49);
-	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x96);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0x35, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0x36, 0xde);
-	mipi_dsi_dcs_write_seq(dsi, 0x37, 0xf9);
-	mipi_dsi_dcs_write_seq(dsi, 0x38, 0x45);
-	mipi_dsi_dcs_write_seq(dsi, 0x39, 0xd9);
-	mipi_dsi_dcs_write_seq(dsi, 0x3a, 0x49);
-	mipi_dsi_dcs_write_seq(dsi, 0x4a, 0xf0);
-	mipi_dsi_dcs_write_seq(dsi, 0x7a, 0x09);
-	mipi_dsi_dcs_write_seq(dsi, 0x7b, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0x7f, 0xf0);
-	mipi_dsi_dcs_write_seq(dsi, 0x83, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x84, 0xa4);
-	mipi_dsi_dcs_write_seq(dsi, 0x87, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x88, 0x78);
-	mipi_dsi_dcs_write_seq(dsi, 0x89, 0x23);
-	mipi_dsi_dcs_write_seq(dsi, 0x8b, 0x36);
-	mipi_dsi_dcs_write_seq(dsi, 0x8c, 0x7d);
-	mipi_dsi_dcs_write_seq(dsi, 0x8d, 0x7d);
-	mipi_dsi_dcs_write_seq(dsi, 0x8e, 0x7d);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00, 0x00, 0x00, 0x17, 0x00, 0x49, 0x00,
-				0x6a, 0x00, 0x89, 0x00, 0x9f, 0x00, 0xb6, 0x00, 0xc8);
-	mipi_dsi_dcs_write_seq(dsi, 0xb1, 0x00, 0xd9, 0x01, 0x10, 0x01, 0x3a, 0x01,
-				0x7a, 0x01, 0xa9, 0x01, 0xf2, 0x02, 0x2d, 0x02, 0x2e);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x02, 0x64, 0x02, 0xa3, 0x02, 0xca, 0x03,
-				0x00, 0x03, 0x1e, 0x03, 0x4a, 0x03, 0x59, 0x03, 0x6a);
-	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
-				0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb4, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
-				0x71, 0x00, 0x90, 0x00, 0xa7, 0x00, 0xbf, 0x00, 0xd1);
-	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x00, 0xe2, 0x01, 0x1a, 0x01, 0x43, 0x01,
-				0x83, 0x01, 0xb2, 0x01, 0xfa, 0x02, 0x34, 0x02, 0x36);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x02, 0x6b, 0x02, 0xa8, 0x02, 0xd0, 0x03,
-				0x03, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5b, 0x03, 0x6b);
-	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x03, 0x7e, 0x03, 0x94, 0x03, 0xac, 0x03,
-				0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb8, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
-				0x72, 0x00, 0x92, 0x00, 0xa8, 0x00, 0xbf, 0x00, 0xd1);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xe2, 0x01, 0x18, 0x01, 0x42, 0x01,
-				0x81, 0x01, 0xaf, 0x01, 0xf5, 0x02, 0x2f, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0xba, 0x02, 0x68, 0x02, 0xa6, 0x02, 0xcd, 0x03,
-				0x01, 0x03, 0x1f, 0x03, 0x4a, 0x03, 0x59, 0x03, 0x6a);
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
-				0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x21);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00, 0x00, 0x00, 0x17, 0x00, 0x49, 0x00,
-				0x6a, 0x00, 0x89, 0x00, 0x9f, 0x00, 0xb6, 0x00, 0xc8);
-	mipi_dsi_dcs_write_seq(dsi, 0xb1, 0x00, 0xd9, 0x01, 0x10, 0x01, 0x3a, 0x01,
-				0x7a, 0x01, 0xa9, 0x01, 0xf2, 0x02, 0x2d, 0x02, 0x2e);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x02, 0x64, 0x02, 0xa3, 0x02, 0xca, 0x03,
-				0x00, 0x03, 0x1e, 0x03, 0x4a, 0x03, 0x59, 0x03, 0x6a);
-	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
-				0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb4, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
-				0x71, 0x00, 0x90, 0x00, 0xa7, 0x00, 0xbf, 0x00, 0xd1);
-	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x00, 0xe2, 0x01, 0x1a, 0x01, 0x43, 0x01,
-				0x83, 0x01, 0xb2, 0x01, 0xfa, 0x02, 0x34, 0x02, 0x36);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x02, 0x6b, 0x02, 0xa8, 0x02, 0xd0, 0x03,
-				0x03, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5b, 0x03, 0x6b);
-	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x03, 0x7e, 0x03, 0x94, 0x03, 0xac, 0x03,
-				0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb8, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
-				0x72, 0x00, 0x92, 0x00, 0xa8, 0x00, 0xbf, 0x00, 0xd1);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xe2, 0x01, 0x18, 0x01, 0x42, 0x01,
-				0x81, 0x01, 0xaf, 0x01, 0xf5, 0x02, 0x2f, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0xba, 0x02, 0x68, 0x02, 0xa6, 0x02, 0xcd, 0x03,
-				0x01, 0x03, 0x1f, 0x03, 0x4a, 0x03, 0x59, 0x03, 0x6a);
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
-				0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2c);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x1f);
-	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x1f);
-	mipi_dsi_dcs_write_seq(dsi, 0x7e, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, 0x6a, 0x14);
-	mipi_dsi_dcs_write_seq(dsi, 0x6b, 0x36);
-	mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x36);
-	mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x36);
-	mipi_dsi_dcs_write_seq(dsi, 0x53, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x54, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x55, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0xf0);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0x00);
-
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x51, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0x53, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0x55, 0x01);
-
-	return 0;
+	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc1, 0x89, 0x28, 0x00, 0x08, 0x00, 0xaa, 0x02,
+				     0x0e, 0x00, 0x2b, 0x00, 0x07, 0x0d, 0xb7, 0x0c, 0xb7);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc2, 0x1b, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2f, 0x83);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x91);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x95, 0xd1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x96, 0xd1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf3, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf4, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf5, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf6, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf7, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf8, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf9, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x2e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0a, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0b, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1b, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1d, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x2e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2a, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2b, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2f, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x32, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4d, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4e, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4f, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7a, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7b, 0x8f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x84, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x85, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x86, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x87, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x90, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x92, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x93, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x94, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x95, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x9c, 0xf4);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x9d, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa0, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa2, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa3, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa4, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa5, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc6, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc9, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd9, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe9, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0xe4);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0xd8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6d, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6e, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x74, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x62);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x7e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7d, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7e, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x84, 0x4d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xcf, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd6, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd7, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xef, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf0, 0x84);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x83, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x84, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x85, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x86, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x87, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x88, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8a, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8b, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8c, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8e, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8f, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x90, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x91, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x9a, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x9b, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x9c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x9d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x9e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x68);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x6a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x70, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7d, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7e, 0x67);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x83, 0x67);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x88, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x89, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa5, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa6, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa7, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb6, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe5, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe6, 0xd3);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xeb, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xec, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x91);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0a, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0c, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0d, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0f, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0xa4);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1a, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1b, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1d, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1e, 0x3e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1f, 0x3e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x3e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0xfd);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2a, 0xe1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2d, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0xde);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0xf9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3a, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4a, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7a, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7b, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7f, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x83, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x84, 0xa4);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x87, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x88, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x89, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8b, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8c, 0x7d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8d, 0x7d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8e, 0x7d);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x00, 0x00, 0x00, 0x17, 0x00, 0x49, 0x00,
+				     0x6a, 0x00, 0x89, 0x00, 0x9f, 0x00, 0xb6, 0x00, 0xc8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb1, 0x00, 0xd9, 0x01, 0x10, 0x01, 0x3a, 0x01,
+				     0x7a, 0x01, 0xa9, 0x01, 0xf2, 0x02, 0x2d, 0x02, 0x2e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb2, 0x02, 0x64, 0x02, 0xa3, 0x02, 0xca, 0x03,
+				     0x00, 0x03, 0x1e, 0x03, 0x4a, 0x03, 0x59, 0x03, 0x6a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb3, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
+				     0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb4, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
+				     0x71, 0x00, 0x90, 0x00, 0xa7, 0x00, 0xbf, 0x00, 0xd1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb5, 0x00, 0xe2, 0x01, 0x1a, 0x01, 0x43, 0x01,
+				     0x83, 0x01, 0xb2, 0x01, 0xfa, 0x02, 0x34, 0x02, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb6, 0x02, 0x6b, 0x02, 0xa8, 0x02, 0xd0, 0x03,
+				     0x03, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5b, 0x03, 0x6b);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb7, 0x03, 0x7e, 0x03, 0x94, 0x03, 0xac, 0x03,
+				     0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb8, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
+				     0x72, 0x00, 0x92, 0x00, 0xa8, 0x00, 0xbf, 0x00, 0xd1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb9, 0x00, 0xe2, 0x01, 0x18, 0x01, 0x42, 0x01,
+				     0x81, 0x01, 0xaf, 0x01, 0xf5, 0x02, 0x2f, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x02, 0x68, 0x02, 0xa6, 0x02, 0xcd, 0x03,
+				     0x01, 0x03, 0x1f, 0x03, 0x4a, 0x03, 0x59, 0x03, 0x6a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbb, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
+				     0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x00, 0x00, 0x00, 0x17, 0x00, 0x49, 0x00,
+				     0x6a, 0x00, 0x89, 0x00, 0x9f, 0x00, 0xb6, 0x00, 0xc8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb1, 0x00, 0xd9, 0x01, 0x10, 0x01, 0x3a, 0x01,
+				     0x7a, 0x01, 0xa9, 0x01, 0xf2, 0x02, 0x2d, 0x02, 0x2e);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb2, 0x02, 0x64, 0x02, 0xa3, 0x02, 0xca, 0x03,
+				     0x00, 0x03, 0x1e, 0x03, 0x4a, 0x03, 0x59, 0x03, 0x6a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb3, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
+				     0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb4, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
+				     0x71, 0x00, 0x90, 0x00, 0xa7, 0x00, 0xbf, 0x00, 0xd1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb5, 0x00, 0xe2, 0x01, 0x1a, 0x01, 0x43, 0x01,
+				     0x83, 0x01, 0xb2, 0x01, 0xfa, 0x02, 0x34, 0x02, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb6, 0x02, 0x6b, 0x02, 0xa8, 0x02, 0xd0, 0x03,
+				     0x03, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5b, 0x03, 0x6b);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb7, 0x03, 0x7e, 0x03, 0x94, 0x03, 0xac, 0x03,
+				     0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb8, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
+				     0x72, 0x00, 0x92, 0x00, 0xa8, 0x00, 0xbf, 0x00, 0xd1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb9, 0x00, 0xe2, 0x01, 0x18, 0x01, 0x42, 0x01,
+				     0x81, 0x01, 0xaf, 0x01, 0xf5, 0x02, 0x2f, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x02, 0x68, 0x02, 0xa6, 0x02, 0xcd, 0x03,
+				     0x01, 0x03, 0x1f, 0x03, 0x4a, 0x03, 0x59, 0x03, 0x6a);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbb, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
+				     0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7e, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6a, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6b, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6c, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6d, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x54, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x56, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5a, 0x00);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x01);
+
+	return ctx.accum_err;
 }
 
 static int nt36672e_power_on(struct nt36672e_panel *ctx)
-- 
2.45.0.rc0.197.gbae5840b3b-goog

