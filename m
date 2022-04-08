Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9464F9A31
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9607510E275;
	Fri,  8 Apr 2022 16:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2859310E275
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 16:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649434422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FxweDGdSiPFYVaaLK6PgKCqH4/CRdU5joOpSS8tgup8=;
 b=H95xnZ5C5Kojpvwot+HxU0YCukQeykfmshMaxSyJyXlnVM6MgCR/WNi0zVsPNjDwLKLhwy
 fp/N5FYriJSXg+wnKrE9Ou8PYZ4ENotJbmgv9y0KZ6SuvMg9E6yFhZeq8CxKuxIMFRe9uI
 TiMyUa/+Vi13pmqgA9srP6bOFEgteqU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-VLk0tvvKMVuB3zHEZYtqsA-1; Fri, 08 Apr 2022 12:13:41 -0400
X-MC-Unique: VLk0tvvKMVuB3zHEZYtqsA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v9-20020adfc409000000b002079b5b29ecso258895wrf.11
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 09:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FxweDGdSiPFYVaaLK6PgKCqH4/CRdU5joOpSS8tgup8=;
 b=ZybY3AwhhPpdLADbkwgqF6NcHtMgavxWrLTyKJVBD6OEmp2xwUtIJIQ2kWH+i/QWu4
 y6nt6pGpJ/DGehOXX/FfIpJCBxSF/C6cVwc3Ydq0731JKM9wCc+aGG9LKuMUB2orG8Eh
 hAVTfdFu6atL81lIYbB7dn1KwCozyE6Mo1XH97HCRUiS36eIUt1SBgqmgJc6s1O8yEGZ
 vRa8LnuMIJsN4gLjcLIqO/k7EgI8kRPuXu1xRHHY6VJx8n+i5h7jBuPZS6zQlwDkYnkP
 HGknYfGrjeT3ZFxwIAjtzi2WoE46M6vlyVomvYS17+MmocYMosagDZoVAsOW9DP4CHwy
 dh8w==
X-Gm-Message-State: AOAM5331oNjBKJlKEjj/QPTX0p0PlB4ffdsDOGFagVQRFHLVDCN9Y97p
 nlmgR3/wwgBQO0u+tqn6jcodjNuraEuaMBOl3qr0D1a/fOH7vD+NQfzeQpjQlL5xIA4EH0U2VKB
 aHiWqVRxyD6yWrpgI0tP+QdGIFIBg
X-Received: by 2002:a5d:5918:0:b0:207:9b1d:d577 with SMTP id
 v24-20020a5d5918000000b002079b1dd577mr1401015wrd.263.1649434419782; 
 Fri, 08 Apr 2022 09:13:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGuPJtm+OK8CRzVMa6iObLDan7gUZy/Va2rhrxWCO/ThvzUASQ21sgFx01F5fPgAK4DQEKmw==
X-Received: by 2002:a5d:5918:0:b0:207:9b1d:d577 with SMTP id
 v24-20020a5d5918000000b002079b1dd577mr1400995wrd.263.1649434419456; 
 Fri, 08 Apr 2022 09:13:39 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfeb8f000000b002060d26c211sm14377455wrn.114.2022.04.08.09.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:13:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Fix some race conditions that exists between fbmem and
 sysfb
Date: Fri,  8 Apr 2022 18:13:17 +0200
Message-Id: <20220408161322.270176-1-javierm@redhat.com>
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
Cc: Miaoqian Lin <linmq006@gmail.com>, linux-doc@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Peter Jones <pjones@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, Borislav Petkov <bp@suse.de>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Johan Hovold <johan@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Zhen Lei <thunder.leizhen@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>
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

This series attempt to fix it more properly and revert the mentioned hack.
That will also unblock a pending patch to not make the num_registered_fb
variable visible to drivers anymore, since that's internal to fbdev core.

This is a v2 that addresses issues in v1 pointed out by Daniel.

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

Best regards,
Javier

Changes in v2:
- Rebase on top of latest drm-misc-next and fix conflicts (Daniel Vetter).
- Add kernel-doc comments and include in other_interfaces.rst (Daniel Vetter).
- Explain in the commit message that fbmem has to unregister the device
  as fallback if a driver registered the device itself (Daniel Vetter).
- Also explain that fallback in a comment in the code (Daniel Vetter).
- Don't encode in fbmem the assumption that sysfb will always register
  platform devices (Daniel Vetter).
- Add a FIXME comment about drivers registering devices (Daniel Vetter).
- Drop RFC prefix since patches were already reviewed by Daniel Vetter.
- Add Daniel Reviewed-by tags to the patches.

Daniel Vetter (1):
  Revert "fbdev: Prevent probing generic drivers if a FB is already
    registered"

Javier Martinez Canillas (4):
  firmware: sysfb: Make sysfb_create_simplefb() return a pdev pointer
  firmware: sysfb: Add helpers to unregister a pdev and disable
    registration
  fbdev: Restart conflicting fb removal loop when unregistering devices
  fbdev: Fix some race conditions between fbmem and sysfb

 .../driver-api/firmware/other_interfaces.rst  |  6 ++
 drivers/firmware/sysfb.c                      | 77 +++++++++++++++++--
 drivers/firmware/sysfb_simplefb.c             | 16 ++--
 drivers/video/fbdev/core/fbmem.c              | 57 ++++++++++----
 drivers/video/fbdev/efifb.c                   | 11 ---
 drivers/video/fbdev/simplefb.c                | 11 ---
 include/linux/fb.h                            |  1 -
 include/linux/sysfb.h                         | 29 +++++--
 8 files changed, 150 insertions(+), 58 deletions(-)

-- 
2.35.1

