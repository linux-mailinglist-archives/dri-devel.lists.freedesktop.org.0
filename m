Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F0B362B47
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988E16ECE7;
	Fri, 16 Apr 2021 22:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B040A6E102
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:40:54 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id z16so20129351pga.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2BW/qtgH/fZIuXm5QChY3DNkhDAV6mG9NJXYRN92ILo=;
 b=V0JV3IjRkQVXMvTWXV4VArXyWvOl+obbCAEE7BmclLNkDv0zvTDjItsA6IA0YfTG4I
 LLIg8IAHBH5MoyqmQn8thSizlH+vwE8lWbrrd2HOU2ahbh8gQmi4fWqqUbdiYJLhFYux
 9Iq8rJltRcsRINa8YP4cMs/eCvtMm4iJUCpy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2BW/qtgH/fZIuXm5QChY3DNkhDAV6mG9NJXYRN92ILo=;
 b=uY9HXdki/A3wMXsKPoOrWkc3tl2ULipkbwiYR6PPqNxhCJVy6BExImbiYnPA/wUaXA
 3aHrDldn6wn8SLHi+6jSmrLyx0aXD8jyIwwzRz+AmExfS9E2XQekozcffQB3ZApM7DlA
 I2b0RLEGIfzWzWNJlVteSadCPThOk7yYpI7+gXer221J6GPYvGGrvb0Ld2JiJ8BATTwi
 aQbdok1gC6CQpt9edcunQxGGUaOJEZDqRuYQxqN0OHPYmJ9objfOI+cwrBpzw/417/Gs
 Fervh5u2XEsi5Mw8dU2IK/WvjsisSCeclufWjW3KQJQk/x7lTcOVWhC5ElzM80UVUxxV
 /1ZQ==
X-Gm-Message-State: AOAM531ZmjTyDcbetItX9JFmTs2AeX7PYR+caQ3lnHSdyMMTAtawxH+N
 2cQkHzEINL35XPY+azQR4ruLCQ==
X-Google-Smtp-Source: ABdhPJyztcURn7SwAVEgemU7oiPsbeXh6lFsu6yV4/BPLlPn7nE9AQel/f11hn+AxBmk4as90oAAmA==
X-Received: by 2002:a62:8784:0:b029:259:1d11:f145 with SMTP id
 i126-20020a6287840000b02902591d11f145mr6979594pfe.79.1618612854386; 
 Fri, 16 Apr 2021 15:40:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:40:54 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 01/27] drm/bridge: Fix the stop condition of
 drm_bridge_chain_pre_enable()
Date: Fri, 16 Apr 2021 15:39:24 -0700
Message-Id: <20210416153909.v4.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
