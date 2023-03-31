Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93256D2694
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 19:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE5410E220;
	Fri, 31 Mar 2023 17:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38D910E216
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 17:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680283470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+275kAcImYiE9dFTXdrtG3cpkttX7JRc/BM6QuCRJUs=;
 b=HP84b0gOi0L4KWyIvSFCe6hA3SgC0dqyypRi4twVv4FtJN+B9lYPeU9qfSiZFTwFMB+sHK
 FXgo2XhIFRI6RlmUHfi6c2Xy+guTe4Q/LUBxRQqJxtKjogoEEuXuOlQznD9IU6a47bo+AG
 cHtMXYb2acb3AJEIUFdITNE7xpRygJw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-PTTKF5z3PkmMSjE3W-uSuw-1; Fri, 31 Mar 2023 13:24:28 -0400
X-MC-Unique: PTTKF5z3PkmMSjE3W-uSuw-1
Received: by mail-qt1-f197.google.com with SMTP id
 r4-20020ac867c4000000b003bfefb6dd58so15157257qtp.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 10:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680283467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+275kAcImYiE9dFTXdrtG3cpkttX7JRc/BM6QuCRJUs=;
 b=PWktLXbSwX8jeGbzvfrvB4sJSA3aiacvqlhUttHypEw9ln1ZWsaTyLvgfLZXrx/zjh
 SkPv4qluwdAzw7C+md7K5j1qZlCyUz4xvw2v7XKUyIFD+HPyoimtM11tCPivWxPeUEZ+
 cjL7sOzZCCyKTYtYU3Euxjv6Jk8Zg1Ja4CEjjFhLOejU3FO/d8wMQEv3MCYadHii3h17
 rZtNeCkibCBX4xUTCJTqQpaOJJMBGI/vOtY+boK0ty0UdBn+3/E2q8QAGZitjOm0u0lk
 L0ZY9j2cAPQc0+o54g/SKCOeX9PrdEuxBibSLjaHxqEjD4J1KaiVz85NGVUNVvm8ZVY+
 ChSg==
X-Gm-Message-State: AO0yUKU0PVECvJEFIlEEQabHyUvaX0fGkdGacViC8Sw8HZPlEqya3xbj
 bJTjniAjGQ2KUe0G3VivqC5wkbsnScdCzY/Jddrmy9+eJPI9Bs8JtwMttw3+Op84/VkPwtzC0UV
 dQPPjPaKtOzBbzAWpn/uOXmcpGmUp
X-Received: by 2002:a05:622a:215:b0:3e3:867e:1811 with SMTP id
 b21-20020a05622a021500b003e3867e1811mr50922124qtx.17.1680283467399; 
 Fri, 31 Mar 2023 10:24:27 -0700 (PDT)
X-Google-Smtp-Source: AK7set9Sv9pA4EKixyjGPgkC70YS7QWxatBhiN9or/3O6SwY+f275wnQJfX5KnQMa83+KWSsgCh25Q==
X-Received: by 2002:a05:622a:215:b0:3e3:867e:1811 with SMTP id
 b21-20020a05622a021500b003e3867e1811mr50922089qtx.17.1680283467204; 
 Fri, 31 Mar 2023 10:24:27 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 b17-20020ae9eb11000000b00745c437b38dsm804613qkg.82.2023.03.31.10.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 10:24:26 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: airlied@redhat.com, kraxel@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 nathan@kernel.org, ndesaulniers@google.com
Subject: [PATCH] drm/qxl: remove unused num_relocs variable
Date: Fri, 31 Mar 2023 13:24:23 -0400
Message-Id: <20230331172423.1860083-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang with W=1 reports
drivers/gpu/drm/qxl/qxl_ioctl.c:149:14: error: variable
  'num_relocs' set but not used [-Werror,-Wunused-but-set-variable]
        int i, ret, num_relocs;
                    ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_ioctl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index 30f58b21372a..3422206d59d4 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -146,7 +146,7 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	struct qxl_release *release;
 	struct qxl_bo *cmd_bo;
 	void *fb_cmd;
-	int i, ret, num_relocs;
+	int i, ret;
 	int unwritten;
 
 	switch (cmd->type) {
@@ -201,7 +201,6 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	}
 
 	/* fill out reloc info structs */
-	num_relocs = 0;
 	for (i = 0; i < cmd->relocs_num; ++i) {
 		struct drm_qxl_reloc reloc;
 		struct drm_qxl_reloc __user *u = u64_to_user_ptr(cmd->relocs);
@@ -231,7 +230,6 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 			reloc_info[i].dst_bo = cmd_bo;
 			reloc_info[i].dst_offset = reloc.dst_offset + release->release_offset;
 		}
-		num_relocs++;
 
 		/* reserve and validate the reloc dst bo */
 		if (reloc.reloc_type == QXL_RELOC_TYPE_BO || reloc.src_handle) {
-- 
2.27.0

