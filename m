Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6885E527C48
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 05:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EFF10E1D0;
	Mon, 16 May 2022 03:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1966C10E1D0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 03:21:14 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so13096907pjq.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 May 2022 20:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GpDUSimbrzEPEd3o17+4lNfr+RdsexkUxYvwoe9kHpY=;
 b=GDhlqPSck9+19ik3Lm/u0hqP35Hb8ewA/ihWbx7jo6/1gXcOdZGFtJ6qNk37b3tCDG
 75YQHEwjHW1ZN+gLhtfo1Tq2Dm4yUQbwAtEtS2mw4HSYwz2nZdRijXpY3nVtSjjdzsjn
 N0UOPUDbdKJ4VnVkQeYp/Au63B8n9pUmodp2Q69+xanZwOd/UlHqeyGm/TqMbeQ1wp31
 U/MfQ+x1yz5ATrFThS4Y9x5+pBL4WEeJUCQ67q3XU3gOD9wbAiIdH3SdMauzXwPLourS
 wYts5dagziiVEjjxrpvRA+uupjMCvjlR7lC+rb7+GjOrK6D1Y+HF/X4SRlIJPJaopWyG
 bNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GpDUSimbrzEPEd3o17+4lNfr+RdsexkUxYvwoe9kHpY=;
 b=WP2ZbZvAF1soEVkiLOcp0nE9NkgpWHBWqvFrhc8hcXq1yhAl3uQDh9pbI/9QO7wKxh
 LZJyChMvEJkGtZ+/Y9xq6lNKX6jvbamiwVPFn8qRH3E3bt9c5hhHzVkNkhZMlMWBLaIq
 LAWnSJ0/PePvoAx9YYh86OQGnwaDmyKakR03Pj3XxF/17LUvCevGZCVSkdmlHTM4z2AO
 JluhHYCYoeFWMzoDFHxUbcEYabnka1vsDBNpxH+WWuxQj4tz2xeSR9AhL512FtO2DGlS
 5gTRkqNl6cbAHh2J2EakraSuyTOGICedS1US/oxwk8b4vGfFGN8uC/lEIAKUofe04OV6
 P2iA==
X-Gm-Message-State: AOAM533GUUtLpsp9FwrMiRaLDbFatIAsajTpN0n2USosjs5q54H4MBZ1
 rh17g9LdmPlNx6GkKDcAHFQ=
X-Google-Smtp-Source: ABdhPJx78R8siU/VX2wrXmCmzFaypYMY6otsvG0bnoou/lanFR0mXroANYhKF69EHrKcre9eNMwCsQ==
X-Received: by 2002:a17:90a:ba88:b0:1df:4302:4970 with SMTP id
 t8-20020a17090aba8800b001df43024970mr5159325pjr.227.1652671273709; 
 Sun, 15 May 2022 20:21:13 -0700 (PDT)
Received: from localhost.localdomain ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 y200-20020a6264d1000000b0050dc76281easm5604430pfb.196.2022.05.15.20.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 20:21:13 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, lyude@redhat.com, tzimmermann@suse.de,
 jani.nikula@intel.com, Bhawanpreet.Lakha@amd.com, Wayne.Lin@amd.com
Subject: [PATCH] drm: dp: fix a possible memory leak in fetch_monitor_name()
Date: Mon, 16 May 2022 11:20:42 +0800
Message-Id: <20220516032042.13166-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hangyu Hua <hbh25y@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_dp_mst_get_edid call kmemdup to create mst_edid. So mst_edid need to be
freed after use.

Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/gpu/drm/dp/drm_dp_mst_topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/dp/drm_dp_mst_topology.c b/drivers/gpu/drm/dp/drm_dp_mst_topology.c
index 11300b53d24f..7a7cc44686f9 100644
--- a/drivers/gpu/drm/dp/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/dp/drm_dp_mst_topology.c
@@ -4852,6 +4852,7 @@ static void fetch_monitor_name(struct drm_dp_mst_topology_mgr *mgr,
 
 	mst_edid = drm_dp_mst_get_edid(port->connector, mgr, port);
 	drm_edid_get_monitor_name(mst_edid, name, namelen);
+	kfree(mst_edid);
 }
 
 /**
-- 
2.25.1

