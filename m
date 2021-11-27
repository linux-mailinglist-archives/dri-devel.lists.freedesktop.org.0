Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05595460115
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 20:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73876E083;
	Sat, 27 Nov 2021 19:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE866E083
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 19:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638040759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FmEONlRLRS7Q3m1/IGZ8/wAcZ9/vJrKLoCBv/npZi2U=;
 b=ZF7h75HaXnc2iEipLvmEQxZeJN0pogRvEP+1OSXJZBi4d6aqL1brtaGUEc0798Xc19/ptC
 Py59B1Jaxw3dPav6YLMFK1+kpppYxf7zC6SWQsxLhhx0/VASkTPTlzrevZ6hwgg/syn1wv
 uuDLcUdICFGzfvCL9Ar5Uy9Z7CmZoXg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-KpTkgJhLN2q43ZizD7jAqQ-1; Sat, 27 Nov 2021 14:19:17 -0500
X-MC-Unique: KpTkgJhLN2q43ZizD7jAqQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 a85-20020a1c7f58000000b0033ddc0eacc8so7203033wmd.9
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 11:19:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FmEONlRLRS7Q3m1/IGZ8/wAcZ9/vJrKLoCBv/npZi2U=;
 b=4cly5qjX9CmVUxH9J6N+/JOLOlHXxuiWkrtCyOQKehPlrElBF3hw5pw8YpplG9Bf6D
 OE3aVBpe6gnuQTo8TgxJ9dWA3tWIGB2s2CKI1u667cUfdj3zidiJZiZKertzY7jIiDqE
 2NG2ImlSRJstpfdBcNM7Bt9HElljVpfsbuU3FhEBDUa1hekeka4B16aZocqwGtpYP1r5
 i7psoR4cEDanjTL+DkfZ6IWbsONH2huHa62EKWd3PxBbcUsbp8URb92sHQRegRGpe0lI
 xHhHKAH3sK9c6iPzTdNnyBoYMJNkhB7ZJiwzoWylI2/T4DeXAJxHyXJDl9dDifuXHVsK
 8Mtg==
X-Gm-Message-State: AOAM533vKhBfsw75k5wuUOdMXw9OEbydNuFd9LIJorX3XkEjdt6iI4Wr
 ptvO6IVoApxVL0ZOjG9vKpoUyD/Tq8/PYGwsHB5Rjlkcloob2RlwDrRBvlC8f6cmZObloQ7OBsq
 4FlFgnfZClXZtPoTAcKeWnmWnxj6o
X-Received: by 2002:adf:eac8:: with SMTP id o8mr22999000wrn.337.1638040756560; 
 Sat, 27 Nov 2021 11:19:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxabUOTDhc5FjxR7ONoe8Du3sRBNo52FTEfP5Zf+UIg18HyEeIugSjNA5q9jOQ28IpzglwJhQ==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr22998975wrn.337.1638040756301; 
 Sat, 27 Nov 2021 11:19:16 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id i17sm11391314wmq.48.2021.11.27.11.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 11:19:15 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Fix build error caused by missing drm_nomodeset.o
Date: Sat, 27 Nov 2021 20:19:10 +0100
Message-Id: <20211127191910.709356-1-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 kernel test robot <lkp@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch for commit ("6a2d2ddf2c34 drm: Move nomodeset kernel parameter
to the DRM subsystem") was generated with config 'diff.noprefix true'.

But later was applied using 'cat nomodeset.mbox | dim apply-branch' on a
machine with 'diff.noprefix false'. And command 'git am --scissors -3' as
used by the dim tool doesn't handle that case well, since the 3-way merge
wrongly resolves the path for new file drivers/gpu/drm/drm_nomodeset.c as
gpu/drm/drm_nomodeset.c instead.

It led to the following build error as reported by the kernel test robot:

  make[4]: *** No rule to make target 'drivers/gpu/drm/drm_nomodeset.o', needed by 'drivers/gpu/drm/built-in.a'.

Fixes: ("6a2d2ddf2c34 drm: Move nomodeset kernel parameter to the DRM subsystem")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 {gpu => drivers/gpu}/drm/drm_nomodeset.c | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {gpu => drivers/gpu}/drm/drm_nomodeset.c (100%)

diff --git a/gpu/drm/drm_nomodeset.c b/drivers/gpu/drm/drm_nomodeset.c
similarity index 100%
rename from gpu/drm/drm_nomodeset.c
rename to drivers/gpu/drm/drm_nomodeset.c
-- 
2.33.1

