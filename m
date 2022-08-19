Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2887D59A90E
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 01:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C7710E8A6;
	Fri, 19 Aug 2022 23:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ACB10E2A8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 23:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660950682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0y/a4pTSF6VtadOpwMNTC/mvZDJbVIcTrD8TXNTMH9w=;
 b=K0V69/D1v5GdJEuqgM+WnyML/MwsbQUQK64cQCNQ1vVv3+WEkOEg2CCdNBJtHwapQ4NL9F
 C5YeaT4sOpz8L5tiljpGhmwLnoA0uESvfPXXtXhfU7dggGSZuQx0PlIwyVLxwk5060XSco
 Uy+YVjP/ObtcLbcO+j1vOec7gLwdmLo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-DOF5dr8xN2qxSb-WAEH_lA-1; Fri, 19 Aug 2022 19:11:21 -0400
X-MC-Unique: DOF5dr8xN2qxSb-WAEH_lA-1
Received: by mail-ej1-f70.google.com with SMTP id
 sa33-20020a1709076d2100b0073101bdd612so1947530ejc.14
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 16:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0y/a4pTSF6VtadOpwMNTC/mvZDJbVIcTrD8TXNTMH9w=;
 b=KiGvcz6rGpwxrB3+FJ+jXw8cEwxoAGeKTpmFNEKtLUJNTIYTCzL/ainYQO2+yIWuKO
 SSc/QwLJmn+DnL1lVQLjtzp4I2llinJMUWGB/suUtkyMiyl5VZJ9aiw7WGyU2TPACPRl
 +KMT5oXtQYZ8+dy4Vf58WpXspd0jA5apGuWidIwiG++HQPi3PJe7o2VT7vjmJdDK9Z8F
 JN2iYfOWD5CSARYSHSA1trrXC9h71jF3+jBPj90jJ51WaxOV8Dkl5kV3GgXtMT+AWp6l
 NDHZe8pY01fgg9F84JXasFwSlcMzk5TPqY+u6WoAwIPxSEqmgWjUpd+aKr04lQ6AVqjR
 nW/A==
X-Gm-Message-State: ACgBeo3rO7KMC0IWleHsAapycgVUKwo4devBjdc7mXVPxkQX1O/DyTrY
 psmpEu/q+28WzwQ93kbHZkFBsGUZS+h0xskPI+xC3QkuYepT+nIKw3mhPzGthG43ooGpJwHOVRR
 vhqjfwOHsRcJ/kaXARRJFJszVIWyx
X-Received: by 2002:a05:6402:2714:b0:43d:ca4f:d2a2 with SMTP id
 y20-20020a056402271400b0043dca4fd2a2mr7764364edd.185.1660950678567; 
 Fri, 19 Aug 2022 16:11:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5t8ZWTVk4y4Y4BTXVKS9pOWxmu4s8KtL9YowyUh5bjRrc9ssHwXdvbPAqefLHaOgjt3XLApA==
X-Received: by 2002:a05:6402:2714:b0:43d:ca4f:d2a2 with SMTP id
 y20-20020a056402271400b0043dca4fd2a2mr7764349edd.185.1660950678398; 
 Fri, 19 Aug 2022 16:11:18 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a17090694c500b00734bfab4d59sm2923078ejy.170.2022.08.19.16.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 16:11:18 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 7/7] drm/arm/hdlcd: debugfs: protect device
 resources after removal
Date: Sat, 20 Aug 2022 01:10:58 +0200
Message-Id: <20220819231058.647658-8-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819231058.647658-1-dakr@redhat.com>
References: <20220819231058.647658-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Hardware) resources which are bound to the driver and device lifecycle
must not be accessed after the device and driver are unbound.

However, the DRM device isn't freed as long as the last user didn't
close it, hence userspace can still call into the driver.

Therefore protect the critical sections which are accessing those
resources with drm_dev_enter() and drm_dev_exit().

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index e41def6d47cc..020c7d0c70a5 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -204,11 +204,19 @@ static int hdlcd_show_pxlclock(struct seq_file *m, void *arg)
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct drm_device *drm = node->minor->dev;
 	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
-	unsigned long clkrate = clk_get_rate(hdlcd->clk);
-	unsigned long mode_clock = hdlcd->crtc.mode.crtc_clock * 1000;
+	unsigned long clkrate, mode_clock;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return -ENODEV;
+
+	clkrate = clk_get_rate(hdlcd->clk);
+	mode_clock = hdlcd->crtc.mode.crtc_clock * 1000;
 
 	seq_printf(m, "hw  : %lu\n", clkrate);
 	seq_printf(m, "mode: %lu\n", mode_clock);
+
+	drm_dev_exit(idx);
 	return 0;
 }
 
-- 
2.37.2

