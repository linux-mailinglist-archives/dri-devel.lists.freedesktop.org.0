Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AED934DEC5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 04:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D156E827;
	Tue, 30 Mar 2021 02:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C526E823
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:54:16 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id y32so9531241pga.11
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BEKsKLyxs1+v0ZxDrM7HVhKxECDMgvUxXPP2eTukK2o=;
 b=Uw2K3tYxkMnEPqt9yGgUQVzYBYDnNm7MC9I+61puu5TEYXLVh24tHZAbiDeW4v1ABO
 lGkIdnuwHF0cQokbjkRoWcjmjEpKlc+ph12Sbqo9gTn+ejwL7NFFjLPfpJMnv4EcGtdv
 3qKfSmbEv4ZtmHx9pqTWLHJJl9zjCYxw5Y7Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BEKsKLyxs1+v0ZxDrM7HVhKxECDMgvUxXPP2eTukK2o=;
 b=q7JAjpWW8P5Ev7ko7ilu9e9bZD+BrIDV4Hcc5ifhQxLfkUKfHQjn1XZaiNQJWuQINo
 o4nj+el0UjcDK+kiRYOU3qLyeg8HPm+tPeixssD2Gz+lftrpd6D9idJXjHcS4eZJolJS
 4XiNhHPSY3/dfXoHQBF+LBk7yt9rc7VnyMfxP3hNO+ByP9nodl+yaoFZxbFOp4ZsDgWF
 u3wpqXofqdNKo6lNJzHf09NJ+LAa7laMGILkFH/G9T+VDwq+cjGS/1xBe4U1vOUXkiwZ
 z7g1uTMoXDrUxVqJpLyB/YfyXyqtYxdkr22DaWF+Ddtomh/Knv/ThLzBgyNe5pTiw9Y5
 MDbA==
X-Gm-Message-State: AOAM531U9BSHflhJgxQGuINMyRY17rGAFSqmSTbaK9NLK0MCvzRtU0A/
 1Cww+U3lcWl8zLI1xARqI8X7rg==
X-Google-Smtp-Source: ABdhPJzP+ZMH9J8DCQEoQQe/Ka+R8gqStepZzM0+mhog7QnppOBoLReWVZeyJe79x2EaqFdRcRVrZA==
X-Received: by 2002:a05:6a00:1585:b029:203:6bc9:3ca6 with SMTP id
 u5-20020a056a001585b02902036bc93ca6mr27842566pfk.79.1617072856430; 
 Mon, 29 Mar 2021 19:54:16 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f599:1ca7:742d:6b50])
 by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 19:54:16 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 09/14] drm/edid: Use the cached EDID in drm_get_edid() if
 eDP
Date: Mon, 29 Mar 2021 19:53:40 -0700
Message-Id: <20210329195255.v2.9.Ia7e9bb7cf6c51d960b9455fb0fa447cc68ece99d@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330025345.3980086-1-dianders@chromium.org>
References: <20210330025345.3980086-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each time we call drm_get_edid() we:
1. Go out to the bus and ask for the EDID.
2. Cache the EDID.

We can improve this to actually use the cached EDID so that if
drm_get_edid() is called multiple times then we don't need to go out
to the bus over and over again.

In normal DP/HDMI cases reading the EDID over and over again isn't
_that_ expensive so, presumably, this wasn't that critical in the
past. However for eDP going out to the bus can be expensive. This is
because eDP panels might be powered off before the EDID was requested
so we need to do power sequencing in addition to the transfer.

In theory we should be able to cache the EDID for all types of
displays. There is already code throwing the cache away when we detect
that a display was unplugged. However, it can be noted that it's
_extra_ safe to cache the EDID for eDP since eDP isn't a hot-pluggable
interface. If we get the EDID once then we've got the EDID and we
should never need to read it again. For now we'll only use the cache
for eDP both because it's more important and extra safe.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/drm_edid.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c2bbe7bee7b6..fcbf468d73c9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2049,15 +2049,39 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter)
 {
 	struct edid *edid;
+	size_t old_edid_size;
+	const struct edid *old_edid;
 
 	if (connector->force == DRM_FORCE_OFF)
 		return NULL;
 
-	if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
-		return NULL;
+	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
+	    connector->edid_blob_ptr) {
+		/*
+		 * eDP devices are non-removable, or at least not something
+		 * that's expected to be hot-pluggable. We can freely use
+		 * the cached EDID.
+		 *
+		 * NOTE: technically we could probably even use the cached
+		 * EDID even for non-eDP because the cached EDID should be
+		 * cleared if we ever notice a display is not connected, but
+		 * we'll use an abundance of caution and only do it for eDP.
+		 * It's more important for eDP anyway because the EDID may not
+		 * always be readable, like when the panel is powered down.
+		 */
+		old_edid = (const struct edid *)connector->edid_blob_ptr->data;
+		old_edid_size = ksize(old_edid);
+		edid = kmalloc(old_edid_size, GFP_KERNEL);
+		if (edid)
+			memcpy(edid, old_edid, old_edid_size);
+	} else {
+		if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
+			return NULL;
+
+		edid = drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter);
+		drm_connector_update_edid_property(connector, edid);
+	}
 
-	edid = drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter);
-	drm_connector_update_edid_property(connector, edid);
 	return edid;
 }
 EXPORT_SYMBOL(drm_get_edid);
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
