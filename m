Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CDEA82AF6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8BB10E2EC;
	Wed,  9 Apr 2025 15:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G0trf5Pd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5884410E2EC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:46:33 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-af6b02d9e5eso4883026a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744213593; x=1744818393; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GxwU2Eo6SZITicqBQinN6iBaz5ky/0lGxu1bDy42GZ4=;
 b=G0trf5Pdt2fqz5tmv1ie4b1v/PIYMsXF0t4QiuQYpZ03XRMApoeFX2Tr1S2DkfRawX
 oVZGq1VPX1kKON1EVkM7xVJUfsq4BTcQC/MC9TZSbiYFnWQpxh6W/r6rqHLWUxNo49Dt
 msyN3MV6RS6YxfX0bRHOPhkksRyeTd9P3PtQKU/1aVKxqoeaLT8ZqjXwn5xB2qzZQiDQ
 LICfdgNvCtXRbtmzML1Ybl2lZ4x2bj42N2hW7IKm21IRJm/kd5PjCQRgl50TRtG9Ug+N
 Eed3/ML12tofqXI8pjbOV3SlMsWZshLb8TXa5tHbocELv+vE5xj5tVn9Rsqz2RJlYLHs
 bOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213593; x=1744818393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GxwU2Eo6SZITicqBQinN6iBaz5ky/0lGxu1bDy42GZ4=;
 b=nDrqXI/zKb8viqdnttcqMSnC0Xl2Lz8Uhv+H9HABZl2lUI4ox9ieV6zfrmR/EB6Qvw
 AJPsbQ8qbjBtjEQTknMO1XVr34ZurrMPEFNwlc3Duma6vNNuu7CU3TK/5U1/GmsQPtYq
 MvDE6Xzo6UvUTNjMTiI68y8z7fMGIv3xQxjV9ek7PEOd9zU5Dm6gOzj4fEKguQu4vp4D
 8eE/a0yM4RUTbkNdSSM1NZAkTUIXTvqNYt8LCgQEQpFIwsJ4Zy5fdqRngDkHv/nRKb+d
 LemdUKXLulVY9SJ6SmYCmSwr+6JfxybgJvysvNVrfTornj9oYUN3siu//ksYBziQxSPR
 F9XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH3GtFfEDMHIXKPpdygULk1DoHrTt2cOv+4ldHXpG1sph7VjzusoKt0Z/XnV+hNJBqq407IKt8KpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw54OX+P7Kf+DAgBsFjUnkjuXTiPpckwfC+6x7F//RLhSzenXwZ
 Efuz/Ukgkon8qMKyrsdRENuL8fr2lv3Aq/UusIc+oAK1DB+X6Fs/
X-Gm-Gg: ASbGncuiEqvnrEfBUQ2prQoiSQ2JP6RaCMLUBZvaqOp2kvupQr9m59p3666owSfnVMc
 pAVU9Za9gqaDmUILppUYxoNJFy6bBK2tgacvsGejlcFxg208kDAFpWUz1MZTX0tntEjR0o50BN5
 qcpwlRJ/jPFEAPLs8NsBilLlbbYhTmKibjOQbXkysU4yz4hzZJSZ3wErJ9yp8BmsUn6CyQX0Lia
 SMtY5LJd/gQOGitrFyZL9/8UDHsbU6WRUh8NyquIrNwPLki7pUxL382yOtPk4oJReoz+xQtNbwQ
 PtntI3IwRLZAoAeZlIrrymoz7k0ppMWvT1e2FnIDgxL2ANx3+SpKBIPZDfH3SWD/UbElPRo=
X-Google-Smtp-Source: AGHT+IGJskC9aR+5Dgsn/0q7tVfn/b9wEb0pUAkxSpjYPK7zbEkvmX2PCK7JdW0DCG7ccVky18srmw==
X-Received: by 2002:a17:90a:c887:b0:301:a0e9:66f with SMTP id
 98e67ed59e1d1-306dd521d88mr4820575a91.14.1744213592804; 
 Wed, 09 Apr 2025 08:46:32 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 08:46:32 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
 jdelvare@suse.com, linux@roeck-us.net, alexandre.belloni@bootlin.com,
 pgaj@cadence.com
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Frank.Li@nxp.com, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, david.laight.linux@gmail.com,
 andrew.cooper3@citrix.com, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 10/13] drm/bridge: dw-hdmi: Replace open-coded parity
 calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:53 +0800
Message-Id: <20250409154356.423512-11-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index cf1f66b7b192..abf2c72be622 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -4,6 +4,7 @@
  *
  * Written and tested against the Designware HDMI Tx found in iMX6.
  */
+#include <linux/bitops.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -171,12 +172,7 @@ static void dw_hdmi_reformat_iec958(struct snd_dw_hdmi *dw,
 
 static u32 parity(u32 sample)
 {
-	sample ^= sample >> 16;
-	sample ^= sample >> 8;
-	sample ^= sample >> 4;
-	sample ^= sample >> 2;
-	sample ^= sample >> 1;
-	return (sample & 1) << 27;
+	return parity_odd(sample) << 27;
 }
 
 static void dw_hdmi_reformat_s24(struct snd_dw_hdmi *dw,
-- 
2.34.1

