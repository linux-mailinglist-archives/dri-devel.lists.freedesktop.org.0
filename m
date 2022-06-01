Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594BB53A11F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEBE10EB47;
	Wed,  1 Jun 2022 09:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EB710EB3B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:47:08 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id s68so1402048pgs.10
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bk6C27QNmt1+4+7KncB4viIiej/sMiUgOSBQvF7TcyY=;
 b=K5lzcMPBYc5vuIuvnrMLXcNHgjTQKop5EOpt+HwdgnFoFJa+hd9QbbKDaVebbKacZL
 OSwO3h44qdUkHgpNO01ZFKqIrpb7gnBjvepEql6SNrM5QPse6iv7B8DP6j5GEimsSfcl
 7rLDinsDAlwVs0ZKykx56OzMFZvwhVG+tu1e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bk6C27QNmt1+4+7KncB4viIiej/sMiUgOSBQvF7TcyY=;
 b=ABVwTaazLM+BeaWu7nLiywlUPnrswC6VEZ8mtqaP6D29X7Ic3sW3tz4Uqhc9en1+r2
 nFiPbZFivynAR1zaBwZyttGlLy7mDWh3wk4FTJm86TaZnqPCgseU0lJwJd0+drjwj0xM
 oJa3xoprSezGcFhi7+7NEqIISIeLHb7xbvk26dU5RXfwd7PbXvMAhgSm4qIw/nhk7x8E
 N3nRqISCpmBeL4mSEvidiioPMOJBKdty/x4armXZ7rYEuyWdSMs2Vma2J/iry8KSWcYh
 DfY3hbVuH0KF9YRHliIEryov5Z3JDWP1RJ1CxymBaY3vuOECMdLLhdg+/2XzGpf9ny61
 q6XQ==
X-Gm-Message-State: AOAM530EfGQpdoas/MyDFYZ0LRfVGj54iGfZ3O5y/N57b7qmNNGjQLka
 J21ndSZ7UbKyTaINl7qtWrqAiw==
X-Google-Smtp-Source: ABdhPJy780kRALjc91F0vxW4FURBQqFFfjKK3ZprK5u2ZLrMWSj311aX4pckzJCj6vHag0BcmbL/+Q==
X-Received: by 2002:a05:6a00:2386:b0:519:1ff1:d723 with SMTP id
 f6-20020a056a00238600b005191ff1d723mr28880889pfc.21.1654076827998; 
 Wed, 01 Jun 2022 02:47:07 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:47:07 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 7/8] drm/panel: elida-kd35t133: Implement .get_orientation
 callback
Date: Wed,  1 Jun 2022 17:46:36 +0800
Message-Id: <20220601094637.1200634-8-hsinyi@chromium.org>
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
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 80227617a4d6..079ed71f660c 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -222,10 +222,18 @@ static int kd35t133_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation kd35t133_get_orientation(struct drm_panel *panel)
+{
+       struct kd35t133 *ctx = panel_to_kd35t133(panel);
+
+       return ctx->orientation;
+}
+
 static const struct drm_panel_funcs kd35t133_funcs = {
 	.unprepare	= kd35t133_unprepare,
 	.prepare	= kd35t133_prepare,
 	.get_modes	= kd35t133_get_modes,
+	.get_orientation = kd35t133_get_orientation,
 };
 
 static int kd35t133_probe(struct mipi_dsi_device *dsi)
-- 
2.36.1.255.ge46751e96f-goog

