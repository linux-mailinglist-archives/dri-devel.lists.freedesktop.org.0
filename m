Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5FF4EEBBD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 12:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EB210E052;
	Fri,  1 Apr 2022 10:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6C510E054
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 10:44:57 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso3233722wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 03:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P0bQwq9+fWC4pQuN+D8QOE/ntondfVbGkexQoq1N7Yk=;
 b=HbG77bUNR/dvt30m/QBpA8piF/+YlegdM96y584csG/mlvjKNRDO73e08vwf0mqs9n
 nXnZO86NQN6IEdJUFwjoCwe4W9FKSFBlFS3rNuGS5UI7HdZLDEONcfRBb1S0Ycl6X0Rj
 ELHtUZPosAVZA0mvitGwH+DXujQ7nVIrLRhaqKsUtxS8C0OFE9vDZh3Eyy+goa737RHn
 zoICzA1/MRKtc/kaKv2glP9OBJkr5rzrnbNpnFzp1Z4Ot2g5NqVtFfeVaaZn/frg0ZNF
 Jq8BdhOuh2oHZaadmdvbJkWWFMDi3aSlPqgbSH5spLmvSjUFi+SR+xfQSbgBTA8Bvign
 vBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P0bQwq9+fWC4pQuN+D8QOE/ntondfVbGkexQoq1N7Yk=;
 b=Jn+KMtnXbca/+l8nZSzIW/Cct/rG2ptSPEk+Epb7/UepJI9noA4TMEUMWjuHmlGkw2
 75Dw3dxm7Zn37DM/tjK9pk7URsfU4w1PwfT1usz4KOMJXCcMVuUZWmJfl2lU/eq0iMJF
 93wAmZqS+MQDLjir+wkfiEDzeIz1Xo+eRhDS2JsijE9b8tbT91nW0JWBVDEIN7+imnZm
 npLTvuY12xNQhR6lTOvARXlJUXj4QTjIweA7WTPcmcT/6VO0qiof2cNBhaDIMNZPdq4r
 mo6ZS0A4h4eqrsmko4jqdNwo2bfAGBh5gMMNWATaAgNf6+b36++U0uZ1fsuiPqA/eP6b
 t5CQ==
X-Gm-Message-State: AOAM531pBbRYh68aEEJckRx6gSZJASTuphzwTKwgewOG9C0Nx/Hd9JFJ
 XRExRQOOWgn2Ry8IevbetXZvKQ==
X-Google-Smtp-Source: ABdhPJx8Wu9Z1HK4Wwe+PIh9B9xFttlHndKGTBwTa4mqUPx4URFuOJdiob/TNuqFx43bLuwIbSzF2Q==
X-Received: by 2002:a05:600c:1548:b0:38c:ef05:4cdd with SMTP id
 f8-20020a05600c154800b0038cef054cddmr8360497wmg.71.1648809895471; 
 Fri, 01 Apr 2022 03:44:55 -0700 (PDT)
Received: from joneslee-l.cable.virginm.net
 (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b0038cbcbcf994sm1538956wmq.36.2022.04.01.03.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 03:44:54 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 1/1] drm/amdkfd: Create file descriptor after client is
 added to smi_clients list
Date: Fri,  1 Apr 2022 11:44:51 +0100
Message-Id: <20220401104451.1951544-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This ensures userspace cannot prematurely clean-up the client before
it is fully initialised which has been proven to cause issues in the
past.

Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---

CAVEAT: This patch is completely untested
        I can't seem to find a configuration strategy to compile test this
        allyesconfig and allmodconfig do not appear sufficient

v2: Also remove Client from RCU list in error path

 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 24 +++++++++++++--------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index e4beebb1c80a2..f2e1d506ba211 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -247,15 +247,6 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
 		return ret;
 	}
 
-	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
-			       O_RDWR);
-	if (ret < 0) {
-		kfifo_free(&client->fifo);
-		kfree(client);
-		return ret;
-	}
-	*fd = ret;
-
 	init_waitqueue_head(&client->wait_queue);
 	spin_lock_init(&client->lock);
 	client->events = 0;
@@ -265,5 +256,20 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
 	list_add_rcu(&client->list, &dev->smi_clients);
 	spin_unlock(&dev->smi_lock);
 
+	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
+			       O_RDWR);
+	if (ret < 0) {
+		spin_lock(&dev->smi_lock);
+		list_del_rcu(&client->list);
+		spin_unlock(&dev->smi_lock);
+
+		synchronize_rcu();
+
+		kfifo_free(&client->fifo);
+		kfree(client);
+		return ret;
+	}
+	*fd = ret;
+
 	return 0;
 }
-- 
2.35.1.1021.g381101b075-goog

