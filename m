Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C55A81652
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CA510E73D;
	Tue,  8 Apr 2025 20:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gZLCcGTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9A610E738
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 20:09:34 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so41010005e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744142973; x=1744747773; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Oeax+taIOF2LaXOQfu9lrknbbu6k66PRaU7k7RYMA0=;
 b=gZLCcGTcqzg1IchE3kMAaxUVDyZdm6FDFNENBK4fJ2mDTE2tx8BuEVrpKy/cRFyTVe
 6c/RavnJlntlIFtEhy7uYuVS4Aw55RfisURA8WbfcnEnH+KZidGjgxsvpD3wcPe5IuK5
 N3RJGhC0GVSVryFT2OOH8fYrlIy7l6zsVPxa4FVOGirzDBbXRSfn/0am3jthYHazuzyM
 iHSPQy1TGdDZAa106ybvHj2/LuYIbuff4nhU2Lk9kgqoiXQY72y9pT1dMBpCXCzC59vU
 LpWtP+6obJU+NnmsVkFofDdlQMH2E6eRT8BhRnIB21WcoDKq3A5VOkdSMY+ZlCReaJY9
 TuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744142973; x=1744747773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Oeax+taIOF2LaXOQfu9lrknbbu6k66PRaU7k7RYMA0=;
 b=p6AcYNFwKhhMdAp3FFjsQWSIjTAiI5ViqXvdS/cQ9E464NsGwQxEJ5fgmfRMs9A3Tn
 3BpEzXPffvsyfqEygf+1k0VK4mnIO6spPKY+njvR9v1jRaeeVIrduAF0wkC93el4Re2q
 Bzh8UE5hMsndKIMkhDpWu2bDerqZk2N5MIzKCAbOT6+ZhU9tumJpDQrkXAd/VXcxif44
 2IsYZF85yKNRnftD2COJhvV70PYrl1pL95CINkYbFi03Q2qQjPqd7uXLNpweZXpVviwT
 HU6gm1ZZqqlsJLVmGC5aDrY3ZVhF6nvbuo3Hhq6Gx03gp2V3gS7mgrTrxKVlCaaU4T1l
 oKZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqQ5LdsDxVMQ17rKGX+7N61OlvZTXox0avS96PYIWcdwSkoVogpPwXL2GBSY6EPa0iPFnIxuUYyKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzBvKcg/6hMkzK4ZGZKLewOBhHPnxSbgGz2dX0PPLJlaaX7BNE
 FwZjfePtmpV76Jh0I/OxQhj3LNXQi5ddyxTFxknf/HDQfhIDz4pc
X-Gm-Gg: ASbGncv3K8T6mJe3Uc0iUo7m6O2EvLagaoos1o9XduM5J5jHl6dgwGuzJbIOgKQeAeR
 MglQigEX1eS0GazJAnNVspFeKZ0WVPncCvnhVLjv113AmlzAYbwT022GRt4/oHu5nnMQe/lMB0s
 tCq3kIm//z4RVdVoDijqHjgzkHyxqjmMot3bKBDGnk8RL0waTwtDaCr5uPsJcvbk3CbFcT/Tp9E
 OxpZ+upx60Oc4UMV+cM7QlchR0UyXiB8dlJnuSgtHwEHln0LeQ25zRJ5yj6gdKYxqaidOXUXDIU
 vBYenL8iih7IEPDhxa4IlUQOnVW2ejBvBAdgS35XJZh7Z4ntG8YRZ5iuj6zA/umiJ/q/
X-Google-Smtp-Source: AGHT+IH7Ae6ykmbXIDuFpKuw/QhBa6DXfXQa+S5ke53WnVI5MFIztSs0KTGEiv0645m3mQX74QyYGQ==
X-Received: by 2002:a05:600c:3b0d:b0:43c:fdbe:4398 with SMTP id
 5b1f17b1804b1-43f1ec0cbc0mr3666045e9.6.1744142972816; 
 Tue, 08 Apr 2025 13:09:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 13:09:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 06/15] drm: renesas: rz-du: mipi_dsi: Add min check for
 VCLK range
Date: Tue,  8 Apr 2025 21:09:03 +0100
Message-ID: <20250408200916.93793-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The VCLK range for Renesas RZ/G2L SoC is 148.5 MHz to 5.803 MHz. Add a
minimum clock check in the mode_valid callback to ensure that the clock
value does not fall below the valid range.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
- Added Reviewed-by tag from Biju
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 4550c6d84796..ec8baecb9ba5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -584,6 +584,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock > 148500)
 		return MODE_CLOCK_HIGH;
 
+	if (mode->clock < 5803)
+		return MODE_CLOCK_LOW;
+
 	return MODE_OK;
 }
 
-- 
2.49.0

