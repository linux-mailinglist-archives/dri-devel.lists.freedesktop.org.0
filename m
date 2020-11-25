Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 825D72C48FE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 21:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE7F6EA82;
	Wed, 25 Nov 2020 20:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C696E902
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 20:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606336034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyv7TmTJOo07L0V0MDDH9iBw1ZsQzWrWnebIO9wiR7I=;
 b=hqcsi9Ndym+PkgxV8R6VPO24B9vzBcbbQgS6E0wBtnA3jnP/4QtiiRJSyTnI2ZYhpC1pXD
 a1tELuQKgm/ZsrLfarszL+cKPW5x2joRu1+VWFrc1IWDDGFwBn64zTnlyAgSfoZPLnWGUY
 WR1moBXBgxtgST6Sv7QfgJDlVNlPjLA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-yllnBkmHNLuJG8AXvAlpiA-1; Wed, 25 Nov 2020 15:27:12 -0500
X-MC-Unique: yllnBkmHNLuJG8AXvAlpiA-1
Received: by mail-qk1-f197.google.com with SMTP id q25so3279361qkm.17
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 12:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oyv7TmTJOo07L0V0MDDH9iBw1ZsQzWrWnebIO9wiR7I=;
 b=Vj3HRWpDxn86XiYzmPDLtSpRCNmqSlt2wqmVt0i8p2GVq5TjY6y0GhX7uqMG3/6Ogy
 f5aiojYDcFxPjsJ1x5HiAhXnuWR9TsR5jk4k83bGrEhab5rOij4Vr3Dzm8zgb7mG6qQs
 ZALN3YpvjeQ+xiohTf0bqZG+mfuMQ3n/fYYD4fdzXcqbzKLVIOwvp0XPthkzqOFYzUou
 5efw+v1oIN+cKaJp/rNV8j4h44YRV8Y5k6VTygijFsiNkrrPYwlg62UG817t7T7St9U5
 O95erb5Nf8Tj0B4Mh0BeCNXtrHdUJs/b/yfgfHLDqdXb1N4tAagT8YkvrFiYjpPbTn3w
 cu2g==
X-Gm-Message-State: AOAM531cSO1R1nChj8Zz1Dtx7da4w2Bb/BZHVJ3cpHd1K9b4wYgN/7E1
 vmzMOYlui/KY4tc7rh5em26pV57F26rP+z5ur3JAc0lEmCXATNRv32jEQK9nq7Y4eoq9rNeLcRI
 QVwBnB0AJ5d6dlQKqddMragER+jtS
X-Received: by 2002:aed:39c2:: with SMTP id m60mr663840qte.206.1606336031654; 
 Wed, 25 Nov 2020 12:27:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKH4xIOuYE9iphSs67b2xooUR1MwfVJh1L82U2A+W+f2xs7dI2EaoZEqdNs7n2LbREsN/4Fg==
X-Received: by 2002:aed:39c2:: with SMTP id m60mr663825qte.206.1606336031489; 
 Wed, 25 Nov 2020 12:27:11 -0800 (PST)
Received: from dev.jcline.org ([2605:a601:a638:b301:9966:d978:493:6a3d])
 by smtp.gmail.com with ESMTPSA id o187sm431772qkb.120.2020.11.25.12.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 12:27:10 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v2 1/3] drm/nouveau: use drm_dev_unplug() during device removal
Date: Wed, 25 Nov 2020 15:26:46 -0500
Message-Id: <20201125202648.5220-2-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125202648.5220-1-jcline@redhat.com>
References: <20201103194912.184413-1-jcline@redhat.com>
 <20201125202648.5220-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jeremy Cline <jcline@redhat.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nouveau does not currently support hot-unplugging, but it still makes
sense to switch from drm_dev_unregister() to drm_dev_unplug().
drm_dev_unplug() calls drm_dev_unregister() after marking the device as
unplugged, but only after any device critical sections are finished.

Since nouveau isn't using drm_dev_enter() and drm_dev_exit(), there are
no critical sections so this is nearly functionally equivalent. However,
the DRM layer does check to see if the device is unplugged, and if it is
returns appropriate error codes.

In the future nouveau can add critical sections in order to truly
support hot-unplugging.

Cc: stable@vger.kernel.org
Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index d141a5f004af..4fe4d664c5f2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -792,7 +792,7 @@ nouveau_drm_device_remove(struct drm_device *dev)
 	struct nvkm_client *client;
 	struct nvkm_device *device;
 
-	drm_dev_unregister(dev);
+	drm_dev_unplug(dev);
 
 	dev->irq_enabled = false;
 	client = nvxx_client(&drm->client.base);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
