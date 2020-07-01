Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7620C210F5F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 17:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A956F6E119;
	Wed,  1 Jul 2020 15:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3646E119
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 15:33:32 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id a14so6584703pfi.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 08:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=U9tcBWqanEmcG7y4KnRT6hQjOymIY+744WxQv0Dj8Zo=;
 b=K1hFqpY0Fmcq2Wbi/vJnWw4/HMuvHGfUuInJqu3Ga3uSw6z4rCdqHlaAlLOUwojT7r
 qgAU4kYVt+OIY/65Ibv7i+8Bf4nZFSPnMsfMGpFUaMCURJtiG7GN2g7WCIWZL3Nv+cQD
 CS3lKkwI4V/2nIHY0n4JaqAxwXj2MNrnu1kWV1+B0N1SJ7t4m3F6NVzqGwbsDLvH8dZ7
 iKGcrKRQK/FZDHFlQa6Pb6c6Rzx701nSm3E2U1caDR0qVQWjyS/Z39C9D8p4lImzO9Q2
 T/NF09gb/mY9vDwIrBlgZeHNY24isRLRkFdd3/oRXTZuwBRNDYag8IFBNOr77AzCF523
 QiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=U9tcBWqanEmcG7y4KnRT6hQjOymIY+744WxQv0Dj8Zo=;
 b=DVJhUgrolkdv9ADrdh9Hqky63d1VKv9XBEw57X8DGPg0IkZ2Pw1RNzOImOcgbgT/yg
 5LVLrclOFRqWkxOZXkbXwdEmUgNmTdMNPEYKBgOXWNwvZmqr5kSuBAuhovGVgLnJjCpS
 +Kkc/ky/xhmttUISz70jeWTq3+oCAEg4jq6Hz8RNl4bt/lZeqIX/ZVG9Ddjs8wnVQMks
 reBVnjS/Grjj+aXGdZXwQ5v/HS58MRQX9vA9HEIodzVrWxZgT2KMOi8DyKaQbOdGIxob
 qvvOJ0caMX0Qgl4yNVSV4qOx0t6IhI5ytKmvP11reWdO8jpMDW5kFxHHk3ZjOJy57uMp
 VvwA==
X-Gm-Message-State: AOAM532K1DiUBqpwCZ8aJoWldK7bx8ric+KWMQNe7kwoOpNE60jCnsY5
 NYBs7OFNBZrsRzdoHl9f8x8=
X-Google-Smtp-Source: ABdhPJze/rdIUGzGzRmy2i1GgLCkpJoNWrsDPUWc/0mEg5zpEaXdh/1TsueAz3luUFdpr2gRjHVLKA==
X-Received: by 2002:a63:580c:: with SMTP id m12mr19822599pgb.446.1593617612304; 
 Wed, 01 Jul 2020 08:33:32 -0700 (PDT)
Received: from localhost.localdomain ([61.83.141.141])
 by smtp.gmail.com with ESMTPSA id a9sm6566763pfr.103.2020.07.01.08.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 08:33:31 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: [PATCH] drm/vkms: add wait_for_vblanks in atomic_commit_tail
Date: Wed,  1 Jul 2020 15:31:34 +0000
Message-Id: <20200701153134.4187-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sidong Yang <realwakka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there is an error when igt test is run continuously. vkms_atomic_commit_tail()
need to call drm_atomic_helper_wait_for_vblanks() for give up ownership of
vblank events. without this code, next atomic commit will not enable vblank
and raise timeout error.

Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 1e8b2169d834..10b9be67a068 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -93,6 +93,8 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 		flush_work(&vkms_state->composer_work);
 	}
 
+	drm_atomic_helper_wait_for_vblanks(dev, old_state);
+
 	drm_atomic_helper_cleanup_planes(dev, old_state);
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
