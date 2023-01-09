Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB77662034
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 09:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5996310E36C;
	Mon,  9 Jan 2023 08:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECD110E36C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 08:41:16 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so12060124pjj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 00:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbxRbyImpevpLcgNpmQRY5xjXofgzVP7nhTUY2hiItA=;
 b=JTe1mK8GkkIlmmdn3zdW5Zhz8+tYp6rDTDe7qfwfWgAIPBtzdSsCHsOV1Nbm+8zBsw
 8tI5IoTY+/uiECZQbLoMs4vXnTjvxlQQYuVpVavOAPFMv0OzkqlaOjQjOw4sIM5XuGIu
 Cz+yvra84/M3rWGvLOTPgVyRjkiQE6K+4GO8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cbxRbyImpevpLcgNpmQRY5xjXofgzVP7nhTUY2hiItA=;
 b=gWILVUupXHoQJpOghTauzv+7m1BcToIP0k1A9zde6t6FBV2DsmddSA6P023MNkuDc0
 OeK12khH6EJruHRQktKneBWA0aew1iR+PqxfNlxJtHZf3LrruG9iFWrpz20vPWBC2MOb
 IRcswVX+zLEB4kg3gw3HdxAWJRPI/NpfF3lkVWrMAC6wlMu0egK3DpHw9N2exG+GQ+0I
 QDcFJwwYd0nMVu7m7F0N7tuD3Lov0YuB9FeDm9DherKm1PMz9WBLJCkGDUPWJwI+FJt+
 ZCjGLpHQMPDOsUaAfcUF0kgLJKNmsydhpfw1zUfMUJ2OJAynb2y0AydROrRWSlbbH9Jy
 +O7Q==
X-Gm-Message-State: AFqh2koAHQx5l7MIk3SSKjhQGi0E6fDnqLfCHjeJglAAnGdPL8xsQkT+
 WnZXQtqD2Y+IRiUMmGTKXmC9AQ==
X-Google-Smtp-Source: AMrXdXuz7m3m2JrRAQuDNVFugi2raUnWnT3EDgHYDhtNliIvVLaFk/uDfqb/xzWYq7EGj/RGX5i+Hg==
X-Received: by 2002:a17:902:7c07:b0:193:bec:2122 with SMTP id
 x7-20020a1709027c0700b001930bec2122mr10562144pll.32.1673253676037; 
 Mon, 09 Jan 2023 00:41:16 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:801:a736:715:9a15])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a170902d48e00b00186acb14c4asm5568119plg.67.2023.01.09.00.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 00:41:15 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v9 1/9] device property: Add remote endpoint to devcon matcher
Date: Mon,  9 Jan 2023 16:40:53 +0800
Message-Id: <20230109084101.265664-2-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230109084101.265664-1-treapking@chromium.org>
References: <20230109084101.265664-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, linux-acpi@vger.kernel.org,
 Allen Chen <allen.chen@ite.com.tw>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 chrome-platform@lists.linux.dev, Xin Ji <xji@analogixsemi.com>,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Prashant Malani <pmalani@chromium.org>

When searching the device graph for device matches, check the
remote-endpoint itself for a match.

Some drivers register devices for individual endpoints. This allows
the matcher code to evaluate those for a match too, instead
of only looking at the remote parent devices. This is required when a
device supports two mode switches in its endpoints, so we can't simply
register the mode switch with the parent node.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

(no changes since v6)

Changes in v6:
- New in v6

 drivers/base/property.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 2a5a37fcd998..48877af4e444 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1223,6 +1223,21 @@ static unsigned int fwnode_graph_devcon_matches(struct fwnode_handle *fwnode,
 			break;
 		}
 
+		/*
+		 * Some drivers may register devices for endpoints. Check
+		 * the remote-endpoints for matches in addition to the remote
+		 * port parent.
+		 */
+		node = fwnode_graph_get_remote_endpoint(ep);
+		if (fwnode_device_is_available(node)) {
+			ret = match(node, con_id, data);
+			if (ret) {
+				if (matches)
+					matches[count] = ret;
+				count++;
+			}
+		}
+
 		node = fwnode_graph_get_remote_port_parent(ep);
 		if (!fwnode_device_is_available(node)) {
 			fwnode_handle_put(node);
-- 
2.39.0.314.g84b9a713c41-goog

