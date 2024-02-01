Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FECC8452FF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 09:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D10610E630;
	Thu,  1 Feb 2024 08:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A7A10F793
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 06:00:56 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-59a7a6a24b1so256940eaf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 22:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706767256; x=1707372056; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TNqK50nnoYYuan190E0eP8SeFX+t45XrkVrq9dZoFeQ=;
 b=mnQMDSIq3E2HfjcHBSfX663AAv/snhyH4OPwIqSLaW5bz+YVMpVqXiFNOjYoiNuoZr
 eTUaj1bW0r0n85ioLdlPVKofCJcE2cM/IVf3B+NRniJKi8wRknxOfGLdC/PfT03c0xRa
 +uuW7ScvMn5E+Hyl8sBchs8kz5CQWqEq9+bdkSMmWBxvGcaxdECVC2K0cc8yB4dehXVh
 Sxgz7l5lotWlZURjYIwzRgjz8k64TEChpzXNUK/ipOP0TjSRD13Uq/CURXDBwMbJLS80
 AqMYoioNJi7c0K2boCJhYrQpdgGYXfF+8ouLCXgeMvT0NS0plD/bkE3mtHL+GOkInmtk
 aYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706767256; x=1707372056;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TNqK50nnoYYuan190E0eP8SeFX+t45XrkVrq9dZoFeQ=;
 b=lLMf7r42ChuNOvvgdkNsSUbdCRbImA/SuPt6VUTe+LHzO6em4jA1u/LIFYTrq2TNHn
 RTNl9YxCOMcFt5ZVsQlyiwYXmpPgn7BvEJ9qOshkUeDvhx6utdZdDlkqjXBEkuSPII9n
 OlaxuBcnmYmVcHcTuRMUZXcHcgaEx8Lbd8BqNjc93aadK8ypedGn14GdAeRq+839AjaU
 BvOmcnf6H8hfSXTlUn0pqy5/I2+cv9C71fcXitUMvrs5lAgRCZLGZmpyS7Yss64jclAV
 eTV1TVIdw2DYPiR6Ix84IayK364EAhlhbJDRtveNJkvEL6wkt1Z30sDQFXMfU+2fQo4B
 4czA==
X-Gm-Message-State: AOJu0YxSh21GvjfPs85Rx81ew/yyHx7A/6bDayrLVAldLH5hOSiU1/9l
 +Mhowoy87Gj+UInSbRxNQFBe4SseZBqaGbVzC3vdN8CXWA2N5WZP
X-Google-Smtp-Source: AGHT+IHcVlLzVN688P71oGlESCZpzZCNnOKzQYQpaj46pVgz4n3hzhfDPwZCWeDPvMepB8EpgU0gdg==
X-Received: by 2002:a05:6358:3121:b0:176:40fb:e123 with SMTP id
 c33-20020a056358312100b0017640fbe123mr3761793rwe.5.1706767255698; 
 Wed, 31 Jan 2024 22:00:55 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW58zNQ7RRUJl0D+6XE/IYfATzZDmZFvUbCxlFidY8YBavKgky0QSUOOhjkOYy9906WTlThIMqRkWE+7aieaxHv9tHsSR5CGpAAf201CKtb2IC5k0DYeA84HEX5RZxuUGD9Q96lXx1J3zNDOBhAHnGoOL07ggTkssJDJYhynhYyOMdqxA0Dv62eolWhvzWivqopxphjMVN3JTYGgE6/wlo8xoN+IJ+YYuv97uiPIfwm+9ILuozFkkSr3uwtegMaQNnzH6ZsfDVIAZtEDGTnoZTYWJgVdKkQXIcwHRBPgfZnrJDaWV+QwGU4mdkriukD9O7EE31MBicntRRm7oshX5NE8Xg1XbAJYFDt01xKfl9gpXLf2ldR3wMQi6hzxXKBEiyVtMQK
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net.
 [73.254.87.52]) by smtp.gmail.com with ESMTPSA id
 ka7-20020a056a00938700b006d9a38fe569sm10809913pfb.89.2024.01.31.22.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 22:00:55 -0800 (PST)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 drawat.floss@gmail.com, javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de
Subject: [PATCH 1/1] fbdev/hyperv_fb: Fix logic error for Gen2 VMs in
 hvfb_getmem()
Date: Wed, 31 Jan 2024 22:00:22 -0800
Message-Id: <20240201060022.233666-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 01 Feb 2024 08:43:22 +0000
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
Reply-To: mhklinux@outlook.com
Cc: linux-fbdev@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Kelley <mhklinux@outlook.com>

A recent commit removing the use of screen_info introduced a logic
error. The error causes hvfb_getmem() to always return -ENOMEM
for Generation 2 VMs. As a result, the Hyper-V frame buffer
device fails to initialize. The error was introduced by removing
an "else if" clause, leaving Gen2 VMs to always take the -ENOMEM
error path.

Fix the problem by removing the error path "else" clause. Gen 2
VMs now always proceed through the MMIO memory allocation code,
but with "base" and "size" defaulting to 0.

Fixes: 0aa0838c84da ("fbdev/hyperv_fb: Remove firmware framebuffers with aperture helpers")
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/video/fbdev/hyperv_fb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index c26ee6fd73c9..8fdccf033b2d 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1010,8 +1010,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 			goto getmem_done;
 		}
 		pr_info("Unable to allocate enough contiguous physical memory on Gen 1 VM. Using MMIO instead.\n");
-	} else {
-		goto err1;
 	}
 
 	/*
-- 
2.25.1

