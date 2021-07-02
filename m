Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37373BA52F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 23:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96BF89BEC;
	Fri,  2 Jul 2021 21:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE34B89FDD
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 21:38:32 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v5so14064666wrt.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 14:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z46U7iLTFi0yXehsGxlE3ofdOKYitcZKrvFOhmdKh68=;
 b=TopjMaysAbnnJdNEvpBTUTdcICmtClLEr7k9f50lTHN4meXjjHS8+TqHtiaJGotjSl
 ecD+XGDoF99fFvKWzXHqrzCQCuc35AbfRjhJMbd5Mq5Fz/Pz1CLuuHDSavvcc5Lo+2fT
 fr0+MninltLMml0QFZ/EIUfjaJLWgILx8A9TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z46U7iLTFi0yXehsGxlE3ofdOKYitcZKrvFOhmdKh68=;
 b=RPJ1I57ZsMt+ndC/UzA/dgz9JrnhsJX1OeakvGcUND8yuv92d4gOr/eCRO7wJTjmOG
 WLCijI07NkbgmBEvuHqLAbYYysQCiRY+sZ4jOXf4n6Cbh+lGdAy2E/uKgJ/+RK9cnpPv
 n9VRxtsS2T6/isaBsy59Wg8qk5OvGIBpB2psDAZ1R1MM9XIpEn6md+jr6v3gdj6PnyYO
 072ngqZ1AkkGUpPmTyHLpdrW+XoVMZWn32TLQQfr0pG1k/sZANXyH2Cth6HP807n2280
 Bq4Ao3k6nIlqIk/CyC/SaApfggriTaCPn2hMx0rgDNaAc86Gv/AofirAYLiH3VKWUPwe
 VlKQ==
X-Gm-Message-State: AOAM530Sm/cLCxLUi+DE1SRj9S5w02Cy4LwCGdTJz39TYYgK05pDy1FQ
 QPOxF0eCuSQMznXu95y0mXb8+KO7Soc+dQ==
X-Google-Smtp-Source: ABdhPJxxN1u/0/BCju7IxlxXRXWmrz/jYv3k9mftgzntS9lBCe39gscDmYsWFwYmlehTeFDX1D7UVw==
X-Received: by 2002:a05:6000:120e:: with SMTP id
 e14mr1777285wrx.139.1625261911686; 
 Fri, 02 Jul 2021 14:38:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n19sm4007222wms.4.2021.07.02.14.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 14:38:31 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 11/11] drm/sched: Check locking in
 drm_sched_job_await_implicit
Date: Fri,  2 Jul 2021 23:38:15 +0200
Message-Id: <20210702213815.2249499-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

You really need to hold the reservation here or all kinds of funny
things can happen between grabbing the dependencies and inserting the
new fences.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jack Zhang <Jack.Zhang1@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index de76f7e14e0d..47f869aff335 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -705,6 +705,8 @@ int drm_sched_job_await_implicit(struct drm_sched_job *job,
 	struct dma_fence **fences;
 	unsigned int i, fence_count;
 
+	dma_resv_assert_held(obj->resv);
+
 	if (!write) {
 		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
 
-- 
2.32.0.rc2

