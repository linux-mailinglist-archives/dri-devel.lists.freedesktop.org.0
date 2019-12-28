Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7BD12C2C7
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2019 15:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CB189DDF;
	Sun, 29 Dec 2019 14:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9912C89944
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2019 20:28:37 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id y8so13087650pll.13
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2019 12:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=O/NazlIyebGgm2jHBRChRbTb9wSObdQ6N5Bgyi7i27c=;
 b=kiAAsW26ytcRco0kYp0tzDQgd4XIQNe722oGmS6OtNr2W8p69FOcKQV1Mfu0enUGzD
 gZMbna0w/IOgjM4QkcNhnB5zh60rGSQz+UC6Ox+luGu4NjcvUMe2iPcDMzmsMsySgvIE
 Jn/jOIadgILoQXyKU301MMgEkrm6tuU7phT+sdwkOiJGZmlg5w7CpF6QVqt3ks7Psv+D
 Vyz4aIsLr0e+Otg0gXLZ8pYm19AzvIw496AAXLdFdXkqT3ESZN8vuHkSdqBJwVJ/cMHQ
 4VzS3AaGP717AVYQD61WCZiIzTLASb2b6wOg4h+4zucxuOSiX1r5L6Lym8p7VW0wQOeS
 tkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=O/NazlIyebGgm2jHBRChRbTb9wSObdQ6N5Bgyi7i27c=;
 b=mgdzn0TqeVKzODEL6+sUWjtbj8kGcOOvqYqnfSdVoQjx23YUtgw3QHYjhZdig7lDB3
 fFgsFFIW4Mx/eGB+vmGzUyJnAEFWBSUW2Eu8Zgzwaa+1Y4MWAsE4zELQCyCnbyGM6wGn
 m9Ty7RGoFNZWUNObKHUep3YG4YMkSCGMb597niRHVfNTpliIaAqmnc/8acCFZxMV8+wA
 EFq3CQwS0KkpVRxy7TSuef4AFXnh4SxzjCQDaFbC8w8hwu5xa+NmdkWAgu4przJySdfR
 XRTClS5+gNutTseriVXvx1Gi/7Ch3yC2ZwWtEDcer9Aem5WpCCh9VqUxxdqf2YTOuBAQ
 Q5hA==
X-Gm-Message-State: APjAAAU0en42edNW/RKKRtCg3Ne5kvmyDHrhhqq8BO8KAkdBxgLkxw/2
 zT9MRmAFaqtG3ei2oXGy5yZazw==
X-Google-Smtp-Source: APXvYqzil8XHZKEKGXU9xgLOmC+kzkkEd7Atnumax82OKBXXcIfMJT4P+N0l7H8T4ce/5JC7LvTxDA==
X-Received: by 2002:a17:90a:28a1:: with SMTP id
 f30mr35191546pjd.77.1577564917184; 
 Sat, 28 Dec 2019 12:28:37 -0800 (PST)
Received: from virtualhost-PowerEdge-R810.synapse.com ([195.238.92.107])
 by smtp.gmail.com with ESMTPSA id i68sm46771169pfe.173.2019.12.28.12.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2019 12:28:36 -0800 (PST)
From: roman.stratiienko@globallogic.com
To: mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@siol.net
Subject: [RFC 1/4] drm/sun4i: Wait for previous mixing process finish before
 committing next
Date: Sat, 28 Dec 2019 22:28:15 +0200
Message-Id: <20191228202818.69908-2-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228202818.69908-1-roman.stratiienko@globallogic.com>
References: <20191228202818.69908-1-roman.stratiienko@globallogic.com>
X-Mailman-Approved-At: Sun, 29 Dec 2019 14:43:42 +0000
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
Cc: Roman Stratiienko <roman.stratiienko@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

Screen composition that requires dynamic layout modification,
especially scaling is corrupted when layout changes.

For example if one of the layer scales down, misaligned lines can be
observed, and dynamic increasing of destination area makes mixer to hang
and draw nothing after drawing modified layer.

After deep investigation it turns that scaler double-buffered registers
are not latched by GLB_DBUFFER bit, instead thay are latched immidiately.

Only way to avoid artifacts is to change the registers after mixer finish
previous frame.

Similar was made in sunxi BSP - scaler register values was stored into RAM,
and moved into registers at sync together with GLB_DBUFFER.

Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 15 +++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 8b803eb903b8..eea4813602b7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -257,6 +257,20 @@ const struct de2_fmt_info *sun8i_mixer_format_info(u32 format)
 	return NULL;
 }
 
+static void sun8i_atomic_begin(struct sunxi_engine *engine,
+			       struct drm_crtc_state *old_state)
+{
+	int reg, ret;
+
+	ret = regmap_read_poll_timeout(engine->regs, SUN8I_MIXER_GLOBAL_STATUS,
+				       reg,
+				       !(reg & SUN8I_MIXER_GLOBAL_STATUS_BUSY),
+				       200, 100000);
+
+	if (ret)
+		pr_warn("%s: Wait for frame finish timeout\n", __func__);
+}
+
 static void sun8i_mixer_commit(struct sunxi_engine *engine)
 {
 	DRM_DEBUG_DRIVER("Committing changes\n");
@@ -310,6 +324,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 static const struct sunxi_engine_ops sun8i_engine_ops = {
 	.commit		= sun8i_mixer_commit,
 	.layers_init	= sun8i_layers_init,
+	.atomic_begin	= sun8i_atomic_begin,
 };
 
 static struct regmap_config sun8i_mixer_regmap_config = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index c6cc94057faf..915479cc3077 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -25,6 +25,8 @@
 
 #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE		BIT(0)
 
+#define SUN8I_MIXER_GLOBAL_STATUS_BUSY		BIT(4)
+
 #define DE2_MIXER_UNIT_SIZE			0x6000
 #define DE3_MIXER_UNIT_SIZE			0x3000
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
