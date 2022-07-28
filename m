Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C7058412E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D436911A960;
	Thu, 28 Jul 2022 14:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D55A11A853
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 14:28:52 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id oy13so3485340ejb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 07:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+qxi1BsKPmynG3xfpNZLp6J5s/IWJprPFoEGd6KJx1s=;
 b=Dqobgjs1nII8eXteQLjz2ED1bVraj/SM6DyKm259IZRg1sN9fXwxKHIjnG2b0D3INP
 CJtDIdhUiiT3FrZ8VGIV5YyCY/B5CS56vg2LrtG2qoKAVoBPg5C5Rc4irrfAhqzUR8Gh
 +kybMZBZKngEWg1dyX5m4BVx0V2laC+H53UD1uGBiO18QUV/cjUgIsNB5O4VSdrtTV9W
 Cjr63Q11WQXEj+bfEst6CJpV6b6nywbFMPcaGL39fGMjwTeOGbNRQn9EtmKqq7ZN4xwN
 pF26gzooknPqRasWoevZQAJ4FehkqRleQDodSdYOcvnJ8YGzspu/VUm+wAjSwHvBT353
 9FoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+qxi1BsKPmynG3xfpNZLp6J5s/IWJprPFoEGd6KJx1s=;
 b=Qv0MG78rSlLfY/mXe7NxriFjB+ltI6D72l/tATdcAXQn6ChxUatVZb1WuZyw61Oavj
 mdDKJTgfyGvJ48PM+3xuQm1j8CTaeWY2tkzp+6fVNQ2AV88FExf0y3D7vQ5VyQv7MpRR
 u/n3DuCbS9nQ1hCePw+y8Y11Utojch2zukTNGz3vOqkCCPvuIlJiBSwk3e9ic3DHLTUM
 VK/jBa8nCcwJPLLpx2ntc4CNBDNRDk9znbh1c9CBdi8fp3Lary3A40s25+N9BcQJ8co9
 ICtN9TToQgnm1JPGl3stqF979fxN2kEY8dqOd5wmDeKWQWRKKDOeJdqq1x1lni6e8G9Q
 Bgbg==
X-Gm-Message-State: AJIora9TR7sZZZskXrD70f4A2JruRFTd6xHmKY+BmYDQd0rZyHPEAMJI
 NIrc3aSc8SpjHmgu94psi0M=
X-Google-Smtp-Source: AGRyM1thhqvyGnz1B8Vxf/2phwUgpIo+oFuDvwayWQtnd+524pm6oLNhycj5/sutoRUawvMv1D4DGA==
X-Received: by 2002:a17:907:6089:b0:72f:56db:ccb6 with SMTP id
 ht9-20020a170907608900b0072f56dbccb6mr21020085ejc.318.1659018530972; 
 Thu, 28 Jul 2022 07:28:50 -0700 (PDT)
Received: from nergzd-desktop.localdomain ([23.154.177.9])
 by smtp.gmail.com with ESMTPSA id
 y1-20020aa7d501000000b0043cce1d3a0fsm755949edq.87.2022.07.28.07.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 07:28:50 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drivers: serial: earlycon: Pass device-tree node
Date: Thu, 28 Jul 2022 17:28:18 +0300
Message-Id: <20220728142824.3836-2-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220728142824.3836-1-markuss.broks@gmail.com>
References: <20220728142824.3836-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Markuss Broks <markuss.broks@gmail.com>, linux-doc@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-serial@vger.kernel.org,
 Borislav Petkov <bp@suse.de>, Petr Mladek <pmladek@suse.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Suchanek <msuchanek@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pass a pointer to device-tree node in case the driver probed from
OF. This makes early console drivers able to fetch options from
device-tree node properties.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/tty/serial/earlycon.c | 3 +++
 include/linux/serial_core.h   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/tty/serial/earlycon.c b/drivers/tty/serial/earlycon.c
index 57c70851f22a0e78805f34d1a7700708104b6f6a..14e8a7fe54486a1c377a6659c37a73858de5bf0b 100644
--- a/drivers/tty/serial/earlycon.c
+++ b/drivers/tty/serial/earlycon.c
@@ -304,6 +304,9 @@ int __init of_setup_earlycon(const struct earlycon_id *match,
 		strlcpy(early_console_dev.options, options,
 			sizeof(early_console_dev.options));
 	}
+
+	early_console_dev.node = node;
+
 	earlycon_init(&early_console_dev, match->name);
 	err = match->setup(&early_console_dev, options);
 	earlycon_print_info(&early_console_dev);
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index cbd5070bc87f42aa450c4ca7af8a9b59fbe88574..3295721f33e482124fae8370b5889d5d6c012303 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -349,6 +349,7 @@ struct earlycon_device {
 	struct uart_port port;
 	char options[16];		/* e.g., 115200n8 */
 	unsigned int baud;
+	unsigned long node;
 };
 
 struct earlycon_id {
-- 
2.37.0

