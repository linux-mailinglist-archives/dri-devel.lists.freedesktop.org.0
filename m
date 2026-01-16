Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3039D38910
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 23:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6108B10E10B;
	Fri, 16 Jan 2026 22:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="0mt1bQ8c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA3910E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 22:03:44 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8c6a234f094so234905885a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 14:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1768601023;
 x=1769205823; darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5M0Ng+pZptYcw9h8uct7tGui2w4pAnLMVXabDgI43YA=;
 b=0mt1bQ8c7zpugQDUYnf+lhcS4wp9bP+gHaRIinIwG/S8FWFkiOk3YjYOmUVeDD16cp
 UtrGJn4RTFEZBBXn7uxnNj9MuVgniBEIB+TyeZypn0L2nTxgVzc1RCFb4gAI7wRwsMIg
 MvBjOZRuo6gzyByn1HF1EUPuoDghasseAGv4FfUxmoCCCyQhxAZKxGL2yANJYaiERqDA
 XcuASNnlRyq26fKh2EWhLfvW3ZNkeeQsDJ8EFG44lsd3o28wvSjhBCq5M4tJ6E+9iEf0
 kP8ElTREt5pmVPV/ir/RqPFtkxcopm/qpGj9K8yMYxA9TEKWfTCaP96PVy1W1MN5UbMe
 fH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768601023; x=1769205823;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5M0Ng+pZptYcw9h8uct7tGui2w4pAnLMVXabDgI43YA=;
 b=GJLtX3GnK81C9YPr1nb6bhLuQuArYlnTKa5HBQBT/h5ooPgF6CijK0dQ0r7UvK2WxV
 90NpcVePlnA6uXwya8Usz8KDqQ2Bbx5S7qrsjIE7UQy7OKSOsPF1wljwtpxQr5sZ33nu
 Mi7lY6O+/Ozb7xKaWOKpQSOLHGMjYuHwdVJvjOzRMDSAv0PT6NCLAwrcaJJSdlSxOB2u
 jqQQQWt60n5rtHqCpWcrYZ9Kr2XHMSdA034lCMYS+kHGluP8khC5PmKB9KAJwWX8nldQ
 D07G+gZzp+AZwZ+oCpH7IS3kZ6wby0E8KxeN11l+2UIqPoPNtvjlN843/bKHgA1s8tP7
 pI2g==
X-Gm-Message-State: AOJu0Ywf5FlG1jvnxGuNgFwwZSERy4Q3b/TOrzh2sKYIYtpuePs9ofrC
 NfF2fLXwssdh4HZmtdjXPuerJBSdHaymiZIIHOXQO813l6N1bmTRhmJO7kk+4m9+ej4=
X-Gm-Gg: AY/fxX7MYHdMO8pmTsmvTynCZTVu5FASfWyFX+inlw3ffL4PDFrc7ODVN1RLbd7jwHF
 T8NvYLzdf59mBNaY/dIGOIcpoVCA9/rK3Tz3ebQ3XHGpyCr9O5MwLZbEibjqlp7IxNjVZWkXFGs
 Xg6FurI2QtaRk14C7EFdV+l7BMpNxNiLlgPs81N3OLUuIvOZHHf8JZcFT3rjRU1BnM3Z6y9I1dt
 Kzvztd0UOtbz9s0w1G0FhFBpDdGTlFQJzDHGD6IGNiSudlmDgy8XXeNAWT+heJ0fJ5LXUtRkPlZ
 Eyu0GmBtMt9RvSNiD6RmpxhTjxgNbeI/OHzehVSACRxMmZB1M04/Ki1jjEI1+UKWEt+JbcjVEyY
 9yNQXp8foUOobhQsmL2ztkiS30TpZWlkbwriOxbLjVM9n+4QGqRZzt5jYTfBKtQp4uVlDjpTBH1
 Fbf96GtLKpFPXY/zZngbCc4KKKF21mYYwK1gw5lEvjQWRnk5t3ErbAE9ikrP4PJrgf7QsbQN/xx
 ujm2g==
X-Received: by 2002:a05:620a:4609:b0:8b2:db27:4268 with SMTP id
 af79cd13be357-8c6a6768552mr556329085a.53.1768601023402; 
 Fri, 16 Jan 2026 14:03:43 -0800 (PST)
Received: from [162.83.196.141] (pool-162-83-196-141.nycmny.fios.verizon.net.
 [162.83.196.141]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab20dsm320798585a.5.2026.01.16.14.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 14:03:43 -0800 (PST)
From: Mel Henning <mhenning@darkrefraction.com>
Date: Fri, 16 Jan 2026 17:03:27 -0500
Subject: [PATCH] nouveau: Stop advertising large page support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-disable_large_page-v1-1-fdbf85603353@darkrefraction.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAMAzAvjJ6VrBzevArIlJdnQXRsYEIsr9bP
 AaSvJA5CWcYzAuJb8lynQpYGVh3OgPX4pXBNrZvEPvaS6bl4PmgFHiOpIYjQtda5zryoGFMvMn
 zT8eplA/KLGQyZAAAAA==
X-Change-ID: 20260116-disable_large_page-4aa1432445ad
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>, 
 Mary Guillemard <mary@mary.zone>, James Jones <jajones@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mel Henning <mhenning@darkrefraction.com>
X-Mailer: b4 0.14.3
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

Since large pages landed, we've discovered a hard-to-debug issue related
to 64 kB pages. Disable it for now.

Fixes: 85ce566b3624 ("drm/nouveau/drm: Bump the driver version to 1.4.1 to report new features")
Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 0e409414f44d..5b931260ce40 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -10,7 +10,7 @@
 
 #define DRIVER_MAJOR		1
 #define DRIVER_MINOR		4
-#define DRIVER_PATCHLEVEL	1
+#define DRIVER_PATCHLEVEL	0
 
 /*
  * 1.1.1:
@@ -37,6 +37,8 @@
  *      - implemented limited ABI16/NVIF interop
  * 1.4.1:
  *      - add variable page sizes and compression for Turing+
+ *        Note: Rolled back due to issues with large page support
+ *        see https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610
  */
 
 #include <linux/notifier.h>

---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260116-disable_large_page-4aa1432445ad

Best regards,
-- 
Mel Henning <mhenning@darkrefraction.com>

