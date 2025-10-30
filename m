Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0886CC21CE3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2293210EA07;
	Thu, 30 Oct 2025 18:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="ISxMWJ0q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7322110E292
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:20:55 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4298b865f84so634811f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761841254; x=1762446054; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wvhoZDKhlKXBJ8oco1eRo37f/o37YxZDGMLsPeNe3VU=;
 b=ISxMWJ0q/+I8f0BFrUdPvxy1gGA+3Ryq7tKdgXspz2XfH2I85I0KiyD+uMMo82GPfr
 NKYYXu3ekgMO01yPrXh2PjI9UwHwf6KqZJ7su24GDPoa2uESnMukjJQpXZZS2hm6WoZH
 M9Z5hnSYXasw1hp2JywpNsIeij1SWsefO47Dqlt5p0z7f4afMvwfseIMms7+1h15Jg86
 Ix4PQtcKPcqiiHxqI/8etbsUYb+6/KeJ9n9een7Ie5IMCwFJyK/asQMlX35PrppAhOFt
 uZzI/8wyWakb+ghHQveZ6rT7Zr2wn04rRXZf8NQnUeDMu+tRlRAze6E2aVyVV2lvFxa4
 3eJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761841254; x=1762446054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wvhoZDKhlKXBJ8oco1eRo37f/o37YxZDGMLsPeNe3VU=;
 b=Xt3QHEiXkfb8SqdEXqQdilUyCJF8cI+ymJm3bFjfacvch+nxaoukz/AUBdVVnB4mGe
 xIHTXtIUA/qd6BEJ9w7PZIPiCGYsrfVtRbXf23pVxFtuCbPdGdrNT16ZPDlSyqwaKE+O
 Qp8gZuZFIGC2lVvY+d+mCFqR1fzRXVgozTHRsJ6tiiCRnkOgW36b9m6DfOmvr2xdwWER
 gJIVKTFe7MBYOJUSSd7uvI43ZXScBozhQa/c/ybtC5wq82dbldeBbJkTMJx0KRZz6Bhk
 6/gfhI/w252fAu7XG0j6M+dEFXKV0b8GxZsY47sYXkFN84XPXjIO/22I34N0goD4F9AJ
 QCiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXJC1wK5zk75Nh3J8teHIrqiiDz2V5KQ6WISQBKJbukxTAu9AN9DDWmHNWuWCo1RE/2M4eSCOGbkk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3O5cylU+MmXg6BglR6jc2W7wknGpEtIs5780LkBaGl8yB2vXu
 8pFKrPquzSNvtFBqjJxC8LC9loEX2mh1P0zvNWV63zPjNPL9MMGJHQlK1O4MV9GZ7P8=
X-Gm-Gg: ASbGncu+HF6/4BrzKaUtRUwOy+nQmTZ6nfFc+Uf0Gn7EMv2CLNxaw1RBMLNa+6+g9jf
 Alahq+t6prX4psJsLBQcNbVcqZnzfGXgmMhge/bQvbN4VAIm7R57DkmD8pmrirTtGCps5YaO7Yt
 S4NI1KF+VhKyLP+L4A2cTSJXcbybgQC4NWEgLnP03mRe3A37otxN6J3+ZEo5vIFEsE7H5eaHaSn
 JzwVauNHkBwSlNdxYo/JDHQNOzLKb8XTwg8hOAAgUIG+AmB8d2d9QIzMX+A6y/GeJzEiyDeuQLX
 HCr+P+/pSY6lvUylhIL1vpFcWNq8dc6s1ImI7YFw/GV0WWWZdrjNN9lPhALrEMSfFVJyDkSz3ri
 TOYU+EvLwmeT5YkHmSR+CQxy+M5j1U7nH7vE6nq9xQqrbjgkxLpYnSx8yzSuk24ArC6eVmtZDCw
 4Fefa4e2/INhibjlU=
X-Google-Smtp-Source: AGHT+IEiv28lW9KdmmMYgI75WgkeZBBbz1nTgj9Te/yi69S/DrP4tP6IvUe22f7NgxzNcoh3q9LxsQ==
X-Received: by 2002:a05:6000:2507:b0:429:91ca:70eb with SMTP id
 ffacd0b85a97d-429bd6f0952mr131737f8f.61.1761841253788; 
 Thu, 30 Oct 2025 09:20:53 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df473sm32758678f8f.42.2025.10.30.09.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 09:20:53 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 2/3] drm/probe-helper: replace use of system_wq with
 system_percpu_wq
Date: Thu, 30 Oct 2025 17:20:42 +0100
Message-ID: <20251030162043.292468-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030162043.292468-1-marco.crivellari@suse.com>
References: <20251030162043.292468-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Oct 2025 18:42:35 +0000
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
 drivers/gpu/drm/drm_probe_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 09b12c30df69..d4dc8cb45bce 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -626,7 +626,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		 */
 		dev->mode_config.delayed_event = true;
 		if (dev->mode_config.poll_enabled)
-			mod_delayed_work(system_wq,
+			mod_delayed_work(system_percpu_wq,
 					 &dev->mode_config.output_poll_work,
 					 0);
 	}
-- 
2.51.0

