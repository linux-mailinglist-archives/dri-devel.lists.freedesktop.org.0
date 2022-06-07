Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4432553F905
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5B9112BFC;
	Tue,  7 Jun 2022 09:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C6710ED4B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:06:06 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id e9so4573910pju.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 02:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xYeDQhf6C4qNcR/ypeqIeNKvzW6/RJ1frKBoLaPHIDU=;
 b=e5GUX3w98mXidj6PktAsCCs+1jtyi7CTkOjk4ZtoYHy7DxEANDLibad2GC3quOwOrm
 UVZoqe81WqocOq5NEs/kaeH0rl1kjIlsj08svMQHfMdKvx5CkRYStIBgMRcuCypTHAy0
 URnedot666T8TmTtSlzzLt0YKeJ/9f/LZz9XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xYeDQhf6C4qNcR/ypeqIeNKvzW6/RJ1frKBoLaPHIDU=;
 b=V/h6gl0bbQXsVDJcXOx5NniDBegTBlqVk2G/lIxd7ENnsr4t1NQgJiHYVJ3CfU3ltG
 zT2qnSV7JiwEFRgr7IrfCGoRVUXvcxJqBaK2LObPVvl7akpold1olPE1AeIkMRq66iPl
 +J1Hv2EhAjEgvvQhzs0mWIWq3bknTk0w7W7GmUf1MoAyQzySS2xKSZKu2N7ChPAlMpm+
 YEIdabwqNlRyt/Z72+m46Se/MKf5Ki+sc43R0l8zciHSbN9gTImxJdnug3JG4/1qAZXC
 NVTk1ffgvHEUUEootM9jjBzXyllxswzH4YooSF0y7TsOI39TnPT26/lGyWrFdCM4gQrs
 9olA==
X-Gm-Message-State: AOAM533f3jTQsrJgH14R/J3x2FDSNpBlntxvvEK8LuJ++dJfZad4MGP5
 7W46ob8hEFeZQi4IFLzpSZTK0w==
X-Google-Smtp-Source: ABdhPJzeaeZzletu7cyNw10d23dKyONDwXP2r/qWUVnyVfAreMR1Ry/RctWwZMxAUZbcnT+OV3SZpQ==
X-Received: by 2002:a17:90b:3c4e:b0:1e3:36c8:8496 with SMTP id
 pm14-20020a17090b3c4e00b001e336c88496mr40678398pjb.82.1654592765731; 
 Tue, 07 Jun 2022 02:06:05 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
 by smtp.gmail.com with ESMTPSA id
 t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:06:05 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v5 3/8] drm/panel: panel-edp: Implement .get_orientation
 callback
Date: Tue,  7 Jun 2022 17:05:44 +0800
Message-Id: <20220607090549.2345795-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607090549.2345795-1-hsinyi@chromium.org>
References: <20220607090549.2345795-1-hsinyi@chromium.org>
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index c96014464355..ee622c1dd532 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -586,7 +586,10 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 	else if (!num)
 		dev_warn(p->base.dev, "No display modes\n");
 
-	/* set up connector's "panel orientation" property */
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, p->orientation);
 
 	return num;
@@ -609,6 +612,13 @@ static int panel_edp_get_timings(struct drm_panel *panel,
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
@@ -637,6 +647,7 @@ static const struct drm_panel_funcs panel_edp_funcs = {
 	.prepare = panel_edp_prepare,
 	.enable = panel_edp_enable,
 	.get_modes = panel_edp_get_modes,
+	.get_orientation = panel_edp_get_orientation,
 	.get_timings = panel_edp_get_timings,
 	.debugfs_init = panel_edp_debugfs_init,
 };
-- 
2.36.1.255.ge46751e96f-goog

