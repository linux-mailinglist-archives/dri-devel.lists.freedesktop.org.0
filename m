Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F64D38AA3
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 01:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67E410E272;
	Sat, 17 Jan 2026 00:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GGCfcU+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553DE10E24C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 00:25:39 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so1443031f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 16:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768609538; x=1769214338; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZLP/L9hOw6v3CS2fVrtY1b2Lj3hldPjPnMkAdZOjO1U=;
 b=GGCfcU+tyD8wO+gEm9uUC5obBJkkz4TC3QPm118ifjgSFJ6c22aim18HTmeMpRs6VR
 CDdHRFmgxNkXYNIf4PTq80FJ1YKLaKrjGVTFcA5j3EQ+NaPvWbCbeb8qxITLV9rnEm0x
 itgbYigJOoL2yELT+Q0pVKob65zt0YRtp4QZMY0xHsG9L5rTyPvSQY6s6cjBmCV9OYoR
 bi0G2E4heYn3gnUKDNI8gUgAE8sCdBoDSDtzku46/EWOGj+fuabJQE/WzhjW96h3tGQr
 h0iAm5Xl9Cy0WP7iQ2ubF+QJZZsONuT+eMoDOrqNm9FLhygXWCphKKMeEmBM6bFQf4cV
 jhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768609538; x=1769214338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZLP/L9hOw6v3CS2fVrtY1b2Lj3hldPjPnMkAdZOjO1U=;
 b=Wvvw1WXdBlTWcAxEO7futbQem+zG3IpSFDMqvV+CSAvILF4oGBm2M0rpMr9Rs2cg/2
 9sUzBxZBhaeXjiX/ELLK7JhJJb/D37odOBxZttJTro+CfOuSgF/RTnjC3LeYzRNYR4du
 v8Iu/43EcZO4UmGsy6z1iktfC+kp5EA4OZKwqniKPZESFy35dYP8CFi1dbG6tK3rLv3q
 WqChpZ9VOE+3rSr+qrhYV5HykEsqyeubzyMtVahasdY3g5y+w8wZBcMWRRAlWhY0Y8Qd
 XS3A2dceA10J6rz/wv+s9LHRP6oJYJcL0hm4yKD3z5w03kr/4FjfyL+xBBoD4CCqt8Qm
 O0mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXRqJc3tXo/ViNpXWnEpVN7eZDH63js8LygkvsnOiK8+T9b4DapF3psLYL4biqxVL/lpP45fn2y60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynXDBuU2Wz8lhhwXnuGqeWXC1xBUsC5sHWKrlfTHK3uCCNoWGn
 LMur5B85dA+Gd9v8dKKL74XzsxECnw9DlYd5IuPhKRg5DME1IGXoHSQs
X-Gm-Gg: AY/fxX6myyuqZV7/rbYOws2tSWAcp1D5fx8FxIZ8Ij70t3VMRvnsitxnfSJqUR+hlZ6
 RfjPOt26rc0y6nI0CgtyM4u3HqOnWTMWT2bhkOOvdiAh+Y1EKFy7BnUEkDJqy9qaiKY5RAQ5qfe
 wD6NKqi55BfdR2/EnxIhUJNw2/9dLm7+zfmJj4QG8s7Z9h0w4e6rMNI7vZeG4UiP5CbaJ1N3RtG
 QPsCpNwOLSaDvZN1be6a3q8dlNev2cy6BPfLAns2EDZ+cGnLTyWpQqA8ml5Ee72Hu7u4gf5HVT2
 rnigeQOwrJxHljjczv12ur6OkGgKgt1kWKSI82wnEQw9DuORpJ0HSs5ENCRzBhboTH3Hb5eyWVp
 O946vfeMOmAaBnOpmLELhZF3p20czctv43PuqMjVLjMYTpt5S9nf2Up3Oc9xo6JH1hSgOnQRCPG
 +KxWzHnLWkveN0hM1MDh0p8X0vtJ2bigh7Aj+1uDVgw/SQyQYt8lsy98n3KnOv20nn1Gq3hScze
 1m9eeM=
X-Received: by 2002:a5d:4a88:0:b0:431:764:c25d with SMTP id
 ffacd0b85a97d-4356a053cc5mr4638844f8f.35.1768609537713; 
 Fri, 16 Jan 2026 16:25:37 -0800 (PST)
Received: from localhost
 (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996e2d8sm8130473f8f.28.2026.01.16.16.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 16:25:36 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v2 0/4 RESEND] gpu/drm: tegra: add DSI support
 for Tegra20/Tegra30
Date: Sat, 17 Jan 2026 01:25:31 +0100
Message-ID: <176860947669.1613073.3280667856356646919.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204061703.5579-1-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
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


On Thu, 04 Dec 2025 08:16:59 +0200, Svyatoslav Ryhel wrote:
> Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
> logic and clocks. With a few minor tweaks, existing tegra DSI driver
> should work on Tegra20/Tegra30 devices just fine. Tested on
> Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).
> 
> This patchset depends on Tegra20/Tegra30 CSI bringup since both share
> MIPI calibration logic. Ideally these patches should be picked after
> CSI bringup but they will not break anything even if picked before
> CSI patches.
> 
> [...]

Applied, thanks!

[4/4] ARM: tegra: adjust DSI nodes for Tegra20/Tegra30
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
