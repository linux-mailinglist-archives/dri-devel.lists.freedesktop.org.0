Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580A9C9DAF0
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 04:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20D710E0AB;
	Wed,  3 Dec 2025 03:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b="J0ddn4kQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FDB10E0AB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 03:56:04 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7b9c17dd591so5555020b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 19:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1764734164; x=1765338964;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tAaOe3I4qqbjiAbuFCLi0zuJzOlC1rPEZWLT+Z/CQgA=;
 b=J0ddn4kQ7bqVlLTE9qK/fhTPM5DcwjARJliZ2WdPHGEc3cqy8dzXD5vjMlGRxOSHJZ
 2lLVSiTxW0LEklx0pP8y4VwiLOkeuXzH2c4KvF6gng5FtD1DkqwLCO4pZTzVk/cDhaCy
 8QG2y6zvGOHh9VxCbuRBhKFo8OBWuvHXUkcc+2zuE7+CK1G+9RHF6ZzurE6YrbFrlvgW
 g1cR7OPpAf5I3xTv7f0kd8KO0+6lsWMSYrqKp/GF807RhnLcTlUtg3LkDWkV06elQhAx
 2jIEZ9XhDK2qK7uUSInKS3pEQIWGessCxwCQ7KT2ac9SeYv9kKj5smcjWdar0VoCFGhd
 OGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764734164; x=1765338964;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tAaOe3I4qqbjiAbuFCLi0zuJzOlC1rPEZWLT+Z/CQgA=;
 b=gJcb66IyxSiZXaSsYt5FEED5WfWfeMlWbxylVxuFWlsX1Asr+yhahBjiFT5NvnyZoe
 5cy5O8ge2dWeO8uMVnaH4TQcQ1vjQKV13KHK4e7CdRmZSmK83MrQrc4CAzeYkHsDuFb4
 dY61an1LGA5cesISmtxXqSfgtUdC1NnvVhfuGARq/+VhBOxZVtgf4dAlZf2W/JnccXha
 dBcHgPd29CAT3YYloRhZQx1nkas8b8hGHa27+LVLzmVBU899kkOmKCI8vS8N29S9vKcR
 v/PlSM/mljpYXADKsBzsA/Za+MNScUirw7JXH1sLr0FlF4YYaso4xkVFd9/wtvUnNHOx
 tTCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUluoWk05T3RohTzkSfEX8FjEzzid7fvOWm0EpyuQA4NyKrJNhuu10NxA0n72coP6n9Gyz7e8KAK1M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGYheEttX89cN8tY/mzLeHOqmlesc3k6QeIBL53NmKiT/8wveW
 FBAfjePt+29aE291yLmygollg6VLHLP3ychYQSYc0C9GZWhlBX/b0a9v+2eaeII2jp8=
X-Gm-Gg: ASbGncscvRN0qxsHdRMkyfY9z+QkfFsbIl8OSbc4h8cH8I42ktbwpDxXX9M0Mlc3tES
 39hBpDc32Nl0QhBljHr1aGElVYQLlIsL3+AI6KM7E/uqAXAuv7dpI1NnzEr9L4uO95QeyNm+zOO
 CJuZaSNUUdC+PqINntTOriBHzuleljuiIOBxOlDkrmRLu7s1QCmAwn0cJYzG4kHAHTK9SXyNgW4
 VV1r1/Wq2lNX62Ve3G69eyHpy+9OyPVLfu5uhoDw8UqUGxulFpsQV2qyejRWlyBPIAtCIO06rsf
 lLpPSKT/m4DQUAi3iL+WVjWCtRy0KXtaSkfOC7Xl1q60TqwQMHiNCCVX6VmdyDck+fRzn65Vnlg
 +5LR34QXY+WrwMk4tdjydNk+WIPidB/Fbfn83Stu0ne3Q8dWBMj8QrnDZ1tw1mqCqWUyYeXw+c+
 htRihyLLqI9MIG77I30MRkuOkj
X-Google-Smtp-Source: AGHT+IFef9AGSAm8GKX/qr/Br9lF5EWDpBydbgHDWnXJYMbMYZGYeYLEZP4+XBsg5LuvOZUhF/xKRg==
X-Received: by 2002:a05:7022:91e:b0:119:e56b:98c0 with SMTP id
 a92af1059eb24-11df0cdb884mr855726c88.39.1764734163762; 
 Tue, 02 Dec 2025 19:56:03 -0800 (PST)
Received: from localhost.localdomain ([49.37.219.248])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-11dcb057cb0sm96287741c88.9.2025.12.02.19.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 19:56:03 -0800 (PST)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: deller@gmx.de
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>, niederp@physik.uni-kl.de,
 tomi.valkeinen@ti.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] fbdev: ssd1307fb: fix potential page leak in
 ssd1307fb_probe()
Date: Wed,  3 Dec 2025 09:25:44 +0530
Message-ID: <20251203035546.26849-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
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

The page allocated for vmem using __get_free_pages() is not freed on the
error paths after it. Fix that by adding a corresponding __free_pages()
call to the error path.

Fixes: facd94bc458a ("fbdev: ssd1307fb: Allocate page aligned video memory.")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Not tested on hardware.

v1->v2:
- Fix incorrect call to __free_pages with uninitialized values as
  pointed out by Helge Deller. Now, the patch uses vmem and vmem_size
  which hold valid values at the goto site.

  Thanks for catching. I'm sorry I overlooked this in v1.

v1 link: https://lore.kernel.org/all/20251202191225.111661-1-nihaal@cse.iitm.ac.in/

 drivers/video/fbdev/ssd1307fb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index aa6cc0a8151a..83dd31fa1fab 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -680,7 +680,7 @@ static int ssd1307fb_probe(struct i2c_client *client)
 	if (!ssd1307fb_defio) {
 		dev_err(dev, "Couldn't allocate deferred io.\n");
 		ret = -ENOMEM;
-		goto fb_alloc_error;
+		goto fb_defio_error;
 	}
 
 	ssd1307fb_defio->delay = HZ / refreshrate;
@@ -757,6 +757,8 @@ static int ssd1307fb_probe(struct i2c_client *client)
 		regulator_disable(par->vbat_reg);
 reset_oled_error:
 	fb_deferred_io_cleanup(info);
+fb_defio_error:
+	__free_pages(vmem, get_order(vmem_size));
 fb_alloc_error:
 	framebuffer_release(info);
 	return ret;
-- 
2.43.0

