Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1505B91B6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 02:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A4710E1CA;
	Thu, 15 Sep 2022 00:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365EE10E1CA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 00:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663201983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJ+r++kfC5cLOYGbcZ2ityl6Btvuyg0jJylQkWmqY/s=;
 b=Xyoo3f83xrzjAH6ui2S1TFeaLuOxxE5B9zHbABjpOcVtep54h8/Ym3jOrFl+RZPXEGk3qc
 JJhvvxtOWQvRUHyiXqZ1IdT1fOq7xRTLxlPKFlPaNbuyPxdseuv7l19/JU5XrjwtAtRv1U
 hME+vrfZtHXMsDBN+2Ig3kBKFkMIjPc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-298Yn5PoOsaAo0qgkZJPTg-1; Wed, 14 Sep 2022 20:32:59 -0400
X-MC-Unique: 298Yn5PoOsaAo0qgkZJPTg-1
Received: by mail-ed1-f70.google.com with SMTP id
 e15-20020a056402190f00b0044f41e776a0so11775548edz.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 17:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AJ+r++kfC5cLOYGbcZ2ityl6Btvuyg0jJylQkWmqY/s=;
 b=yDIerrNdvAoCC6ojJ4/FeOw0QP9pM3MPytbAYt/8BHlY0TZiB1/1FXNKEhCIj5Kf3/
 FvSuCqOnYL8TMFS9GWEyghDTLPNZMRv+CBvrRbtWd78pNtm5pCClxNZhF2MwlJl1Ajo2
 WtF/zwoGulDlRkIxXPRTVQk6XmPYbyEn2+M9JQJA1lSdeHST3EcG9sUOJDGQsR970L8w
 A8VEZtYxj5g7HpNdlWz/pNNxJbiAtgq6YNnglQj8Lm+7ZjraaGIi5NuWHqlPglySVvGq
 JNLKsMCs8CyOqp4tFllzffl2BqTAKKloAxiFKiu4xqiHUdSh7ySRWEX0ijbnHWBKcTtV
 74KQ==
X-Gm-Message-State: ACgBeo1QbB4K7N7LlkeDJITUJQTLIk/knqK3EjXddVBwWIlXddeDw4NE
 1D5+2PMkzgQ3rfWz5RM9Q1CslqqLLoioPkhVK7SupZWyg/RGLT/sjig79nEpOzDQWCSSBvNYYKF
 DSNHyOLq9GeVnHbUuKHLUlWoGhkeo
X-Received: by 2002:a17:907:a05:b0:77b:b538:6476 with SMTP id
 bb5-20020a1709070a0500b0077bb5386476mr15229463ejc.324.1663201978453; 
 Wed, 14 Sep 2022 17:32:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6aUx7J56s8B+MvIs3ZSkyOZ3rDzmk5K47Dc+uS1kdk6njw7e3KJEUrvUuZKRX+25BjZL8S0w==
X-Received: by 2002:a17:907:a05:b0:77b:b538:6476 with SMTP id
 bb5-20020a1709070a0500b0077bb5386476mr15229452ejc.324.1663201978310; 
 Wed, 14 Sep 2022 17:32:58 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a17090618b200b00773f3ccd989sm8240828ejf.68.2022.09.14.17.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 17:32:57 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next 5/8] drm/fsl-dcu: use drm_dev_unplug()
Date: Thu, 15 Sep 2022 02:32:28 +0200
Message-Id: <20220915003231.363447-6-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915003231.363447-1-dakr@redhat.com>
References: <20220915003231.363447-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the driver is unbound, there might still be users in userspace
having an open fd and are calling into the driver.

While this is fine for drm managed resources, it is not for resources
bound to the device/driver lifecycle, e.g. clocks or MMIO mappings.

To prevent use-after-free issues we need to protect those resources with
drm_dev_enter() and drm_dev_exit(). This does only work if we indicate
that the drm device was unplugged, hence use drm_dev_unplug() instead of
drm_dev_unregister().

Protecting the particular resources with drm_dev_enter()/drm_dev_exit()
is handled by subsequent patches.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 4139f674c5de..3ac57516c3fe 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -340,7 +340,7 @@ static int fsl_dcu_drm_remove(struct platform_device *pdev)
 	struct fsl_dcu_drm_device *fsl_dev = platform_get_drvdata(pdev);
 	struct drm_device *drm = &fsl_dev->base;
 
-	drm_dev_unregister(drm);
+	drm_dev_unplug(drm);
 	clk_disable_unprepare(fsl_dev->clk);
 	clk_unregister(fsl_dev->pix_clk);
 
-- 
2.37.3

