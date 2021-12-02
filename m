Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694AA466CA1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 23:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0956FC80;
	Thu,  2 Dec 2021 22:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE996FC78
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 22:28:01 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id k4so1138812pgb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 14:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8jRHJbzxJCo8C1IXTJW3KiTq5EwC3cp5SncHLYDZJzc=;
 b=ZvsFOChi2a09b6GoTBICzT/9fIuSbCNP0iSOhGqrl/i12m292JHnXAGLUMcqmyMD0O
 17OogpMQSH/ESLZpl1kLxvzz85n1vDsoy8ZaukjzCIbY16lEVRuJy40YowieCjPmPmHt
 K9O03qRVmeNmeOKGakhaWaK4fn3UZtYbAnwvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8jRHJbzxJCo8C1IXTJW3KiTq5EwC3cp5SncHLYDZJzc=;
 b=ERzWIptcUf/1VatywP//xCwAuv6UTjCTj0f66bM61Tog3sRTI1/giNBR6DU2stj1c3
 h1FN/+oiYDsFRbuoIgB7lctCqA3PnZq728RxBfg6q2+PFaLXt1ZC+3W//naRnOw3F3Th
 GMkPsm8NQCMCw8VNu+vpDHqzBncuSIp0PV126Lbhpxf0ZMhjg+k/SnlViluWxX2C8kPv
 KfolZb8WUeQhbjtiaNnAoVFkLBEDSwQoe9/gDOMMnEcf/Hde9rjQMN7ShSCtNjr2rYrm
 QjFDKXgEYIA2D59m02KF9V/mma8tzVKT/eXIfEx0NmqASbuOa1Oh9b+FQ67mbfFANtiG
 lMmA==
X-Gm-Message-State: AOAM533jQbe8FKAdpqXcrfILy4YFvaJFmYFDWMPNfDycja0bpjivCptm
 ZvIs6cHVTCLgI/gFormZGjLKPA==
X-Google-Smtp-Source: ABdhPJyCZby3E+i5/8aEnm2EyoCRENRlXyXj72Cf4bL/EDdq4jQNoJTZVSt+IBu0bzhpZlm1le2Bng==
X-Received: by 2002:aa7:88d3:0:b0:49f:baac:9b51 with SMTP id
 k19-20020aa788d3000000b0049fbaac9b51mr15296856pff.44.1638484081032; 
 Thu, 02 Dec 2021 14:28:01 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
 by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 14:28:00 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 30/34] sound: hdac: Migrate to aggregate driver
Date: Thu,  2 Dec 2021 14:27:28 -0800
Message-Id: <20211202222732.2453851-31-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Saravana Kannan <saravanak@google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, Jaroslav Kysela <perex@perex.cz>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/hda/hdac_component.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/hda/hdac_component.c b/sound/hda/hdac_component.c
index bb37e7e0bd79..9e4dab97f485 100644
--- a/sound/hda/hdac_component.c
+++ b/sound/hda/hdac_component.c
@@ -181,8 +181,9 @@ int snd_hdac_acomp_get_eld(struct hdac_device *codec, hda_nid_t nid, int dev_id,
 }
 EXPORT_SYMBOL_GPL(snd_hdac_acomp_get_eld);
 
-static int hdac_component_master_bind(struct device *dev)
+static int hdac_component_master_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_audio_component *acomp = hdac_get_acomp(dev);
 	int ret;
 
@@ -222,8 +223,9 @@ static int hdac_component_master_bind(struct device *dev)
 	return ret;
 }
 
-static void hdac_component_master_unbind(struct device *dev)
+static void hdac_component_master_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_audio_component *acomp = hdac_get_acomp(dev);
 
 	if (acomp->audio_ops && acomp->audio_ops->master_unbind)
@@ -233,9 +235,13 @@ static void hdac_component_master_unbind(struct device *dev)
 	WARN_ON(acomp->ops || acomp->dev);
 }
 
-static const struct component_master_ops hdac_component_master_ops = {
-	.bind = hdac_component_master_bind,
-	.unbind = hdac_component_master_unbind,
+static struct aggregate_driver hdac_aggregate_driver = {
+	.probe = hdac_component_master_bind,
+	.remove = hdac_component_master_unbind,
+	.driver = {
+		.name = "hdac_agg",
+		.owner = THIS_MODULE,
+	},
 };
 
 /**
@@ -303,8 +309,7 @@ int snd_hdac_acomp_init(struct hdac_bus *bus,
 	devres_add(dev, acomp);
 
 	component_match_add_typed(dev, &match, match_master, bus);
-	ret = component_master_add_with_match(dev, &hdac_component_master_ops,
-					      match);
+	ret = component_aggregate_register(dev, &hdac_aggregate_driver, match);
 	if (ret < 0)
 		goto out_err;
 
@@ -344,7 +349,7 @@ int snd_hdac_acomp_exit(struct hdac_bus *bus)
 	bus->display_power_active = 0;
 	bus->display_power_status = 0;
 
-	component_master_del(dev, &hdac_component_master_ops);
+	component_aggregate_unregister(dev, &hdac_aggregate_driver);
 
 	bus->audio_component = NULL;
 	devres_destroy(dev, hdac_acomp_release, NULL, NULL);
-- 
https://chromeos.dev

