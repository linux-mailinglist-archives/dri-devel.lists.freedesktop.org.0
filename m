Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BB851CBC3
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 00:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C78A10E097;
	Thu,  5 May 2022 22:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C0A10E097
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 22:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651788009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g7o/PcjByL5k08SmN+MKIpgdp4lhrjdKDcCDQqkuG3g=;
 b=HcFpffFMh7mIPp7J1Krk8HTEN7zF+NzbxscksNzmSlvbJm3rdODJQeee+BLUOAHjI3/1t+
 Bgb2Bu9qQY8pj1jdbtMI+z8JPiHBOlrpIPzMN1GEBRGnmIiIuU9+3m/Qr2i0gjHSh8JWQq
 nha5G8cmDyLplrYfDyok+8r9plNPfbs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-IyM9HncrPrqcoLfEZ5MJ6w-1; Thu, 05 May 2022 18:00:09 -0400
X-MC-Unique: IyM9HncrPrqcoLfEZ5MJ6w-1
Received: by mail-wr1-f70.google.com with SMTP id
 s8-20020adf9788000000b0020adb01dc25so1867956wrb.20
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 15:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g7o/PcjByL5k08SmN+MKIpgdp4lhrjdKDcCDQqkuG3g=;
 b=2fqMCUGU0M+4uu8ziGcYFzbEjm9KAmmik8eE1jvXmnPicCtgOnknZUBWliXFWne56y
 HhIHcYjS5yGVhcnlHXPRp/HqIyN/GezRHcbHDoGsmnb4kOpsnec3CoYj4jGShC7QlXy4
 oO8fvv6uV1TwxgG1eV7ZB95pHYY4PCQUAoe3fHLZ10cdw7zFADFUvLF5MkQhaqmh9I9/
 TghNjWx5MbG0t8l2h3g2toc8/bew3yPqyaUDKxHTfHJtgmOr9wgeRQtt/im7kuvOY2I7
 N8nCwqesqlyXoKvt36U0kVnvllT6n/vxnPDM72TbUhS03N6i/GhROyBVvr3UWYlQPCRB
 k9hw==
X-Gm-Message-State: AOAM530braOIkg0RHN2tR+hXKPRdH9+Oj/lT4T+cu0p/wU79zIlmkkkL
 fltMBgGGofldwcpx//UfD4lqLR/VO08KBNROEzIXAGyV8kHO2Zam2s/drQOQWY7KAZCo38V0k3q
 wBtQGIXN13+ogE/2At+ol/F64uK/j
X-Received: by 2002:a05:6000:1815:b0:20a:deee:3cf0 with SMTP id
 m21-20020a056000181500b0020adeee3cf0mr154924wrh.210.1651788006925; 
 Thu, 05 May 2022 15:00:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk9nG54+YuJURc6OI8oVH2TrMJldwkCWvspEI1wXTQzvXeoooK0kqJvqJXa5/C6tS1lOzpJQ==
X-Received: by 2002:a05:6000:1815:b0:20a:deee:3cf0 with SMTP id
 m21-20020a056000181500b0020adeee3cf0mr154910wrh.210.1651788006661; 
 Thu, 05 May 2022 15:00:06 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 25-20020a05600c029900b003942a244ed1sm2271241wmk.22.2022.05.05.15.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 15:00:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] fbdev: Fix use-after-free caused by wrong fb_info
 cleanup in drivers
Date: Thu,  5 May 2022 23:59:43 +0200
Message-Id: <20220505215947.364694-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Peter Jones <pjones@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series contains patches suggested by Daniel Vetter to fix a use-after-free
error in the fb_release() function, due a fb_info associated with a fbdev being
freed too early while a user-space process still has the fbdev dev node opened.

That is caused by a wrong management of the struct fb_info lifetime in drivers,
but the fbdev core can also be made more resilient about it an leak

This can easily be reproduced with the simplefb driver doing the following:

$ cat < /dev/fb0 &
$ echo simple-framebuffer.0 > /sys/bus/platform/drivers/simple-framebuffer/unbind
$ kill %1

