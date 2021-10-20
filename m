Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67554350D8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 18:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6385C6E0D5;
	Wed, 20 Oct 2021 16:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9E36E0D5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 16:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634749141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XMrjtmMFCodzmOkKBCAts1KmNdWqk5crMuC4nhTRFUU=;
 b=Cs5OAdQrTf10N0JrAT8zTvHcbnbEUhPuDvW7nsAKtBpFrmcsO52zr5NZ07foGfeKDJul3E
 6pb3IVn0JTpZKbEa41SEq3Knqjs79EOsvvej5oFv5vCUeSBUk3Vt0osyJ73Pqbho8W/TVd
 9UOUf6lQISaSWHzwQomGG/9QjRgA/g0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-L9WAvps5Nh-oV_4iEabBgw-1; Wed, 20 Oct 2021 12:57:52 -0400
X-MC-Unique: L9WAvps5Nh-oV_4iEabBgw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so3563825wmh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 09:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XMrjtmMFCodzmOkKBCAts1KmNdWqk5crMuC4nhTRFUU=;
 b=HxhZLNLqktspw/q1ucVk3GVug9znHY/ZsCes2+JtGf/AmqZwBEAFa4bq+eZs4ne9TX
 ovd68cX2JmJQ13sMUTus9DpbzHeGLTjHfUVZsY8aq7xOBef8ZJoJgM+rFOCOtsfto1Sc
 L7guA7B7PhZY6I4gDKxbw+yHg2LKbnnZvX3RjJd+9XiwEL2Y1paqCrGSYjztrfAROdLQ
 mjZ1VP14xpPlbFS+WgvSVzAxanWhClDkPjabT1iOLETo3mIG3StzpuHoBu0PvV9cL5+Q
 /BVDJpnvHNAtBZyKAXPgLidoPRheHdpEooRRA8N428/fg4mynX+Gz5QAntKAFfAy8nj5
 iFRg==
X-Gm-Message-State: AOAM530egSWzCMRlk420p45n08punTjPI13/eF9V/HrLw0tk+AyuvNvL
 pHE0Vdj4fPYXq4t2H1GisY6jipWbSTt3RmLfzYqnUWNDg1HRJORCcfFk1vQjo7iV7RIiEfKEHgC
 jQRRvvjoQIHP5JGVv+OQ1nqsHMBU8
X-Received: by 2002:a05:600c:35d0:: with SMTP id
 r16mr14759727wmq.97.1634749071637; 
 Wed, 20 Oct 2021 09:57:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzt4IdDIt4JK7oFknnDd0KYdkLwueKH68lcDLzxFYYyytVkRjTBJ2NloP8e5wzUs9Lm+OI5Q==
X-Received: by 2002:a05:600c:35d0:: with SMTP id
 r16mr14759702wmq.97.1634749071403; 
 Wed, 20 Oct 2021 09:57:51 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z2sm2419999wrn.89.2021.10.20.09.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 09:57:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Johannes Stezenbach <js@sig21.net>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] Revert "drm/fb-helper: improve DRM fbdev emulation device
 names"
Date: Wed, 20 Oct 2021 18:57:40 +0200
Message-Id: <20211020165740.3011927-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit b3484d2b03e4c940a9598aa841a52d69729c582a.

That change attempted to improve the DRM drivers fbdev emulation device
names to avoid having confusing names like "simpledrmdrmfb" in /proc/fb.

But unfortunately, there are user-space programs such as pm-utils that
match against the fbdev names and so broke after the mentioned commit.

Since the names in /proc/fb are used by tools that consider it an uAPI,
let's restore the old names even when this lead to silly names like the
one mentioned above.

Fixes: b3484d2b03e4 ("drm/fb-helper: improve DRM fbdev emulation device names")
Reported-by: Johannes Stezenbach <js@sig21.net>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---

Changes in v2:
- Add a comment explaining that the current /proc/fb names are an uAPI.
- Add a Fixes: tag so it can be cherry-picked by stable kernels.
- Add Ville Syrjälä's Reviewed-by tag.

 drivers/gpu/drm/drm_fb_helper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 8e7a124d6c5a..22bf690910b2 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1743,7 +1743,13 @@ void drm_fb_helper_fill_info(struct fb_info *info,
 			       sizes->fb_width, sizes->fb_height);
 
 	info->par = fb_helper;
-	snprintf(info->fix.id, sizeof(info->fix.id), "%s",
+	/*
+	 * The DRM drivers fbdev emulation device name can be confusing if the
+	 * driver name also has a "drm" suffix on it. Leading to names such as
+	 * "simpledrmdrmfb" in /proc/fb. Unfortunately, it's an uAPI and can't
+	 * be changed due user-space tools (e.g: pm-utils) matching against it.
+	 */
+	snprintf(info->fix.id, sizeof(info->fix.id), "%sdrmfb",
 		 fb_helper->dev->driver->name);
 
 }
-- 
2.31.1

