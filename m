Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FFF60C436
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333A610E136;
	Tue, 25 Oct 2022 06:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4024610E3E1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:37:59 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id i12so6323361qvs.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jiSdINSVFRYviECfxwDXkA1dnuYyyTGGZx7DJKOoYJs=;
 b=iGtXR8pxJeARtYM65YtWK/rMT1cGkHNCbn5om85YN4tLiOmmeq2/FBvx3pSpv/m1Sr
 Va9GHFdP0chf3eQTUSVDangVFZ/dqZDSfu19hibg9oS2kk/KlgfVT6JFeQ68GHunlhzC
 se1sWoi2z1fTcKdw8FOIcyCxwwKqRbZobTBVM7iGls36LCpZ3DZIX0Tfn7Kb0gOkShSW
 pNe8W3N4rMeldUr8oUAlIfVjHR6cNauEMm0EGdVKOdZI/PPmhyAtOJqcxE6jGzxL2wA6
 7MgNHiUTVhnxOnZse4TBGZUhOboi/UB4XI8imIbLRZSiYGhvYc8SoFkFpIFpQvLUOsh+
 Hp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jiSdINSVFRYviECfxwDXkA1dnuYyyTGGZx7DJKOoYJs=;
 b=rn7o4UlC4RjTmuVGrQIqeycnXU+86EnYPggBuj4Kt7J3KDPdswDYylF2gQON36o4Ad
 gnvnWGBhKJt98hNL1gEiwsK/TOZOzzOccPQK9ll0IP6aTA6CyFndXZHClY6lLpS6JI4i
 ML+5euKQ93Oib7+boMDdZAmFkLHnB/obfQ7jf2ydeq34QsoCPM2lA0FNpppplltvSond
 EPMBe3nedIMYwwaikbIYNmhxAN0WQkXSx7xGtC9YezYpd/4dLNaa5nTMMGJXP3a3EaDM
 X0xfUs9b9GonGGORG6Asjv3O9R3MCFDoYq0GbJITr0zvZAGUe5lKX/5sm1HpvY4cLxxj
 8vwQ==
X-Gm-Message-State: ACrzQf0kkzH7v3jvkkVE0Wjm65K4REbn1t+UgvY7ojcsWlkp4bgaAgyD
 4urvM7PdFxvgEPvQJpv0TdIV24UDuIcNxCW0
X-Google-Smtp-Source: AMsMyM7XYF0/Ljt4MGKz/TruSqF/tNgb9whiXQXnKj0J8NH8HwiMDdKOolztUet8v/T3k84ugzg6BQ==
X-Received: by 2002:a17:902:7297:b0:17f:93b5:5ecc with SMTP id
 d23-20020a170902729700b0017f93b55eccmr32624764pll.93.1666611467259; 
 Mon, 24 Oct 2022 04:37:47 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:37:46 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 15/22] platform/x86: samsung-laptop: Use
 acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:35:06 +0900
Message-Id: <20221024113513.5205-16-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/samsung-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index b4aa8ba35d2d..8ba377df73e8 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1574,7 +1574,7 @@ static int __init samsung_init(void)
 	samsung->handle_backlight = true;
 	samsung->quirks = quirks;
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
+	if (!(acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR))
 		samsung->handle_backlight = false;
 
 	ret = samsung_platform_init(samsung);
-- 
2.37.3

