Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED84C6DBC38
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 18:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5010710E15C;
	Sat,  8 Apr 2023 16:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B1510E12C
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680972630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qy6SYd3f0i8ho8eow+vyxJgxXrM08wU7g/SGD1LI0yQ=;
 b=i1Gx6z0jy16VyqEUyKRFEYmd9wPWBp0MM3rjsYHxAUbDE8suZf9FnMrA/Gtli4K6hK0w1a
 BikDCdXGiFGWXclHQK71JzLbOS5OAQ615Rlz6MlZFezFB5GkwPfwaEKpGPzBCeTaLOJJeS
 l4jOPIKBcZUR4ybc8/257vuVzVW/Uco=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-Q-8cJqOUM_qEdJDBzCGuzQ-1; Sat, 08 Apr 2023 12:50:26 -0400
X-MC-Unique: Q-8cJqOUM_qEdJDBzCGuzQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 f6-20020a0cc306000000b005a676b725a2so804709qvi.18
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Apr 2023 09:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680972626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qy6SYd3f0i8ho8eow+vyxJgxXrM08wU7g/SGD1LI0yQ=;
 b=hC/l1xPmYKcHxiengGvjre3B0awJI98vqE2CSGQCXw7NTtI7uSZM3X6RjP6ZbxrUF/
 xVlLaS9enTVeEkGItrZCfbfbWkYp6q3QeUz1mbcxNQAXilJmhkY3S7Zo/KhgHf0ysw9k
 QUCnqjWtY1B5qty3JWD9zWZYvLSrIbrI4hxq5OXCizwfObTdjrV0Ujfaz7GhMpzXhLX0
 prRr6VSA8eczf4xS7Fot6pFFWPw33hceqnLfuYYsnXSTkDAIMFef9Hu0TK3ET4V4A0K8
 6tGW+vC5jdJJ8b9yefAt8FKQ7ARI2kfmrxkoQFkTH85lrYAb4qzYOwQ+YCbfEg9O/PB3
 JWrg==
X-Gm-Message-State: AAQBX9cHWfSfDEKtF6Ewi9O+VvZyLOr0uet1ZoAqcyfrU4K/LfLF7+7B
 a3CDYYyurEqCPrxueDix2GaPHkNMn9xa8dzu4dcJoDWUlFVsj10e0w+j8Oq1eZcTQSPJyVxn8Zg
 f+LGFgq0f4Pv7Tty+OI4OieGSvoYu
X-Received: by 2002:a05:622a:15c3:b0:3e1:b06d:e9e1 with SMTP id
 d3-20020a05622a15c300b003e1b06de9e1mr3842264qty.57.1680972626213; 
 Sat, 08 Apr 2023 09:50:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350a46s9y+/itqppzPjf57cV1ZevRRKIKzqVvsO1UIrG/xBtSg7j5IKxAIQvMkkT/GV64uTG74Q==
X-Received: by 2002:a05:622a:15c3:b0:3e1:b06d:e9e1 with SMTP id
 d3-20020a05622a15c300b003e1b06de9e1mr3842236qty.57.1680972625999; 
 Sat, 08 Apr 2023 09:50:25 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 s128-20020a372c86000000b0074688c36facsm2113865qkh.56.2023.04.08.09.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 09:50:25 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: airlied@redhat.com, kraxel@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 nathan@kernel.org, ndesaulniers@google.com
Subject: [PATCH] drm/qxl: remove variable count
Date: Sat,  8 Apr 2023 12:50:23 -0400
Message-Id: <20230408165023.2706235-1-trix@redhat.com>
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
drivers/gpu/drm/qxl/qxl_cmd.c:424:6: error: variable
  'count' set but not used [-Werror,-Wunused-but-set-variable]
        int count = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_cmd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index 281edab518cd..d6ea01f3797b 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -421,7 +421,6 @@ int qxl_surface_id_alloc(struct qxl_device *qdev,
 {
 	uint32_t handle;
 	int idr_ret;
-	int count = 0;
 again:
 	idr_preload(GFP_ATOMIC);
 	spin_lock(&qdev->surf_id_idr_lock);
@@ -433,7 +432,6 @@ int qxl_surface_id_alloc(struct qxl_device *qdev,
 	handle = idr_ret;
 
 	if (handle >= qdev->rom->n_surfaces) {
-		count++;
 		spin_lock(&qdev->surf_id_idr_lock);
 		idr_remove(&qdev->surf_id_idr, handle);
 		spin_unlock(&qdev->surf_id_idr_lock);
-- 
2.27.0

