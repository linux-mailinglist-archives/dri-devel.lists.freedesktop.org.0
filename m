Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B02745044
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 21:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6125510E030;
	Sun,  2 Jul 2023 19:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0295510E01F
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 19:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688325347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JDcEAV6QwSsPTLZL87iLrwMThHt45oSghNV/E5+yNmU=;
 b=Shbsp3SX/zV5slRa+k2Idn6v6O9oy715wMcpawUHMgDXHVc7LZHSLL+oFAFExYAHn0D/a+
 2LtZwOsWOdSeE/l6S22M76PHZnBRX2QN9MP+Sxe1gkmgtxbObtpPSY7l2Q+5H5vluZgzSe
 fRYTcZhcQgiUSukozqKYTM/xdWA3xBg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-kNhlILF-MraMMffPgMlUog-1; Sun, 02 Jul 2023 15:15:44 -0400
X-MC-Unique: kNhlILF-MraMMffPgMlUog-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-313c930ee0eso1708292f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 12:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688325343; x=1690917343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JDcEAV6QwSsPTLZL87iLrwMThHt45oSghNV/E5+yNmU=;
 b=YpFudtm8fZsLW41ETSaw6OnhJBB6HRDBHcRSErhvWTMs0S9euVqerDqG0V7T7Z12Zn
 v4a/FSxx+j2YqK4OzdEuNvwdXtmRYtI8W3VShPuc5hMUNizNTvvl0g7DUhgG6FdqAa35
 ajkk7/998c0Egp2L0k71W2W8Yx+M+dBepCAzZzOdjdCM69wooh4Tx/aPFRZRGzbAjahc
 D1qQBsZirnHHoa7hJ1fWg36iDncs7aEO2bJEe8iFV9jmPjCqekuPLIRQZyWXGWCMqwLm
 x184ndUAkz553NUD8x3oRCl78HSg142/IUYsHiemJ1yfp/n8sZ3lggb0swzEfntPGQZu
 sgaA==
X-Gm-Message-State: ABy/qLbkoguTMFw1rqhHu/FfYYSo3akL1/w7nTNpaSubUv5uCkae1ds1
 6Em6GHygZAqxWza6R6F7y5p5k4jrbT8aMRKsl8cqii9wPJcJjd+X0q9bdlBH/2D0JxMBdHymo9N
 FVsY048Eyew9rsdH/9K7tqf8lmtwW
X-Received: by 2002:adf:dd0a:0:b0:314:1a98:ebc0 with SMTP id
 a10-20020adfdd0a000000b003141a98ebc0mr6619304wrm.26.1688325343383; 
 Sun, 02 Jul 2023 12:15:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEDpCbRzZteK5K4atZLapgedVl0F/kvFEX2HZm5FHmLp8U7TVJXppcUN0K6Sz/ypkNYMZhM6Q==
X-Received: by 2002:adf:dd0a:0:b0:314:1a98:ebc0 with SMTP id
 a10-20020adfdd0a000000b003141a98ebc0mr6619298wrm.26.1688325343187; 
 Sun, 02 Jul 2023 12:15:43 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g11-20020a7bc4cb000000b003fbab76165asm14144231wmk.48.2023.07.02.12.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 12:15:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] drm: Improve Kconfig symbol prompt and help texts
Date: Sun,  2 Jul 2023 21:15:18 +0200
Message-ID: <20230702191529.768248-2-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230702191529.768248-1-javierm@redhat.com>
References: <20230702191529.768248-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current text were not changed since the original Linux-2.6.12-rc2 git
import. Let's improve it and make that more aligned with the DRM/KMS docs.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/Kconfig | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index afb3b2f5f425..373f85e174c2 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -3,10 +3,11 @@
 # Drm device configuration
 #
 # This driver provides support for the
-# Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
+# Direct Rendering Infrastructure (DRI) that is composed of the Direct
+# Rendering Manager (DRM) and Kernel Mode Settings (KMS) subsystems.
 #
 menuconfig DRM
-	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
+	tristate "Direct Rendering Manager (DRM) and Kernel Mode Settings (KMS)"
 	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
 	select DRM_PANEL_ORIENTATION_QUIRKS
 	select HDMI
@@ -19,13 +20,16 @@ menuconfig DRM
 	select VIDEO_CMDLINE
 	select VIDEO_NOMODESET
 	help
-	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
-	  introduced in XFree86 4.0. If you say Y here, you need to select
-	  the module that's right for your graphics card from the list below.
-	  These modules provide support for synchronization, security, and
-	  DMA transfers. Please see <http://dri.sourceforge.net/> for more
-	  details.  You should also select and configure AGP
-	  (/dev/agpgart) support if it is available for your platform.
+	  Kernel-level support for the Direct Rendering Infrastructure (DRI),
+	  that is composed of the Direct Rendering Manager (DRM) and Kernel
+	  Mode Settings (KMS) subsystems.
+
+	  If you say Y here, you need to select the module that's right for
+	  your graphics card from the list below. These modules provide support
+	  for synchronization, security, and DMA transfers.
+
+	  Please see <https://www.kernel.org/doc/html/latest/gpu/index.html>
+	  for more details about the Linux DRM and KMS subsystems.
 
 config DRM_MIPI_DBI
 	tristate
-- 
2.41.0

