Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB01C0C62E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87C210E395;
	Mon, 27 Oct 2025 08:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WuFlvHcr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE55110E395
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:45:35 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7a26b9a936aso2527439b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 01:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761554735; x=1762159535; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DU0KscrGihyZoXJMago0IWkiGUoidqfLwL76Wss1j/4=;
 b=WuFlvHcrG85pRXijK+GCzpQqnZxrNIvqxV/h+Cf28Ha5qz81xWiuTzjhBB/UixHr/M
 IWl/qCKXxbXzfTqLx9mBqjg23URuza0c89nJJ11gibzZdpqo6M1Ns4YhpgJSMycr0xPY
 M4SIHQcIlJk9HdwyVEtebNPHrK5Edo5hrjkkeOkUSguLNoppcvTye7/icEM3jgwh1bDX
 2wHmmUiRMD/+cKZRqZGmSh8CpucD0y2BbQ1F6jCtNGgRnXv5KdBgH4Cj0e6XjaZwbTwW
 pV6NVsjL6XJsw1uG2rdYLPEDjG+OE9+z+ZBvgYe/OZ7IzBx+PDpLFYoRi9hemtZfS5za
 1HWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761554735; x=1762159535;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DU0KscrGihyZoXJMago0IWkiGUoidqfLwL76Wss1j/4=;
 b=JtqL5vqa9V07+LyLoAdHAgJ6GvyJBDd8b9TZ4Y5t/kWIek90QKw0kIYWAH9zW5FaXt
 qSNo4cRlmdh2hHzehCZbOb86g0qaaxd0hI+p1AJa2goEUVvIpfHIldf1YAAkztM5b6ea
 t3PGw2wACvTvdBezyFSYN27hQvLsqzoyABQlbTxPh0oPKLTeTBdxOn+Rln03UXL8HnnI
 dVuHbB/YMPTMyFQG2qmth8X71wVGPbOVc0llA47HIZXNbosROHrmO8azolko8X7N35FG
 ExHDFQInukzlKqJOWv8Rtn5qMxMozRJcGJwq2Jh6Zhe7s6y0vXdUEtKfOiaMIXTyVrrI
 9D6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2UDXSrnyzeJFvx5UWRUyHOyJfcgr9ycJ6SasILFvQ7jibVr4aCif/uhDH781h5/34BAcXZc4FsZc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJoPri23PWmBfYzupD7ljr9VCySo2YNgOiW60RGK59u7KTdkEZ
 OVUlPC2F6l7kI/qIUwBX87CVh9nONrHvSoGlL6x9NFRXR63KMyxliwaA
X-Gm-Gg: ASbGncsB0JxJtLdbtqqy0RJKrPMCYhLTehoZN6OrVaLOPTf9krrOTdRnmIF6oS1fB42
 0yIyYWXkHiFr4B+hafzPZyrKvoeoT+YnhbXhAmvA4+eX4gjLDkreZx49Ib6KvOQCDE2tqDY8Dr8
 ddsOYc/bwdnZgSohqsj8sE6zgAKzCmFtQn6Znenb4CYsKTp+RetCslz7K5zfUBXgBLNhe+J8/lo
 Eq+vskHByPPiF2dZ3GXD9xMacVDYA1oQeCYEEYHYF4HMpMVNRVSx4rXAAR0603aOEANLqL4scX4
 1q6UQYcgjzkTXWEWdH3GsG4k48jfGD7CfraQKALaXipZ0kNvkODrz0AzBRmZVLCNBNhsuJ8uk7O
 mo5EduDcSfh+h6QZHO5NVzvWf5dGCo7jAqpTmDw4WwZA0xrP8u81tW0TwJN9JV6Kk2kx8NGZ+Lm
 XJJ42CKdAtRw4H87Bw7qzwrBy2TeDex06q
X-Google-Smtp-Source: AGHT+IFlSNyx/m40xKYC6OWXlqmRmI+SM7/L6vothAHVO/hXw1MzPva0O5TbGE0SIfNFUBdqckDGkQ==
X-Received: by 2002:a05:6a00:2d1d:b0:7a2:73a9:96c with SMTP id
 d2e1a72fcca58-7a273a90b4cmr13811317b3a.3.1761554735303; 
 Mon, 27 Oct 2025 01:45:35 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7a41404dddcsm7300209b3a.38.2025.10.27.01.45.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 01:45:34 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/tegra: Fix reference count leak in tegra_dc_couple
Date: Mon, 27 Oct 2025 16:45:18 +0800
Message-Id: <20251027084519.80009-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

The driver_find_device() function returns a device with its reference
count incremented. The caller is responsible for calling put_device()
to release this reference when done. Fix this leak by adding the missing
put_device() call.

Found via static analysis.

Fixes: f68ba6912bd2 ("drm/tegra: dc: Link DC1 to DC0 on Tegra20")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 59d5c1ba145a..6c84bd69b11f 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -3148,6 +3148,7 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 		dc->client.parent = &parent->client;
 
 		dev_dbg(dc->dev, "coupled to %s\n", dev_name(companion));
+		put_device(companion);
 	}
 
 	return 0;
-- 
2.39.5 (Apple Git-154)

