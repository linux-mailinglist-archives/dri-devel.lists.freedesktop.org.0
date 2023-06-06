Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B154724627
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8552210E360;
	Tue,  6 Jun 2023 14:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E91F10E360;
 Tue,  6 Jun 2023 14:33:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3090d3e9c92so6174640f8f.2; 
 Tue, 06 Jun 2023 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686061998; x=1688653998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=etnk6Bmfi+NsN3fMwvpGFNhakv5CYAq3q2C18ogo/QU=;
 b=r4mkCO7+F6PcaG6L5pBrXztZOCfvv1CoQeSFQeqwGopyq+CzI6qbgEWC9fduxPiiDh
 XtDOudYSaQOmT9xXbvpe5i2hAmAHMQs4lRIgF7PUe4jBfFxNVi2pSpYkKlRGMC9rFSxJ
 pJNj+4DrSg8ccP5n8R1teUhl3oAOJrlv/CWchMr3Ci7DzyCFvKTYsfp9/3dwz4mVfPXF
 GjZGe9iXmZWDii8Hk7qOo0dE4uC3SdnUvdpmAXQuKmbavca6BPxcvyZMjhAdRqb+KDJf
 lIQ3GWa+pfASHBYSLsxeZgq+e/FxNza4y3b088Upx0E/OnrlxgsJ8L0WlVovnl7HOVcs
 nJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686061998; x=1688653998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=etnk6Bmfi+NsN3fMwvpGFNhakv5CYAq3q2C18ogo/QU=;
 b=hXc1d/wvI9EK1m4PjPOXFiCT69cc5wn6ouQf/m3U/5e8lja/O7vkZ0mesRSSLOVe6+
 m2UMkBkSXYrjBNSf1Z8IeyjNTE4uaQYcxSNibDtHhuyhxWqwwYED19fPJfy2vtxn3I79
 dabhS9EMMhNE9Wi0DPKL9JfVjdGfhPO47+qemjkj2Akh7WpLgfGmu3cJoLsxhLajomRf
 ZHRSMG7JzPtVAENQmvc8VrIhz0xbZwCS8B8r0WUMyXkqFvPjM2MaxZFv9auTzia/8cos
 ubkpEQiayE+HU5kPv2RWc5TTNyxWbi+vxMb8+9fVv86Reo1wMO1Q5p4ckD7uEpbVThAq
 ef/Q==
X-Gm-Message-State: AC+VfDxt++d03Aj6D5ZO8uC+S0vxUSaOImqTkexOJ+y0cUcD7EOigiTw
 4V+OGBLFxd90kpJRoF+uU9A=
X-Google-Smtp-Source: ACHHUZ5KiIY5KwxOSxBzH2UQUnhP4/a60rnf7iCrHG1wFajmhi2f/DobS0/OOkSxpTE7+N6FDx414A==
X-Received: by 2002:a5d:4bd0:0:b0:306:3945:65e9 with SMTP id
 l16-20020a5d4bd0000000b00306394565e9mr2211778wrt.3.1686061998296; 
 Tue, 06 Jun 2023 07:33:18 -0700 (PDT)
Received: from odroidc2.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 n16-20020a1c7210000000b003f736e28cd6sm8902642wmc.4.2023.06.06.07.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 07:33:17 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: yuq825@gmail.com, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Subject: [PATCH] drm/lima: fix sched context destroy
Date: Tue,  6 Jun 2023 16:32:47 +0200
Message-Id: <20230606143247.433018-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: linux-kernel@vger.kernel.org, luben.tuikov@amd.com,
 christian.koenig@amd.com, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm sched entity must be flushed before finishing, to account for
jobs potentially still in flight at that time.
Lima did not do this flush until now, so switch the destroy call to the
drm_sched_entity_destroy() wrapper which will take care of that.

This fixes a regression on lima which started since the rework in
commit 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
where some specific types of applications may hang indefinitely.

Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_sched.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index ff003403fbbc..ffd91a5ee299 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -165,7 +165,7 @@ int lima_sched_context_init(struct lima_sched_pipe *pipe,
 void lima_sched_context_fini(struct lima_sched_pipe *pipe,
 			     struct lima_sched_context *context)
 {
-	drm_sched_entity_fini(&context->base);
+	drm_sched_entity_destroy(&context->base);
 }
 
 struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *task)
-- 
2.40.1

