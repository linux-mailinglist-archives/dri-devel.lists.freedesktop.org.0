Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D628160C450
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F82310E175;
	Tue, 25 Oct 2022 06:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AC810E3D5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:37:39 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so3214616pji.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H9DD2Qn9ukDVbti7MaHb2ytvRgr63Gh+pODc8Oxcvp0=;
 b=mRQRZRI1N0fXR6ZhdjhBkiy9z0C8EnLK6gYwGYjqDkMwRaxlGNaP5gg/S/OvakJsTG
 j3MIV/2byA9qIHOxO3TCYFuxurjFmMwHfitpAimtA/68MM/VooXLqLsYsaKwrvgYMTyB
 6Z4pVEOBs5IqlX0BIZsa0XK+RYo2qG4L7wS6XkghOIRzy97bYyCuS6T2RVuWBkoNAZsp
 5OAXJzzDB82KI6oAxhG3ADEUNMHcMWzihVTgmK2hw0ruNAkoMfJvZ4SJ61OJTiGkE4ET
 XCl94Jv3FdldMl8SzpJhvBf/CL22EaB8WxpQl53oozj1okCtaLCSvY5Rm5InOnDmci1D
 XpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H9DD2Qn9ukDVbti7MaHb2ytvRgr63Gh+pODc8Oxcvp0=;
 b=e0428YL0MjbmuOe8eNrDe/JvWobnqHLXCgw/lVKVszP48y2t0xqsTHgfV47CMQ5P/I
 Lmv28LJk1/1wv8ta1FMlQPg2MTC1kWtqPgs9d8Gryv3I4eRYnJBaGRCOnH/0pJabn0Ls
 UhIUW+/tw47e8tzKerl0fun/7YJwNogTeGnr06ZMPTAZp2I40BMXDr1x1scwrD5FZvsY
 uvW5r6arBo/VMRppgmnaEuK0SsNUArUwBbKuXgUmjy3LUau6qRltgQZJbT4AEsa8QLPc
 x/MDR2evSfWn0jMq1s+cH0qOvMYl73E0R9oGUv1/rj1x85useokf9eslyvE+QBvaL/TE
 RNbQ==
X-Gm-Message-State: ACrzQf229CX/wkSWxa7lN+DC0y29EDQ5cFkbkjGEXCRouY7jUJBfdkGq
 oUYqcE8/Gzbz2am/ZE9hU6xwBw==
X-Google-Smtp-Source: AMsMyM4qEtYfk/brrspCDfsAk/ohN0i2+YSG3igNC8b1bqKv4WrKEdbaz330QILDZfX2MHi6JDfWfw==
X-Received: by 2002:a17:90b:3912:b0:20d:4151:1b65 with SMTP id
 ob18-20020a17090b391200b0020d41511b65mr74871319pjb.233.1666611458874; 
 Mon, 24 Oct 2022 04:37:38 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:37:38 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 14/22] platform/x86: panasonic-laptop: Use
 acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:35:05 +0900
Message-Id: <20221024113513.5205-15-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/panasonic-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index ad3083f9946d..eaf9469fabb3 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -999,7 +999,7 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 		goto out_input;
 	}
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		/* initialize backlight */
 		memset(&props, 0, sizeof(struct backlight_properties));
 		props.type = BACKLIGHT_PLATFORM;
-- 
2.37.3

