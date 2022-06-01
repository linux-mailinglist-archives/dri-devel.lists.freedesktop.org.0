Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7074553A113
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8194610EB30;
	Wed,  1 Jun 2022 09:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A3C10EB2E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:46:51 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so5651065pjl.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=INHYjrtzuqTmW29J42HX48K917nNuhGdGFIMxI84h6U=;
 b=LvoSbn8q477RrYSibfBveWnjpFmVPUg2kyylSMS3U9WKUzvZCOaAlljYZnNmB8h3IH
 KUfDjgnk6qR2j0EyxzpkDV27Lrn/h0xLPVTM/K48nLP97GkQUIcK/5Xj12qxQ980Pg5A
 F2Kp0FCwVJ89GKq2sYlijKOfjGgViTwvxvTj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=INHYjrtzuqTmW29J42HX48K917nNuhGdGFIMxI84h6U=;
 b=sBPX1h1noBwB0FEcnBzH22EQ+UA2TxpbBU/Z1EbBWEQChGwYY6d6sKK85PocCVvKon
 pX9Fyb1ShUoKmrWEGHkRQ1d92ds06qId8A5NOUnS8hBKeQ3kptVSUeSwYMfxMcx4EJX8
 nJdwIM84PYyfYmmuQsbETjAz4yWv1+Ps6RP36sdzV+uXovv0YN/Y2H17kbh6yWDaeDHI
 WmStxFMP9o7pQhO1RYPNsKw4goMOJRg5UGt+AKEhllZbbeopgIrY9avryrh3bz4Yo5Bd
 qCaU5q7UA16PR+kNh9/IdShRvqG+lZsm+wYednmJDraK87F+DQe1m8Zv+hzNl0z+jnUZ
 tY2Q==
X-Gm-Message-State: AOAM533Zmu5Bn7t5noOJyb7zaifheaNGQYLP4Wz7ZiExtk6WOoBCIlzg
 Em0IadiaIoS/7nIAJocm94nmNw==
X-Google-Smtp-Source: ABdhPJzmCwkp/oP9bNtMxaNhr0RDu6E+1BWrnv69WtPiA4cmKqDHhI/gba5a1xxURUe2vVmGy8TPkQ==
X-Received: by 2002:a17:903:22ce:b0:163:f186:f3f6 with SMTP id
 y14-20020a17090322ce00b00163f186f3f6mr11348483plg.59.1654076811040; 
 Wed, 01 Jun 2022 02:46:51 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:46:50 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 2/8] drm/panel: boe-tv101wum-nl6: Implement
 .get_orientation callback
Date: Wed,  1 Jun 2022 17:46:31 +0800
Message-Id: <20220601094637.1200634-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 1be150ac758f..0f1c9b685da3 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1516,11 +1516,19 @@ static int boe_panel_get_modes(struct drm_panel *panel,
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

