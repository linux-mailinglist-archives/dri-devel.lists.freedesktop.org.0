Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0788CD2A1
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DED10E36A;
	Thu, 23 May 2024 12:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sAGxvl8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0AB10E36A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:49:42 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-354cd8da8b9so2045993f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 05:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468581; x=1717073381;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=28zbSoB8+Zxd+IxXtMzgHHKE2gbwNBphtmm6Xt7tCzg=;
 b=sAGxvl8dUSTw+clLIyC9i3cJVoGgUeWiX1Sytjc8CyUdDn48MZACU4UruR7Ja5zx8R
 7xt7f1C4pJwHufzZ7jXGf31zf+ENyTHWzZamU7nZKXUajYyBD+iuHPfSJwCxpk5FW7W3
 briR4cEmzAD15e4oZBDiQXBjQui7oITeLldO2GGe0vT7dMJJZBoo0QJxBCIcTGlRQbah
 6aueqmG2lw8mvMZSx8r6H6gMNrLXdrgju+AIfzg8aXu6+4AlDzIg3fGILByYG27A74W0
 3+qBvAzhJFZbDoDnKowdxbt9N3Dw3pM3SQVqzpuXZwA8ojQIqO+n133VvpF46j2nu7UI
 vunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716468581; x=1717073381;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=28zbSoB8+Zxd+IxXtMzgHHKE2gbwNBphtmm6Xt7tCzg=;
 b=qMs0T0nvC5NYcTSzdtwAI0AKTBKrO6bG0jRQWiKjGwHeikZl8f+MA8nOCnYjjjGaiL
 z+Ny/GjMJrTNwkRpKjSOiEz3DxpHieWW+FKUZ3+NZB06CHChr8/xBDln8C7YqnXLP3Nd
 gyZJpDZ6K4HLSbJKZSc5n/BQboSuOr6sTqVHCcYdbt89L4oSOB/6W0DNK3qvOwDD/JzV
 okxcloHCT0jG1MfUEy+WHO8kwflYnmbyNPXD6H3b0r9mu0DAPib7DaD3RLe7s/UdYta6
 dru4MjM6Umfi+Ot1f63cHU4wC8z08PqB5KWZqGMtMXTqNqLEB3nxuUVxBev0OqYk52er
 wL0Q==
X-Gm-Message-State: AOJu0YzCTJ1PQ8CYQN9fiGd6hSQZxCd3yJBy2V3XO6yGdRuI9s6uM3X/
 XKLv+FAC45ToKFrs6V0LUSnKBsx4QTSfvb6Sqoag+QT1LzJ1LDguNAISloaMdHs=
X-Google-Smtp-Source: AGHT+IH9I1yKELxeEkwniF+9niwDJ4iWhtTnG+NlRhabW9VWGojLsvUwjFjxu/LmyLyU3/BR1jPY+g==
X-Received: by 2002:adf:e586:0:b0:34d:963a:12cc with SMTP id
 ffacd0b85a97d-354d8dbc8bfmr3661763f8f.53.1716468581288; 
 Thu, 23 May 2024 05:49:41 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 05:49:40 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:24 +0200
Subject: [PATCH v4 11/15] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-11-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=/0McRX6GoM2+nGIkWn2jaKs7S924L4q446vEYfmzgP4=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTlpUBxrslkpM9KkVJFXYtjbSrCv5t3TWgUxI5
 XUvLM5WJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURWb4D/
 9wTBNeGwtAKm9fDQEgY3KlVoq3aw7N/I6ggPNiqm7lu48cT3alLmUEiAEH9cxr+ooYaOeF6xddtH9N
 Avqu+Na9+0o38iHIVyjOU/IB4Nrily2yDRjDJA1hvhAiygXW4A1rr7erHlTrJKuA6b2//3of5lwcpU
 C2WinPN+uvFvTf8s76ZBBRDLcMwz1YlFJDVcMZtHf9E+dCO1TDJ/LJ2LpyUQzYxDFC7dL9ClMU7bDh
 aRUcvXBSGYj02LWSk2KUBxbt8uL0pLsU5egoPTh0lwNl9Q/okAbJ31MY9AXCM02DXK/fha8WOx3xTw
 JhcIVPZo1pHFDMBCXeO00MmXu5eMyLfszMWYIpgAVBUZN7zkaJTlpoGza91wmPCNW7lZPpZLunm67n
 EjdgwfwctDV8gmmcaZagkU1NzGw/gQPe1/Nq6L/Xvp0LLsWKkYd7IlR/WS8XGhf3akmBJ+njq09a50
 DygPcXf13zXLX9yQoQPT499tok9k750eiHUe7iwpZRUlxp//nSGY7rK7GyWBCNjVD488SyNYYHpOxd
 3ZvRpJi4DnKnKauaFbFvyIFAJZDd7xzJn7haovlEAzvWt1bhVWvKVhImKpOcepGVrhBx73DT2+2SkV
 LVMKKq0yd/o08BjawyKMV9I+MVYefWOReRhG1sp/k3yb1r9aGKSO7tNJcPQQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
before mtk_dsi_poweron. lanes_ready flag toggle to true during
mtk_dsi_lane_ready function, and the DSI module is set up during
mtk_dsi_poweron.

Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
nothing because lanes are considered ready. Unfortunately, when the panel
driver try to communicate, the DSI returns a timeout.

The solution found here is to put lanes_ready flag to false after the DSI
module setup into mtk_dsi_poweron to init the DSI lanes after the power /
setup of the DSI module.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e036d9394c23..cb546a9e9419 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -643,6 +643,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
+	dsi->lanes_ready = false;
+
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);

-- 
2.25.1

