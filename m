Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5FF3E9B59
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 01:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A4C6E201;
	Wed, 11 Aug 2021 23:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7A16E201;
 Wed, 11 Aug 2021 23:51:04 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id bo18so6371525pjb.0;
 Wed, 11 Aug 2021 16:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IqetlxJQH0ljhEzbSRKQFzu7rZWHhAi/EdZURPQQ3To=;
 b=tKGMDYzvqsSm1bXhOeAsc4+dTrkzKeunk1S5y4XY4Lfq2+FDkkLNnnfdIcLClY5xG/
 lnIODU/oy3SLUh9w0jS5WL9Em9jEtJj6NpusS2Ofet5pRAmv305sU9niN60cIpK8MgRZ
 bxHsHj6UM9jGg89cyB0CciRN0wG3oFW96QIjNY+SfFwapsK7Ha5uGbV148pZnD/1GPr8
 5sVzo4rljImLP8LtYhImG0QBoj2dkO5gCV4i67emkf/4Qj9+AFT0qXTbFANtaY15cPP7
 XRSKn3QXYNh144LUZVSaqkUd2XLSBBh8oUu7OxmGSnY2T1sau6xJ9atiIra8+CximkJl
 zEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IqetlxJQH0ljhEzbSRKQFzu7rZWHhAi/EdZURPQQ3To=;
 b=cYDNWCAqOrD/mDyY2g0hZwqiqp66BlzAPPjS+D8tegBXJsoskw5e/MmoMkCoyjEsRU
 CXTdBYiqnl3Kx6RxcMcrWx0Dy5N4dd5R2atAT+7JHrkpCy/l1IsVukHcyP8vSnM26hfr
 sjjbGZzugzph+ZwIs8uT4XBCCP8wHLmZMlC4kJMiY+XlF1IoK7YQBqMHDQR15kLvHmpu
 lRHamJnlXGVSXBUTvc4jy4w7PGUDYfwcVtLqmTLF6B+qmqsQzeAcFBEYQbvHVfDpx1os
 vg6Pr1a3UEGrmWqit2qneH0rhERbGnD52e5esORdZao3pLaGgUPhV6gM7Rx74Co443MM
 DHVw==
X-Gm-Message-State: AOAM532wGbBNcksCgJKdKNCmKzCHN3fSITvoz7lZ1939wI7j5fqYr25i
 ByrmgkV0l9kPOnDvf6s+IkYaUFMT20cpUQ==
X-Google-Smtp-Source: ABdhPJzRdBfwV7Mf9hAZec+YTQSgigWYzf3lb1xKO81xK8cSWjhr82Ro+zhTkBsFk5Vr9fhwW6n2Fw==
X-Received: by 2002:a17:90a:6684:: with SMTP id
 m4mr13287665pjj.127.1628725863447; 
 Wed, 11 Aug 2021 16:51:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id q1sm750673pfn.6.2021.08.11.16.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 16:51:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Avoid creating multiple
 connectors
Date: Wed, 11 Aug 2021 16:52:47 -0700
Message-Id: <20210811235253.924867-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210811235253.924867-1-robdclark@gmail.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If we created our own connector because the driver does not support the
NO_CONNECTOR flag, we don't want the downstream bridge to *also* create
a connector.  And if this driver did pass the NO_CONNECTOR flag (and we
supported that mode) this would change nothing.

Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 9bf889302bcc..5d3b30b2f547 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -736,6 +736,9 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	}
 	pdata->dsi = dsi;
 
+	/* We never want the next bridge to *also* create a connector: */
+	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
+
 	/* Attach the next bridge */
 	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
 				&pdata->bridge, flags);
-- 
2.31.1

