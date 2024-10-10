Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3B199959A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 01:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E9A10E9F8;
	Thu, 10 Oct 2024 23:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WoSXDvab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194AD10E9F8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 23:11:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4311420b675so12320815e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 16:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728601872; x=1729206672; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fjPwcfBnpMXxgtR9zYeG1f69L8F4e63LO0DXGyPpc/k=;
 b=WoSXDvabzFosUz+lNHknopcC2gEYNzBAI0M1piznmRPqOo0mLYGyLJtYJoCx6mdaP/
 tK5bSs7qsl4Kw+7ayLTXCBPs2uJHPy2xDXGE1LOFh6cf6VnbovU9UKd2KR2lM46C+zAT
 RoZ6ygjCx8z1E1c8IoPoPtxSf6POarE5WR7ooIkxm/DZfZNTGXnhoKQuZIycFz5Q+NBs
 9DkIaE0Otb3i2U6+2EJ5UsucYRUUFpwCqS8a1G/cbelFRXV9dsozxvXrcckPIgRsXEVS
 8i0QeciE/P13HQRFpzeFNO+9l8jsz8nY9h3ReYJhHPG8DnIP0ZQAseNjxbuYOD3iniyV
 4AZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728601872; x=1729206672;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fjPwcfBnpMXxgtR9zYeG1f69L8F4e63LO0DXGyPpc/k=;
 b=fYaQJbF4H0YJbr55Yus3eKoeBbuN7RpmKlZNKTufgL/Fx2ovL8nN9BGg3Hv0/RUqTp
 YR42GjpmPgSODsM2gnvRB6twxpd+8Yuuv8M1cyUmMDBQgQeWC0GyKW4ndWf8BOyhzYN2
 IojOi1OX4Oanw3/a+kCR80xS5jqJbUR1/6H43VFNF3GT68lhHrTdja1WDrz+NBqJSPt+
 EoCjQ3Y+w7bx93gX9giAKCSlBb+CauFkoK+TKXAHR1kjamGDVGIP7NzdOk3NU4nGva86
 LCDnfD96qRi11KP7EyWMZmsMYoyvC0nVnIfs4NbM41Xzz2puquXtwn0J++VL5UekFlNV
 8liw==
X-Gm-Message-State: AOJu0YxnXD5uOsVv6oxRcsa/6smGsDXkZIt7kuO30gJbmiLLtiZjRE5o
 L2PmEtaGbM33llh3KldguyX1Ya/QhzxBCgTx45Pe7gBOaWfPR/Ze
X-Google-Smtp-Source: AGHT+IEpM3FDRoQJpalgDZzsnqUCeD2Z17cikYAZ7GmGRPUG4jbEdx8yLOvV5OmP2FAMNR0g/DCR5w==
X-Received: by 2002:a05:600c:4446:b0:42e:75a6:bb60 with SMTP id
 5b1f17b1804b1-4311dee6f7dmr3658365e9.19.1728601872026; 
 Thu, 10 Oct 2024 16:11:12 -0700 (PDT)
Received: from [127.0.1.1]
 (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at.
 [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d7934sm27465325e9.3.2024.10.10.16.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 16:11:11 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/3] drm: logicvc: add of_node_put() and switch to a more
 secure approach
Date: Fri, 11 Oct 2024 01:11:07 +0200
Message-Id: <20241011-logicvc_layer_of_node_put-v1-0-1ec36bdca74f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAtfCGcC/x3MQQqAIBBA0avErBNGCYquEiE5TTUQGlpRRHdPW
 r7F/w8kjsIJ2uKByKckCT5DlwXQMviZlYzZYNBUGjWqNcxCJ9l1uDnaMFkfRrbbsStHFTmDtWn
 QQe63yJNc/7vr3/cDYQvZzmsAAAA=
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728601870; l=1658;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=VNQYeYjPOiXX6573OnZf1sNGyADS0plJBR+e/AYTBeg=;
 b=ESFH/s/wMpa38hE2jm/d+8n6IRGkNNdS+6hN83gW3qtCCKAaEXP+0IGwN8vCPrCAMvbuHqdnQ
 FoaL9XfhmVDD44TTf2HAZdOFxobmcBArO5PXkHZKBhN2tcTIlncgXTy
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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

This driver has faced several issues due to the wrong or missing usage
of of_node_put() to release device nodes after they are no longer
required.

The first implementation was missing the of_node_put() for
'layers_node', and it put 'layer_node' twice. Then commit
'd3a453416270 ("drm: fix device_node_continue.cocci warnings")'
removed the extra of_node_put(layer_node), which would have been ok if
it had stayed only in the error path. Later, commit
'e9fcc60ddd29 ("drm/logicvc: add missing of_node_put() in
logicvc_layers_init()")' added the missing of_node_put(layers_node),
but not the one for the child node.

It should be clear how easy someone can mess up with this pattern,
especially with variables that have similar names.

To fix the bug for stable kernels, and provide a more robust solution
that accounts for new error paths, this series provides a first patch
with the classical approach of adding the missing of_node_put(), and two
more patches to use the cleanup attribute and avoid issues with
device nodes again.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (3):
      drm: logicvc: fix missing of_node_put() in for_each_child_of_node()
      drm: logicvc: switch to for_each_child_of_node_scoped()
      drm: logicvc: use automatic cleanup facility for layers_node

 drivers/gpu/drm/logicvc/logicvc_layer.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)
---
base-commit: 0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
change-id: 20241010-logicvc_layer_of_node_put-bc4cb207280b

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

