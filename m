Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A14736BE9D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 06:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9794D6E8F3;
	Tue, 27 Apr 2021 04:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB6A6E8F3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 04:49:56 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d124so40491902pfa.13
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 21:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xF3OHVoJNfqjglnjvTxLJPf73tywjjNrGA26Syn00bg=;
 b=aQkvabnsOYdSCbCI2Ahu8FMyIfugOfrAzX9FIMQJY9p2Czzu7GnXrtexTRQGyfcOXA
 zDUfD3J608v/yBPJ2tYvQStQjwqcURK8qXNGNtV4GnpwVVbXvHFDGHX/0e46PhgnQLJf
 wBihdkVOueiHhJkVMUT6VOim5Rl9dRrc7EZgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xF3OHVoJNfqjglnjvTxLJPf73tywjjNrGA26Syn00bg=;
 b=de8ic5UAXP4lBDkMMeDMcNGgVHacq/qiY5eqCDsgzkGSbUO0vxnfcBI+5uEWbbmZbD
 l2vKqra5ARktuLANT3Jy16QLQ/W+6TeR+xobcHwO7ZScDzkxReEkntoJwRgSxoXult/l
 RU/edBUzzUyV3wgjtAq+sOrQ8DR2EsTmrsR2cUJdthKKsCxynNAEwStSv4cVc4cf/8pc
 3k7lNAHRx3iolimGz/frF0WTawKej+sGtzPPKBQXstxIv2dcdNwxnnUoQLiVJBcih55C
 wWAuYMbijhOS8/dfVZgZlg7o7FeqeHtyikiCFogbTgSpCTow/rnEv86sMU1puwgMgglg
 //Eg==
X-Gm-Message-State: AOAM5334vYrigL+U9XAeJuPMLjSIDg0R2PiG/oT1tx0kcd3IQYYkHvcT
 w5x1wbSu0iDFB5kRjwJIzgGMeK8x+spMuQ==
X-Google-Smtp-Source: ABdhPJwPPm4u4tg6YSG/bq6wlqozKqdTA0jRIW6pE9ln5m9hymH+OexWOCKpW5EL+vxYFzyZxE6Yrw==
X-Received: by 2002:a62:bd13:0:b029:25c:5ec4:c2f3 with SMTP id
 a19-20020a62bd130000b029025c5ec4c2f3mr20817479pff.35.1619498995453; 
 Mon, 26 Apr 2021 21:49:55 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3984:c4f5:8612:6b3e])
 by smtp.gmail.com with ESMTPSA id c125sm1151517pfa.74.2021.04.26.21.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 21:49:55 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/mediatek: init panel orientation property
Date: Tue, 27 Apr 2021 12:49:47 +0800
Message-Id: <20210427044948.12596-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427044948.12596-1-hsinyi@chromium.org>
References: <20210427044948.12596-1-hsinyi@chromium.org>
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Init panel orientation property after connector is initialized. Let the
panel driver decides the orientation value later.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd9..0bd27872f2a4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -964,6 +964,7 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+	drm_connector_init_panel_orientation_property(dsi->connector);
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
