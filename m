Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B844A4ABE6
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADEF10E270;
	Sat,  1 Mar 2025 14:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="euEh2UzZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C9C10E273
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:28:23 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2235908a30aso28682815ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839303; x=1741444103; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U+YDx3nsS23nFYRYOsOtDL2pw2M9KWSnqwRamUvuzKU=;
 b=euEh2UzZVHxMcAS8JVv+eJjBSUB0oiJlpDwV7C2Qh1gp2SzUGQ6mCmS5vgXIrgUgYw
 ECt67P5aVfDV66BG+pfva86wPvum/1zEdZa+cF+wq3pPigzPGzqG0XbVT2/sbnNpU/lf
 SWFVRbD0X/bFMc4V6RjORYv1VAcmXdcI4MJaFClWceOYhKsBmZMW60QSuBliErR4/xcY
 XDdHkIemE8CZpdaofy1HylDcVphH8q3oqjfNdbLZzVl+PwAHuDZaIUDeFbSMONIOEa3+
 aVotEC+eWWsiz5HrvyhMrJDiWe3g4HKuCcai24KUXQ3SaGpNNLZbW3aX01rw7/q/6Sqs
 +M1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839303; x=1741444103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+YDx3nsS23nFYRYOsOtDL2pw2M9KWSnqwRamUvuzKU=;
 b=Iz6wWPK+jor4TDrGqr4FS5yRZZt/Jws2Jii3WJ0jw00ikBouWgHReL02fIh+Dmw15O
 jwu1EdLOiiwWxasrKJHlgUQsp72Tnx51CybCyIen0Z43GUBzm3u9t+ifKQOkKWAtGHqj
 9feE8FdREt1A6fUekcyYAag5u+g+ZHVchtiIGeWPhvKVqhsWGt8cnLfmMtMHxxJvwxRX
 TzAQ8Si0G9n6CUdNF7hH4GICSeBad9/+WfBjWkBUm52Yi5oaAmUp1ZLT6t8SSutoxNPW
 0nJQ8QfSi82DNK5nwlXGUNMwXHle50XhCGQ+bYTN6Ob8nJcg8z2DRNCgMDbenaLzUUQs
 3+xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlymAospOlY7ViY858Bwjdet9Ckudtfaqsj8X4em2XBuFv1zM611A3AjwxidJfn2D4+WDmSJyFTOI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh0/j6VogUa9ZZseDpUWHb7Yc9bt12YkmlbfxmtnoNIVVhjIL4
 6XMyDvhu7heUGTIY5Hy3PYYAAiukLaa/9w5A3RV/2QiZwwB5DuBc
X-Gm-Gg: ASbGncuBV/4Cr/y1rHc7GbDn2uwPOVKhxt6sPGe/VWyMqcbHyCFrrD5d1JnvC1Gcmdx
 HD3owD2NdrGVe3bMKXUEy5P10kct2ieSnrj43DJTee/nJO1PSJMT/yRMv3pZRbUAxbT5J7/ep1l
 7oY6gUzFlkU4RFwFBJ4T2I73F/vigC8zSdO4bQwlkv+1uW7kFSrVZ6AZd1rGdsnT91sp2EYAnup
 FrdxykaZnR2SZuvHTjEc3Dekbw3O6eJfjGbFYbfhjte4ELteU6OWASQJDbyw0ZzS27tVGGP2D6J
 3c4xqf849QJRazx2GjXMYxK/9xQoTIjBa2MucC2ITk3DuiMa5au9PGyVJA+zk+87Rx09/FblpVo
 =
X-Google-Smtp-Source: AGHT+IGhHD61bMoj/kNCGfxuoRIMfZUbm2G8Vzi7r2Cl3xtga31v9ygF/WbFM3AD1XuJUCHC8w75/Q==
X-Received: by 2002:a17:903:41cf:b0:21f:164d:93fe with SMTP id
 d9443c01a7336-2236922174bmr117354565ad.53.1740839303516; 
 Sat, 01 Mar 2025 06:28:23 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:28:22 -0800 (PST)
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
Subject: [PATCH v2 18/18] bitops: Add parity() macro for automatic type-based
 selection
Date: Sat,  1 Mar 2025 22:24:09 +0800
Message-Id: <20250301142409.2513835-19-visitorckw@gmail.com>
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

Introduce the parity() macro, which selects the appropriate parity
function (parity8(), parity16(), parity32(), or parity64()) based on
the size of the input type. This improves usability by allowing a
generic parity calculation without requiring explicit function
selection.

If the input type does not match the supported sizes, BUILD_BUG() is
triggered to catch invalid usage at compile time.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Place this patch last in the series to avoid compilation errors.

 include/linux/bitops.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 41e9e7fb894b..fa4e45741dff 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -339,6 +339,28 @@ static inline __attribute_const__ int parity64(u64 val)
 	return __builtin_constant_p(val) ? _parity_const(val) : _parity64(val);
 }
 
+#define parity(val)			\
+({					\
+	int __ret;			\
+	switch (BITS_PER_TYPE(val)) {	\
+	case 64:			\
+		__ret = parity64(val);	\
+		break;			\
+	case 32:			\
+		__ret = parity32(val);	\
+		break;			\
+	case 16:			\
+		__ret = parity16(val);	\
+		break;			\
+	case 8:				\
+		__ret = parity8(val);	\
+		break;			\
+	default:			\
+		BUILD_BUG();		\
+	}				\
+	__ret;				\
+})
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.34.1

