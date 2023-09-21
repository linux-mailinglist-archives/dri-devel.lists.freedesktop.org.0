Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBAC7A948F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 15:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C0710E00D;
	Thu, 21 Sep 2023 13:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4175510E00D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 13:15:00 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso15886461fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 06:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf.com; s=google; t=1695302098; x=1695906898;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WFVgUoZXc2lZ26/cSu4xiqrrdHCsCggsCjjkAVBqrLs=;
 b=QNFI72OOihS9DVK45VoBcBgQLB92ELN5jRumLXb82WeJNjngCv8Baqcj0ijviYp5Kf
 5OVuDTa2SRIZDuczC5Tj4qQAfMtgvecsVEnGFNMkBamydkK5ByTOUMkPyJRPG+FvC7Ce
 4mtIOBSbcdLkhlsnkk5rskWxTrK3c0KB1vaPusb9eBfxdBm8ZtejJLBz7gCRaTjppIQL
 SimXQYzrqVcnUdNxo2bIW6jC8gijOeA/YMYgkPxK88mbrGYCzl3+hohikQ0Nzz1+GRPJ
 AvvVe1GHAsa4pzBsJKKZsHKHQexepJt06rbN4u/aqA7cKJK+jruO3f3BZhaIMP4XyoZy
 0r/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695302098; x=1695906898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WFVgUoZXc2lZ26/cSu4xiqrrdHCsCggsCjjkAVBqrLs=;
 b=JfjnOdItWxcIyTdGFftYwPT7v34uuOMo3s/BiJSl2ciNaiVWAnTznDMsY1pbc9uaLz
 OG2OnH/jYpGvPIEZGwawGFrPWb3WEsPhkxpPt7b0WfugicbH4qJa6ZcgZ4LB8tkgXb4t
 kW9vu0ZvjOpQiYfl6mSsPKUe5bxEsCbPU3T6Qa0uUsF84sB7z8UXo9IvWO6k+5uW6uBX
 F2dk3QOUl1xeayPdb5JmJmFJ2gACJjZ9ofSIzNMolHri8sGWLByKM9LKxxBusVdIu7Nf
 +TUI9yfmzO2qNoSbUFnkdDFyniLSFi9D/E843w2ZgNjw8xOgN1UJfmpXr1Ti3prvTCeH
 qLSw==
X-Gm-Message-State: AOJu0YylAyaFTS/liA992Kg7UjN7nB4ix7/6UZsG/Ux7ofHhj1r8AMX0
 cOZWOot/86OtjhJXe8v2ZgR5Sw==
X-Google-Smtp-Source: AGHT+IG+jYIPjkgn0M12s8Ys2ja5dB9bWaQ5rSJsS5l6XeLlbcGnwF3n1KXzusjdihwBHP9XfXeXwA==
X-Received: by 2002:a2e:878d:0:b0:2bf:ec8e:97c9 with SMTP id
 n13-20020a2e878d000000b002bfec8e97c9mr4738193lji.17.1695302098400; 
 Thu, 21 Sep 2023 06:14:58 -0700 (PDT)
Received: from lmajczak1-l.roam.corp.google.com ([83.142.187.84])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05651c10d400b002c01ff8442fsm337732ljn.130.2023.09.21.06.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 06:14:57 -0700 (PDT)
From: Lukasz Majczak <lma@semihalf.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/dp_mst: Fix NULL deref in
 get_mst_branch_device_by_guid_helper()
Date: Thu, 21 Sep 2023 15:12:01 +0200
Message-ID: <20230921131201.157767-1-lma@semihalf.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
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
drm_dp_get_mst_branch_device_by_guid(), we need to check mstb parameter,
Check mstb parameter, otherwise NULL dereference may occur in
the call to memcpy() and cause following:

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

