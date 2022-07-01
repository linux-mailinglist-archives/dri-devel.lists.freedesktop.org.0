Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4117E563327
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 14:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01F511BDDD;
	Fri,  1 Jul 2022 12:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D447711BDDC
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656677285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4MitOBaTFuNWGBWI6IjFwtubmr1bZjp+g6N0csw7RBw=;
 b=awnrzJ31Gg0JztlQ830Dqf7epWT4ZCtUIE97ri09z3ml2WPsaUOb6lX3EKT+ezJe27hE9k
 oBT2rAlGiSQ64Aguwmqtxpi9d3svuy8lemVTbMuGtjcDfocsKSvY/7OBC9UVs11oYLstZ+
 9zflHcbTmWr/NUWrJc/nJrnPGd0ysHw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-SV9UBkKQPUWB0nYEmGgOzA-1; Fri, 01 Jul 2022 08:08:02 -0400
X-MC-Unique: SV9UBkKQPUWB0nYEmGgOzA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r132-20020a1c448a000000b003a02a3f0beeso2958641wma.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 05:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4MitOBaTFuNWGBWI6IjFwtubmr1bZjp+g6N0csw7RBw=;
 b=ThLoaN62Yd5Hc7cmEdn9p8t7wMAjVIiSXlkKPWZo9h+ZLMWHLy/7mTBzrbJnsi9xRC
 hMmcfOuzcHYgJyGPBgCfUY5gRCM9WFXb+x2dKY50fpnqJYWJzBVdDLqPgpHYzEsmk7f5
 yvMOmq+SJOpk/i72qAb6IUXnORdiOMYwisEoJAVt2mXmiX9iuYAyq4ixyG4DOKKeLsx5
 Gy8nvqKR2FBJBi0Q37Tgb++EpzJE2HqT9b81qOCi4nO7+SMU2QoXo2v2t99ajGwH0aW0
 /JHIN/lE/rW7UOXRBrZNUaZ6CcsRUP18HR+AlVSBEErX+wyCVY/7a2rJ1OyTs5eVthAt
 Gd5A==
X-Gm-Message-State: AJIora/Kb7YokbyGenKdwCK2MysAje5qfD2cJVPi+Ub777xm4n6kLOuB
 fNTFRwBq8jFAJ3wTjiMd8bzZ98SRopoBhPSugXMGuIxIG8CoV6ofT1kfi/YkTbHAsug8TI2jT8r
 p1DjxGFCN3HKnkxaiA1HVwdh5A9TC
X-Received: by 2002:a05:6000:70b:b0:21b:a816:85c6 with SMTP id
 bs11-20020a056000070b00b0021ba81685c6mr13134660wrb.639.1656677280870; 
 Fri, 01 Jul 2022 05:08:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sfgsRUF1Y2CzqWiJIBUOimbTLgrvvPQu6gA9irx8HnpbPsGY6YUm8CtBXgbK24H9zlzE4cXg==
X-Received: by 2002:a05:6000:70b:b0:21b:a816:85c6 with SMTP id
 bs11-20020a056000070b00b0021ba81685c6mr13134625wrb.639.1656677280576; 
 Fri, 01 Jul 2022 05:08:00 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v4-20020a7bcb44000000b0039746638d6esm9813160wmj.33.2022.07.01.05.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 05:08:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm: A couple of fixes for drm_copy_field() helper
 function
Date: Fri,  1 Jul 2022 14:07:53 +0200
Message-Id: <20220701120755.2135100-1-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Peter Robinson reported me a kernel bug in one of his aarch64 test boards
and even though I was not able to reproduce it, I think that figured out
what the problem was. It seems the cause is that a DRM driver doesn't set
some of the struct drm fields copied to userspace via DRM_IOCTL_VERSION.

Even though this is a driver bug, we can make drm_copy_field() more robust
and warn about it instead of leading to an attempt to copy a NULL pointer.

While looking at this, I also found that a variable in drm_copy_field() is
not using the correct type. So I included that change in the patch-set too.

Best regards,
Javier


Javier Martinez Canillas (2):
  drm: Use size_t type for len variable in drm_copy_field()
  drm: Prevent drm_copy_field() to attempt copying a NULL pointer

 drivers/gpu/drm/drm_ioctl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.36.1

