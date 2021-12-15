Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5319D474FEF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8350810E1B7;
	Wed, 15 Dec 2021 01:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C4010E155
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4v2Cdkkc86EoGFiSfZtWSuCTFtKbYEs+OLYgRjBvGt8=;
 b=D1Ch1GM1ZtLTYtJhKRZdcyZrnbw/o6t8cgBwFGujI4LoJsetxbaxLN4jpLnMS7/mNsZCkz
 V180+Av8l4sqkBWifb+1hPnSASnO5xJaVjasNAh4Muz+t52zZRhmaqxgOyU34dEZpyFGal
 0atz/XHdD1ie4ashEc+I2oWyYutxplU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-3FFTjWNHPhaBoZ8y4WJGNA-1; Tue, 14 Dec 2021 20:01:13 -0500
X-MC-Unique: 3FFTjWNHPhaBoZ8y4WJGNA-1
Received: by mail-wr1-f71.google.com with SMTP id
 h12-20020adfa4cc000000b001a22dceda69so94070wrb.16
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4v2Cdkkc86EoGFiSfZtWSuCTFtKbYEs+OLYgRjBvGt8=;
 b=TQvj9Vk0xBsSPCNPpR7QsR0kd2HJ3mn7ILvBDLf5121feHvUHTjYXemBjSSpLaNQHq
 O35M7UIUe0e7gEim1WaCCDiS7uPifSrgO9rWlnU0GS0J0iCMuC86lXgqZ3yNvq6qqb0c
 dBmB29aWwFzSAfUiNRX4ZB21/Y1sq+g27DTLCvefRFCyu+n85ENhklXCNy/o3AveT9yO
 4Dsj9YbF2nI+4TAYsC3lyPiwOrmL0XC7eZuWGXu4NGwbmjqnH7l/q2TWYSIkdbO5s5zK
 0ND9I0qY/FKZhVgTkLi7vpQti1p65IL0d/lir01r7YI+D069/IFUI6w9I0SsVr8VIjfx
 7vmw==
X-Gm-Message-State: AOAM532si9ODdGBk3Lf3YSjbO0oQQrrr/uAn4ARzwvlGFShrGeiLfboG
 SWlLtcxK5mJ/FArFssxmFc2DTIqP401V63UwrjqYtZ+C1CbESH2agdf5pcfFjGKvL8raCTEv30+
 ZXNn1vV3wvT4oxGWiI5UMhUStPrYu
X-Received: by 2002:a05:600c:4fc3:: with SMTP id
 o3mr2180596wmq.147.1639530071807; 
 Tue, 14 Dec 2021 17:01:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRgo4oee72DiQIAzT8vtMRiCvnx6s1mV/IDHw6fAFur1PTySFdTzwVNjAp/rnPgigfO3wCxw==
X-Received: by 2002:a05:600c:4fc3:: with SMTP id
 o3mr2180582wmq.147.1639530071585; 
 Tue, 14 Dec 2021 17:01:11 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:11 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 25/60] drm/msm: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:33 +0100
Message-Id: <20211215010008.2545520-26-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215010008.2545520-1-javierm@redhat.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Sean Paul <sean@poorly.run>, Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the systewm system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/msm/msm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7936e8d498dd..eb098475224b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -518,6 +518,9 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	struct msm_mdss *mdss;
 	int ret, i;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	ddev = drm_dev_alloc(drv, dev);
 	if (IS_ERR(ddev)) {
 		DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
-- 
2.33.1

