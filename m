Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE2E9AD18F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB7110E84A;
	Wed, 23 Oct 2024 16:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="UwLLNGuB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72E410E82D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:53 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43168d9c6c9so51276425e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702252; x=1730307052;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rM/PLpT0bJIFrHHYZG7pNuWN750b4ZOA/oUy8wRZ+s0=;
 b=UwLLNGuBw7/ZfXVUpx7hRjTpHi+zex/1/X+D50WC83h5KoW/6eEr5UfB8319tigYjA
 Dvh0MCo6EqauIKN0zN63uEXcrQ0ABdsW53zVwZ5bk91NgZP9l5adseXeY3LqAsLB7kXg
 X4d60Q/g7PzqYd87zRIMFD5TCOfTY4ayhfKUyKKMwqBb2amS9olyxHvRrTedbCrp8JfG
 qdsIdXACjVg5F8jVWfVw+2blXHGoyiPbAa5gBy/U4rBUPQh264vEQbEB+jef8dXuFgN/
 TyQ3NW6QtmyjNq26g8kj4d+xFQEYMqlVXNGGr5KplJIsZZTp37e3jGLmRRxrV3tEeEhR
 GN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702252; x=1730307052;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rM/PLpT0bJIFrHHYZG7pNuWN750b4ZOA/oUy8wRZ+s0=;
 b=nnx0jRUUhRUhHk926qPcvmJOYRoOKvd6msRJMvbab0TjWCJWeNawlFKRv6jZgR9cB3
 OWc61SST2VXgzcmLjY1S2b0oRaGu+9n5mtDZ3N+0haY82CNfDnH+vq86ehv6mvsQaYzI
 HbeLRj8ZiBjtKl8xN47BZ/y+dHGwIXWtwyDmc8Db7sORGzBh/c7cWt1FopOb43mVBIPp
 U+9FpknIPs4oaZ1Dc318PISs8JVwz5iLg0Nme6tLl/JViWR0pVqgDGEtQIQphSV3JqZy
 knBKN/wBxtbunc7P67MNKK8+7TiIfnzCbNufz7D5/7OOGevpbrMbwasCWwdmh1J82urZ
 8UgA==
X-Gm-Message-State: AOJu0YxtXqIdmSDqHhEvqhuSi9VA+fpHM+n1ZW+od0SaU4pjdmz9RMaI
 myvqPHBOoePiI0gvhj3rmcu4VKk8fcHR04S0Tred7aC70JknpmpxenfY6HESIM0=
X-Google-Smtp-Source: AGHT+IHztOCCr87oR87Z3+JBdAivrEgxHT4i0hywZWr6jUvTWMEc0lm3QWh2DVlbarj1WpyyJN12PQ==
X-Received: by 2002:adf:e009:0:b0:37c:cc60:2c68 with SMTP id
 ffacd0b85a97d-37efcef190cmr2044356f8f.5.1729702250772; 
 Wed, 23 Oct 2024 09:50:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:50 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:28 +0100
Subject: [PATCH 31/37] clk: bcm: rpi: Allow cpufreq driver to also adjust
 gpu clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-31-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1
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

From: Dom Cobley <popcornmix@gmail.com>

For performance/power it is beneficial to adjust gpu clocks with arm clock.
This is how the downstream cpufreq driver works

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 6d5ee1cddded..274176a938c6 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -156,7 +156,7 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 	struct raspberrypi_firmware_prop msg = {
 		.id = cpu_to_le32(data->id),
 		.val = cpu_to_le32(*val),
-		.disable_turbo = cpu_to_le32(1),
+		.disable_turbo = cpu_to_le32(0),
 	};
 	int ret;
 

-- 
2.34.1

