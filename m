Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDAB5444C3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912BC10F932;
	Thu,  9 Jun 2022 07:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D5B10F932
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 07:27:44 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 184so5133935pga.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 00:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6cns58U7ETFcRJZ3rxmYxEFcjgwqUT9LK1/jcMIzzTI=;
 b=d5E1HKLGWGQ+MJC1zhqIlaMdVqsmrJIiSTzfeCCJ8GRtmrxDluI8Nr3EsxGpB97Ios
 Kr+asgLmD6JQ2jgDM5t0DTd/FRpUUoJo7U0ZIe+nMxZDSiXb5ewCvsLZMX/tOZhbUVGs
 glzUZY+7Ruud+lKjcMEk+WIHOm2Nd1Jvp7emc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6cns58U7ETFcRJZ3rxmYxEFcjgwqUT9LK1/jcMIzzTI=;
 b=Nw+qtivCDfTH/H7BCMnWiX3ocqJU2zh8rzRih8yITV+sKhIvGXOOO8+cVFttjyhyuM
 e1fqhChutyQhVtvb8kCa2Gs1NwZiQfXbjpH9LNc56lFuqdv1Gei5s9E7l3qx7YBmnuwM
 LRamaPxFIR5IQybmHBiE8tta3yWwRvVM85bwrvscVg7W8SY1px6f/IwOoIeAM7aXaOH3
 nYC4BGXepVe5fzgAENRkMndNv0FA8jBRMYfvwm/YpGezMrc9+Yw4jfPGEkhNbmTs6GyI
 TqoYvNOkoZylQvTXxpXjFZToa+ePFhJHIjfJtt74r48aFtO5gmNcjcrkgnkRbH/Slpl7
 nqDg==
X-Gm-Message-State: AOAM532vFEC5ZYZf0A+auTry0mQ1tYEdKc15dHAwZYPe5quRAdfK4EZT
 ipP8QMIp0gCoDWi/X9grOIfgIw==
X-Google-Smtp-Source: ABdhPJxEW2aEZOOk3eVwTOVHc08TJtKl0jc1RGX7hhglR738NBHPdiIFVkzAMa8GiWT2HYaWCqw6DA==
X-Received: by 2002:a63:483:0:b0:3fc:9128:60a5 with SMTP id
 125-20020a630483000000b003fc912860a5mr34278819pge.606.1654759663639; 
 Thu, 09 Jun 2022 00:27:43 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5119:d95b:c6cd:77fb])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a1709027ed000b0016403cae7desm15312221plb.276.2022.06.09.00.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 00:27:43 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v7 2/8] drm/panel: boe-tv101wum-nl6: Implement
 .get_orientation callback
Date: Thu,  9 Jun 2022 15:27:16 +0800
Message-Id: <20220609072722.3488207-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220609072722.3488207-1-hsinyi@chromium.org>
References: <20220609072722.3488207-1-hsinyi@chromium.org>
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 1be150ac758f5..07f722f33fc5b 100644
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

