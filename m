Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCB2D38AA4
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 01:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF6D10E277;
	Sat, 17 Jan 2026 00:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HrK5hTl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1955910E277
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 00:25:42 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-12336c0a8b6so5392762c88.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 16:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768609541; x=1769214341; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kXSzRKLdZZRDc+qd/B0ftBuEII5cSa+ihfuKd80sVQ8=;
 b=HrK5hTl8ZSGeuaAmnxtGxQorueRF3AQfHyStftYjCmu0NzH/S3xie2vVPlTvTFrrYH
 XqukC1w5QtINoJ56/0gfNF6gOR982j59pR8BjY7twJUdk6yrKv8SFXgrwYwntnSNPNV5
 O9ISGpG5sy60O+wQMFUbMRTZKvov6jlfIEP85OyeOhA1CAqnJG0S5AqUKuwfK8HkJKb9
 w93N+NgABGMvNe7h/WV6LdQwBYHjTELp2tbWCaPA8ALJbh/7tQvyd3PfZFCCyGt8nsZ+
 HgHynev1rBhNK3BfacRWoUbzXZXAATN24SHhduH3Q2oYaviikSnfjGfKQ4unsqok79WT
 XZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768609541; x=1769214341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kXSzRKLdZZRDc+qd/B0ftBuEII5cSa+ihfuKd80sVQ8=;
 b=WfbNVIzyuXjgTQ6bX/A69TiipfrscamBAahq+c+mXiVMaxkq8VfOPdGxpoBZd9/gX7
 rUNNXOhxA41NiRrYYkitYKdl+fROzAOG3zHCnO2wA5XjOCYUWvKl1gok4WoZGQhxCMCn
 F8eEy8cdawoqUDcighwUu5YGXmQuKDoAYDkKZ4u8IXAEY8Amvqpuz0tilyIGaeNVqXep
 LU1AlNXYTZyABOvJqitdQBpdhsnC+M12kAaBw/cszVGlMQl6MHbWo2aKkIeUZAKGSClu
 8cDydKwLsFmOIZhcw+PAD0z+6ajvsPU8RRVstlOXR0ZMgtnAOyLo/MY2GkLRqmNppqBa
 Rt/A==
X-Gm-Message-State: AOJu0YzlE9kCtwF+M4Ihsbh7fefpYf32Q36ZCizGM3If3sARb/L2q9d/
 UsHLsKilEZFKXTCZFz78xYYs8NzLuiN2xR8mcdEIg8ByFz1CAG2YExz/
X-Gm-Gg: AY/fxX541TNqjvsUV3TWGNrLExh4SKR3n750AtKzDcmY6a7Ht5HDG65F+YG6vGQnhSw
 bHdThQi00RtuPszD6ko+fswJqc+piQypemch+RngdBL/4ae2NcY+C21uC4oXRTlRms3kQgN5kJl
 wN++tABCrVWeuoKsN0UvOyq3+O9mf7mWxTsO7Cs+/lVb1KYc9JKECV6cLoEaXE/HnUjol6vnDty
 LybiO/7Jt9Znb6ozkrR3u8EtZ3ItNZFTaTx0lD5n/xZjBwPiT/xJfQFTlLdRL5nlodE6GFg/gXb
 k063PSCsYGKPu/U2ogSLNuL2q1JYvzx/3+ad/tth7IUgW44f0192eXXR4McVQ30jJwNilaybmCa
 0H97LPMF40rkhPMjYGqzop8Ox+bntHeqGug5Gq4q7Es+CwabHPEhnQ1C0fio2HeBtTuD1bMzQrP
 PVtzV22IRj481EjUry/Q7yFadQglq7BktQdAdk+5QCCT35De4VSMzF2kwjgMmnr+xzxV6eKJ/zU
 whJ9q0=
X-Received: by 2002:a05:7022:225:b0:11b:9386:a3cf with SMTP id
 a92af1059eb24-1244a782252mr4273827c88.48.1768609541196; 
 Fri, 16 Jan 2026 16:25:41 -0800 (PST)
Received: from localhost
 (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1244ac585a9sm4287875c88.2.2026.01.16.16.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 16:25:40 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: (subset) [PATCH v5 00/23] tegra-video: add CSI support for
 Tegra20 and Tegra30
Date: Sat, 17 Jan 2026 01:25:32 +0100
Message-ID: <176860947674.1613073.11085159197676774675.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: Thierry Reding <treding@nvidia.com>


On Wed, 22 Oct 2025 17:20:28 +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
> 

Applied, thanks!

[10/23] dt-bindings: display: tegra: document Tegra132 MIPI calibration device
        commit: d6e8b796d0d67699c74ee3cbc46601cf9ec925bb

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
