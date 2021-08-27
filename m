Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A82F3F97B8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 12:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5440B6E90F;
	Fri, 27 Aug 2021 10:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11476E90F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 10:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630058446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+aJr1NTbvoxTLmIeJJqoJBHarMi/IcOrX6ArL1A6zIk=;
 b=fRWSaOwPFB7Z01gV0zjfd0ApL4De7177A4ITtcWUmbkwhfFdEKgCqnHvc4OpqjFlUOEeCY
 azCaLhwslixqC+1jQ6Lwk7uor0TxLnt5Hr84uB8bjYWKdHuIw+v793caBKSdXv0N9TXFvM
 8mXpCqpHfewUHP1KmYpAfE29qGP+n7E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-8LhHVT7INZ-dLWOZiqlkPA-1; Fri, 27 Aug 2021 06:00:42 -0400
X-MC-Unique: 8LhHVT7INZ-dLWOZiqlkPA-1
Received: by mail-wr1-f70.google.com with SMTP id
 b8-20020a5d5508000000b001574e8e9237so1693476wrv.16
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 03:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+aJr1NTbvoxTLmIeJJqoJBHarMi/IcOrX6ArL1A6zIk=;
 b=AzxqUL7DRkg9NV1tXZozRbALZai5fF0Sl99S+cYSejP5qXlHN7Fogx8Oqk1gIULnj5
 IZIhuFLNXkNGdvTtjByMVIKCPqiTkZq9CSHPLfASvqmETlveKmT+vMJTSlzapF8fgncv
 O/x5vR3Vsk8T9qGJArqUsE9i6In9HyilQRSzIcprgDLUz70tTHf1/ExAN2eM+1mh7tlP
 1D++4HI7EoSQzTSbrR9dMKllcNDVIg1WCOWnkLWvKb5S1JOpXt/GdN3j3AIWEX3b5GR2
 O8n/wX4SsKUD3T/W4c91FtmN15cKDkseSr5WQn5+NgVYR9p2PQ7F8krCAGuImFpwfeN+
 chvQ==
X-Gm-Message-State: AOAM531r32JANyG1hXo1AsCmfS3Hw5H9aQIKKQkGZIn4cZrJHv6qXfv1
 1+kEhYcn0ASWM93XLACBB+YFWlZo+qMfgkIe7um4x42aekpjdZp+eSPJjTJvataGN/jSz61Z7CK
 q+b+RW07RvRP66tScxrvsqCvjzoHO
X-Received: by 2002:a05:600c:428a:: with SMTP id
 v10mr18455117wmc.25.1630058441648; 
 Fri, 27 Aug 2021 03:00:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD3l80v92gfAfOSZ8b1Ut69bemPoE/9nlRVQcrJ7xuf3wtFFgtxktW5NFZYCYctIfnyuFMVA==
X-Received: by 2002:a05:600c:428a:: with SMTP id
 v10mr18455078wmc.25.1630058441335; 
 Fri, 27 Aug 2021 03:00:41 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z17sm1121267wrh.66.2021.08.27.03.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 03:00:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, x86@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Peter Robinson <pbrobinson@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, Ingo Molnar <mingo@redhat.com>,
 David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [RFC PATCH 0/4] Allow to use DRM fbdev emulation layer with CONFIG_FB
 disabled
Date: Fri, 27 Aug 2021 12:00:23 +0200
Message-Id: <20210827100027.1577561-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

This patch series splits the fbdev core support in two different Kconfig
symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
be disabled, while still using fbcon with the DRM fbdev emulation layer.

The reason for doing this is that now with simpledrm we could just boot
with simpledrm -> real DRM driver, without needing any legacy fbdev driver
(e.g: efifb or simplefb) even for the early console.

We want to do that in the Fedora kernel, but currently need to keep option
CONFIG_FB enabled and all fbdev drivers explicitly disabled, which makes
the configuration harder to maintain.

It is a RFC because I'm not that familiar with the fbdev core, but I have
tested and works with CONFIG_DRM_FBDEV_EMULATION=y and CONFIG_FB disabled.
This config automatically disables all the fbdev drivers that is our goal.

Patch 1/4 is just a clean up, patch 2/4 moves a couple of functions out of
fbsysfs.o, that are not related to sysfs attributes creation and finally
patch 3/4 makes the fbdev split that is mentioned above.

Patch 4/4 makes the DRM fbdev emulation depend on the new FB_CORE symbol
instead of FB. This could be done as a follow-up but for completeness is
also included in this series.

Best regards,
Javier


Javier Martinez Canillas (4):
  fbdev: Rename fb_*_device() functions names to match what they do
  fbdev: Move framebuffer_{alloc,release}() functions to fbmem.c
  fbdev: Split frame buffer support in FB and FB_CORE symbols
  drm: Make fbdev emulation depend on FB_CORE instead of FB

 arch/x86/Makefile                  |  2 +-
 arch/x86/video/Makefile            |  2 +-
 drivers/gpu/drm/Kconfig            |  2 +-
 drivers/video/console/Kconfig      |  2 +-
 drivers/video/fbdev/Kconfig        | 57 +++++++++++++---------
 drivers/video/fbdev/core/Makefile  | 13 +++--
 drivers/video/fbdev/core/fbmem.c   | 73 ++++++++++++++++++++++++++--
 drivers/video/fbdev/core/fbsysfs.c | 77 +-----------------------------
 include/linux/fb.h                 | 18 ++++++-
 9 files changed, 134 insertions(+), 112 deletions(-)

-- 
2.31.1

