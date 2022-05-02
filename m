Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C249B5170EA
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 15:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC7910EF2A;
	Mon,  2 May 2022 13:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A9210EF2A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651499443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BQpSyCSvSxwXSRLg4x96E4uuSIM8J4F+LPJOv0S8u+E=;
 b=OzNJh8m/JWpm3pN4LImuBk6HrqZcPc+VZj5QZx161c8XvtRQ46DWt4FycNe7KVaZpz2WqZ
 /qaL6Y5pa54Wx8GKP1PIjloQxuFX8iQ0bZcOByKPJe2cK2c3dZRynsdmJM0aeHQihugz84
 aLdx2bDqt1RADItuQDSmfuoK8wGNKIM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-39U9_i2tMmmJJBEJZTUW6Q-1; Mon, 02 May 2022 09:50:42 -0400
X-MC-Unique: 39U9_i2tMmmJJBEJZTUW6Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 y13-20020adfc7cd000000b0020ac7c7bf2eso5329531wrg.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 06:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BQpSyCSvSxwXSRLg4x96E4uuSIM8J4F+LPJOv0S8u+E=;
 b=vz8j8cRB7Y2X2MBdbQUmst83FQ18CIVFOiKqYV3ILOj8OKh5uElPnAOCo5I2GwqTig
 sgSuAoXbYDU+/vuLcZIKXtpdfHrteQpwhqQGR6C/tvTtEQD+nFNy4jQM0DcRSlpRPDwO
 Fyz0LyJdjB0WCneINfy/HjlPXFkE3ZAa8LP3Mkc2Bd1uskawblWtWPWUsq+5ck+Gz7LZ
 1QglIt+r95ZCh9HzRRvzjrvQe3DZCVj+Viz/KAjUDq6l+y8x9xbNNqauOBkZKTD3oC5Z
 6vf65inwHPKHLHWYSxl1KrIPDbAbaRs1Ea20omR3j2gDQOBH2H0udbLUWsP+jxgt1QXw
 cQlw==
X-Gm-Message-State: AOAM532RLRTkMYX/GvCua2NoLkLoAbx4V1b8bULXCkB6KvPN2Ks9Hekm
 6zL12J6GLE7iJFttF/dOpHIhP/8I0IS9RyrQU3R0RBdt3ycrmn/EMrzzVp7Tt6KHClOQZn8bKs8
 u62jMMSGh0BYv9rNECRPeDf1niUF0
X-Received: by 2002:a1c:f315:0:b0:381:1f6d:6ca6 with SMTP id
 q21-20020a1cf315000000b003811f6d6ca6mr15371020wmq.25.1651499440958; 
 Mon, 02 May 2022 06:50:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGqfnkXq/QNQtkvE0piB9l7XKahLmkaXX4erAteBBJGEmr2zey65L6iPEnmq/SupQnMxgPQg==
X-Received: by 2002:a1c:f315:0:b0:381:1f6d:6ca6 with SMTP id
 q21-20020a1cf315000000b003811f6d6ca6mr15371002wmq.25.1651499440753; 
 Mon, 02 May 2022 06:50:40 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adf8bc6000000b0020c5253d8bdsm8725957wra.9.2022.05.02.06.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 06:50:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] fbdev: Make fb_release() return -ENODEV if fbdev was
 unregistered
Date: Mon,  2 May 2022 15:50:14 +0200
Message-Id: <20220502135014.377945-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Junxiao Chang <junxiao.chang@intel.com>,
 Helge Deller <deller@gmx.de>, Zheyu Ma <zheyuma97@gmail.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A reference to the framebuffer device struct fb_info is stored in the file
private data, but this reference could no longer be valid and must not be
accessed directly. Instead, the file_fb_info() accessor function must be
used since it does sanity checking to make sure that the fb_info is valid.

This can happen for example if the registered framebuffer device is for a
driver that just uses a framebuffer provided by the system firmware. In
that case, the fbdev core would unregister the framebuffer device when a
real video driver is probed and ask to remove conflicting framebuffers.

The bug has been present for a long time but commit 27599aacbaef ("fbdev:
Hot-unplug firmware fb devices on forced removal") unmasked it since the
fbdev core started unregistering the framebuffers' devices associated.

Fixes: 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced removal")
Reported-by: Maxime Ripard <maxime@cerno.tech>
Reported-by: Junxiao Chang <junxiao.chang@intel.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

Changes in v2:
- Drop patch 1/2 since patch 2/2 should be enough to fix the issue.
- Add missing Fixes and Reported-by tags (Thomas Zimmermann).
- Add Thomas Zimmermann's Reviewed-by tag.

 drivers/video/fbdev/core/fbmem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 84427470367b..82d4318ba8f7 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1434,7 +1434,10 @@ fb_release(struct inode *inode, struct file *file)
 __acquires(&info->lock)
 __releases(&info->lock)
 {
-	struct fb_info * const info = file->private_data;
+	struct fb_info * const info = file_fb_info(file);
+
+	if (!info)
+		return -ENODEV;
 
 	lock_fb_info(info);
 	if (info->fbops->fb_release)
-- 
2.35.1

