Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C195AC24688
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9FE10EAF6;
	Fri, 31 Oct 2025 10:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="KYVPYC5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3526210EAF4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:20:30 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso25868165e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761906029; x=1762510829; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lG/JWTB4mQFHfKHxkHY65ceoWtJs048pwnbqojq+RhA=;
 b=KYVPYC5T6Tk7oCK/+OhvuGEBwmuub+qWgQpFvpC5H10JeB18vaVAPbbLt67hZnMvDv
 otDw52FJszZzqLw9XsEgy7CfIFEIhGazfNzfXOn88k4DiO9uxfiiZNiyx5JStENDv/PN
 TWyzPve2/2QKfhtcxHyjrgJkQ/YlVtwVl3dLSb23PphkDxTZeDTDPvuu+6cPBfIgVPRE
 te38dwgo3bMWhs4QED1I0M8tcFLEG7vfPm0KUoth3W4rzrTDbN3Ygc1IoKHequbeM9Al
 RAiI9oJc7c98t0woIz4DXVn5Y+LUgOWIgSvCsdmf3QGtoBqc6rOfh3VE2B/pVy+rBDXP
 1eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761906029; x=1762510829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lG/JWTB4mQFHfKHxkHY65ceoWtJs048pwnbqojq+RhA=;
 b=hSK5qDMTwjctC1YAzAsj8/M5pYOddzxL3m50hMgY0B+8SRTznVDy30CiqRmVAS0GpE
 BR+xwsIcDkhdSGQyTixtWOqjQx19Hgjl2mVVubHjWzD5chTdlND0zxAlEvYEYyvLZfDg
 urA4N3iw55gFk7hRBPyfYqXYB8a5t1c/0K3f2qycLSO/xxtBLPumvZ++JqgyZCE31Ion
 b6XJkvc0TzFYMqxGSAlOqmUaaqqIdRrNvInkNbofm30AQUdAaTgVl8vMG8TQymJWe90I
 g9cmI+amhTVT+YrIGhPBl/iivbaXZn9YMVJEZV9Z3Pm11ueG9VkZ3TwHUj2oUvUvVqFg
 gMvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO1GvSfrpidVPKHK11JJbMO937DLeMxAWf7ILgus4brxfXxqPEUuE2PRPieuFepWC2vjHbBcbLpK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4vMOWrGliJf/jvI5upqJSuPNUQrQR24GHb3/g29JP3namL4bA
 aNf38Q820kwvxIJsHcuo0WVH2ijDGkGvtaCR9hezXpqOC+jJSIao/RvGhQJD0oxCN7A=
X-Gm-Gg: ASbGncuNOmsPGLHwrfdwsf1TcZra71Bd4qy+e0cWAt1hS4KnfyLXkXjkZ55L+xLa96/
 5L8amlrNQZEb/XkEE9bQIIzohCL9sx54hA/Q/f3Gij0UfsrYa9Ksrwb8dcyTYSyR1Yn2D6cvX1d
 KKbqzVA+46Mdz3CLqf40HmpM115ynsVpG0Z6eTywoBk5hbAIz34DwL4R5Wd/AmeK1cfOL2EHhQT
 sfqUUNJ2OtkJSnjmh9b15JRbsXLaF5cPVO/KvFIYPvphulknNIHvphwnbIs1iYo4TfJ9TP4xb/a
 aLg0rO9CDQh0kUtK+ToyDWOlpnfLyuFqyHu3Dq0TkKMu7j3nMygm2fuefyzNOrpYXwIzMkqGaA/
 VnAv8Fk7MykXGh/FGRdP4pBEEshzXP7HxV88KkB/3llaY8fFALTwXpvAyPUBB3QGxMhdHGk5uO1
 lN3sRj6mLjd36NVMeEjS5+j+hq61bPfa+EyIM=
X-Google-Smtp-Source: AGHT+IFxPuEPZ18LFLMwyhb4w1UgiiQJF5IBQ0ySKwVqt0uLPj62F1MUEQhY67w2SzSkdspzyNNBCw==
X-Received: by 2002:a05:6000:2511:b0:429:b7bb:89bc with SMTP id
 ffacd0b85a97d-429bd672238mr2018518f8f.1.1761906028685; 
 Fri, 31 Oct 2025 03:20:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c110037asm3090410f8f.3.2025.10.31.03.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:20:28 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 1/2] drm/nouveau: replace use of system_unbound_wq with
 system_dfl_wq
Date: Fri, 31 Oct 2025 11:20:19 +0100
Message-ID: <20251031102020.95349-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031102020.95349-1-marco.crivellari@suse.com>
References: <20251031102020.95349-1-marco.crivellari@suse.com>
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
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e97e39abf3a2..50b7aade5f0a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2474,7 +2474,7 @@ nv50_disp_atomic_commit(struct drm_device *dev,
 	pm_runtime_get_noresume(dev->dev);
 
 	if (nonblock)
-		queue_work(system_unbound_wq, &state->commit_work);
+		queue_work(system_dfl_wq, &state->commit_work);
 	else
 		nv50_disp_atomic_commit_tail(state);
 
-- 
2.51.0

