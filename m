Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A93660DBC
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 11:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD3110E17E;
	Sat,  7 Jan 2023 10:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E6E10E17E
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 10:22:47 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id o13so433023pjg.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 02:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbxRbyImpevpLcgNpmQRY5xjXofgzVP7nhTUY2hiItA=;
 b=YBlSIcXwtTcNC6c/sLb0A+fA09dZ0F2u1NJHDrT/q2R/iaQ1cjbLt1qyxJ+NZKr+OG
 sW/aOZ9fN3xTZhfGKzIRuoDqca+1vXKtEQJA08aQuQeMQ1tC3YT2TD5gWitCdQvFDLU6
 1EdmUmEOxSdsdM3pqfJQ+lllt2BhcD8Tvj980=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cbxRbyImpevpLcgNpmQRY5xjXofgzVP7nhTUY2hiItA=;
 b=GOHvAlqDnl1RcWQZh7w3rJ8qTASzulRWP1XfRuWgGA5M9TJD1PKvFGbcsTUTjQYQwh
 e6NRzIz46ppMHnRtTCOqWTFw26GDoZk6DDKWrepgOYcQwAimb79MUOisP/APsNxQzZFS
 7/vBDp04We/F+P+qKMEwtxLqGc5JCcRMlQ7x4aR0vb/uKNXqtdbFf2RoRAWr5aHdq0E2
 IKmPX/VLF3JgsCSuW1DrV8raJyLNFTbK7cFWqNECKsYh32p/sSBeswP+7eaL/j1xBn+B
 Uw6Gd5+izVqBRq7FzXNWQdLpwypQI+7GBa2RW9aKQaZiQqEz5SvQoRIcetgSyjZm5qpP
 PIgw==
X-Gm-Message-State: AFqh2kofnFh6oLcLD/8mY9IUf0fRKGd7VAuQWUDOW7dVVs+TeG+ZvzUh
 OeeODm2D7EDisRynLiNYsxe3yA==
X-Google-Smtp-Source: AMrXdXvGarJZRipkxnWGG7cZHfw/m0d92b3irvWonmWk9YRAc88nnTJSpaQYTRjr83kRgvV6N2mG9A==
X-Received: by 2002:a17:902:b493:b0:189:cb73:75f0 with SMTP id
 y19-20020a170902b49300b00189cb7375f0mr53864845plr.8.1673086967014; 
 Sat, 07 Jan 2023 02:22:47 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:180d:95e8:f4:84fb])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a170903228100b001892af9472esm2366362plh.261.2023.01.07.02.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 02:22:46 -0800 (PST)
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
Subject: [PATCH v8 1/9] device property: Add remote endpoint to devcon matcher
Date: Sat,  7 Jan 2023 18:22:23 +0800
Message-Id: <20230107102231.23682-2-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230107102231.23682-1-treapking@chromium.org>
References: <20230107102231.23682-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, devicetree@vger.kernel.org,
 Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Pin-yen Lin <treapking@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
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

