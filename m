Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB398488EA
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 22:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC0010FD13;
	Sat,  3 Feb 2024 21:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="qv2Yqelc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCF610F749
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 18:24:43 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6ddd19552e6so1812114b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 10:24:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706984683; x=1707589483;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:dkim-signature:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KzZQL8rSLrwKDPYyaVTOC54buQP+RGECHRJE70wSEUM=;
 b=LU3Kd9WLwD7sbBF3l9E1zx7tQUcV8OLPwp7/b9TjBuNr6nT8Nuiwh8n+noI2IsK2lz
 AH13ejrBnxmlUMaNn7xs+umVxrxpXHt6E2NZRiNWhDt92IITlf50j9mJ8JwN08YJpzUE
 +5R3VL8Tf1vZJmYJeIjn0356f4SOb4kuRuWgCQQu8QC0+M1p8kWOWDh0Gv7LobPwwUr2
 TsI2yJFnTixz62+28eKXBTYuwToNMcJYjGfbBP9Y0KO3k8qTRWF/vG9g91lFSLY7HdoU
 /K7wAbD4ErXDncKFIgSYRRsvdrdWdzm0Yfsbfnb0pN8hof5kh/gGjJqfrELm98kwPkQo
 SRJw==
X-Gm-Message-State: AOJu0Yz4GYkDDuWnpo6+V4I/vdtQsm5Gf4V6/I+h0gLXisQQiFEjVMCV
 6kela9Gzy9wHtlm8Y89xxP/3YchRppZIPDUk/hClprwM7cSW8COz
X-Google-Smtp-Source: AGHT+IEILJLjfVVzQJ3+jtnCq+/VzJxVyccXhsxT6jLgQyU2VxtZYf3msDjaLnpW1BWqssRhdHFDlw==
X-Received: by 2002:a05:6a00:99e:b0:6e0:2eae:c6a4 with SMTP id
 u30-20020a056a00099e00b006e02eaec6a4mr1218611pfg.26.1706984683151; 
 Sat, 03 Feb 2024 10:24:43 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUAnhW7+7ZZR/+M3OqkVol31iBtpyxjnwRhUfxk94DLZtUWCsNi+JRv/8wJtWqleLKh6/huZxMNandBP6p4b/e5MgHuQ+QQaEeFEZFFFVbjz90N2npVCnZg4JIac8geK0XSaaR/e6u44AE/uG4cIjBoVmWlRehk4yPRhAaW0gNJuSQe8F4oDr+VIwQC/cc8JRRbKOT7TZIaQ3V/xgMcRADrgl4thCBLLmzM6bXqWvn3DRfK/B7e
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 ld9-20020a056a004f8900b006d99056c4edsm3653164pfb.187.2024.02.03.10.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 10:24:42 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2023; t=1706984681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KzZQL8rSLrwKDPYyaVTOC54buQP+RGECHRJE70wSEUM=;
 b=qv2Yqelci7CqWkXp2npcOdmxqHAEdbh/mnvcOkN+vXhYboPX8TiUHRiOfxneevQAzEPpub
 RZSECHJTdXj6mQgf6vh14WUlOgljvEbM3ywYnZ0K/Fto+mF04dqPlEQFcYywF/7z8dU4l4
 wdlQ3SrqWVLM7zXCSyyjT8EGJTFg88LxbbTvAQvHIzjyAWEst43VXY2hOrFD5pTX+lNSde
 jk93IkcYw6e8oDAYOe1zDNA4utzygw2YaG8BXQ/qZwq9H2SL63aFVnXwNJa3wBO84CEhoh
 hx3U2gRiZS6DDuE5Lqvz8dRKKNcfLP2nQ5sXr6lM0ZGQRdGFQOuSBFcVYEBIEw==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Sat, 03 Feb 2024 15:25:03 -0300
Subject: [PATCH 1/2] drm: display: make dp_aux_bus_type const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240203-bus_cleanup-gpu-v1-1-1b6ecdb5f941@marliere.net>
References: <20240203-bus_cleanup-gpu-v1-0-1b6ecdb5f941@marliere.net>
In-Reply-To: <20240203-bus_cleanup-gpu-v1-0-1b6ecdb5f941@marliere.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=PWGIF0SB6BlBgK8TT4wQwOjd9acucA+/T3Wm8oL7Q9c=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlvoUBQ8Ijrp8ZsUoVm9cfxF+uKmjw5CLni5fKV
 6KxFLWPyFyJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZb6FAQAKCRDJC4p8Y4ZY
 pghbD/4uskt44jqKw1/ZXMHt348KW7amF7zcEnyCfk4/ychYObeyJgPQTUcTn0TD0fPB5mxbrDl
 qKoHCi3kJL8H2EiokwzIMDit4F75ARVBDU01eTXqkKynASAsr7HVOgi9c+hkzfFogDKcI4Sg8k3
 zPrK5VvdMUcG9XW9czn7FRTlGOu09fqa0D7+6jbZ5eUaGRWGAI6leNxJKOL3cf/VTzFk4AjQt+m
 aXMI+UbKBbcR4c08yXKm+YQb7cwQaLRiZtxrG0p4dcxs+JDrYpSV3EAfZ/FBEVAnKcaf5r9p5Xl
 FZZY+vYtAvgMzKu65xSvD+XBS7TeCqWZXN3D7Hn1n61my/6lbUUxP6Jhto1If09ySKHlOQULuw+
 bGIViaW/8INa6qRKWyYte9jN70yCoMpc4BfIpyaAhvtc49/RoNFlJtTGxhpUR4r4jeC/Zom6Tf2
 vMUi4wVDjYDCbBfc9Caz66oxu2GB2yEpUD3tAwAjxWDP8dCJXOLtUG0bH+SI1mW+uqbDSV40QuE
 w+JxoohW7zNNF3NQ2zDblodV56UQUUW2XqJLhG2TyZBNkKMQ8m1dt1OyJQ4gTyJGsWyeRLKzAc3
 1H/xKgxOPlfSfeiwCjlsZ+BTDZdh8uk0Uh99at4taLUlFbsjf9yBECtf/MpR4lOg39zr/g9SqRR
 EOSabTz+a/qCNzg==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Mailman-Approved-At: Sat, 03 Feb 2024 21:20:22 +0000
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

Now that the driver core can properly handle constant struct bus_type,
move the dp_aux_bus_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
index 8a165be1a821..5afc26be9d2a 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -127,7 +127,7 @@ static void dp_aux_ep_shutdown(struct device *dev)
 		aux_ep_drv->shutdown(to_dp_aux_ep_dev(dev));
 }
 
-static struct bus_type dp_aux_bus_type = {
+static const struct bus_type dp_aux_bus_type = {
 	.name		= "dp-aux",
 	.match		= dp_aux_ep_match,
 	.probe		= dp_aux_ep_probe,

-- 
2.43.0

