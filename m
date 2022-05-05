Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E923251BECC
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 14:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6BC10FBDE;
	Thu,  5 May 2022 12:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEDD10FBDE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 12:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651752270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=b6FsSuldSV9lRRf+mgtlrrW/HBBrOUZtFamaruZ97h8=;
 b=dG/Q4M1hA7mkXSgK5+IOCYXP9/BesUUdYS9UFhEDZ57I4eQ1o7DPy+wnkgjRtOvlzbnliE
 QK3c2lppHSbFGFhop4rVsRhN0g8j/jl+vvy1Eh1/7FG3OPWP4baO4/kURv4m2C6vBItMSA
 3wW3OG14qpmrFOn2dvPzpDIG+Z8i7OA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-xx-FN8XyPeeU55yvIbumYA-1; Thu, 05 May 2022 08:04:29 -0400
X-MC-Unique: xx-FN8XyPeeU55yvIbumYA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k29-20020adfb35d000000b0020adc94662dso1377282wrd.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 05:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b6FsSuldSV9lRRf+mgtlrrW/HBBrOUZtFamaruZ97h8=;
 b=ch6PGiP0Nm7Xh7u95C30vrilKQPDXMsSWzGCUMT8dQNg+NCQzap32O49jhFYAkB8Ep
 yfrbGhDkBN9pItnbdfV+GXFrAU3KrSS74y4TEB5teQHa0T6yFD3Ie2gpLvjnAcD9DdQf
 AwDgyLwHtswvReWFG+AHXpMinYjl2D+pwX9h3lSO5zIPDGZ25MvDHKyHjgIoC4MlkxFJ
 pjzikhs3GMUPhh35N75TSGJLn/eosvLioNKr47UT0jBU0cUKKq7YXTJbGvEIh/2aOCIq
 VXGWcAr1KIZGF4VEz/ty0MO4YlctHBERiWE/0EY4FgVPC6mJ07arE3rIpmZgWPUqJV1g
 Tncw==
X-Gm-Message-State: AOAM531Uyw90ALWNcAD1LENqBy7jbPzsCzw8gaeCrMHcrRd5/WqYggiW
 z9lvTC/PiGuTNYRk18JL/BLxzDQ+uveRo0G4skf+cHo9fhsLI+r8VptGYTXnVp739MyWnOk1IG1
 GAaHcIuAak5mE8djk8BxuALY0/ABr
X-Received: by 2002:a5d:64ac:0:b0:20c:62a1:b4c9 with SMTP id
 m12-20020a5d64ac000000b0020c62a1b4c9mr15253773wrp.491.1651752267944; 
 Thu, 05 May 2022 05:04:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKBH1eP1dtXBfBIGG5Mc+1TNDzXh/v6Q5kMSQ2I645JQ2mXPp/4I/aDUd/MM9H8r/X0NxYFg==
X-Received: by 2002:a5d:64ac:0:b0:20c:62a1:b4c9 with SMTP id
 m12-20020a5d64ac000000b0020c62a1b4c9mr15253754wrp.491.1651752267730; 
 Thu, 05 May 2022 05:04:27 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bg19-20020a05600c3c9300b003942a244edasm1267350wmb.31.2022.05.05.05.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 05:04:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: vesafb: Allow to be built if COMPILE_TEST is enabled
Date: Thu,  5 May 2022 14:04:18 +0200
Message-Id: <20220505120419.314136-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver has runtime but no build time dependency with X86, so it can
be built for testing purposes if the COMPILE_TEST option is enabled.

This is useful to have more build coverage and make sure that the driver
is not affected by changes that could cause build regressions.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index f2a6b81e45c4..bd849013f16f 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -616,7 +616,7 @@ config FB_UVESA
 
 config FB_VESA
 	bool "VESA VGA graphics support"
-	depends on (FB = y) && X86
+	depends on (FB = y) && (X86 || COMPILE_TEST)
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-- 
2.35.1

