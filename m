Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADBAA4210F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E4410E3F2;
	Mon, 24 Feb 2025 13:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ur4nKnkW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD3010E09E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:45:04 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2fc0bd358ccso7496899a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329104; x=1740933904; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HQRFKAla41Ay10wYFnrS+X/WAyPF0gKgODKhC/FC/AE=;
 b=Ur4nKnkW/LALglx4T6ZVA6/JLXMnNOFZl+j4b5qseje+w2ex+RlCHYLnXBOK3LZ4j8
 1OKaG7yvA3444UA+wrdNarh794pbd2B1bqaQP/MSIVQbryNBzoTuVQ3rZoTXAUdwfS1f
 Or+WqfADYMrhjZMJHWVNDAeUDzkJNTrckYOMJdOhA1wTMdk7aco3VS/EqnwIWAcqcI7P
 9V4xpSoesv7Lt9AR0h6vWA5DA0tc1/kVkwP+ixbMUsoZtmbtEJq42mc9UlIvL6SR5ZN1
 FpBpaMquXBG+H/q1Knwo8zpYawruxII5ZeSA79T4iVJwLfIYFa4dq/o3jmTMamEYzBh5
 SkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329104; x=1740933904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HQRFKAla41Ay10wYFnrS+X/WAyPF0gKgODKhC/FC/AE=;
 b=mK0jy5xZEUtXViI9f4tjRqyzbY8yUQUCdf6X+limnK58xREtTTWyuy55OBz93r7T5a
 9jyx2EoJS/vU0D9k/PwYPa64T0T2jUn+CwZRhpIPO6Yb+mlUHtEESCmhYv66MNPSGw2T
 /Bj/tdlF4hgOnS1hox8QYPZOzblmNou0yQEldTbyje46fWLVmZznjnZN1DuGorVuZNk+
 ul8tcKCmyi5jFblsi9r30nEwPQj2yWZGXW4aw1E6akObM1LQ1SEiU75J+pbGEmY/lc6x
 7xGWMz04tnTs2KtgqWxIuP/a32MjhZ+QYbjgDFsEPKNO6DurjtxR0L2NRbG9BlO5kfI+
 iWaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6vURAlfSDsW7QdjWUuGi9jULC29pdByp/QolXYvDjgyjiSJVQSS/aaUhxx75uiRQ+zg4/xS1h9LE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1aAHXSf4OWXFfcIgY6BEY0xdyrFnKLO49NBKdcyNay2ZpyNbq
 Ow+d4KQEbHHa5ZI/9oJSgHLdyot7ZO7WpSK5BgffE4wGlsI+CV7n
X-Gm-Gg: ASbGncvldeW5OIIRtCvNT+XUov+waaKV56AzCfC+0RKz0fQj6K3RKcklPMIXc46qjZ1
 HMRIl+qGI7jO0HNaPYrzk/3Ws24F2xsE2VlqVAo8sFSGqZHKHYwcP7v8kJU46zfjilwhLbgcWsl
 cL7DN3IV914OvW5fVnhUTjgWajz2+bwn/RFsMr/eZP+QAtOYspEJuYA3G8tSpkTlP68DGbPtC6T
 8W1MOTKdqnA3QRWLgfRz6aNiWbvkdc4tbAJIi2txWTdKukbhXMo53P86xYWcHTOb8/kiwePiPYV
 Be1p6YmjybsYxXxVYcRsuAUsaw1FnIaD3uSC4ak+GbmJZxVnE+NjYkFm
X-Google-Smtp-Source: AGHT+IGJMVNjh2ZkbH600/jnGa2+6i7gpIXMvZAnEqRCXvTYi+XMSGJQL5WK3aQh+mNtGiJ0yE3iuQ==
X-Received: by 2002:a17:90b:2590:b0:2ee:df70:1ff3 with SMTP id
 98e67ed59e1d1-2fce75e1b18mr21089922a91.0.1740329104301; 
 Sun, 23 Feb 2025 08:45:04 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:45:03 -0800 (PST)
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
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH 12/17] drm/bridge: dw-hdmi: Replace open-coded parity
 calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:12 +0800
Message-Id: <20250223164217.2139331-13-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index cf1f66b7b192..833e65f33483 100644
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
+	return parity32(sample) << 27;
 }
 
 static void dw_hdmi_reformat_s24(struct snd_dw_hdmi *dw,
-- 
2.34.1

