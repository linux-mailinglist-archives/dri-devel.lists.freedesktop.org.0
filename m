Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AE1B5A39A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 23:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847C810E80C;
	Tue, 16 Sep 2025 21:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RG7Mlo84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41ED910E7A9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 21:08:40 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-772627dd50aso269168b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758056920; x=1758661720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f/slzqlLJOnOVGiOw/1xh19ooiMbxqONBzW53uf/ZwU=;
 b=RG7Mlo84vcaIBQCSxXlxqeSe3bHme+DzNQWVX7QZoeb8fOIwte44Q7QJr0lDw8YDya
 dsc2SAhSPkNiFMSbWQ+35bNvrKaaiC30SUP60xKuMn1zwYmFa5wRYkimOrNVOPDCThwe
 RjJk3KoQEjOis/Bp4T5hBWR6WauV5+Fx+a/xAcHtSmMLWikpweqo62qbtylsFKp199v4
 43mJsvtnBzw+fBr/1I3G/57Xcw3WfviYJtAh/y6XDL6aY2M1hjHyQdFmeAQpUzfAvB+A
 PavlDBkuFHrOwEvzF/39AjYsfcN3+bVTcSmX5qxsvIAjkcwp11Jz5vvs2YPXjAvmCYy7
 H7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758056920; x=1758661720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/slzqlLJOnOVGiOw/1xh19ooiMbxqONBzW53uf/ZwU=;
 b=oTtpsD8P7vHN5tuCN/icHtkT/acffy/T9CUMfZdineHgQ49scyGLEFRFOWE4aOj+FJ
 b+zwxUd3HsxF6U0oi36zfxHdsp2z2q8hiOKKD2CEWFS19LPNcJO922ad0XwxwKGsNJM3
 ELv+2/XmZBOdCbrwdftlpzEpBKQFM9W8s0g0rrvyOHS4MimxUaU27WyA+Sip2FSGx4yM
 SpuJrHxhRaFepxb34sqoFBcQZaUDEMdin0iWXS8RsueIOKNMk3xZep0HeFDM9zM5/PYK
 DkLDoXd3uMcNDecIbHP7QyXM88iCGLi5ChqF9sACtZDzxi8W0vRa11OL4mFNPqonIIEm
 Tstw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHyN8mDiSBilECLbPU7SzrairCasego+K+ORkGl5Z4e3K4INKg/oT6QOHjbLJErU95kshYwq0z8HQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5EKh7Wx8yWfvSdUfL96Q0aRqjKjJP914jezVhT5mU5Nvgan2h
 aTOySROJiwHYfuXP+liMN2IZrpfwMxXGkTZ/YDnL9moxb4crfeKslo0L
X-Gm-Gg: ASbGncvysnmGVHyAcGdJw6Lt3Ts5whOElnLJRC0jSrdqwh53jMBfYyX8AJXizg6KttN
 rS0qQWq5BTjNmmyhWTsvOckBiEf90cPpwLCzmoryelUEGDHamhIr4V3nfMa+ACTjuZ1vM5u5AVx
 VjC8XSFaUw0NhTTxzBNBaJNi5G2zSpmtdOS3ns3DxYo86RX+jFQvSuKMSNl2MO6XfA91FQ7RAP9
 nbBCA7ACZETvvv4WhWJ6uM4zLGOqOI4SYiQEuIUdAtC23rWJuJALyGSSlOufdxbOoarcCG6/j7T
 3mbk8GdTBwOgcwoNtdNwVLyU4BQXDo8PWajfUOtmileWuYp2P1kXKpMNPpLOetml1dxefwNTY48
 Luo5FiJulmIOXhaT+dvCv7Plm88+Ta0Dk1HbqAli0mKvxpeimEQXRHC8hh1ohLTLFbA5EL8Mt7u
 w6CTfsp2xRsA==
X-Google-Smtp-Source: AGHT+IGaSqCXmkCvWntJfdqwVvWglhlmjBWBo1jmfj47qk487u4brk9LesJPyS4nP34oL129zDzRrg==
X-Received: by 2002:a05:6a20:7f83:b0:262:6310:3fd4 with SMTP id
 adf61e73a8af0-266f2877e86mr4416762637.22.1758056919730; 
 Tue, 16 Sep 2025 14:08:39 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7760793b65dsm16607420b3a.9.2025.09.16.14.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 14:08:39 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] drm/panthor: improve error handling for
 mmu_hw_flush_caches
Date: Tue, 16 Sep 2025 14:08:21 -0700
Message-ID: <20250916210823.4033529-9-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250916210823.4033529-1-olvaffe@gmail.com>
References: <20250916210823.4033529-1-olvaffe@gmail.com>
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

Bail when the first mmu_hw_wait_ready call fails. Be sure to unlock the
region when panthor_gpu_flush_caches fails.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index c223e3fadf92e..436a54e30a36d 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -653,16 +653,16 @@ static int mmu_hw_flush_caches(struct panthor_device *ptdev, int as_nr, u64 iova
 	 */
 
 	ret = mmu_hw_wait_ready(ptdev, as_nr);
-	if (!ret)
-		mmu_hw_cmd_lock(ptdev, as_nr, iova, size);
+	if (ret)
+		return ret;
+
+	mmu_hw_cmd_lock(ptdev, as_nr, iova, size);
 
 	ret = mmu_hw_wait_ready(ptdev, as_nr);
 	if (ret)
 		return ret;
 
 	ret = panthor_gpu_flush_caches(ptdev, l2_flush_op, lsc_flush_op, 0);
-	if (ret)
-		return ret;
 
 	/*
 	 * Explicitly unlock the region as the AS is not unlocked automatically
@@ -671,7 +671,7 @@ static int mmu_hw_flush_caches(struct panthor_device *ptdev, int as_nr, u64 iova
 	 */
 	mmu_hw_cmd_unlock(ptdev, as_nr);
 
-	return 0;
+	return ret;
 }
 
 static int mmu_hw_do_operation(struct panthor_vm *vm,
-- 
2.51.0.384.g4c02a37b29-goog

