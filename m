Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8638D472B
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 10:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B14410EDDC;
	Thu, 30 May 2024 08:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eoZcqHzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51CD10E099
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 08:35:34 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1f4c7b022f8so5681445ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 01:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717058134; x=1717662934;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IHkwqtBAKIh1FT18Wf08tYxtDsD9mBo3yYE6cpTa5lo=;
 b=eoZcqHzg1NzpS4VWS/aRE1fS+aVt3oISvIYS0xTY9TCxmOWEb3fVh33l+eg9BW5EJj
 g8tEjPUyrCTSr2EujEg5vtKWvJpyXFJfc3LOHig7oLSB6c+Krj5I0m7jbuIhf7wo9Ne3
 XmWCi2CVh0Y3RTOu2mfLhpnEF5fiHC+lpysU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717058134; x=1717662934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IHkwqtBAKIh1FT18Wf08tYxtDsD9mBo3yYE6cpTa5lo=;
 b=qoQfgdBGqy5v7KzccCTAG776m7ds3J5VU/l1O6dzxDkbYBpaDUEixy6IcqnvCVjQ23
 q3fqFZHnsxXCb6FC2jq+DDo6FEL8JAJcLPGWaEA4tXNaAme4O03mqum8XDNhEPfpSYhw
 TBFA6jMPxWmI8oCrJAuB6uNz3rs/GBNgr8GV7btep0q5UaT5l4Pwzzst54WAOFGTaQB9
 Q18TgrYhqbqr3GHFGHYF97ven6Xk/S3ELTNgzGP2T93nw5ZDOVwqz73Skdz0TcU9KH+D
 9zqqqJW8bYYKhC6+/gtk57JCkb0SpCrFDHSQ+6unNI91cm2GGpqKNayZCJBnnbfGiEx5
 DQFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR5S4zsTkGir7XnxcZLoVAVEEMUwqkTS0j8WkjtJVy1VtCx+/XMnDRzTZt3MSsaJ4QWgNdXhKpreHMjXw84mE5HAlou6biaI2PcfE8XW55
X-Gm-Message-State: AOJu0YywsH2yS2j500Vbw6CqtEk5bsI7QLRaz81SY0/tHORmHcOVNEd1
 DB5SIIXACsQIjop8ZCN/2NvwF5OfQQYkHeHWYjHjCwM6L1fG3+CAgVSaR7TXFA==
X-Google-Smtp-Source: AGHT+IGaMXKlAuHj3tKDXFrEymwDvO07A1BRFroXZlN02EvX5mN7HsOfQHvylgHcYJoSPTNjRI9s+A==
X-Received: by 2002:a17:903:2095:b0:1f4:768b:445e with SMTP id
 d9443c01a7336-1f619605ee4mr11933665ad.24.1717058134222; 
 Thu, 30 May 2024 01:35:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 01:35:33 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] drm/imagination: Add compatible string entry for Series6XT
Date: Thu, 30 May 2024 16:35:03 +0800
Message-ID: <20240530083513.4135052-5-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
References: <20240530083513.4135052-1-wenst@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imagination/pvr_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 5c3b2d58d766..3d1a933c8303 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1475,6 +1475,7 @@ pvr_remove(struct platform_device *plat_dev)
 
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "img,img-axe", .data = NULL },
+	{ .compatible = "img,powervr-6xt", .data = NULL },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.45.1.288.g0e0cd299f1-goog

