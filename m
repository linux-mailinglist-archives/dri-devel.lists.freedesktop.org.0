Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406DB652FE6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 11:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F283A10E12D;
	Wed, 21 Dec 2022 10:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0025F10E12D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:54:38 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id y8so1497439wrl.13
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 02:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bS2SuPyrrLQszLfTlNtHGbczRo/TVo6iehbioyR9aVQ=;
 b=V5g9bWYDeFiA79+HKnoNqj3Yrev9rnYg89t+lfD4CE7yyoy6A/NBcDsfmFhWul0zPC
 XDc1JLVjMnEPDvVhTn6fxwBTE96EKLlJSCjwaXsgARV3dYkyMXEZVIjg+U48zNHsMNK9
 bgerLFXI3daey7af/Q8IU3a1iErE/XGHuqpeiZeO15b9n3cAFRlTuWe9rFKR+q8gmTu/
 uJkQqcPeHSQh9wnCU+fwj/O436GrmycxV2r4YbGjUxkgBG+mWgnbFURsYO1q96q7/T1E
 KuUTEq2lKbAfkhe0WSDEnA7xfWpVsZ1nd5FHenfwuN8O6LIWqLkzF4a1VEnCTTqEBAU9
 9PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bS2SuPyrrLQszLfTlNtHGbczRo/TVo6iehbioyR9aVQ=;
 b=14jmi+D0gza6SGEtaAafTmyX7bL2VU9q1zqzcf5ZRpSGhtZvD3KWsXKk36FaILEOXL
 rTFcAdBdb/imOE5mb2dR7TCmAs+cKP8P/KUnkLgnVCfi4B6Unz6vMuuMzIpJHM/0l9Z8
 jYu/pxKhaukcO1JZAP0lX8m7LRbsrfH5D6y5HkITksgiTvutkzf0/5B94NUoTx2nG61F
 RB0/gXJIUcLTQTPNZ3qfW7G7l0QaIyWUEYdpK8rZl9DoefYzm4r6Ej6o+tlitvb8w4g9
 olXHg7GdxvRpIryR3NSzGLgxaLFAFKDyRAnKrKQCvNwBkF73heJ8kV3xVpzgNR7v9Pyx
 GBlQ==
X-Gm-Message-State: AFqh2krILTrsqgvHZ2Wic/DBOKZwVEWh11F0cU4e7caJf2CV5UUHWnGh
 LmzxZDzApJZbgUx4QdGxs8I=
X-Google-Smtp-Source: AMrXdXsDx4mXzQ1l6DWUcUU5nf5+qfbEQQBy9kHLbjRKwCnT1eRKgeElBMlbjp5Bn+6qmj+Y4Voi5Q==
X-Received: by 2002:a5d:55c7:0:b0:242:5f1f:9d3b with SMTP id
 i7-20020a5d55c7000000b002425f1f9d3bmr909249wrw.16.1671620077591; 
 Wed, 21 Dec 2022 02:54:37 -0800 (PST)
Received: from localhost.localdomain ([37.55.203.63])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056000108500b0023657e1b980sm15080156wrw.53.2022.12.21.02.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 02:54:37 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] drivers: serial: earlycon: Pass device-tree node
Date: Wed, 21 Dec 2022 12:53:58 +0200
Message-Id: <20221221105402.6598-2-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221105402.6598-1-markuss.broks@gmail.com>
References: <20221221105402.6598-1-markuss.broks@gmail.com>
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
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-fbdev@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 Markuss Broks <markuss.broks@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>,
 Jami Kettunen <jami.kettunen@protonmail.com>, linux-serial@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
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
index 4f6e9bf57169..0c7a789d7eb7 100644
--- a/drivers/tty/serial/earlycon.c
+++ b/drivers/tty/serial/earlycon.c
@@ -307,6 +307,9 @@ int __init of_setup_earlycon(const struct earlycon_id *match,
 		strscpy(early_console_dev.options, options,
 			sizeof(early_console_dev.options));
 	}
+
+	early_console_dev.node = node;
+
 	earlycon_init(&early_console_dev, match->name);
 	err = match->setup(&early_console_dev, options);
 	earlycon_print_info(&early_console_dev);
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index fd59f600094a..0b06c0ee7705 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -783,6 +783,7 @@ struct earlycon_device {
 	struct uart_port port;
 	char options[16];		/* e.g., 115200n8 */
 	unsigned int baud;
+	unsigned long node;
 };
 
 struct earlycon_id {
-- 
2.39.0

