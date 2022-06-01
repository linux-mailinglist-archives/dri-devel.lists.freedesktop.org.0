Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AD353A11D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839EC10EB2E;
	Wed,  1 Jun 2022 09:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E1810EB3B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:47:01 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so1544225pjt.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jVLAPZRG5UqIkFmmis3uM10FnfT5Ljau+xefKKOpEpE=;
 b=OE93Xi6fuFvNjrUPzVoJX4DICUjzwZ0FrNbASk4QhkljwjjdO/t0+U9bsHLt3Nq16+
 2jXyFGb9vQV2JODWz1J1HY7MqWvFdGQfxoZCRMPGD0flte9sS8xfM5OvEXrqzlCd8Bhi
 wM7/e6IqFwZwACP7InwILEx1YGycyNgsKSh5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jVLAPZRG5UqIkFmmis3uM10FnfT5Ljau+xefKKOpEpE=;
 b=KXF2RIAbwcGgPyabOERw4pl+JOGGThK+DCUaG1pAgGFoaV+Uma+RVIqteKenRimmm1
 X4SqtwreWJRlfBYBblbZqVOFvl+0y/AuPAuomtdKxwedo32o0siiOZzQ4t9pY3XBzGUe
 J8fnTAdlSpmgvzpw0DtQMY4X4jLZiRIvnPlD8dBJyWrEYLoOoHWUnNFnCZhkRTOoFZG8
 a/QGtWihIaXPwoJSsc4baV0qj4c+2RxfH3kaJmRt1bLJg2ulfFUbUfSb9YiYNru0Nf0s
 cXseXvUY9VZzJizjN+Bchw2LUt2VKB9kWXeg/qomXG6vQS6DElTmIjPdu+Gm7NqJ0iuB
 uG/Q==
X-Gm-Message-State: AOAM531SKBEVOHz79qZpyk2CLcLGOrR5OkCDlABaKYmYcwIeedZ6Q/sr
 uQMNY78m7oiQzFRLD/yXdwt63A==
X-Google-Smtp-Source: ABdhPJxax220Y+zg4h1kp6XXN13EyER3sz3MXL01acYe3CvWec7xBmexQhbBRgOQrByQ7j3lpjfQeQ==
X-Received: by 2002:a17:902:7045:b0:163:9c45:e330 with SMTP id
 h5-20020a170902704500b001639c45e330mr25430866plt.32.1654076821222; 
 Wed, 01 Jun 2022 02:47:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:47:00 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 5/8] drm/panel: panel-simple: Implement .get_orientation
 callback
Date: Wed,  1 Jun 2022 17:46:34 +0800
Message-Id: <20220601094637.1200634-6-hsinyi@chromium.org>
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
 drivers/gpu/drm/panel/panel-simple.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a34f4198a534..54e78d978dcb 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -434,6 +434,14 @@ static int panel_simple_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static enum drm_panel_orientation panel_simple_get_orientation(struct drm_panel *panel)
+{
+       struct panel_simple *p = to_panel_simple(panel);
+
+       return p->orientation;
+}
+
+
 static const struct drm_panel_funcs panel_simple_funcs = {
 	.disable = panel_simple_disable,
 	.unprepare = panel_simple_unprepare,
@@ -441,6 +449,7 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
 	.get_timings = panel_simple_get_timings,
+	.get_orientation = panel_simple_get_orientation,
 };
 
 static struct panel_desc panel_dpi;
-- 
2.36.1.255.ge46751e96f-goog

