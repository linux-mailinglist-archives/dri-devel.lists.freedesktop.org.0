Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C30D593EA9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 23:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1ECD50EC;
	Mon, 15 Aug 2022 21:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70775D50B8;
 Mon, 15 Aug 2022 21:14:57 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id f192so7616743pfa.9;
 Mon, 15 Aug 2022 14:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=w5QXaLkMtFzdjHDQHtPEU494QpdGuD1KjoIolDWdbN8=;
 b=LQS9J7WOTckVSScdQmwkDF/vckZLEnTZXZYYRi13AYNiKPC+iOVgJoaFvOtFriteqO
 pQ0GS3eocqTyQnArXwKTQcmQNd1os850upnkC6k+UDghPUgT4Bp8W1FLZjr6drlvaoxE
 lczs8pvPfx+x3L5d/8pBqRvttkW9Z+o+qVB4LUJmpHAzTTcIsjI/TaABs3UIdjwkOf32
 JTnKOPherPlT/HdXAwGHKlcPXg1s4Q+soD1smUkNAHD0NvRUVNUbnGoOAFPms7YB5cTT
 xZHstsjW9JwfXPMkEIS+7l5OEd6SFzZXLLFT1Z1V+NvyIRPVNNTu8ycHOR6CERs4Beso
 Vf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=w5QXaLkMtFzdjHDQHtPEU494QpdGuD1KjoIolDWdbN8=;
 b=mhnlkX/i3RQplKwf/X1VLeTj5o3vl4cqNR31n2qatCVXLf79fTsnAua4JqeSiAcHKD
 fJISfVHY7X9BbzP/VPXlBA+i8wsxvO41gHJ4KhMJ8HqLYlzjdrRETG4m2e1sy2hpvgxf
 rezx89+G6wOALbjZaYQA80dm3ZyxwyggDndXka33NgILSZzDAph9wdRDYR/6N0Qtdckl
 FvktA7GsHIsJxuN2qO6RYYBCZrGIh9r29flRKMWIYrkXtTnP0NmvLXnvuJoWoUlGBJFd
 JC6jHcpavvDCF1KykE+jfOzS9HNUTY0nkIQwvGPXcuWXRbCNqn2gtNGnyzyvVZTwSk4I
 z/qQ==
X-Gm-Message-State: ACgBeo1l2U8qund3CQXYLJh0Z5wU7HubfRwfTpMFEwZ7VzHJZ3nhuc6k
 ETikciWjVZCRDqSROf3VgAQDCbyw8B0=
X-Google-Smtp-Source: AA6agR6q7mRFB9Y4ijyBy6CjBRfN48U1JfqaDyXBL5UsDXYLNsVjueHi1/tBu1MPs+/X+hVsTIeoTQ==
X-Received: by 2002:a63:ab05:0:b0:41d:a203:aee6 with SMTP id
 p5-20020a63ab05000000b0041da203aee6mr15354352pgf.144.1660598096597; 
 Mon, 15 Aug 2022 14:14:56 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a170903018200b0016eef326febsm7498433plg.1.2022.08.15.14.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 14:14:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/msm/prime: Add mmap_info support
Date: Mon, 15 Aug 2022 14:15:14 -0700
Message-Id: <20220815211516.3169470-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220815211516.3169470-1-robdclark@gmail.com>
References: <20220815211516.3169470-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 1dee0d18abbb..1db53545ac40 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1048,6 +1048,17 @@ static const struct vm_operations_struct vm_ops = {
 	.close = drm_gem_vm_close,
 };
 
+static enum dma_buf_map_info msm_gem_map_info(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+
+	switch (msm_obj->flags & MSM_BO_CACHE_MASK) {
+	case MSM_BO_WC:                return DMA_BUF_COHERENT_WC;
+	case MSM_BO_CACHED_COHERENT:   return DMA_BUF_COHERENT_CACHED;
+	default:                       return DMA_BUF_MAP_INCOHERENT;
+	}
+}
+
 static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.free = msm_gem_free_object,
 	.pin = msm_gem_prime_pin,
@@ -1057,6 +1068,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.vunmap = msm_gem_prime_vunmap,
 	.mmap = msm_gem_object_mmap,
 	.vm_ops = &vm_ops,
+	.map_info = msm_gem_map_info,
 };
 
 static int msm_gem_new_impl(struct drm_device *dev,
-- 
2.36.1

