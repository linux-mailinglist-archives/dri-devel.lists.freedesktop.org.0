Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2E7362B56
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B096ECFF;
	Fri, 16 Apr 2021 22:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDAD6ECFA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:41:17 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so17162706pjb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WRxEiBxo2TK9eYFaE6Z8QmjhtPKi2ZOYbG3MBiDbq5Q=;
 b=dMXdGHRO1j71y2Iv2+48IjAI9YY8qkW+j1r2PquWxQUiBGEQRIkzBbRh2GOWbOacTc
 MtacNteNbERfxUY2N6QuKbKfYAwXWwb9TlSzfQqVWzhYjzbrpdsxY/g5qnlaq+jX8Qtz
 BJGuMy3uVZxA6SGPfmYi3n+73r1YGoNx1Fe1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WRxEiBxo2TK9eYFaE6Z8QmjhtPKi2ZOYbG3MBiDbq5Q=;
 b=qk1Gw8ML6JenRPBQgsKf25zcTuPjcyL+WhO9s8bsE2xmimfl/aNJiQILG0aguA6JRc
 bUgRyJgvj2YZQAtDIs2kHO8sQgip+X3DGzg1UuiFoL4DpdnS6d/wWzMBoay3nrVpsAMY
 h5sL9oG/iAGXjk8nt51V21kfzIIl1YXl0B3VU7oJIvlm0V4vY3+xSwM0Sq9LqdMXg1yZ
 he8577sY7+UKlRyswaW7YJ9NPyNshcC51W8G881C/8fP4yDDmjIqPJF+U29KCIb9r7pO
 6LcW+IZN5ED4yfDi5RgSVKdGJRNgl8e1/Tf37G6ZwdeN0NJHXSkKRLiaO7b7hA2CYtE8
 wu3A==
X-Gm-Message-State: AOAM532Guay6ReSCWQaCMUcuWdBqoNyEqdxEtTyD85CkspMCtNamnOc/
 Reh1i/s3yIlDpn8R9P1jwJn+mg==
X-Google-Smtp-Source: ABdhPJyWnRznUdTyIvfS7dug/lUV2TaYTjzVaxsnEcIWBHeIiVhb9ryAZZH4fGMUWj2xhxmdm+R7Nw==
X-Received: by 2002:a17:90b:344a:: with SMTP id
 lj10mr12317920pjb.101.1618612877403; 
 Fri, 16 Apr 2021 15:41:17 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:41:17 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 22/27] drm/panel: panel-simple: Remove extra call:
 drm_connector_update_edid_property()
Date: Fri, 16 Apr 2021 15:39:45 -0700
Message-Id: <20210416153909.v4.22.Icb581b0273d95cc33ca38676c61ae6d7d2e75357@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As of commit 5186421cbfe2 ("drm: Introduce epoch counter to
drm_connector") the drm_get_edid() function calls
drm_connector_update_edid_property() for us. There's no reason for us
to call it again.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
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
index 90a17ca79d06..c91e8aa108f7 100644
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
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
