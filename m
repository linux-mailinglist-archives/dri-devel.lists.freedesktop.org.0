Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A40F95B81CF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 09:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E908B10E553;
	Wed, 14 Sep 2022 07:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A7910E422;
 Wed, 14 Sep 2022 07:11:00 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id p18so14217116plr.8;
 Wed, 14 Sep 2022 00:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=AU4dxVt2EZAwAafSPDdpJ60cBcN1PRUQqw+/acHisPM=;
 b=ik+MeS4ugOup3HBtZTVSS5/0wdLMPXxMvOk2AgInP8jvjMAeU3zysTsW6v4FjAlcko
 MBsFiQj1RPbj8SCNpCZsAuYveLCJMJ2IUhs4GQdddwY5HuDk0mafoLIrOqrrHb8uft4w
 h1uC/TpbMe/2iMuxa508eRbW1d/IaloCrgzg6e+Y4Ht7H5bBKGZsyKOc93muJkcPGrHy
 55/I8Nwdvv5yX/XAjKfWLxOwtdZuWkU/7Uo0eLbN9vK26Um8Rr7YSQwNv1wbt8ExQPPN
 kgfVr8MG9xHFtiho2G589cprKn0xZmBd3R25OZtIiWXLCMSdDDUDwr5Ef3+619/wTkHg
 KwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=AU4dxVt2EZAwAafSPDdpJ60cBcN1PRUQqw+/acHisPM=;
 b=34TBLfJpNfemc7VXwC3JfS5TfdUpX7HcrPW7Tu9A7ujIt+2yefAO29zbW7rQcP6gpX
 xdxCcsQDWglf+h14NH8aMTtwItTM4pTreU96SUrV8lWlpdi+pny6jDDNyYyTYSCqLc5q
 RKdGlRG3s6dLG5ErZ4tI205Zgq3HMKgCebLhqI/2/5e6Vg8ChMnMcTKJw5+tqmEXCE8r
 h9645DCxPWq4oNs6hxv6ZP4LSuCYed6ygteoDDgeMaCq3+VhjQEnReL+QLO/w3me2E3v
 WCbxoc+os0A22l2PQsCnPuIabXNnAzaD9K+OK6qwUkCcmYUi0F4ueRrRQ5YA0998qt/+
 AvoA==
X-Gm-Message-State: ACrzQf1Ojk/BT1se++hHjgiUq4dhla8jdUJo0Pogl7qV58ObfXZecjGL
 xFWRy484iMYDfiNij9wUfBw=
X-Google-Smtp-Source: AMsMyM4/hZ0xpGlMz6cxwGj5nfP51rRTcZW+ZUMZXe4Q/71GdlLYxy+VH14c7/MMVh32/oK797/6JQ==
X-Received: by 2002:a17:90a:e586:b0:1fa:d28b:ab9b with SMTP id
 g6-20020a17090ae58600b001fad28bab9bmr3357604pjz.47.1663139460468; 
 Wed, 14 Sep 2022 00:11:00 -0700 (PDT)
Received: from hbh25y.. ([129.227.150.140]) by smtp.gmail.com with ESMTPSA id
 w37-20020a631625000000b0041bfa382dfesm8837396pgl.67.2022.09.14.00.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 00:11:00 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm: nouveau: move bounds checking to the front in
 nouveau_svm_fault_buffer_dtor()
Date: Wed, 14 Sep 2022 15:10:50 +0800
Message-Id: <20220914071050.21823-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hangyu Hua <hbh25y@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is better to check i before use it in array to avoid potential out of
bound access.

Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 31a5b81ee9fc..5c49a8eaf593 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -957,7 +957,7 @@ nouveau_svm_fault_buffer_dtor(struct nouveau_svm *svm, int id)
 	int i;
 
 	if (buffer->fault) {
-		for (i = 0; buffer->fault[i] && i < buffer->entries; i++)
+		for (i = 0; i < buffer->entries && buffer->fault[i]; i++)
 			kfree(buffer->fault[i]);
 		kvfree(buffer->fault);
 	}
-- 
2.34.1

