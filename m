Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B0D7D9E53
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 18:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C690F10E141;
	Fri, 27 Oct 2023 16:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0DB10EA1B;
 Fri, 27 Oct 2023 16:59:21 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-564af0ac494so1928608a12.0; 
 Fri, 27 Oct 2023 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698425960; x=1699030760; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hu1FhjWQAAQQu/erPFOwuagpkPUc4fNsZ+YMm7C14LI=;
 b=CNfLHjt+9Pl7BslZVNBa0gQJJWlfc/Qzq0hzEvl+MOzWyp+Mg7QJMEzXb1L+eleKNx
 oa3a4W4jcmjIYLukDRPaLXeop8cFIGYtSRff6ciP+bBBFKyZhenjU5vxAl5jjp/kxAbp
 m/36c8weGzXOv2WsXqupK3S656wrjUj4Uxw6E5pRC7STY/qnz8gq75hIUYHCrQUOy/5e
 ssnutglzSFDQM/irSyjXeaOeJ8BYf5qU/zOYfJRRBsSqjL56VKLnmwoNphF6Cx9s0XZH
 w28p01yFL1nHcY9v8chmkHzYnGcVqtZe/XPgyqLF8xsXxYuCDh9oFPEEqNA/EXdjPlUy
 2hTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698425960; x=1699030760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hu1FhjWQAAQQu/erPFOwuagpkPUc4fNsZ+YMm7C14LI=;
 b=q2fQXj8HoJrX57bb5u01/We1FzP36ev8zIB/CyK3E7xyO0rDYKhKdgD+pcwryJcOak
 wJXrMYDXO/CGkjO2udlC/KrfATp7jnhp0ZCj0Jfhfgil9kX5Hl9PWGhzFbzAwuFycJ6l
 CW5GpxkKINYCj+jiXzooUBa7+MHbo7XV2qc1EdicSuumwzxGbZioei0xl39/vjaDKo1A
 YtTRkk4rrzdH0BKKk8QjRO9aIoV1uW69k50OeMm3C7MA3uTdBW/QJ0XP2YWYI3vTTkWK
 wfKwloHjLKEvMjknuNh/kGpoV+2ZoXHQ11wTBnBA10dHPYQxalD1UwAMXg2tM3X3jYR+
 afjw==
X-Gm-Message-State: AOJu0YyT5EUTlGhRbTKrqI0KxNXmjK//jU2ZnzhctOyeMF7ZQXeBwqYr
 BbnRKTpFHglGAUR37GTMaXmG2TQy4Pg=
X-Google-Smtp-Source: AGHT+IGq/OT51OWFTDYcHIvbMyrTngDK3vmX2a/+eGD+RvH40j5mBW0SCq03abTpvLoM4Y/jLrb/8A==
X-Received: by 2002:a17:90a:77c2:b0:27d:5cca:9b69 with SMTP id
 e2-20020a17090a77c200b0027d5cca9b69mr3056136pjs.45.1698425960498; 
 Fri, 27 Oct 2023 09:59:20 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a17090abc8500b002800eeafd79sm1301858pjr.52.2023.10.27.09.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 09:59:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/msm/gem: Don't queue job to sched in error cases
Date: Fri, 27 Oct 2023 09:58:37 -0700
Message-ID: <20231027165859.395638-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027165859.395638-1-robdclark@gmail.com>
References: <20231027165859.395638-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We shouldn't be running the job in error cases.  This also avoids having
to think too hard about where the objs get unpinned (and if necessary,
the resv takes over tracking that the obj is busy).. ie. error cases it
always happens synchronously, and normal cases it happens from scheduler
job_run() callback.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 2d5527dc3e1a..786b48a55309 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -946,6 +946,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		}
 	}
 
+	if (ret)
+		goto out;
+
 	submit_attach_object_fences(submit);
 
 	/* The scheduler owns a ref now: */
-- 
2.41.0

