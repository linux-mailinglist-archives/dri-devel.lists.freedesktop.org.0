Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CC7C05BD5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2FF10EA74;
	Fri, 24 Oct 2025 11:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OdwRwxL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4230D10EA74
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:00:29 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso9299235e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 04:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761303628; x=1761908428; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2DlPJEXE9bFCg3voEVGTmMxEdVMG5zLWK3yFZXX/LI=;
 b=OdwRwxL6WC+MG66Ezm3n32GyzjQ6yAYogQZOsPkfgJ/1g4w7odoHlhOnqC+/xPoBvJ
 6V69XKUFNLYVRULnSce5Z1n83x3eld6DPvV5qeesgRiG+Q7HvLU+FL9HWnr0e1Drwva1
 miAeHt2qek3c+fi0anY06A4W7VYMCrpvwA/ACX+0QjJKRE+Sw5aKzfcdtzGbSJ5ULdIb
 Lt1E1LtsVWqeZRCN/s5YEeYT6Jho+b4RPDemxuLz2jfPmyilrwtZhj8aTXbkPMH+nuqE
 LhQDPyaSBlDMJWAsX+mfsg9v2h3AQNd1eq3pdPlys1QnfoHIpBnhKVZt46xo9VTQOQXm
 ikqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761303628; x=1761908428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2DlPJEXE9bFCg3voEVGTmMxEdVMG5zLWK3yFZXX/LI=;
 b=qvBHENR9JPf1rsW+DYqOlrFwV0h/m15CjrpZuF2CqcpF27/ZBsdxJheA/Gj/jwGcpl
 N9WoUaTLxs3T3HzPfK9Hto0OwHvATskrHIyjXvloN5dVDVrNmDP54WLcbotXSDOiJ+Uc
 nAS7QduR1yPSmOywcPfB+R4n8XKErSpxDnnKh3CjJ8jLvQLItd1UxA+9d6er6bqXQEB6
 5efV26d2M5Z+CXzxHx95cxAhS9asDLMy+NP+AJMCNoU+lsQ5AlfTwK2sPo1HAh3BaPMA
 hIruQHZUpzPrmZd6wxwVKHTnFjFof2NCeS1ErmQhbJD82aM5PJdRnAdscIGHatO9f4b4
 LoSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhybqDogl1IU1NsHdXX6rzvKFDTeMnCUNnqnZNS54l5tJcoGa4tboOI0HseMKqhhVagKsvHvk/d5U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2AFUmvpqFpm/nqDgNUeYwtlVT65pvgBXVjqKzIaFmhS9K5k7o
 MVspA2OVer8JVm+tQAlUGKyZBau9/myjKW75jnfVYncGrQjDqk2Gf4II
X-Gm-Gg: ASbGncsS7iQFaCsFQcI2UljkUFvS408+KuXL+vAd+Skt1FZtP9bvYUItXB7lncMkarH
 j+Ace3XXZqtyiU1kgX5oiTFgw/T7zAUYUzJBBlgqqaHjs7kHiK0qu7NBR/igA37MvcezhxaoK68
 lospZKUYYejHFwfS/Lm+EKnFIgyeB9PS+PAAvLw+rD3vtI2qwBQVuv4N1ljP3GBjVy3d0FlF6UV
 kIBMdvxTb78K4hxiC4zcaPAFXCrKjXzPwTxpMdH7+UAsGHrtEJBc6y3419rSzbYKuLl0T8fz14z
 pkuyDcM9SWUxFCX1HxYjZaYHGQ/qLTxA2P1NWIefcwc1TRbmy5F9qH9lCHsG2WZdyQ3sqzLWitk
 IXV6Pk8GGo6Ffe/GWlSO2TJqhzW37SCtHUj/v4XefNB83ldfPTyBM8r0sJpV2TXIbYSCUA1JeXf
 NDaS18G6QFc3pyX1FxBN63
X-Google-Smtp-Source: AGHT+IFDGexIqIJe+aeZRvtxTGvwmt0zUxNNK7H0pqVfPDQQTVgP3yUieL4uwsisR5iCtogwo4ejsQ==
X-Received: by 2002:a05:600d:8303:b0:46e:396b:f5ae with SMTP id
 5b1f17b1804b1-475d43c85bemr7875965e9.16.1761303626317; 
 Fri, 24 Oct 2025 04:00:26 -0700 (PDT)
Received: from fedora ([37.29.213.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475cae9253bsm82484615e9.1.2025.10.24.04.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 04:00:25 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 2/2] drm/vkms: Update testing with IGT IGT_DEVICE
Date: Fri, 24 Oct 2025 13:00:05 +0200
Message-ID: <20251024110014.4614-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024110014.4614-1-jose.exposito89@gmail.com>
References: <20251024110014.4614-1-jose.exposito89@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VKMS is no longer in the platform bus, instead, it is in the faux bus.

In addition, when present, IGT picks hardware drivers instead of virtual
drivers, like VKMS or vgem, if they are not forced.

Update the documentation to use IGT_FORCE_DRIVER instead of IGT_DEVICE.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index d8c445c417b7..1e79e62a6bc4 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -159,26 +159,23 @@ To return to graphical mode, do::
 
   sudo systemctl isolate graphical.target
 
-Once you are in text only mode, you can run tests using the --device switch
-or IGT_DEVICE variable to specify the device filter for the driver we want
-to test. IGT_DEVICE can also be used with the run-tests.sh script to run the
+Once you are in text only mode, you can run tests using the IGT_FORCE_DRIVER
+variable to specify the device filter for the driver we want to test.
+IGT_FORCE_DRIVER can also be used with the run-tests.sh script to run the
 tests for a specific driver::
 
-  sudo ./build/tests/<name of test> --device "sys:/sys/devices/platform/vkms"
-  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/<name of test>
-  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./scripts/run-tests.sh -t <name of test>
+  sudo IGT_FORCE_DRIVER="vkms" ./build/tests/<name of test>
+  sudo IGT_FORCE_DRIVER="vkms" ./scripts/run-tests.sh -t <name of test>
 
 For example, to test the functionality of the writeback library,
 we can run the kms_writeback test::
 
-  sudo ./build/tests/kms_writeback --device "sys:/sys/devices/platform/vkms"
-  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_writeback
-  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./scripts/run-tests.sh -t kms_writeback
+  sudo IGT_FORCE_DRIVER="vkms" ./build/tests/kms_writeback
+  sudo IGT_FORCE_DRIVER="vkms" ./scripts/run-tests.sh -t kms_writeback
 
 You can also run subtests if you do not want to run the entire test::
 
-  sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
-  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
+  sudo IGT_FORCE_DRIVER="vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
 
 Testing With KUnit
 ==================
-- 
2.51.0

