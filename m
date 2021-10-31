Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD90440CB4
	for <lists+dri-devel@lfdr.de>; Sun, 31 Oct 2021 05:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DE689D77;
	Sun, 31 Oct 2021 04:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27BE89D77;
 Sun, 31 Oct 2021 04:16:19 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id m21so13931672pgu.13;
 Sat, 30 Oct 2021 21:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u8gCZCpacYgd5ErXTwktBdnbcH7JyijGssTddxvh9qE=;
 b=k9IO8bpJuuP/sBhRxEhUNL8GqOmINAo+U8tRcBng6NY8+fo0XHByvseyKNvwUYiaty
 nLPsJe7B3TVaksyY8zvAvG5Plw1yW1dmMCUZgdo3yuOIYNWoYHMl6AXk2XlSry11rr1B
 lyfFM7U4GGYYGN0vlXQdTPJmJJ70SK5VjQ9fPYefRW5bdImS4kv/xp+oZOU43ra/Eubl
 8ex0P6pE7yIDgSyRrqMcUkSVcHXnDXezDtZN4LBFkmaUDpZrzSWArf7zNY6FK2YXIJuU
 yZ94kdQbs306D7935nXpyWV+4uIJ5Qp5YdOXvzbc/DM9tQyKdeRMEcrRv7Y3lUtMDWLs
 PYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u8gCZCpacYgd5ErXTwktBdnbcH7JyijGssTddxvh9qE=;
 b=ZVwdn1TRHGQ0htpgDgSnZzmKwMWAmJO9LSjuNE12D0NHw1bpkWY+V+FJ+/6OEBcoXw
 s9uB9qpRoniR4uUUgKVqEyRSCgjQ6Cg/at5uqxFjj/+Dz8BhGBtN0AUL26gqZ2elkS7B
 Y7oM6MRGojrtPswxX/TeF8k22341yDrVYu6f0Rff/lCKmgmQlMG8eFMp9rd52S9oa3AP
 gQfmhSISPqjRdxyqKDxPjy/J5hVmgwuWKs5WRZSOhoqThhnSUQCgW9Js8iWlFJXSPgRK
 +00a8ggRdImktaOh+fRe0Ce70h0uvDh0HYJDNjEXz/GIDB3qfKWOHSHgqNxpnhq0DIo9
 lgGQ==
X-Gm-Message-State: AOAM532JB+5tPU68IJi4hSOEs4e96TIj1IbIge4k2DiDH0RGYp5z2TB7
 fbZmFuYyEB+I8HyFmkbdwhHTHNzZVnRLXVHi
X-Google-Smtp-Source: ABdhPJzCHGVVg1hlNigdzi/6OaZ03m0v1pbzhJoTzdzTipkkGrS18wZaShw+QK1s2hbWOp4WfKBzlA==
X-Received: by 2002:a05:6a00:16cb:b0:44b:bd38:e068 with SMTP id
 l11-20020a056a0016cb00b0044bbd38e068mr20507995pfc.34.1635653779180; 
 Sat, 30 Oct 2021 21:16:19 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (114-36-194-33.dynamic-ip.hinet.net.
 [114.36.194.33])
 by smtp.gmail.com with ESMTPSA id h3sm12013111pfi.207.2021.10.30.21.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 21:16:18 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Erico Nunes <nunes.erico@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Qiang Yu <yuq825@gmail.com>,
 Roman Stratiienko <r.stratiienko@gmail.com>
Subject: [PATCH] drm/lima: fix warning when CONFIG_DEBUG_SG=y &
 CONFIG_DMA_API_DEBUG=y
Date: Sun, 31 Oct 2021 12:16:04 +0800
Message-Id: <20211031041604.187216-1-yuq825@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Otherwise get following warning:

DMA-API: lima 1c40000.gpu: mapping sg segment longer than device claims to support [len=4149248] [max=65536]

See: https://gitlab.freedesktop.org/mesa/mesa/-/issues/5496

Reported-by: Roman Stratiienko <r.stratiienko@gmail.com>
Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
index 65fdca366e41..36c990589427 100644
--- a/drivers/gpu/drm/lima/lima_device.c
+++ b/drivers/gpu/drm/lima/lima_device.c
@@ -357,6 +357,7 @@ int lima_device_init(struct lima_device *ldev)
 	int err, i;
 
 	dma_set_coherent_mask(ldev->dev, DMA_BIT_MASK(32));
+	dma_set_max_seg_size(ldev->dev, UINT_MAX);
 
 	err = lima_clk_init(ldev);
 	if (err)
-- 
2.25.1

