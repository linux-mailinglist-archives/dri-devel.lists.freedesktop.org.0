Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF6E504839
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 17:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE29C10E087;
	Sun, 17 Apr 2022 15:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F224510E087
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 15:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650210328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uypO0xGq2R7G7rwhp3xAy+f7w5+Cm6Mvqy0TJPHONMI=;
 b=WSNn6RNaKLPn1fATE2e29fbt+2WUfYtMN3w69I4bNqGZOw0Mr26jgxHM1rOUDhUWho20Yp
 ShdOkK2cAwur4Qgr7U4mDIy/t2lcMHYV0/tmgBJ07BWfqtCE9BwBo6NLPl2h4eNXZMJfnP
 iam1X4CoTrKTTvY4yTKwjFScXjxHqJc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-UNNFvCXaN-OeAl6BWGotVg-1; Sun, 17 Apr 2022 11:45:25 -0400
X-MC-Unique: UNNFvCXaN-OeAl6BWGotVg-1
Received: by mail-wm1-f70.google.com with SMTP id
 az19-20020a05600c601300b003914ac8efb8so3233075wmb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 08:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uypO0xGq2R7G7rwhp3xAy+f7w5+Cm6Mvqy0TJPHONMI=;
 b=qIaysSw92uRto8gZgx32vtGtPJ1K2t6hYy6jSlLEvpcD8ckdATHjtGSa1UBItnCNZM
 GnD8kFzrK0t/4OaJgSa9e/iXKFoh6ofrxuHC+Md5foo6G2r+0iMpWt/dnMthpz6hNlqD
 tPqcSjfBJB2rPp/ABSquTIcUZYsq0Ng6uw8heAw8Ijn6yv4aRGIzF0bEChxO/ourDhOX
 Ywh63fYf+b+z/Ta6dAAH+t0Ma6fWIaGciLcW4+ZcNnt2cVZt3bxMJnRepILM1R1sOVGT
 SuJyxkSg1mwc+hAo26Y8qDYYMx1xxueDLKbQztlPixhEeREXZKSDFrCCsDIZIl2sh+zK
 2Z4A==
X-Gm-Message-State: AOAM530t4UTdyYdsBq4t8HFh+VFbgljwWqJRJiAscRri37AY1b3rYUlj
 LTibyt7OnVU7+Q1eM8qWjGsFnIb3qzT+q7QTFus0xCG7FRn/Dfww6yI3eXrpRStaFcmbuYaUxg/
 URsaifOq66v1/Z5L2HcYfuA3Vip8h
X-Received: by 2002:a05:6000:510:b0:203:e469:f0a3 with SMTP id
 a16-20020a056000051000b00203e469f0a3mr5746851wrf.710.1650210324049; 
 Sun, 17 Apr 2022 08:45:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwluSaBfP+cDeg500TYp/r+b8CxJggQPGEGAC6GHMUeRr/2454YadMD0qyybbeUsLz88QkIXw==
X-Received: by 2002:a05:6000:510:b0:203:e469:f0a3 with SMTP id
 a16-20020a056000051000b00203e469f0a3mr5746832wrf.710.1650210323746; 
 Sun, 17 Apr 2022 08:45:23 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c414a00b0038ebb6884d8sm17878144wmm.0.2022.04.17.08.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 08:45:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/doc: Add in introduction sections about tiny drivers
 and external refs
Date: Sun, 17 Apr 2022 17:45:11 +0200
Message-Id: <20220417154511.94202-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Learning about the DRM subsystem could be quite overwhelming for newcomers
but there are lots of useful talks, slides and articles available that can
help to understand the needed concepts and ease the learning curve.

There are also simple DRM drivers that can be used as example about how a
DRM driver should look like.

Add sections to the introduction page, that contains references to these.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---

Changes in v2:
- Remove paragraph that gave wrong impression that DRM is complex (Pekka Paalanen).
- Add Thomas Zimmermann's and Pekka Paalanen's Acked-by tags.
- Replace "Learning material" title with "External References" (Thomas Zimmermann).
- Add a section about tiny DRM drivers being a good first example (Daniel Vetter).
- Add some more external references that I found interesting since v1 was posted.

 Documentation/gpu/introduction.rst | 60 ++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 25a56e9c0cfd..574f478c3674 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -112,3 +112,63 @@ Please conduct yourself in a respectful and civilised manner when
 interacting with community members on mailing lists, IRC, or bug
 trackers. The community represents the project as a whole, and abusive
 or bullying behaviour is not tolerated by the project.
