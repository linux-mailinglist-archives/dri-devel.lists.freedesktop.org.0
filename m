Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249F6502B8D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 16:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F6710E1ED;
	Fri, 15 Apr 2022 14:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CDD10E499
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 14:13:45 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-d39f741ba0so8158152fac.13
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 07:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Aqd3cVPWfCv4uAfqdQC3dxQYsG0PuSaL4S7UTovgqyY=;
 b=I8AVxiJekURB8bEX7DWfqphVA8le7jh+z8Rfgw+4a8Fm577YgNItUP1SiHVal7wN2F
 xv6Ja1Dvp45bcSoCiWb3eV27JRMI5LP3YLMz2IixEzjkB7Vza28slEJ1TI8jqP8keeKf
 vw/KLU9ZuOf8Emfo+lcg1wMlUDTdywAwTxNThbvS6a1BnxH7B9ljMhMQMV3li6jQe7dn
 s2wtM3uuKjESQXyCdjln5YJ3JdJmXEjQ1XUgon/uXCIueWB3J9SaJwCg3A4aB7D1upzb
 1RmBF9YsrCFarO/XIhJt4TmL8PMfmFlMD5bYTy0PV7FENoUJWMNzVLL6TEr00vX5Oh8d
 7kfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Aqd3cVPWfCv4uAfqdQC3dxQYsG0PuSaL4S7UTovgqyY=;
 b=MVGWzH4Xkmoh6QjyluRJTEtzUKBCNDroj1vwrIDMRwYEWfl6yYCPb7NM+/zWJS0RDH
 0Z5vBquEjfJ0xyEMsOoaLBN90SYPTVxrt2s8IRdFHdYMQDzz+g2V5PeBm1ULWHW+81q0
 EZdY7v7yJDlg6DLlVqFFDqdVzm1IYcVXdlz1Ufd4NlcOsqqRko6EqOHRWay0Av3KQ+F3
 LFjgOYKps2fEAhDIn6o0tEBQT/amcF599sHmDa9FldJE3SY6rNWKHrXss+90IPQ+OlCP
 KAWYXZLYPbuNmRzNrTpyis+69V7mgXqOEauC9IBX8s2+eHm5gxnBUHseUTL6pgyONyfZ
 JKfQ==
X-Gm-Message-State: AOAM5338q0mFggEmmpMH2z6u2oHl7Td+YQMS7MdITlz4vm7ZlXE+pIKB
 +9rMy+FQJCrPszgpvDYy0/4=
X-Google-Smtp-Source: ABdhPJx7pK+v5H7Ot/XNC6LqmJEc+H87E7GWfhSQrxGFZ/vaaBYtjMcxb4At4cr9yDvTdqXtGu3LlA==
X-Received: by 2002:a05:6870:f295:b0:e1:ea02:2001 with SMTP id
 u21-20020a056870f29500b000e1ea022001mr1464904oap.241.1650032024623; 
 Fri, 15 Apr 2022 07:13:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4c2:8a9b:dcc3:45ee:2581:b4cb])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a4ae781000000b00320d5d238efsm1156189oov.3.2022.04.15.07.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 07:13:44 -0700 (PDT)
From: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrealmeid@riseup.net
Subject: [PATCH v2 0/2] drm/vkms: check plane_composer->map[0] before using it
Date: Fri, 15 Apr 2022 08:12:58 -0300
Message-Id: <20220415111300.61013-1-tales.aparecida@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, this is a follow-up of my last patch. Thanks for the reviews!

Changes from v1:

Edit the first commit message as suggested by Melissa and add a commit to enhance the
error handling (André)

Tales Lelo da Aparecida (2):
  drm/vkms: check plane_composer->map[0] before using it
  drm/vkms: return early if compose_plane fails

 drivers/gpu/drm/vkms/vkms_composer.c | 32 ++++++++++++++++++----------
 1 file changed, 21 insertions(+), 11 deletions(-)

-- 
2.35.1