[  257.490471] ------------[ cut here ]------------
...
[  257.495125] refcount_t: underflow; use-after-free.
[  257.495222] WARNING: CPU: 0 PID: 975 at lib/refcount.c:28 refcount_warn_saturate+0xf4/0x144
...
[  257.637482] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  257.644441] pc : refcount_warn_saturate+0xf4/0x144
[  257.649226] lr : refcount_warn_saturate+0xf4/0x144
[  257.654009] sp : ffff80000a06bbf0
[  257.657315] x29: ffff80000a06bbf0 x28: 000000000000000a x27: 000000000000000a
[  257.664448] x26: 0000000000000000 x25: ffff470b88c6a180 x24: 000000000000000a
[  257.671581] x23: ffff470b81706480 x22: ffff470b808c2160 x21: ffff470b8922ba20
[  257.678713] x20: ffff470b891f5810 x19: ffff470b891f5800 x18: ffffffffffffffff
[  257.685846] x17: 3a725f7463656a62 x16: ffffbb18c6465fd4 x15: 0720072007200720
[  257.692978] x14: 0720072d072d072d x13: 0a2e656572662d72 x12: 657466612d657375
[  257.700110] x11: 203b776f6c667265 x10: 646e75203a745f74 x9 : ffffbb18c58f6c90
[  257.707242] x8 : 75203b776f6c6672 x7 : 65646e75203a745f x6 : 0000000000000001
[  257.714373] x5 : ffff470bff8ec418 x4 : 0000000000000000 x3 : 0000000000000027
[  257.721506] x2 : 0000000000000000 x1 : 0000000000000027 x0 : 0000000000000026
[  257.728638] Call trace:
[  257.731075]  refcount_warn_saturate+0xf4/0x144
[  257.735513]  put_fb_info+0x70/0x7c
[  257.738916]  fb_release+0x60/0x74
[  257.742225]  __fput+0x88/0x240
[  257.745276]  ____fput+0x1c/0x30
[  257.748410]  task_work_run+0xc4/0x21c
[  257.752066]  do_exit+0x170/0x370
[  257.755288]  do_group_exit+0x40/0xb4
[  257.758858]  get_signal+0x8e0/0x90c
[  257.762339]  do_signal+0x1a0/0x280
[  257.765733]  do_notify_resume+0xc8/0x390
[  257.769650]  el0_da+0xe8/0xf0
[  257.772613]  el0t_64_sync_handler+0xe8/0x130
[  257.776877]  el0t_64_sync+0x190/0x194
[  257.780534] ---[ end trace 0000000000000000 ]---

Patch #1 adds a WARN_ON() to framebuffer_release() to prevent the use-after-free
to happen.

Patch #2, #3 and #4 fix the simplefb, efifb and vesafb drivers respectively, to
free the resources at the correct place.

Changes in v3:
- Add Fixes: tag (Daniel Vetter).
- Include in commit message a note that drivers are still broken
  but at least reverts to the previous behavior (Daniel Vetter).
- Only move framebuffer_release() and don't do any other change
  (Daniel Vetter).

Changes in v2:
- Also do the change for vesafb (Thomas Zimmermann).

Daniel Vetter (1):
  fbdev: Prevent possible use-after-free in fb_release()

Javier Martinez Canillas (3):
  fbdev: simplefb: Cleanup fb_info in .fb_destroy rather than .remove
  fbdev: efifb: Cleanup fb_info in .fb_destroy rather than .remove
  fbdev: vesafb: Cleanup fb_info in .fb_destroy rather than .remove

 drivers/video/fbdev/core/fbsysfs.c | 4 ++++
 drivers/video/fbdev/efifb.c        | 9 ++++++++-
 drivers/video/fbdev/simplefb.c     | 8 +++++++-
 drivers/video/fbdev/vesafb.c       | 8 +++++++-
 4 files changed, 26 insertions(+), 3 deletions(-)

-- 
2.35.1

