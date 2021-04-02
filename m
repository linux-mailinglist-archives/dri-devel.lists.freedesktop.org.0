Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF8635310E
	for <lists+dri-devel@lfdr.de>; Sat,  3 Apr 2021 00:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144406F39D;
	Fri,  2 Apr 2021 22:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958BB6F3A0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 22:29:33 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id g15so4380448pfq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 15:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6G7mQknm6wjoWphPZSZUuxY9hNho1AQ+iay1c8iYnQ4=;
 b=Y/riba2ZyERhmbUbp0nZgFQrpTe0WmQx/lQQLmVwpGVfRsd43VoIWOsO4jZfN5IS2V
 J78oY0zNvSXmoIpHmCZfKN8ypiUOWVjANqbOkrxwOs7ZO3WCI5ocdcARKy0Fhbx60QpO
 hgJxkCCRgFoVxizvJyry96LBAyaFNIDg6TkSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6G7mQknm6wjoWphPZSZUuxY9hNho1AQ+iay1c8iYnQ4=;
 b=kC5s8+BoA2YHO+DvNNe+fDQEMZY/DTu3YN4QyugQaQDhF4vpaL3z31G6rFBFismi3S
 wBbcK+oFaiW1kgNFfYLKuaGtTWB2kiwE7l+Dw3YBIB6mjd3OCgDaSQ6ELnxYdfsv5Vcm
 vgYV5j7Vg0crxOCyqBglVpDL/ClUuZzgE9MenAwAdtfWOsTwtBGFycUmW4ntXh6jQ/6S
 nE03w2OMWlAUVvUcUsRTRvkULiuDHoFfXKq4sLA707AuIf1JXyWbe/+6Lsluc9gEeBp8
 +csqSjTMfaYPXrBylujVkvJ/7PGVN/2rbtc1RIxg32YnTOn+1hJnbcznKaz1OzCQrNyK
 J4Sw==
X-Gm-Message-State: AOAM5326KTsz3ZfI/hLRMvNEubjcAN2cr7KaOFFKc4ijqekatFvMAOXL
 5reaq3D/mWR+7woFJM72lMEAwg==
X-Google-Smtp-Source: ABdhPJz4NdL95sgVBazICIqKq0ekk4Cx/rwWSUaLe9Uv1pcNYM9TEmiPwe664DKuaS1enCO1P/h+RQ==
X-Received: by 2002:a63:1d18:: with SMTP id d24mr13864452pgd.402.1617402573324; 
 Fri, 02 Apr 2021 15:29:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
 by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 15:29:33 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 06/12] drm/bridge: ti-sn65dsi86: Get rid of the useless
 detect() function
Date: Fri,  2 Apr 2021 15:28:40 -0700
Message-Id: <20210402152701.v3.6.I826adf4faeb7f39f560b387f6b380e639c6986c8@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210402222846.2461042-1-dianders@chromium.org>
References: <20210402222846.2461042-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we just leave the detect() function as NULL then the upper layers
assume we're always connected. There's no reason for a stub.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index e30460002c48..51db30d573c1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -306,20 +306,8 @@ static struct drm_connector_helper_funcs ti_sn_bridge_connector_helper_funcs = {
 	.mode_valid = ti_sn_bridge_connector_mode_valid,
 };
 
-static enum drm_connector_status
-ti_sn_bridge_connector_detect(struct drm_connector *connector, bool force)
-{
-	/**
-	 * TODO: Currently if drm_panel is present, then always
-	 * return the status as connected. Need to add support to detect
-	 * device state for hot pluggable scenarios.
-	 */
-	return connector_status_connected;
-}
-
 static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = ti_sn_bridge_connector_detect,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-- 
2.31.0.208.g409f899ff0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
