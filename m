Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4036785D56B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 11:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE13410E54D;
	Wed, 21 Feb 2024 10:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g/lUzw8T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7526C10E6CB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:52:52 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-5e42b4bbfa4so924531a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 01:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708509172; x=1709113972; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=umbo7IOMB+N5hMU5uXuhZHNVgY+ZT3DkUOlBqWz8poY=;
 b=g/lUzw8T9s59DcNFQ4QAxN9Avt6/6Gq6DFZbEyzARoh0X+Jo/azW0Q9VxilM5lDMmK
 bJEC3pvjXtSyW37Uf/gLsZoTHVYdhedlpQFMDa0OqwB0VjT5MP4p/eY9VtsNelmUArXX
 y04k/GcFyAGaK+89JBC/0RbRNp5PeGA4hBBei/QKUrqcQ00diyRTKTXPuu9QIt3Ky8mo
 oEx76sNfRRdTZvS5jnryZQmPyJplD3jc1mtmwzZGwca9yvr71Mx9nXRIuOu1ma3uM4PO
 D1DFAFOAaxo/pm+lZZlS2O2s6h5UbHD09gDbwVciLZ+EXd4rcD68wjk1IW4aNN7e3kyr
 2KtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708509172; x=1709113972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=umbo7IOMB+N5hMU5uXuhZHNVgY+ZT3DkUOlBqWz8poY=;
 b=svjZQzcStCnOzkl2SeZqK4u29b7fINiUzsUkzQp868817OLASWW+5GvZRZS8gYA9rf
 fAETg0G9ZhQfgl8ozs0xZGyc9kRgS7z9iWCCYbsmjbaUcWHzQlawe2QypNal6eKXGzB2
 g9oli+qBFZke4wz9rXERrK9L4/OkDVvCURL2KTijYbDfb3VXjMYZOvIkDbXP3xyysFOt
 lFBP6ej1Qfln/ySbDPhrTSMHjsNfkgk0J+5Emuh2dU41p1eebWt8eagj9XSklVQlqL0K
 2HftDoeKUWpVc37yeHXcxyfPNgdpm96T2/mTz9Zn9Zx4GpnxVojQTSxT4LIqUw1wFV+i
 f6bw==
X-Gm-Message-State: AOJu0Yylh6+zrpm7drYmAST+teDdF5rIanEMaowhWhu9EQDnezGqDTDn
 78Tfjl3eHDdnSKt7akxTlRmY4LmV4Y4Ph8wiygaxKQho2Qcs4YOSqmCpfR3DB4k=
X-Google-Smtp-Source: AGHT+IHVR2SHjyVF3c5NtEANlYKund2uDElKO0tgKWeUMqRiBx6wQMP4L/8c6ILH58TxmxIy3JESng==
X-Received: by 2002:a17:90a:68cf:b0:29a:1b37:4bfd with SMTP id
 q15-20020a17090a68cf00b0029a1b374bfdmr666223pjj.7.1708509171837; 
 Wed, 21 Feb 2024 01:52:51 -0800 (PST)
Received: from localhost.localdomain ([222.151.198.97])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a8b0300b0029942a73eaesm9124093pjn.9.2024.02.21.01.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 01:52:51 -0800 (PST)
From: sawara04.o@gmail.com
To: gregkh@linuxfoundation.org,
	sawara04.o@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH] staging: fbtft: Fix "space prohibited before that close
 parenthesis ')'" error reported by checkpatch
Date: Wed, 21 Feb 2024 18:54:04 +0900
Message-Id: <20240221095404.592464-1-sawara04.o@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 21 Feb 2024 10:24:14 +0000
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

From: Kyoji Ogasawara <sawara04.o@gmail.com>

Since whitespace is prohibited before that close parenthesis ')' in a
conditional statements, remove it and fix checkpatch.pl error "space prohibited before that
close parenthesis ')'".

Signed-off-by: Kyoji Ogasawara <sawara04.o@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 3d422bc11641..02a16671f2a1 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.39.3

