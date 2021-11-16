Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 454F5452DF4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A796F388;
	Tue, 16 Nov 2021 09:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6446F388
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:25:22 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d5so36225796wrc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 01:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+cijQmXYTeZ+AQqYb/VwOzFSNW0ZQ9/yUBEUK1fJBwg=;
 b=TVJPHWlY7G4FA8yDKBJyEUDcjDjoX2vM2clEhfIJZET+TdnVUX6lJUYgPV9WSZXO8r
 wtG+6yHNb9scnHQfWMBbn10aku8kN27s9OhxNpkau6E/lL0nP3mLLPM1GeflWv6bPWP8
 xHaNpFg20FXWmcgmv+eukpYHQzmdmVHl7KLsZakbsSISPFJM1LhirOD467nsgfntbpw7
 ds4OEOSdqvbYtwSKVhWwbTm98wQhZQ8tTw0K8sRsyZOXS9/BMnL0xi0gnfDxggA9EFei
 KN+y6sGGiJZfiI+9/IPwIJ+5sQbI3rm4N5mZ6hqimo89j7OWcLc4Vo18h9tZ8b8TkCzr
 91Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+cijQmXYTeZ+AQqYb/VwOzFSNW0ZQ9/yUBEUK1fJBwg=;
 b=NaXllf2Vauj2LfaVBfNSuRaMQvWjtyNAmwKOwp+1dWudtdbK18bSzesU3Lq5TdgJ7i
 cLwJYea2BwARyccw8Y1UEif/JwDaYEG+IRoLXfPv80HZgpoQdCBy0DbR3Y7rw2wDzzQ2
 REDgXfqdaz5/r/rbTL38ROZyiKWYLVKLJ6e/hWPU26hSJsUfso8qUmkxKKbIYatL310P
 sd44/DIagm8SRRom3s8/gZOQX8A6qNU7hjv5okjTwOtLR/tLIfBuZCX8NojK5m4ITMBF
 BH97mjpzGSBs31KeOCld9oHK3t5iUDj+0tKEkyNbLghXLmhKPyDD81o3CvNs2XjhopP2
 tECg==
X-Gm-Message-State: AOAM531oQYH6/qqLz0hiCcCd/DbXjrlCWfPrGcz1uklRYvCBb6GlrsjM
 QffeQD/qwKOrTcpV/KOHiTID91RtLdw=
X-Google-Smtp-Source: ABdhPJzpR+8Glg6dTcH4p3S2eGr1J7ISxsqkiJjVXoonX8LlnZQ29DY4BmS2t+g667rV2Ii/hZdVBg==
X-Received: by 2002:a5d:64ed:: with SMTP id g13mr7605810wri.222.1637054721237; 
 Tue, 16 Nov 2021 01:25:21 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id e18sm16986736wrs.48.2021.11.16.01.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 01:25:20 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, daniel@ffwll.ch,
 frattaroli.nicolas@gmail.com, y.oudjana@protonmail.com
Subject: [PATCH 1/2] drm/scheduler: fix drm_sched_job_add_implicit_dependencies
Date: Tue, 16 Nov 2021 10:25:18 +0100
Message-Id: <20211116092519.99206-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Trivial fix since we now need to grab a reference to the fence we have
added. Previously the dma_resv function where doing that for us.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 9c2ba265352a ("drm/scheduler: use new iterator in drm_sched_job_add_implicit_dependencies v2")
Link: https://patchwork.freedesktop.org/patch/msgid/20211019112706.27769-1-christian.koenig@amd.com
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reported-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
References: https://lore.kernel.org/dri-devel/2023306.UmlnhvANQh@archbook/
Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 5bc5f775abe1..94fe51b3caa2 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -707,6 +707,9 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 		ret = drm_sched_job_add_dependency(job, fence);
 		if (ret)
 			return ret;
+
+		/* Make sure to grab an additional ref on the added fence */
+		dma_fence_get(fence);
 	}
 	return 0;
 }
-- 
2.25.1

