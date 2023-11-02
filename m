Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07A07DFADC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 20:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B924010E98F;
	Thu,  2 Nov 2023 19:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1050310E98D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 19:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698953058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p5/AYOFpMtipyX3yVNE3RQ2sBJUpaSLLWRc4pCufaM4=;
 b=OWhDI53GuVSG4zFPvQnZ1OEc/SxTuMo6dCImaHHN+4SB2Et1BMQIkOOkBz7rV10tMyaMRF
 zj7pXhKowuzIYhirQdjWLaZcw+7JAYTpX7MW3Qx3M4jnMkPCsRLERT2BczER7prDBPG74R
 vuChqXkUy7o6kCSHi3efTug1kYkL0Ug=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-W1IJih9UOlSbeqcjMoz9nA-1; Thu, 02 Nov 2023 15:24:14 -0400
X-MC-Unique: W1IJih9UOlSbeqcjMoz9nA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32dfbc50f1dso172460f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 12:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698953053; x=1699557853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p5/AYOFpMtipyX3yVNE3RQ2sBJUpaSLLWRc4pCufaM4=;
 b=hfBoKTjtiFTm3UjFhs2ivCCm2fOHAk/TeB8i+Y0QsJ26TthEB67sEZUgMrL+RY6KdH
 b06pEDK9TlgQFUORQid0ZJxp6qRA8gDAQY7kUkP1UjZu5CqIl1xbKibxC4QV3m+h5cfZ
 qeAOVEU9gAKHU3Sq/PFqB+0NPs4VZMUab7rQnh1r901J/qYQO39FHJxjzmZStDc0hI6p
 EeCD8xKw+5ImYTYg7toeKGUJ+VSowiKiJxUwoJp4A5Bj4uP56aO09IMYcyw5PauWlA2w
 tBMu0cvaMEFoLUM8hvWFk0GYzJ4Dnc8dH6WKLrRVW+jkcJmF7AjYriigh5xnqNRrfl+G
 Qnkg==
X-Gm-Message-State: AOJu0YxbnzJsTaOIbPo78CFj0tNvT4Fg1m+cYCXVaxHqWkiK0Waje9oL
 a9/LoGcrZe0Mx9s/27AcamTyV8nJ2pm8wSYO3JUalMcwhCSoTWJPA2945dcicKCH4Myv+P3GXK5
 1etrsavK20phU7+YYEg18IDMnEa1E
X-Received: by 2002:a05:600c:350c:b0:405:39bb:38a8 with SMTP id
 h12-20020a05600c350c00b0040539bb38a8mr15776531wmq.2.1698953053685; 
 Thu, 02 Nov 2023 12:24:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEUyUDco60L/5B6mfJp7cXtWCHrP4XE4BNQJlgxAUqDulZh/VHu2Gj0WecmI7xbtoZDCWUmA==
X-Received: by 2002:a05:600c:350c:b0:405:39bb:38a8 with SMTP id
 h12-20020a05600c350c00b0040539bb38a8mr15776516wmq.2.1698953053326; 
 Thu, 02 Nov 2023 12:24:13 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 ([2001:9e8:32c5:d600:227b:d2ff:fe26:2a7a])
 by smtp.gmail.com with ESMTPSA id
 gw21-20020a05600c851500b004064741f855sm66371wmb.47.2023.11.02.12.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 12:24:12 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH] drivers/video/fbdev: use new array-copying-wrapper
Date: Thu,  2 Nov 2023 20:24:03 +0100
Message-ID: <20231102192402.53721-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
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
Cc: Dave Airlie <airlied@redhat.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Philipp Stanner <pstanner@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

viafbdev.c utilizes memdup_user() to copy an array from userspace.

There is a new wrapper, specifically designed for copying arrays. Use
this one instead.

Suggested-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/video/fbdev/via/viafbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/via/viafbdev.c b/drivers/video/fbdev/via/viafbdev.c
index 58868f8880d6..a52b1ba43a48 100644
--- a/drivers/video/fbdev/via/viafbdev.c
+++ b/drivers/video/fbdev/via/viafbdev.c
@@ -574,7 +574,7 @@ static int viafb_ioctl(struct fb_info *info, u_int cmd, u_long arg)
 		break;
 
 	case VIAFB_SET_GAMMA_LUT:
-		viafb_gamma_table = memdup_user(argp, 256 * sizeof(u32));
+		viafb_gamma_table = memdup_array_user(argp, 256, sizeof(u32));
 		if (IS_ERR(viafb_gamma_table))
 			return PTR_ERR(viafb_gamma_table);
 		viafb_set_gamma_table(viafb_bpp, viafb_gamma_table);
-- 
2.41.0

