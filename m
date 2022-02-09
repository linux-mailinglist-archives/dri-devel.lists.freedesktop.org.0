Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE1B4AEE11
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABEE10E567;
	Wed,  9 Feb 2022 09:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC1010E41E;
 Wed,  9 Feb 2022 09:37:28 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id fj5so2657002ejc.4;
 Wed, 09 Feb 2022 01:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1wSk9Xt36kV2FvjM9SY4Lo33UdRRx+CQTWW3YPXvCO0=;
 b=n+2+K1LbOOGjMhhnhmy75fEPspPfelWutSaVthdX8ZH/jfoZRfKHhJImYbGd/NgGb1
 oJHmrkMdLvp5lh+dhqCRvSmG/BW9ejhZyHVXox8zD3O92aYkYGwv5q4GkaIyOLTWHTtX
 V/6g3kQlYq4xaR0ahQdbrAoSbWco0zq+eVCpxfluOJQv2Yu5O4LtHXSvrDDn6KOsQRaq
 fnR3uFQxk4R6KNMXwqe53CVUxBnMOQzxWuWbKhcjeqW1/SGSbXDti54VeMsKL0uCd/Gd
 nw+jTZHyER3+vj7Q7ctdc68UmXaqG19apfrvZI6iWm4K9SnAKOtL8sbP67rZyqeak/pe
 uuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1wSk9Xt36kV2FvjM9SY4Lo33UdRRx+CQTWW3YPXvCO0=;
 b=s2kik8/UgInmgnw4E7Zvy9e8MEJ026OkU+r0DL+KM6gtQQo+ieb5/ucrenf8/iq6Kp
 IGiTe2HnTipvvHBK3QlN0KcTAK3HkjXcvowB0oL4PNqTTITCVqsDIQSAOI+zKB1qUJka
 yruTy/5LhG0Bg0MG13/gR+Fb9w4zHeBZ6GKqmT7hslwKszTNYIVETgWvH/mf7pJwOxLM
 D525JaPWRL11AqmdxzKwSfzdN0eN0WHLWiFr7aFFzEjt0cf3L5wYBbkOV6vxNP7shpNf
 5RpNGm0xQ3VQp83JUxARk/iT0bsXLKZcaNvP4GJrPc19sKyJBoBgnAiMiIE2p+q4t+5z
 dbAQ==
X-Gm-Message-State: AOAM531WJaTxjcwm88ht1TJkCvjz7ZsPXdkURjo0xJCVrxBuTe4cx8+3
 uBYflahNcvImwxpoqovCMWt2IeTwHiA=
X-Google-Smtp-Source: ABdhPJwcnYNE2AzwYK9ERVMWT8V7BA7ZG0ZB+m32USahYgA7PpW7yWLUPnjZUE9xN6SJHE/1varxSg==
X-Received: by 2002:a17:907:e91:: with SMTP id
 ho17mr1149690ejc.442.1644399447527; 
 Wed, 09 Feb 2022 01:37:27 -0800 (PST)
Received: from centennial.enunes.eu (ip-78-45-67-25.net.upcbroadband.cz.
 [78.45.67.25])
 by smtp.gmail.com with ESMTPSA id j24sm397106ejo.106.2022.02.09.01.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 01:37:27 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/lima: avoid error task dump attempt when not enabled
Date: Wed,  9 Feb 2022 10:37:00 +0100
Message-Id: <20220209093700.30901-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently when users try to run an application with lima and that hits
an issue such as a timeout, a message saying "fail to save task state"
and "error task list is full" is shown in dmesg.

The error task dump is a debug feature disabled by default, so the
error task list is usually not going to be available at all.
The message can be misleading and creates confusion in bug reports.

We can avoid that code path and that particular message when the user
has not explicitly set the max_error_tasks parameter to enable the
feature.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Reviewed-by: Qiang Yu <yuq825@gmail.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
v2:
- collect review tags
- update summary line to "drm/lima:"
---
 drivers/gpu/drm/lima/lima_sched.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 5612d73f238f..12437e42cc76 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -409,7 +409,8 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 
 	drm_sched_increase_karma(&task->base);
 
-	lima_sched_build_error_task_list(task);
+	if (lima_max_error_tasks)
+		lima_sched_build_error_task_list(task);
 
 	pipe->task_error(pipe);
 
-- 
2.34.1

