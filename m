Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DB4C24997
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DA610EB96;
	Fri, 31 Oct 2025 10:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="YLP36zLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AE110EB94
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:48:52 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-429bf011e6cso740395f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761907731; x=1762512531; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OBWYxLlmhmMlhJEcwlD766MutyyLNrX1V09UkWZeUf4=;
 b=YLP36zLZWgYVeXehVNxWzkMnzM1oWE3HjicY8uWd9k81S6BHiQWs8/jzvxMrhj3hIC
 HVtnDNFVXEzbqkLuhP2IW1BChfOGzpHMGX2rNBNT32e8LDAdh359AHmyLqysRikmbSlM
 d83MZUz098AzwLPNssj6K62UkPiMCEoMuPBvuzrH4rD0h3D+B0XdvZjWHy7agxInQoiL
 /jT3mKHTJivDZt45nS8BJOVnHPCQ/sIldMC70NAvym2tH4hyqYm5nRpsnnuLiXfsZ3YV
 fI2DoHk0a85Gz/QP3os4vOuixs6LCt2d7decrUepwYgxs93ncYvokGC5yC2aZ3lQddGD
 SlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761907731; x=1762512531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OBWYxLlmhmMlhJEcwlD766MutyyLNrX1V09UkWZeUf4=;
 b=ofWOknAUEdBzAYfB9kkRVOiQo32fvG8MlGJnCeTMKt2Rvy6nWuJyfmF2SXCKHyaPYi
 hhDA8Erpf5yVFdseBzAX04A9FVnP2pKy6zNRk9kCxBFyLmBQPHuB9B4plyDwus760bf+
 FBioFacdeEeWndasHTomHus/7p1bbPXh1CiGJ4PXhHrV+Hv2ArlUrsM7dxNuvW6xScC9
 Sx/UNT4fnqgmaD1j2Ns82YLajygtVxaNXWin0vEY0j3tX3YoB7M49bgs/fcyLjIJycyg
 2jhOSJN3xlGZBw7fXZJSEOd5TBcuM/vDLA4oycp63x2Wxe/4vyyBGJFurwr9fqlNrjRn
 HBrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs0QMsEnN5uX+4khxvkX3I74NFJxYhLDUg1MHhQfp0d61Bc09ltvrCOKgiqmZBBRnG8VsIj8RgOyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxWjT9PZxMi0DBMfsBw/0z2yBrCYrmGK9IMXEH2AR1FxaUENZI
 OBswkVcu8etbOTOyvSDVK/30SAObox+VIX9nKXMrHvjeJ4CzEAqNxpCJB63+rXWZQX2YnQsS08v
 waUJf
X-Gm-Gg: ASbGnctT38egnwUKxPKp+p+S61iD7fdqyUxhGAIXkYhjyOnIj3YYgmj6ixSCW13p+Cd
 a5IrXtb2aDcJwZPxzY42yA8kCoPZd9WLcZqnRP0Y3OvHu0WgqJIs1diTCH/2jPgWp/l1ysT55e1
 n1Hkthm6SWrkPpXCDGZ1bq6qwvq1gt3VwZ+GFDUHjogBxj4BbIzDZKKLFbed0258j9pIHESKfyv
 PZM9ujrJZ72UTknZYaeUP3HOGLNZYX6LkqtD0XYwU17xopM1qA53K1hQCnUrr18PePTcSE3LlZf
 BCxyftkgbD3Vh13c5JO7ol/VoqQzNObeGPT0FizaqQtM7qF0PzpjWcSvEZc8pWTv/s5j5abHAkI
 JheShu/u/OsRqHFaQSVJceP2PEkpvu1GfVjtNUfPodHxPSqPKTI+xjRaN1FjihJMNJgB4bX3Ek9
 M6JSIAQkb2A0q6xlJgEk2JAmyfz4vxOdtzg4g=
X-Google-Smtp-Source: AGHT+IFXAzHg/iq6w+vdzj/m/7FqAE/8oRdJB9oVXLVeXcIgN+TApftuVAX0hFowdEb6GbjwPbphjQ==
X-Received: by 2002:a05:6000:2407:b0:428:3f7c:bcf3 with SMTP id
 ffacd0b85a97d-429bd6bf68emr2653726f8f.49.1761907731032; 
 Fri, 31 Oct 2025 03:48:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c102dfd2sm2961635f8f.0.2025.10.31.03.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:48:50 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 1/2] drm/rockchip: replace use of system_unbound_wq with
 system_dfl_wq
Date: Fri, 31 Oct 2025 11:48:45 +0100
Message-ID: <20251031104846.119503-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031104846.119503-1-marco.crivellari@suse.com>
References: <20251031104846.119503-1-marco.crivellari@suse.com>
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

Adding system_dfl_wq to encourage its use when unbound work should be used.

The old system_unbound_wq will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index ba6b0528d1e5..18393c8671eb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1770,7 +1770,7 @@ static void vop_handle_vblank(struct vop *vop)
 	spin_unlock(&drm->event_lock);
 
 	if (test_and_clear_bit(VOP_PENDING_FB_UNREF, &vop->pending))
-		drm_flip_work_commit(&vop->fb_unref_work, system_unbound_wq);
+		drm_flip_work_commit(&vop->fb_unref_work, system_dfl_wq);
 }
 
 static irqreturn_t vop_isr(int irq, void *data)
-- 
2.51.0

