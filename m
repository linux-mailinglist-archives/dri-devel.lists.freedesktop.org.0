Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A26218BE04
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 18:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA966EA42;
	Thu, 19 Mar 2020 17:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45F36EA42
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 17:30:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z12so3305539wmf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 10:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KdVK0dOTtxsCHG3yFkwkSQdVvO5AfUmYKEhbPilZuP8=;
 b=gcv5pJM3gYdQWuSZbOmAnHyr2wpaiBPs0UiZAkaZNB5z99ED7ueH2h1gWIhoWT8GKW
 lG1nwZzlroE2zv+VbEQaH3ip6+XJNwGi0tRL4fjYJP3NbRTLywkeENa93L7ifANNTiEI
 biR1CPjKZaHKEgfoVDFqZZjeXdfLoPeGWqbXJPVXZth5cpbiQ2hfF2g/YzyRGURLg5/4
 GVnsA9N8H2bnO+YauycekTlrcTDxHhOO3HOU5bDRz7Z2Mg4p+u2SuLF7NuspS6T8awhR
 fD05d5/AIWm2MQeD9pOh+WnK65fMnTIdBpSMAmAqpKTe59daQP0GQ3rUsoczejd6J9u5
 n+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KdVK0dOTtxsCHG3yFkwkSQdVvO5AfUmYKEhbPilZuP8=;
 b=YXc5j2s/PV0xYFpMCPSg3a9XDshabx/kFObsPLTMjztYHcH2+i/mEh511T5TshFADM
 baOTOs6Y8MqJjBzj8VUxBAqr1CK4rzrSgTwV6p/XNv3WlVTq0l4GOVlDqcCsZoTrkWSb
 0i0PJ8b1sH0/2tMYJJiB04PP4R7982HsxhqlR1pg87qts238vDrKmwiTVbZva+aV6vFK
 b5AeIUqEe0y3NoYO07Fq5IcwnmDzXZZbyvn+kkg5+iMlzap5I2Q9Am1sKVnvcaPXL6aZ
 coOF2wThL9apH3D3qXAheAiNSkXDtQgZiUMxqlzgVQIa6WYfiFaeS51q4CqAdNtCcTt0
 qzZw==
X-Gm-Message-State: ANhLgQ3UtkDIxoTXuJh/DnXa4hYaEJ1X9V/mI9LQq+wW2yhvAqIut/Vl
 QJ/x7k2lKLGrRqHdNS21cOJ2VB7I
X-Google-Smtp-Source: ADFU+vuApkqG6oJCCvRzScz8TrIt0Cih+bbHg2YjHwih0f3kupyMV9MTWUnbFHNhBLxr/ju1y1/Bfw==
X-Received: by 2002:a1c:4987:: with SMTP id w129mr3217864wma.168.1584639033162; 
 Thu, 19 Mar 2020 10:30:33 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id k9sm4534601wrd.74.2020.03.19.10.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 10:30:32 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm: error out with EBUSY when device has existing
 master
Date: Thu, 19 Mar 2020 17:29:30 +0000
Message-Id: <20200319172930.230583-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200319172930.230583-1-emil.l.velikov@gmail.com>
References: <20200319172930.230583-1-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

As requested by Adam, provide different error message for when the
device has an existing master. An audit of the following projects, shows
that the errno is used only for printf() purposes.

xorg/xserver
xorg/drivers/xf86-video-ati
xorg/drivers/xf86-video-amdgpu
xorg/drivers/xf86-video-intel
xorg/drivers/xf86-video-tegra
xorg/drivers/xf86-video-freedreno
xorg/drivers/xf86-video-nouveau
xorg/drivers/xf86-video-vmwgfx

qt/kwin/plasma
gtk/mutter/gnomeshell
efl/enlightment

Cc: Adam Jackson <ajax@redhat.com>
Suggested-by: Adam Jackson <ajax@redhat.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/drm_auth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 37cac0a221ff..a312fe1be50c 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -250,7 +250,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 		goto out_unlock;
 
 	if (dev->master) {
-		ret = -EINVAL;
+		ret = -EBUSY;
 		goto out_unlock;
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
