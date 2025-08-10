Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A7BB1FAA4
	for <lists+dri-devel@lfdr.de>; Sun, 10 Aug 2025 17:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C7E10E068;
	Sun, 10 Aug 2025 15:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A7m3M8a+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E1510E068
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:07:11 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-458bc3ce3beso21178155e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754838429; x=1755443229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZQ59xHtOgWbEJc4IF9smzu3yNmmI1a87WpQPWKQVfHs=;
 b=A7m3M8a+tUnDdnxajvLHQRVevbEA4LTTGLAACs7T6UfQ7Fh7pTexhVGQHizCedjNVx
 mglU/KcEyV+3n+vUKzBepzUqplm2bFiM3Yj75PabJq8rGqAVv0ocIFps9Q5vaackCBTa
 kuyx/JbRZkMy9cGfv+4nKljcvsHdtGpb54AnhVn3yc0HlNP6OuCgXqs++DD4B+qvcxJM
 +yWwJxND7ND1wdoub8DSjZOwQCN7wj+COKGTPKMRG2yKxV9aoBf1HODd8LM1MWjXQXQz
 4HaG3z3E5Krb00TEyEasNRp84G9f+xYPkSgiCtNZKK8Qev0Fnvfv/aQ3/0G9Ed1XjSW1
 9qMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754838429; x=1755443229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZQ59xHtOgWbEJc4IF9smzu3yNmmI1a87WpQPWKQVfHs=;
 b=Gwzzh6+pKdM2AW3OpxV542Ko1Vi2JdkdeKm3tNLSWiXfavYq0AiNDnQfSmcM/yQUQU
 izkloKenN8My6WBUTfcmiGBWA+6Up1gu94b++qeABiUrm6wnC5JKUteUZnQe2V8iMQ/B
 IhUU0f4pV/Fh4hhPS0BQLZsOg/SyUN9FcbAqMqfS8omQMu1T90NUpse7+UrD2l7IBqkv
 4NglS4ZSYxjXMvFqpJR03tqKT+HAh1VKnIHy+l9UZyrHkIyEz3DG5TQ6wvPw876IVFJN
 me5qTCIzxlTOWnuXvJRm6f0QmUhL+O/D4EYtyCR6EF7hLRyTQEeRhbcWeoVRLH2I+pOZ
 CThg==
X-Gm-Message-State: AOJu0YyJuXoMFtWtFtgX+5Qe6jOGYd1yUai+JrAGIkZ83G6dq1nD7t/U
 dMY6ynhBIUlncz5Gp56lWyiV5yWHKouAQOHGWF6luNdih0nm9TISPXh9
X-Gm-Gg: ASbGncuBL/hP5HyoNUv4vhALVveQKMqbZtIk/BLAZ+p37Cl5Z5zGp1lRRpvo4cl95xj
 vX/2lhml/XNG0CDNS6+jheXb61QB0/vifWPWxrigD+B9QFzqQFRoUpeQiHnf5yX8f69l+r7KlxC
 4Q9R92avLwYkq3k26QeAC1oLOnX9gJPdsZaHhzSZUn6GSaLANg54P0ghnIuKaSNoaLAC+LguU9c
 uAqu8AsBjGq7q7nitIeOfBjNqc2vxTyZ/3s+v2qp0E8embmhidmloHXO1gjYUfszwaFdU1rPwR9
 0YkogR83Ca1bm1MICXSCtL7wZydzCnjk26CDSFOSzAtMllPR/cH+3GQc6n2xmsfelvCLEFiw6Bb
 zcitj4TjuGrK0UwG1hV1JD/IPzsXdzpN0g1YmFhoFLpnAtxmYO1+pA2AkElPKx0vN+ch4PsQJ
X-Google-Smtp-Source: AGHT+IGnsEOHPXBo/gu/b3QC4R5+Wjtv9EVFuqU+/OTZ1FCVewLf4z2r7z+BM9J6nhmv/NU272ooIw==
X-Received: by 2002:a5d:64c3:0:b0:3b7:974d:5359 with SMTP id
 ffacd0b85a97d-3b900b50441mr8668873f8f.32.1754838429143; 
 Sun, 10 Aug 2025 08:07:09 -0700 (PDT)
Received: from localhost.localdomain (109.red-88-1-15.dynamicip.rima-tde.net.
 [88.1.15.109]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8f5d7deaasm16567371f8f.65.2025.08.10.08.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 08:07:08 -0700 (PDT)
From: Javier Garcia <rampxxxx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dakr@kernel.org,
 robin.clark@oss.qualcomm.com, antomani103@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, me@brighamcampbell.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH v3] drm: Add directive to format code in comment
Date: Sun, 10 Aug 2025 17:07:06 +0200
Message-ID: <20250810150706.305040-1-rampxxxx@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <DBYS3FAEVMHC.178SXO45NIBI8@kernel.org>
References: <DBYS3FAEVMHC.178SXO45NIBI8@kernel.org>
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

Add formating directive line in function `drm_gpuvm_sm_map_exec_lock()`
comment to clear warning messages shown bellow that appears generating
documentation `make htmldocs`.

  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2444: Unexpected indentation.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2446: Block quote ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2450: Definition list ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2451: Definition list ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2455: Unexpected indentation.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2456: Definition list ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2457: Definition list ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2458: Definition list ends without a blank line; unexpected unindent.

Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")
Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
v2 -> v3:
      * Added the proper imperative message.
      * Fixes tag possition.
      * v2 https://lore.kernel.org/lkml/20250810112218.293272-1-rampxxxx@gmail.com

v1 -> v2:
      * Added the proper Fixes tag.
      * v1 https://lore.kernel.org/lkml/20250804212902.22554-1-rampxxxx@gmail.com
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
2.50.1

