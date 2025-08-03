Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A140B19220
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A8810E4B0;
	Sun,  3 Aug 2025 03:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G3SmHY7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A94310E4D4;
 Sun,  3 Aug 2025 03:59:43 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3e3e4a5715dso8643835ab.3; 
 Sat, 02 Aug 2025 20:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193582; x=1754798382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GwuwWG68g+QZ7vXSMh09UV2N2ibuGEdSUwCCEWlJHLI=;
 b=G3SmHY7IE1iVnjL3NepyWU7aCTOgduGfjQEVzBsSMyV9+PYVfZsRDjJ0YtFwKyx8n3
 GJqnke0DdsHSqyvCSyYs5ms6Bqr96pwRcjahYpH1DuerRVn1gl+zL61pFPekpVJjv1ZX
 7M69G4QCuaqwHbXOI4R2h7/QKp0HDWmMOLwUFjk5JZ1/A5SAwbcntt4c50IOAonujsT9
 h2JAct5t6LrbFOZm0yHQH2nkxjKIa3QKlBP7xyJcaZvad+azAcvIF0cDnK1use/3XWyO
 npKqu6xJQySCiTeaAqaBt8Lk+vBC/kgmRuO/pHFvS7QZijkhGUrjf6vUjm05A1XuLdaR
 caAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193582; x=1754798382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GwuwWG68g+QZ7vXSMh09UV2N2ibuGEdSUwCCEWlJHLI=;
 b=Y0AKuAGzDLASq4rO9XfhWRThqG2Hyi/FLNScJl1ELVmth92L7WWSj+b7ujBiig0AdK
 Fi2MhCL95GFJUBMES2GqQ0rNc8DZnyCH1pTmOEq7HUOK+eHn8HQ4ANZzghc7EKiiDL76
 zDUrq+xo/8gjllojEtF7tlsJyX8YzE+0EZebTVMa0fJZwkvPWpEcRKSmdMnxMlXNC7NU
 GE1aedMTwOp+xqEy4kGsjj4Op+8hSdiDTDTC1ca+nl1iCXfMY90mtUoMeGM7ecH8sOKm
 hO9FULGzzZOsrt/X2TgSiAsOKHzkKxZF3pQMx0PSQLXdy2sVa9AZbOjKV5KgXYbqRWfy
 fzTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnkc76Vhjgch0uC9Jic4QnxF1F3j0GyWzu04R4RjDyAkqdtQcwBqPoVNJ+tk2EdSv5FS1KB8HYwL6P@lists.freedesktop.org,
 AJvYcCVwbAnat0sa9CYqNZf0aztrG4KOM9RBeamF13EbJfcw7Cjbthb1rJsOHF3ctj8CI59xb0PrWMVq@lists.freedesktop.org,
 AJvYcCXXEUBtwpPNM+KXjc2mSJ7RwdZnkJ6XeoLFSGr/MnioCP7N+HhRTRIiZjETq4TB4h81/xSasNgrS2FMVzE3Kw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBj4ynAxYCD3bTwHNCu2uQ4TdtG+q0SiGcjVylTbTv1AFEJ4Q4
 QAUVH6vIM4DUzk7rSo0cV6iWj4lam8ERu3rIAuZtfiAJo0Cf0TdyI2LA
X-Gm-Gg: ASbGncvfiBSnkn3+QO8veS2OE1xNaLrBosaFiO+309GKs1JqSFnRmG3oGoQSfPF0VTO
 YH756Ca2F77jLptTfQPpPH1zJvV+5+phgTNKI51V/wbm7MGsIy344hnH+0TNpJQa1XnWpeR5umN
 Rmjwj2FJfiZM72oVcwYusfI21l6My2hhXR+ScFkOvC3Ect7Ugm1ajSj+prkaxsEL6qRDCEZNf9p
 GKRR7kJhCOYpIFIcPrsr4G0aFy67IM6LSSI6QGUx6GGeXb9LivG7ImnQ1TEd1gI/Tfh6DHHW6n1
 +dk8WG+xVz9Yb3xa+xejGZzSNIJTxhQuydS6tkBoVn352DgN5bBxeYmudYPmtFe/UJMwLkhJqHO
 02a49n7OTe3X5Xab3xgTuEhmY3JisaX4UpbT0H8vRqtj6CRMdjSsTz088OQGykHqvUWN8vlibkm
 KzSA==
X-Google-Smtp-Source: AGHT+IFaErFuUf9RL3fjjyrvGPnDiEq4WAlpEJt6vAzu9IAFkK0y610sccboRpj+vz07MAgou68UmQ==
X-Received: by 2002:a05:6e02:318a:b0:3e3:ee1d:58e with SMTP id
 e9e14a558f8ab-3e41611c04amr94519705ab.6.1754193582396; 
 Sat, 02 Aug 2025 20:59:42 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 47/58] drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
Date: Sat,  2 Aug 2025 21:58:05 -0600
Message-ID: <20250803035816.603405-48-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The gma500 has 126 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 85d3557c2eb9b..dc72388ed08d4 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -40,6 +40,8 @@
 static const struct drm_driver driver;
 static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * The table below contains a mapping of the PCI vendor ID and the PCI Device ID
  * to the different groups of PowerVR 5-series chip designs
-- 
2.50.1