+
+Simple DRM drivers to use as examples
+=====================================
+
+The DRM subsystem contains a lot of helper functions to ease writing drivers for
+simple graphic devices. For example, the `drivers/gpu/drm/tiny/` directory has a
+set of DRM drivers that are simple enough to be implemented in a single file.
+
+These drivers make use of the `struct drm_simple_display_pipe_funcs`, that hides
+any complexity of the DRM subsystem and just requires drivers to implement a few
+functions needed to operate the device. This could be used for devices that just
+need a display pipeline with one full-screen scanout buffer feeding one output.
+
+The tiny DRM drivers are good examples to understand how DRM drivers should look
+like since are written as a few hundreds line of code contained in a single file.
+
+External References
+===================
+
+Delving into a Linux kernel subsystem for the first time can be an overwhelming
+experience, one need to get familiar with all the needed concepts and learn the
+subsystem's internals.
+
+To shallow the learning curve, this section contains a list of presentations
+and documents that can be used to learn about DRM/KMS and graphics in general.
+
+There are different reasons why someone might want to get into DRM: porting an
+existing fbdev driver, write a DRM driver for a new hardware, fixing bugs that
+may face when working on the graphics user-space stack, etc. For this reason,
+the learning material covers many aspects of the Linux graphics stack. From an
+overview of the kernel and user-space stacks to very specific topics.
+
+The list is sorted in reverse chronological order, to keep the most up-to-date
+material at the top. But all of them contain useful information, and it can be
+valuable to go through older material to understand the rationale and context
+in which the recent changes to the DRM subsystem were made.
+
+Conference talks
+----------------
+
+* `An Overview of the Linux and Userspace Graphics Stack <https://www.youtube.com/watch?v=wjAJmqwg47k>`_ - Paul Kocialkowski (2020)
+* `Getting pixels on screen on Linux: introduction to Kernel Mode Setting <https://www.youtube.com/watch?v=haes4_Xnc5Q>`_ - Simon Ser (2020)
+* `Everything Great about Upstream Graphics <https://www.youtube.com/watch?v=kVzHOgt6WGE>`_ - Daniel Vetter (2019)
+* `An introduction to the Linux DRM subsystem <https://www.youtube.com/watch?v=LbDOCJcDRoo>`_ - Maxime Ripard (2017)
+* `Embrace the Atomic (Display) Age <https://www.youtube.com/watch?v=LjiB_JeDn2M>`_ - Daniel Vetter (2016)
+* `Anatomy of an Atomic KMS Driver <https://www.youtube.com/watch?v=lihqR9sENpc>`_ - Laurent Pinchart (2015)
+* `Atomic Modesetting for Drivers <https://www.youtube.com/watch?v=kl9suFgbTc8>`_ - Daniel Vetter (2015)
+* `Anatomy of an Embedded KMS Driver <https://www.youtube.com/watch?v=Ja8fM7rTae4>`_ - Laurent Pinchart (2013)
+
+Slides and articles
+-------------------
+
+* `Understanding the Linux Graphics Stack <https://bootlin.com/doc/training/graphics/graphics-slides.pdf>`_ - Bootlin (2022)
+* `DRM KMS overview <https://wiki.st.com/stm32mpu/wiki/DRM_KMS_overview>`_ - STMicroelectronics (2021)
+* `Linux graphic stack <https://studiopixl.com/2017-05-13/linux-graphic-stack-an-overview>`_ - Nathan Gauër (2017)
+* `Atomic mode setting design overview, part 1 <https://lwn.net/Articles/653071/>`_ - Daniel Vetter (2015)
+* `Atomic mode setting design overview, part 2 <https://lwn.net/Articles/653466/>`_ - Daniel Vetter (2015)
+* `The DRM/KMS subsystem from a newbie’s point of view <https://bootlin.com/pub/conferences/2014/elce/brezillon-drm-kms/brezillon-drm-kms.pdf>`_ - Boris Brezillon (2014)
+* `A brief introduction to the Linux graphics stack <https://blogs.igalia.com/itoral/2014/07/29/a-brief-introduction-to-the-linux-graphics-stack/>`_ - Iago Toral (2014)
+* `The Linux Graphics Stack <https://blog.mecheye.net/2012/06/the-linux-graphics-stack/>`_ - Jasper St. Pierre (2012)
-- 
2.35.1

