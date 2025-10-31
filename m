Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E443AC24991
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3606D10EB98;
	Fri, 31 Oct 2025 10:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="WMUq28qd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB4910EB96
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:48:53 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so1270806f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761907732; x=1762512532; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Zo2jj2MOuswONrFhs1A8zruhpNCnAbrPgnW3srwcDM=;
 b=WMUq28qdB6MP0lE5SODyE196o84DpQ2MjOk+gGq2nNR89HpC+3doN6mesPTKmm6BL3
 ucU3EVZp7Jqu6155TfHjWWvrx3XOFeLRqs4vJmhSeFPyBx3b8MJtZD/2pTJCnDDGiHg8
 2i5xfx7ikD4Vwij6O+atCKQ1QmEqPG9ySuCVUJEI8M47NkL8bD3xyLcZGDvAgdDbi63S
 2NhhpotJcQNz83lFepBAaYp/OmmzCKGz/L63A/K/S6AoVvIPPmj4q/3nIAZursMZleMa
 doDjq/vvii8qsdY3AHVCeteucAoevstC0U2xdK/4k1JH4mHFl/2MPglkdJ37nkHChJ7N
 AZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761907732; x=1762512532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Zo2jj2MOuswONrFhs1A8zruhpNCnAbrPgnW3srwcDM=;
 b=Fh0f0FlsjLLeD2155yT/rNODg6d/C9oemL0PsPJuzmKbX74b5czki7+nvjC0wbx8qS
 SMAZpyzA2sD7bxeiCZT4CgyKsOwApBxLh2t4GUdtqHoqlW6uKM4pTV2RYl7+UiDq9zSF
 ZzuxB1GXLniWRO/4NavWW0OomdM4pVe2rVtiKkcflkeBDLokVG6DIGsLjr2m9mfClUKm
 tm1vQ2+qDuGIv9OoqWeUxkI0md2IXbSUnMAMK5qCMMwqtg6LU0550D3bjIezjiKOKCcu
 itLftAV4mrPzT/eXXrFiJ500FsQRRiNqXxPfCKl+WDrHQe2I1b4+y11bkCxr0KvSeizw
 FRow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl5CyeZfO3QVrJmQ0pNBwfzT7yx39+Ynic0uUa7gQNs68dlZH4wfE4K2OkUt2vL6d1bY7OsANwxIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYLU9iGGWs3a5uavBK1ENwpiI10HumcD3SoQYCDvPvjsh3u/0m
 f+qJ5grEKqrhPOzkWuLM1TV4m82HRHUkPHkQGweNqK/FT9NW6W/gD/h3XewuQ7LeoqE=
X-Gm-Gg: ASbGncuqhqTuYDaAhjSXWDwpwciIQ8thLuWNM/iGrZBVGSez1bF390FqU3tXRYa4dfR
 qHoI+BQV8ZpRa8VTJYROnWBC81XABSqUU47qisGTPmu61i2IwBBp6DWtwZ7fbdHaeMa+hKL380y
 lFW+4nUfExUFZgWhBOJwKp4RguZy2SkE6kSatelTmkQqEDSKzGV0hVBCFtXWeG3T5if/kfpmkaW
 ndNHjnYBavfYu05IFYltOOvmYdJk226N1PCsfTPqWyIUPaU3aPy++zrpUSYnTE2pYAcuBBdqVqT
 WNnyN/2HrkrMgAwoI1jP33JcyqDJF306yVtDwDQXA9a4oQxWFZcuPLTxdDM2posTjCMcKEN0uQ9
 IAcbr8bV/Y2WTbwsBl2EvCONM3VglB5uez1AMAxmaJmThA6vaiKVtgPO0y23iLrnb6ZJI/ZBYwa
 8i7YftYA05Ld1LbtEHe+qTlEoThMtRbjbKhg8=
X-Google-Smtp-Source: AGHT+IGobibt4LNxx3fw5hmxTlHoYafBePMtzQoeq6djNMJvhNOcnjqVzzpJ8k598YLOu8WNRveGDw==
X-Received: by 2002:a5d:5d02:0:b0:427:9d7:86f9 with SMTP id
 ffacd0b85a97d-429bd6a8f88mr2587154f8f.47.1761907732011; 
 Fri, 31 Oct 2025 03:48:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c102dfd2sm2961635f8f.0.2025.10.31.03.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:48:51 -0700 (PDT)
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
Subject: [PATCH 2/2] drm/rockchip: replace use of system_wq with
 system_percpu_wq
Date: Fri, 31 Oct 2025 11:48:46 +0100
Message-ID: <20251031104846.119503-3-marco.crivellari@suse.com>
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

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index ed6e8f036f4b..deeeface0b63 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -276,7 +276,7 @@ static irqreturn_t dw_hdmi_qp_rk3576_irq(int irq, void *dev_id)
 
 	val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_CLR, 1);
 	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
-	mod_delayed_work(system_wq, &hdmi->hpd_work,
+	mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
 			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
 	val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 0);
@@ -319,7 +319,7 @@ static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq, void *dev_id)
 		val = FIELD_PREP_WM16(RK3588_HDMI0_HPD_INT_CLR, 1);
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 
-	mod_delayed_work(system_wq, &hdmi->hpd_work,
+	mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
 			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
 	if (hdmi->port_id)
-- 
2.51.0

