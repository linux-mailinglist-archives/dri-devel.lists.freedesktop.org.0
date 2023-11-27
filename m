Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E787FAE31
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 00:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FF710E316;
	Mon, 27 Nov 2023 23:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9ED210E0BF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 23:10:27 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5079f6efd64so6525717e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 15:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701126626; x=1701731426; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bFBvRvbyeQkmeHFtf4FwobIxdNGDTFW8Ona6LFco3UY=;
 b=gUEFmHtfXzCYVVQB3G3ZRxyq1L88w8GyaeJ8iRT3lLYzeDHDyOYRLfrAZZbOUB0rP4
 lzBIHRD2tg/8M8ahr+P1vg8f0G1yXOa9D+z2uyQbvO/XClwfZQ1M1Y/X59RAGJnhFNhM
 haN1sOTI9rwq7k7o5DzVnrH3prj7nxJi9eL9k5djiYgvXKvdEMU7XtWWG5QhuACCiMRw
 c8rI/TKuqdR3329dWMr3StRMZPjnRrjPFOF/Ac3wP8DgVdvDY+Bqjo5MEZilSZqm9Erm
 rFBPvGzk02nqtJDG0L1pE8YUv4PCg9uyFLPoiMYw0AtsPjVnWn0iaLrrfWP+U11zeviS
 xAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701126626; x=1701731426;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bFBvRvbyeQkmeHFtf4FwobIxdNGDTFW8Ona6LFco3UY=;
 b=uiqXU12HkBdYozSAWOZNxHucLkKpJHzCK302S7JL9nf8v0KMbuBqL3HTKOst5Yk3SN
 VDfh757GvPl3GU0vQSWjq75zmMe8BxjiQeVg6SmJH8COVNA8uJ/JBsWhutPt5wG4BFkx
 zLr5ovYup1xoFxwPZvmaC8AOPuaBswJ/4z++giSSf6JS9R36PiWZhVvK6lPJ8bABSzZD
 3LjWVh+4iAnodEcVEOi7hhYnlISeYatMYDce03J3wSydsWnVHuiGrf8rzGIIl1yRto65
 dFvmzqgO9tmc3y/hKeF6BOKBXC79558gJim5wQxL6JTpuNk0bl1zdPpdiDg2IIa2RbD9
 3Kzg==
X-Gm-Message-State: AOJu0YxM5NnFXzrsyWqbASmIdUgWsRWBp8ricnBT+Jpciut/8PBOWycW
 ghTV0lU39AYjBLJ7D4q+/5tCLQ==
X-Google-Smtp-Source: AGHT+IHDs7LKiVDhWcgD84ekXWzD2vRIoLMzcp8biogd3dgjxvKbFxjvr8a4CKDapNHrkGy1i8V05g==
X-Received: by 2002:ac2:4a6d:0:b0:50a:a9bf:a61e with SMTP id
 q13-20020ac24a6d000000b0050aa9bfa61emr8378429lfp.67.1701126625970; 
 Mon, 27 Nov 2023 15:10:25 -0800 (PST)
Received: from [192.168.1.2] (c-21d3225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.211.33]) by smtp.gmail.com with ESMTPSA id
 cf17-20020a056512281100b0050aa94e6d15sm1636877lfb.9.2023.11.27.15.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 15:10:25 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Nov 2023 00:10:19 +0100
Subject: [PATCH 1/3] Revert "driver core: Export device_is_dependent() to
 modules"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-revert-panel-fix-v1-1-69bb05048dae@linaro.org>
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
In-Reply-To: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
To: Liu Ying <victor.liu@nxp.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 1d5e8f4bf06da86b71cc9169110d1a0e1e7af337.

Greg says: "why exactly is this needed?  Nothing outside of
the driver core should be needing this function, it shouldn't
be public at all (I missed that before.)

So please, revert it for now, let's figure out why DRM thinks
this is needed for it's devices, and yet no other bus/subsystem
does."

Link: https://lore.kernel.org/dri-devel/2023112739-willing-sighing-6bdd@gregkh/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/base/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bfd2bf0364b7..67ba592afc77 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -328,7 +328,6 @@ int device_is_dependent(struct device *dev, void *target)
 	}
 	return ret;
 }
-EXPORT_SYMBOL_GPL(device_is_dependent);
 
 static void device_link_init_status(struct device_link *link,
 				    struct device *consumer,

-- 
2.41.0

