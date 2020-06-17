Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF171FEC48
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFB86EB0F;
	Thu, 18 Jun 2020 07:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC596E16D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 23:41:05 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id t74so2383717lff.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pAxyB6C7aJlpOxagnpZfk3yhTf/LsEQQa81zSGYW43g=;
 b=B9nMsiI6lfN7t3LM1U/WpG+wTKt7bOM1IpIV2Ix76X0/HY/Yg9Oqqr903PuHP9lFuB
 RTREq0KBfW1XVVxk9rl39YWJtc81FtuhslgD61jto+JyxjrceZVMG+fIAc4Tu1xO3Tx4
 s77pLBWBAOD902doRB8H+zla+jkalMJpQWef2qmIZgwrt/3cQSDnPX1c76cYLzUhQpoX
 IJVVd0dy2t9y0YmOPFQ7NzbrOeidSofir9I//r3ZjzCLl3SGGZlYsgtD8sBOXwBHe0zm
 Wvrx1ON+QOIJYfYXoGWYxgaacVdscXRs1IdH69uaRuJ1a6ORkFtnNGALZ30YzpClomt2
 HMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAxyB6C7aJlpOxagnpZfk3yhTf/LsEQQa81zSGYW43g=;
 b=QAULBW/a/tyrnWYXP8rVf4Mz/OfsiE9qvu2GnuqaXTx8tImvp06f/HICy8ax1V83rr
 sSsKLWwXOuzcIrYSBawmrcRifkUK9OHw8+61gtQW5/yQnvFV+DvoEtHJGizYVWM7JVYb
 q8FFTQaKNS1cFN8Ne2mmJwTXCOVDuep4S2kYpGWZXUXbbcmqUpX+To0vxH07a4ycKzuD
 3y/4+S6vDXuxG08LrshkmQmxPIRAgDoxFGRrmIlOCZA+Us9B5tfhYDOq+azL8RG0XoW9
 U7ZNxyzjFjM8JEOqqEn5lH0nH9g0ESuEfURp3vhxnKuT/67NOac3kKMw2oY7fsT+U8WE
 wk+w==
X-Gm-Message-State: AOAM532J0aOieMx+WI1SqeGi7bbVHHbEFHVMvm+5hdxLiMYM4AgUc72e
 jMPSAWz3CPHgEqJBEzM8bgw=
X-Google-Smtp-Source: ABdhPJz5cDVUwKIFbHJvRRcZm/RgHQl0lqOLx6eYkfTVVUQv765IyixK8lF7EOCan5KXL+JrjhETlQ==
X-Received: by 2002:a05:6512:10c8:: with SMTP id
 k8mr704401lfg.181.1592437264376; 
 Wed, 17 Jun 2020 16:41:04 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id c8sm287871lfc.46.2020.06.17.16.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 16:41:03 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: [PATCH v3 3/3] =?UTF-8?q?drm/tegra:=20plane:=20Support=20180?=
 =?UTF-8?q?=C2=B0=20rotation?=
Date: Thu, 18 Jun 2020 02:40:40 +0300
Message-Id: <20200617234040.1094-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200617234040.1094-1-digetx@gmail.com>
References: <20200617234040.1094-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Combining horizontal and vertical reflections gives us 180 degrees of
rotation. Both reflection modes are already supported, and thus, we just
need to mark the 180 rotation mode as supported. The 180 rotation mode is
needed for devices like Nexus 7 tablet, which have display panel mounted
upside-down.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index f8149dc3b1b4..1a9a5f8bba34 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -816,6 +816,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
 						 DRM_MODE_ROTATE_0 |
+						 DRM_MODE_ROTATE_180 |
 						 DRM_MODE_REFLECT_X |
 						 DRM_MODE_REFLECT_Y);
 	if (err < 0)
@@ -1105,6 +1106,7 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
 						 DRM_MODE_ROTATE_0 |
+						 DRM_MODE_ROTATE_180 |
 						 DRM_MODE_REFLECT_X |
 						 DRM_MODE_REFLECT_Y);
 	if (err < 0)
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
