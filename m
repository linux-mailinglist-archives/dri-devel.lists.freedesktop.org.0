Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8558BAF5C8
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 09:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B880F10E15A;
	Wed,  1 Oct 2025 07:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NcO1b3K8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F51A10E15A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 07:13:06 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-46e37d10f3eso53097765e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 00:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759302785; x=1759907585; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFPDhYu4aFFhwsNO2KIFrINwTJBQ61Ce1m0mUZPP1Mc=;
 b=NcO1b3K8UUuHmd8fRgqwqdEft+y4O+FrFCOyFTwKe8KwR7oI3Yc5TgcPJv8qUriRGn
 DuFI7r6vXvYjUw4k5aWoCZz1Uc7IJG0gBjCXWH97zG7IEqnGS8DjdylxI35sLFEAYFpO
 1jgc/wN/W4lxUgvqAD9oGOnd0w9uSny/dwb2K8C1PU+/yNV7MPGm8dohaB4CoHZZwCvi
 Bn76CQ7+xCDfmr9/AxpZknxijZE2x4UhG7E52Qi9tDlicibLpUzMHVGxhgS08WGTKYs+
 vb85SpYmx4pnogqgIFE8jOsgPdQLUIcQQnSaJiWhUtsx4x2dqnq4m1Jl6rynMSAiFE5/
 J6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759302785; x=1759907585;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pFPDhYu4aFFhwsNO2KIFrINwTJBQ61Ce1m0mUZPP1Mc=;
 b=BRLBz7gHq4dBNcydW1a/Nh47M6yX1wMrOgtXcwM9lM/P3gmoOwAnPmMMVGxjxeMfe/
 44ofPeUzA/ztoklJ/uzzn72cHKsQyRzGu32L287wckZPmiJRNJi/heGJoGY56F8/2G3+
 MO/UDYtgTOsLfEcGI5skdQhRs2tgIm1id5z6miVEPkKoRoFYbgqcSbbb5irgJHY7hdMb
 Ku0ZWqnd06WPqWP9QqdfUv9ih6tawv8BkhRriMzAhGrq73ZyM469l6IwZVdQT1oObfbO
 YBHZYVWycD0b/O/APHC2GAQhNlvXP6d2UvZ08x6lZeStN0Oam5JqjicWg0E0fWTEzCNY
 XmnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVofK5nT3jYQN3/unCV8zMwBSDV+oil/eBi4HzZy/CaX+4F1imNjg7Oznjlf/AhEKpzqd8KZHNs3zY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWnRAcD4mTGFFoFWhyUlUO9Os01tdCbeEpbTdkPBXFIdpeyce/
 Lr6b11N1STUYX15+NCP3Jguw8rzyhanEGqXEFZ0S+feD9T0EdgmCCM0MpUNU5jRQ+O8=
X-Gm-Gg: ASbGnctcL0EJcI/j8Mwcvn2PEU+e7HV8OTEWWAiyyGhjS9yFfLNCRFZPT4/ImYHq1SA
 7zLgqFKresaDvZKy0p/zn8FqytDtu5MDXiabe/ww4oDbjJlObXL7EmA0okC1v4ZDlZUhFSlwEw6
 zXg9xLV1hEqzP1cQVEv15Ya60E6hTuTmsYVKNTxOt2L5bBV4CppeZBz+kZL38s7rUO3SoBy5MdO
 rSirv+4IBrPCpTFh7V8pmFvgquQoFPimz6yDCtpnHjtLWzu53qbIGP0PFatsRMGThMdGo1abnMq
 5gqCATPE38DRQLv5JUU0rm8+ngsWjS6HlYuMShmYfzutoFq1wODJOZsCYe9V/ExC9vQxb0Qkn31
 aPYLMyMsW8b/BpgzUHyiH08yvCM3JjPZleQ3D9B49lY51HjyQgFAHe8nckFHn8luYJwo=
X-Google-Smtp-Source: AGHT+IEJybYivB1tDKi+V+W73mq1doiRwwO2NMKjXDaYOQiM4qmPaqdgd0jKteaSLsSgV9Peoc95Ww==
X-Received: by 2002:a05:600c:c162:b0:46e:37a4:d003 with SMTP id
 5b1f17b1804b1-46e61202096mr20188025e9.8.1759302784682; 
 Wed, 01 Oct 2025 00:13:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b36f9sm25077355e9.19.2025.10.01.00.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 00:13:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
Subject: Re: (subset) [PATCH 0/5] arm64: dts: imx8mp-skov: add new 10" variant
Message-Id: <175930278378.421667.15230947171150357707.b4-ty@linaro.org>
Date: Wed, 01 Oct 2025 09:13:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

Hi,

On Thu, 21 Aug 2025 09:55:27 +0200, Steffen Trumtrar wrote:
> Add a new board variant for the Skov i.MX8MP based family of boards.
> 
> This variant uses a different 10" panel than the existing ones.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] dt-bindings: vendor-prefixes: Add JuTouch Technology Co, Ltd
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e3579cd78ed9945606d281be16708037eaa12c49
[2/5] dt-bindings: display: simple: Add JuTouch JT101TM023 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/510aeefc7c362c1dca57d0d3892fca07d4455141
[3/5] drm/panel: simple: add JuTouch JT101TM023
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/73bd4835f84b5f78d65f37bc97c764cb90501299

-- 
Neil

