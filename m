Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D840A550A7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5002F10E030;
	Thu,  6 Mar 2025 16:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OC3N8xjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28C710E03D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:26:17 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2f9d3d0f55dso1499871a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278377; x=1741883177; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g4VnYHrG4RwnHlGdrfRVkI5G3ZqKaX1Ck3mTCfWdoMQ=;
 b=OC3N8xjtxKL7IIZ8ZhulaflVu+qbZHPy7E7gVdc5NvvGXTVUYYsX7fQDc6sfVuDtls
 YK0oEVAzzH/907CVDOOXG1MGX95GIzTVN6aiE1/DNAB1m86SeBNjh+eBeN69kywpLXGm
 AkeEfc0UiszAzsm9j9vcK+JlLAIdaHSa+Dr5J3NLGaTmr3WMv4sdgwiWW8I1DdR4LFYw
 SvW1I5dIyh60hUaeahsqpQL1L4psXpmAojV7yUKwhkHQgwICdHfv161VSNybVWcnCq4H
 SpfPsv9VYJDiJj6yN3tcm+1DTUtM0+YDdzMgN2d3EwaCWj5E+RRBKpYvM6hfpVCZU/F7
 M7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278377; x=1741883177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g4VnYHrG4RwnHlGdrfRVkI5G3ZqKaX1Ck3mTCfWdoMQ=;
 b=njeMJWDRHzxhJrsyWiP/uMo2fT8pDTF1nsGipWxDT2Kb/CJ7jpWNKpPR9BsoekANvP
 6tNWKwLMuIYpr0kujYg4lr0D4gxJDiq6B0vK1qm7Oq3OpfrNr5TXOCiEXFR6ttZ92epf
 huaGbfR+FVJM+cnVHoO7zNwWlPCCegEkq5GKYX7JuDKlctQT3+wXVeYWZJGb60u+NaTP
 vV55U4x1b1xCYDk7lK2s0SSJRYJsoZiQgP/ZF2sY+w5evcVhRkSZIVCD7IekNkjTUCEZ
 FaDKnb+bud2MZP8wik+xb7xHMWY7neAKnrbKs6nL9B0RvOeBYQuffXjmsK1ARNR28Jp6
 21SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+EvUkbi4NiVI9WvTjBUG/CbRBjn5W/FQsU8nml5PaKNlWgLF8yIcZitGuHIubzH62kbLPx97UMCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp3dS3qAYmM4X7K0T/jwvkVNycAYQ4uKaFgeea9DNROKmlbc5v
 Nc8jZsd7vqbTrwzQt8+EDHwgZwD+GHaZ9F9HAnVasjMDi5bTfecO
X-Gm-Gg: ASbGncvxROOwMnCKm+9YXYVFprmZcbwPbOtDkuFkxhYPPqjzx5y0WA69nI0vgY0hJyX
 urHhQwvF/kuOHoAFSbBYjSXNtQvubPqFrPwmnQEvHlB1smYKIRnPJNGDP1Sjt5wMHHnlOIuAvqQ
 2Q36LQk07xd/IIy8tpcp5ltjM9C18JBkR3OR4R/GI389iA24XzdSsAYmoXOMasbFWwjLopY4Syq
 VCC/0nzdq14mJHwPdPiPZ35Xc5mKrSqtkPF+x4D9bRwC0A35LAwDnKwm5iewjqUJDZWGl3Jsp41
 MhJ/T8Nfh+fhX0g3FcR4hv8lsQfgjqSjymywIrN2HPkgIy5mm42DQrMbR1bL77ucCodv6T656lM
 =
X-Google-Smtp-Source: AGHT+IHz+gPXGVLABcu1Z5L/FQeF1foGDNMRW0PUwFQDBuhtYoYyf91GQ4fqN6r0d6c4jX9sVUpwVA==
X-Received: by 2002:a17:90b:264c:b0:2ee:863e:9ffc with SMTP id
 98e67ed59e1d1-2ff49753d20mr10753652a91.21.1741278377011; 
 Thu, 06 Mar 2025 08:26:17 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:26:16 -0800 (PST)
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
Subject: [PATCH v3 02/16] bitops: Add parity16(), parity32(),
 and parity64() helpers
Date: Fri,  7 Mar 2025 00:25:27 +0800
Message-Id: <20250306162541.2633025-3-visitorckw@gmail.com>
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

Add parity16(), parity32(), and parity64() to compute the parity of
16-bit, 32-bit, and 64-bit values, respectively. Each function extends
parity8() by XOR-ing upper and lower halves, reducing the input size
progressively.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 44e5765b8bec..906757e1ddf8 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -260,6 +260,48 @@ static inline __attribute_const__ bool parity8(u8 val)
 	return (0x6996 >> (val & 0xf)) & 1;
 }
 
+/**
+ * parity16 - get the parity of an u16 value
+ * @val: the value to be examined
+ *
+ * Determine the parity of the u16 argument.
+ *
+ * Returns:
+ * false for even parity, true for odd parity
+ */
+static inline __attribute_const__ bool parity16(u16 val)
+{
+	return parity8(val ^ (val >> 8));
+}
+
+/**
+ * parity32 - get the parity of an u32 value
+ * @val: the value to be examined
+ *
+ * Determine the parity of the u32 argument.
+ *
+ * Returns:
+ * false for even parity, true for odd parity
+ */
+static inline __attribute_const__ bool parity32(u32 val)
+{
+	return parity16(val ^ (val >> 16));
+}
+
+/**
+ * parity64 - get the parity of an u64 value
+ * @val: the value to be examined
+ *
+ * Determine the parity of the u64 argument.
+ *
+ * Returns:
+ * false for even parity, true for odd parity
+ */
+static inline __attribute_const__ bool parity64(u64 val)
+{
+	return parity32(val ^ (val >> 32));
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.34.1

