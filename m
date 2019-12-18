Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9B7124C01
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95B56E7DA;
	Wed, 18 Dec 2019 15:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D316E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 15:46:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f129so2427171wmf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 07:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MpYk4ZxORLK9U8orRADFrmupc+cuzyuzN13HM6sJYsk=;
 b=MOzKOrop/aoyr4aHIj6FlChhibXTxUnlZmKs6ikdRKUMp+zSYo/wlD5qVVbl1bw4xU
 2bQvOxNy3CKZAp/KwuCQ2D1lSZhlN70czrJ3IptHa86I+/J56DeLusiU1MhQSBSyY8Sr
 L5cEME2FEgqbnNkB3HRXe7jbvbP06MkcR1T000/54CvnL3zxejL+vAZvOofvDv+kDCFV
 FxlUgi5L/Euv8iHd7qBCWJrzLez753ga4pqG3QfpAwAsHqFHpwjTYIoV/CzRmnX+V0qZ
 vIKNRmdzeKo2CvN7ecthWLeOuGHMj9dab+jboQEZvwpuHgeEj+fNg1A+7661UXLy1MOe
 vW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MpYk4ZxORLK9U8orRADFrmupc+cuzyuzN13HM6sJYsk=;
 b=EKjpdEK3g5jMRWS+j8hhUZ/ybB6efINiw94adEHos3nICSWy9c+EhgZV7MWfLnG+5k
 ZMBOCmUeNoNDuqc8qqZn+FDNrdk7krYpBtvam1k/QYpyLWIzb+WzqIlLFEFfwDGEmcan
 QtimLiPAPQJwuLlW+MAAgNMlZkLoEek1l4VVYmsT6Oyni51sw862TmeApJKzEqI6Tdjd
 cydqdGfTJcHi7w5ATJEBahIwH34IGTbeqV+ms/l+c0d+OUdABojgwtMciHiaLQIX++oo
 GTGvydrWlMLX0rDU5mteB3gdIYUp01ng6whu7/3K7czjxExrUAQO8lrSpGhJLJgEnJKr
 vI1A==
X-Gm-Message-State: APjAAAW8gBYb5OAckIlBlNn46mmUd2M5fpC956QvXEwbzct6nubxNT/F
 x77YPvldeLqPqhjGq+vLUF0PNQ==
X-Google-Smtp-Source: APXvYqxCqnYVSKzPfGvRns3vdEALXKpTqlz/AJkEO7HjSjYsW4oXY6y7UG6ZL4cgrP7B3eIwD7+Iug==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr4310085wmg.66.1576684002484; 
 Wed, 18 Dec 2019 07:46:42 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:41 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 02/10] drm/bridge: dw-hdmi: add max bpc connector property
Date: Wed, 18 Dec 2019 16:46:29 +0100
Message-Id: <20191218154637.17509-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218154637.17509-1-narmstrong@baylibre.com>
References: <20191218154637.17509-1-narmstrong@baylibre.com>
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
index 6a0b4b3a6739..e7a0600f8cc5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2368,6 +2368,10 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
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
