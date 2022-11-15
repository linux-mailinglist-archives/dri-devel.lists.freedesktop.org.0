Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33D06299D3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0112D10E3C9;
	Tue, 15 Nov 2022 13:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA98310E3C9;
 Tue, 15 Nov 2022 13:16:04 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id cl5so24192541wrb.9;
 Tue, 15 Nov 2022 05:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lDR217x86eHv/O2MIJhnIDN/LEOiRAy9N41xfhJ3Nqk=;
 b=YyWv9BqEL9CrEcH+u2dhpebWMAeYJ29kCNHj+Rk5fRm4KofEXDKHzUcvg9c2kwkf36
 dM56gfOKBqDYI2OF8FinIh1qM98PPgztfN6sAJE8INImFZ42TtA/1jo/aPLTGVVhwbHC
 dYEQbUMJkp47JbH6E5+LvJurNunoxC2uSnMhSkf/L8D0GXeO9ANO2uqYe8RYHOhJR17N
 Q02RCbKZNnBEu7uNz7ck0GRSDsB5BuvvdHRCznEi8XfYhSshT6lUMiVW7dU7E/FA8aiP
 /0pwjpAScfINHlPpH3wrCTZzAq6b080jjkPxGKjub1c11yrLO8us9FoP5fXs8WnTLpoD
 bUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lDR217x86eHv/O2MIJhnIDN/LEOiRAy9N41xfhJ3Nqk=;
 b=SdIK0hTVijPxAgLsM9AUrkAAe9WneZitoSHAqXqR5Yo0s7Mz1lL14XhUgDDkuFyh15
 Locpm6eNrfqPM/ZRJQnTUPnkslQCWNROQZs590CVcqlZ5rkHwN99NO2ens3vqS6MGBdZ
 64YRw7sZBb9LcQwAwZW8ge4jRAGVCGo6/SJOXYq7MDaTMMKB0u4Cv8ic8zHU/JlY3PyN
 HGKM8ek6vIhFuAR474L7hkfOx4oaU2tGWe3+wRdsutJZO/BHH3qgEGzCxKOK2o+VZNsq
 1R6GRm7/cnZ3vtt5rndlgt+hw8sBtMz27bXGtpPOHXk6U6vnOFL0wSUsE6tNNmGgaXvm
 82WQ==
X-Gm-Message-State: ANoB5pm63basHlCiwVuo0smaozVPktSjoEbFYzmQxzTwXWGpFn8ylB9m
 OX4lQmIODUswdv0Y4/4R1AU=
X-Google-Smtp-Source: AA0mqf6anvzacpwGbfPmwCJwNcs0zplfHCs35EcuMnktxA5cZzn2SR5okgnQ2mmLJOdidn4tV5o4uA==
X-Received: by 2002:a05:6000:18c5:b0:23a:cdf5:3676 with SMTP id
 w5-20020a05600018c500b0023acdf53676mr11416313wrq.336.1668518163349; 
 Tue, 15 Nov 2022 05:16:03 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 v10-20020adf8b4a000000b00235da296623sm12429028wra.31.2022.11.15.05.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:16:02 -0800 (PST)
Date: Tue, 15 Nov 2022 16:16:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau/fifo: make nvkm_runl_new() return error pointers
Message-ID: <Y3JdtQYrWonlhwW0@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All six callers expect error pointers instead of NULL so make the
nvkm_runl_new() return error pointers as expected.

Fixes: d94470e9d150 ("drm/nouveau/fifo: add common runlist/engine topology")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
index b5836cbc29aa..adc4a9544ebc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
@@ -399,7 +399,7 @@ nvkm_runl_new(struct nvkm_fifo *fifo, int runi, u32 addr, int id_nr)
 	int ret;
 
 	if (!(runl = kzalloc(sizeof(*runl), GFP_KERNEL)))
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	runl->func = fifo->func->runl;
 	runl->fifo = fifo;
@@ -419,7 +419,7 @@ nvkm_runl_new(struct nvkm_fifo *fifo, int runi, u32 addr, int id_nr)
 		    (ret = nvkm_chid_new(&nvkm_chan_event, subdev, id_nr, 0, id_nr, &runl->chid))) {
 			RUNL_ERROR(runl, "cgid/chid: %d", ret);
 			nvkm_runl_del(runl);
-			return NULL;
+			return ERR_PTR(ret);
 		}
 	} else {
 		runl->cgid = nvkm_chid_ref(fifo->cgid);
-- 
2.35.1

