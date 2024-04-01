Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAACF894678
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 23:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E924F10F56D;
	Mon,  1 Apr 2024 21:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xu7ocFNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A77D10F56D;
 Mon,  1 Apr 2024 21:20:36 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so8738265a12.1; 
 Mon, 01 Apr 2024 14:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712006435; x=1712611235; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t6CZf7DmYX851P/l0Uf00dwEomagAVZ/kC4VexJ4Dzo=;
 b=Xu7ocFNKuWD2bshct9FBz37yi6IzpwMclzT/1c1G7brJbYPRAqMk6kaJTmhOArDURs
 ZjY7s85UKMiW3u/5XMM7lJYxmlC7ZxfF4iYodbdirZGd2mNX0O0MNFRRPLSeRy5UxxYD
 2KDKKJhqjMmyhVhRtrvaqX3ucJt3MAPu2yMNyOnuEuJLPJ1+rPRnlfwBGEjOyDNg9i6d
 Po4FV00u+mZGM4p8zy0XSdeahEOn395qvPxlCzt2vEGcOJ4Fm06NyDJaZ7Lc+IwsLcxR
 X8u3vLPKRwm7nU6/a7pRrWItOsU/52TqeDIf+KU8ES3qEKLR2ynJ9x6ZntKmCdScTBZf
 E4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712006435; x=1712611235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t6CZf7DmYX851P/l0Uf00dwEomagAVZ/kC4VexJ4Dzo=;
 b=BLWa0v238mnQGISf371meYwsdMCDG0c0bYbPm0lVpC5wBxBp3NtXj8ZZ8cGu7qbT0B
 MbGafGtt4J4fJ+OO/78w0I87WP33z0H6zPajE661zDstdPdPkXWCtaT6TdjAD89M1Buo
 sfUbY8oAsHOqmU/6v6RK9IOh9Q7Pt2V5ckzt84uxsvVtJGtDJf9fF7PIBw5kOrJWTtXW
 N5ka8YWI2dPCgV8FOr3w9iyhHMTBUg5uEiVxXx9sso0qS1hTaGm2StxMz/ySmXcKh6iC
 mGSCSLSM22IeJifWS5Hmo4CEC5e29DDAZxxBzL7cEjzoV/beU2VT4gmB3RO1dtbn67BW
 cRsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT9G+GRu7YJ7MyuVfkt++qek1cf/vIzW4oMGdjl4pvl5msYV7jBQxbKjd5s64SK4ExjfhYez3AGFrR0Gx24VsKu+h0/niyNlMHJ6OuikC6r/wd11GC4oGHb5O4zLz70HbEQt+C6LojSd4K9A==
X-Gm-Message-State: AOJu0YxUnQS1ztdnceDLEnPiaWzNGVydq3H1skAmOp1D8yZc/QQgXvK8
 5pe9IwLAiVlDpO/yWFlZqWttJTiy0DjORAg3T8oSJhMXQyJckTb/
X-Google-Smtp-Source: AGHT+IHgu03nwowrHJ4hNvbD6J9I7GBjKkJAgtAh3gEv1A3EjqvjMjgBEd/bURK64Y93yv+dakE7Rw==
X-Received: by 2002:a17:906:670e:b0:a4a:3b6e:1fa9 with SMTP id
 a14-20020a170906670e00b00a4a3b6e1fa9mr8425321ejp.15.1712006434693; 
 Mon, 01 Apr 2024 14:20:34 -0700 (PDT)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 n12-20020a1709061d0c00b00a4da28f42f1sm5737881ejh.177.2024.04.01.14.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 14:20:34 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com, megi@xff.cz,
 linux-kernel@vger.kernel.org, Erico Nunes <nunes.erico@gmail.com>
Subject: [PATCH 2/2] drm/lima: mask irqs in timeout path before hard reset
Date: Mon,  1 Apr 2024 23:20:02 +0200
Message-ID: <20240401212002.1191549-3-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240401212002.1191549-1-nunes.erico@gmail.com>
References: <20240401212002.1191549-1-nunes.erico@gmail.com>
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

There is a race condition in which a rendering job might take just long
enough to trigger the drm sched job timeout handler but also still
complete before the hard reset is done by the timeout handler.
This runs into race conditions not expected by the timeout handler.
In some very specific cases it currently may result in a refcount
imbalance on lima_pm_idle, with a stack dump such as:

[10136.669170] WARNING: CPU: 0 PID: 0 at drivers/gpu/drm/lima/lima_devfreq.c:205 lima_devfreq_record_idle+0xa0/0xb0
...
[10136.669459] pc : lima_devfreq_record_idle+0xa0/0xb0
...
[10136.669628] Call trace:
[10136.669634]  lima_devfreq_record_idle+0xa0/0xb0
[10136.669646]  lima_sched_pipe_task_done+0x5c/0xb0
[10136.669656]  lima_gp_irq_handler+0xa8/0x120
[10136.669666]  __handle_irq_event_percpu+0x48/0x160
[10136.669679]  handle_irq_event+0x4c/0xc0

We can prevent that race condition entirely by masking the irqs at the
beginning of the timeout handler, at which point we give up on waiting
for that job entirely.
The irqs will be enabled again at the next hard reset which is already
done as a recovery by the timeout handler.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_sched.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 66841503a618..bbf3f8feab94 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -430,6 +430,13 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 		return DRM_GPU_SCHED_STAT_NOMINAL;
 	}
 
+	/*
+	 * The task might still finish while this timeout handler runs.
+	 * To prevent a race condition on its completion, mask all irqs
+	 * on the running core until the next hard reset completes.
+	 */
+	pipe->task_mask_irq(pipe);
+
 	if (!pipe->error)
 		DRM_ERROR("%s job timeout\n", lima_ip_name(ip));
 
-- 
2.44.0

