Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA294C70350
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 17:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42A310E67F;
	Wed, 19 Nov 2025 16:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HWF0xt9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A6610E673
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 16:49:09 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-429c4c65485so5815855f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763570948; x=1764175748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+BKTv32VzHjWL0NXMYpgvUxDlBNuCFA53q1tVGjGOw=;
 b=HWF0xt9ctE0T1eHIxx0q7qj4YhG0bnE1FGR+xonuoPE1kU0QVKX0VwFsGgnKocDlYq
 aqMu4c1YOhNE78ZUip34ovuxjdf+b9QYXMHiTivP2TWCs9b/QBqRm/tIXXF4+1Y8oWlO
 mtcj7ECnjfUcv+QgAx1mFKet8Hx9mAoaN+Ghofi0odb6+jyaGWh6W7KClJp5uUQIpVTE
 C3Zno3BS3kRsHOKIWeuntPrWKB6H1bmafJn6o23vaHngwlKP6IMTIE+ZZB7u4PHpUSfE
 +SssuYKbWXdpA+RdiP1JYl+GYLYgJULgT0y8AJQfz2kZ1ET/WIpfuVDmT1VEcilPekdu
 5R8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763570948; x=1764175748;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W+BKTv32VzHjWL0NXMYpgvUxDlBNuCFA53q1tVGjGOw=;
 b=m46+SAHz60dkoCFSmyHsCsPYt7Ue5PtfPG+Jz5Ow/6s/qY+YsX32lLc7O0Ud9LkaZC
 NGab0zMoIHkJx9u+vX8+3qQg4ObCoulPyIvicgHWBL4cTguO8U9a57LqCWxCBDBrUkfn
 tWQiDHRMEDyj9ZTCXtp2D2xmgehgNFkU79NYUNpxJBbwXWHQwRzzZYssPE535MKoL817
 JtLu28ZQgqvkJjCnI/QAitoOUgII4PDplItcgKYm1pQJiE4pm3TiqeY/ASlU/PshnSe3
 slQ4gYma0xCWXsaybqVow6t/p+Ljimp3Efv4SW86bftYMac8NGkaswhz6KbQ3JMygZgy
 wk7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4wqLBbRjOHSnbr/pMH8lSuFC831EQit+VudROfC42p0LdcCMsOixZCxGDG9JVg8Ge3KOn+2DLpwI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxdu3Ngj9atGRU8LYFhB/7gCutUMLxqanqGTICS+h2BGcDbFrWb
 TfCO3t2rGnw62B8Zc9JmPGovf4pLZif5eRZi+fG29V0JLKAcaHDmOb28ISkni3lMiKM=
X-Gm-Gg: ASbGncsXCDLt41SQg/dSnIxvYMmvnSRLucaCTyuerlBzS1JEGneEfBmortS1vtGspK1
 DszWk7XthZCnytymYRg/tUkIVNuXq2PbH9w/vkTxZqfQ3LO9qTsUABiv8cxq7Cnf7REsGrcFPP1
 xCRvcr/HIudR/tmLq2BTXWHREvJnRKpjj+HbZzTCzn/VGFV0sXfOYIXFSdM5+OHdSnijRvaqVc0
 W+RBs/o2pBai99jF/2JMs3S1y5wZTC9Xb462P+yA/XL4QxDxcd1PfWz60ZV/ExKf/vEVbowziPK
 S3YzOeXfxLHOuYXIoKtb1ML/F1lkMPORZFVZBuOyGaLUEFShqwFINdc2MsT/YwxLwzgaZPsp6H7
 7/gg5uq4FB+6cmwpJm90Agam0YOX7fGnNVxsmRvLUTlUCkKSAzzjk7xWROe+Y77Tlv9UYUWmdpf
 0OX6wXPu9BJgYLwL+huiIW+tC2yjj0yQY179z92jFa5A==
X-Google-Smtp-Source: AGHT+IGarLhroHkX7qTmCRjo26XJBz7LFy48hq3bSCrrSEHsmi3uQiS1f6ngL2AlJBr3sKmOqBWAhw==
X-Received: by 2002:a05:6000:200c:b0:42b:31a5:f032 with SMTP id
 ffacd0b85a97d-42b5934dad6mr21284526f8f.28.1763570948041; 
 Wed, 19 Nov 2025 08:49:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3592sm117957f8f.21.2025.11.19.08.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 08:49:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Josua Mayer <josua@solid-run.com>
Cc: Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-input@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
Subject: Re: (subset) [PATCH v3 00/11] arm64: dts: add description for
 solidrun imx8mp hummingboard-iiot
Message-Id: <176357094703.280640.18246985537228820663.b4-ty@linaro.org>
Date: Wed, 19 Nov 2025 17:49:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Mon, 17 Nov 2025 13:28:42 +0100, Josua Mayer wrote:
> This patchset mainl adds description for 3 SolidRun boards:
> - i.MX8MP Hummingboard IIoT
> - SolidSense N8 Compact
> - i.MX8MM Hummingboard Ripple
> 
> This includes dt bindings and a range of bug-fixes:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[02/11] dt-bindings: display: panel: ronbo,rb070d30: panel-common ref
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/779640415ea28abb60bb7641d50f1d9cccaa4d73
[03/11] dt-bindings: panel: lvds: add Winstar WF70A8SYJHLNGA
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/72539c4b9e482f397cc9340bcd97bb7643c0692d
[05/11] drm/panel: ronbo-rb070d30: fix warning with gpio controllers that sleep
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/93f5a0dc2b7c2df71a93e0fc59edae474bb84c6f

-- 
Neil

