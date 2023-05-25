Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C9171100D
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 17:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F9910E6B6;
	Thu, 25 May 2023 15:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D2110E6B5;
 Thu, 25 May 2023 15:52:38 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so1573311a12.1; 
 Thu, 25 May 2023 08:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685029957; x=1687621957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7rVaUtme+EMgdLDqkT+0xJV+Z1WpGr8J4+UhWtVcjr8=;
 b=IvUB2IKXdPVzS5BHfvNthVBhxLC614xiN9wuIVEsKpqc1sdU2CVUrIYrj3r6tqujTX
 F3CVgK0ZbMwTucYdyQPx3X/ff411RAhSLG/vO/b+hJpLobzQSlBLoLuslMCn/hv91N3i
 AaJE9RtBh/wqPaSk7mLBnNqR+WhHs9sfwhB2WPeWfbQEprGfGpz6xUXwnemLMb7co5Nn
 KMI5V0296BHn7TijqODaERxEfhtHVC/Tb3jYa2AXbWjvmZRNNAaCK7xe+fLbnWxebTCc
 1WngHtTOP2scTVVWs19ADnOWMzOQoKkacKdlvcAEYti9dTduIBqxtvADOiHZsS+4emR/
 zPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685029957; x=1687621957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7rVaUtme+EMgdLDqkT+0xJV+Z1WpGr8J4+UhWtVcjr8=;
 b=go/IZTznMrDhccStBN65+tm6lLN1RZIcak7te2TL8KWrLAXmN2Y61opBFTPjRLiUVQ
 ylE/0f6fSnmm9HKbriEYDG4A+2NQ0jaPTf60CadydQWKyEKVCPdTuhFHRehjueLwKKCx
 HSA/+nFq4IcQ1aSpLjMLFWbWFuPyZE2Z3wlMYckLBLt4gYIreyTESMomVsNzeWtLsikl
 4l4jjxHMn5hqFo9VCy5peajJpWTGDsG7vHMSa6zNThwTESh+cbHAGYllzusf1pGSQWAX
 7t/vIKmRtV5LDbzk27w9Ndj9NEijgiMZENV4ksQnnErVgVx6sQsxnHY5OpnsIeGuYJ9R
 xLtw==
X-Gm-Message-State: AC+VfDzoweHYwgrWglHqza8ipsY9783QdcbraUUcbo4tjRAexGtUhlXj
 aZJShSwHvrRX77zWGWVQPe4bwxBbtX4=
X-Google-Smtp-Source: ACHHUZ5W7kiapIeT1AGeBpVKPigYmydXD2YhEImUqgogV9Ej++7d8rBHc9rIoGANlsYWGfUDQyb6OQ==
X-Received: by 2002:a17:902:e852:b0:1a9:5aef:1aea with SMTP id
 t18-20020a170902e85200b001a95aef1aeamr2316030plg.66.1685029957214; 
 Thu, 25 May 2023 08:52:37 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170902c10900b001a5fccab02dsm1598335pli.177.2023.05.25.08.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 08:52:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: Remove duplicate fdinfo fields
Date: Thu, 25 May 2023 08:52:25 -0700
Message-Id: <20230525155227.560094-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525155227.560094-1-robdclark@gmail.com>
References: <20230525155227.560094-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Shashank Sharma <shashank.sharma@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Some of the fields that are handled by drm_show_fdinfo() crept back in
when rebasing the patch.  Remove them again.

Fixes: 376c25f8ca47 ("drm/amdgpu: Switch to fdinfo helper")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index 13d7413d4ca3..a93e5627901a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -80,23 +80,20 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 	amdgpu_ctx_mgr_usage(&fpriv->ctx_mgr, usage);
 
 	/*
 	 * ******************************************************************
 	 * For text output format description please see drm-usage-stats.rst!
 	 * ******************************************************************
 	 */
 
 	drm_printf(p, "pasid:\t%u\n", fpriv->vm.pasid);
-	drm_printf(p, "drm-driver:\t%s\n", file->minor->dev->driver->name);
-	drm_printf(p, "drm-pdev:\t%04x:%02x:%02x.%d\n", domain, bus, dev, fn);
-	drm_printf(p, "drm-client-id:\t%Lu\n", vm->immediate.fence_context);
 	drm_printf(p, "drm-memory-vram:\t%llu KiB\n", stats.vram/1024UL);
 	drm_printf(p, "drm-memory-gtt: \t%llu KiB\n", stats.gtt/1024UL);
 	drm_printf(p, "drm-memory-cpu: \t%llu KiB\n", stats.cpu/1024UL);
 	drm_printf(p, "amd-memory-visible-vram:\t%llu KiB\n",
 		   stats.visible_vram/1024UL);
 	drm_printf(p, "amd-evicted-vram:\t%llu KiB\n",
 		   stats.evicted_vram/1024UL);
 	drm_printf(p, "amd-evicted-visible-vram:\t%llu KiB\n",
 		   stats.evicted_visible_vram/1024UL);
 	drm_printf(p, "amd-requested-vram:\t%llu KiB\n",
-- 
2.40.1

