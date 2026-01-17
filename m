Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBDAD38AC2
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 01:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0915910E24C;
	Sat, 17 Jan 2026 00:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DuALT4kE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BE110E24C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 00:32:52 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-121a0bcd376so1801081c88.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 16:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768609972; x=1769214772; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ytNYdk8UK+5QDwMF9YKV8D+8X+AVHJEWRr0kX0nOWE=;
 b=DuALT4kETh61bgXHc17DEhAAl1oJJktXjv8rh4DbLUlQBA4N2C2MQ3kcYy4Dsy7zQw
 Uv4pKdb0ueETgAB/uynLYc5nLDzkslikogXJjDMSlDpjsCFqYj3JEHT3PSLxvkEdmk8C
 86Ws6ejIJOK1nJ8/kyDdamjJkrZCUKnVzBD3DBoSgeQ/QhBJQ1SMBI2/FYThlAkRs9H/
 bcEP+u6jOv2yhszy9dhIuYXkw+eRL3VtvFZQBPD27J9oILCkN3DIOdhkRwHavatPnkNN
 X0KJNyKJVG0sWbiuTKX60CXv3W3u+ujpgyezspJ95plxW32PAMpB5Xlw2OKjnZ9qvuwg
 MVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768609972; x=1769214772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7ytNYdk8UK+5QDwMF9YKV8D+8X+AVHJEWRr0kX0nOWE=;
 b=Xbrq6BuiNFP/NcjgVv6Qe+M3vWGWRT2YM62lHnszWTrlaqMOenNbaPXuExY98qmpux
 pOsNyYkOzbCOWOuM9mUBqtdxDUyBObLxzjV68V5RTTw8fYsH8ek8knhhGnp9g2hpkSo3
 eRo8L4LpWwQW8vl4mUCMNYpHJ7qMTi76do7D3IyHyMFFYx3GncKa9AGkc65rV0m3V6b3
 DmIAI/Ymy5oo393NhezWQQ3zziD+PGn8cF4MoXC1MPxIqh+7memv8cKkqL1fysisY9q7
 O78rZFIMIcySsGR23Bax5GSZDv9PHlp73XxSY9S8AVM2SOPtgIBllcGwfKTYA9RYQ5iQ
 3Y1g==
X-Gm-Message-State: AOJu0Yzph1aXXh3VdgJ/uoAm6Lp4rqJt2fdiQMap8yLAcz5tdfJsF9f4
 CLeZTjBIR3/m8iWvLBH1KEvCs51kfoQQ0t9c0LMIQkwMsqEaF8G1h6Js
X-Gm-Gg: AY/fxX7ZINoxxuRc7x48TI5rXk+LTvfBmHFuNmnqwdgxrh+4xHUolEgxthWhYT/YoTp
 o9A8IgaatSa9s7nRaCQCK689sj1s89mj9K3xiTM41FjxHG7u4vC/q7atCUsk0zrRoXNXsJtvWlL
 DmnhhjV60HqfTzFsHS6N0VpnwJ7Ow2lDm+Qg+Zte5S8VR9dfu2j2Muph0z8LOv2ONkIdtMOTdC6
 0XfWQaYpWOirEopM7ar1WJQCQFsaB1n6jTsGToSQ4aoMD63gL3AkhzG+QrqiYcyC7ONXTSHwexY
 9hax/YJ/f8qDUinwOuSBKwwNiLMu8zXDW94zXZ2zZskPVW7YiFZCAFN1MtAsha65mEjFEyZtcAd
 2rcyfeHXfsRt1VoZMy/osWBn2S+ys0bUx8KQamTdwwAX2J4MgKbfd9xBK/ruYYy6YL856sobl4S
 4e6KQEGSwYb+aT2hPdbPjY/5ggL/iNIelLomOKtONu4lZ2Z0MbfqIAzFsW/eGG1nk2M5AkbnjU5
 x2xk8c=
X-Received: by 2002:a05:7022:619d:b0:119:e56b:c752 with SMTP id
 a92af1059eb24-1244a73c91cmr4320247c88.23.1768609971804; 
 Fri, 16 Jan 2026 16:32:51 -0800 (PST)
Received: from localhost
 (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1244af10e21sm4822622c88.16.2026.01.16.16.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 16:32:51 -0800 (PST)
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
Date: Sat, 17 Jan 2026 01:32:46 +0100
Message-ID: <176860995606.1697785.9777722896876428268.b4-ty@nvidia.com>
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

[01/23] clk: tegra: set CSUS as vi_sensor's gate for Tegra20, Tegra30 and Tegra114
        (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
