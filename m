Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7919550F0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 20:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFC210E821;
	Fri, 16 Aug 2024 18:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="NEc+lgdK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D141F10E81F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 18:33:38 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-4928fa870a9so775458137.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 11:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723833217; x=1724438017;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0MSj1ciHmClYtImv/kj46bRHE8rpnNrCKdm6pfAirTk=;
 b=NEc+lgdKWAEQAnDrSroDhe+9L2i8HoQ5cVw8AGTXhus4+l/0zsHwJrxAgCFlYhqG2J
 H8/srnTaK808eTpIE+nIIrutFB85gWNgjbhf6DomKgJbSpjy1zW79FQBZzf+oX8mQqrt
 Kv6qFnEVdc4JezYMcl6s4LKsiUj+cnQTB0rwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723833217; x=1724438017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0MSj1ciHmClYtImv/kj46bRHE8rpnNrCKdm6pfAirTk=;
 b=qffgAYuYjlwS5lLoXm1pLUvr+qGWace/Opv0scQTyNiAK13p6nMLKNCyQ9Ri1tcfTl
 t2wt4XYjOJK0BfZ8YTsJ3ElFDWYteHhcdbhiU2wqc0E3vVJLPikmP3DQc4xT+IXkkNmz
 2T0tGKGpHbM+r+J7e0/URF5UjEJCrykzHmCdoB0uuGMUY1z1sRnrRYnUMIGhsIsh0R/W
 pxc0pIJ1G1U9oKFwORxknaXaSAvmbsKMAHGXQCo9+LTmDEa9tV4E9Ns+PTz3XWoNj0/X
 HvHJW3X18dNfdrrY8OPgL6ElJ+rBp7N+HC3kOMxdEomBrU/c5/l1Ztm8blQGd5N/iWGc
 rAIg==
X-Gm-Message-State: AOJu0YzeHO666Q2jgYSVNZuAmZctzZFcMApnL48IoWW6P1vGmKHv6YnS
 PWp56CJQQ01D+qB8V773R8rfJTWnv1VwZec+JQlnLAGIJmSnup6rG/22baX4LeMVtaPKfWtrSfx
 CDS2DzHtDmRwX4bKcErxMlZlLqdhCbwI9SOCkPfpDXQHdGSWqRDJ0N7HGqaGLT+xMsD84CA4Lj2
 56PXbY4aV1CWckH9b+bhYHxMwl3atDGu/hLCrXcur9IXDq9g7S9g==
X-Google-Smtp-Source: AGHT+IGwMcyf/LhSnfAPtHBYspzrmDF7f6Af8FNN5mB3N1Tsvbz//Z31h0D4G0XY2Rq+SiWw4Kk6Jw==
X-Received: by 2002:a05:6102:4190:b0:48f:96a8:fa33 with SMTP id
 ada2fe7eead31-497799408a4mr4251629137.11.1723833217410; 
 Fri, 16 Aug 2024 11:33:37 -0700 (PDT)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bf6fe26c71sm20164106d6.61.2024.08.16.11.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 11:33:37 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>,
 Christian Heusel <christian@heusel.eu>, stable@vger.kernel.org
Subject: [PATCH 3/3] drm/vmwgfx: Disable coherent dumb buffers without 3d
Date: Fri, 16 Aug 2024 14:32:07 -0400
Message-ID: <20240816183332.31961-4-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816183332.31961-1-zack.rusin@broadcom.com>
References: <20240816183332.31961-1-zack.rusin@broadcom.com>
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

Coherent surfaces make only sense if the host renders to them using
accelerated apis. Without 3d the entire content of dumb buffers stays
in the guest making all of the extra work they're doing to synchronize
between guest and host useless.

Configurations without 3d also tend to run with very low graphics
memory limits. The pinned console fb, mob cursors and graphical login
manager tend to run out of 16MB graphics memory that those guests use.

Fix it by making sure the coherent dumb buffers are only used on
configs with 3d enabled.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
Reported-by: Christian Heusel <christian@heusel.eu>
Closes: https://lore.kernel.org/all/0d0330f3-2ac0-4cd5-8075-7f1cbaf72a8e@heusel.eu
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.9+
Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: Martin Krastev <martin.krastev@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 8ae6a761c900..1625b30d9970 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -2283,9 +2283,11 @@ int vmw_dumb_create(struct drm_file *file_priv,
 	/*
 	 * Without mob support we're just going to use raw memory buffer
 	 * because we wouldn't be able to support full surface coherency
-	 * without mobs
+	 * without mobs. There also no reason to support surface coherency
+	 * without 3d (i.e. gpu usage on the host) because then all the
+	 * contents is going to be rendered guest side.
 	 */
-	if (!dev_priv->has_mob) {
+	if (!dev_priv->has_mob || !vmw_supports_3d(dev_priv)) {
 		int cpp = DIV_ROUND_UP(args->bpp, 8);
 
 		switch (cpp) {
-- 
2.43.0

