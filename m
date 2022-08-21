Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BCA59B338
	for <lists+dri-devel@lfdr.de>; Sun, 21 Aug 2022 13:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F9218B060;
	Sun, 21 Aug 2022 11:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBCA18B05A
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 11:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661080662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AxRts5aJ3HNvwn7dKavqQBNSNcUCmP54o8Yv9Iyp9m8=;
 b=U/TeIsZv3OVG3DNcLIDNLw//0ckwVFmcAtdcV81+e3H9ZjcoivlGlJ1qKguPakrrd9PsGX
 ajSbKHPkwxXIIkCDIGLDpfOwV8qkRf5JKXHhrV3Dqfci0yEUk1gMMJuihP/SqNDli1vBkc
 C3pNbAWMNurXCBh5xJdfaL/ryNBUKYY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-u-fjhVNiNhqqsRa7C19BnQ-1; Sun, 21 Aug 2022 07:17:41 -0400
X-MC-Unique: u-fjhVNiNhqqsRa7C19BnQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 lw13-20020a17090b180d00b001fb2be14a3dso200917pjb.8
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 04:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=AxRts5aJ3HNvwn7dKavqQBNSNcUCmP54o8Yv9Iyp9m8=;
 b=WkD8jc2GoXxr58ZRdpA0g3Z+g2YerwUW8Q87Nrud22/pG8kpNHSbSzZ4Ec79R7mJaq
 8APMN02LYPJbSppYvx2NTGHjb1sXP4CNdQy7tBJmCj2V2HXOTQBvBHXryiwhZ19/KvOS
 K6c+uklo6mvOtsZhmeG/3KQUmiozP78igbsWiuXvBa7pmPRsvDeULsa5qMnXG5eZJTwl
 RilR1PvTSVINEjrFPvGD05RLtvCFZyFxjSPm2WBQDi3TAqyJ82lu20Zt7uZ4bJ/oGBhf
 d/OiOhQMFNNoxWffWaBRXS08rwxBU1hktlrNYk+7cuDHQ2NYVD9Q7zWa4wivs5U//vcZ
 p3Ww==
X-Gm-Message-State: ACgBeo0gEMILxZk6flI0PIuFebJZFj4ZtyHc4UK/awJmBicYzg57dIv0
 uv2lU+oD4N+usCS2+xreT0RVCarLrk19CEiOhMV/1FpoX2nI6JJApyNLE+xGVxvbB8KGLbkuaEQ
 Ttuhis440E2ngnV/dpgq1ZTYZX+/E
X-Received: by 2002:a17:90a:e586:b0:1fa:d28b:ab9b with SMTP id
 g6-20020a17090ae58600b001fad28bab9bmr16538358pjz.47.1661080660364; 
 Sun, 21 Aug 2022 04:17:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4kgULb8Oe4M5i8Q1aOVIChTcGskCxiNDQX9B8sJq/7wZLjPKLFXM/9i4rUtW/O1NjahDdO7Q==
X-Received: by 2002:a17:90a:e586:b0:1fa:d28b:ab9b with SMTP id
 g6-20020a17090ae58600b001fad28bab9bmr16538337pjz.47.1661080660102; 
 Sun, 21 Aug 2022 04:17:40 -0700 (PDT)
Received: from xps13.. ([240d:1a:c0d:9f00:4f2f:926a:23dd:8588])
 by smtp.gmail.com with ESMTPSA id
 w128-20020a623086000000b00536463e3802sm2835382pfw.36.2022.08.21.04.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 04:17:39 -0700 (PDT)
From: Shigeru Yoshida <syoshida@redhat.com>
To: deller@gmx.de
Subject: [PATCH] fbcon: Destroy mutex on freeing struct fb_info
Date: Sun, 21 Aug 2022 20:17:31 +0900
Message-Id: <20220821111731.247446-1-syoshida@redhat.com>
X-Mailer: git-send-email 2.37.2
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
Cc: linux-fbdev@vger.kernel.org, Shigeru Yoshida <syoshida@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's needed to destroy bl_curve_mutex on freeing struct fb_info since
the mutex is embedded in the structure and initialized when it's
allocated.

Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 drivers/video/fbdev/core/fbsysfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index c2a60b187467..4d7f63892dcc 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -84,6 +84,10 @@ void framebuffer_release(struct fb_info *info)
 	if (WARN_ON(refcount_read(&info->count)))
 		return;
 
+#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
+	mutex_destroy(&info->bl_curve_mutex);
+#endif
+
 	kfree(info->apertures);
 	kfree(info);
 }
-- 
2.37.2

