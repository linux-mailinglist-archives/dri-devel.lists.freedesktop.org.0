Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4101B3848
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3F46E9C4;
	Wed, 22 Apr 2020 06:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3075B89ECD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 23:41:49 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id l60so253392qtd.8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 16:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LvYouvVpcqYLPafw/K5/u16SlbXdlEtkvI3+uiIfQUs=;
 b=G74PTK6TtB9NwQj+FSqGUh2FwwFtWKKCQ+mOSiH63EAaBhzW/vQhn1g45PghckrUdo
 S871ocFS0GrOqjr/r2si+SWzI5Ge85eGKFPXU2HNCU83mmZgo7S5lItiNiBMEs2mEOJg
 gsUKJXpwCQXygXlSgssdZ0GyQfnmHVdS0tikEB1I9MYpowwsLxR1F59/1M7fTzLMz7NO
 VRmXu7/AGWWKMeCNisN1iyQ785p7gL+LwjR2XT3cNhqcHpMbD1ljdRQZ9lVoN+B78zvl
 ZmqSVBL1DSDDXbhuHR3y0/eGmQdsT0MC8tEm7H+f2dswxFr8BmE8bkRXYMduNScQKsMC
 BcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LvYouvVpcqYLPafw/K5/u16SlbXdlEtkvI3+uiIfQUs=;
 b=cEKwjMLyCyuoDsuLOp7ri2C+RnOSlqCBeqCusT44u47BEdz269sDqoOQ88Nc86+k+P
 8lrS6JbAv/51pY8E5x+2th2JkGiH9ARh/QlIPDM4oZi1YQ4as6mesC9CYiSwMWExxxg9
 mPiP7qFqfyBxjx/SX4qUrR401J/WTZxGZndImim0tHq4tPjKbm2pouSNEHPK7m6gYq+L
 TdMKNBXZf2+uidBFvxUc5Zq6i13SfKHkZnNCrvfNWTSb0krI4g/Mx2ghNbHgIH4yf0oy
 raCyXIf5/Mgm8V23ETWlAm4MlGygR3n9039vQBT7Cgf1kH7xCHsAPkTUyBlCZ5OKDG6q
 Ykbg==
X-Gm-Message-State: AGi0PuY3Qy5WWxo8mNJfrG0bODd0iWFy5qAveeRIKH/4pnd8BuHC2DRd
 nI7rhBcc7t17w4y70lI4kzQMuQ==
X-Google-Smtp-Source: APiQypK1nmzvS2nmLwnRxDmP5lKch6j44kgbOozEUbrgbvCS5biDAMrxAAoKoc/vJFqcrC/GuSVPhQ==
X-Received: by 2002:ac8:4cd1:: with SMTP id l17mr23695608qtv.20.1587512508380; 
 Tue, 21 Apr 2020 16:41:48 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id y17sm2664010qky.33.2020.04.21.16.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 16:41:48 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/9] drm/msm: add internal MSM_BO_MAP_PRIV flag
Date: Tue, 21 Apr 2020 19:41:20 -0400
Message-Id: <20200421234127.27965-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421234127.27965-1-jonathan@marek.ca>
References: <20200421234127.27965-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This flag sets IOMMU_PRIV, which is required for some a6xx GMU objects.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 +++
 drivers/gpu/drm/msm/msm_gem.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d8f56a34c117..6277fde13df9 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -428,6 +428,9 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
 		prot |= IOMMU_WRITE;
 
+	if (msm_obj->flags & MSM_BO_MAP_PRIV)
+		prot |= IOMMU_PRIV;
+
 	WARN_ON(!mutex_is_locked(&msm_obj->lock));
 
 	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 30584eaf8cc8..972490b14ba5 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -13,6 +13,7 @@
 
 /* Additional internal-use only BO flags: */
 #define MSM_BO_STOLEN        0x10000000    /* try to use stolen/splash memory */
+#define MSM_BO_MAP_PRIV      0x20000000    /* use IOMMU_PRIV when mapping */
 
 struct msm_gem_address_space {
 	const char *name;
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
