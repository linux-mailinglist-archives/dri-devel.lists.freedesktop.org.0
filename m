Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF65754BAA8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 21:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8A110F339;
	Tue, 14 Jun 2022 19:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF17310F339
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 19:38:35 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso2101773pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 12:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6suMNuGHuSDsw0pLQAqfVU17KHFUlWhOVs8BXzvdiJ0=;
 b=CJRRBZCVIYsnpsfarBBshKo0pkqKKszQaCSWy27RJR+7HFDByXfb9KMqryM+oGYhI+
 kraivrZ1V32QRBaiM1Fr5KY7uqQEFXp6Q9zlZZUfhVf6eqtcnemzzc/7OLxuVV+EXnn2
 HsoXo/ySmJGJw1s8uWAhumVopWWsPqjKibo/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6suMNuGHuSDsw0pLQAqfVU17KHFUlWhOVs8BXzvdiJ0=;
 b=Y+mJRq1Sic/hTe4eQRuZTAfyntzZUGnJk7nBIKYObIJDgloSdXb9vvuWkFmK8OxXY+
 7k3eW+Edm2Je/VFxPdSUdGgc7qLBl7UlekkALInPudkZ05FRfswqMVQRZ4K3CoyRiJJ3
 4MTF4w0/Wkf30gspBkJRfmUPQfS8Rte4k5Wer594qAR0Zd83gGb6A/g7GyowW2hXAITA
 /8pfWCjLyFMqn6+gxYhS4iTbeRkR9m9OSlyVDoC8A1CGCFOwubOXIR5DIYyKeRfopEmP
 2YwmPqCyDWEa8v/CsFpvtBbl2AViYQmmTswtRazpMhca7aU5/e9JxjJAAa+RzHH/beze
 zmOg==
X-Gm-Message-State: AJIora+jeojQXfSktOCTKV4ECToaABrlBTOZuQ4FJYx231OC+YrtNyd6
 rzgxwA/Wk8mxvp4WG/idQkWBdQ==
X-Google-Smtp-Source: ABdhPJzWQShfjuuRnM5cKGPTLqxKZJI0nl9fyd7df9syqwjta/A2JOAfmod995fY5TCIJSpa7xgtXQ==
X-Received: by 2002:a17:902:ea85:b0:168:c1f7:ea72 with SMTP id
 x5-20020a170902ea8500b00168c1f7ea72mr5773877plb.86.1655235515470; 
 Tue, 14 Jun 2022 12:38:35 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a17090a409500b001df3a251cc2sm10014426pjg.4.2022.06.14.12.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 12:38:35 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 1/7] usb: typec: mux: Allow muxes to specify mode-switch
Date: Tue, 14 Jun 2022 19:34:35 +0000
Message-Id: <20220614193558.1163205-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220614193558.1163205-1-pmalani@chromium.org>
References: <20220614193558.1163205-1-pmalani@chromium.org>
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

