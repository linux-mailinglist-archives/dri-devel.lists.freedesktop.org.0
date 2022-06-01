Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E54353A11B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB7410EB35;
	Wed,  1 Jun 2022 09:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5186F10EB47
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:46:58 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id e24so1566843pjt.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uKIVyDAwCRbl3j6LCvOq2/nCq7m+//LNqW8/74aUWVc=;
 b=K55Diq2ttR9WJlI2/Wd+H9Ph2pL1ao/2eEjG7R/EElPqrHWmBsDDo2bMhx/9i6sjnq
 9QbVWH6KHA9eu0L55xByn5/Y2fdGlY6l5yy8HeM+Jl69l4r8ee4Jbm+ctn6gS9wU4bMV
 dTqPBZMZKk10KcmnLXZVIxTJVWbgjkTwGEbV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uKIVyDAwCRbl3j6LCvOq2/nCq7m+//LNqW8/74aUWVc=;
 b=1HGTBRgheFvCntkpR2aM6eaKgPjmlJtw5kY4aHr0ej32L4vUGPlo1R29PefSrVXF6Z
 Ckl/2QlI8CdRxDvuDgtr6nZ3cQEEsQsHIMxfteBQTrfLHddj4c8phBd+cXId8y0xzmUY
 OiiUhtaQWBn4Pw5iOEJsNdr0gmSx60jKMFtHCUF3fSuQtkZ2NM+9tjMv6PdIUxqVgLfN
 NgaBHxF1B9RohFp4WHF11H8jZhhifpvdgDlkrLLNNJ70SMA7VKmUEyxwuLw21sNRwfsG
 aEezE5SoxMWZqC+5Ljg8tlaaHPeBCKgI1n4wN9uZ+vC+SVnu9abRGdmOLNwnyxonpLag
 BN+Q==
X-Gm-Message-State: AOAM533du22M8LS6SumJ9OnCYah+gNMI6sGfjNK4/YvmqDaJKDPjwswY
 5H1DT3APGb/PtcIt5tAmeVttcg==
X-Google-Smtp-Source: ABdhPJx+L9NeZp/yBLzjW5DmKKRxM5eCbinJMWNY6Kiy9cOR+7U+YTZTSf56rWT+/WOY/0EfnFPp/w==
X-Received: by 2002:a17:90a:b88:b0:1df:2b03:20c with SMTP id
 8-20020a17090a0b8800b001df2b03020cmr33285059pjr.46.1654076817876; 
 Wed, 01 Jun 2022 02:46:57 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:46:57 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 4/8] drm/panel: lvds: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 17:46:33 +0800
Message-Id: <20220601094637.1200634-5-hsinyi@chromium.org>
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
 drivers/gpu/drm/panel/panel-lvds.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 27a1c9923b09..dc50f73d400f 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -107,10 +107,18 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation panel_lvds_get_orientation,(struct drm_panel *panel)
+{
+       struct panel_lvds *lvds = to_panel_lvds(panel);
+
+       return lvds->orientation;
+}
+
 static const struct drm_panel_funcs panel_lvds_funcs = {
 	.unprepare = panel_lvds_unprepare,
 	.prepare = panel_lvds_prepare,
 	.get_modes = panel_lvds_get_modes,
+	.get_orientation = panel_lvds_get_orientation,
 };
 
 static int panel_lvds_parse_dt(struct panel_lvds *lvds)
-- 
2.36.1.255.ge46751e96f-goog

