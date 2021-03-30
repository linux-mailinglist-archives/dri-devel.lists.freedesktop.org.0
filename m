Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E65034DEBD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 04:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11B96E81E;
	Tue, 30 Mar 2021 02:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1876E81E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:54:02 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id v186so10677190pgv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qI/3Hs2aK5j95IIJ6CXgbrMKhpGuwzEJEjubXc02oD4=;
 b=XVP5azCVkEZItoAwFhpabdgCE8YXvf2qCEpXn6Xgov2pwKSL15Y4UHoC05ptJsLGKx
 kEtelr+AEbMj7ivpuDloxY5vjyCH7q7CXiqDGjOvSdJnxhx1w41xPHavLLmnWDgXtNJB
 xf7gMchT4RbZOOtz0mslmlsxDTRC1wWZZ1otA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qI/3Hs2aK5j95IIJ6CXgbrMKhpGuwzEJEjubXc02oD4=;
 b=KCz6MvpwMeuuNOaTr9GU6+qhNGr/FU4MOtgIoEe32OEey3GonUZQvmGFTttVji/AfJ
 h+uk83p5moKhDjCg5TjiLf9LWi2QXlTcNuQIsmiYFg2p+OMpOVGRIlVGRMYFErtrsKY7
 tEQuTE3Fwx3xBkZ8ryTnz7Su0msBt8KyiyWKN81SW6ztLbfaGdowBP+YQIA6jvwfqxlK
 bb4rebUSVDOABH05mUFc8lGDnB4X+vV56HS7el6g37At5z/zMj7cp6WnuxUjpArJaXZD
 yPgEWbz0K0lTErhDr/CGTFp2vFxDLbPp9wDoQ+KUCHz13F+CIYDCMV2H9ri9QvvDZuzx
 KvCw==
X-Gm-Message-State: AOAM533SFjdsGTDCMKJwI2HpKSsv771X7skzE55PjYMIA+K5AHAE/Iia
 SZ4ynJeAWA3qnnfCRrxBMPwQoA==
X-Google-Smtp-Source: ABdhPJyZiJrPuAbzqL8NKVXxk3Sum/s/UcvHx89hqsPS7SaR6LwBWLGagqLg79BtkIOOhi/X2lPw2Q==
X-Received: by 2002:a65:56cc:: with SMTP id w12mr26587564pgs.354.1617072842326; 
 Mon, 29 Mar 2021 19:54:02 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f599:1ca7:742d:6b50])
 by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 19:54:02 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 01/14] drm/bridge: Fix the stop condition of
 drm_bridge_chain_pre_enable()
Date: Mon, 29 Mar 2021 19:53:32 -0700
Message-Id: <20210329195255.v2.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
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
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
