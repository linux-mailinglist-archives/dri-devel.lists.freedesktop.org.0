Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C149EBFB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846F110E30E;
	Thu, 27 Jan 2022 20:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE67C10E502
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:02:39 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id a8so3790807pfa.6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 12:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pg7u1QgES9vvilydf87u7mbX9H+V1JXmTaOjVr3A4N4=;
 b=SNb6+UtCldRo3C3aKKuH53pJUKPR1QoOvhja2fFrdIZAqK2pC8avjHvs2QWwdAqY2L
 iDTt5Ev8TK1FUPlXG0GLJg90OtWzYd58L9jGhUvwTScxXTgeVD59clQ/6ruqJGZsIDtb
 VzKFMzhSCdtxWvtOoLilyZS6Je3BqrKogxJuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pg7u1QgES9vvilydf87u7mbX9H+V1JXmTaOjVr3A4N4=;
 b=qPv3aeJUv5dE5SS82TtbCUP0pLqRJgKC+eAX1IypzxSHbpE2Eym7AILzu2c4kFF/Do
 iah5UqpBGw0eX/JydIPAjCmTYyTRivEF26AGyN8D9vl7eZ/Epn6rIinS1YVIDErq42ng
 1PjG1iTKi1dR7aoL62qAsBQedKW7T/xpK+TzjBxp/gc8kUs9yNQ9LbMx8hntuK3kEE2Q
 5L0LjDpI7Z48wJwF4cu1IQ9vGHefyoLRvsyUL86qPuhQSRVLzDB2vLae08Jamlt/zx07
 BnEGqosqYhv+2CMkPCzs3LuPLrh1r+x/eIp7vTQLMUhQYyI5jvSVbafvttVqv856iyfC
 DEcg==
X-Gm-Message-State: AOAM5325M3mKvZSbaNAmKbZowcadTmEOvCTYQsWoErvLLLDaF/c55JS8
 ysNH3CNW7oGT4nW3P2KXXHZEWQ==
X-Google-Smtp-Source: ABdhPJyWS6wiSowTLsVHpFT26f9C2DJENr9ONfoQ93NBCznOznrI8TRNbMCesKj30yy09FTDuZLACA==
X-Received: by 2002:a63:dd0f:: with SMTP id t15mr3912064pgg.12.1643313759139; 
 Thu, 27 Jan 2022 12:02:39 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:02:38 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 33/35] ALSA: hda/realtek: Migrate to aggregate driver
Date: Thu, 27 Jan 2022 12:01:39 -0800
Message-Id: <20220127200141.1295328-34-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220127200141.1295328-1-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
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
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
 Saravana Kannan <saravanak@google.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/pci/hda/patch_realtek.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 668274e52674..80a2164c99b6 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6547,25 +6547,31 @@ static int find_comp_by_dev_name(struct alc_spec *spec, const char *name)
 	return -ENODEV;
 }
 
-static int comp_bind(struct device *dev)
+static int realtek_aggregate_probe(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct hda_codec *cdc = dev_to_hda_codec(dev);
 	struct alc_spec *spec = cdc->spec;
 
 	return component_bind_all(dev, spec->comps);
 }
 
-static void comp_unbind(struct device *dev)
+static void realtek_aggregate_remove(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct hda_codec *cdc = dev_to_hda_codec(dev);
 	struct alc_spec *spec = cdc->spec;
 
 	component_unbind_all(dev, spec->comps);
 }
 
-static const struct component_master_ops comp_master_ops = {
-	.bind = comp_bind,
-	.unbind = comp_unbind,
+static struct aggregate_driver realtek_aggregate_driver = {
+	.probe = realtek_aggregate_probe,
+	.remove = realtek_aggregate_remove,
+	.driver = {
+		.name = "realtek_aggregate",
+		.owner = THIS_MODULE,
+	},
 };
 
 static void comp_generic_playback_hook(struct hda_pcm_stream *hinfo, struct hda_codec *cdc,
@@ -6597,7 +6603,7 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 				return;
 			component_match_add(dev, &spec->match, comp_match_dev_name, name);
 		}
-		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
+		ret = component_aggregate_register(dev, &realtek_aggregate_driver, spec->match);
 		if (ret)
 			codec_err(cdc, "Fail to register component aggregator %d\n", ret);
 		else
@@ -6648,7 +6654,7 @@ static void alc287_fixup_legion_16achg6_speakers(struct hda_codec *cdc, const st
 				    "i2c-CLSA0100:00-cs35l41-hda.0");
 		component_match_add(dev, &spec->match, comp_match_dev_name,
 				    "i2c-CLSA0100:00-cs35l41-hda.1");
-		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
+		ret = component_aggregate_register(dev, &realtek_aggregate_driver, spec->match);
 		if (ret)
 			codec_err(cdc, "Fail to register component aggregator %d\n", ret);
 		else
-- 
https://chromeos.dev

