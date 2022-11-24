Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4283A637626
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 11:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE5C10E25F;
	Thu, 24 Nov 2022 10:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E709610E25F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 10:21:14 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id b62so1254572pgc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 02:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bhjmEX7h7UKuTd3pV2F0JRbYwLj/obCLhiM6HTgRw0A=;
 b=hyEW92Qgxc5TQnLZWHdyOLmDAEq5T8M7V0iOgxHI7fmQKv4wqB5EmzbNffcjGDXl1y
 vmD6r+xRz62PtEZwYK8WpFdk3i1WCAg8MvTKFFyhdAR3U03Upmodz/Sk2+R459pZt5ue
 KoM27RRJTxSG0VqLVljHKplaFJmL3x9ILSBTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bhjmEX7h7UKuTd3pV2F0JRbYwLj/obCLhiM6HTgRw0A=;
 b=holfNh8yRjmo5cFgHCnN6XBrAspb7v1p+e+wEOb06M58ulGRH4N4++FF5wnwtqR/vb
 CY+Ayz1c6nG1zC3TRXKziwIRBAuiqlXk/b9+8TiA8MmsblJDHmQFJoHPJawooj9UHiZt
 iRIiKaj6gMcvECS1u8dx4S82fYfh3YL9FlhrBYxieLuuAFfimZxWTdHmbUOWvd7/f/lq
 03VPItLzQWP3Maf9ldzdWC7FSnHzrugLSITw1YOZ/cTp1ausYbKCvSazGeVMaRNVraXy
 xJ7SdDWLVo9ne8H8YuJHPUGDfHQEU+d0AhGFtN/7SzSB+iXRMaHP7nDeJR6fRtvKVMp/
 WnbQ==
X-Gm-Message-State: ANoB5pnWRGYL1z4boDgPEMZrRrstp22OzYviHd/w9kaOj7ByGuaNJsK6
 16X995iqP7HLunsJfnYB5cpMvA==
X-Google-Smtp-Source: AA0mqf5Dpv3pBFrlepUdrqazsU1AaoAF/JpY4AkUKXgwym+PfS6uoAGgqvHrWP1Xgn/dQtFUItYqyg==
X-Received: by 2002:a63:4043:0:b0:470:2ecd:333e with SMTP id
 n64-20020a634043000000b004702ecd333emr30066989pga.596.1669285274569; 
 Thu, 24 Nov 2022 02:21:14 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:d446:708:8556:dfee])
 by smtp.gmail.com with ESMTPSA id
 t123-20020a625f81000000b005747b59fc54sm854584pfb.172.2022.11.24.02.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 02:21:14 -0800 (PST)
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
Subject: [PATCH v6 1/7] device property: Add remote endpoint to devcon matcher
Date: Thu, 24 Nov 2022 18:20:50 +0800
Message-Id: <20221124102056.393220-2-treapking@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221124102056.393220-1-treapking@chromium.org>
References: <20221124102056.393220-1-treapking@chromium.org>
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
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Allen Chen <allen.chen@ite.com.tw>,
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

Changes in v6:
- New in v6

 drivers/base/property.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 4d6278a84868..2ab8be8ca45e 100644
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
2.38.1.584.g0f3c55d4c2-goog

