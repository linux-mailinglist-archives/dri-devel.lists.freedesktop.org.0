Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A346D5AD659
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0070610EA52;
	Mon,  5 Sep 2022 15:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E14F10EA47
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0y/a4pTSF6VtadOpwMNTC/mvZDJbVIcTrD8TXNTMH9w=;
 b=gSkkW/dRfqmcU0BN8gL6XM6+eNNMLiwUhiVNAXYkagIB/iMZeABBkjoyn4zyug2rBnWHL6
 C1evmdBPYJXRVqmdbIoIfL9I0/EV7h4JyZKXYo7YoQfyWPSfBpFnRY7ed5OPHDQRtUfHq4
 JEy/9JaaTtjgIhFNw6cOkK1oKo9cEh8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-175-YbE-E2mDND-JuoWHXTBlhQ-1; Mon, 05 Sep 2022 11:27:48 -0400
X-MC-Unique: YbE-E2mDND-JuoWHXTBlhQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 f9-20020a056402354900b0044e0ea9eb2dso2993634edd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0y/a4pTSF6VtadOpwMNTC/mvZDJbVIcTrD8TXNTMH9w=;
 b=fa5RtwV3S+jQDMNdI6VGvi+ut2oDHZOh0V7tJ+05O2rxcCddXW5lpV0sErH9PoSAyD
 +AHI15zl3s0LiCgwQ7spM3NcIYbbsAXW6EgFINU5FEZhNHO+ADWcyEUdtOqm547XNEqK
 VDzZN7arV2LFVvqDHeT891oKJdnXzT+BKn79r1ZS2glscx1OVNS8ms+TNWRLOEyAg3fW
 Jdi27kpxOOVBseFNYaHwvQEl4ZitjwNw7Ul/ruU2U7N86L0L/wnLD/pvP+OWU1AbjQHt
 aQzr0D50FmcAgCVGSmyQGIT840mtnLvMFfIBV8+Nbs0+qpCna7rapLtAEjuzBOlkyJHQ
 GLaA==
X-Gm-Message-State: ACgBeo07WxdpkKmQRey7aWNxm8ml1sS6drnHr4JQhwTRx6ZVX4AmMSvz
 SLDzsFjwCoJRl3hJwJWB13YKGpZ83MDg4OnQ/iA+5BNmU9isMTrt8tInhiQNueS4jOynMWUirDm
 HNMilEe/GtI6XdVlqD13TQHpghgNT
X-Received: by 2002:a17:907:2c44:b0:741:5173:8082 with SMTP id
 hf4-20020a1709072c4400b0074151738082mr27811200ejc.428.1662391667248; 
 Mon, 05 Sep 2022 08:27:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6KUF8JbNYhrJVPVL+fNpO9wlbYaKNx1Fi+IP83CtCcvsAKUfVUGf8JgD4mpG+Mk8t00cPgUg==
X-Received: by 2002:a17:907:2c44:b0:741:5173:8082 with SMTP id
 hf4-20020a1709072c4400b0074151738082mr27811186ejc.428.1662391667099; 
 Mon, 05 Sep 2022 08:27:47 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a056402138a00b0044e81203bebsm2338949edv.31.2022.09.05.08.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:27:46 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 7/7] drm/arm/hdlcd: debugfs: protect
 device resources after removal
Date: Mon,  5 Sep 2022 17:27:19 +0200
Message-Id: <20220905152719.128539-8-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905152719.128539-1-dakr@redhat.com>
References: <20220905152719.128539-1-dakr@redhat.com>
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

