Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FF3768D92
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 09:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9679210E1B1;
	Mon, 31 Jul 2023 07:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD4F10E163
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 02:18:25 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-686be3cbea0so3192574b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 19:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690769905; x=1691374705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YGe7yeLSCJNtOm6KMm1pCwSHsNpi9wZaHI6nfPlQl3c=;
 b=h5K+DYPqZFC60a4cycOBBwDw5B5aIbHbzVUDTSJ6TmYOhMYUesVIXYk0R0JFkg2WgX
 BqzQ34i+6GjiKS6oRSCiLl0ic6J9PuUs4c4QS6euPm/SL7qBhmuS6/kg/TKZzh+lNtD5
 K/cb62Lbuse0dW9UGOxZCzJrJBqDiopp9TjAJysFCOBEUGMBIf6InBjVzAcMwhwVWWjN
 OzOpHhxABYLhKR/ifh3OWwHVUjQX04a8Yf/2GsLMwiWsRj4Msd08iBqmJZ7caPgi1w9J
 rV8j/ceCuCZ1VYT+la25Uut6MLD8MoUE5y1wia1maBSuWyvnORxdF6JL1mnTNKn0/Wma
 xr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690769905; x=1691374705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YGe7yeLSCJNtOm6KMm1pCwSHsNpi9wZaHI6nfPlQl3c=;
 b=cF1Z6I/tfNjVgg9SXvqkw+DmfcSXbN28mj587kOS2s19nES5fUZKaEkQKVw5uWGbxn
 MCNIKlabswIcZwPrkOQhMPEIxHa/kDpsNKwd400Y69qvjLbm6g6ZemIbWNG+Ivn8Sr7O
 o6uVipKdwVwj/5g3D9+k6V3NxPhLI4xQxvp4jwTgSl06NFY3CeXyMULzsMMHlm0OtTmC
 l4fDVZb7Q7QVgdbCS5oKkdh5SJsRK7m1he7lEnU3uZufFuqogFDQEtIDaTicefxzuUCF
 uc5S2lISJLYmNZI69YuX/4g7J+i8djKApNCUoBz4qLMtYs07LU9IVNfqja8KYzhsuE8d
 FzjA==
X-Gm-Message-State: ABy/qLae84jtjM0XT7nCkeH8gtHTFo23DSAoE+S5oIxHcXcsq9xJhhEx
 edgjEAuJvIqYT1i3Tljvpjc=
X-Google-Smtp-Source: APBJJlFEz/QKJPg44Ka8GKBHJeWwG0oxzm4iA/VEL0cm8A0/7em09GsIoQpzhFflx+zfO6TcGfEObQ==
X-Received: by 2002:a05:6a20:3d21:b0:10b:bf2d:71bb with SMTP id
 y33-20020a056a203d2100b0010bbf2d71bbmr9643953pzi.27.1690769905200; 
 Sun, 30 Jul 2023 19:18:25 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:f50b:8f24:acc4:e5c])
 by smtp.gmail.com with ESMTPSA id
 y1-20020aa78041000000b00686bcfb5a34sm6460022pfm.124.2023.07.30.19.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 19:18:24 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: deller@gmx.de
Subject: [PATCH] fbdev/amifb: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Date: Sun, 30 Jul 2023 19:18:08 -0700
Message-Id: <20230731021808.24997-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:15:32 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replacing zero-length arrays with C99 flexible-array members
because they are deprecated. Use the new DECLARE_FLEX_ARRAY()
auxiliary macro instead of defining a zero-length array.

This fixes warnings such as:
./drivers/video/fbdev/amifb.c:690:6-10: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/video/fbdev/amifb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index d88265dbebf4..f216b2c702a1 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -687,7 +687,7 @@ struct fb_var_cursorinfo {
 	__u16 height;
 	__u16 xspot;
 	__u16 yspot;
-	__u8 data[1];			/* field with [height][width]        */
+	DECLARE_FLEX_ARRAY(__u8, data);	/* field with [height][width]        */
 };
 
 struct fb_cursorstate {
-- 
2.34.1

