Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4458158CF
	for <lists+dri-devel@lfdr.de>; Sat, 16 Dec 2023 12:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A38210E33E;
	Sat, 16 Dec 2023 11:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1AA10E33E
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 11:36:48 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7b7a9f90edaso90791039f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 03:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702726607; x=1703331407; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ocRgCXAtsKIhDY46/sNAXTkc2BKnazpPIGLZ/doKpcg=;
 b=g/PMPFu/WMufMSIkCW9IWxq3Egf86i7o/UTsGWTHYre/y7dyDL3Kw6E5Xhb7EVGSgh
 gLz3IYTZwMwhLtXlt4mM392wsiiNAJETC/qcH6AP8SdoP7PeI75tvJXTlIuniESmSzko
 RwB7vEViBwlv2zsit/Yzty1n6fiWCBpTEayDP9xD3q/rxzBj3hPz4ZipLlKeyu67RYjX
 ExAeItuSunSWMHBx2emkG5zPPlBORhOuPsIP9syZkqDmOdCeXHZHcYJwgtpMAGr8ZUrJ
 1pOYpm2YZolQ6z1AUUIi6pPbVJwDzT6xX/sm1n9gdxcrewSm8GCEFiiS5NpnUNg2xNfd
 BWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702726607; x=1703331407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ocRgCXAtsKIhDY46/sNAXTkc2BKnazpPIGLZ/doKpcg=;
 b=n4FOE4JDb5Qh8dQSn4Z0Wt+SEMUDauxAFAwEkNbFf++2A+sgZat+FEOS+uYc6MRyvq
 elluG+liUdzvyHl8s9appF9bs9F79i5QkPQrFHdHJ+dBOWYAkC3NyBUblyGP+Aae7X8l
 jSD8Bg1GjqhmXeQWIp2r1hFYkv823SybYXB357Z+UUjzh7C5DDmFOF5Hu6NG8hjOqU1y
 SWj1H86a+ccn0rh1+gzXqxAjQBT9BYFxJb99H4b4JXUQLod1PCfsbGQIWRUgoOidvZGN
 jGbxdBHg2rKrvrFluw61/7vh6xIkfP3Hh3HZsuJha0KX+sAFn3Ik1PcfrXms0ya08d22
 hmKA==
X-Gm-Message-State: AOJu0Yy8o5imqpObdEoqTlzotBVnJk08BrdLesuWs27ZynR4tsolHB2w
 ec63jI5ml+KUn+Cq1CUgOYDf7QbN2IZZJQ==
X-Google-Smtp-Source: AGHT+IF+N7Bexz7tdLWcUJarav1fmFO0fqWWAeba5Apfcl2pQgC8kSDi30Q//cBzbgGdYCXBqmtv3w==
X-Received: by 2002:a05:6e02:1706:b0:35f:9907:280c with SMTP id
 u6-20020a056e02170600b0035f9907280cmr2517183ill.1.1702726607524; 
 Sat, 16 Dec 2023 03:36:47 -0800 (PST)
Received: from attreyee-HP-Pavilion-Laptop-14-ec0xxx.. ([27.5.150.118])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a634204000000b005b856fab5e9sm14481504pga.18.2023.12.16.03.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 03:36:46 -0800 (PST)
From: attreyee-muk <tintinm2017@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/drm_gem.c: Fixed WARNING in
 drm_gem_object_handle_put_unlocked
Date: Sat, 16 Dec 2023 16:13:51 +0530
Message-Id: <20231216104350.12375-1-tintinm2017@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 attreyee-muk <tintinm2017@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previously, I was sending out the patch in a wrong format, hence sending
this patch again describing my changes.

Looking at the code and the call trace reported by Syzbot (issue link : https://syzkaller.appspot.com/bug?extid=ef3256a360c02207a4cb), I understood
that the issue lies in the drm_gem.c file in
drm_gem_object_handle_put_unlocked(obj);. 

As per my understanding, I believe that a warning is given out when the DRM GEM object handle gets
destroyed along with the function getting returned immediately. 

To take care of the warning only, I think that the WARN_ON can be removed with
only the function getting returned when the object handle gets
destroyed, without a warning. 
Or else, we can even have a message logging in the place of a direct warning which will give out the
information that the object handle has been destroyed.

I also think that the WARN_ON is given for debugging purposes and hence proposing a
solution if the warning can be replaced with a simple message log.

I am looking forward to getting help in this regard from the respected maintainers.

Thank You
Attreyee Mukherjee

Signed-off-by: Attreyee Mukherjee <tintinm2017@gmail.com>
---
 drivers/gpu/drm/drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 44a948b80ee1..b6be9400cd11 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -222,7 +222,7 @@ drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	bool final = false;
 
-	if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
+	if (READ_ONCE(obj->handle_count) == 0)
 		return;
 
 	/*
-- 
2.34.1

