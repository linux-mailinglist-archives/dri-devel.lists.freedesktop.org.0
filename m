Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF17C574AD9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 12:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B8FA4513;
	Thu, 14 Jul 2022 10:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C7AA44F0;
 Thu, 14 Jul 2022 10:39:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id fd6so1845365edb.5;
 Thu, 14 Jul 2022 03:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D0VUGuB7I+46QM9Co1vKV9PV2n4nlmM9Nx3vJwbLP0o=;
 b=ItNhV432/64GNp2RIRXd9yEoug9FQvsHB1HArozYYj51heQSBOkw79CHXZyjgA4qfY
 qT6bnSdZn6LYi3nUyee57g7UytOefF1eVCLwIV/RM14vSeVdnxsGfYJ/BQSzLp5WHU9f
 93DphTU845qBBbmSTlYvlvxzAdVlmZAiRRt8BR4AqJeLB6FlNzIHoI/k+K6pEJalaSDr
 jYGXAim/t7AsH0lTJYM9Cr/01Z7gy9q2wj75SZ7bkzarufobrx9fZQlvMOxXK4cfNP+D
 K5+hIFbKjpW/I5OmBLIuHmj0SvP00xkR9B+HKFn8pkbnkobe212mcoZsyHWY0g1/79pu
 nOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D0VUGuB7I+46QM9Co1vKV9PV2n4nlmM9Nx3vJwbLP0o=;
 b=4GifhSI9ESKpy7E/doZATMRl2kUEzVQQNjWnDR00wPpbBbncTREABEcZwnnB1kV5IJ
 1eP2NYTtwDqLVyXApxMVkNXGvxwYBYVYvLgIsb62wHpMvlfB0jNGrx/bx+7TU1jFJhXQ
 RAqVGyWmS7uXu4XWpMPW+cTlJsXkLlu0DPefZn/FLbmtDxadqNgjsGrlruu2+KobiitZ
 VoKAaXbo6DavyFmiqkVw1zgLCDWe9EjTUHyEpW6FkjNQIOI8I+dgu04apjq/QfadLlrM
 5GV+uKpSafocJBg3C0jIIMDFt/un+4hpc4Zwt6pPu0K5VIVYUKGvRNJQvPJUkvbivyCi
 kzIw==
X-Gm-Message-State: AJIora8ImEppRI2Kpnb/HWI/EhXyWoS31ReDIjq3BsEVq49z9RXenX1E
 VMCaipEnzx3zVMPc1uWhbWz9HZpyZ78=
X-Google-Smtp-Source: AGRyM1s6ibfPe2I0iR7x/yxxJ3v4wrUITyioynktDOlgXRck236LSmxEQfgdo/JLN5DVDH3cuL32dA==
X-Received: by 2002:a05:6402:4245:b0:43a:961a:583f with SMTP id
 g5-20020a056402424500b0043a961a583fmr11462328edb.374.1657795145862; 
 Thu, 14 Jul 2022 03:39:05 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 z13-20020aa7d40d000000b0043adc6552d6sm799487edq.20.2022.07.14.03.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 03:39:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org, Marek.Olsak@amd.com,
 timur.kristof@gmail.com, andrey.grodzovsky@amd.com,
 Yogesh.Mohanmarimuthu@amd.com
Subject: [PATCH 01/10] drm/sched: move calling drm_sched_entity_select_rq
Date: Thu, 14 Jul 2022 12:38:53 +0200
Message-Id: <20220714103902.7084-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714103902.7084-1-christian.koenig@amd.com>
References: <20220714103902.7084-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already discussed that the call to drm_sched_entity_select_rq() needs
to move to drm_sched_job_arm() to be able to set a new scheduler list
between _init() and _arm(). This was just not applied for some reason.

Signed-off-by: Christian König <christian.koenig@amd.com>
CC: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
CC: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/scheduler/sched_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 68317d3a7a27..e0ab14e0fb6b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -592,7 +592,6 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner)
 {
-	drm_sched_entity_select_rq(entity);
 	if (!entity->rq)
 		return -ENOENT;
 
@@ -628,7 +627,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 	struct drm_sched_entity *entity = job->entity;
 
 	BUG_ON(!entity);
-
+	drm_sched_entity_select_rq(entity);
 	sched = entity->rq->sched;
 
 	job->sched = sched;
-- 
2.25.1

