Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1231542BDF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61E6898C7;
	Wed,  8 Jun 2022 09:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372BD10E549
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:48:29 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 129so18422146pgc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W5IKfgYz5xf2GI+6lvPe+62g09BBcgumm5yF5o1+Nx4=;
 b=FQ7vGEL7CIyuMkUWz69rqKrfbSKqncuXS8hn3qh8zQiCYfyqiMehg/B+6gdS5GARXc
 ui9CaQ7f77yeRz7RY/Zsh7ogBiuv7UkxPXGf8AbJYk/iYQ6T/2ylrotouKqEowLpbmeo
 JdnYEyK/8LRszk3diG3Wrg1lqdPFcK30T8wZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W5IKfgYz5xf2GI+6lvPe+62g09BBcgumm5yF5o1+Nx4=;
 b=pEB3K03TghiOxIO6GoAGjkbiTzOxk/IwyBIl6/HNBBNLFEcT3huIYNZlDpUx48QwFY
 4xG3S/YoiNkkTg79mJEUf2fsYNulOKI6zgSjkcjMJfSmNodv3C351oNT8LTZJ4uQ2voA
 r+YphT1LqCfyrwvsLQ/ShU/fZDuhfaMffRpOw/qn5OQPAnmSG//k/586Gw0vJomFTsu1
 xBWF5gdtgMGT2g6fFnRN5CsHByuHGZVom8LBpBG8Cwwc7xKlLXlfv2/crnjxJzY0Y8tM
 +4RlGUxaHPsYRSBpRcxh97/LyH+JOIusSXqbQgVhX61/p+aa4M6b1ACDsrS5yTRCG3tk
 cPag==
X-Gm-Message-State: AOAM531Z966y5AYMRCQb5fhn6Gr1756aLHNWDEuHUYdQJgi2KgKMV7Hw
 6ZpB3oGPEZlelfFLIEtCL9Cezw==
X-Google-Smtp-Source: ABdhPJwY10X54qkCemGXIJKUyFcIOP4JABpqefy/KV0RlOOHwUX0S+RhW7c3RXQRcQoGKn5AVKPZbw==
X-Received: by 2002:aa7:85d1:0:b0:51b:f4b5:db7b with SMTP id
 z17-20020aa785d1000000b0051bf4b5db7bmr21661005pfn.41.1654681708744; 
 Wed, 08 Jun 2022 02:48:28 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c46b:e7b1:f6c8:5eb8])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a17090a950a00b001e28e80a8d6sm13584038pjo.38.2022.06.08.02.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 02:48:28 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 2/8] drm/panel: boe-tv101wum-nl6: Implement
 .get_orientation callback
Date: Wed,  8 Jun 2022 17:48:10 +0800
Message-Id: <20220608094816.2898692-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220608094816.2898692-1-hsinyi@chromium.org>
References: <20220608094816.2898692-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 1be150ac758f..07f722f33fc5 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1511,16 +1511,28 @@ static int boe_panel_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = boe->desc->size.width_mm;
 	connector->display_info.height_mm = boe->desc->size.height_mm;
 	connector->display_info.bpc = boe->desc->bpc;
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, boe->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation boe_panel_get_orientation(struct drm_panel *panel)
+{
+	struct boe_panel *boe = to_boe_panel(panel);
+
+	return boe->orientation;
+}
+
 static const struct drm_panel_funcs boe_panel_funcs = {
 	.unprepare = boe_panel_unprepare,
 	.prepare = boe_panel_prepare,
 	.enable = boe_panel_enable,
 	.get_modes = boe_panel_get_modes,
+	.get_orientation = boe_panel_get_orientation,
 };
 
 static int boe_panel_add(struct boe_panel *boe)
-- 
2.36.1.255.ge46751e96f-goog

