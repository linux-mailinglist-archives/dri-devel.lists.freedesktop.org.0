Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1344ED38AC8
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 01:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7496D10E278;
	Sat, 17 Jan 2026 00:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NQhDncbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446D010E278
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 00:33:43 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4801c314c84so14072415e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 16:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768610022; x=1769214822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nJpxx4+wHYsiEOlQU+E5sFAAvHcwO1zDtrt605GkyxI=;
 b=NQhDncbFWDsgbl5GBEDiwiAT4/NzhncU0gPYxiI356RL3GLaWxo44nCqZqKaH9UMcS
 ZJfPvDcNoL9qFSfZsafdViYxseHDYNZSAvc7n+1m5ypZunTD1MuYjiJrtCnnAYUW+vE5
 /kH9bwnLg9JVXhqoEjv54TmwvROsYpG5tdZKZbgssCN8u3SKAxpG7sg2cXWNyHKBE1vh
 m5RbyNaXjcykkMKtm8wIMVys19+7vD/q4J04EUQ2x/Y5Kbv4oeWXitvw3AjjOaepE69T
 PSZ52c/Ygv63yDaInQBrwh2/3IdRdIhD8ZlJtQwmCl9JpeMSlnucqQJZoVsYVXAciPA6
 WpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768610022; x=1769214822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nJpxx4+wHYsiEOlQU+E5sFAAvHcwO1zDtrt605GkyxI=;
 b=JnXLoFTWbhCpXzysBs6Lcibqwnv8XdugBO0rQ18th/VjACtOGTkf2bzbpgIq0OZXFd
 r1Dn4nz4Jj1FBtJCzUXdiUlWUZbmoT2zLLXZfbU7Fhke/GY8XXBg6pzBcg733NhULlFr
 Zsbowog/EuugPsQJQZ8b3q/DOF+cp9y/OUQutfEaLpxV1dXBsMtdIYheVC3LY4MPWBmm
 tsx1WhD8GPpZYNOhGsuYb4l0/iZhFy6nEefOkbNc24i3n/Jk5OGuJkeGt+03VhbxvzDb
 fCehmFCGqh4R9ypATY5dEWgw9mUySaW8cFlMbUkCcaLCCWkG+NedHL4ZpddTcB5Wlmm6
 np9g==
X-Gm-Message-State: AOJu0YzV5DLIILEsK/fwA17LqYun8hBWkvZAKIL3qHONduBIDfNJHD7Z
 8TWvTjCx0CLUrhE5f70cv6r5YwYiqrXhUrxI3lYA5ZsMY3DAXGgnrCPD
X-Gm-Gg: AY/fxX6U5lmM3tsxJO4zziLL1tlabmX5+Lc05E7QTEpuJR6F9vYsLxMm9kwHHZeAkRK
 KfdJwhH4OMhx8uPjwyPrh87QYCeD5b1jDtjuIwR5GE4lTRNrSVPsL4Qjkb0KrsxnNnKYeGw5YtL
 g71+e76t2jHr0NdAMFrcXKEYPbkfUyZqE/c+cDw+5JncSK2CZSjM7Ti6zvwyhF6/GuqzaE7LyaN
 6hvJ6PGmXPgyLZGCygh851j64p3O4POr1Ai+6S/PG9t38h+yCWra4xjP245EoGjL/GvJtNyFoQA
 u8TjhG6KfDYSmlMl3iXSiWZFoOVEnxRqnoRsWW395IUWTH2q+jsqFIDGOFkYlfFRQXKu85UMRY5
 lmFpiCmDlm2a+J0R9nIMkq9OFi+PwZ1D9dQJAd52W+ya+4/CJRRvYBov0+XgQe207bSE7vF7YPH
 k4u/AVNT8McNT7c9kngozi2rswAEL4yNv89pyMEfHWIbDVavMJq/0RouhozkX1yatr+xqPDvbM8
 5lUyUc=
X-Received: by 2002:a05:600c:c0d1:10b0:47a:810f:1d06 with SMTP id
 5b1f17b1804b1-4801e4a38d6mr42472145e9.4.1768610021605; 
 Fri, 16 Jan 2026 16:33:41 -0800 (PST)
Received: from localhost
 (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe74987sm27997325e9.8.2026.01.16.16.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 16:33:40 -0800 (PST)
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
Date: Sat, 17 Jan 2026 01:33:37 +0100
Message-ID: <176861001038.1704662.1663515837927668217.b4-ty@nvidia.com>
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

[03/23] clk: tegra30: add CSI pad clock gates
        (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
