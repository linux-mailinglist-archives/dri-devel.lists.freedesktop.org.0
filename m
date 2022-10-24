Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A6260C43E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7C810E139;
	Tue, 25 Oct 2022 06:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF7610E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:38:12 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id 20so8460962pgc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ghtJtVJhPw81MXq6/J6quq2LuUHiKWw8lzS+pFTBsP0=;
 b=cZrJzXH//QTytM0WW2x60eVTJWmr4XlL39TbHpKK3q3WQCrSwZnjVPRWyiABmgouTe
 tcWaVYaRKc8hu79d1xDnlFcNITHqD8aagxIfdW/j33EuRzv9/LyBezR8gcIDeuDjMBdi
 Ipdx3WUUwYagpuujWId9VshSvfmg5KdxiBBTFEGB4woUWAXr+bNyz5W7lNqKncoZTj5V
 OtqnOJcGCmy/ESZHdgjapJ1vmW0D4ruK7a2seAn0eeRS8/38sQjcPxnlad2eAV61+hmK
 GkeCBWxM+dUrzuzssuopdvmaQwwmpmxNgwGhyMJjD/yNfawG/7R+9RDafwqQFOoJ0z9Q
 ANrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ghtJtVJhPw81MXq6/J6quq2LuUHiKWw8lzS+pFTBsP0=;
 b=4zEpTwF9p5mE9U7nnvEJnPg1Ik07AAnmvL/hGDhB8ftVO0/UpiHjgspM/Ziwza445F
 DX3Zhx8foO1MgiP3JmHj0TEpZJE+qaM7bECIkeCZ4IhVVIR4VaThlsbhdP0J7GUgilHs
 lH8dwps3tO9wiuraNACokUej1CVdsHRM99piBJ7Bl6pNXlPpcQXiVlX1wanUAQkg9aw3
 vR1/o3Z/thrj9jlNUVWeJ4aYtUc31UDtAqfNwtu8giI5oq1FLBrI6rYUMW1iiOVorSxL
 4oGV/lOJbf81+Spc1AeJ9u4E3oMxBQaYE4K7iE9Uxy/PBcKl3l7mflD4xc6V5kJpbCZ9
 hZSA==
X-Gm-Message-State: ACrzQf3B702cn44rp9StyfsjmNKyh7ohfxYxqSJjYzzGnUyIQ0Q7nIbs
 jMaSN/MVy1mysZ9Nkr/iI4UgCg==
X-Google-Smtp-Source: AMsMyM7jVfOb4cdFC5JDiHJLWBD4KDzAtatMaD5/Pd8TR8fUHas2SHGFltiDcGGdPiW3YBak6k10IA==
X-Received: by 2002:a63:dc54:0:b0:44c:ce26:fa35 with SMTP id
 f20-20020a63dc54000000b0044cce26fa35mr28698734pgj.374.1666611492363; 
 Mon, 24 Oct 2022 04:38:12 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:38:11 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 18/22] platform/x86: toshiba_acpi: Use
 acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:35:09 +0900
Message-Id: <20221024113513.5205-19-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 160abd3b3af8..3d747a901ad8 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2978,7 +2978,7 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
 		return 0;
 	}
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
+	if (!(acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR))
 		return 0;
 
 	memset(&props, 0, sizeof(props));
-- 
2.37.3

