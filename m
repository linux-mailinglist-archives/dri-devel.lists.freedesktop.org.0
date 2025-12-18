Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CB5CCAE90
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 09:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FB210E561;
	Thu, 18 Dec 2025 08:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TA6onNjk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764B610E0CA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:14:42 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7aab061e7cbso442786b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 22:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766038482; x=1766643282; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/ByPqHkzjH6Q1Om9pizog4Avqkf2U2qg2PTvWNAENUs=;
 b=TA6onNjk87C9JO8NHQtbThwtwOBm+g/+FnvhEXanADU9h7MNjlLnkFJ3F2rtdDUWrv
 MMcUX/gC2+/8YZ/l5jud+AhqE0iLkGy2DP+G7NMx7cXfE5ENUCl88Nvy2jqJ171YTQhr
 7vCMp0HG763EbI1ALYlHXmYJgoFVay0Ky7xXz5qidZ/d8JmqanHoqYz5ncbJ7JJipbWV
 ngfqUjF7Co5n1VWUUEV17+GMSUZFZ4cqNzwbMf4tb8uFog/XENN3GeEMZGmvNGC3QryG
 7bIKkay9SuyjSUTz/UMfbZFyXBCrz/BUxNgpogkCqybgQNB1jpgNWnOHDRNyj0tApaN2
 aRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766038482; x=1766643282;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ByPqHkzjH6Q1Om9pizog4Avqkf2U2qg2PTvWNAENUs=;
 b=b99U9461l1z4C4YcAEoRr/FlLZSYSUZlzlZnaLIOUNGLVeyDEmQtMPy3FZqafRM6U0
 FwrlwkXgyIsgH6G10tltHDFRvT+aseFsux6t4XRg/ywxEJyv40jHgWHa2yCzmGOr//MT
 CSy/93zQ0tPxn1DhQuW9S8lJKbE6a/Svd85Rh9f48PJ6WePYQX57d9wkCJTMzeaQ9Z54
 XeOGhJgNsZTqkXunUaa/FQASZibPut5FTFnOaM9d4KnLdVspPpc6eUcp+OVMQkd5+nLZ
 A9ogPBytpDpmKvg/0971kR0E32ncLzK1tg6cDlYv+B0gD4OI8uQdzAP3RP3E20fBK1yO
 Jg4g==
X-Gm-Message-State: AOJu0YzjIxnczn+sBy7ZJYyl9kZL94n1G2+keEYDHQ221Xti62aNMlAe
 /53ITDDcNYk2TkCYlmEJyEHG8Y5k7CXuLVgEdhakYErEie3oRsN9zjNK
X-Gm-Gg: AY/fxX6+lM9Mqp9iBa0sD1t9xKNPTFyQbvC6X18wbJXYe0QsT1UA2t4WytoxQ6SOp9/
 3P4/jxmRMmNrx8JbpErmE11lKO3VITTqz7fhDcQxkc+vtDpMeb9Y0rkq/3R+L24/7cr3tY+IzjT
 anzvYTZoh8aErhUdO4hSr68iUmvJUADf1EtC5gvMPRVnG4WhhFpqNL9Zolx5/7usZfpt+4zOo7V
 /Uh2Vw1vJBoHzgh1t8mt8VV9dYteyA66dh3ZgWYRP8BPGO0xQxCw5LIbmjC4le940xHtyy/yTOG
 Lg4PT4LehQRUlXzu7wALindRCqeakNOtVodMkpB+K5z02SFI/Fdogq0JptDc23PgM304kFJ+wSe
 k2SZGLFa1Vonr8GmY8P4dFF4IvkK5yJZz50QNEi0jMaF/Gk8ehFWDOUcoaUVlSquH0ObseGaFJu
 VQcRt+ma3XdEHY72Ahh+rwEKu4iFPX
X-Google-Smtp-Source: AGHT+IE/9wFIIieTQNvwxm86+AsvmVZQ7ekju2YVJBrytFbrdfTJ3zUvKtJoZsiHz7qoBXsSg5DZNg==
X-Received: by 2002:a05:6a00:6ca4:b0:7b7:828b:f569 with SMTP id
 d2e1a72fcca58-7f667d20d99mr17684559b3a.25.1766038481793; 
 Wed, 17 Dec 2025 22:14:41 -0800 (PST)
Received: from SIQOL-WIN-8.localdomain ([49.36.67.171])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7fe1456d417sm1347795b3a.58.2025.12.17.22.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 22:14:41 -0800 (PST)
From: Arjun Changla <arjunchangla7@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arjun Changla <arjunchangla7@gmail.com>
Subject: [PATCH] staging: fbtft: fix spacing before close parenthesis
Date: Thu, 18 Dec 2025 06:14:06 +0000
Message-ID: <20251218061406.8043-1-arjunchangla7@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 18 Dec 2025 08:35:17 +0000
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

Fix checkpatch error "space prohibited before that close parenthesis"
on line 65 by removing the extra space.

Signed-off-by: Arjun Changla <arjunchangla7@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..2f7c891177fb 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,7 +62,7 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
 define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
 
-- 
2.43.0

