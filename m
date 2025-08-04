Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8410EB1AB87
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 01:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C489410E5C9;
	Mon,  4 Aug 2025 23:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ErBRzOKQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DDD10E0F8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 21:29:39 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3b783ea5014so2201912f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 14:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754342978; x=1754947778; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EnAv+EkxtMe6sOgi/X80+/azh3A8nh9nT/C3VYMPy+M=;
 b=ErBRzOKQhEWztDCa+13XA8u33qHQCuFHaup7aHko63r8LOgDMkYJxDtbMqihMvZ+pX
 dK2pLnqMq3BlesJPtduY5OuD4iz8UwzqSrQHQTjAoGWuDScagm7hJKI0q7QR0dl5BXP4
 jOiCSop6C1LfTu8jZ00YJvCd4+c21F3ReL/egICCDnvuQRvOKKBSxuRY21Lv3w+BXL0n
 FNulS22oy8dt6KinVSltiBfT+LDIPFLjGi/0sO2F9Eeg+oHT75uk9eXmlphACVwrOAFZ
 MZAOR7Lr8rjsyogDYJioVdpgQ2Guu0plS7P5UjSTw+9ABBsmObye1BrbsolIiiNLgoLu
 skfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754342978; x=1754947778;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EnAv+EkxtMe6sOgi/X80+/azh3A8nh9nT/C3VYMPy+M=;
 b=KMrFsPHZRNRpxDVBVz+bhFxtDGpdCzVTd/WoK5y9JrMaNrsQnmQjbAyFAT0yYMUG4c
 v1ZsOBtx6sqlaWYm6BcNn0X3NLdkQohCVjwCsi2RZIdwYiiL6tlLBlCSRv82S+xS91pW
 IXZNWt0HgPrje6qnin+5oP4CbhQUqDq7jC5nuhpmhEpECu2OvuLzvDpjZwgBb5sWjm4/
 epKY0ycGDdnP0jrtU+GojeEGiunZ/YWIjSREHLi16aSSi+2QJ4Rtx5hJ125LOe2KxdUP
 KdaIOjgJKtnK++I0GHvQQ8qJL8GCcOWk8tHLBQE36jpC8CY9dbEXdaxZ/6+CPfEGyvRQ
 Xjug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYWjkh2/tYukRJ8jJ6LniSK4epSlfSYhutQ+2gVeABL0I0DICSDroFLXPOU2RWrm8cLt1yC8sXKDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD2YQLxF0XosJbRAVBkzoCm0IN/peE0L9D/mALM+Lrz0Q0q9to
 JVD+RMboP2GvfqIdhMoH8A5yZLolf7fCEg4S8ll1TX8Avfin2tOW0jTi
X-Gm-Gg: ASbGncsfq/YRqejSAmJUgJZoMPnOb+A7Y07SGYNtxxzW2gyobV4gavljMWFS0eafTVp
 KFGCSwhXEfIukGQM5WfGArRXCalzN4PAOE+poFXdmKgFJNwHmwQ3RNY9aS4LdoB7lrGO5JDdKwI
 jI3eZEeyzkrcdDDzNxa7PAzbl2xCGP/lZx0u5h+C5NLnv9o3zr8PukjKTgQUStO5BkrRaKLYs3l
 rtWOyd7aakPrKwKr6KFQdcTe17H0pbvfxGKDoxT1bD4QnBrWRD5+hQb15HDD02QeKJqffeyuUv0
 qv6tYLqYEwOxdQjrLPRz/Rom2YKA7fnFhcZDL1/32yj2vGS4X8erx+lYGlzi1uQzzin+CYlw4aK
 QoWyEJ8b+s8MatNPa3jBcVhM4xQWJAxXpLDL8A/T9wH198jZyKHl331w=
X-Google-Smtp-Source: AGHT+IGBConCSeAXtT5CM7S11KudJt57JA5mhifRnsIXMElN7scg3DGiRYRMN/MvwC24p4tTvJ957A==
X-Received: by 2002:a05:6000:290c:b0:3b7:97c8:da97 with SMTP id
 ffacd0b85a97d-3b8d94baa99mr8936813f8f.43.1754342978164; 
 Mon, 04 Aug 2025 14:29:38 -0700 (PDT)
Received: from fedora.. (109.red-88-1-15.dynamicip.rima-tde.net. [88.1.15.109])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac158sm17056704f8f.4.2025.08.04.14.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 14:29:37 -0700 (PDT)
From: Javier Garcia <rampxxxx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: Javier Garcia <rampxxxx@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Add directive to format code in comment
Date: Mon,  4 Aug 2025 23:29:02 +0200
Message-Id: <20250804212902.22554-1-rampxxxx@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 Aug 2025 23:43:20 +0000
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

Fixes the warnings:

  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2444: Unexpected indentation.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2446: Block quote ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2450: Definition list ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2451: Definition list ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2455: Unexpected indentation.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2456: Definition list ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2457: Definition list ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2458: Definition list ends without a blank line; unexpected unindent.

Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..74d949995a72 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2432,6 +2432,8 @@ static const struct drm_gpuvm_ops lock_ops = {
  *
  * The expected usage is:
  *
+ * .. code-block:: c
+ *
  *    vm_bind {
  *        struct drm_exec exec;
  *
-- 
2.38.1

