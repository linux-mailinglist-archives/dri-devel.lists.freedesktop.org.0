Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6C51D64B9
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 01:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9346E296;
	Sat, 16 May 2020 23:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4F16E05C
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 15:41:33 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 82so4354108lfh.2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 08:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eIzUXuD/V9HhUju7GTzLWPyzNHW6BnF7bRxOjSTf+QA=;
 b=F2J3duNvPYYOgCm4O0PbPkVry2+QQoXEzOR+FYYnm39uZZAozYuOZcVwnp6oMahY3d
 pEhYQbajpFxGK/wG/BzIIH5xq44AfjjK1K4xjQ9uld59spiHYUrIuatwrqA5PecqxSfu
 R3lSDsMCiWKs19acEdVZraOSWEnpWl9MRuuM+sS9I4DVr4T6hH1ul6Sfj+D8mK4FshPy
 RYXHxYqgeDYGjvAa0hNurdzKpt5kPqURkXW0Z2lRXWpbFI8zSRfSxHIT8DcApRhlXR1g
 GdlepnKv56q0lCzf6+i0Et2fKiF9BZLFMb2/wzi4dOk7D8eNhd4v6Q6V1r9yVxjWGUdK
 qPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eIzUXuD/V9HhUju7GTzLWPyzNHW6BnF7bRxOjSTf+QA=;
 b=cJgWv+r3aPzSpf0KMWUBbjHW4F6ML7SL6H5dKTl5ric9F6oq6F6EqQiCVRrqznCoa/
 mt0HB4+vZwuDqck7p0/f4H7BfIa+gDUJcmNio/qefdJHeFkBEf2AtxadycEt71oZupJU
 WUAPgAgc8NJi/xGRMbeC18Sho1IfMgFOd053mK8xDHX/2j2CVn1Zl10edGvM1A/Zec6N
 8sWLO23XWv1U4l9tiE1IpaNgYQ4sAAKU0MD8Uo2Q9JAhGeShVKbxuLTMWRwkhxqw1Rq5
 S0pcVP82OUhp92WBySgjyh3kODyRnHvL/ZaTvQ6uJaUjczTy/No7U/fGx4c9qihwDZuO
 YVfg==
X-Gm-Message-State: AOAM530633vznBWQz1fXSqc0G0ZsPzjs0fgdntXujlVbCjru3rGsHr4K
 JMBOIl+Ea2d9qD6q4HgUUls=
X-Google-Smtp-Source: ABdhPJwYeCTep/xT1011C4iJO6nPJ5k1EtNf5/UG4xLqxGDRn7q7vck322J/zyOj/hEf2jBUqtpg3w==
X-Received: by 2002:a19:ee19:: with SMTP id g25mr6041107lfb.124.1589643691295; 
 Sat, 16 May 2020 08:41:31 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id v2sm2894525ljj.96.2020.05.16.08.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2020 08:41:30 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v1] drm/tegra: gr3d: Assert reset before power-gating
Date: Sat, 16 May 2020 18:41:15 +0300
Message-Id: <20200516154115.14510-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 May 2020 23:30:51 +0000
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
