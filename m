Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 085131C93F1
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774876E9FB;
	Thu,  7 May 2020 15:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DD56E9FB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l18so6827313wrn.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QfVTwYMVAXvlC5QCQKy9z0IKl1+/KgdMECgl53AiOZc=;
 b=Y58pJABFemCUGC/x3WEeH2NiDIAdk4SKbCzpp6kD5Lwmr7URavjbMVmXh737qNCzz3
 Ex6K6YFbVgIzmyNgeNxnrUk8fNxbe/24URYCJHkc2BqNACtp6OcgfJvARBpvcgpYMAG3
 mkfPOAVq661PsATEjwcaBKBDzu4QdwK6AU7dneqKtRkNef1f3OJ90hlKKViPnO11s4Lm
 7jTUb/BD4slMMc9ypjUSbaK5j8pJFZ/jUGx4x81/geBJzOuUdBiUqfyB9GW6/wuyfMQd
 v1DmwGonPGndPzgND4NlqAyCVKirU77qr2zU8X1i7Ju1kkiODk41++LBD1r8m2ORtH/d
 z9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QfVTwYMVAXvlC5QCQKy9z0IKl1+/KgdMECgl53AiOZc=;
 b=luC3L1At6Wm3CrbE8+DuIRzk09hxZOv6WyEP59wFazyI+y5Dcs1SBjIyaYRMLZs/wZ
 h0IshadTJFL2aQwccPgOtVBx95m3IgxVIdL4iyyREy+hO3QT95259YSiba6SVfzEmcEg
 /urCxG+I8cHaeYYW4qRpPGZmiMELA5QHdb7bWGY1HbxL2G6hm4E09woht7WqLjrccuVW
 0DRsfenr9b3sEM0UVup4cJU33pGCK3FQxSK5pjXawbE8lMMjNZO1STtOq5jjyhFJSECb
 QEgd1civCuap6NuIlRpXos/doyLrwGlffKWXb+J8eftpEmFFOVfrs6tzr/RR2LklL0Py
 se+Q==
X-Gm-Message-State: AGi0Pua0hafnKKvOerOlEj2SeTUpgpDsqOQh3eEAydwk2hj27x/HvXCL
 xhDMizLIAwIhc7EZJk3beEJBXJ3S
X-Google-Smtp-Source: APiQypIDNCuJHVHctnWG8VWbkDUwnS9zIMAdhHhsdE7+34/snQqKwwVySYJTcj2tRLcjTHHirD76vA==
X-Received: by 2002:adf:f38c:: with SMTP id m12mr15456344wro.167.1588864261032; 
 Thu, 07 May 2020 08:11:01 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:10:59 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/36] drm/gma500: Use lockless gem BO free callback
Date: Thu,  7 May 2020 16:07:53 +0100
Message-Id: <20200507150822.114464-8-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

No dev->struct_mutex anywhere to be seen.

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 2411eb9827b8..34b4aae9a15e 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -507,7 +507,7 @@ static struct drm_driver driver = {
 	.irq_uninstall = psb_irq_uninstall,
 	.irq_handler = psb_irq_handler,
 
-	.gem_free_object = psb_gem_free_object,
+	.gem_free_object_unlocked = psb_gem_free_object,
 	.gem_vm_ops = &psb_gem_vm_ops,
 
 	.dumb_create = psb_gem_dumb_create,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
