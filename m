Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1781E403F79
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 21:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9120F6E283;
	Wed,  8 Sep 2021 19:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75B96E283;
 Wed,  8 Sep 2021 19:08:21 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id y128so4415861oie.4;
 Wed, 08 Sep 2021 12:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bw+JG+aQMrwPzIAhtsSSwIELKeZ1QyarX3T49Luud4c=;
 b=TbXlV3D9n7GMa1t1MJOGjHEwWpRdK7WxXe/JR06eo5TUDQYhiXt0NZpizFDnpJDQhZ
 4OaPfdJfCFEOtUdnhdH4O9DbKAxNnrIT7MiDfXdWYDJFrSW4YolXKDKnDwh0HkbjP6zD
 uoF4wqd49GJl9rA+GVBV6vbEd1CpVG9XxrjLb+2nZJI63KzMVpq1yWSiLjPHIZpPWbiY
 BtuFVFW4Ly6JdO42eRKB3VHvXVE8p4/M6CHeb7AyF/ZU+1wGPPp7tmpN2nZlzg8bhgXw
 2yWjaP5/icauhrhgp1eiD3BElRoFrWuSPQVKBfL0oSuJkiT4apceWJKzwRZZ5DajEiyQ
 Bb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=bw+JG+aQMrwPzIAhtsSSwIELKeZ1QyarX3T49Luud4c=;
 b=KwCqBF0cCMyBkl7U9YbUpo0pWEWjvNGLGO2hWEtJeLXmcgRS9h7X8vVylFZ3BCRPT7
 6zozwXb9+AFXYQDA88SzhiH0lY22liCO7mUYYKndVOuwI0gsjUZeK0EUyGv6U10anQk5
 PrxElFrVVDaiaBFeGOO2eyB0niT08+NIC6Ptnmk5wfELYaVKwrxUUCXEO9Kx1bS1/I+9
 oB4xkdX/1i5AfXGJwoy6YxvP/0kqbosXWNCv2AuLhlzBLXnXgKdnxtEXwoNLvCSZikEo
 uIp/dWLfIVQzBBLabOmB5htKoJtrY7sbzSVthcwzdrvZ3H++/1WmiB9HtqeBqnYslQ2q
 mcJA==
X-Gm-Message-State: AOAM530errOj22F9UWESTFtvX4K9NsDdxfJkqboboXs8rbop2mE1GQvs
 UZe9kxVFbOnFjgFfgZe+Nk8=
X-Google-Smtp-Source: ABdhPJx5bURId7fRLqo29FhLyipAcn4Q2zfAltA/3QWnCbeeW+Tdz8wJYdLDdGu8vIjxCvPSnGob9Q==
X-Received: by 2002:aca:5f04:: with SMTP id t4mr3563120oib.53.1631128100985;
 Wed, 08 Sep 2021 12:08:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 r7sm591936oog.48.2021.09.08.12.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 12:08:20 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] drm/nouveau/nvkm: Replace -ENOSYS with -ENODEV
Date: Wed,  8 Sep 2021 12:08:17 -0700
Message-Id: <20210908190817.1213486-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nvkm test builds fail with the following error.

drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c:
	In function 'nvkm_control_mthd_pstate_info':
drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c:60:35: error:
	overflow in conversion from 'int' to '__s8' {aka 'signed char'}
		changes value from '-251' to '5'

The code builds on most architectures, but fails on parisc where ENOSYS
is defined as 251. Replace the error code with -ENODEV (-19). The actual
error code does not really matter and is not passed to userspace - it
just has to be negative.

Fixes: 7238eca4cf18 ("drm/nouveau: expose pstate selection per-power source in sysfs")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
index b0ece71aefde..ce774579c89d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
@@ -57,7 +57,7 @@ nvkm_control_mthd_pstate_info(struct nvkm_control *ctrl, void *data, u32 size)
 		args->v0.count = 0;
 		args->v0.ustate_ac = NVIF_CONTROL_PSTATE_INFO_V0_USTATE_DISABLE;
 		args->v0.ustate_dc = NVIF_CONTROL_PSTATE_INFO_V0_USTATE_DISABLE;
-		args->v0.pwrsrc = -ENOSYS;
+		args->v0.pwrsrc = -ENODEV;
 		args->v0.pstate = NVIF_CONTROL_PSTATE_INFO_V0_PSTATE_UNKNOWN;
 	}
 
-- 
2.33.0

