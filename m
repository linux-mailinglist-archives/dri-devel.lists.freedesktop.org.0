Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C703697CB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 19:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007916EC1F;
	Fri, 23 Apr 2021 17:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708176EC1C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:59:58 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id c17so34474807pfn.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bYPxCdxtMKks8nftHI6+ZQaaJJnE9/+IALv4FLgIF54=;
 b=FvspuRuAWQhP6jQ5s/WPvA91XTFtWFz+QdqQAvdR0ZycpQE1pGtYWhuwDPlrqPY4Ef
 y68z04/DlCKz2zLgffkrU/DZWpJ2HOc/x1wsBCXKmxXRzdlb1KSt+mdDMDksFGjx0xpi
 7NlQq1WUOY+oTayFgiLb9M1V2hgjIAZupsRuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bYPxCdxtMKks8nftHI6+ZQaaJJnE9/+IALv4FLgIF54=;
 b=DLB+peoaDSPGaDkD/ZpWNv9O5/JNQdDGvc3ogZeYy+4zEcfOTnu3IwzPXwiFraTD3M
 aZZM+JABBqCiIQfCM81sktj9w7W/caEOwRedbpBBRSo0ZbIPUtyqxiX+xMgmA1iVG7wx
 E6PuLrymQ/emDWN9kj8W3M6aadfWHIWHYvyKdpnkMM9cGGn+ErhaTVpNhBIspUElNr77
 5H0kVfW5FZaDxRR9HIJJLQzLMwshUDL6SacJTlIl7wZX/0R1pMhi/a/j8ILXy9LA1HJN
 3JdpEbJ0qs+yxKvYZ9jPRrakcnPWPcwuRepNJS2zhW0lOfNOiK/rHxc4QGtdAf7mwSiS
 d8CQ==
X-Gm-Message-State: AOAM532Om6cvBnHR4b54Y89SGjPo3rGkLnkdf+HLfSUWFmjQn8ciVhjQ
 zp5WYcFAA9PWe9Zd5up+9KuXnQ==
X-Google-Smtp-Source: ABdhPJyVdUM/1lp2NxOCx1Zx4EFgPXlKhQBOV5qtNjvmUvZ8eSWax5LiJ/ZRUO5ihILkjxoJYoXPQA==
X-Received: by 2002:a63:4512:: with SMTP id s18mr4722524pga.275.1619197198125; 
 Fri, 23 Apr 2021 09:59:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6d86:663d:71f8:6a11])
 by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:59:57 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v5 16/20] drm/panel: panel-simple: Remove extra call:
 drm_connector_update_edid_property()
Date: Fri, 23 Apr 2021 09:59:02 -0700
Message-Id: <20210423095743.v5.16.Icb581b0273d95cc33ca38676c61ae6d7d2e75357@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
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
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As of commit 5186421cbfe2 ("drm: Introduce epoch counter to
drm_connector") the drm_get_edid() function calls
drm_connector_update_edid_property() for us. There's no reason for us
to call it again.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
As Laurent pointed out [1] this is actually a pretty common
problem. His suggestion to do this more broadly is a good idea but
this series is probably a bit ambitious already so I would suggest
that be taken up separately.

[1] https://lore.kernel.org/r/YGphgcESWsozCi1y@pendragon.ideasonboard.com

(no changes since v1)

 drivers/gpu/drm/panel/panel-simple.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index bd208abcbf07..4de33c929a59 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -512,7 +512,6 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	if (p->ddc) {
 		struct edid *edid = drm_get_edid(connector, p->ddc);
 
-		drm_connector_update_edid_property(connector, edid);
 		if (edid) {
 			num += drm_add_edid_modes(connector, edid);
 			kfree(edid);
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
