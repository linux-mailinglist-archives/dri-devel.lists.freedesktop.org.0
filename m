Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12FF3A9580
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 11:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B244D6E558;
	Wed, 16 Jun 2021 09:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F02E6E544
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 09:04:05 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id nd37so2691556ejc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 02:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JYuIIbXfwqTKRHCtxi7am5Rqgi3VUZZ18KA/nS6CXaI=;
 b=fU2MgphJmbJAsONz/6XivWvOf9c+EyQJDZnDjzCwdMvAaKL0P9EEpmC00iL6MRs9SI
 w43VjdICer3hRmvqGMsz8syl87ovUcojanp0TCMo3gHDA8cPtNjnrCnHF5y7PAutPMCG
 9RpXIkVf8gH5wFuRbmaGsd4JgYtaipMTcKw1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JYuIIbXfwqTKRHCtxi7am5Rqgi3VUZZ18KA/nS6CXaI=;
 b=RfQqd7EJ07ZvAehV6VmLzktvzDdOSykQJ8gLfENG9VLytZgk89NdgDrV3FxFfcXhq9
 Y2gSfOr/QhYprJipeAdojEcsFXUuduStqDoyK69Ylk5gNZ3FSokeSxFrDECoc8QzhxdZ
 RNHl83drLUwBFBGq6RCOxCY9s471pitutvgQW05ZEVUhtRQmJdg8yFdBpgRRsvzIFszy
 6pHxVjui/Hd+6hOeeEGnIAxDN7gYzBgqtpUoGVaXUPq1JvvnZBR2sTHy8IuAizKfjDQw
 piZKkZtn2V4G5FJiZ4C17aANZmFSESKy6BA6Vacj47QeSNkz8j25q3oHo8N5zbaGRhcm
 mhAQ==
X-Gm-Message-State: AOAM532epOUFgLt9CDGhBeNH504tl6tsDq6C1aFsY5hhjoqZJAwsb3vS
 WkbFowiIoDezHSx9v5030zyCb5ncHnlpAA==
X-Google-Smtp-Source: ABdhPJwgREutuAgBMvdgGoeqVFfJe0z2T2m/qt5GnFZES4zDiRlbpRv/y8tWGq3ZeCJXZYwfZiYAJw==
X-Received: by 2002:a17:906:3884:: with SMTP id
 q4mr4354554ejd.66.1623834243743; 
 Wed, 16 Jun 2021 02:04:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q16sm1246710edt.26.2021.06.16.02.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 02:04:03 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/gem: Remove duplicated call to ops->pread
Date: Wed, 16 Jun 2021 11:03:50 +0200
Message-Id: <20210616090350.828696-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Between

commit ae30af84edb5b7cc95485922e43afd909a892e1b
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Mar 23 16:50:00 2021 +0100

    drm/i915: Disable userptr pread/pwrite support.

and

commit 0049b688459b846f819b6e51c24cd0781fcfde41
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Nov 5 15:49:33 2020 +0000

    drm/i915/gem: Allow backends to override pread implementation

this accidentally landed twice.

Cc: Matthew Auld <matthew.auld@intel.com
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_gem.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 6a0a3f0e36e1..07aa80773a02 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -469,12 +469,6 @@ i915_gem_pread_ioctl(struct drm_device *dev, void *data,
 	if (ret != -ENODEV)
 		goto out;
 
-	ret = -ENODEV;
-	if (obj->ops->pread)
-		ret = obj->ops->pread(obj, args);
-	if (ret != -ENODEV)
-		goto out;
-
 	ret = i915_gem_object_wait(obj,
 				   I915_WAIT_INTERRUPTIBLE,
 				   MAX_SCHEDULE_TIMEOUT);
-- 
2.32.0.rc2

