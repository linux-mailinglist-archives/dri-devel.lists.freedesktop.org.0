Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DACFA550C3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFD810E9F8;
	Thu,  6 Mar 2025 16:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZdcXhXVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CF310E9EB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:27:48 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2feb91a25bdso1493867a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278468; x=1741883268; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/lzzZDV4xgSskf5edAWcKAl1UECahSIOp1fWE1tA1yk=;
 b=ZdcXhXVLdMI+Cb5qDHIzAgn2FGwDN+Yg2QKARsyXwejDqkkoMN5fte9S6chhpWqCea
 s7x1/8hST4OT3yq927pu9NCTfmgIAfcpm/HISzZm2B6mdDZ6MXgj938q8DW3WWYLDoW1
 tmayJm4oLPKvYjZCaDgPVo/s14LRl864R1/iExtVmMHUwYS0NAfGggm9/mrO+N8UOVMl
 o0UvbELJ48gC2VdD84H/aToXffPikvHxR4jQRjbV9uOi07bKCagd54jiszIYlBgUbuVR
 a7dzjTg7x8AQN4YT2sZAFQyoHBVO2gQL1/bFnPIrj+XpuFFslZbFrmjCyTavqb45Fkrd
 0sMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278468; x=1741883268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/lzzZDV4xgSskf5edAWcKAl1UECahSIOp1fWE1tA1yk=;
 b=JUx6Vjy8MZqzCSFt57rDPY+uVc4TpFKjaikpW9xGVH//nKtDLgH1kU1Sj3EploH3S1
 2KvZBB2uvhcVUA9/oyryZjgG+gzUmatmxueXjI2vltWSEXT0d+RdCxKq3RkNg+M7PapD
 LWnm50GXdbjfhI51OKiOp77+9yJcbkPFjr3fJg4N92qdQC2LoTxOlt9Xw8iKyotNIlI8
 XCRzzqBp06RErewz1AOVQvima9qE78v6aajN75iX0hlUcGeYgrBuMrltC75MTaWjQr6u
 4ES1S9TvniWRg25OeT9+DnCt9cgSW5JLBCVY7pZnppG50VwrXtvYHH3QgRRt2PlPHVr8
 m/YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX90WRadeD4YU3YhqS7Y9U1Rqp8NOqq9eo0ebjCJSwWEEys1UmG49NffKdCHHwbG3sPSRdRUvfMjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIRVsxSfJWeXxhGGWhgfS0SwvSN6lAc4GaRxOwVXE73RKD9yai
 M3fLAfqGMI6ih9epHpLwuz4Xk1fBmkneO2jL7i0vDu6FC7hzj5+B
X-Gm-Gg: ASbGncvcgtF6tFcwAY/PzW8UsKhEBjcAiZpdi+ktryK8/Ebmx72DHCWn9hHA1Wj+Sxp
 W/m4HEgmoK2159kc4Lu1stcgupYE9AYff1uxWJNcjtZ59/lN5dwm5q3T+8pNRwQumNMwNSWK1e3
 Qd44UNgqmudTnuElDz0b9PfCqX06D5GYcIzmDlI6f50YEcH9vR9q5AdZkAwK8aLEENJSxM3h8gC
 vw7vwYrqvpnyP21jPU93tsjlavahuwxsAe6yQKF0mI3XmenRBUN1ih5ygPTiTuIK4rO3KN75204
 YN17asLlnhP6EFg/+M6bGGs7mIqeKWLk1zLTU/TEufkWcLWwKPXSFnVulfWDqjtEUxY5YRXCFag
 =
X-Google-Smtp-Source: AGHT+IHWBk8+6ksfik0EhK6cGMIWVO4KCt6lAGGIta1FZHsm7ob/3ELoZ4FHcMM7AbzddV9ZAUKTxA==
X-Received: by 2002:a17:90a:c888:b0:2fe:a77b:d97e with SMTP id
 98e67ed59e1d1-2ff49728368mr13045551a91.11.1741278468014; 
 Thu, 06 Mar 2025 08:27:48 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:27:47 -0800 (PST)
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
Subject: [PATCH v3 11/16] drm/bridge: dw-hdmi: Replace open-coded parity
 calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:36 +0800
Message-Id: <20250306162541.2633025-12-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
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
Changes in v3:
- Change parity32(sample) to !!parity32(sample).

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index cf1f66b7b192..a992ecb149d7 100644
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
+	return !!parity32(sample) << 27;
 }
 
 static void dw_hdmi_reformat_s24(struct snd_dw_hdmi *dw,
-- 
2.34.1

