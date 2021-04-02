Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C814353109
	for <lists+dri-devel@lfdr.de>; Sat,  3 Apr 2021 00:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B106E107;
	Fri,  2 Apr 2021 22:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185806E0B9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 22:29:28 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id m11so1732289pfc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 15:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E5nLkVryU7c5AZ4g5Lt9PfA8bKCz/RpFTxCm4PjfuZs=;
 b=gO+bEfipw3YrhMa3YXA8RgyPNuMRx6vX+IJGebJwUyxM4c2+fNY/VbWXvKQfAaOjUR
 oUM6rQTx1YQLssV5Yi6d7k2M9/RGE9jYV3GFcPGPjtCYDgscCw1iQHXhFZ8H6VYpqyR1
 VmAnuKqTR+IF1lNxxEqVovVLqVNr4dbFEFRAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E5nLkVryU7c5AZ4g5Lt9PfA8bKCz/RpFTxCm4PjfuZs=;
 b=G/y+/uJXEYC4UyhYwi5zA9GUXCbJY3BF92pCTql4yFrPDOFZkcnnDVdfyYjhaVK73p
 sHvHUZNPQn9HGV06pHzQ3ry541InIYeN55odvuprlJcifcDheuU153xbEPB0L4XVQjHL
 XFTsoQGOwh1VmzzTm1nsZJwyS0lldvJmnAOn5/3dKzds9IUW0nw2E0jPlyg4F224LMIN
 03LUng1NkbI04WOnm9v4BTf7VEO5Mpmb7V3eQogkhQWNNifmWqw3UfP08vdc7EWo97sf
 B9GUJdC7IIPqlHIeVBVAvcd5+we4WfzvTnVya72Sr6xddw9oE6jL7liGa+gbb6KLCL0z
 MCkg==
X-Gm-Message-State: AOAM531ULmwjC5mCtQTL/fwnvhW6ZKh3SSm/G0YIR4u7ytlDqvWVIJ6T
 1XtNVqxUkqzS1CQjQEmzGyvFcQ==
X-Google-Smtp-Source: ABdhPJx5v38XJsBmc6qzOsS46/IrA38fKgvgpOkEPRe3xCg5rY9n+CELmCVv9HXlR7JiwYgavF0iZA==
X-Received: by 2002:aa7:969d:0:b029:1f5:b02c:eed3 with SMTP id
 f29-20020aa7969d0000b02901f5b02ceed3mr13547896pfk.75.1617402567727; 
 Fri, 02 Apr 2021 15:29:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
 by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 15:29:27 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 01/12] drm/bridge: Fix the stop condition of
 drm_bridge_chain_pre_enable()
Date: Fri,  2 Apr 2021 15:28:35 -0700
Message-Id: <20210402152701.v3.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_bridge_chain_pre_enable() is not the proper opposite of
drm_bridge_chain_post_disable(). It continues along the chain to
_before_ the starting bridge. Let's fix that.

Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---

(no changes since v1)

 drivers/gpu/drm/drm_bridge.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 64f0effb52ac..044acd07c153 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -522,6 +522,9 @@ void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
 		if (iter->funcs->pre_enable)
 			iter->funcs->pre_enable(iter);
+
+		if (iter == bridge)
+			break;
 	}
 }
 EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
-- 
2.31.0.208.g409f899ff0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
