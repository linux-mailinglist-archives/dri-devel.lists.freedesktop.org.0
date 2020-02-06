Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF17154BD0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 20:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C98B6FB1D;
	Thu,  6 Feb 2020 19:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948DB6FB1C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 19:18:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z7so8536150wrl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 11:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LfwwSgZBSRjQLTS6nz0OrfuIbfyqmaLe46Sq7iiWS8c=;
 b=nuTjaVVr5wcwTnZqfAsI/wPKCTvbOASiVjKWSq+spZCIb/y/vJbnCq+XxMnO94worw
 qTVv8ItgHInBYZxkuBb/xU0IMMKcCjbTWGgOGj6R2Swso7EiJ62AnQ8kd0txkrFL5Xza
 4lC4yHORnPNZAidzUdIjUxguEKhwQpHvzNqvL1EY5tZutgTyuQYoSWnRyK128d3SVFcN
 vGNAPcxUtj4bX4NPnB3omZAAd6OF3VAD2MhGdSSGRwU6Xdt9h8aCV4G8X8XcZKAKaBhG
 X2HyyUfCnjXm6cwzLGYZDjwDTmevBIGsDOHRckrHSdSYDuFdMIyeHYZ1kCzOnHPhgTCW
 giLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LfwwSgZBSRjQLTS6nz0OrfuIbfyqmaLe46Sq7iiWS8c=;
 b=uj7daHdFXHQCZ8s2g5BzSd2Aj80uo7JpYcJSLFa1A9CtFneV+foV4W8KYV/qeJQb2T
 HwL0GD0R5/OgQMJfvEiCrdeUUJYuAdpaByTXHXEBY3RCv1x8N0oPOriVNvoqJHykjGnU
 hOzrGzJ4V8+qM8Q+DVl6jezxp7sMqFSjAWjqX6VBiDTdg4/uAIgkb8a73OciKVWdcYu4
 2wd0sYU+crPAsQHdhCqdnZgK9WSPyxztgcWWSCykWPvcG/BPGj1oGMqU/ChHzOQODPpj
 gL4uDIrpeXDrp7FsaEElIPlcGuA8cEKdGZzeOUinSvFE6T2hTG1CZxWzDbnFHHvIsu0J
 zIHQ==
X-Gm-Message-State: APjAAAUuCZQAKfMLxfIFCcKKNx+n8o7GTrSG5ogXEpO434sgWw3mi3LI
 ZRL2zXoSw741i0Qv0Jn0tgsnrQ==
X-Google-Smtp-Source: APXvYqwVZMBEfqGjN2j0fB5MXvXxRI+9+Sp2L8ylMlDIx4Zc4gEKynwt2gn9sTqQNabIC4jgkHTQmw==
X-Received: by 2002:adf:e906:: with SMTP id f6mr5259501wrm.258.1581016720052; 
 Thu, 06 Feb 2020 11:18:40 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
 by smtp.gmail.com with ESMTPSA id m3sm272662wrs.53.2020.02.06.11.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:18:39 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v4 02/11] drm/bridge: dw-hdmi: add max bpc connector property
Date: Thu,  6 Feb 2020 20:18:25 +0100
Message-Id: <20200206191834.6125-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200206191834.6125-1-narmstrong@baylibre.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonas Karlman <jonas@kwiboo.se>

Add the max_bpc property to the dw-hdmi connector to prepare support
for 10, 12 & 16bit output support.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 9e0927d22db6..051001f77dd4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2406,6 +2406,10 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 				    DRM_MODE_CONNECTOR_HDMIA,
 				    hdmi->ddc);
 
+	drm_atomic_helper_connector_reset(connector);
+
+	drm_connector_attach_max_bpc_property(connector, 8, 16);
+
 	if (hdmi->version >= 0x200a && hdmi->plat_data->use_drm_infoframe)
 		drm_object_attach_property(&connector->base,
 			connector->dev->mode_config.hdr_output_metadata_property, 0);
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
