Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B4120CCD6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 08:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CE16E40D;
	Mon, 29 Jun 2020 06:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9842F6E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 03:18:54 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id g139so8231241lfd.10
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 20:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eIzUXuD/V9HhUju7GTzLWPyzNHW6BnF7bRxOjSTf+QA=;
 b=Lnybw8IMZh3LIPsv2LLMXx0o558bQJ9g1Zmbo841kAIbNNn+UQPOHFcXxeI4V3brht
 2J1gQ4Z4SoMWJm6N+wgQWjDTh/xrdsE4FlCPDgbqNpT4kphDW9aIfSqahyY9cG6cHffA
 IuhbbNDmqLocfNqNOuoBKc4FGzwlbF4pxbnIu4XSYjYd+tlc9L0nmXhlyt13aj/tenPn
 j5kq+GsQKNMT4uXHJlwxhi7ca/Xv8tgZ91Kh8TDbHkzmow4SExncJwRrzs/d00h1C1r2
 esZyu3IGXNfWzQS7q73ODifE8OJ2oyf4HIYYDsmcBpHuQAvN6zfWbUWk6nf6IdMqmXLc
 vFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eIzUXuD/V9HhUju7GTzLWPyzNHW6BnF7bRxOjSTf+QA=;
 b=fAA8y0DvoAarwmZlNW3qZSZgAFTBacUna8yVa92XbAX5Oh6CoT7SblU+Um392K424E
 pIH4g/Gnx7moCFu6+xWAGXZFPra8gXGe1mfA9VQKj75Z9dVKt1squZb+6xHkU0Xm3tmq
 3ebjZS1MFcUFxLqndhuuU/Vcgvn3gRFa7fE6cDkMFw9c9YhCiqZbQMnUWvnun3Ev8PNb
 DmGc5PVG37FvUNXLas+Y4kIF8/v7SDDloY/0P8O/aIXTAYezcrn9U8iSRU+0i6aG7j8F
 XEPqaMK1D/G9qi3ziYIsZ1WetGaYV4V5dnKUDAaU+wjfYWIuwMbzzLR9o7t43mxYJhMH
 f0Rg==
X-Gm-Message-State: AOAM532arPo9TmnFd8D4dxmIaqnzNhMahEgwPC1Rz2D0RIiUwYs7jY8D
 j7sAbnD6K7elneZ7AmLadCk=
X-Google-Smtp-Source: ABdhPJzBYIs4TadHSeZSXIP8OyR8AiFEjm2k4Io02tnZ6VU2Hro9znaBYBj0ZWg9e55WIr6XrFgzEw==
X-Received: by 2002:a19:435b:: with SMTP id m27mr8189493lfj.40.1593400732903; 
 Sun, 28 Jun 2020 20:18:52 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id m1sm2383295ljg.60.2020.06.28.20.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:18:52 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v2 1/6] drm/tegra: gr3d: Assert reset before power-gating
Date: Mon, 29 Jun 2020 06:18:37 +0300
Message-Id: <20200629031842.32463-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200629031842.32463-1-digetx@gmail.com>
References: <20200629031842.32463-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jun 2020 06:50:54 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tegra TRM documentation states that hardware should be in a default state
when power partition is turned off, i.e. reset should be asserted. This
patch adds the missing reset assertions.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr3d.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index c0a528be0369..b0b8154e8104 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -381,10 +381,12 @@ static int gr3d_remove(struct platform_device *pdev)
 	}
 
 	if (gr3d->clk_secondary) {
+		reset_control_assert(gr3d->rst_secondary);
 		tegra_powergate_power_off(TEGRA_POWERGATE_3D1);
 		clk_disable_unprepare(gr3d->clk_secondary);
 	}
 
+	reset_control_assert(gr3d->rst);
 	tegra_powergate_power_off(TEGRA_POWERGATE_3D);
 	clk_disable_unprepare(gr3d->clk);
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
