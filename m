Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3012987C3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE00E6E847;
	Mon, 26 Oct 2020 08:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F316E214
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:31 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id z2so9436348lfr.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JH2OsJyWDDEWgdRepQFvBZUrgXbo5q4e/wqbYWmgbhM=;
 b=Tve+Sb+9kIenJUy9bIr8r8V55BVPyYCD/RtvZld5heW4rxOPpr/TWhyhvPS4uYTT5s
 7Ret6/dTOWoNNh19DLF9pUgG6OJReNar877uPuF5lQ4Wk8c0zCoybt12h6tJKsNhE5X2
 etGft3X2nior1lSRAROivRPNoUmtVPOsiLTXfIzHfUml8wQELqNMnlroqrhzsxw3qwrd
 C9X5MyGurbjATJYR71zGHRdSUFEReXgiixgN8c2V7me67jf410PM+PWn/U5yQv9qF/To
 xCXMwYunML3yBj1/NE0u7mOjcpAQvNTHB/vZH7wRBxShgHTdtAV3OY2MigLcHzgTYG8m
 V/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JH2OsJyWDDEWgdRepQFvBZUrgXbo5q4e/wqbYWmgbhM=;
 b=sftY75yhSkHNVKwHBTAUSkc+59WAlzBKwCLXTn9HyMSiyq/SVcsvNqhX6g0hM3t0vx
 CQ4y83vuReViGcdvNL52SUsz8QGCW2G5DbykOepPTE3eIDmoN2gzHIA2xnOJGUfbNtdJ
 HmMnK/WiX6U6DGxzsgseKeAklGa/1AoOu9wGNGVgLVGNZqYRDSvi/XF7HIULm7dsCFnD
 gTWmVBGKQQ74wAT7Qg1s0F3JjxJQIKe/cTwZnSzdp7YyIXiHKzL6nPGr28tl6uYwV6cD
 vMe7ihX2JAsBkq1AqdA2sBMNxogkVCfyc8v4xFWcKu6xkM3dT7d1xL83kyoSNnVR7PlI
 d8uQ==
X-Gm-Message-State: AOAM532YBtCUX3wWOsODabyN/FdG/JRTJC0D8YCbs07tc6zpPSLgw+RA
 qMQPTPWYydhdPW6mUkoo//DX7OpYSls=
X-Google-Smtp-Source: ABdhPJz9WbnLeNCB91eplOmHhYjzdg+OSNFr4kWVvQK3D0VgCV6T8hiQ/Z970uvfTqazKH9CHkJg5w==
X-Received: by 2002:a19:4293:: with SMTP id p141mr4085903lfa.448.1603664309407; 
 Sun, 25 Oct 2020 15:18:29 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:28 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 36/52] memory: tegra: Add FIFO sizes to Tegra30 memory
 clients
Date: Mon, 26 Oct 2020 01:17:19 +0300
Message-Id: <20201025221735.3062-37-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The latency allowness is calculated based on buffering capabilities of
memory clients. This patch adds FIFO sizes to the Tegra30 memory clients.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30.c | 66 ++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index b1990b4133d8..05780a0c6d39 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -42,6 +42,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x0,
 		},
+		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x01,
 		.name = "display0a",
@@ -56,6 +57,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x4e,
 		},
+		.fifo_size = 16 * 128,
 	}, {
 		.id = 0x02,
 		.name = "display0ab",
@@ -70,6 +72,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x4e,
 		},
+		.fifo_size = 16 * 128,
 	}, {
 		.id = 0x03,
 		.name = "display0b",
@@ -84,6 +87,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x4e,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x04,
 		.name = "display0bb",
@@ -98,6 +102,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x4e,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x05,
 		.name = "display0c",
@@ -112,6 +117,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x4e,
 		},
+		.fifo_size = 16 * 128,
 	}, {
 		.id = 0x06,
 		.name = "display0cb",
@@ -126,6 +132,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x4e,
 		},
