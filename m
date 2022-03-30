Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E804EBC22
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 09:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C8010F599;
	Wed, 30 Mar 2022 07:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A9710F599
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 07:51:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id w4so27968269wrg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 00:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C6A0P5Nugt3q0KDLO33UJFcQEQx63LX/0cNUolmrKWM=;
 b=V16MaX+hkN/U1Y39xaECqqNIGuGZn7Y8hPlKTULdPk5qbq8anVYXQfHLRMtoe1Ig4W
 Sfd9WfI81jqiAeEtYcjI3kq1h+xMrU+O962hOtF5wLxBZEbUplHfPcBRr7uInR1VP9y/
 vmIvR7iBpaVxm1QUh9I1DP/61+Rhw27+n56Y5uUCXPNRcpSdnFxtjCkkaOuK4/JaStkT
 /ubjCpgaQlbFjnc7q1EtTVNvWkQWBAIJhpwAGuE1GIEGXCVXsvyf52ldTRLZR64dq7zG
 bgfrrho0pUtuloTOPd/nwjX/hw2HDqccsiayW8zaeySMZv2hrMSTybaa3I5hxTbB/B7j
 bkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C6A0P5Nugt3q0KDLO33UJFcQEQx63LX/0cNUolmrKWM=;
 b=HaLyqWg4Q63SCin+IUZQEaKAWyXFrXXwBfxXgPGVWsR207bZufMWPD2VnYGzcgGGZz
 eHVrzdfFlwXGC0ycopmm0h8anuhM508mWw1quHs4qN1F+Xdv73sM7TYx3AfSRmB9RAQZ
 38CFK1DCv1ZRQKhHr8wd0ZMuULRSxG5H2aOs5q+kk9sKGJOOUlvfFQxvOK4yk4PRNgzi
 XySK/T+keyLUNya8Z4aX0gsOoy0x63AgoHJ458wVqxIT55tjeZNeLmzXJPHkgFhhyvj5
 m+MNoXJ95NUYC8wZ8jRYn5INDMnm/U/OsXC9hfG8iGr7ELLqew034EExG62eHUi3lNmk
 kUKw==
X-Gm-Message-State: AOAM531pR56bHUULWJWy8Su6E/IYdFkRzcxO/tEoCynTknDSomX1MHxD
 tdU1XmUp/f2rQNOToGBF5ite+A==
X-Google-Smtp-Source: ABdhPJxVO1y8gkkfGyd8mfh/5laRpzQ0HsRKTWtp+wjJsFvotvbjrSiCHWCtvhWYEIWbz9CGdaq9Tw==
X-Received: by 2002:a5d:64a3:0:b0:203:d7e5:67ff with SMTP id
 m3-20020a5d64a3000000b00203d7e567ffmr35060091wrp.617.1648626711521; 
 Wed, 30 Mar 2022 00:51:51 -0700 (PDT)
Received: from joneslee-l.cable.virginm.net
 (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4f07000000b00203db8f13c6sm16447335wru.75.2022.03.30.00.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 00:51:51 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 1/1] drm/amdkfd: Create file descriptor after client is added
 to smi_clients list
Date: Wed, 30 Mar 2022 08:51:15 +0100
Message-Id: <20220330075115.426035-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
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
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index e4beebb1c80a2..c5d5398d45cbf 100644
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
@@ -265,5 +256,14 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
 	list_add_rcu(&client->list, &dev->smi_clients);
 	spin_unlock(&dev->smi_lock);
 
+	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
+			       O_RDWR);
+	if (ret < 0) {
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

