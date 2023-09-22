Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E657AA91F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 08:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6E910E02C;
	Fri, 22 Sep 2023 06:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B2310E02C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 06:34:41 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50437f39c9dso662136e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 23:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf.com; s=google; t=1695364479; x=1695969279;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0X0BQrsVOxiQjDtIc1DCYhpQrHoUJ1FNBPQ6K4eAiM=;
 b=XPw41kZaxhsmSeaNaepMU7urQ6uhJBLHQo58C3HMQCv9X5sBgbwNrJCA75WEfAiJ51
 rfZizy0jT2FtB4aBNwOtH0BkGlEu4AviZEtgQuCzZXaAbol6zJ8CYp6MKGa/Q+9KMLJU
 gjeDANFNbs0jLRv3LXss64faiQLlBKExSE6zjAwMn4ssxxjWnXHsfTwwKgsGNavAhmHm
 R1LQnnqYPdd+udyGJhXffR9vYodMh4CqOCIrdaP8B44YfGqIvxboQA8+j6QF/Fzs8kAW
 MUZFjQdX0rlJdTkNrA8Nz875oKm752dL4KNrbA4LcDFA51VsVzZa8Jl6f1VaVYZ7brWE
 DFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695364479; x=1695969279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X0X0BQrsVOxiQjDtIc1DCYhpQrHoUJ1FNBPQ6K4eAiM=;
 b=bIjp6Lm2up5xE035PcOD8OuzRlpXAuO0DdpoQIBh2Op83Gqzmgh1yzOfWE894GgXDj
 jgkO6SZFmr5yp3nBDOB2a0vsR+fWrMznp3nwu5LXxh/ICwXlAfUI2kmcWEf5bI23r7xS
 /Ml9MW0nhCY7xzyTEnqPoZcONUchGmQWO0+xUs/4YQ+bvXS6fl6Y93K9cWSyykfbmx3G
 t4RNb3DeUB0OP+VjhTmgftiyqJs+/fAwFtBy8Z+9BN2hn9RTAOaL2yoP8BYG+apxriwI
 JK4aEYlR/kYPpq5U97k0y6Bk9zDTjJemhrnfcgwRJycfVbi3WsZGoRHxa7gF09ssUJLm
 LS/w==
X-Gm-Message-State: AOJu0YzXbedvb1tTWwxiwZjC8I6A8BrXLyQTxvO8BGmEnwmbiAB+qwuP
 jm6eYcQPiQ91DWY93tLGaVnvAA==
X-Google-Smtp-Source: AGHT+IHIBbiTE5xvp6VdZFE5vYOK4NhSyuG2r1s6YRy3GBiGfUmu9KZWjlhVbjMROpC6z3Eo5K9uMg==
X-Received: by 2002:a19:5057:0:b0:503:2561:c8b with SMTP id
 z23-20020a195057000000b0050325610c8bmr6555667lfj.33.1695364479071; 
 Thu, 21 Sep 2023 23:34:39 -0700 (PDT)
Received: from lmajczak1-l.roam.corp.google.com ([83.142.187.84])
 by smtp.gmail.com with ESMTPSA id
 w29-20020a05651204dd00b00502a96484absm612105lfq.99.2023.09.21.23.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 23:34:38 -0700 (PDT)
From: Lukasz Majczak <lma@semihalf.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3] drm/dp_mst: Fix NULL deref in
 get_mst_branch_device_by_guid_helper()
Date: Fri, 22 Sep 2023 08:34:10 +0200
Message-ID: <20230922063410.23626-1-lma@semihalf.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230921131201.157767-1-lma@semihalf.com>
References: <20230921131201.157767-1-lma@semihalf.com>
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
Cc: upstream@semihalf.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Guenter Roeck <linux@roeck-us.net>,
 stable@vger.kernel.org, Lukasz Majczak <lma@semihalf.com>,
 Radoslaw Biernacki <rad@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As drm_dp_get_mst_branch_device_by_guid() is called from
drm_dp_get_mst_branch_device_by_guid(), mstb parameter has to be checked,
otherwise NULL dereference may occur in the call to 
the memcpy() and cause following:

[12579.365869] BUG: kernel NULL pointer dereference, address: 0000000000000049
[12579.365878] #PF: supervisor read access in kernel mode
[12579.365880] #PF: error_code(0x0000) - not-present page
[12579.365882] PGD 0 P4D 0
[12579.365887] Oops: 0000 [#1] PREEMPT SMP NOPTI
...
[12579.365895] Workqueue: events_long drm_dp_mst_up_req_work
[12579.365899] RIP: 0010:memcmp+0xb/0x29
[12579.365921] Call Trace:
[12579.365927] get_mst_branch_device_by_guid_helper+0x22/0x64
[12579.365930] drm_dp_mst_up_req_work+0x137/0x416
[12579.365933] process_one_work+0x1d0/0x419
[12579.365935] worker_thread+0x11a/0x289
[12579.365938] kthread+0x13e/0x14f
[12579.365941] ? process_one_work+0x419/0x419
[12579.365943] ? kthread_blkcg+0x31/0x31
[12579.365946] ret_from_fork+0x1f/0x30

As get_mst_branch_device_by_guid_helper() is recursive, moving condition
to the first line allow to remove a similar one for step over of NULL elements
inside a loop.

Fixes: 5e93b8208d3c ("drm/dp/mst: move GUID storage from mgr, port to only mst branch")
Cc: <stable@vger.kernel.org> # 4.14+
Signed-off-by: Lukasz Majczak <lma@semihalf.com>
---

v2->v3:
* Fixed patch description.

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index ed96cfcfa304..8c929ef72c72 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2574,14 +2574,14 @@ static struct drm_dp_mst_branch *get_mst_branch_device_by_guid_helper(
 	struct drm_dp_mst_branch *found_mstb;
 	struct drm_dp_mst_port *port;
 
+	if (!mstb)
+		return NULL;
+
 	if (memcmp(mstb->guid, guid, 16) == 0)
 		return mstb;
 
 
 	list_for_each_entry(port, &mstb->ports, next) {
-		if (!port->mstb)
-			continue;
-
 		found_mstb = get_mst_branch_device_by_guid_helper(port->mstb, guid);
 
 		if (found_mstb)
-- 
2.42.0.515.g380fc7ccd1-goog

