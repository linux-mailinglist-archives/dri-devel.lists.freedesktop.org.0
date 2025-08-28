Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2A6B3AB3C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 22:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3711E10EAB5;
	Thu, 28 Aug 2025 20:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FO675aEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E959C10EAB5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 20:04:31 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7722bcb989aso55729b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 13:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756411471; x=1757016271; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=QgBwgze5c2UdQqNkQjeB0hL6toTqJXIIsEOJ6SdZPhA=;
 b=FO675aEmU5+pjnx7AEaRBX7PD40519CbGa3UcYUoZhHWNyPkXS3BAG8bV4k2r4+PJP
 TXw4RdG03wAyM+QZ9d9Vch581+OFN8XN6GefzuzgLAjIp7bd/oCIXaznNFVfSci8U700
 /6zLxenp7nqednsceK/eH0gmVCZ0VQme+pKUWZpxP9FBHxSyYg84lhlf4aHEjPGHFM02
 SFXA9fymct1YObYZPr3JVVUbsCIpp5knqqLQPZGnvMFQQOJf3t4oshVDEus/ad20HHWA
 gpy1pqVnMBAQUanP/UTM9Jo9YNDiJZ/BjY2w8lR91UAxgWnw1CsEGmOHrEQMxz7u5M9p
 C/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756411471; x=1757016271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QgBwgze5c2UdQqNkQjeB0hL6toTqJXIIsEOJ6SdZPhA=;
 b=AeCleEuvWrin1rDg2S64M1/FrYj44AtRtmYC7lJB36RxDdHJuTucmVN1KSK4CcaqLI
 qp9qWGlOzcxXFyi5Otb3pP1csfzWPfPu8XWGkejLF9KYVRAdx+58rpajI/d8AVxvQSAL
 aul7+yzTww3yug4KXiHyfA3CZ629+4zxUy3u3TGiN5h4H2EdsFqRhBLcu4vG8kDzxTHv
 vgePNGFhmkAZnRj5Z1M7P51g7JfxHNou8rbaWZbCBu5+jk2m+ecvGF6LoMpor2gRvx99
 mITO27R2yEMuxX5jft44f1CgvknarLKs5iq6nHJghMaK7kqULRoYJuD8q4qbH5lfMCxY
 OadA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3WewbSKIMwpIdH6KH4BwnhM17zs/bdG68iSoMC6K7qzWCvfbR43hja/WLAD66KDc30oWz5Fw/AW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkRThAdCXj3LlaVuYdGbtf+nGdRb663z/ddYw9HNj0AKJTXUKT
 /A1t0A6xyfNU5kzmbTeSsqIxeT+KP5X8+I2lTenEhOmQPpCLQdHRBg5pGLn1xxaL
X-Gm-Gg: ASbGncsb16jEusRMDE178OnpSMkr+r4BwObY5fF8A91G/4da1Iak64WRM44luy9nC+e
 pX/d1PahSgWu4Nu67mnuj66Tb8B1T/U7SLsJ4cVWRHVgb50VwmfdjXJXB1Vjh2Zq//dJym0w8MN
 LMslCUlBNMrPYwCzZqlp4tr7qyQ5WVnw/eqV6840D0gTm+8jmaGXF6huJrwtHLMcwGaqdSpJa7T
 N6tmKZUPTJ1krYJoi+Y7X/s6IY2Ez6JMaqa62PTIlCH1j5Wx39/9r/Xo4tudcgTRpy6R77XKwe2
 2+Vk56lOuCA9EL5/7naBGELKIkHXBzAZwo6+cGl7tVdVyDiYAfjQYojMggYYtCXS0/LugDVpDSP
 MBwxg+bPEIPL5Z2CRVB0HT2bssqkvibBKJ7y5Z0yUbeZ3W4sGgkAVYw==
X-Google-Smtp-Source: AGHT+IGmTwpUPPdaVGSqeg327GXXw0GgBhct6VPdgjMR7zW8CaSu9AGMI3nYDEAA9IljAAh/s23DZQ==
X-Received: by 2002:a05:6a00:18a9:b0:772:553:934b with SMTP id
 d2e1a72fcca58-77205539ac5mr10186281b3a.31.1756411471335; 
 Thu, 28 Aug 2025 13:04:31 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7722a2b8097sm289868b3a.35.2025.08.28.13.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 13:04:30 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panthor: always set fence errors on CS_FAULT
Date: Thu, 28 Aug 2025 13:04:19 -0700
Message-ID: <20250828200419.3533393-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
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

It is unclear why fence errors were set only for CS_INHERIT_FAULT.
Downstream driver also does not treat CS_INHERIT_FAULT specially.
Remove the check.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

---
v2: add rb from Boris
---
 drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index ba5dc3e443d9c..231f42c67f175 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1412,7 +1412,7 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
 	fault = cs_iface->output->fault;
 	info = cs_iface->output->fault_info;
 
-	if (queue && CS_EXCEPTION_TYPE(fault) == DRM_PANTHOR_EXCEPTION_CS_INHERIT_FAULT) {
+	if (queue) {
 		u64 cs_extract = queue->iface.output->extract;
 		struct panthor_job *job;
 
-- 
2.51.0.318.gd7df087d1a-goog

