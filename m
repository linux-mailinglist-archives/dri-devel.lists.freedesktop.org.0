Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8F5B2C2EE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4574710E5BE;
	Tue, 19 Aug 2025 12:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fN5Uf2wX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B692410E5BE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:16:48 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-afcb7a2befdso703578966b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605807; x=1756210607; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7iBp08QNR8Td2vyYWnu87FXoNEPHv9ZHxpFhDONz5Gs=;
 b=fN5Uf2wXkxoVQT3gYmkVcrDMbaeEMCu41MSa6q2F6KtYtJ/EjL4rYdbK+dWB8QEO3a
 /+B+QqSDk+vfBIAtgzJZVI7JJVqG2UKT/MtJfTMxwZ06Z1Nor7ZgxdsCvrMo2wZP477A
 IbphBMx+zGXlUq8wXlPQYNUvVINnuFmKp99c14xaeDh8XpK8rz5UGjzLv0R4b66MP3LR
 SMrwepwxKdjq8riFuD55rim5uwE6YU7Kw6xmy2G5zbWGZufBYgt0hEI5rtpqnGbTJl0K
 q62LGOuppP2m1+rSTXsIBMn+jKICDQcq3z7GhzpGumzk8gi0aSGPTMbIheH035ZnBDnG
 3usA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605807; x=1756210607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7iBp08QNR8Td2vyYWnu87FXoNEPHv9ZHxpFhDONz5Gs=;
 b=LcLxwVPibHpeA3gA56HVvHUKsqUzbB6iDfABYv9xNYZ1BCljXK063fktThs1OKog0h
 FPOm3QQ/Pqu2QziV7VxgPVWrPyqSkLXomLjw54evUEzzLvhA4VG/ZdJ/tI2SCG+OSHXe
 /EJ5Tc3LHqNttFnrmTpWaJF8bStBjPEBTfyHZ+QvjGeY7eA0NL4VAANtO0AxuArBA+l+
 rpcVFS77FBGZJJiijtHxT537WdhF8UK7VqgoRzUH7h2LfPLjidbY3xKCHJ1IG1oPB0Vp
 W3MKXB19cW6cy231dKJgpmBbNlOJ82DadPcdvdUzumsYn9IxzC3PROh8S5d4AHDm+nEw
 mLGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY9Fj34agrTZA+RUdGzMbvbBys3PRxZFXlTMwpWSyJdoXWTEF7F2KPEpBZKnIxl1bcsg3bzhAfQcI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySkZtM7YeRMsTh9h0iC1712OLKi8z28L93P27J7srWAgn0//wK
 FnnACeKvo/ozEcdk96y36bfzrJDPZYaBixXM8qCRT5PkEQ5aKJH1IPNL
X-Gm-Gg: ASbGncvg0ieZdPwv4te5PX7mNhJ4xAba+D1MWzDn4PLgQKnTe1Y/Ee4CJ0YHFpttqiH
 fY4rIkFsYqNpAK9f100cr4wuoqcmhljG8HFY7x8fLH/9kRtWw101VR8cdL9tvRpjpBAngRoweOw
 yCsFziRryqy68H0RK7rf0TWs6eqh/UMqw8ermuwLOjMSa3+RxYAK1jjkwLrHbZ7pBaN/ZhCuVRD
 JcbmfqmX22WbK7HShvC5/sj7bLMKo7mgQui9asDIC7kgEsJRq0nrcUW5+kmrE3T27o3GecjQ/ce
 b559Qm0n30g6AsyvDndfOFdcXodf5pKsos6t/WNZ3DqJKsULpZ09RKaHtNDm5f1KrwIyVl0Weia
 ZYeIhWIl93w3mhA==
X-Google-Smtp-Source: AGHT+IEYZ39tq8yeh7XOkopLmn5iOqMcjzDRT5nnlaEu9RQqze9ng8oVmePY8pq8xmtyZEUdZCdUDQ==
X-Received: by 2002:a17:907:3e0b:b0:ae0:d332:f637 with SMTP id
 a640c23a62f3a-afddd0c699cmr229709166b.31.1755605806678; 
 Tue, 19 Aug 2025 05:16:46 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:16:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v1 03/19] clk: tegra30: add CSI PAD clock gates
Date: Tue, 19 Aug 2025 15:16:15 +0300
Message-ID: <20250819121631.84280-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
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

Tegra30 has CSI PAD bits in both PLLD and PLLD2 clocks, that are required
for correct work of CSI block.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 70e85e2949e0..f033eb1ac26a 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -153,6 +153,7 @@ static unsigned long input_freq;
 
 static DEFINE_SPINLOCK(cml_lock);
 static DEFINE_SPINLOCK(pll_d_lock);
+static DEFINE_SPINLOCK(pll_d2_lock);
 
 #define TEGRA_INIT_DATA_MUX(_name, _parents, _offset,	\
 			    _clk_num, _gate_flags, _clk_id)	\
@@ -859,7 +860,7 @@ static void __init tegra30_pll_init(void)
 
 	/* PLLD2 */
 	clk = tegra_clk_register_pll("pll_d2", "pll_ref", clk_base, pmc_base, 0,
-			    &pll_d2_params, NULL);
+			    &pll_d2_params, &pll_d2_lock);
 	clks[TEGRA30_CLK_PLL_D2] = clk;
 
 	/* PLLD2_OUT0 */
@@ -1008,6 +1009,18 @@ static void __init tegra30_periph_clk_init(void)
 				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_DSIA] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clk_register_clkdev(clk, "csia_pad", NULL);
+	clks[TEGRA30_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clk_register_clkdev(clk, "csib_pad", NULL);
+	clks[TEGRA30_CLK_CSIB_PAD] = clk;
+
 	/* pcie */
 	clk = tegra_clk_register_periph_gate("pcie", "clk_m", 0, clk_base, 0,
 				    70, periph_clk_enb_refcnt);
-- 
2.48.1

