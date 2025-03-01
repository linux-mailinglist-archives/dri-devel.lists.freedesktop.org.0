Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B097A4ABD0
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033A510E24E;
	Sat,  1 Mar 2025 14:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PRWBh1gC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE6D10E24E
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:27:09 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-22113560c57so59390145ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839229; x=1741444029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ih00TRqmhmd1Mh0sl7zFiAmpBAeBPMq/8Nno4TrvKu8=;
 b=PRWBh1gCSOdii42vNtti7cVPVEmiUnjmvGI3bf1E24Ykg8Cs3PA2Zyr9nQ+gPPxJoo
 fkTMUHEyu3xA3d4SZ57z7KIAvtDD1HKpCIWl9tPUPXmtGwWDLo4TtMyDOcnqBjlCFscl
 S9Th9ZXdSOeRti4AgFoyK5a+lbbw4oDqkD5JWFxkJ5Dpo68MoEV1yLDJnuAO5UixmGTP
 dF0Tp94/3qazS1zCxW9Mli/0wP0Usco3k0PARP91akQGwx7njc7coQrzr3cE+CJh8aWp
 B4E2W4Mz+50wmCnnZMXS3iS6Huao8r5VQkRohRUckxdlQiIg2KDF9VCXb9r2bRpnslg+
 7RwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839229; x=1741444029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ih00TRqmhmd1Mh0sl7zFiAmpBAeBPMq/8Nno4TrvKu8=;
 b=v3iVEtEY+Vnk/BHaNAJ9HlQDkhrebmRapNOrA5auSRHyySDJ9Vf+DRV6oHDjTbkk90
 qlWx4EJEjB0MgQOMn+1isjmk4LYlZ30tRWJnw4NSYGQGIwSaJigR6gt/PDNtQnHk56Us
 +TyF2VQ6sbehdyGHif+hzlFFK88uB8Qa+d7RgUlzBZr47ANm5Ob0Y9dlORtdOvJi6fHn
 IA6KWGuKOj+j2sIxD96WX0EWpyO+SXKDM/danFnQ660ckSedY9sFn9eJ6CP7bdsrSuWu
 6L2bxvD4tsg1e2vxcmz2bGVy8d5nqBW9kFMV5DMe0I9xNMhikGRpo/7JBICh4wtNkEZr
 NRXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdMHwhTxcMJdgTC4Ru8HhnylwXkDny+F4bi0nqWn7vLEWJLTrdGpV01xiepUuRwv0+d+PXbmPpDVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkV0z0oeVFMGzYGZiB7MLv/RXz3KUXG7Fh2iN9Caj8vB/siWgn
 v6IWypkGU+eKI7Ogua9hctEfh4plu9iA8JIypMVziQnwjOWE5+4b
X-Gm-Gg: ASbGncvE063w+QcJnzU3KuBWN3mb3XY9kgzw6FXP94yTX8Yq0mhAM8QVATgGSLopc1p
 KN6Fx9hsPuBAAue40Zp8Q/l9fURdiqisAfv0j4CobSZYO/ZJcIzZsVeXRvghZgh4hsxEnVrbNU9
 a9/cm/Ft3vdDlLwphf0Slx6e72k9k50PjFurzKuvdpIGTtqzQRAWZhRWJy6dnzBJRFQexwWsG/P
 ei0KTXFR1J/OWffHI9LtTStvcGVTDrVzsa6KSYd0IAaqAKQzSjsPbn9x4+OUVmEAtgfQhhh+Eb9
 nzE863yrVkajeDX3+il/8nkYwg4Avj45MC/0ck/jbjfYWWYtA1fT0+QcFjkTQcB0DAY8VmOLUAc
 =
X-Google-Smtp-Source: AGHT+IEWIU2a96xKy97Vw2OZbiqRo6ZsV5By1mOyMKGEerXJ25OnWhIdagB26u20PcByLRXKVw2xEw==
X-Received: by 2002:a17:903:32c8:b0:223:2744:cb32 with SMTP id
 d9443c01a7336-22368f732b3mr142906935ad.5.1740839229452; 
 Sat, 01 Mar 2025 06:27:09 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:27:08 -0800 (PST)
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
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 11/18] wifi: brcm80211: Replace open-coded parity
 calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:02 +0800
Message-Id: <20250301142409.2513835-12-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
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
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/dma.c   | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
index 80c35027787a..d1a1ecd97d42 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
+#include <linux/bitops.h>
 #include <net/cfg80211.h>
 #include <net/mac80211.h>
 
@@ -283,21 +284,6 @@ struct dma_info {
 	bool aligndesc_4k;
 };
 
-/* Check for odd number of 1's */
-static u32 parity32(__le32 data)
-{
-	/* no swap needed for counting 1's */
-	u32 par_data = *(u32 *)&data;
-
-	par_data ^= par_data >> 16;
-	par_data ^= par_data >> 8;
-	par_data ^= par_data >> 4;
-	par_data ^= par_data >> 2;
-	par_data ^= par_data >> 1;
-
-	return par_data & 1;
-}
-
 static bool dma64_dd_parity(struct dma64desc *dd)
 {
 	return parity32(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
-- 
2.34.1

