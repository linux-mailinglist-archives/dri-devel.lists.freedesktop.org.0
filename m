Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4BD1F8FCB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB686E2D1;
	Mon, 15 Jun 2020 07:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029E189E7C;
 Sun, 14 Jun 2020 07:15:01 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id p20so14495298iop.11;
 Sun, 14 Jun 2020 00:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bPrRUczvkdPS9j38kNwtmalLCt8ruDVnHkocb9mxFHU=;
 b=LvjkPMYp0DVSzS3YMbpqoU7oTebx1T+1RRpn0cDeLz8GYxeOzbsQPv4yTijr+HO9Ef
 oGRH6bZqsCegNxSDH96TK0uuQg5QkmQZksGFC2GpZaACU+/mjsddQbkGxtpNOtTKSGC5
 3J9GoyD1Q8IrRpiNupB1vn5Fznozt63ys4tzwEPtkBI/PafCva05SPfVjx1YeDUkDtgR
 FDG5xD2CkkBGE/Dr4sgvLgJ5UhvzOOomwx9tO485dySz9SHO4JsqzC9V1Yes2yd1904G
 rHwhsTSm4nohBhkLOW/n2bEzF29COGaW5xFnlghubcNPpicflv0gRAanPx1SX3AwPz8b
 Actg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bPrRUczvkdPS9j38kNwtmalLCt8ruDVnHkocb9mxFHU=;
 b=mZ8LxEl2Jf9Ho0u72nqULhizc4SOG/L5biixVhsOzG+wEI1VCIDTPUyqGp1Ev7xNeg
 hctZCyS7+Xov5+FHmIH+7Yvao6gWzGhdJkais+C/a/AQHFkJag28aF9YeHO9ld2+f4eN
 Rmw3F14O2CJ0fIhLJxlMk8fSmMVBB5pKyMOcKl/o9U3O9bvQ/Avb+yC1l28yIGvTnzBp
 b/H+k7kuYLeOJpLpetS13tA5J6kRE+9MUK/xAX2KyMB2/GXbgOkA3yDY4cgEugPxfSUq
 v4+6htFZC8sLbJ4gXW/ha6YxPTeIaHikTLBXLzgjkGMC6vPXurAyihHKQDmu1LThWw2a
 JqkA==
X-Gm-Message-State: AOAM5305grl7bdcPnO5A0k85cYl3UBSNTEdVTkNgEwWFapCZnE94q+DC
 IBYSFgj3CbWhVCe+Ilux7nE=
X-Google-Smtp-Source: ABdhPJxB/Y3+PO1wPrIY0bPCtprfZW2/CxEvuclqlyjz50AWhC1AXVUYjAmICBjWS54HTLPqlJSglw==
X-Received: by 2002:a05:6602:224a:: with SMTP id
 o10mr20838681ioo.90.1592118900436; 
 Sun, 14 Jun 2020 00:15:00 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id v18sm6097285ilk.6.2020.06.14.00.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 00:14:59 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Evan Quan <evan.quan@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>, "Tianci.Yin" <tianci.yin@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: fix ref count leak in amdgpu_drm_ioctl
Date: Sun, 14 Jun 2020 02:14:50 -0500
Message-Id: <20200614071452.83725-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, emamd001@umn.edu, kjlu@umn.edu,
 wu000273@umn.edu, smccaman@umn.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in amdgpu_drm_ioctl the call to pm_runtime_get_sync increments the
counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 126e74758a34..d73924e35a57 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1373,11 +1373,12 @@ long amdgpu_drm_ioctl(struct file *filp,
 	dev = file_priv->minor->dev;
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0)
-		return ret;
+		goto out;
 
 	ret = drm_ioctl(filp, cmd, arg);
 
 	pm_runtime_mark_last_busy(dev->dev);
+out:
 	pm_runtime_put_autosuspend(dev->dev);
 	return ret;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
