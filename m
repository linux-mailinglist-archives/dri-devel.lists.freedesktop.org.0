Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC75539F26
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BADC1134B6;
	Wed,  1 Jun 2022 08:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032C01133D9
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:18:45 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso5464057pjl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PdPl/Tf6jL9+D3LT0u150RT4I6KqqkA79M7TaHGqeRs=;
 b=T8iFrxlGkDnezem3qfebm9nWuH2n0YbQw2LTIT85bYvGyWqfRsYh5tWeX+uuL2GHHH
 Hcig0S6hO3U8bdSdxwGUJaC69Ku95h6my1S7xZvpIT5ALq/Aas+WyotltbQtw+44YRVo
 5AksVCmgz8eam66xN85U5ePqXAjiMGHFnFSek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PdPl/Tf6jL9+D3LT0u150RT4I6KqqkA79M7TaHGqeRs=;
 b=CaHh++51JhEoEpilPTR+vtC1Vwpyu5sbCs/C10DpJbx5fnrJ1LlmVMyZTD+Qmq8sJc
 XVf2st7IRbdn9UZheazdNjwdmckTsEhRQnfql3QHVy/oXNuh2A9u41fVBoPwBwtwV4JN
 q17RCy/RxHse/5mnHzytxQVoL827hHaSt1ysHHno5msbO4eheaTIkWfzv/HP3P3UDvF7
 QHn515SiLl2mj94tR5VJDa2W/v/49dr3zaCdPohMpV2j9ZGZE5QPHS7PpSBT5klhYnDa
 MNoNAG360pj1RorBI3oJZ3MNT3JHxdgkEjdXbr49zqTegb8d0lzLbLP5q+HQpYAddBxR
 V2EA==
X-Gm-Message-State: AOAM531/Z90W+eekvy713Io3WzO6Njum3QIfNgewxTxfOdH9lb0TGCF/
 pLXUG9olqq0rHdQO/EhK8C9CPg==
X-Google-Smtp-Source: ABdhPJxKELhOFU4LHTDmNuq52nBBrczXLmtFgK6gdtzyOHFSGBG4Ze/wn5pXmjLWXZGt7iwaLDo+WQ==
X-Received: by 2002:a17:90a:5b0b:b0:1e2:8e28:1a61 with SMTP id
 o11-20020a17090a5b0b00b001e28e281a61mr25453869pji.187.1654071525517; 
 Wed, 01 Jun 2022 01:18:45 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 01:18:45 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 4/8] drm/panel: lvds: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 16:18:19 +0800
Message-Id: <20220601081823.1038797-5-hsinyi@chromium.org>
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

