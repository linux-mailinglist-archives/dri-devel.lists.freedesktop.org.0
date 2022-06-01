Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007AE539F24
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34502113113;
	Wed,  1 Jun 2022 08:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3FC113115
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:18:42 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id u2so1307986pfc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZXVJXoTliTs9PH6H4bJtRqk079LoRX34taoZ9SWcFs0=;
 b=UExVF+t0yo+CUF2U9NAgRgv1F5D/5gLH7m1BIMgAkp9BcaghU1VJRCg+9tTux1uS7p
 GooLVoefjUwi/Wrx57PtSiJASyS+d4Ci5wz5l5KeokvzcojAPYUOE8G6TY7CFUX1ZfS9
 GLZf2eHTn+ISk0qXAjhx+ohsQOjgmPIjWeWms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXVJXoTliTs9PH6H4bJtRqk079LoRX34taoZ9SWcFs0=;
 b=TcI+SW/MVUqV7+/8tUwC/OVi6DGTwphzCVaXl3o45Qd8ZhIKBuQ3xtDdAIzpvUWkqu
 SIQ7ujHuZ4is0db/9rmc6Mle2Ld0zMP9ariwM/a7B6Jkht3C752Tdv1zOt35I8lTzw93
 wZEzic7/y3pC1fEamTcSin9RbnqKMeghMdikVeQiapvGaRyoZG6FTqPb54CgXhSnLNpx
 wZb72lCcg/qEFRIdRDY49ZGva2jYvkzFP/84b2S0olvT+5CJ1V7pJmObPpbNkENyhlqN
 tN+GOyfj4y4BOo0BnFsIUxtTnPaeFkobATv993E/RcVtIOnyVRGJK30HsYoRHCeOl9T9
 1kxg==
X-Gm-Message-State: AOAM531K3y1WQTJJ/SlNuI7ZNNRkDCFB9OPcnJWdVU3xGE+BPT+csmyr
 sGukif2uU3SykAP/k1ZBNgen9Vfz2O2jkw==
X-Google-Smtp-Source: ABdhPJxQ9eCDaf4dvRJZI6lO8kC3TdeHI0Lqsx36TI7SwrRFIzm9uahMlqRrBMTjw3p/O2lQbj6Fcg==
X-Received: by 2002:a05:6a00:218e:b0:51b:2c21:26f7 with SMTP id
 h14-20020a056a00218e00b0051b2c2126f7mr19812855pfi.62.1654071522073; 
 Wed, 01 Jun 2022 01:18:42 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 01:18:41 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 3/8] drm/panel: panel-edp: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 16:18:18 +0800
Message-Id: <20220601081823.1038797-4-hsinyi@chromium.org>
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
 drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 1732b4f56e38..a2133581a72d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -609,6 +609,13 @@ static int panel_edp_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static enum drm_panel_orientation panel_edp_get_orientation(struct drm_panel *panel)
+{
+	struct panel_edp *p = to_panel_edp(panel);
+
+       return p->orientation;
+}
+
 static int detected_panel_show(struct seq_file *s, void *data)
 {
 	struct drm_panel *panel = s->private;
@@ -637,6 +644,7 @@ static const struct drm_panel_funcs panel_edp_funcs = {
 	.prepare = panel_edp_prepare,
 	.enable = panel_edp_enable,
 	.get_modes = panel_edp_get_modes,
+	.get_orientation = panel_edp_get_orientation,
 	.get_timings = panel_edp_get_timings,
 	.debugfs_init = panel_edp_debugfs_init,
 };
-- 
2.36.1.255.ge46751e96f-goog

