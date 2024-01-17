Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636ED82FF35
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 04:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC8C10E61E;
	Wed, 17 Jan 2024 03:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDAC10E60A;
 Wed, 17 Jan 2024 03:13:21 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-559c6b833b0so912285a12.1; 
 Tue, 16 Jan 2024 19:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705461140; x=1706065940; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=przBstviTKeMKG8hsGaQhziOmoZ/mS6n5cQDIFTsogA=;
 b=aLZEpVX8+VmRuiNmSbi9CNtoDdEW0h9+T8rDUSkVh/YcNDdEcdhCEnV2LNKb0+Wic6
 /i6PMpF+U04jQk8ZYIMqSBMJUHWrP/2uiRtPVkz0S8QBXiQdhyueZR9CRttv6lfRuclG
 A6RdBgkHqCMOFAzyBie7F4lLRM7D/M58ZdlTFDC4UJFihPy7fmvmiMNykdAN+KUlHjUn
 uTuPc7d6N0vrRODRvPrQsvraOwiTSp+fqy9MiAT0M135CSnzrqvBuyl2UU4fJMWRQVdk
 jhyklziMijQhutXLD8bgBbh388trHOK5w1MALkIEPAFGEcyHDNX7BTZVAhDu9xVDLvEX
 k3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705461140; x=1706065940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=przBstviTKeMKG8hsGaQhziOmoZ/mS6n5cQDIFTsogA=;
 b=g3PonX7p5IAYnUDaCofS2um1sdbyg9BhCEYXRirbUdKgPGOTE7LWiwLjBbK1yQqOG6
 ilniCu7HpXm9YXbGbznIDptyGVmNIojkJBtmhwgeIMrA3NnwhVryVoDQUf++eE1TPBb7
 63sQ/vPIGvfHZl0skKhodiZMzX26wSIkHQCu3c/3H0MsbZ+odb/dVX3F3dl6n2d1UehS
 bl7Mwve7lVU1yRW2EmDZRyP/OnGhRwnG2Xlx8MyVG3BB1StcwVrN9CE07Q8VLuCyMzFD
 UP1/0SsATeZxx/HrlxnWBgM7mXe+J7hP/V2kZbmSzHMRf/56+MOSWwdapL96ittZnaiB
 iUNg==
X-Gm-Message-State: AOJu0YwJxkhcb87lmPa91pdjcTceCn/20++2AE4MhMQcqpsUNBiAk1Yn
 URvZg2A9RgAzHchEDwa6yDU=
X-Google-Smtp-Source: AGHT+IH4g37ccsIH+5nDtEbHrV7ecTiL8sxw2zhnvaeOkN2UzCLivl5+Qf3In+6yBdstgOn6oOKFFQ==
X-Received: by 2002:a50:9fc8:0:b0:559:ba97:7219 with SMTP id
 c66-20020a509fc8000000b00559ba977219mr1010135edf.48.1705461139900; 
 Tue, 16 Jan 2024 19:12:19 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05640204cd00b0055971af7a23sm2258418edw.95.2024.01.16.19.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 19:12:19 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Subject: [PATCH v1 1/6] drm/lima: fix devfreq refcount imbalance for job
 timeouts
Date: Wed, 17 Jan 2024 04:12:07 +0100
Message-ID: <20240117031212.1104034-2-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117031212.1104034-1-nunes.erico@gmail.com>
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, christian.koenig@amd.com,
 anarsoul@gmail.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case a task manages to complete but it took just long enough to also
trigger the timeout handler, the current code results in a refcount
imbalance on lima_pm_idle.

While this can be a rare occurrence, when it happens it may fill user
logs with stack traces such as:

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

The imbalance happens because lima_sched_pipe_task_done() already calls
lima_pm_idle for this case if there was no error.
Check the error flag in the timeout handler to ensure we can never run
into this case.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_sched.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index c3bf8cda8498..66317296d831 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -427,7 +427,8 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 	pipe->current_vm = NULL;
 	pipe->current_task = NULL;
 
-	lima_pm_idle(ldev);
+	if (pipe->error)
+		lima_pm_idle(ldev);
 
 	drm_sched_resubmit_jobs(&pipe->base);
 	drm_sched_start(&pipe->base, true);
-- 
2.43.0

