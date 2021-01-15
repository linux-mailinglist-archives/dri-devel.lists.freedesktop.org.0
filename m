Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912F62F88A1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 23:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227A96E4AD;
	Fri, 15 Jan 2021 22:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D556E4AB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 22:44:49 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id l23so6061031pjg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=esnObWpP9J8bOo0IUsOKjdAe7AetAYNnvTwxBtu8gOA=;
 b=m/ZeZRnI+jQ6T7gJRoAmph4QjmtbXaB9Mbos68yxQkKgbx+Up5eC7p8aAQt9cs7pl2
 byxwu0qKaXYWP4qvIkI5v61Bj/DB8PiExypu9QmGcofaWULqGMlB92lYCiIM8ZLAwLwh
 Yj5E92BfnpRxATnWZh/H0DVg0dYVFe0sB/H94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=esnObWpP9J8bOo0IUsOKjdAe7AetAYNnvTwxBtu8gOA=;
 b=nZ2zFMF7LIoYF5tssQK4Dpkjhc7rAwDSdnihkEKYkv+mNEBOfNqI94IGpc5sH5eZ+o
 o9LcS7JGzqJyTy74H5rWbd2tlIud9SlD3vUl6YThjf/CIEXIcnULKi36t7TVr8WOOcXR
 U8JolL3+4SBkQDBTldOKTzBFUQYelOQPV9zl7mCHcnLvoGfnH6h2OnDhnKjC/uMpgaht
 wP19cBtbgZ8um7LXk0dTs3mmeSnvJxc3xu6KuK0/OntgGtzkalOLPtNAqI7HzFvTiZLk
 gYgna/o6/FoKwyIuvc0MmKAg8UCRx1i0s0FHLXvhJywGED+jMVoXBOqE+C3lBDw7Bhng
 OinQ==
X-Gm-Message-State: AOAM532sFZFemMM43MMtcyidwboVLSVmJbKcJJHvC9x6GZbJC44C9fpv
 un/J28nnTe5N7DlcXY2B7+qiUA==
X-Google-Smtp-Source: ABdhPJzhOlOz+MZXZQUM93OIlpGcdb90a+r5o5I+V3QxmNZQ2p4sp1C9wAK28TrCHGgtcB+uRZ8pag==
X-Received: by 2002:a17:90a:5993:: with SMTP id
 l19mr12779129pji.203.1610750689678; 
 Fri, 15 Jan 2021 14:44:49 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id q16sm9131100pfg.139.2021.01.15.14.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:44:49 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 2/5] drm/panel-simple: Don't wait longer for HPD than
 hpd_absent_delay
Date: Fri, 15 Jan 2021 14:44:17 -0800
Message-Id: <20210115144345.v2.2.I183b1817610d7a82fdd3bc852e96d2985df9623f@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210115224420.1635017-1-dianders@chromium.org>
References: <20210115224420.1635017-1-dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a panel has an hpd_absent_delay specified then we know exactly how
long the maximum time is before HPD must be asserted.  That means we
can use it as a timeout for polling the HPD pin instead of using an
arbitrary timeout.  This is especially useful for dealing with panels
that periodically fail to power on and need to be retried.  We can
detect the problem sooner.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("drm/panel-simple: Don't wait longer for HPD...") new for v2.

 drivers/gpu/drm/panel/panel-simple.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 581ab6810b70..30842cf6d414 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -382,6 +382,7 @@ static int panel_simple_prepare(struct drm_panel *panel)
 	unsigned int delay;
 	int err;
 	int hpd_asserted;
+	unsigned long hpd_wait_us;
 
 	if (p->prepared_time != 0)
 		return 0;
@@ -409,9 +410,14 @@ static int panel_simple_prepare(struct drm_panel *panel)
 				goto error;
 		}
 
+		if (p->desc->delay.hpd_absent_delay)
+			hpd_wait_us = p->desc->delay.hpd_absent_delay * 1000UL;
+		else
+			hpd_wait_us = 2000000;
+
 		err = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
 					 hpd_asserted, hpd_asserted,
-					 1000, 2000000);
+					 1000, hpd_wait_us);
 		if (hpd_asserted < 0)
 			err = hpd_asserted;
 
-- 
2.30.0.284.gd98b1dd5eaa7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
