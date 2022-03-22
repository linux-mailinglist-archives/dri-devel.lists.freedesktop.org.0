Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16004E3F53
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 14:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0B710E5B3;
	Tue, 22 Mar 2022 13:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EAE10E5B5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 13:17:47 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so2438223wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 06:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mNnJDPwNNgp2uQk+kUZA1dkPne4UNsujlioBhktjpXs=;
 b=a3BZYCofxkXpl/fN7dZqrz6MBqQh8Ls46WNfHXsAAisvMwKR1GYLwK3WyCpUmPNedq
 mOZ2IYrraA4rmPmnUzPIyCe17HLcNwNYtlVC0qDa+ZtDGQ6R6EWojM2tAN51HlfvaDBk
 UsZR6rtmwpg6XC9XesNf8dtKFgic00xtd5jLL36W21dI0iNy2GpfXGmoWcVcz6YNueCQ
 dBOYxnEGKIFU4wmBFXV3xb4UVaWTiNtZMwHbB0SkxWY5r72K10HskUSqzK0vQ+cKU0lj
 Q7CQPYp0Rqq43iaRCgSojC64UNXud06kP0izjMqTcGFbT0fQdfDpaEegi5bGvbPd0vRh
 kiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mNnJDPwNNgp2uQk+kUZA1dkPne4UNsujlioBhktjpXs=;
 b=cW7JtisZ6c2IDJWmkaDngN7IBwcqhjmLAs4yLldNWWrNuxEBcaFIJykEqnMFDSMHsj
 c9BbKP3jUyXQqAHLAdXTdtTxVMcPkvKxtF6OrPGCU+J1A+VrVRQ22wFKQb6AuEi92UPP
 L4beb3PhqlKwh1cAAYZUscsFtqMIeSIzzzCD0jNoqSZq7jW7zDGreky8tlfFTVBjO8AV
 cjBjI1uEgLrFa6A6ylOnYZhBT9WPgR6rlQcb8KK5AX6VyQ+XQA0EI58E7tE/JBmicWrG
 nouQEQIDSsN/iQBh6VlR1LFRiMOInrFHd90jM+LEHZrQHxjtDrcr5EDR2+/c++vfnBIO
 VXig==
X-Gm-Message-State: AOAM531Bpfi6RcvYTA5hSZPFCybQR/SWcjlQgCN3/epkDKVEyrMUIBtv
 vFprcWrOa7tfLfgh2RonToCEQ455Yjo=
X-Google-Smtp-Source: ABdhPJzRXAFA5eFKMXPDfD6sL+5iWx9PdaMFUwuWAzS+mjwLtslBpMYfB29lezem32Xike75x0NAGA==
X-Received: by 2002:a1c:3b09:0:b0:38c:90b9:257c with SMTP id
 i9-20020a1c3b09000000b0038c90b9257cmr3739294wma.156.1647955065463; 
 Tue, 22 Mar 2022 06:17:45 -0700 (PDT)
Received: from workstation.suse.de (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600002ad00b00203d64c5289sm17978437wry.112.2022.03.22.06.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 06:17:45 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/gma500: Uninstall interrupts on driver removal
Date: Tue, 22 Mar 2022 14:17:37 +0100
Message-Id: <20220322131742.11566-2-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
References: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reloading the driver revealed that the interrupt handler never got
uninstalled.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 82d51e9821ad..b231fddb8817 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -173,6 +173,8 @@ static void psb_driver_unload(struct drm_device *dev)
 		gma_backlight_exit(dev);
 	psb_modeset_cleanup(dev);
 
+	gma_irq_uninstall(dev);
+
 	if (dev_priv->ops->chip_teardown)
 		dev_priv->ops->chip_teardown(dev);
 
-- 
2.35.1

