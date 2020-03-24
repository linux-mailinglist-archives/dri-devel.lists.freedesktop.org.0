Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04D01916BB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 17:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04FF6E4CD;
	Tue, 24 Mar 2020 16:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A236E4B0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 16:44:13 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id v23so3566264ply.10
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 09:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=znfO0/8U7z8WR9iRQXBfV0O4B1aFn203Xoqlt0rHK6I=;
 b=iA3oeQEVwKRdVFwkhosJc6YOflVNf3nzz2pM7+V18EHAvFczGmof217HJnZaLqf1jq
 4/DOcB3BpNLYwk6jCYwCzAgz12jEUZp0noYOaAoHnHb9y8a8P/wMKhUaURfyzp8GeOn/
 x4tM1jz2ZlJe5IX3XjImzVqDtxXSa0M/x7V9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=znfO0/8U7z8WR9iRQXBfV0O4B1aFn203Xoqlt0rHK6I=;
 b=doNMgzemq/+4GDQk+6kWviMcWbMcCHZTsFizxQ6HZtfH9ipbw1prP1J90dKzfZNgTa
 vdmxoMT4tQ3PQJGU6XpIFu/HL+1RIFlOUhsx2stWUpkd+e5IdARNgJTmn0Ps3vl1IfZ6
 HeJU2+nTREgbiIIuEVpRUh0yZTuX5IIk5wmmZhEsUmh2J3IWKhP1mH5xwuNBs+OdmTM0
 sbrKQnuBj4PlXOTMciNd5Qzr4D1HD79NrAeekfroV8PIZicQKoCE1YUB52UZTZ/eGWdc
 ySwVPuz3qilW2XPUE9eCUqOHKjU5rk3XyG4tNL3A9l5OeU10FHZ6heQb/LMipy9BBPhX
 0/6A==
X-Gm-Message-State: ANhLgQ1SsCFkVhgdndgrCYmjhTxdeads3uKHsKyvV06o2InWpHg3Wed4
 9BIymn9ld5KH6GGYp2NKrXyjR5gkdFs=
X-Google-Smtp-Source: ADFU+vuR/5HBJLfo0LKPfHdqU8EyUQSdN+zI2L+BpazCMrd6L+6MAmmwzSZE0AgBy+1BuqKOR6xJfA==
X-Received: by 2002:a17:90a:198b:: with SMTP id
 11mr6745137pji.23.1585068252058; 
 Tue, 24 Mar 2020 09:44:12 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id z6sm16316621pfn.212.2020.03.24.09.44.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 24 Mar 2020 09:44:11 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/virtio: delete notify after
 virtio_gpu_cmd_context_create
Date: Tue, 24 Mar 2020 09:43:59 -0700
Message-Id: <20200324164400.30013-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200324164400.30013-1-gurchetansingh@chromium.org>
References: <20200324164400.30013-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first 3D ioctl will take care of notification.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 336cc9143205..867c5e239d55 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -47,7 +47,6 @@ static void virtio_gpu_create_context(struct drm_device *dev,
 	get_task_comm(dbgname, current);
 	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
 				      strlen(dbgname), dbgname);
-	virtio_gpu_notify(vgdev);
 	vfpriv->context_created = true;
 
 out_unlock:
-- 
2.25.1.696.g5e7596f4ac-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
