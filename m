Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F19BF539F23
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919FC10FABE;
	Wed,  1 Jun 2022 08:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3035C10E521
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:18:39 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id j7so1320348pjn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wmbEut7AQ7/Bf3HWTLDsZtp4DOqAEomrHS3HpyZ9OO4=;
 b=igURx3teJeErCLwWW62RZUsTiA0yqJqs5g1N0ySEf7hYZ0aQu17UQuOLGN0K/bQkFv
 oIayxg9GbTmWrLSfdAVeYA/N/zIJ+CTzhRi6uQdSzkNPBbyiIFACjzza0SYrv17UUtQv
 aeGqsnM/aIpZfOz7ZST/lSBoAilfn+Kv/UZw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wmbEut7AQ7/Bf3HWTLDsZtp4DOqAEomrHS3HpyZ9OO4=;
 b=LJYUYAIoqpQkHNV9Ndmd0H18UyTHLR+Eo+SG3C2AQjAHUJVmHiPKXLOlohmajEr9+0
 SKPBHjIzHPKLhjnG1/ZN5xo+2vag1LDpZCdQC/5dKB9I5Nbvoa15w16liN3v+Be/BlBN
 NQSdNUp8/8NKwt6Re3LNZ+Or4mBFt+jTO1cEy9E0zXTKwWcMmrD13zUibYZmaDYFgGqO
 A+27Os3Z4SIbdLyP/Zpf1Degf04dAm3atbHDn5ZpbKTvXSvRIb7wd0fdw96H4KKhPvDb
 Tj9dcUuvgZwZUroIc4DLvK1CsL46PNpakqf9k6ag3aj9ddawFRP5w4LuAhuxVOqKfNsj
 jp+w==
X-Gm-Message-State: AOAM5301d12d9jeFG+hcdOKmdjF9Wu+QUowjvYb7Hs3GwxalDkrhVra5
 RepcXX6HGfJnJuX14LCBhh4RLQ==
X-Google-Smtp-Source: ABdhPJzAOTg2fw10j7HFjvrblLTUzc60T5jBHgR4OhGqZldKydmmJeCI6jBogTpq8SWmmOAAjGhg6w==
X-Received: by 2002:a17:90b:4f44:b0:1e4:b161:f9f6 with SMTP id
 pj4-20020a17090b4f4400b001e4b161f9f6mr3465677pjb.43.1654071518643; 
 Wed, 01 Jun 2022 01:18:38 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 01:18:38 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 2/8] drm/panel: boe-tv101wum-nl6: Implement .get_orientation
 callback
Date: Wed,  1 Jun 2022 16:18:17 +0800
Message-Id: <20220601081823.1038797-3-hsinyi@chromium.org>
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

