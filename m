Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2036B8738F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 00:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBFD10E1F4;
	Thu, 18 Sep 2025 22:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YrG0zsHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F0910E903
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 21:40:24 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-244580523a0so16011575ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 14:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758231624; x=1758836424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FY/UIVe6WB2OBHvS0d9qglXhX1VI6k9qSnUpiXPDN7I=;
 b=YrG0zsHNgu21Xrd5Ya9WraHhMAI1iEz2fDtYqA7XsphhWrGnjw+1G1IcyMTr6J8ZBe
 vKlOkHJm6DK3tWX6dlDtjiUHtHcBpF8x1TKMDZ9SU/0NIyEZM/1o6fXKARR+RH4kEtpg
 2KY1sp5B2Lyiopn3ILJzbJuaAtS6ImcGnpSRjX67gAXqIT8RLbaqajJmUvG80a7wZZLM
 e1cGZVLutY1j8QnkYRg6owJfh44DI0WVY4g4W8xKOUyLHMJMymitDJCNDyTE28BJewPO
 eukoT4eoH+0nUa08OrmlzP+wGLciwB+TOmmoh5UiM5xytB7uNgd6SZJzsKEg073Ig4J6
 xV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758231624; x=1758836424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FY/UIVe6WB2OBHvS0d9qglXhX1VI6k9qSnUpiXPDN7I=;
 b=TIPt1KnARfE836uH8ZKe/z8xA3zMI9/VQmGXIX2s1MEMLKT1MYwEbIh5DDyJL/F+RU
 5W7OtbKRDqVRlwNlIL23ePmEI+bfwm+Z4tZzn1Hi71oG4ZauWGKuBNMPEc8shv2+DscQ
 Z1ID2WHw0UY0dJspxvx40zmYen8FBHYYl8WovTw4R7uIdkHouDORRF5D1HEEu+bKh3k6
 e848zUfgG3dKsKjkgOWyFK1XqJPn/VJLfgiP2+blAu7l/nrqbYO3G61DSArNBwhycheB
 wVyQ1fxBYpIE8yCE7xjhtekilcGom7ffjcwjGtIrFYmWjmA0jK1CWR8WZZGvQo43OIB9
 wQXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoqgts7fdz9Cq7Lqnv8/dfid7cFsPL4eS9VlPQbitACkpHXCtAB5dQdOpntfz0Efk2sxBqXge/LBw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvnD7irMewiiFkPHJKpr2HV80VJCMeqLmv4TLtOEKYvHtMVmB7
 u3/dwxsCm0lqIESevUjMwzhESXCrP1APLESvomxrQFWRtN6pJoTVI1K8
X-Gm-Gg: ASbGncs2rFbsdbeEfG11+jFdjQjuzSh3jNQEiaKbHzXUKn2/r7UUALf/xRs0zk6b0DQ
 qWgQIMWJ2zkfRS+zOz5TR3P8IR2LrCAerc01r60eEBawapqCqu9ZEQTcx/AWToWDIQIHi7HS+Ki
 pZRuvnoGZO3td77rXMEuUhwUO3ab1chKJWgEvfqnWJN5uWdbHhU/b4Y0VmjlpdeeOSxt5YqjF4t
 6CA9mpB8cXqpT5qWaD2yvpOhTBoTTzcadTEjzwDiTLyPZF5ksUy2yNitmlS5wnROv3ey/qFXCWZ
 /193aqxQ814GjPj49tkculvhGPiIO3aU4oJkteATnxkHUy1QJg+sDcQJPhixDjP67qTJTKqwUvb
 McR0HupDsd3V7+xhJY9QUQiPnI8QkTylzPqBWrvB/4Gs=
X-Google-Smtp-Source: AGHT+IERGEjhAusY3sbIz/Tcg2o25PudFYZaWmhe/vEZMGYcHhx9VVNVJNdQglQZbTOy1gyNMcoHSA==
X-Received: by 2002:a17:903:144e:b0:260:b4c7:986d with SMTP id
 d9443c01a7336-269ba513a36mr12857245ad.36.1758231624114; 
 Thu, 18 Sep 2025 14:40:24 -0700 (PDT)
Received: from archlinux ([36.255.84.63]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269800531e8sm35706655ad.29.2025.09.18.14.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 14:40:23 -0700 (PDT)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] drm/fb: replace strctpy() with strscpy() for fb->comm
Date: Fri, 19 Sep 2025 03:10:08 +0530
Message-ID: <20250918214008.585920-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 18 Sep 2025 22:25:18 +0000
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

Use strscpy() instead of strcpy() to copy "[fbcon]" into fb->comm.
This prevents possible buffer overflows and ensures proper NUL
termination.

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 11a5b60cb9ce..0cd7c3280243 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1651,7 +1651,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 	if (ret < 0)
 		return ret;
 
-	strcpy(fb_helper->fb->comm, "[fbcon]");
+	strscpy(fb_helper->fb->comm, "[fbcon]", sizeof(fb_helper->fb->comm));
 
 	info = fb_helper->info;
 
-- 
2.51.0

