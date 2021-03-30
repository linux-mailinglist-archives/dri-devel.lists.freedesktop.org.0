Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC37434DEC7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 04:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F496E82D;
	Tue, 30 Mar 2021 02:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4CE6E829
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:54:23 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id v23so5391300ple.9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qYK7VrB9zh1nJosxOHMeXf6pgnTeHfrprZk+pogrvOE=;
 b=Gc6dqK9kmETo+Nhx6WAnosO6l6Pe4N4Cqli441GiQUT9ff2Xr0mlCXlLX6zzUM2cd4
 LjzpG4qVSmYxPdvz0fL9cz8HRyyWHusIDXOzBiqGI/fX0TePOdFugaUwLbb39DagvxDI
 PyF2+19s9Frn5Yq4n6ToLHNOkTbxE9nBksZv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qYK7VrB9zh1nJosxOHMeXf6pgnTeHfrprZk+pogrvOE=;
 b=ZLWrsp1IXbO4AnwX1Fx5PD0t+jwd+NHLkixCxctDsq1iyC3zXg+3ZZs/w11X3sggZW
 kb1krNB0VWFbVosgucwizXC5k25F7TRMxV8R85llnRs5KXA+wIkYoP12dEkywz/Wr0Pz
 IcJY2NZVejHbpFNGJvBX6IOdVIK0Rgs4zb1JUppF6p79aykb5UKznKb9OenI7PvHc6bO
 l2MD/SbhbFUhLbqMYevHmt1AnPJDlBxWvNXnkr70xnbhmpyYqhMWIyG5U1bic0/zTX8K
 97q6ahXdM+WWYPRCU7TEZ/jY00tCQ3DYaoBtCrauj5SktBmwCtm4QtLzhykZ0o3Q5/JO
 OtnA==
X-Gm-Message-State: AOAM533DDzzkSx1778ASH8DHkHHs/xxr9YfhtJkGuYKNWtcbrCRhHvi5
 30sUHBbl30uozh9ttB1Oe94yiA==
X-Google-Smtp-Source: ABdhPJzp+H901r/w9Tl3yZlkxjUAYJrtNugSXQZRWimDt36JIwcL8mivHva4TYJaIp+QJ1HcRxCFSg==
X-Received: by 2002:a17:90a:9a91:: with SMTP id
 e17mr2109663pjp.218.1617072863117; 
 Mon, 29 Mar 2021 19:54:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f599:1ca7:742d:6b50])
 by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 19:54:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 13/14] drm/bridge: ti-sn65dsi86: Print an error if we
 fallback to panel modes
Date: Mon, 29 Mar 2021 19:53:44 -0700
Message-Id: <20210329195255.v2.13.Ib4183a04e8698f60b67558f363fddbbaf33dd445@changeid>
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

Now that we can properly read the EDID for modes there should be no
reason to fallback to the fixed modes that our downstream panel driver
provides us. Let's make that clear by:
- Putting an error message in the logs if we fall back.
- Putting a comment in saying what's going on.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 92498900c58d..20c3b13939c2 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -318,6 +318,13 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 			return num;
 	}
 
+	/*
+	 * Ideally this should never happen and we could remove the fallback
+	 * but let's preserve old behavior.
+	 */
+	DRM_DEV_ERROR(pdata->dev,
+		      "Failed to read EDID; falling back to panel modes");
+
 exit:
 	return drm_panel_get_modes(pdata->panel, connector);
 }
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
