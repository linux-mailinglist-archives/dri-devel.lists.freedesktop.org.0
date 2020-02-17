Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF21160CD6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54656E598;
	Mon, 17 Feb 2020 08:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC116E44C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 03:17:06 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id z19so10421856pfn.18
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 19:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=WyY8AR/W9Xhoq+FoZI+JwslnVAFfNuC6P4tiCJpqlNM=;
 b=XM+8y09NmdcBqI5tENuyJPgoZPkNcFlWhBEVm/VyNB+qqCVUPFfySf1XAX9fcSBAQN
 eoRDs7U0lYvGlwNkmFXyFzeq6BdniLjOJdL8ITVb/+H3yghkqT+ZlpKBIGI884IyFMKE
 W+qoM4sYK9ncnSBM1vyoFvhdPR3Y+wXyKIsptwL6L4IBBER1s29g3hi9t7du2SiwtH9a
 ihemetgpwqoBtq8J7DqYEER4KfPtAMXdRYwRUdSF3OwK5AHiXTqky3ZK0LAlUctdGYFs
 xmKWCss+5sKWOwC/dkSf/EEGUoIDUZOJFRfZNiJ+iincRUpl9wM1x5EGjizutSP0ABkC
 De8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=WyY8AR/W9Xhoq+FoZI+JwslnVAFfNuC6P4tiCJpqlNM=;
 b=RMSXzLXbNOjglBVAG6oU3SygLAHwEnCZDMFpekRON4IGZIIAVYGoHOcw4d2hKZziXR
 Cr9R8l2KiT7WdHtzwai65aZHClwU9x0kX2wtvwDydoyJooPVFMxgbbxDZzc9p/8fPY4Y
 0VgGmv3sSbCkPnxNPWV10SnT9ULjJL4Tk4rsiBhTliaTu1twRn+POXA8lbGv+pg7bwpB
 vc9ge2PwW5bBj1SkDGcW8JJgaimtAqJIgQB6MkCsw/iyCoyazEGkGPAbzyTDKHXw4J0h
 houFyRSf3u59/TxaGEZPM/2+9Vb25vNwa+FtlCTpdPG0xseQO6OM4tDDPyVhhFKsO0/E
 pvxQ==
X-Gm-Message-State: APjAAAWQnmtHvnGuBRA0Z26Pby2NYbpRI0bjRq8V6NMMdwfN0qbyv+CD
 alGBTjeVwJHtJEyCxMY/qfOPXzSGxGxb
X-Google-Smtp-Source: APXvYqyaA0c4C3Cy5dT8KODvRZRHXgVJd5DJOU44ArgLhO1/lknUXh2t3cF80g4vSNUWgNRWhTevS8xJmETl
X-Received: by 2002:a63:ac46:: with SMTP id z6mr13808575pgn.301.1581909425929; 
 Sun, 16 Feb 2020 19:17:05 -0800 (PST)
Date: Mon, 17 Feb 2020 11:16:52 +0800
In-Reply-To: <20200217031653.52345-1-tzungbi@google.com>
Message-Id: <20200217105513.1.Icc323daaf71ad02f191fd8d91136b01b61eca5e3@changeid>
Mime-Version: 1.0
References: <20200217031653.52345-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v2 1/2] ASoC: hdmi-codec: set plugged_cb to NULL when
 component removing
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sets plugged_cb to NULL when component removing to notify its consumers
: no further plugged status report is required.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/hdmi-codec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 444cc4e3374e..f005751da2cc 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -779,7 +779,17 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_component *component,
 	return ret;
 }
 
+static void hdmi_remove(struct snd_soc_component *component)
+{
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+
+	if (hcp->hcd.ops->hook_plugged_cb)
+		hcp->hcd.ops->hook_plugged_cb(component->dev->parent,
+					      hcp->hcd.data, NULL, NULL);
+}
+
 static const struct snd_soc_component_driver hdmi_driver = {
+	.remove			= hdmi_remove,
 	.dapm_widgets		= hdmi_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(hdmi_widgets),
 	.of_xlate_dai_id	= hdmi_of_xlate_dai_id,
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
