Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2048F60C430
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D14310E123;
	Tue, 25 Oct 2022 06:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D11910E3AE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:38:46 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id h2so2333989pgp.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wpAa0dkS8XhA2GQ66lc5m8kkJugJVYjadMORUlQ0wPQ=;
 b=t0cdU8Gq6mNNYiksD6eEYKO8Asn+CT0EzR/trw2LnPyXm+rD6nqXsCYeQqjtM7gPYM
 czLtjzn9STZMwbg25oKJ+rchJIE1C3EbruYtUtL1fo+a90zdV4qc0tsyovLT5dJAiUGE
 qsy+4fAYnPcQVS0njH5jJLQI9FZmFytWkVQGNsnYWmnWaeNhpSPFlsctwJOWhSbiXeZ9
 h7w4BZ8ZVIJgYAYNUV3nlz9q7wdjdRwS9ZZ0zjcSCMcue0JOz1szUQizwPn6jyvjKFGF
 cxNAlwAh76EuqilV01f5017ZpYLpbgRwKmZuX/eFx2jyV1b0J3gkxlk7wW3OSfaxul6v
 yo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wpAa0dkS8XhA2GQ66lc5m8kkJugJVYjadMORUlQ0wPQ=;
 b=rUGV0WLulGYWkiXhDAmvnRhhpaZGzelXE0k33mS0naKrUhuvLTdZ4hpuDD8HhxdV/F
 d95/meBksimhvZEvRU6c1lZD/g6vjKEHIbnd/KT+Fwi7wNeJ0BVa+uqZ4d0P+Dx3KlZf
 nLnawANVKqLh3LBn2DxAFTZ8frruRLZVVC6ChkOQVZekhdC55I+GdV/SgX0+W1t+wYCM
 AczHD9iCPEiYWBsc4mT+KOKCD10mtB6kKog3XfwRVQNbdmg6/2dcgaECplAWzfr1Vvn5
 MOETa08EJPoLJE5m8Cr56hBXyrnaXz85as71Hx0KLPoh6ieQZZ3mvFrpqXg6axIrsSsn
 tr0Q==
X-Gm-Message-State: ACrzQf0bEvE4mJ/s2yjw+xV5zUiLhUU+XqnfPamx90YTRcurqLuRiGZR
 iBh01qYmC3feGTkk1+j2gZdt5g==
X-Google-Smtp-Source: AMsMyM6nms4lu3tkLOdZ9JNSQbhLjcWcRc9H/ekaTG+Ayy8xJMo8kAow4Lj5Qd758THxno/pN3RsVg==
X-Received: by 2002:a65:68cb:0:b0:460:b552:fbf4 with SMTP id
 k11-20020a6568cb000000b00460b552fbf4mr28051732pgt.457.1666611526061; 
 Mon, 24 Oct 2022 04:38:46 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:38:45 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 22/22] ACPI: video: Fallback to native backlight
Date: Mon, 24 Oct 2022 20:35:13 +0900
Message-Id: <20221024113513.5205-23-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221024113513.5205-1-akihiko.odaki@daynix.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Oct 2022 06:54:02 +0000
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
Cc: linux-fbdev@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Azael Avalos <coproscefalo@gmail.com>, Mattia Dongili <malattia@linux.it>,
 Daniel Dadap <ddadap@nvidia.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Woithe <jwoithe@just42.net>, Jonathan Corbet <corbet@lwn.net>, "Lee,
 Chun-Yi" <jlee@suse.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Robert Moore <robert.moore@intel.com>,
 linux-acpi@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
 Len Brown <lenb@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Kenneth Chan <kenneth.t.chan@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, intel-gfx@lists.freedesktop.org,
 acpi4asus-user@lists.sourceforge.net, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 platform-driver-x86@vger.kernel.org, devel@acpica.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net, Jingoo Han <jingoohan1@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 2600bfa3df99 ("ACPI: video: Add acpi_video_backlight_use_native()
helper") and following commits made native backlight unavailable if
CONFIG_ACPI_VIDEO is set and the backlight feature of ACPI video is
unavailable, which broke the backlight functionality on Lenovo ThinkPad
C13 Yoga Chromebook. Allow to fall back to native backlight in such
cases.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/acpi/video_detect.c | 4 ++--
 include/acpi/video.h        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 88462f2fb8cc..36354241c740 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -732,8 +732,8 @@ static int __acpi_video_get_backlight_types(bool native)
 			return ACPI_BACKLIGHT_VIDEO;
 	}
 
-	/* No ACPI video (old hw), use vendor specific fw methods. */
-	return ACPI_BACKLIGHT_VENDOR;
+	/* No ACPI video, use native or vendor specific fw methods. */
+	return ACPI_BACKLIGHT_VENDOR | ACPI_BACKLIGHT_NATIVE;
 }
 
 int acpi_video_get_backlight_types(void)
diff --git a/include/acpi/video.h b/include/acpi/video.h
index 5b748fdb606e..656b59acfd1f 100644
--- a/include/acpi/video.h
+++ b/include/acpi/video.h
@@ -76,7 +76,7 @@ static inline int acpi_video_get_edid(struct acpi_device *device, int type,
 }
 static inline int acpi_video_get_backlight_types(void)
 {
-	return ACPI_BACKLIGHT_VENDOR;
+	return ACPI_BACKLIGHT_VENDOR | ACPI_BACKLIGHT_NATIVE;
 }
 static inline bool acpi_video_backlight_use_native(void)
 {
-- 
2.37.3

