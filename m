Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A5B422D2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 16:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61BC10E8A4;
	Wed,  3 Sep 2025 14:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UMK1czg8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950FB10E8A5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 14:00:45 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-77287fb79d3so340865b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 07:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756908045; x=1757512845; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xAesZB2lk9ao4BWYXbJjTK7DuZ36IgP0HTueS0+3TwI=;
 b=UMK1czg8+/yqLi76IQFwxIF2t6YFz3TUoYW1tI/98lBpa8Sgj7wTa9PsSKTs+2HzqG
 ZdapL/xfu8ynGBRUUETmcKH7BBVbf0Fmx+70qwMBLvYW4AkFlV5w529fbsZm77CiuNCx
 tTQ/8FWP74J6qs+lmBJOqfz0Sl9YqV6UKDOW/HTIF/fLEokV+0AYnnMQHnTYJZmxvzhB
 lowhUj7TDtHxZbsdv6a8a0aTVLp9YXJYFgiSo52eMiEJmgrhO6WFhfJ975SOQbkL0KZX
 tYcY1LQCwYdEbLVxG1z0zVaC6ABcpJMQUYLmuvhSibNazpwFUSLTPwJYyaSc3BZSde2P
 FIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756908045; x=1757512845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xAesZB2lk9ao4BWYXbJjTK7DuZ36IgP0HTueS0+3TwI=;
 b=v67ydq96V9S6EmxUn9XE2mSC3O3uY8PF2wYcYOHU2rF55uBnyMgGJOwkQm/KWqyKw9
 XEl/ZzpPksJq8Dpl22teIOgs2MRD8egYsIpi2pXrdXBTIAVBOkLiB23k1v1zCRoom7B0
 TVrA/sDypzXLcQ59N2h2FYuRyQK6DnmR+D+qHj9l4tf7+OQPShg4MPzI8/kXDUTP0qcv
 y4G8T0VIt3uetNszaSxtml+ZMTi2UcRumGoXKeKNAa8y+LqlMEjtxlXg1UBWB3yIBW4Y
 EL2/FuiZnw3k686Rrj/edvbw6u4+BWJ31I8TVKSeccZhpiE8ZbnhQuJpGESOoy3rUO61
 lBGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT4DufAnAWmK3uM8qmjMfrM0TlNnRUj/c6mzFrGAtc/K45Ivk92DsNh1TD97pEXfc9jWLUxNSh/Mw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn/T95kAHGIj8VEDTetNQwminKZNgy4Rfc21tyBp/A7qcvDnip
 yEKEwbMNfz+zWaKd7kg2n1TVy4cM9J0NAhpCb3DegJHD+3xdqAb7uLgZ
X-Gm-Gg: ASbGncvCl/PGEnu+a6pGL+PodkRcTKtaf0PWitlCPQMINIm8L15LSmn/oU8T80eh6yv
 tsclZQwglFj9GPVlhl4lbseP6sGBGFMxaPAHLC9DCZEr/yUf7HoPLGJDl8J/psVag3M+zypS6TO
 DgEkZZUX19jXul1ImhRwIzIPB1nLQkrxe+Tiimm2OKlhp1yhc9Cj1N6Jst/3snjLO2xQSgApHQS
 9W+XPYzcjFa/UD2CNd/hUe7cxoXv6ewhtNNDmocZLWLAhjdLOH9X8/Xepl7IO5W3f3Gh0tsetVx
 jRiF93Bg2tz+XHa/QMdl4Y4IobHpCam2wqTT/E56vOaHS31hfD/lSvPq1go0XzvqKGXk6LOvZCb
 GO8pab85QvIadwQhZo42uN/CI9KCgWLtcNFmDM1DRp1AFXeVSFF71lZLDPiAK+OH9uJAUxSmic/
 wc/Ji0Kp/ebL+YA9enGFZr+4QJ2vOTEwNTdjFP/rEhefX4/LQkA5fuEhM=
X-Google-Smtp-Source: AGHT+IEiZzIqbK6NtZy7OvrioKfNs+nNoDPdVd41ZcGEBWChbdaMmyXQ4AtaISVEW5t+yv55VsqWyg==
X-Received: by 2002:a05:6a20:9189:b0:248:7a71:c1e with SMTP id
 adf61e73a8af0-2487a710dcfmr3734029637.52.1756908043165; 
 Wed, 03 Sep 2025 07:00:43 -0700 (PDT)
Received: from vickymqlin-1vvu545oca.codev-2.svc.cluster.local ([14.22.11.165])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-77243ffcebasm12891155b3a.51.2025.09.03.07.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 07:00:42 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <treding@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] As the doc of of_parse_phandle() states: "The device_node
 pointer with refcount incremented. Use * of_node_put() on it when done."
Date: Wed,  3 Sep 2025 22:00:35 +0800
Message-Id: <20250903140035.2529812-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.35.1
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

The function doesn't calls
of_node_put() to release this reference, causing a reference leak.

Move the of_parse_phandle() call after devm_kzalloc() and add the missing
of_node_put() call immediately after of_address_to_resource() to properly
release the device node reference.

Found via static analysis.

Fixes: 9a10c7e6519b ("drm/simpledrm: Add support for system memory framebuffers")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 8530a3ef8a7a..f0bd7e958398 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -183,15 +183,16 @@ simplefb_get_memory_of(struct drm_device *dev, struct device_node *of_node)
 	struct resource *res;
 	int err;
 
-	np = of_parse_phandle(of_node, "memory-region", 0);
-	if (!np)
-		return NULL;
-
 	res = devm_kzalloc(dev->dev, sizeof(*res), GFP_KERNEL);
 	if (!res)
 		return ERR_PTR(-ENOMEM);
 
+	np = of_parse_phandle(of_node, "memory-region", 0);
+	if (!np)
+		return NULL;
+
 	err = of_address_to_resource(np, 0, res);
+	of_node_put(np);
 	if (err)
 		return ERR_PTR(err);
 
-- 
2.35.1

