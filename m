Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2B6B8C5D1
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 12:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D153A10E2B3;
	Sat, 20 Sep 2025 10:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LdYfU3zG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7408510EA9D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 21:29:46 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-329e1c8e079so2453105a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758317386; x=1758922186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vleSOAnQ7W/ttFzCw+PSwwPxqJNTbd1eP/1iar3uehM=;
 b=LdYfU3zGzWPe13a87Pa/E5ij40G4vBuH3PZkOcmGGNeOaPaZslZ42ct0fArqqMDUQt
 WJbJDMTCAyjWI/wLe6yXNmZ9KP73ERvlujK8MOWMOak19CxyQQ5ou709JRwGziBS8u+S
 7QecCf2xNXXIBL9ZD1ThPus6W6nKMdJ5sF67gSdiD82gQa8h4n7woakWt7vCXmjk0loQ
 FD/pAipGeUtgONb8vj1r0iUUbzD6cCtP7YA6t5dr4f95n+9MMnbVf0dSN2RV/Zj20kip
 22y6SK3QN+GyMnUGGSKF4zF/bgTqzjFAF3u4ePXa7ySH53ETKBVYSsg0vb9CQkGHu9Ln
 nmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758317386; x=1758922186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vleSOAnQ7W/ttFzCw+PSwwPxqJNTbd1eP/1iar3uehM=;
 b=MTTlAL+M0NSlLFtuOg8RtEnWEfk/dWCc9giRHSv/FRdvJdfrX6eNhAXa5+phsjakVI
 ZFr4WOW9Obac4uRmAzsYIK8A3CTv3KwuCkNPo4H68AjB2RqS3Ol0hgpGTCLG4gZUGmDQ
 +KtJqrBgg+LYuH4S4JtH2O5+QWnCuotPl7v7tc3q/LmZX+iDH5fc6DQahppyjyP574fH
 S+3ZsEZcWDPEWkQv/sQ5vjbelIeRTsBhL1XL6dQrph4BUTLgaCt1vk4VsEvc6Zu7AekR
 kWz4yTHJDB9SSy60WAAaA8WCtfvke/KVZZ0ixg/9I7rXmqabzeKCna/4q7zfGwWZ5zhg
 0gNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWojc+O8LlFM5W17/YHi7uF6YQL21zCNGi2Edovldqx5g7RvK4gpwK7xMk2sg+pGYVRybHeVVC+nQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaBwo2InCjsQLukKeK9WSrjj3sMVomnFZIRORwdU/D1Rbo0LYZ
 9s5xOhKfV09SbnUfjgj5mAAOKtlUNLggm9CpRT6A5Xz5/OEM6Ap+SR87
X-Gm-Gg: ASbGncu88JGaWz27MyxODPrvPpjMd9RYU84iiiL9rWxvFKz8BIOzmR4I/Axd+3+yfQl
 rGTFoU4BuNwC0BdQO2hsfTQ8CGZeuidPuuJU81GM83KHgaqKx/ypRq4OM1/T9BxZAaCgubPKNrt
 FU8IJkhvL0Umq2apFltmiEofxQ3t+R+UiTpToKV4DdW//PLWWcEPajbFpjH2GgaP9d0p6XQKZaW
 OIQeqg/838nnjTXtypRsy2vPO7PpcLm424lQcIHJEXbkTtY/+gbd1vUWadtN234V2WuOecI61ds
 kvTghsstsgCR1rAjofcubupJujniR6yZG8jQG1+0FoxIRFiYpYAme8f18wHojVuQJ2xN4F50Fbi
 1UhEaTZrDXAoAomTMvR5dRE8Vm4bM8feVyRzkeXN3ntlD8U52F3EKm/FmsSFS8g==
X-Google-Smtp-Source: AGHT+IHsl189j2QSfxSlpgxEoKYSohVc3V9vQEcwrv5b1bjjq+l89ZFUZ2CsOgVd9B2doDfpl+okoA==
X-Received: by 2002:a17:90b:54d0:b0:32e:3837:284e with SMTP id
 98e67ed59e1d1-33097ff70ebmr5944059a91.10.1758317385798; 
 Fri, 19 Sep 2025 14:29:45 -0700 (PDT)
Received: from deepanshupratik.taild3063f.ts.net ([205.254.163.168])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ff3fdb22sm5837987a12.25.2025.09.19.14.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 14:29:45 -0700 (PDT)
From: DeepanshuPratik <deepanshu.pratik@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, DeepanshuPratik <deepanshu.pratik@gmail.com>
Subject: [PATCH] staging: fbtft: fix macro usage and style warnings
Date: Sat, 20 Sep 2025 02:59:38 +0530
Message-ID: <20250919212938.822374-1-deepanshu.pratik@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 20 Sep 2025 10:49:23 +0000
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

This patch fixes the trailing comma issue in the
define_fbtft_write_reg() macro calls, which caused
checkpatch.pl to complain with:

  ERROR: space prohibited before that close parenthesis ')'

The affected macro invocations were updated to pass an
identity modifier instead of leaving the argument empty.
This resolves build errors while ensuring compliance
with kernel coding style.

No functional changes are introduced; this patch only
addresses build and style issues.

Signed-off-by: DeepanshuPratik <deepanshu.pratik@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff1..60846185d 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -11,6 +11,7 @@
  *
  *****************************************************************************/
 
+#define NOOP(x) (x)                                                           \
 #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
 void func(struct fbtft_par *par, int len, ...)                                \
 {                                                                             \
@@ -62,9 +63,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, NOOP)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, NOOP)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.43.0

