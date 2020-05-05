Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693AE1C5CEE
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 18:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267B76E5D5;
	Tue,  5 May 2020 16:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98F36E5D5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 16:05:58 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u16so2942403wmc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 09:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NqEhgBSEIG5151Cz1riIO0qRUDYSNMWuz+uU1QjW4mY=;
 b=b/k210BOpW/+tpzzKPNalFR/g8GmfZJi7pIHUEf2OdV6zJv7ObRY6lQUfwFU2OHtxb
 xYamKSdsQVGQmgS99iY7wf8mSkbzVusnIpjSRbV6tvkZWls4z4gNHKX4pgU5D1eNFDiS
 SVs+I8nuNxf3e120yK1ezUcXLaF6T8898jVTXhfK7PRvl9z9DvIFF3G2e+r+xyiwib4S
 SfsjIkX2yiFqp4Sq97ET0rI3x20icz0KhUdSiWCxvpqlH5BLHmo8UwDIJi1+8LtY1fbF
 13t0wU/TaAYocmNZEDZp0VoRZzlEZWVBAjcAZn5axgHjWqO4i/UsBtnYE0/+G3ssfE+S
 Te7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NqEhgBSEIG5151Cz1riIO0qRUDYSNMWuz+uU1QjW4mY=;
 b=PDd2ziBPTHvgTyuf1+yptkGbOUOwHn9W+NXTqGJLv+42uMVO96wHy94g0zKXlLqMNE
 aZdX5Dtgoc2ze89HwFsG/zIpKFDzWMBio2rUv9QG3yeB2KPlmCTT3G4vFGK0F0usaeBt
 /kAQiBEBzat1LC31asz2ZF8uUhZy3fMzHJL/93aCyK9xpnAfwGRIK4trUzCLXMjzOopt
 oLAwrCutWAOjQZBtbaDhloBymqQ00tpbptjwv3iZlHN4nKCsbRVE8//CWZz4LRA0NGDQ
 JBMj4qI6EyyDmtd2z6kv+MWLU4tcWgJqqaKM0o4eHWaJRCTDC8Gbr1MMiDR9iySbdxCb
 lT1g==
X-Gm-Message-State: AGi0PuaXjLxmnZ8wCLByAPmpRhPFKXjpFqfZJAftYae7duCjOQLOX72Q
 SVhIxh/ZdNsBe+w3N+s0ZnSzJN9I
X-Google-Smtp-Source: APiQypLGpLhwzV8Ipd2UEkkuyAU6Sl8bNdSrXv9O3nTa44t5RsgNj0lHvLnsbQ4sUsP0RsxGVCDiHw==
X-Received: by 2002:a05:600c:218e:: with SMTP id
 e14mr4550930wme.140.1588694757138; 
 Tue, 05 May 2020 09:05:57 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id w18sm3803621wrn.55.2020.05.05.09.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 09:05:56 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/panel: use mipi_dsi_dcs_write_buffer where possible
Date: Tue,  5 May 2020 17:03:28 +0100
Message-Id: <20200505160329.2976059-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
References: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
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
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Thierry Reding <thierry.reding@gmail.com>, emil.l.velikov@gmail.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

A few of the new panels create a local macro wrapping around
mipi_dsi_dcs_write. At the same time, they don't really care about the
command/payload split.

mipi_dsi_dcs_write does a kmalloc/memcpy/kfree for payload > 7 bytes.
kmalloc - avoid that all together by using the _buffer function.

Aside:
panel-xinpeng-xpp055c272.c calls its wrapper "generic" although it
should be "dcs". But that for another day/patch.

Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       | 4 ++--
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 4 ++--
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 711ded453c44..00e3d67af812 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -52,9 +52,9 @@ static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
 }
 
 #define dsi_dcs_write_seq(dsi, cmd, seq...) do {			\
-		static const u8 d[] = { seq };				\
+		static const u8 b[] = { cmd, seq };			\
 		int ret;						\
-		ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));	\
+		ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b));	\
 		if (ret < 0)						\
 			return ret;					\
 	} while (0)
diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index 5a7a31c8513e..eaa9da3ebbea 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -246,9 +246,9 @@ struct ltk050h3146w *panel_to_ltk050h3146w(struct drm_panel *panel)
 }
 
 #define dsi_dcs_write_seq(dsi, cmd, seq...) do {			\
-		static const u8 d[] = { seq };				\
+		static const u8 b[] = { cmd, seq };			\
 		int ret;						\
-		ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));	\
+		ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b));	\
 		if (ret < 0)						\
 			return ret;					\
 	} while (0)
diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
index 1645aceab597..9e07d7e86807 100644
--- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
+++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
@@ -62,9 +62,9 @@ static inline struct xpp055c272 *panel_to_xpp055c272(struct drm_panel *panel)
 }
 
 #define dsi_generic_write_seq(dsi, cmd, seq...) do {			\
-		static const u8 d[] = { seq };				\
+		static const u8 b[] = { cmd, seq };			\
 		int ret;						\
-		ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));	\
+		ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b));	\
 		if (ret < 0)						\
 			return ret;					\
 	} while (0)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
