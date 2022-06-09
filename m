Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA015444C8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4650010FE54;
	Thu,  9 Jun 2022 07:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BE810FE54
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 07:28:02 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id e11so20359471pfj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 00:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G916ndi6znAFvnEdjgirXsQTXINNxUlsFrUsl3kkHpM=;
 b=Ab/Ic+N3PYzvVY9rC4wLHn0KuEQnNGOKYgz5k7NDX1sDl+NPwdPDWR2BTqZJmMuyl7
 pJCNL0LMj1LMqRy0fVBiGW/q7oiDb1RPX14nYbfqbrOyJwmIWOPP49WI3ESH+OQb3CwZ
 BdcdiPGm/oVRjmwfOeH/hiY03hlkzKvGPKMWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G916ndi6znAFvnEdjgirXsQTXINNxUlsFrUsl3kkHpM=;
 b=cyScrl1QNMrZZg/MI9eK3BYDb1MjNfjVr6DmLJrIz3wj7+yjKWJQIZk51CMhAOIyeZ
 d8UNLRclc8oPPWa0ES0K8q8kXM7C2HB2x40KLF/lr7FNP3vrYt2NFM3y4Gm/v2JA50p4
 6kDLe8n2qehs/ucan8xmQaihHO/8fH7NuoOYaa/jSv2PL8J641WJNAyPGH37a6gihmt8
 wYXDO44uKngi9I+heb6acVHg1q0DYNMBESb+zeIVD9TSAdeLkmcOGlF9Z7SsmUhPl+Uk
 f8sfhCNj5tbEjxMM4/9156FuClPaoYzmIm/XAjLqTRi4JyAC8Gv3xG6UMD0FK1XhiVPF
 sNDw==
X-Gm-Message-State: AOAM5334N2v1GZQt9XcOGwAQCf2uG5wsmOEXjHvrUe0zItzbnRByC5gR
 Mx6ysu+1jQxNtPhOE83P1L61LQ==
X-Google-Smtp-Source: ABdhPJye6fPlx4aQdZZkt+w0q0qfXmG0AQ+D0AlqoMudVOh6zefu4Y7cFZKkoiaVOrEQnuzP7CFd/g==
X-Received: by 2002:a63:2cd7:0:b0:3fe:1c0a:75ce with SMTP id
 s206-20020a632cd7000000b003fe1c0a75cemr9121819pgs.602.1654759681962; 
 Thu, 09 Jun 2022 00:28:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5119:d95b:c6cd:77fb])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a1709027ed000b0016403cae7desm15312221plb.276.2022.06.09.00.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 00:28:01 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v7 7/8] drm/panel: elida-kd35t133: Implement .get_orientation
 callback
Date: Thu,  9 Jun 2022 15:27:21 +0800
Message-Id: <20220609072722.3488207-8-hsinyi@chromium.org>
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
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 80227617a4d6e..fa613d1d7a8ff 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -217,15 +217,27 @@ static int kd35t133_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 	drm_mode_probed_add(connector, mode);
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
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

