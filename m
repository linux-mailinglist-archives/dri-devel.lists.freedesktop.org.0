Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560AFAFD6C4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 20:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC77910E171;
	Tue,  8 Jul 2025 18:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DMw+XER7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0BD10E113
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 18:58:17 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-60c93c23b08so9326403a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 11:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752001096; x=1752605896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hMoAvbrxtKsq6oPqfXZMpup7TKaRFl1WTnF7F859PKc=;
 b=DMw+XER7hmzABv+OBtsNBXZTd+21WR9MK4q37qseFND6nx2rclAYnPZ1VahDQuy3Uc
 HigeSZsNMY6/Ah/5QHQm6FUk11FfjOS6fMeS6uW3MEwmeAqC9UgiDb4+U5GkXSCZqPnm
 +WwxnHXKzSusT4KcHu3Xc3AAsbh5Olf4Qtf+yjp38f2HxJoy2IiiTKOpS4L1WRoNaKEx
 lhbP/VyUJ71IFGnb/5A568IJ+l6ddeaEWuQEnT7OsJVll98hQwlhzNizKrbJtGxvGptN
 xSdQFhiWQTKbmkqdcaywECggM0ebZnQGKrWtmu4DYIES62otBduIaB/HC9lFRppC+89m
 1DJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752001096; x=1752605896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hMoAvbrxtKsq6oPqfXZMpup7TKaRFl1WTnF7F859PKc=;
 b=ciPpb4VoW6DWrfb7GjDgOLfj016eg4qBXW2k8L5fUEc41yNrLpwoeqCFB+0/HW5J7o
 S++fYSvvijSItN2RQuSKyYz4BsEDGQgRRzdUr8K2LroinbNT3IppE3C75Z3dxS+3X2Nx
 4I0llriyrnTIHbYDBJA3RoMrfxjc2g/+T4dl60F0BNf514zAysz/kNP/lJPRKN3j320z
 msHXsFw8Km5AHi7R40mVb91CDMHO3B2XK9QDFaMyMfj3akhdesQ/BpIXN0RAebKeAA7O
 RHbfhJ0jd3kwywRAltPmvWgfUlxUkr6RruAqGpuDmBH+Ud9ZfLNvXBAFoTC+UCOHIQfO
 5pyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLACeHZ3531uz9qChCgr8nyHk/N7gqVyhRnDJ07H/bPWX6gGwwMQTOfAodDFtx68Un4PtyGPnNQNc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkcDG9iH7B08rMm7lZXmZCM+7fcaBf/KxPjaELuR7Q5Tsf3oY2
 JGlaFFMHpCBoVA0gMGphA5TzP3oCWMpjGrMqjnDG2G/Tn23QPr3l6pjr
X-Gm-Gg: ASbGnctp5BI4XipdHtuxrMUYzd+ajewAUELo928bE8b/T3DOjlv2xDSpzsl76ao90Z7
 LJxaphbsPrZ2sMeK82f3GrA9j5f/gLJ4vK/27jyrK8r6A1sMPkxA0v3NcB+lFCmJ6pLKxTbwgz1
 CZ5WWg2pfRuwUJnC4ZFZzEAjYOjZ+yu3TD5TB/iNtSbTjjHoSHdx+k2OoC8CkTaLKCZxNNQFX4R
 zukGm8y1gdf26Iy74vC7HhC008oip5eCLLKyLi2lYC6Fs8thdmcf5C72z0Aaj7rUaJvfB3LCt4K
 V9i9yEHxc9VSElrf498w9e7BOnmWF2gandRFnNX2q2VjCVVwNP/htCkFd1ybevfxkAWiUS0EOkJ
 PUF6vwYaRBMk17n0kz2PIzvhMgFsh+fUmKZxTmZD0LQZnCnGizGGQDLmqHlxyRTvyVldAeuQdiA
 zVYw==
X-Google-Smtp-Source: AGHT+IGxD8PX5m0JgMwpN5yrcudA8c3K7G/eD45JopdPDwwopxw+BvbVLALmoGz+TMoVO6eJ8ePL0w==
X-Received: by 2002:a17:907:72c2:b0:ae3:f903:e41 with SMTP id
 a640c23a62f3a-ae3fbe42971mr1842396766b.54.1752001095820; 
 Tue, 08 Jul 2025 11:58:15 -0700 (PDT)
Received: from kubuntu-e14.homenet.telecomitalia.it
 (host-87-21-242-88.retail.telecomitalia.it. [87.21.242.88])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6ac45easm935366466b.100.2025.07.08.11.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 11:58:15 -0700 (PDT)
From: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
To: tzimmermann@suse.de,
	deller@gmx.de
Cc: giovanni.disanti.lkl@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] fbdev: kyro: Add missing PCI memory region request
Date: Tue,  8 Jul 2025 20:57:31 +0200
Message-ID: <20250708185808.845692-1-giovanni.disanti.lkl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <55e427bc-53d6-4ec8-b86a-99bd7367d5bb@suse.de>
References: <55e427bc-53d6-4ec8-b86a-99bd7367d5bb@suse.de>
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

Hi Thomas,

Thanks for the feedback.

On Tue, 8 Jul 2025 at 5:10, Thomas Zimmermann wrote:
> Could this use pcim_request_all_regions() [1] instead? Cleanup and error
> rollback would be automatic.
> ...
> Instead of manual cleanup, you're better off using pcim_enable_device()
> [2] in kyrofb_probe(). Cleaning up is automatic then.

I've applied the changes. I noticed that the driver still has manual
ioremap() and pci_ioremap_wc_bar() calls inside the probe function.
Should these also be converted to devm_ioremap() and devm_ioremap_wc() to
make the cleanup fully automatic? Or should I do it in another patch?

Changes in v2:
- Use pcim_enable_device() instead of pci_enable_device()
- Use pcim_request_all_regions() instead of pci_request_regions()
- Removed manual cleanup code as it's now automatic

---

The kyro framebuffer driver did not request its PCI memory regions,
which could lead to conflicts with other drivers.  This change
addresses the task "Request memory regions in all fbdev drivers"
from the file Documentation/gpu/todo.rst.

This is addressed by using the managed device functions pcim_enable_device()
and pcim_request_all_regions(). This simplifies the code by making error
handling and driver removal cleanup automatic for these resources.

Signed-off-by: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
---
 drivers/video/fbdev/kyro/fbdev.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index 08ee8baa79f8..86e5d60ed0ff 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -679,7 +679,8 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
-	if ((err = pci_enable_device(pdev))) {
+	err = pcim_enable_device(pdev);
+	if (err) {
 		printk(KERN_WARNING "kyrofb: Can't enable pdev: %d\n", err);
 		return err;
 	}
@@ -688,6 +689,10 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (!info)
 		return -ENOMEM;
 
+	err = pcim_request_all_regions(pdev, "kyrofb");
+	if (err)
+		goto out_free_fb;
+
 	currentpar = info->par;
 
 	kyro_fix.smem_start = pci_resource_start(pdev, 0);
-- 
2.43.0

