Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC466CE8B67
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 06:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201BA10E806;
	Tue, 30 Dec 2025 05:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OZ5uyMWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85AD10E806
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 05:29:05 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2a07f8dd9cdso101123975ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767072545; x=1767677345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fKkdwzvSXz/T9pEqrvQ0VdQLUSbrQRl3ctUuH0zUyRA=;
 b=OZ5uyMWt8e9W9/FkeSY+sw5EEY69Vyj6RdHE8IvAH2BP8Boubd3XgxffYVFveeWc1J
 CvCnZRYB5Ll+AwN7SQ4C0t7W6F8Mx0Xrwti+OZ5k+isqiOjxg0f6NG0Sa7pCgwlv8B+T
 +Pg3ttZbBf0mLcJ5JNFmsLW9oqjZxhICPZT6f85IOnDBAwQcwM2r6DdCIfC5TvVlUvlG
 3rsZoBsLunLcuhUZVhLOSb+/WEBLG94dlAP7WK0Nq7adrFpz+W6XkmPlIfCK1wTTXkLJ
 /Pp+ryj5VpdG6v/R003UvGlu1C8DohJKzZKqnyAvrdgmfAxa8h4Gg0H01sZsYWyz4ZkN
 BXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767072545; x=1767677345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fKkdwzvSXz/T9pEqrvQ0VdQLUSbrQRl3ctUuH0zUyRA=;
 b=gVKYEZd1rrBou4iDtTFLaMneGPT6LJVpnJ7NgTG4MjtzZ6W2RR8jI3n9yBcg/wxwjl
 EZWs83pLhFVRBmPQNr3Cj9X98oMVpGy1IFdxvE/K3EgbGZSAr07xdHOZfBlkrsO2O+uc
 LKIXmRdol94AR2VTkidr4o52n0W3D+azaqOkZbIR+8MtRqb813aMZTlgV+gRGtIKwg+c
 G0dHbBKD3VGrDVL5U0JZAAqoArdRAxqgCIDeSzwMdRggDuVP90NfWstYGEpWZ1y5h4oS
 T8uArerTIjZLwcNkducSb6rp6TCIIWUcihPEGoIjSqqEczLZxn9SkzxLymzxyuHfOuT9
 xkxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV91uzfh7QkE0p9HROdTTot55dPBmRDhZMwmMEglj2C/nLfHoKe+dewd6KYJom9iEYjV7uKuGp4/lw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMW+KWanucaEZ/4qpXXO+fkgPrqDuBIr8p95raEz4qayVwFhuT
 YibRfZ0oIPbIWhGWMEazTyxBnZTuWnCG+ZzWsoqXT8+4ALHWSExb1gCE
X-Gm-Gg: AY/fxX6iU8A3gSmeUxWhv3/9CH0nZhxU3Ze4qEl6Cyt2SnauI0lBgPQcumOwm5zMkKt
 fGMq24O4nwKHizJ0ODhclFFulnpMB7tYh0S5wjttLrmfU7PwwN5MRB1ss2LYxT/xEUw0RxtGB/w
 ovqPts0eeRsxtQpEDJY+Pr0h6a4dxS/uL0fs4YNFlaLqpO+qkUukL/QUMWBF9DxlpBi3FvtZZzR
 qrBxzIXbXryBiACmeZ9aWq0IRS2EKIWRxwuJ/x7u0kznx2hrOkqBRUKMKa5KQoUSXfmc2e1tbJv
 erUq5d6aUQHp5ra/lK4s9EL2wr3u/bjw3Q+vr5ewXK6VB8zS0/WWFv0l4494ramut5b1zMnbi6i
 lGsXx+Ihr+6f5F+9Nh+AF7GUcesLrIKhTdWB4ON6sCdmSarW6BSs1J39a/xdR4mvr6xzcHD1dPf
 rVsixw76zxFTCeJKkqEp5UJasw2vHGv7lXV5Y3i6N9q4Q74+hq2MW0
X-Google-Smtp-Source: AGHT+IEF20IOQ3ACEEG5Q9roz15yiegJkgEV49gziCCB4yVsuyx2zyUl9Tnp5LPbFSW7p23DGv+NWQ==
X-Received: by 2002:a17:902:d2c4:b0:2a0:d662:7285 with SMTP id
 d9443c01a7336-2a2f1f789ffmr344796915ad.0.1767072545159; 
 Mon, 29 Dec 2025 21:29:05 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:f7a0:c2f:d915:faf0])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c8286esm289290375ad.33.2025.12.29.21.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 21:29:04 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v3 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs
 support
Date: Mon, 29 Dec 2025 21:28:19 -0800
Message-ID: <20251230052827.4676-2-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230052827.4676-1-chintanlike@gmail.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
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

Add dev_of_fbinfo() to return the framebuffer struct device when
CONFIG_FB_DEVICE is enabled, or NULL otherwise.

This allows fbdev drivers to use sysfs interfaces via runtime checks
instead of CONFIG_FB_DEVICE ifdefs, keeping the code clean while
remaining fully buildable.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 include/linux/fb.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 05cc251035da..dad3fb61a06a 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -628,6 +628,15 @@ static inline void unlock_fb_info(struct fb_info *info)
 	mutex_unlock(&info->lock);
 }
 
+static inline struct device *dev_of_fbinfo(const struct fb_info *info)
+{
+#ifdef CONFIG_FB_DEVICE
+	return info->dev;
+#else
+	return NULL;
+#endif
+}
+
 static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
 					   u8 *src, u32 s_pitch, u32 height)
 {
-- 
2.43.0

