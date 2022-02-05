Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3417A4AA4F1
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 01:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7753710E3E3;
	Sat,  5 Feb 2022 00:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B8010E317
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 00:14:14 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id q132so6293442pgq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 16:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JSn2M/yKAMsfnGZFwHB10y6iqnXx4FF2oGb2lIsnFpI=;
 b=lbZTKKPzut0pSDp0PGEfSw3i5JnQ5JXUOvWVZ6Bqe23XIqEF6A2W1GMcYGs4LM94eq
 1tgtOTcFBq6W1UWg5oKNaKKyOSErFWPClzvAqvTWGYekDZykaMBZ7OGE6HsZzPuqH8ec
 VHPh6nksgC3cBqMWKW3nX7/jZgVqlYWTuHtTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JSn2M/yKAMsfnGZFwHB10y6iqnXx4FF2oGb2lIsnFpI=;
 b=43UEihsUjLOiRWrU6TeFWvqndertph9g/TnLYjUDE8Nr4GT/EGJnP3yhFXK6jMfqOr
 8Z01ecDAnvDMJI9xS2CUW8ZJcB9WYHh2siyuYgK1xyEci99Prxh2f+QOlcDTWSFocNDm
 XRsXUXdve33KHQL3F58uX+FdgBaJEoh7vCWatGyT6jmk2yRsk+l/+SscGeOBDgxMUKga
 769j34INAsueANkzSAP8LNSuCPEogPLMNmpjhYFZizME1GP5mO7i1AcyyktWM71+a7iq
 UqDq6cImi+zqajfaoVjodEU6fWnH+peK0lCRokTZC85ln22Pec9zOD2usozXhoF6iyxd
 YD+Q==
X-Gm-Message-State: AOAM533XWTyxLTAK+7WXpblug8wxy9HBzvrJjblfCcKGwQ9RPC9jIN9Y
 X0w5raAV2Vi4v4VdyzNL0f2Yum7Tt0suhw==
X-Google-Smtp-Source: ABdhPJxn/GCPUuG4dWCd6GKM189yB7c+AgTeBQ6yKeW1fQ/otXDa51dtaC8z5cJVw357oaP3WHq34w==
X-Received: by 2002:a05:6a00:1810:: with SMTP id
 y16mr5530158pfa.65.1644020053748; 
 Fri, 04 Feb 2022 16:14:13 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:d668:55ac:a465:88bf])
 by smtp.gmail.com with ESMTPSA id q13sm3720231pfj.44.2022.02.04.16.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 16:14:13 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/panel-edp: Allow querying the detected panel via
 debugfs
Date: Fri,  4 Feb 2022 16:13:42 -0800
Message-Id: <20220204161245.v2.3.I209d72bcc571e1d7d6b793db71bf15c9c0fc9292@changeid>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220205001342.3155839-1-dianders@chromium.org>
References: <20220205001342.3155839-1-dianders@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, robert.foss@linaro.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, jjsu@chromium.org,
 lschyi@chromium.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recently we added generic "edp-panel"s probed by EDID. To support
panels in this way we look at the panel ID in the EDID and look up the
panel in a table that has power sequence timings. If we find a panel
that's not in the table we will still attempt to use it but we'll use
conservative timings. While it's likely that these conservative
timings will work for most nearly all panels, the performance of
turning the panel off and on suffers.

We'd like to be able to reliably detect the case that we're using the
hardcoded timings without relying on parsing dmesg. This allows us to
implement tests that ensure that no devices get shipped that are
relying on the conservative timings.

Let's add a new debugfs entry to panel devices. It will have one of:
* UNKNOWN - We tried to detect a panel but it wasn't in our table.
* HARDCODED - We're not using generic "edp-panel" probed by EDID.
* A panel name - This is the name of the panel from our table.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Now using debugfs, not sysfs

 drivers/gpu/drm/panel/panel-edp.c | 37 ++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index a394a15dc3fb..0fda1eb7b690 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -21,6 +21,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/iopoll.h>
@@ -222,6 +223,8 @@ struct panel_edp {
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *hpd_gpio;
 
+	const struct edp_panel_entry *detected_panel;
+
 	struct edid *edid;
 
 	struct drm_display_mode override_mode;
@@ -606,6 +609,28 @@ static int panel_edp_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static int detected_panel_show(struct seq_file *s, void *data)
+{
+	struct drm_panel *panel = s->private;
+	struct panel_edp *p = to_panel_edp(panel);
+
+	if (IS_ERR(p->detected_panel))
+		seq_puts(s, "UNKNOWN\n");
+	else if (!p->detected_panel)
+		seq_puts(s, "HARDCODED\n");
+	else
+		seq_printf(s, "%s\n", p->detected_panel->name);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(detected_panel);
+
+static void panel_edp_debugfs_init(struct drm_panel *panel, struct dentry *root)
+{
+	debugfs_create_file("detected_panel", 0600, root, panel, &detected_panel_fops);
+}
+
 static const struct drm_panel_funcs panel_edp_funcs = {
 	.disable = panel_edp_disable,
 	.unprepare = panel_edp_unprepare,
@@ -613,6 +638,7 @@ static const struct drm_panel_funcs panel_edp_funcs = {
 	.enable = panel_edp_enable,
 	.get_modes = panel_edp_get_modes,
 	.get_timings = panel_edp_get_timings,
+	.debugfs_init = panel_edp_debugfs_init,
 };
 
 #define PANEL_EDP_BOUNDS_CHECK(to_check, bounds, field) \
@@ -666,7 +692,6 @@ static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
 
 static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 {
-	const struct edp_panel_entry *edp_panel;
 	struct panel_desc *desc;
 	u32 panel_id;
 	char vend[4];
@@ -705,14 +730,14 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 	}
 	drm_edid_decode_panel_id(panel_id, vend, &product_id);
 
-	edp_panel = find_edp_panel(panel_id);
+	panel->detected_panel = find_edp_panel(panel_id);
 
 	/*
 	 * We're using non-optimized timings and want it really obvious that
 	 * someone needs to add an entry to the table, so we'll do a WARN_ON
 	 * splat.
 	 */
-	if (WARN_ON(!edp_panel)) {
+	if (WARN_ON(!panel->detected_panel)) {
 		dev_warn(dev,
 			 "Unknown panel %s %#06x, using conservative timings\n",
 			 vend, product_id);
@@ -734,12 +759,14 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 		 */
 		desc->delay.unprepare = 2000;
 		desc->delay.enable = 200;
+
+		panel->detected_panel = ERR_PTR(-EINVAL);
 	} else {
 		dev_info(dev, "Detected %s %s (%#06x)\n",
-			 vend, edp_panel->name, product_id);
+			 vend, panel->detected_panel->name, product_id);
 
 		/* Update the delay; everything else comes from EDID */
-		desc->delay = *edp_panel->delay;
+		desc->delay = *panel->detected_panel->delay;
 	}
 
 	ret = 0;
-- 
2.35.0.263.gb82422642f-goog

