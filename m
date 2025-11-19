Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59419C70359
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 17:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD69D10E670;
	Wed, 19 Nov 2025 16:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XdWUiHEB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96F610E679
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 16:49:10 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-42b32a3e78bso5652296f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763570949; x=1764175749; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6AOLChH/q7xFQ5th9G1DIz4KNOULF7t5D3A23AyCZ4w=;
 b=XdWUiHEB/I3mmIKtX4uyqgekKCVOvwwHpGE/GvfYoLRaJlAtXi/5H4j9xnEqqjUSDa
 UCN+shXnVFZSIrkZeGy1420LVaznQhjHHFVVuUdArtZ5yuLWDQG27vrICRTgq97X4mGg
 dmJx/sZdDyYZh1TxcrYNO2EorskgzktuQb2YMssd9zkKyPq+srwQr23SmOyqNoz0Rk5d
 WAutl+EJSjGxHveZmy3UXJZdLZGSMJPZNoXdRJ59AHdfDjQruvFOWj0Jgl9mRUosn3wK
 eCn2q1nIIKGFZWdcWs+6Ex1nz9EV4mIU7auYK0i/nQP/g16GSY4nl3uCZ4C2UFXFsksp
 nYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763570949; x=1764175749;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6AOLChH/q7xFQ5th9G1DIz4KNOULF7t5D3A23AyCZ4w=;
 b=j98iVTOniGsK9XiiIfAdUNLCQBaCtuedeJnF6BIoeYyL+TY+7Edhbf+fmumAMnX5pE
 g8pL+TqiXaHuujcQBE+ln0MzDeBEGuEpXGYxyuJGOiHkA21dcyykTdr689B/vYh0QzZ3
 HXwXAFthVUvxyy0VqcD6wfoS+qhnFiwYhCS5Z9E4a0RQ5MgpS7r92oF4brqqaR3epQpc
 vxJJieAQLKFPM/TWPTFMtxxtV0pHHZ8IB0WanS/mmfGfy+fOIrCnDWXTqD4zlaxP186y
 Obi8Mo1zCiEGO9DZsQo/xC8rYF4/yxcQFMqEobT/cG9oAdJCB50AesHt0XxMzs1xx78e
 PXXQ==
X-Gm-Message-State: AOJu0Yw8siFMV2NL41HiMGj9bJgjhSNWz+5rmjfUKg069z1PGx4hBdnl
 V4DvAgwASxp8CEWUv264gIsVYhZfxTrT2pfIyIp0RNpXetC9vBdUsgzimrUth9U44GE=
X-Gm-Gg: ASbGncu71jeF/S5uKvILHyBozztQHzfPSpazwVlKDU9veZzgM8/PVkSzpG0iLp5/sdb
 Ryh9Cgkd6/I0CIqVz8yhEaCVSnnWQdTUCKhC4lIVI/36vqMZ4ak+02hEX4zWu7IHsMsCQrarjHI
 Bk5VMtPmc60eCFqOfbUFt0XIo4o/2mkAdsoOX3Yn3QOSdoO1OBozvrqLBVa3HGfyFt48VO2ysK2
 COlWpGCVIeZ4OgNT62j5fyLe5ig/BPhMagHHD2w/A+Z6zRzn/1PElY2DOiprRTDk6AKeF/K67ll
 wd7IUyZEOOzrbjAhKF0pS9nKqEJN4IJ32tLhnwaPJzEuU0tON4s0g4gKaElWNvzSbbIv8LjmzXo
 u7zL/tP+LlZ2UfDVc/7ZY33HrxzZ7009mux8WzE3aPcNbjngHyv9wjGBDnulcaPJoy/pO46Q4QR
 TnJfEmCWSHPhKc2ejsmvzweOqhnaasozgUC3Rzz4D4Nw==
X-Google-Smtp-Source: AGHT+IEQBWB0Eg1zUiaC+C6Q6xYJagNpfFV4B79UXSjGVI8G4Xbkzgsvf6WhQGX2JHCRNzTrOV+mmw==
X-Received: by 2002:a05:6000:1ace:b0:429:d33e:def1 with SMTP id
 ffacd0b85a97d-42b59378443mr21197697f8f.29.1763570949083; 
 Wed, 19 Nov 2025 08:49:09 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3592sm117957f8f.21.2025.11.19.08.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 08:49:08 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
Subject: Re: (subset) [PATCH 0/9] drm/rockchip: Introduce Rockchip RK3506 VOP
Message-Id: <176357094817.280640.17849339974679922280.b4-ty@linaro.org>
Date: Wed, 19 Nov 2025 17:49:08 +0100
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

On Thu, 06 Nov 2025 10:06:23 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The VOP on rk3506:
> - Support 2 lane MIPI DSI interface, 1.5Gbps/lane.
> - Support RGB interface.
> - Max output resolution is 1280x1280@60fps.
> - WIN1 layer support RGB888/ARGB8888/RGB565.
> - Support Gamma LUT.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/9] dt-bindings: ili9881c: Add compatible string for Wanchanglong w552946aaa
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/15e794bcbc9527736d33c96412ce077bd817d9af
[5/9] drm/panel: ilitek-ili9881d: Add support for Wanchanglong W552946AAA panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/89b34ebed02ee39ae02069dcf2e5728aceec9deb

-- 
Neil

