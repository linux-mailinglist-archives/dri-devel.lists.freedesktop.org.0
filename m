Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C669460C437
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75A610E130;
	Tue, 25 Oct 2022 06:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57D310E3A9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:37:30 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so1138930pjk.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZ4fJ8ClD76WOV59defp1HNsujn8j/wysmVCUMoMFP0=;
 b=UR+PH3NVHkn0NXOqzrKguYWXOraM6vc+YMLhwexhonJG8F77DnrNQYz/9Oi32n6IZY
 hZlL47vjA7//LH91lqAnjQLn97I5Vo+uQOT2Mmd2Dn63q/EMVrrHlQ7z/zyp6JLWsxqs
 lxvzOwrP2RQb+dCGiNci0WZm/2NZcPqe1IwnSjthC31l/f7IFTIDv5x71IwBvf93+VC0
 KH/KMjo1itzSNE11bqoR8Syfpkg0shlSYQXBydHoh4+awRZYdMObrO029QbuDisy7sll
 ElVT/CB4tnxnE4FbCm2I0ONWyIQVGy4aFDiuXCQlrYYt0qq7o8pOl51CC0lnDxCtkS9Y
 1uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZ4fJ8ClD76WOV59defp1HNsujn8j/wysmVCUMoMFP0=;
 b=t39wMy+3BOkswA8qCqh9y4hov77ZvGUmksk9igYNAsk8401ZFSVCAgaJqa3agaNsk0
 MVo69HJBLxAr+D5c83tl7gzkV137ype2yhoPakswLArhToFyyoylr6bOOU+Mbm4M2OYF
 xRW6uewrFFLDoNCwWRIrOtVm5XbsjlegEP1c+T98wJyt+eMxTDOOwgJML/2OxN0TuOkE
 JrD52tGEoNIDy/VnR3GVuCpfFBNWzc+clw1om6+fPKYpn9Ti/qcsieYO7Bhz0t+PpAWs
 mntFHo8vTZFaeHG3WYfknce7WTUliMZugTDV1G+uELStQlTbE2q6KkcFCE3liuBv8vKB
 QOeg==
X-Gm-Message-State: ACrzQf2iDEZ9l1Z4eUafmhoBAIkG8BiRejTChXa2b51I3onRDfYxhy0/
 fMFl9lG6EKLF+XVgcajvYC31aA==
X-Google-Smtp-Source: AMsMyM4YfAwJenYaMcKn2Z30J0g5OpRvkV9SVYpt/sZWnDEmVOCLuqCwHN7ebOLB73LDTWz/IU7ezA==
X-Received: by 2002:a17:90b:2317:b0:213:26a3:246f with SMTP id
 mt23-20020a17090b231700b0021326a3246fmr1763172pjb.148.1666611450483; 
 Mon, 24 Oct 2022 04:37:30 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:37:29 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 13/22] platform/x86: nvidia-wmi-ec-backlight: Use
 acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:35:04 +0900
Message-Id: <20221024113513.5205-14-akihiko.odaki@daynix.com>
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

acpi_video_get_backlight_type() is now deprecated.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/platform/x86/nvidia-wmi-ec-backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
index baccdf658538..a42e3914c73d 100644
--- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
+++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
@@ -91,7 +91,7 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
 	int ret;
 
 	/* drivers/acpi/video_detect.c also checks that SOURCE == EC */
-	if (acpi_video_get_backlight_type() != acpi_backlight_nvidia_wmi_ec)
+	if (!(acpi_video_get_backlight_types() & ACPI_BACKLIGHT_NVIDIA_WMI_EC))
 		return -ENODEV;
 
 	/*
-- 
2.37.3

