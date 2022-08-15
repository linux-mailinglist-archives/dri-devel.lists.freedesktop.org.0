Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B55935F7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 21:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071C3CAD02;
	Mon, 15 Aug 2022 19:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BB4D2547
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:59:45 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gk3so15038456ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 11:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=kBJ8MKPMTc/ljm1Je/dqVW7iOpGuBGK18C7LP1VWBRU=;
 b=o6y9L1dCIsxt/hssK/2ad5S5Aqlzp/qJogNSvunzY0H+0tr6oSVNNPBPyAOSnT+O2i
 ec3F7bGw20lOcmJOhIyGGHVX1Z4K+aFWemSUKiwEaIiMMUCTR5NRjAS38MCfnglkqH+T
 su01GHsIkoYn8z2Vu77QGo6CoS6Sd76b34CyYVWFSl1nHzf5fO9ffmeb48CeCi2NJS4B
 CmT+1hrki73Of6XzX1gr42WsMA4XDiTzGtsVFCClqeRFF74N8qoSo1KxesCc7FvRgact
 87WyL76l9itSEwpt4cIOA3GlKfOaR+UcAkHtSFJKiXX++lSe/5KFejTv+8BOo1Vl+NqG
 uchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=kBJ8MKPMTc/ljm1Je/dqVW7iOpGuBGK18C7LP1VWBRU=;
 b=MpZQr5MwYFFr8vj/h1wFRy6DrwXRrY6+CNfd2+JsMcZMq6+stGsBaK0UP+ASbeQN7n
 cuK5Q79P+QcuMsL1ubgvM2Gdycb9pGZWnRVBhJgu18aBP9LrF6sgIZP/BT6+Y/xjOlfP
 4uUulkOS9jCaycqEDohGln8jbwSV5pQcHJTDhonmf1TkeXPC8MPb2wxfl5AcXRt3j4vv
 0mbKpb30LJ+vocYES3CaoTOV3WyHgnTfPsJGeeUdrDQIDqn4yjVRfcu5jLtdvW8N5ROS
 J+EGemWnPAvNi4VcAvx8kCnNlcWdL+BEnq0JE1KQC8Z+MZmtTMwgXPir2m/jtPadoGKF
 S6Lw==
X-Gm-Message-State: ACgBeo0P4VSgmLVJqvpcEg8M1kFqX+V90JWLRn3+89KYInC9baOubltO
 IQecSB4srZC7Q2V82GNSPPlk4yuyfBg=
X-Google-Smtp-Source: AA6agR6EGJIrwQa9P1P7xUXJtXUlNRDWVshIsyWyMdz20PBAZbPnfj3PYn+BkeRZ5wHjocoXavsYuQ==
X-Received: by 2002:a17:907:2d8c:b0:730:f00f:7ab0 with SMTP id
 gt12-20020a1709072d8c00b00730f00f7ab0mr10888535ejc.611.1660589984163; 
 Mon, 15 Aug 2022 11:59:44 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a170906304a00b00731745a7e62sm3553805ejd.28.2022.08.15.11.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 11:59:43 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/10] drm/sched: move calling drm_sched_entity_select_rq
Date: Mon, 15 Aug 2022 20:59:31 +0200
Message-Id: <20220815185940.4744-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815185940.4744-1-christian.koenig@amd.com>
References: <20220815185940.4744-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already discussed that the call to drm_sched_entity_select_rq() needs
to move to drm_sched_job_arm() to be able to set a new scheduler list
between _init() and _arm(). This was just not applied for some reason.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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

