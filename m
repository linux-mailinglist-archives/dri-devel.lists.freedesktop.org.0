Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 961B775404A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 19:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4CE10E10B;
	Fri, 14 Jul 2023 17:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A8210E0F8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 17:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689355015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mf75CzVatbv3pQWH8r83ggHJgBXSpuprGf6QjemCQEc=;
 b=XHtCdPcElYRZLmnOwT6G/noM4ZGKv8n6Yqb29Jy4J9LiUUmV4cUx7pgKwcBKqKwFfSMldL
 bOilqACNd+LN8WG2ese99pnT3ts/29kcp0YEHFRrDbxgAuBa8JclD9Nsc6UDLgiRrOFsLL
 IzrhIvwgfP8CeLqdw0U3KkrtxtmJ3eM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-uCGN2uTsNzmt-tjuR4vzdg-1; Fri, 14 Jul 2023 13:16:54 -0400
X-MC-Unique: uCGN2uTsNzmt-tjuR4vzdg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-314275b653eso1249011f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689355013; x=1691947013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mf75CzVatbv3pQWH8r83ggHJgBXSpuprGf6QjemCQEc=;
 b=dWqZAj8JezRboNaQPyKzC/NelkqXP7Xmj+YpwjoqUYgIebZGm/QDgaPffsCFx+cGvf
 pm7KC3FXfDLZQLMmySKx09+v+3ytZd2lt/NrirIRNundNdPylUlZYoUafYVMg9VdVg2M
 fr2rRTUMj8KuzA3u3bBxDOvgF9AKg0OHH6QalChEU4jPzNkRAZomvOahMXnYmecu4Rbu
 KhC2xgsuYO8+BxGZdpx2oe7VZpVbRWFrYyeQYAjPZiciK4uPA3x80P6FNSb0k0pxbJIL
 pDLRQCFnH81sC+w9dMywNu4UPmw5H4k+cPpaaMjCBq0EH8/9id834kZxKd0cdQlDWf/t
 ZonQ==
X-Gm-Message-State: ABy/qLZEvYbiTdHgFi+U5dgi1ySW+zpMgIUT1Ua78U8dAGFZWTtWIJYx
 FSGlrsq94x5f+53jroD4gTznigokKpKNSf/Ov7hyChabo2C0S3R2isML8AhSBJq3Ojr+4iyCN/M
 IWkkAu8Nf/pTfsiI7nWaRkA6uBz3I
X-Received: by 2002:adf:e952:0:b0:30e:5bd0:21a2 with SMTP id
 m18-20020adfe952000000b0030e5bd021a2mr4555837wrn.52.1689355013351; 
 Fri, 14 Jul 2023 10:16:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHHYMLvriZ/ew3fit58RdAJhlMPoyTBoUoDcI2u13QGKOg6uAz3m3L/7sXIDsUPeQ4e8DoUOA==
X-Received: by 2002:adf:e952:0:b0:30e:5bd0:21a2 with SMTP id
 m18-20020adfe952000000b0030e5bd021a2mr4555827wrn.52.1689355013182; 
 Fri, 14 Jul 2023 10:16:53 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d17-20020adfe891000000b003143cdc5949sm11620842wrm.9.2023.07.14.10.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:16:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] video: Add auxiliary display drivers to Graphics
 support menu
Date: Fri, 14 Jul 2023 19:16:29 +0200
Message-ID: <20230714171642.91185-2-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714171642.91185-1-javierm@redhat.com>
References: <20230714171642.91185-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Nipun Gupta <nipun.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drivers in this subsystem are for character-based LCD displays, which
can fall into the same category of the DRM/KMS and fbdev drivers that are
located under the "Graphics support" menu. Add auxdisplay there as well.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v5:
- Take the auxdisplay/Kconfig source out of "if HAS_IOMEM" (Geert Uytterhoeven).

 drivers/Kconfig       | 2 --
 drivers/video/Kconfig | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 514ae6b24cb2..496ca02ee18f 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -129,8 +129,6 @@ source "drivers/dma-buf/Kconfig"
 
 source "drivers/dca/Kconfig"
 
-source "drivers/auxdisplay/Kconfig"
-
 source "drivers/uio/Kconfig"
 
 source "drivers/vfio/Kconfig"
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 8b2b9ac37c3d..e5b1cc54cafa 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -25,6 +25,8 @@ config VIDEO_NOMODESET
 	bool
 	default n
 
+source "drivers/auxdisplay/Kconfig"
+
 if HAS_IOMEM
 
 config HAVE_FB_ATMEL
-- 
2.41.0

