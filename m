Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B92C7BC08F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 22:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D269410E563;
	Fri,  6 Oct 2023 20:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1769F10E563
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 20:42:10 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso1983231a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 13:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696624929; x=1697229729; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qBMYWbpbrSBVp77rMXiQ5aEdCcdBzlEfucMC9y2SIB4=;
 b=iWXR3Kf+Am/QwISTgWHg1FPECcaJLAzCzVK6SwA2ZDWdaJdYq3++ziXf8vufDPNOfq
 itCrQs23M4I3VK5rxyM5LsyqIFOG8fKfoBbWEORb7CL/UR62QLmiHAhM5p8Rc048Cxq0
 NfC/j8Rc0bxmmmplHNs8mxNSHzUpgotOFpFPQvygyjqGSwFWh3XSeVRka+C5mM8jjaxz
 whAO1moOnwi0D+pcehy4/yi+LMIFj7V70Ju/GL3WPDVJabA4VVR5ruFaOhRvjD9/bb6D
 ED8qB5iPOO/4n5mrSexiIzhtxQARWXjm3Vx7wXeJ4W5/PQSXX4lU6CAMT+Hmc3h61jUJ
 P/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696624929; x=1697229729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qBMYWbpbrSBVp77rMXiQ5aEdCcdBzlEfucMC9y2SIB4=;
 b=LOHNG6q83r7jN3pU04Ss4NSKqeRGdJF5kGGTTILiWr6oUUNUI4osRgMSRQuZ99S/Uu
 u0FmHFzX2LBg7PGJhS1w0N2MO3YSYwnY4HAnNqEU/fqgimxyIzioCIvqh2wStJ+XmqNb
 wHa5tEmoRllGoxCd9PLZ0RxvKeUyQKnX72CGfGCwX1kQCLal34Y0bA+a8Vbj97UZYjQ2
 QjJuI2VKNJxnGSf/2zX9gUZvQrr4q1AGoqKXKKKM1liK6QHLSy77plZTi47WmpATIhAi
 Y/l/qifi1kto64lOjBpxv6ay+21GrWcmyumP8OVGkmOtTkqE+2flTd6evgYcFZieMWOn
 /WYg==
X-Gm-Message-State: AOJu0YwPNX1pFqU3WfbwM/uyzU3PjxHrezaMLfDyN3i3eIMoplnw5UUy
 HU3y1fE9KHqvZAjR2IqT8qQ=
X-Google-Smtp-Source: AGHT+IFa1/kBnIsWAzQU0Ku07Ss5y1KElb0VFLIfeqm2Jxt2+RNafilfVdzo9PDcPLXoWFZp/0VLPA==
X-Received: by 2002:a05:6a20:1455:b0:10f:be0:4dce with SMTP id
 a21-20020a056a20145500b0010f0be04dcemr11141772pzi.8.1696624929602; 
 Fri, 06 Oct 2023 13:42:09 -0700 (PDT)
Received: from local.lan ([181.197.224.5]) by smtp.gmail.com with ESMTPSA id
 10-20020a170902c20a00b001ae0152d280sm4355712pll.193.2023.10.06.13.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 13:42:09 -0700 (PDT)
From: Jorge Maidana <jorgem.linux@gmail.com>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 2/2] fbdev/uvesafb: Call cn_del_callback() at the end of
 uvesafb_exit()
Date: Fri,  6 Oct 2023 17:43:47 -0300
Message-Id: <20231006204347.2594-2-jorgem.linux@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231006204347.2594-1-jorgem.linux@gmail.com>
References: <20231006204347.2594-1-jorgem.linux@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Jorge Maidana <jorgem.linux@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the v86d netlink only after all the VBE tasks have been
completed.

Fixes initial state restore on module unload:
uvesafb: VBE state restore call failed (eax=0x4f04, err=-19)

Signed-off-by: Jorge Maidana <jorgem.linux@gmail.com>
---
 drivers/video/fbdev/uvesafb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index a1a67830f..e1f421e91 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1928,10 +1928,10 @@ static void uvesafb_exit(void)
 		}
 	}
 
-	cn_del_callback(&uvesafb_cn_id);
 	driver_remove_file(&uvesafb_driver.driver, &driver_attr_v86d);
 	platform_device_unregister(uvesafb_device);
 	platform_driver_unregister(&uvesafb_driver);
+	cn_del_callback(&uvesafb_cn_id);
 }
 
 module_exit(uvesafb_exit);
-- 
2.30.2

