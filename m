Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B056E746605
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 01:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7487110E24E;
	Mon,  3 Jul 2023 23:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906D410E24E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 23:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688425547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PPkOUuxZ5llhFetMPklJdNaHUXTC+DjeRtC4vPngfEk=;
 b=SgD++mrPk2bbG5LuDVXrK/dB8mMsiAG4K4mngd58MkE7Db8evVilh+9oxIvuE/unYmSinb
 WMVo4wfo8+TehczP8lcBV5twfvQ5xPIZayiUmw03eGQkRLFAq6m2RUeS5fytwS3ZjMvkbC
 LboCoxRVFK79ta7rVhUECB+/ngEl2Nk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-qYjDYBchNoCGoJOdsPe2Jg-1; Mon, 03 Jul 2023 19:05:43 -0400
X-MC-Unique: qYjDYBchNoCGoJOdsPe2Jg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fbd8cc134aso10227365e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 16:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688425542; x=1691017542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PPkOUuxZ5llhFetMPklJdNaHUXTC+DjeRtC4vPngfEk=;
 b=KOmt3PtQ4kmjP9MtYoYTVmU6keoq/leObU9PfmXuijvaqwcK1XZQmayKIPDpcRtyMr
 Uv3u5wa+Z++m8Omb9KFNDrs8/tmLv03pYi9JDkOGLYcQ35UzwoB+9+2Q2jdlQq1lq82+
 qOvCcGDSYHgRGplqzKJKQUqabO7MUW4XJane7kpFU8jHncPDk5tbVamixkpjVKuAm1Oe
 9S8nL+cmQQN0Vz2X/NWzFl3uhO0Oscz4nYW0lVVonr9xCuhYbUcScrK44owEuZZhmEKl
 emRZIX6YLKWfZKywXGleWOFCyb/d59myW9HctPhC+VKj9p6CqOsOtjAT6cURwqw0T0JS
 uFxQ==
X-Gm-Message-State: ABy/qLan9Aq9fg7ABsXazaCJtxh1sGEUBMLKo7HZ0OkF6bZNJNQfPjjG
 xlVsjB0VJQSuTPGZZNNSKxg1RCKWq8h3gRaN5rFaB7VSmVxMRUIMml7jpd80yHj2/BIRhVqopNN
 L0nd2vemEcNpMthCgg1tJU9DhH8lw
X-Received: by 2002:a5d:4f83:0:b0:314:182a:3d96 with SMTP id
 d3-20020a5d4f83000000b00314182a3d96mr9283420wru.28.1688425542687; 
 Mon, 03 Jul 2023 16:05:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHkY3/kaMZbldsi47jF351XP7Kg1e0/Oy/YC+TGYzIxm3l+o77EQsFnIcbHI+uDkatYVGxuOg==
X-Received: by 2002:a5d:4f83:0:b0:314:182a:3d96 with SMTP id
 d3-20020a5d4f83000000b00314182a3d96mr9283411wru.28.1688425542423; 
 Mon, 03 Jul 2023 16:05:42 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 cw13-20020a056000090d00b003112f836d4esm26504465wrb.85.2023.07.03.16.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 16:05:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] video: Add auxiliary display drivers to Graphics
 support menu
Date: Tue,  4 Jul 2023 01:05:25 +0200
Message-ID: <20230703230534.997525-2-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230703230534.997525-1-javierm@redhat.com>
References: <20230703230534.997525-1-javierm@redhat.com>
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
 Geert Uytterhoeven <geert@linux-m68k.org>,
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

(no changes since v1)

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
index 8b2b9ac37c3d..acf02863ac7d 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -30,6 +30,8 @@ if HAS_IOMEM
 config HAVE_FB_ATMEL
 	bool
 
+source "drivers/auxdisplay/Kconfig"
+
 source "drivers/char/agp/Kconfig"
 
 source "drivers/gpu/vga/Kconfig"
-- 
2.41.0

