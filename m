Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7093897074B
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 14:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEE710E265;
	Sun,  8 Sep 2024 12:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DnvEoBQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB7B10E265
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 12:14:46 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42cae102702so11535325e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 05:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725797685; x=1726402485; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eGiC1s7LHIW+WJEyU+F6KrakFty4Nm+Okd1FA4urZLY=;
 b=DnvEoBQO91jEvqriFHw3RnYl6Mrl7rEzgTtt6Qw0Dqh3H6ztZqu9lTQ4OKS3Pa5UHW
 jT0ywZ5UB7cRN8mh8nuRRxTfrXoFlSD40Zv9j8IUKDZlYn0AukSUXWhaYe8b6AKNgGlO
 u8wIPr4YEc0GRZQt/400BK6w4hW1T9No1ZBMeIpIBuFvntMgUdKiWvSk9GRssXnyTdn0
 3FLcp9Fl+t+Y3lYWvrvHJeAy8fnSdoVnVI/7Uw9rRt0zU3UOwXiGyqPWrNJQCkX9wGoX
 JHpnK3v3Dl71i4m6j5UenXahEdM6EeipT1Y0AEWOERfo+c7pDmgMbMZ9hoQqFnNAlpYg
 iNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725797685; x=1726402485;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eGiC1s7LHIW+WJEyU+F6KrakFty4Nm+Okd1FA4urZLY=;
 b=kGVGOxgW52tPj79RePrV1/jezY7MUa2jCKUjBnZupiP3GGNKV+KKn9/5mlSzeLjtfT
 cikLJuvtIDNw1Nn9sdECS2vXdEqOTnelG8AV/lQHLHxyKVQO/3j+22cUBVIxnxzGo9V3
 AiO6t1o42+AZCd7FXorPLIlht3Knudavl+mfbpzKUPDApLq80y6dkM/R7qThmXfmiksL
 MegIO41P+mNqYjV4J5sk3YlwQSgbtDngVjJnkl9xM8fUodcpwxT3yy/rSfgPC5G7UTcB
 TebxrtKgWAXiMCgib3aIN6CbWKSssTh3GPgqUcLeBFpzUrFkbvH8g7RtK+Cd1k2asrrK
 2kTg==
X-Gm-Message-State: AOJu0YzdM8vIfZrFQDMsHcf6AL2wz9Mt9OOp5gcji3zwM8vf+/Qggou3
 mEId5M1d5HCAjRmkmL/DEfNbzHhVnVUEC7Bzmj/reQtC5RcSHFrv
X-Google-Smtp-Source: AGHT+IGQk7JuPYgt98qnWiGDyfwzAWE8mJynUSzd3/aqXBGFAlHgHymRfKZrPasHvQIsRDk/igJPhw==
X-Received: by 2002:a05:600c:458c:b0:428:10ec:e5ca with SMTP id
 5b1f17b1804b1-42cae70f416mr30697985e9.14.1725797684755; 
 Sun, 08 Sep 2024 05:14:44 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bd18:a600:88fa:9e17:3532:fcf4?
 (dynamic-2a01-0c23-bd18-a600-88fa-9e17-3532-fcf4.c23.pool.telefonica.de.
 [2a01:c23:bd18:a600:88fa:9e17:3532:fcf4])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42caeb8182dsm42756085e9.36.2024.09.08.05.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Sep 2024 05:14:44 -0700 (PDT)
Message-ID: <9bf64023-cc27-435a-a1bf-f11816229d49@gmail.com>
Date: Sun, 8 Sep 2024 14:14:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/6] drm: drm/sysfs: Remove device type drm_minor
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>
Cc: "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

This device type is set but not used, so remove it.
Whilst we're at it, constify device type drm_connector.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/gpu/drm/drm_sysfs.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index b73c589c5..45a1c864a 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -50,11 +50,7 @@
  * drm_connector_unregister().
  */
 
-static struct device_type drm_sysfs_device_minor = {
-	.name = "drm_minor"
-};
-
-static struct device_type drm_sysfs_device_connector = {
+static const struct device_type drm_sysfs_device_connector = {
 	.name = "drm_connector",
 };
 
@@ -517,7 +513,6 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 
 		kdev->devt = MKDEV(DRM_MAJOR, minor->index);
 		kdev->class = &drm_class;
-		kdev->type = &drm_sysfs_device_minor;
 	}
 
 	kdev->parent = minor->dev->dev;
-- 
2.46.0