+		.fifo_size = 16 * 128,
 	}, {
 		.id = 0x07,
 		.name = "display1b",
@@ -140,6 +147,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x4e,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x08,
 		.name = "display1bb",
@@ -154,6 +162,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x4e,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x09,
 		.name = "eppup",
@@ -168,6 +177,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x17,
 		},
+		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x0a,
 		.name = "g2pr",
@@ -182,6 +192,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x09,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x0b,
 		.name = "g2sr",
@@ -196,6 +207,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x09,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x0c,
 		.name = "mpeunifbr",
@@ -210,6 +222,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x50,
 		},
+		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x0d,
 		.name = "viruv",
@@ -224,6 +237,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x2c,
 		},
+		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x0e,
 		.name = "afir",
@@ -238,6 +252,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x10,
 		},
+		.fifo_size = 16 * 32,
 	}, {
 		.id = 0x0f,
 		.name = "avpcarm7r",
@@ -252,6 +267,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x04,
 		},
+		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x10,
 		.name = "displayhc",
@@ -266,6 +282,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0xff,
 		},
+		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x11,
 		.name = "displayhcb",
@@ -280,6 +297,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0xff,
 		},
+		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x12,
 		.name = "fdcdrd",
@@ -294,6 +312,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x0a,
 		},
+		.fifo_size = 16 * 96,
 	}, {
 		.id = 0x13,
 		.name = "fdcdrd2",
@@ -308,6 +327,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x0a,
 		},
+		.fifo_size = 16 * 96,
 	}, {
 		.id = 0x14,
 		.name = "g2dr",
@@ -322,6 +342,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x0a,
 		},
+		.fifo_size = 16 * 48,
 	}, {
 		.id = 0x15,
 		.name = "hdar",
@@ -336,6 +357,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0xff,
 		},
+		.fifo_size = 16 * 16,
 	}, {
 		.id = 0x16,
 		.name = "host1xdmar",
@@ -350,6 +372,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x05,
 		},
+		.fifo_size = 16 * 16,
 	}, {
 		.id = 0x17,
 		.name = "host1xr",
@@ -364,6 +387,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x50,
 		},
+		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x18,
 		.name = "idxsrd",
@@ -378,6 +402,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x13,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x19,
 		.name = "idxsrd2",
@@ -392,6 +417,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x13,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x1a,
 		.name = "mpe_ipred",
@@ -406,6 +432,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x80,
 		},
+		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x1b,
 		.name = "mpeamemrd",
@@ -420,6 +447,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x42,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x1c,
 		.name = "mpecsrd",
@@ -434,6 +462,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0xff,
 		},
+		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x1d,
 		.name = "ppcsahbdmar",
@@ -448,6 +477,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x10,
 		},
+		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x1e,
 		.name = "ppcsahbslvr",
@@ -462,6 +492,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x12,
 		},
+		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x1f,
 		.name = "satar",
@@ -476,6 +507,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x33,
 		},
+		.fifo_size = 16 * 32,
 	}, {
 		.id = 0x20,
 		.name = "texsrd",
@@ -490,6 +522,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x13,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x21,
 		.name = "texsrd2",
@@ -504,6 +537,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x13,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x22,
 		.name = "vdebsevr",
@@ -518,6 +552,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0xff,
 		},
+		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x23,
 		.name = "vdember",
@@ -532,6 +567,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0xd0,
 		},
+		.fifo_size = 16 * 4,
 	}, {
 		.id = 0x24,
 		.name = "vdemcer",
@@ -546,6 +582,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x2a,
 		},
+		.fifo_size = 16 * 16,
 	}, {
 		.id = 0x25,
 		.name = "vdetper",
@@ -560,6 +597,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x74,
 		},
+		.fifo_size = 16 * 16,
 	}, {
 		.id = 0x26,
 		.name = "mpcorelpr",
@@ -570,6 +608,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x04,
 		},
