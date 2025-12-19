Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A72CCE906
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 06:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C562A10EAF0;
	Fri, 19 Dec 2025 05:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NxX5wmJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D7010EAF0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 05:43:42 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-29f2676bb21so17280805ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 21:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766123022; x=1766727822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fKkdwzvSXz/T9pEqrvQ0VdQLUSbrQRl3ctUuH0zUyRA=;
 b=NxX5wmJvM5tc54YTl01AKBBI+Du8Bbijl7W7rVXyzbtOlmvykNTwkFsooolWR2N6+i
 6FeJgbyQH5KuY/QNHmcykQYNkzMYMBIeFB+YxAwvxTYqHdpMy0WX1zYK8dLsx1CBrwtr
 e+4Vejavkho0/gxtxWfZtQtgGQwQQ4UeX11BzNwnChcFl6R/8MPrw1+Z7TKMth2qcsGV
 Ghwj6x5rO5rmNox3PsDVFdQei/CnBRdMCJiH9dNDghyflV3CHeBnbwuA4oWnPAVhsS+J
 JEsk2hUOUMzZzj9X2L0HP27zxtWw4oSWO2DR5C2n9i3WRFDpGbF4qPbfM8tli8BA+icT
 /a+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766123022; x=1766727822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fKkdwzvSXz/T9pEqrvQ0VdQLUSbrQRl3ctUuH0zUyRA=;
 b=wINjq7oLhXlhS3NZ21L6yGS8lKXb+ijkCilfu15D0dsXjjR4y9aRkD3Xg7AENOEbLF
 67RNnqc11z3qA2luAc6Q+b5Fke5K9eDOqjUZ8or6mIkH4yhApdmEv4wt43c/bVKgZ4r7
 DyToOS+eMnG56NCs4BAZjgymZuvc+48REi0R1/swl76ShPlDit8yTlJHLq3kFHb3uZZ/
 KPklRwlT/sZNs+lJro1a0p612BfDr30jORo+54STeYKGG3328iNZ+DUeq+M2lHlyCKCa
 ksbFajD9ag5zwH55WADLJha9Fq0qzWBVb9geuUpVnLjmk7onZFpe/alUcOSbTd16I1Ga
 KggQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwolIfYU1LjWtxgLrOhwk9H6rMSv5b61Mj071NoNe0UTFz048osyghCrD9RQXT1JZL2dqkaIozCQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfVRwo/2Pr9nblTokwtfpXT7kjIbySA4SN6E26oNz7bMFgZqBp
 OVnxtbLTYPbTRkiSD5yyNjCM79RSzopyOXRGVX3JLQbOXRusUB6nXOAB
X-Gm-Gg: AY/fxX5f7Wgkb3Y/5MgjBBL0z81GMHpO/tu9hQ5Ir74RLNa5IIgRGH7YnNwH1xKclmX
 plmUoGLDoBghDTrS1LrN4DTtOenpbgAHG0pqcaTbpqZyvAvpaMRy7rDiPO3zUale5HyiipP+6Uy
 8A3IEfYMGQxAe5Hyemgq6etFQC4EHUVoVeqyHBbjGTEH67f3zEipx1aZw6wONkCkRz0O/twXUOn
 vEoL6ZEwBcAOUujK2hZC12On/pR9QBgdUzMs4rf8JKcScafmoT4HRv8cmxQGtgZaGaDmPbOwQmw
 QUUQ47CMWQ76qyb3ee82+zsF7Spl43/lQwznKTwsyLpwo1xUnxP+tIJFXHUfRdHzd/zpYvNyZLn
 bAOYnXGx7P/pc00t/oJVJjFToJCYgvGXxmwyAQgfUTGf/ZoiIX51JdxSEgtSuT/fzUXn4boit1w
 XXEIxsNJGPomYqvpBXhlsHrpihhG2gA6dMkbdTsyQ1X9s=
X-Google-Smtp-Source: AGHT+IGRBz3LEiHHY3N36Lf2Jbdyl+OtCRRLAqx/kmUDLPH9d4n3KvJgE1piBAVSSdqL472NtK6Xtg==
X-Received: by 2002:a17:902:f78d:b0:2a0:c35c:572e with SMTP id
 d9443c01a7336-2a2f2836480mr16751125ad.30.1766123021882; 
 Thu, 18 Dec 2025 21:43:41 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:5160:2cad:cf88:afa5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3da7dabsm9878955ad.25.2025.12.18.21.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 21:43:41 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v2 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs
 support
Date: Thu, 18 Dec 2025 21:43:16 -0800
Message-ID: <20251219054320.447281-2-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219054320.447281-1-chintanlike@gmail.com>
References: <20251219054320.447281-1-chintanlike@gmail.com>
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

