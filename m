Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6024415BA9C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 09:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D1F6F561;
	Thu, 13 Feb 2020 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com
 [IPv6:2607:f8b0:4864:20::a49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B156EA5F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 11:29:29 +0000 (UTC)
Received: by mail-vk1-xa49.google.com with SMTP id t126so553199vkg.6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 03:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=SoC6rVFw6F86jiDloCCVTNvG0+gKemeB0EmmXCP7Dqg=;
 b=nyH6pgf9J7jaOR4zodSFCo3vHMcfatUXwv5n7EHIEZbmRrQN+0sIsCn6NSi7ItZBzY
 D/cMkzBlGf5EtGq2wYbkshowisriEzSCbb1Fm+rGXDC5UwWt9g+6IITPIUDddcapovlT
 RjvkKv2xZQ9ShYTeIG2lniDAvvyhIq3sujIr03QpCMcmFtm2dS+v0iTr5Hb04MZy5H6P
 IZyVwIakftF3kEqIS9c9cSzlS7kay0muLEipZmyxcWeu4c/R+r1Py+bHs8wRgHgnpeh8
 6YYFhX3MntuPRW9adOTAk6Ng43es7I7dTb03xVA9sjLDnbA+gp+D7ibFk9xIFeZi60w1
 Icdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=SoC6rVFw6F86jiDloCCVTNvG0+gKemeB0EmmXCP7Dqg=;
 b=XylyNC1rdujX4iFcax+hsMCFg6ITJOrlFb4yXf7pyGcK0UOktg6Q4GT2Onm0yfxuij
 FOKqWy5SlBAsKKyPss7M17UR/2N8YBJCoRgC8l+FeTp6yOVLqKNbO+USDGO8xVbTTxKq
 +uiG+q4obDF6i3Zs4sgYSArHF2JE0qzDUE4dKG1RC5+qU0tDuITokewq4RsPCD1wZbGP
 pRNpZuhgFgS2ewS+vYIjQjpzRa6+awKNlgka6nrXHjUoX/N9a5H5bbuep81eMVDzfA9T
 qjaTc8IC7r66HJlJhl7UIpdRsd63QWwaJW9miSGQoDEKrdZvuSV2l+inoDtGyx8bM8qd
 dGfg==
X-Gm-Message-State: APjAAAWgYT7u3vMw6j75Nk8+5x3Yu7rcw6iBMUo63t2q6tMowLud4jyo
 6FOL7fGHQCV0emwyCjK+lM7ich+Iogca
X-Google-Smtp-Source: APXvYqwyE18TjD5fW1MmWZFJv3Wb2a8JX+p8pSY+ifSY8r0QabHqn8yasFBmFMDQqG/e+oN4hNYjpMz/g3u3
X-Received: by 2002:a1f:328a:: with SMTP id y132mr7449492vky.60.1581506968242; 
 Wed, 12 Feb 2020 03:29:28 -0800 (PST)
Date: Wed, 12 Feb 2020 19:29:16 +0800
Message-Id: <20200212192707.PATCH.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
Subject: [PATCH] drm/mediatek: fix race condition of plugged_cb and codec_dev
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-Mailman-Approved-At: Thu, 13 Feb 2020 08:12:52 +0000
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

hdmi_conn_detect and mtk_hdmi_audio_hook_plugged_cb woule be called
by different threads.  plugged_cb and codec_dev are in danger of race
condition.

Fixes by:
- Checks NULLs first.
- Uses WRITE_ONCE() to prevent store tearing (i.e. write to plugged_cb
  after codec_dev).
- Uses codec_dev as a signal to report HDMI jack status.

The patch intends to not use mutex to protect the shared variables.
In runtime, mtk_hdmi_audio_hook_plugged_cb would be called only once
if no one rebinds the sound card.  In contrast, hdmi_conn_detect could
be called multiple times.  Uses a mutex within hdmi_conn_detect calling
path is a waste (no lock contention).

Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 03aeb73005ef..746567c91bb7 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1201,7 +1201,7 @@ mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
 {
 	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
 
-	if (hdmi->plugged_cb && hdmi->codec_dev)
+	if (hdmi->codec_dev)
 		hdmi->plugged_cb(hdmi->codec_dev, connected);
 
 	return connected ?
@@ -1669,8 +1669,12 @@ static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
 {
 	struct mtk_hdmi *hdmi = data;
 
-	hdmi->plugged_cb = fn;
-	hdmi->codec_dev = codec_dev;
+	if (!fn || !codec_dev)
+		return -EINVAL;
+
+	/* Use WRITE_ONCE() to prevent store tearing. */
+	WRITE_ONCE(hdmi->plugged_cb, fn);
+	WRITE_ONCE(hdmi->codec_dev, codec_dev);
 	mtk_hdmi_update_plugged_status(hdmi);
 
 	return 0;
-- 
2.25.0.225.g125e21ebc7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
