Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D33A81B99DD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65576E0F9;
	Mon, 27 Apr 2020 08:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C62A6E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:20 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id l19so16583900lje.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=330R+YmN8ny9O6IcJx2nTrsJRAnoGTicuiHbeLo8iOM=;
 b=HgTRtFgRTqd2A/KKWWN+mvaw5UobD8OXqbW0VjUIiazWo9nJD8ct4ETds3sk67SvNo
 ZKtIqwnhIjN3SCpK2kxDBPHOIEpDimPZZDidPlHUjauMMuZFdde1rAkZ+CP9XoLb0H11
 hMtBz32BjFFDS8OZ0NFSZAgw1mFyasVbQ3LW1EUJZOtnbWmClWODqRFE8TFk8yeoVURZ
 FOMQOnid5ckvX/yRG/tVmIG7qg1qnJGt5XAEuM+blb1WWdIYtedZmatwmnoO34YzL3M4
 44GeFfiM55nw00TWG3vzyd6eY1RUVdZ+6uQHXz94UkPajY6YpLFgUu+iTPWCnxiUVfk7
 sy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=330R+YmN8ny9O6IcJx2nTrsJRAnoGTicuiHbeLo8iOM=;
 b=HYHG9BsTbyGBu5iS9ke220GyrmIP1DaIyMRPPqJBRtn/wMxRgF39ccji56xeNibxoA
 /NRZ/0FbCyZTdcxYM1Wm/A5UejBF2GUR3OsQKOWCE0MIk+2c5YuC4OfyP0FS325njEW9
 L33ueIjr5MFORrZv2S37SOKF/8uMPGlszYahApAnhTu7GX5vawMxUTLysdKu2v36R7z5
 iPtqCWCKhDREIN4XH8yXM+vJu1QXcPEb1UDzrzqaz0r4vvCspRHNHyNielKctvA4ERWY
 vtA7PLgKDOriH00kn4MMtPKYbfCHLPQprDtFhdMP3YUl9F8toVGFqRPunctme4+sPhpl
 BIbw==
X-Gm-Message-State: AGi0PubwvqqjgW8LRsANxVuw2reO/ni6WZO0ZEa5zBDvDD2FOSLQSW8P
 dDjUzRy8E1F5nVstNsoiIL5i33gz
X-Google-Smtp-Source: APiQypKayQIfGpl++9bW9sFShLZ711Q+sA2H62/+WrcC56VTYa3j6UbCGU7xL44o7Liwfr9s5cHOcw==
X-Received: by 2002:a05:651c:32e:: with SMTP id
 b14mr13596309ljp.277.1587975558716; 
 Mon, 27 Apr 2020 01:19:18 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:17 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 14/21] drm/bridge: megachips: get drm_device from bridge
Date: Mon, 27 Apr 2020 10:18:43 +0200
Message-Id: <20200427081850.17512-15-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427081850.17512-1-sam@ravnborg.org>
References: <20200427081850.17512-1-sam@ravnborg.org>
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
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
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
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
