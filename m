Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FF31F8FAE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C709D6E21D;
	Mon, 15 Jun 2020 07:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A72789F9F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 19:04:07 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z206so8237677lfc.6
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 12:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uf8zIpYQk6KPBTmw2T9hHkd8Lw+t/UJ+qTlgdHhWoBk=;
 b=JSKo+AQD/wnWM9r9qfNTqUfAg59MFyFM9IX0DGecmEWEI2dIyWaqjGuPe0qpaUINfG
 RiemcG9UV0J4yu9CjG3/hBQWsdzGPTXxROVLlJAz4+rB/NtD//k7jPh8/4JUXFkm3YxQ
 goq8H6zvW6yxBg764f5UnaI3mQ6kusB97ucVARx0tV0gxk0C0P8CDQmi4904gHweFN0s
 gUpeBo2zAjdqHkiHC29AUbFF46A38sRq6rAcgWMF+CuKh14wEXoQ45HwyPX396sBcGb9
 lVChyNpnwPWMch4kmYbyJfG7CV1z8D9RTgYFtWU9DPPVcYrX7tuEDpkGK1JpA9vrytH3
 fNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uf8zIpYQk6KPBTmw2T9hHkd8Lw+t/UJ+qTlgdHhWoBk=;
 b=T2A5EHkGTzt5ewxJh3L3GInUx6TkHPT3X+CdQ9T0iFHUycTfbVOkF7xU6O2TEsn3I8
 4TyI4kZjz++Tz8XSoXQMRcNC7xgZV5+v7kKy3Rcvgv7uaJaxQnkqy+lIlqSq+AuSxby5
 s8eu+iB7oKsGOYaRS4zI2nwTwzPVQA/eOgE2UpEm1Wvxc4NYmMoFRIj12I4kXaQjvwHs
 02aIXbByP6PPSRR+55qwspb5by8VZnJ9ZqYORWB2D0cncsCDUqrBTvp9bmwiVbqRRhf4
 fG21yFa5yogikO2FgQWdfWaV6Yf2KT7cY0m6cnCMKPRUGChdDHbqJ8/bcymyOSUX3MVf
 JgGQ==
X-Gm-Message-State: AOAM531Y61qF3OK7p90e0LFiDhhkNzLF0061abVDKGWtjiPsH7NJChwM
 uyd8vumUqPW6djRUJ62P+mc=
X-Google-Smtp-Source: ABdhPJzXALOkf+KtpKcHwrvfp97TmMlYrYZAJ9iaS0lOVua0wtnMBmER+SrdQOz85eR78w/RqAZx+w==
X-Received: by 2002:a19:8253:: with SMTP id e80mr3203832lfd.199.1592161445925; 
 Sun, 14 Jun 2020 12:04:05 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id p15sm3410856ljn.53.2020.06.14.12.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 12:04:05 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Subject: [PATCH v1 2/6] drm/panel: Set display info in panel attach
Date: Sun, 14 Jun 2020 22:03:44 +0300
Message-Id: <20200614190348.12193-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200614190348.12193-1-digetx@gmail.com>
References: <20200614190348.12193-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Derek Basehore <dbasehore@chromium.org>

Devicetree systems can set panel orientation via a panel binding, but
there's no way, as is, to propagate this setting to the connector,
where the property need to be added.
To address this, this patch sets orientation, as well as other fixed
values for the panel, in the drm_panel_attach function. These values
are stored from probe in the drm_panel struct.

Signed-off-by: Derek Basehore <dbasehore@chromium.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/drm_panel.c | 13 ++++++++++
 include/drm/drm_panel.h     | 50 +++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 5557c75301f1..9748972f2e7c 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -114,6 +114,19 @@ EXPORT_SYMBOL(drm_panel_remove);
  */
 int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector)
 {
+	struct drm_display_info *info;
+
+	info = &connector->display_info;
+	info->width_mm = panel->width_mm;
+	info->height_mm = panel->height_mm;
+	info->bpc = panel->bpc;
+	info->panel_orientation = panel->orientation;
+	info->bus_flags = panel->bus_flags;
+	if (panel->bus_formats)
+		drm_display_info_set_bus_formats(&connector->display_info,
+						 panel->bus_formats,
+						 panel->num_bus_formats);
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_panel_attach);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 781c735f0f9b..97ac5f12a07c 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -165,6 +165,56 @@ struct drm_panel {
 	 */
 	int connector_type;
 
+	/**
+	 * @width_mm:
+	 *
+	 * Physical width in mm.
+	 */
+	unsigned int width_mm;
+
+	/**
+	 * @height_mm:
+	 *
+	 * Physical height in mm.
+	 */
+	unsigned int height_mm;
+
+	/**
+	 * @bpc:
+	 *
+	 * Maximum bits per color channel. Used by HDMI and DP outputs.
+	 */
+	unsigned int bpc;
+
+	/**
+	 * @orientation
+	 *
+	 * Installation orientation of the panel with respect to the chassis.
+	 */
+	int orientation;
+
+	/**
+	 * @bus_formats
+	 *
+	 * Pixel data format on the wire.
+	 */
+	const u32 *bus_formats;
+
+	/**
+	 * @num_bus_formats:
+	 *
+	 * Number of elements pointed to by @bus_formats
+	 */
+	unsigned int num_bus_formats;
+
+	/**
+	 * @bus_flags:
+	 *
+	 * Additional information (like pixel signal polarity) for the pixel
+	 * data on the bus.
+	 */
+	u32 bus_flags;
+
 	/**
 	 * @list:
 	 *
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
