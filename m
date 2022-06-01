Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3093E539F28
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4E21134DD;
	Wed,  1 Jun 2022 08:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95D31134B0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:18:52 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id bo5so1300046pfb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M55jesM2/bLrZTqeLQbPue+qYepgHtq5DKFSuhycS2c=;
 b=aYfb6XQeGN+agxPiXMc5cMMCvRMycYKm3pjxf5IuRCdZkzxHVMNiMARTXTzWZUQPQG
 RTyI09JGjcklxzXAbDnf/Di/q40nfaQ7S4bgFQVenhFqddaJnUPtH0xkmzLf3rpgk7MS
 mME6bPb0/mloYpW/tF0wiOlWADxaQd/hVTSug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M55jesM2/bLrZTqeLQbPue+qYepgHtq5DKFSuhycS2c=;
 b=ccl40zDyVmi5HBjw/9aFvO75Yet94du6o5bG/7oGBDG3qiHtoTzGgVCyBzz5IszXi2
 3TOL+Xu/Cjtdjb3MgWpLRl7y4h5L+/4mwtX8MdBRFl6hk94FYp11eoojeQrWv/Y8TY5S
 YAakDyOzikL7KAYftq4s2tiGz4yoNEJrjcIwVUF3ZFaXtWtlW57jiMwzHBM3WeNJs5vu
 UssJcDblULrLDXV3APfxeDudQjVeXcZWlCryVN8F8CkKi4cWj3ztG3sm56cTT9Bxin32
 ID9y6P1qUfQ1xtGKy9BgNUta7KGGsuMfkUwqNuoBDcpscAnzJCEM/AL1AxBEEJIrBg9g
 OWxg==
X-Gm-Message-State: AOAM533QLAo1k58QkXexIVjhRGfRT+InMJh0xa9j0tmaIyr/fQ2SamgT
 Qy0YceSg9+e0K5ostn39CxK7DQ==
X-Google-Smtp-Source: ABdhPJw1updJCiw3Qsgmdq3tUxrZNaTrj9u2SGii7IU9H10RIUQW1QdPFu5jUXYEGA9RVz0ZD8Btpw==
X-Received: by 2002:a05:6a00:a03:b0:51b:5131:704e with SMTP id
 p3-20020a056a000a0300b0051b5131704emr13202436pfh.53.1654071532308; 
 Wed, 01 Jun 2022 01:18:52 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 01:18:51 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 6/8] drm/panel: ili9881c: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 16:18:21 +0800
Message-Id: <20220601081823.1038797-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index ba30d11547ad..238b6a75d2ed 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -858,12 +858,20 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation ili9881c_get_orientation(struct drm_panel *panel)
+{
+       struct ili9881c *ctx = panel_to_ili9881c(panel);
+
+       return ctx->orientation;
+}
+
 static const struct drm_panel_funcs ili9881c_funcs = {
 	.prepare	= ili9881c_prepare,
 	.unprepare	= ili9881c_unprepare,
 	.enable		= ili9881c_enable,
 	.disable	= ili9881c_disable,
 	.get_modes	= ili9881c_get_modes,
+	.get_orientation = ili9881c_get_orientation,
 };
 
 static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
-- 
2.36.1.255.ge46751e96f-goog

