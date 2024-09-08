Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A776F970749
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 14:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB4210E264;
	Sun,  8 Sep 2024 12:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k2f9w2xC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0E710E264
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 12:12:35 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so28563395e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725797554; x=1726402354; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mNV5vn8l5uZ1431r/aGCArHrETkDYNIRUjy3wvIhAvY=;
 b=k2f9w2xCoc5OnOUZithCR94/rchtVuqsKYseDqY64d7i33OIuhZteMzxGxhAl2o+Au
 IruM6vqCsBf9dxqrUJ27/BB1lZIIg0kWR1y9v2PW3w3fivWnPQ/TUEwz3Fk9wZDhNq6T
 IZ6AD+6MQdiM4Bjz8xYFqUezkBsM3v1vAFqdJYEopuIUZ30pXw+SSL/ObA/5rcWTpRd3
 kwkzTcz7G+/bLpR4/miGBOZk2udMegQaCJxhk/mcR29cDjbwoswWqHycaIlowAvWlc9e
 EKUfQlDZ1mELQXeX85Zk4bpxkhOev78vXJ+fXJQVGmilYpJZRgTUXmyCFHy7PSKBWnXk
 WV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725797554; x=1726402354;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mNV5vn8l5uZ1431r/aGCArHrETkDYNIRUjy3wvIhAvY=;
 b=uWTQ3b0+VMP11kRW36T4roFv0im3o1TFh717G5oQd7UxRUITSb1I/+Y9eZqcxnY0i8
 wNgaU98iSme8tg6gvUB6t8gDyQ0zCm1f+NbVD4aEifb81tDe0EGYd7XhwA0mWgdJs1UG
 8oUBVMwkeN5S2JVOCaCfS1etsnpJqK5UM6nU/O9WOPx5CLF+4jfBLEA4E42nFiwI35DD
 HVrSOPPoZ9kmdv7LW71zDNKg9e8Zgt6UXfBcgii0Y392vLCCnTpTpT0JN8f6T6dZ+uJX
 ICI2qzmEqU/z/4dxTXzVIQ7V2YP0PdxSIkANcigYZ/WJdphHBcFBXtVjjudT6COLCMPt
 Qp6w==
X-Gm-Message-State: AOJu0Yy1a+6RkacFE3dLGUilD/MhdKiEdYw+f9f21RH7o17P434wz8AJ
 TEk+rBgoHRjR/pQqU/sDa9eAzf2g/y40qWL3CBRkAJ+ufat3N7w1
X-Google-Smtp-Source: AGHT+IGGwLarIw8jneKc+fPJFi/Xz9ip5mkVtPc37VKAva1YtAn5mti0NxmvhMUrZGhh2p0CBloxkQ==
X-Received: by 2002:a05:600c:4f86:b0:426:6000:565a with SMTP id
 5b1f17b1804b1-42c9f987321mr57899465e9.16.1725797553641; 
 Sun, 08 Sep 2024 05:12:33 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bd18:a600:88fa:9e17:3532:fcf4?
 (dynamic-2a01-0c23-bd18-a600-88fa-9e17-3532-fcf4.c23.pool.telefonica.de.
 [2a01:c23:bd18:a600:88fa:9e17:3532:fcf4])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3789564a1a0sm3257545f8f.23.2024.09.08.05.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Sep 2024 05:12:33 -0700 (PDT)
Message-ID: <8f5fe817-dfcf-4cda-9ca2-99648a48534e@gmail.com>
Date: Sun, 8 Sep 2024 14:12:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/6] drm: Add __init annotations
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

Annotate few more functions being called from drm_core_init() only
as __init.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/gpu/drm/drm_cache.c     | 2 +-
 drivers/gpu/drm/drm_connector.c | 2 +-
 drivers/gpu/drm/drm_sysfs.c     | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 7051c9c90..dac790108 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -329,7 +329,7 @@ EXPORT_SYMBOL(drm_memcpy_from_wc);
 /*
  * drm_memcpy_init_early - One time initialization of the WC memcpy code
  */
-void drm_memcpy_init_early(void)
+void __init drm_memcpy_init_early(void)
 {
 	/*
 	 * Some hypervisors (e.g. KVM) don't support VEX-prefix instructions
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index fc35f47e2..96b234af7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -112,7 +112,7 @@ static struct drm_conn_prop_enum_list drm_connector_enum_list[] = {
 	{ DRM_MODE_CONNECTOR_USB, "USB" },
 };
 
-void drm_connector_ida_init(void)
+void __init drm_connector_ida_init(void)
 {
 	int i;
 
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index f443f9a76..b73c589c5 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -87,7 +87,7 @@ static struct acpi_bus_type drm_connector_acpi_bus = {
 	.find_companion = drm_connector_acpi_find_companion,
 };
 
-static void drm_sysfs_acpi_register(void)
+static void __init drm_sysfs_acpi_register(void)
 {
 	register_acpi_bus_type(&drm_connector_acpi_bus);
 }
@@ -139,7 +139,7 @@ static const struct component_ops typec_connector_ops = {
  *
  * Return: 0 on success, negative error code on failure.
  */
-int drm_sysfs_init(void)
+int __init drm_sysfs_init(void)
 {
 	int ret = class_register(&drm_class);
 
-- 
2.46.0


