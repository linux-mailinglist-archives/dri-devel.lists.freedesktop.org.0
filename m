Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493D73807EB
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 13:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7196EE4A;
	Fri, 14 May 2021 11:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC2B6EE4A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 11:02:46 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 lj11-20020a17090b344bb029015bc3073608so1457860pjb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=w2B2gYwn3MtKVjip2AWbrWG6iOvfQAn7f6GZqcZIKfs=;
 b=TgbI5fIWdbDixv8fZQJYly0iM+UMF4g0NP2bB7QvRKHOCtekFwFpdwqa2Smm0qieMR
 cQhkcuk6HrL9QzbMUwMKmQ/+iqX9qh8JtB3qI25fYIyVBCfZMjLjJev7LBwGYbLezRBA
 yqN5lgcHsnPgf+Yw7GP9KXRyjblIbqjopBrlYfvUl/XNB28FWqvU/JMeTYw2VEteBZBC
 CzMZrxWr/+sqkZ/SFR+u+tZoysRoNkJ1utyigrNwrPEQhj0Qgj7jycSJyyYgRkhzZhC6
 2Ccz9+PDCY2IRMJNn08L+sLmXJaPYq/2kPBLvSfgbJZp4LzCaorgzrdUE5QdqxnmrUYE
 okbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=w2B2gYwn3MtKVjip2AWbrWG6iOvfQAn7f6GZqcZIKfs=;
 b=SxjQ5+rQbMUgHtLWQDxtTIW+52PYRlnYQ36HyJ5TNL8+E7t2VXyzc5T2jivE3/8jeS
 ell8fflPOejyIzvChSSPceWM6/Hu2voFY9t6+0co1nQN1e3ELxvac7A8pySWQ7z7Ojy2
 lxUe9yl+pkXEDkwZibfiAWz+pEzkOHaRn3jNW+lDRCxRvvYf9UU06n1uqYD5aKqyaxRq
 h6sT4LXa0x5aTuzP5QhUZf+cjAJBCBmbGOVzih7MnpOXV1Fl4kR3Tt5pa5OBdD+zSnne
 r81Tdv3zK38IaHFkIlJMqZcQE/pADi6+XheYQpgbviEX/gtMIkH40HJfkgmHLnmbpcsA
 PkNQ==
X-Gm-Message-State: AOAM532x3/jV4Jtkml8lpsSUztL9NTuDvZwwup6eLTqkPEOD95/oGTh2
 GQ/u0LJ6MjMxaC3a8lEsCKY=
X-Google-Smtp-Source: ABdhPJyKBOqrBQtdA21EkB22MKpeUJqnWyuTGt2+olXKI7Jp6Mm6RIl7J9Rgxmrr02pM//5pykqqyA==
X-Received: by 2002:a17:90a:b945:: with SMTP id
 f5mr52371098pjw.233.1620990166436; 
 Fri, 14 May 2021 04:02:46 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 202sm4193402pgg.59.2021.05.14.04.02.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 May 2021 04:02:46 -0700 (PDT)
From: dillon.minfei@gmail.com
To: patrice.chotard@foss.st.com, pierre-yves.mordret@foss.st.com,
 alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, mturquette@baylibre.com
Subject: [PATCH 2/4] i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
Date: Fri, 14 May 2021 19:02:30 +0800
Message-Id: <1620990152-19255-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
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
Cc: sboyd@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dillon Min <dillon.minfei@gmail.com>

As stm32f429's internal flash is 2Mbytes and compiled kernel
image bigger than 2Mbytes, so we have to load kernel image
to sdram on stm32f429-disco board which has 8Mbytes sdram space.

based on above context, as you knows kernel running on external
sdram is more slower than internal flash. besides, we need read 4
bytes to get touch screen xyz(x, y, pressure) coordinate data in
stmpe811 interrupt.

so, in stm32f4_i2c_handle_rx_done, as i2c read slower than running
in xip mode, have to adjust 'STOP/START bit set position' from last
two bytes to last one bytes. else, will get i2c timeout in reading
touch screen coordinate.

to not bring in side effect, introduce IIC_LAST_BYTE_POS to support xip
kernel or zImage.

Fixes: 62817fc8d282 ("i2c: stm32f4: add driver")
Link: https://lore.kernel.org/lkml/1591709203-12106-5-git-send-email-dillon.minfei@gmail.com/
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index 4933fc8ce3fd..2e41231b9037 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -93,6 +93,12 @@
 #define STM32F4_I2C_MAX_FREQ		46U
 #define HZ_TO_MHZ			1000000
 
+#if !defined(CONFIG_MMU) && !defined(CONFIG_XIP_KERNEL)
+#define IIC_LAST_BYTE_POS 1
+#else
+#define IIC_LAST_BYTE_POS 2
+#endif
+
 /**
  * struct stm32f4_i2c_msg - client specific data
  * @addr: 8-bit slave addr, including r/w bit
@@ -439,7 +445,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 	int i;
 
 	switch (msg->count) {
-	case 2:
+	case IIC_LAST_BYTE_POS:
 		/*
 		 * In order to correctly send the Stop or Repeated Start
 		 * condition on the I2C bus, the STOP/START bit has to be set
@@ -454,7 +460,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 		else
 			stm32f4_i2c_set_bits(reg, STM32F4_I2C_CR1_START);
 
-		for (i = 2; i > 0; i--)
+		for (i = IIC_LAST_BYTE_POS; i > 0; i--)
 			stm32f4_i2c_read_msg(i2c_dev);
 
 		reg = i2c_dev->base + STM32F4_I2C_CR2;
@@ -463,7 +469,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
 
 		complete(&i2c_dev->complete);
 		break;
-	case 3:
+	case (IIC_LAST_BYTE_POS+1):
 		/*
 		 * In order to correctly generate the NACK pulse after the last
 		 * received data byte, we have to enable NACK before reading N-2
-- 
2.7.4

