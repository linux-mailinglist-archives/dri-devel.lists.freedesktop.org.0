Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD8B54CFA2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 19:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F81D1126EC;
	Wed, 15 Jun 2022 17:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D777C1126FB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 17:22:51 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id e24so11866278pjt.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2W8ZiDCOiI2bSKlNFhYrholIlbWHA9JNdcBup3bW7Yo=;
 b=Hpp3AncTQoSOnV7UdHW2TvyOhTzBZiIH0LBgD/t5tp0ITB9U3aOqAo7WF6v6e8UoHc
 fy+xPhaHHN0pBCYm3iDpjYgr3ApnSfCrnFnteSX1XQQw2d7eOXGWyoYf0VitILM0XChL
 19KtVerTsiYctQ0HQr3Ozthgj4KmrtiAJ0ptw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2W8ZiDCOiI2bSKlNFhYrholIlbWHA9JNdcBup3bW7Yo=;
 b=apLhb3Ti5DxGtE9CQHEwtSmRsOJlqcK95zRSSSUQC/nXYxsaVK2xDBoI6NmMQnFzzr
 ikYqi6W5ng/4y78JI0vxwXvKWkfbjSJn9EZi3jU0LGgdiT9+vsB7B06nBkmVD0+G3IoY
 vXnDN8u2fwrTrU9uqy0dmZ6Cz/h2Qvqt7kTMayXupbuLQvfwgU+UJrpDeMlqHisDQKSl
 WNkcDJi+40ROpk+ak3t5HtZC7EestOZG6PU6wI+NpXlAResG4eAs622hWnHYHve717yS
 cB2Nuh7IDtUzlLtSc0RpJR4htdkSssu99QhSpLpLT0gvLGEC5MP6044/5w6L8leB0Gdi
 tbPA==
X-Gm-Message-State: AJIora/zebB6TsDI2iqbG9a3k41HgeJ0qkpaKhWOIbLud7HG6H+xlIws
 nyOjOZrfyCtZI8CuF8bw4aXpaQ==
X-Google-Smtp-Source: AGRyM1tVcBDAyxkz3btNQE+y26IairXVXjxbk4noExnU1pNBJVc+tpf6h4bkXr5F9i8LHqZ7aBd3jg==
X-Received: by 2002:a17:90b:380b:b0:1e6:67f6:c5b4 with SMTP id
 mq11-20020a17090b380b00b001e667f6c5b4mr11445610pjb.48.1655313771456; 
 Wed, 15 Jun 2022 10:22:51 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7814a000000b005103abd2fdbsm10147433pfn.206.2022.06.15.10.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 10:22:51 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 1/7] usb: typec: mux: Allow muxes to specify mode-switch
Date: Wed, 15 Jun 2022 17:20:17 +0000
Message-Id: <20220615172129.1314056-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615172129.1314056-1-pmalani@chromium.org>
References: <20220615172129.1314056-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>, Prashant Malani <pmalani@chromium.org>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Loosen the typec_mux_match() requirements so that searches where an
alt mode is not specified, but the target mux device lists the
"mode-switch" property, return a success.

This is helpful in Type C port drivers which would like to get a pointer
to the mux switch associated with a Type C port, but don't want to
specify a particular alt mode.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

Changes since v3:
- No changes.

Changes since v2:
- Included Reviewed-by and Tested-by tags from v2.

Changes since v1:
- No changes.

 drivers/usb/typec/mux.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index fd55c2c516a5..464330776cd6 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -281,9 +281,13 @@ static void *typec_mux_match(struct fwnode_handle *fwnode, const char *id,
 	if (match)
 		goto find_mux;
 
-	/* Accessory Mode muxes */
 	if (!desc) {
-		match = fwnode_property_present(fwnode, "accessory");
+		/*
+		 * Accessory Mode muxes & muxes which explicitly specify
+		 * the required identifier can avoid SVID matching.
+		 */
+		match = fwnode_property_present(fwnode, "accessory") ||
+			fwnode_property_present(fwnode, id);
 		if (match)
 			goto find_mux;
 		return NULL;
-- 
2.36.1.476.g0c4daa206d-goog

