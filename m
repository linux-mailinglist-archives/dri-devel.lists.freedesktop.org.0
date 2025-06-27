Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8460BAEB67A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 13:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1AD10E196;
	Fri, 27 Jun 2025 11:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O/QbMMcd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB80C10E196
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 11:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751024025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3aRzI0bjtMw21rZmghu7msd+/WgHADKWD3NdKB/6P48=;
 b=O/QbMMcdb4RxqUMC8snmOMRsVpJUXfl5Kl4w/2tWTkVnVWymYWTkkojoZoZs1vyWPampC8
 2o4IEl1csPYgjgsGid5aHBxH1nh/qkwwn+X4XxXgmW8fLMi+tN32WR2XkBfZGCf+Sx9AK2
 ke/77W+I+nvE0mQY6fR/HSeJmya4eTY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-UpgzYk18NmSRIkHfwbsQog-1; Fri, 27 Jun 2025 07:33:44 -0400
X-MC-Unique: UpgzYk18NmSRIkHfwbsQog-1
X-Mimecast-MFC-AGG-ID: UpgzYk18NmSRIkHfwbsQog_1751024023
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43e9b0fd00cso10842025e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 04:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751024023; x=1751628823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3aRzI0bjtMw21rZmghu7msd+/WgHADKWD3NdKB/6P48=;
 b=GAh7y7UTyh4CCMsl/yXk5qomENKUU75XhfJlZK5L34gi5FkjDGyt4o8/KOjApHtj5l
 sG+fgXQQCuQb1tKq1s9XREbeZBX0wih9M6WJ2HNyr2dMtAgTOoJCHzkQYCr8qkizo+Yq
 gBi6gYCwhqQx2dwoIaD5341jZ/ue5uftp+Q55NdQj1MUAeNIuxsbH6iUp9xvE29NjcUl
 NYGckYgYxYoczWevOAJ7LVBAgWby8UBGeyx5cXVPbiEG6GYmM/iyOxaNYpqqKfbXDyPK
 +OWTq1EggTK+PbihZacNhfsVR4qnMXzZzB+5vTmU4KBqpdW3TiE2pn1GEEUch8x+fvMq
 mDxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqRsxDV+usCf72lu5P00Ae4EDmw+VoYSHN6K1qPBInlTnkNGUyNRJzM5M7qVfJ4xC1YCbRP7rBJA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYzb3O1hQEm2ou0HD7+5Ddn0PujUAONTPGcaPko1l1eE8FYTXu
 eMVdLhlY5QVHW4LttcFHAQqdowgQ3goPsux5Kri/CqV4VwplDDllHGJrYB5fh9DbXyFn9Rqg4D0
 JwGNNc1BFtoXTYShXqKlwcZmHmoywlLzegdN3AE5HxgfBcFjBkMCfTE1vnXyW4h+LeaSeNg==
X-Gm-Gg: ASbGncu1JaG0i4ucvT72/rh5lintviMXsxjrSJ+TZTmPySrqEiOK2UYVN15oJbmJDfH
 lZmbDn3YMtz8ywzx1AP6dA3HLA9a/P4bDA8X/lZ8Zdd0xOVv3UhpxfHpWTEzJ4cvFE7UL394SXj
 KKr3ouZnRFqfMI+hLqv3AfXccef2xzEbCaWnr9SwxOcA6la3pTC/95S4DwOi4W62yZC00XWofwb
 0TLLNRWYzwRFrB0sYQDH6RBNWC28yqW2hekJlejwRVrBRboD/KK9Z1sjFkPPbPrf4AHb9jikcAm
 2TpD7KHJR8D7fa3gFJpE2W9wb7G6HqFF/l75hhURt8qkDgs=
X-Received: by 2002:a05:600c:608d:b0:453:ec2:c7b2 with SMTP id
 5b1f17b1804b1-4538f2cf96dmr26854775e9.7.1751024022969; 
 Fri, 27 Jun 2025 04:33:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpFrELdHrX0UB8KDlawLgo07Z21cQgKAE3Ir2Mmzr5B+NPapuquz0W2E3S8XCFYAMfKu6q8w==
X-Received: by 2002:a05:600c:608d:b0:453:ec2:c7b2 with SMTP id
 5b1f17b1804b1-4538f2cf96dmr26854425e9.7.1751024022509; 
 Fri, 27 Jun 2025 04:33:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45388888533sm56556465e9.21.2025.06.27.04.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 04:33:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Borislav Petkov <bp@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] MAINTAINERS: Add missing sysfb files to firmware framebuffers
 entry
Date: Fri, 27 Jun 2025 13:33:04 +0200
Message-ID: <20250627113328.2703491-1-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: URrZbRAxENe8lCeF9s6i0_7p5aG9ETQ2Gt-uEEoeueE_1751024023
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

The commit d391c5827107 ("drivers/firmware: move x86 Generic System
Framebuffers support") moved the sysfb*.c source files from arch/x86
to drivers/firmware, because the logic wasn't x86 specific and could
be used by other architectures.

But the drivers/firmware path is not listed in MAINTAINERS, which led
to the files being orphaned and scripts/get_maintainer.pl not listing
a mailing list to Cc anymore.

Now that we have an entry for all the firmware-provided framebuffer code,
add the missing sysfb files to make sure correct folks and list is Cc'ed.

Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Closes: https://lore.kernel.org/lkml/aF53djlieUNF_-aV@smile.fi.intel.com/
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ac6f0547cd32..f69a86b9610a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7497,10 +7497,12 @@ M:	Javier Martinez Canillas <javierm@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/firmware/sysfb*.c
 F:	drivers/gpu/drm/sysfb/
 F:	drivers/video/aperture.c
 F:	drivers/video/nomodeset.c
 F:	include/linux/aperture.h
+F:	include/linux/sysfb.h
 F:	include/video/nomodeset.h
 
 DRM DRIVER FOR GENERIC EDP PANELS
-- 
2.49.0

base-commit: 017a6f7e7e25017eef9c30946cb0e7c803cb3f35
branch: drm-misc-next

