Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A474F641B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 18:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9BA10E42A;
	Wed,  6 Apr 2022 16:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BEC10E429
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 16:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649261208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z2VH15DInn1AZtnEsLb+elNYhtkABvKZLJ4uYvk26l8=;
 b=KhNkPixoCMp6jVBQ7i9b+ieDsIvRJAGsxXTUzRYPetJM5RCbRejPqpJTaOrGMF/rb/nBfU
 boJ/TDWhOwdvBLGsXZTsn7m2liLPae+RPQgw27xE40MZmmOh8k+u1AmYYtz2thgejKBygs
 Ap6DWgSjx3+AseghYRE6WTSWCxyIMfI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-1N-y0mdJMlmDWLTGBQAKjQ-1; Wed, 06 Apr 2022 12:06:44 -0400
X-MC-Unique: 1N-y0mdJMlmDWLTGBQAKjQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 189-20020a1c02c6000000b0038e6c4c6472so3159783wmc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 09:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z2VH15DInn1AZtnEsLb+elNYhtkABvKZLJ4uYvk26l8=;
 b=PGONuHKc9SZdBN7LJXY2pxzlDia4ASxkY98fcncvGIl+cE/KIujTn48X2JO6FN6ArE
 Bdr0r17CC33c+/yRCI+m2YERsfRLXtLBGU4lLR4qXNPuedooLa0RtXfVr9pPdtumZKxb
 ZNEQ7e1KECu7tGA0/tILMhMqYeRhe4uDooqldkzKBgDcpCHcj12Ji1nMs1oDQyhu8ybE
 Kf9QwL3VE8o8XGCP5u2AmoVkbeOkQI1uZYDFYu0AWnB2fgCCK3VcQb5LNW1Ix2dv7pIW
 Vkx0bYGMaOKyVCHqYJ9Agm9yV5Z4qMCJ8A8MJtvjSPeqzZ/K153b4FJtDcvKKxMz78wP
 GTvA==
X-Gm-Message-State: AOAM530G1Toion23ezfuGSSbBA1CsIIbeFJ9tist5qjzoJVJvpYWJSqN
 jK5mXcmCxLasU3Qji0XnU5krw1eJUnRMXkfHtIC0s0i2uvqVEacJI4fmHTpbccvex1gtvinYvBu
 6HfdPxaS9tEi74QPFODIhCRgjcgJG
X-Received: by 2002:a05:600c:b55:b0:38e:70e7:511f with SMTP id
 k21-20020a05600c0b5500b0038e70e7511fmr8332652wmr.178.1649261203159; 
 Wed, 06 Apr 2022 09:06:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7yE8td6/fkffNhvrsqmHf15H0cuBaZltuOzDP9IJ5K6fOajl4WM2WGSsI9m1B/7+4GryIGA==
X-Received: by 2002:a05:600c:b55:b0:38e:70e7:511f with SMTP id
 k21-20020a05600c0b5500b0038e70e7511fmr8332625wmr.178.1649261202834; 
 Wed, 06 Apr 2022 09:06:42 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a1c6a01000000b0038c9f6a3634sm5038899wmc.7.2022.04.06.09.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 09:06:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/5] Fix some race conditions that exists between fbmem
 and sysfb
Date: Wed,  6 Apr 2022 18:06:27 +0200
Message-Id: <20220406160632.496684-1-javierm@redhat.com>
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Zheyu Ma <zheyuma97@gmail.com>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Zhen Lei <thunder.leizhen@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Borislav Petkov <bp@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

The patches in this series are mostly changes suggested by Daniel Vetter
to fix some race conditions that exists between the fbdev core (fbmem)
and sysfb with regard to device registration and removal.

For example, it is currently possible for sysfb to register a platform
device after a real DRM driver was registered and requested to remove the
conflicting framebuffers.

A symptom of this issue, was worked around with by commit fb561bf9abde
("fbdev: Prevent probing generic drivers if a FB is already registered")
but that's really a hack and should be reverted.

This series attempt to fix it more properly and reverted the mentioned
hack. This will also unblock a pending patch to not make num_registered_fb
visible to drivers anymore, since that's really internal to fbdev core.

Patch #1 is just a trivial preparatory change.

Patch #2 add sysfb_disable() and sysfb_try_unregister() helpers for fbmem
to use them.

Patch #3 changes how is dealt with conflicting framebuffers unregistering,
rather than having a variable to determine if a lock should be take, it
just drops the lock before unregistering the platform device.

Patch #4 fixes the mentioned race conditions and finally patch #5 is the
revert patch that was posted by Daniel before but he dropped from his set.

The patches were tested on a rpi4 using different video configurations:
(simpledrm -> vc4 both builtin, only vc4 builtin, only simpledrm builtin
and simpledrm builtin with vc4 built as a module).

I'm sending as an RFC since there are many changes to the locking scheme
and that is always tricky to get right. Please let me know what you think.

Best regards,
Javier


Daniel Vetter (1):
  Revert "fbdev: Prevent probing generic drivers if a FB is already
    registered"

Javier Martinez Canillas (4):
  firmware: sysfb: Make sysfb_create_simplefb() return a pdev pointer
  firmware: sysfb: Add helpers to unregister a pdev and disable
    registration
  fbdev: Restart conflicting fb removal loop when unregistering devices
  fbdev: Fix some race conditions between fbmem and sysfb

 drivers/firmware/sysfb.c          | 51 ++++++++++++++++++++++++++-----
 drivers/firmware/sysfb_simplefb.c | 24 +++++++++------
 drivers/video/fbdev/core/fbmem.c  | 38 ++++++++++++++++++-----
 drivers/video/fbdev/efifb.c       | 11 -------
 drivers/video/fbdev/simplefb.c    | 11 -------
 include/linux/fb.h                |  1 -
 include/linux/sysfb.h             | 27 +++++++++++++---
 7 files changed, 111 insertions(+), 52 deletions(-)

-- 
2.35.1

