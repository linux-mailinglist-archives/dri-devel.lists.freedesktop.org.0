Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC54F1A2C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 22:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505DB10E201;
	Mon,  4 Apr 2022 20:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C11210E201
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 20:45:42 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id b189so8711027qkf.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 13:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kdh17ejxHsJc2dfThrP8Nz0lVDH043VELHVGaPYip1U=;
 b=J1608qFL/qkEqjJVixd7h2gRyxj3a4v8/E+7ecvAv2nsiOCE5vxYrXBpZqxgWwhFM4
 gAwEHZq83FQd1uip7Q+TizfmZT8APLxcjFm9JoZ3j+DdvMDDGlVfnV3koeym3HdvwG9M
 492J5ik5pmBJkHh6bBKx4e50PogYpGjhIKCU9XUfJLkd+uQ+TWEabLXrV+oo403tTcQh
 X8zR87Fz4f8ZucabV3kv2IpDknFUdsGSxIuj9ZtU2Im104cBJFJdEQgh+azikwy1jgCB
 DU4kTmBN8uFf6UPW+BPDQlREiZqVGwBHckOllGCbZ57/7I7wNlZdABRa0aLxqMxczCHM
 4C1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kdh17ejxHsJc2dfThrP8Nz0lVDH043VELHVGaPYip1U=;
 b=q2B7gcrz7YBwHAZmE4OIavz+w+FCJR+Lyroo+4Ef1KB9+mT+Ey4KIwj2R1P8NK35yV
 HTlHV9d3Wa56talSCro4ftdrILgkRiWzLsIgADV4a1dcEzsTZEHrq2QNVSZSuzXLYJqH
 +7FvlrYyrv9Da619/VXipZjB3V1qoSajXf4HCBwvVNGw/TRxhAZQJYCd9PGzKnLwkPpY
 qKZPyHHC7brhbsodzXb1uSlI8zXo3YDloBOaP35KqP8fHgbjV2Zuv8jwg1nhzb3AUorH
 EtspUEL31tKz/yt9yN5XghsltTeNclUw+g9jBsO4/ejS11ZUE4jg+7uZDXfFzn2Sj7X/
 I0Tw==
X-Gm-Message-State: AOAM533J8n9fcdO3xlcz6jnAKvSI+i4hGhKq2n/0Lnm7OjZC4eb65NIs
 stNeLzTtNvmuOt9d9Zmwl+s=
X-Google-Smtp-Source: ABdhPJxrs7T718KvR8wwg53WOpNUpliIIogbkW1tshShgBpn/sOvnvIbU5atOO8Q8G1nYIeVYe2T0w==
X-Received: by 2002:a05:620a:4445:b0:67e:aaab:837e with SMTP id
 w5-20020a05620a444500b0067eaaab837emr49335qkp.403.1649105141469; 
 Mon, 04 Apr 2022 13:45:41 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:7cc:26a1:e446:de76:c0b8])
 by smtp.googlemail.com with ESMTPSA id
 m10-20020a05622a054a00b002eb965bbc3esm9630548qtx.93.2022.04.04.13.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 13:45:41 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v5 1/9] drm: vkms: Alloc the compose frame using vzalloc
Date: Mon,  4 Apr 2022 17:45:07 -0300
Message-Id: <20220404204515.42144-2-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404204515.42144-1-igormtorrente@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 tales.aparecida@gmail.com, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the memory to the composition frame is being allocated using
the kzmalloc. This comes with the limitation of maximum size of one
page size(which in the x86_64 is 4Kb and 4MB for default and hugepage
respectively).

Somes test of igt (e.g. kms_plane@pixel-format) uses more than 4MB when
testing some pixel formats like ARGB16161616 and the following error were
showing up when running kms_plane@plane-panning-bottom-right*:

[drm:vkms_composer_worker [vkms]] *ERROR* Cannot allocate memory for
output frame.

This problem is addessed by allocating the memory using kvzalloc that
circunvents this limitation.

V5: Improve the commit message and drop the debugging issues in VKMS
TO-DO(Melissa Wen).

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 Documentation/gpu/vkms.rst           | 6 ------
 drivers/gpu/drm/vkms/vkms_composer.c | 6 +++---
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 9c873c3912cc..973e2d43108b 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -102,12 +102,6 @@ Debugging:
 
 - kms_plane: some test cases are failing due to timeout on capturing CRC;
 
-- kms_flip: when running test cases in sequence, some successful individual
-  test cases are failing randomly; when individually, some successful test
-  cases display in the log the following error::
-
-  [drm:vkms_prepare_fb [vkms]] ERROR vmap failed: -4
-
 Virtual hardware (vblank-less) mode:
 
 - VKMS already has support for vblanks simulated via hrtimers, which can be
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 9e8204be9a14..82f79e508f81 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -180,7 +180,7 @@ static int compose_active_planes(void **vaddr_out,
 	int i;
 
 	if (!*vaddr_out) {
-		*vaddr_out = kzalloc(gem_obj->size, GFP_KERNEL);
+		*vaddr_out = kvzalloc(gem_obj->size, GFP_KERNEL);
 		if (!*vaddr_out) {
 			DRM_ERROR("Cannot allocate memory for output frame.");
 			return -ENOMEM;
@@ -263,7 +263,7 @@ void vkms_composer_worker(struct work_struct *work)
 				    crtc_state);
 	if (ret) {
 		if (ret == -EINVAL && !wb_pending)
-			kfree(vaddr_out);
+			kvfree(vaddr_out);
 		return;
 	}
 
@@ -275,7 +275,7 @@ void vkms_composer_worker(struct work_struct *work)
 		crtc_state->wb_pending = false;
 		spin_unlock_irq(&out->composer_lock);
 	} else {
-		kfree(vaddr_out);
+		kvfree(vaddr_out);
 	}
 
 	/*
-- 
2.30.2

