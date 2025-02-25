Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8556A43B71
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C80310E613;
	Tue, 25 Feb 2025 10:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CSHgu10D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E60C10E60B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:25:40 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so51243095e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 02:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740479139; x=1741083939; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GO+8glDRZ70FolfJHUuyOyuSWWMeXZ0930x4j7bHw1E=;
 b=CSHgu10DLTWN+V4z2g80i+NOUCu9vyrhUCYl8OGCA3X0//ZLzPU50UbJrWh6L5BYnR
 IpzofNp0kf6z/YHrVaqxCoV98eKbSVQPx1eaTfChy6FEPho8aAO4XTxcfzC8ZdxDGg5d
 N6hstDZLYplLHdvPit7Ac6g1z1Q27NKNxz9qa99N9rK3oRYDeA9o97YZA4DeMV3TEJ6X
 FRcyVCsFpj8hNUSMiGepdsh32//co/CZ22jVXS4ioqtQ+2FzyURMJiSonXtRZNqiXAo+
 9/ILyqbufxt7jHxKbv8084JxYvPd0cQzZ+3iQA9tyM141RhoKnOsqC1rCP6Dc3PllRL9
 fflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740479139; x=1741083939;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GO+8glDRZ70FolfJHUuyOyuSWWMeXZ0930x4j7bHw1E=;
 b=boPQfeazq27RzYxrHiFhi196R7HoSbO4/BIu9mEQKmMXB0LHSds1oNHAE909A3l6t9
 xR3Xb5/YXrPmUHI45fSRwFWXfml3/LyVVG+4FdnJBTWaJT/SJIqgr4yirSXY8p6ZaZp1
 E57b+KBGrNHLdrnQb0JDMQq1I0ZTAyKCLLWhnB9TxuiEWT4Y9q9xw9z+Kl0RJD1zJ+n/
 m4mVhBkVAVvGS8aLQ+W2+5aE/mRJG8i6JK4bz2W0U1dQtsAEnC+x680g1JoQbcgkUw6f
 IPdGcoIZY7UNrh35DvY6TrmBuEwrJ7ZSZ1T13DUsQ4SPuV5TVHdxRhl5GA5NNjk6ZP5O
 RR8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlmjnOX4KLBZVLBRUiHTglU3ttIq4Xs8IU3D7KC5qp/dcGDIHWbe0FkQCvYjmlAuKbzOs6fg62yRY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0A8pKpyhdOOUFV5+adVGrk9FUhdijAgTBs2WnkxHz+lYNSXvF
 bUYT3i+idjISMJHU4UPxrk7HbManA32ZIpf7qX+AE85/E1zIwE8oAOQLd5YtZx8=
X-Gm-Gg: ASbGnculamC6iGKD4jKJfW3N6QT7gktEZbUhSwNgbo0/k9t0fn+6a1qORbfi9zdY7e0
 s86jUamR8xppxTdxY5YUPU2Fw8y89LTCtolNaQk0EKJR3KMvqUuHWFVlB+PYsOTSPAQiuzuedzT
 RyeuZcVqMzc9AqpAiStpPsdMv5vKRnhOiEZkHhmiHehC3i2Ybj6esJe1YxwSmYv4bEnJ0EHf3jC
 tTsn3x/wrLvGEzyjUBM7ZgFS8CXfr01fYFoFoLSAaFflMYeNezyPIpt2UUqXYSS9+ChZE237uhA
 JxHK/NdvJ1sGzo9JJt2sKnmvPsi3yp00iBaHZgSGxWWOm6g=
X-Google-Smtp-Source: AGHT+IGCJja0+bBP6yFXu5tgG751wKC5th2J7f0lmxV62+z2DFSuW2JXXrH5OxE79sHt4myCc7POkw==
X-Received: by 2002:a05:6000:1a86:b0:38a:8906:6b66 with SMTP id
 ffacd0b85a97d-38f708267ffmr17605833f8f.38.1740479139095; 
 Tue, 25 Feb 2025 02:25:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86707asm1764378f8f.5.2025.02.25.02.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 02:25:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display
 controller.
Message-Id: <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
Date: Tue, 25 Feb 2025 11:25:38 +0100
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

On Mon, 17 Feb 2025 12:39:30 +0100, Sasha Finkelstein wrote:
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[3/5] drm: panel: Add a panel driver for the Summit display
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/40115947b59f2ca361a47615304dff0a2b69a2b4

-- 
Neil

