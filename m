Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C716213FF2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0DA6EBBE;
	Fri,  3 Jul 2020 19:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529D76EBBC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:41 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s9so38141428ljm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gEjEqlUEaBaGVsNHIfs4atPa0ji8BhQ7KnwUv8i+lN0=;
 b=j99fxYkgDVg50VGEyqeFkAQ7BjVVR+hl1jvzn5TpjWFBzw6Qg3eDscDj4rQFs9fTNe
 nJwZ4izi99acGp0DtHjKAV5A14kx+qBvCReasvl8+tMEPfluC57weesTudxHVQ1mbCVI
 rJPxNHCLMgPEnnRD5ZRpA+zDCfL4FQb7zRYbAS9XfbSPC/f1mnL/wVCGlsLzH8lC0wJl
 w+XoXW6X023HUQK4UqUlRgVVq61NItcOVhjeAk626ZUL9AzAbEhcs6D8RiFDo/RlpmTp
 gaQHALm/teYX7yrwh22eHDtJl+cr7X4mp9rS/hHdto9T27rzKpXOTb3bPGDMA8Mw6xF4
 Hw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gEjEqlUEaBaGVsNHIfs4atPa0ji8BhQ7KnwUv8i+lN0=;
 b=gKOtfTqyk7obBQtJBO4l8P+BMVOqEgxr+iJXcF4DjYSxEJu8GrAq7nh3Bu2x7rq03I
 jlJkPgKvMdcckT+lBEMWqYvlKSHEprc6dILBRUlQWQbe9aAI9zbjM3g0APO/eEkONq1P
 VIepCYPQZbyf2q7xl4BfLsunwi936qQD7SbrfDdqJXhuWg+EuGJ1LRKfUc4isCrwiuEp
 jOhswZj3hSCqE8UAcKZB3oBPDZ30QO6qHaMTVWZ/KNJVxSOXhr2p4P9Hvoks26SgMzJD
 xZ1B1zGwMp6iqvSglDBjlt8o2LMi9+sEKWnMHhasWbw1mURpQv7+fC+HXs+OjIMW1sF6
 /rOw==
X-Gm-Message-State: AOAM531CYK3ItYpgt3xe7Ig9qB8YjRPLDD38Q9M3cT2jjG+73oLRfQNr
 tpjU/iInt7VBDRbyfUJP8X6WT1TRygc=
X-Google-Smtp-Source: ABdhPJxkhGZaPpxU90cHtv1xdmJXvNTAr8sEc2EeX4N5PbRKTdigCQhfpOvMVXznDzjAWJ3WU9Xphg==
X-Received: by 2002:a2e:991:: with SMTP id 139mr20104182ljj.314.1593804279374; 
 Fri, 03 Jul 2020 12:24:39 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:38 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 14/21] drm/bridge: megachips: get drm_device from bridge
Date: Fri,  3 Jul 2020 21:24:10 +0200
Message-Id: <20200703192417.372164-15-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703192417.372164-1-sam@ravnborg.org>
References: <20200703192417.372164-1-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>, Sam Ravnborg <sam@ravnborg.org>,
 kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix so drm_device is read from the bridge.
This is a preparation for the connector being optional.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Martin Donnelly <martin.donnelly@ge.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 258e0525cdcc..cf1dfbc88acf 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -226,8 +226,8 @@ static irqreturn_t ge_b850v3_lvds_irq_handler(int irq, void *dev_id)
 				  STDP4028_DPTX_IRQ_STS_REG,
 				  STDP4028_DPTX_IRQ_CLEAR);
 
-	if (ge_b850v3_lvds_ptr->connector.dev)
-		drm_kms_helper_hotplug_event(ge_b850v3_lvds_ptr->connector.dev);
+	if (ge_b850v3_lvds_ptr->bridge.dev)
+		drm_kms_helper_hotplug_event(ge_b850v3_lvds_ptr->bridge.dev);
 
 	return IRQ_HANDLED;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