+		.fifo_size = 16 * 14,
 	}, {
 		.id = 0x27,
 		.name = "mpcorer",
@@ -580,6 +619,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x04,
 		},
+		.fifo_size = 16 * 14,
 	}, {
 		.id = 0x28,
 		.name = "eppu",
@@ -594,6 +634,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x6c,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x29,
 		.name = "eppv",
@@ -608,6 +649,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x6c,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x2a,
 		.name = "eppy",
@@ -622,6 +664,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x6c,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x2b,
 		.name = "mpeunifbw",
@@ -636,6 +679,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x13,
 		},
+		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x2c,
 		.name = "viwsb",
@@ -650,6 +694,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x12,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x2d,
 		.name = "viwu",
@@ -664,6 +709,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0xb2,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x2e,
 		.name = "viwv",
@@ -678,6 +724,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0xb2,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x2f,
 		.name = "viwy",
@@ -692,6 +739,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x12,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x30,
 		.name = "g2dw",
@@ -706,6 +754,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x9,
 		},
+		.fifo_size = 16 * 128,
 	}, {
 		.id = 0x31,
 		.name = "afiw",
@@ -720,6 +769,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x0c,
 		},
+		.fifo_size = 16 * 32,
 	}, {
 		.id = 0x32,
 		.name = "avpcarm7w",
@@ -734,6 +784,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x0e,
 		},
+		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x33,
 		.name = "fdcdwr",
@@ -748,6 +799,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x0a,
 		},
+		.fifo_size = 16 * 96,
 	}, {
 		.id = 0x34,
 		.name = "fdcdwr2",
@@ -762,6 +814,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x0a,
 		},
+		.fifo_size = 16 * 96,
 	}, {
 		.id = 0x35,
 		.name = "hdaw",
@@ -776,6 +829,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0xff,
 		},
+		.fifo_size = 16 * 16,
 	}, {
 		.id = 0x36,
 		.name = "host1xw",
@@ -790,6 +844,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x10,
 		},
+		.fifo_size = 16 * 32,
 	}, {
 		.id = 0x37,
 		.name = "ispw",
@@ -804,6 +859,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0xff,
 		},
+		.fifo_size = 16 * 64,
 	}, {
 		.id = 0x38,
 		.name = "mpcorelpw",
@@ -814,6 +870,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x0e,
 		},
+		.fifo_size = 16 * 24,
 	}, {
 		.id = 0x39,
 		.name = "mpcorew",
@@ -824,6 +881,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x0e,
 		},
+		.fifo_size = 16 * 24,
 	}, {
 		.id = 0x3a,
 		.name = "mpecswr",
@@ -838,6 +896,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0xff,
 		},
+		.fifo_size = 16 * 8,
 	}, {
 		.id = 0x3b,
 		.name = "ppcsahbdmaw",
@@ -852,6 +911,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x10,
 		},
+		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x3c,
 		.name = "ppcsahbslvw",
@@ -866,6 +926,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x06,
 		},
+		.fifo_size = 16 * 4,
 	}, {
 		.id = 0x3d,
 		.name = "sataw",
@@ -880,6 +941,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x33,
 		},
+		.fifo_size = 16 * 32,
 	}, {
 		.id = 0x3e,
 		.name = "vdebsevw",
@@ -894,6 +956,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0xff,
 		},
+		.fifo_size = 16 * 4,
 	}, {
 		.id = 0x3f,
 		.name = "vdedbgw",
@@ -908,6 +971,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0xff,
 		},
+		.fifo_size = 16 * 16,
 	}, {
 		.id = 0x40,
 		.name = "vdembew",
@@ -922,6 +986,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x42,
 		},
+		.fifo_size = 16 * 2,
 	}, {
 		.id = 0x41,
 		.name = "vdetpmw",
@@ -936,6 +1001,7 @@ static const struct tegra_mc_client tegra30_mc_clients[] = {
 			.mask = 0xff,
 			.def = 0x2a,
 		},
+		.fifo_size = 16 * 16,
 	},
 };
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
