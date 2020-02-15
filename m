Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B0115FC83
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 04:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA666E0E8;
	Sat, 15 Feb 2020 03:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345F46E0E8;
 Sat, 15 Feb 2020 03:50:38 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id d5so4699928pjz.5;
 Fri, 14 Feb 2020 19:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sfJlJJwI1bxI5Zr2QmVRgw6cluqLBrhqOPcxIVa8hmk=;
 b=uT0W1YyJVofYAVNGMMKAzVLg/bwPszqUn5ZOEzTfUsKHt7HkkAoz/W4eCOvrrYyFMF
 jAHvwnuwuzQiRQpbKoljkuD88QBHo4YiW+ma+jux+JzKcBv+JGNubZ/7QzpZHQ8rVJAw
 7vt450akbhYK8IZ6b5RhLlejP5bVCzGkeoS5QqhxA4nHBDr5shHEATHVU3vHFPAwdDbc
 KLwgJhf/YAniF6hS89YLNIKO55WfNK22amqGLN7uR8P6t6X39rbfatpN8JXnXd4x9RUw
 o76N0p9zKBDnuJijW2PgxmGHR48/DUl9MILj6DOxLvl2XBSJwhVL/U27ViE+NKFK5BdC
 Z+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sfJlJJwI1bxI5Zr2QmVRgw6cluqLBrhqOPcxIVa8hmk=;
 b=cWNQxP4WsGySF+TkAen+98uG+xFRF/goC08Ty+VA3AmkIq7cMpRKixCZLDQSzqgezl
 4poM2jpi8ReL+ehj7HuBz0CrlYHQQ047Zug3iRUCiYLtuejI/eK9VSouf++jti6EmzF/
 a/egZ0XWJuX83ntOe8GjEc3W4ziHU+nQg1YB+imHrKf1hdw7VWRlq1T6qD3lL2MVMW3p
 CPcl64NAqhFTz2hboC1jMaWVGLgxz6A268BEuHuiZ+f78XzB+TLYFPKWAfNdhYQKKYy0
 tVH4Y35bCoZEgZI1f3ldUlcJ6CutzbUhhNP+ONchZrhgh1B6NjB8NWxjtQ/cyig7RbW1
 tX6w==
X-Gm-Message-State: APjAAAWu9mks6+QrQymraf1Hp535hxkN0YsAGyhV8s/Ts+UicUodVk9o
 Qo2z0ih5hkTZIAOwcwvZkMU2/tViWyc=
X-Google-Smtp-Source: APXvYqyZGuZetBDODErSQUtfoVszKVteigeR9DNtDeH/xT3Ikx0w+NzBBVD8KljUGYhJYubNFZ+pxQ==
X-Received: by 2002:a17:902:d205:: with SMTP id
 t5mr6454527ply.138.1581738637706; 
 Fri, 14 Feb 2020 19:50:37 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id f8sm8489612pfn.2.2020.02.14.19.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 19:50:37 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/lima: fix recovering from PLBU out of memory
Date: Fri, 14 Feb 2020 19:50:26 -0800
Message-Id: <20200215035026.3180698-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.25.0
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It looks like on PLBU_OUT_OF_MEM interrupt we need to resume from where we
stopped, i.e. new PLBU heap start is old end. Also update end address
in GP frame to grow heap on 2nd and subsequent out of memory interrupts.

Fixes: 2081e8dcf1ee ("drm/lima: recover task by enlarging heap buffer")
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/lima/lima_gp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_gp.c b/drivers/gpu/drm/lima/lima_gp.c
index d1e7826c2d74..325604262def 100644
--- a/drivers/gpu/drm/lima/lima_gp.c
+++ b/drivers/gpu/drm/lima/lima_gp.c
@@ -224,8 +224,13 @@ static int lima_gp_task_recover(struct lima_sched_pipe *pipe)
 	}
 
 	gp_write(LIMA_GP_INT_MASK, LIMA_GP_IRQ_MASK_USED);
+	/* Resume from where we stopped, i.e. new start is old end */
+	gp_write(LIMA_GP_PLBU_ALLOC_START_ADDR,
+		 f[LIMA_GP_PLBU_ALLOC_END_ADDR >> 2]);
+	f[LIMA_GP_PLBU_ALLOC_END_ADDR >> 2] =
+		f[LIMA_GP_PLBU_ALLOC_START_ADDR >> 2] + task->heap->heap_size;
 	gp_write(LIMA_GP_PLBU_ALLOC_END_ADDR,
-		 f[LIMA_GP_PLBU_ALLOC_START_ADDR >> 2] + task->heap->heap_size);
+		 f[LIMA_GP_PLBU_ALLOC_END_ADDR >> 2]);
 	gp_write(LIMA_GP_CMD, LIMA_GP_CMD_UPDATE_PLBU_ALLOC);
 	return 0;
 }
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
