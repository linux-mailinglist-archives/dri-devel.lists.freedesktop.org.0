Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0AA289C18
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 01:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DE76EE57;
	Fri,  9 Oct 2020 23:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D136EE54
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 23:22:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g12so11880047wrp.10
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 16:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDDZ1GavId8LYUYfhaE0lVQHXRQNAjuF4h2uc5jlEUg=;
 b=Q0J9hzLjWzwkvNt0BPQ+5rdkSQJ4eW420URbPMG5cD0NNKT0Lv84AZV/jNWzF0kIVS
 coHMISqY5gRWTB9oTfUbSRVbPWkTFSlgCeIODfltI2IuKYw5vDFRzGIgnbM33/Oxe/db
 CSlvGl/m9bc8JBZvNVgNvaSg14K+RpuHdn2cE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDDZ1GavId8LYUYfhaE0lVQHXRQNAjuF4h2uc5jlEUg=;
 b=Qc7xoUE2EAs0np8//bjLCAtJmV/l/pcMHzDvZu5ljn1tbBfAzAIqoXRKASsClGUVXO
 tCLNitjObSKP5x7rGZZFLtrGXM2iL0joITo639dJx5K7K383nPlMkEFejWTIrROP311b
 UlFqzBvi5wUOmtEX7XAIGUzWeleX13gSXkWGQ2viuMJAN+XyYztlHIF3RdLsXv8eHBI7
 47rfRYNuRWc41U+dloWKhdLjX7JiHQIqGU5QdXca60RVIaWgu3dmC55JdvvYkRdVvElp
 lcpZMYsgGd4k+eJcgRyWsxt1Hpm+h2OaRMfPuC0cqUqOGpF+qLIATSCpBEfA+fW8H5a6
 tfsQ==
X-Gm-Message-State: AOAM533GVT7cIF/iSUIShtfuprrVZ5JQJH146gg2gwXG1+A7jHsaSRHO
 k1QL4mFVX54K43GJk9yFfM1oki2zxKUvBYmM
X-Google-Smtp-Source: ABdhPJwGdgSu/ohQJVe3U6MIkMhuM41omV4S4tRHn+Bq0bB9ws1GohWvhZi0zbbAiVDIYdqbG5vGUA==
X-Received: by 2002:adf:e7c8:: with SMTP id e8mr18256485wrn.358.1602285725465; 
 Fri, 09 Oct 2020 16:22:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w1sm14302542wrp.95.2020.10.09.16.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 16:22:04 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/vkms: fbdev emulation support
Date: Sat, 10 Oct 2020 01:21:56 +0200
Message-Id: <20201009232156.3916879-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hooray for generic fbdev support, making this a oneliner. We just
needed to fix preferred_depth fixed and the vmap support added first.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 6221e5040264..cc09e2df5cb1 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -169,6 +169,8 @@ static int __init vkms_init(void)
 	if (ret)
 		goto out_devres;
 
+	drm_fbdev_generic_setup(&vkms_device->drm, 0);
+
 	return 0;
 
 out_devres:
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
