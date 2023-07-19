Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492C3758FF4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7463D10E41B;
	Wed, 19 Jul 2023 08:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE0E10E416
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689754556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pl7rDesBC4To4uNjgzRPqO8NIm8bPxHEaiAgd1Bj9kg=;
 b=L253rMHDKbrm6zoX2TkY321K30PHUZo9UmqTN+XuirnYMrtGMRRfy/f28ok1aa+KQerprz
 FmY7Z3x0ALTwvFrAiR/5kGT9wbnj1+fYvnID/DQrilIR6YXteOToNRK1BVWH2w9CdWZxv6
 tO/JNOs67W/wlm19x/2Ah2ygHNxlWM4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-yRbYdjQZOdOhiK3-2JDJ7w-1; Wed, 19 Jul 2023 04:15:55 -0400
X-MC-Unique: yRbYdjQZOdOhiK3-2JDJ7w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbdde92299so34867655e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689754554; x=1690359354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pl7rDesBC4To4uNjgzRPqO8NIm8bPxHEaiAgd1Bj9kg=;
 b=YHz8+sHZTXLhM3hItwHRb2ER6NKfGDygVqwi25oAq660C7mpH5PwYYGsoTI+zlwQvb
 SY2kJO29dMV1BL1zP5Zi9HEOSh94yqIGTZGKyHI9bXsYW1ZQ4E6VrCLMkxDuItd+/Fpp
 HYy3vQgi0pq3302gBhNHbZsmxdLMWl5Fbdgaiie1KN/18QT6Zn9HUgyknp/rxYjg14Wv
 QjD0hOiLgNl7i0987V+sXHxaSe0uR6879j13Toh29x6chAopkElB3A+Fv7tEpwvltR0h
 pTGvXUGjYtgcEG/f9asmg5r5viO0prHDs7Ir2obYCe8c+HFJIgGjVgsTlGDJ/3CTVni6
 D50w==
X-Gm-Message-State: ABy/qLak/fEB/y3De+ffEqXZLk8haHs2TodFpendU37/dAh0GLesC7Z0
 CZ0Y2aKQtphN3IlRX1snPNLY9uNso3IKj44j7QkdP/I75h8m1TODF8bzSh2xwl/UhbZSHMB7JUs
 Z3aTf4C+1oRxO2pi1KwHh7N8DApYQ
X-Received: by 2002:adf:f087:0:b0:314:4c78:8b84 with SMTP id
 n7-20020adff087000000b003144c788b84mr4142562wro.17.1689754554400; 
 Wed, 19 Jul 2023 01:15:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFpqnqhnG2ZCWh/0oWIuDm9np5hx9FVZp0cyJdayt5CqHwUybqL7yFTlLi+cxoPwsgimsvCTw==
X-Received: by 2002:adf:f087:0:b0:314:4c78:8b84 with SMTP id
 n7-20020adff087000000b003144c788b84mr4142546wro.17.1689754554100; 
 Wed, 19 Jul 2023 01:15:54 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d5-20020a5d5385000000b0031423a8f4f7sm4574354wrv.56.2023.07.19.01.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 01:15:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/4] video: Add auxiliary display drivers to Graphics
 support menu
Date: Wed, 19 Jul 2023 10:15:35 +0200
Message-ID: <20230719081544.741051-2-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719081544.741051-1-javierm@redhat.com>
References: <20230719081544.741051-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Nipun Gupta <nipun.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drivers in this subsystem are for character-based LCD displays, which
can fall into the same category of the DRM/KMS and fbdev drivers that are
located under the "Graphics support" menu. Add auxdisplay there as well.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Arnd Bergmann <arnd@arndb.de>
---

(no changes since v5)

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

