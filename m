Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D96913E11
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B5110E110;
	Sun, 23 Jun 2024 20:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W4VsXBzA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4821D10E011;
 Sun, 23 Jun 2024 20:30:43 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-362f62ae4c5so2048295f8f.1; 
 Sun, 23 Jun 2024 13:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719174641; x=1719779441; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9uG1Tys1B/HQLY2Tx/XIV4+WZ4HCgTs0TOdWEHncJZM=;
 b=W4VsXBzAgkgApNc23HdUqlIwDY4/AAa0dPYOyCm5XGomvz+I52eMEi5+H5CwTXPEeW
 UkciP/ulHeEDjDZ3OgWSfFWbu8W0OlSt7q11ClrXMdoa8O3kLk13jeByuIUjP9rtP94B
 m7N86bwGMAxltsrZpBiG5b10Zwx8RvEvusgBFvXLpnOHeMBw/mcJL0Xd/re89mYmNohP
 oNnC9UI2LRHblW2b1OcUwDk4d4w8/jbl8CDWkbKIXGh9C4BTK7ewk3xj/FMv7l6GS9i1
 LO4KQMOVqAKHgM5XGFaR8ZSpRf623uGbcr4pjCug8Rtd24EIZDI2f5eXZubZNLoGw58E
 IR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719174641; x=1719779441;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9uG1Tys1B/HQLY2Tx/XIV4+WZ4HCgTs0TOdWEHncJZM=;
 b=MlNMnk8Fsv6kCw1/DqzbA5UfCdXenAlCKU5dNlmLxIDPEqIdTT4XdK4hGZSx16tJmY
 ePQ1RIU4BPtR5BWHlgZuGA5hL+PJPn+Ix3LySpdiFzvwJXTJ7kQW4YbUSvo3R49LapMJ
 QuPmQI7D78mnVC+CLFiwNvc0NKAbkmgVqaEwlSImf1l6d5pXVd25PaWIXKJmwMqkCk+A
 r8LUd5BSK2p1oM0e/3oT8KNOejJy1mg4eD34n/HLpS66ma6EWP0+tAGjRbsxUFh2g9BU
 iB5zvwOsRL0jVXwIcE+gD7jJtTJPILqpcmL2nOZH97iEAAWq8N9dYAMxHTXDcEIojhSW
 FUbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9LFQq4qnIcxycJd8C5a6M6WhUegoHkyiS6l+AKswpz9coOnkQa5K3yv9BFzU8fqDUh3dVU6U/3dzvDfR5KS9mBxsmhurOFsVTPzDpYhvf//zCscXyRhKl1iLe3cb9HQowIy1SVwGXe8B62lcocIZR
X-Gm-Message-State: AOJu0YxyZX7fd99fAEIfJr1gK7K/wVmXrBivpENky9bHXg+Zougcrc/E
 Huvl4y9vvRoaoGGSLKJUT2Vgnhj5l7ystS7kVmBBqMni2v/jqWk67en416/Ir0k=
X-Google-Smtp-Source: AGHT+IESzOtPGZ5GOePsvOUKETWkuSh9OYBBcl3AjTUBWVS89bQ5ueDZ98xvPPpfuDArDMrx3vPQug==
X-Received: by 2002:a5d:60c9:0:b0:362:ff95:5697 with SMTP id
 ffacd0b85a97d-366e32f6e6emr2844708f8f.28.1719174641228; 
 Sun, 23 Jun 2024 13:30:41 -0700 (PDT)
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu. [188.36.146.243])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b8ad2sm8088599f8f.33.2024.06.23.13.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:30:40 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Subject: [PATCH v2 0/4] MSM8937 MDP/DSI PHY enablement
Date: Sun, 23 Jun 2024 22:30:35 +0200
Message-Id: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOuFeGYC/y2MQQ7CIBBFr9LMWgyMBasr72G6gDK2k9jSgGk0D
 XcXicv389/bIVFkSnBtdoi0ceKwFMBDA8Nkl5EE+8KAEltp5Fn4xKLTipxDNLbzUJ5rpAe/a+X
 eF544vUL81Oimfuvfx1P1NyWkaK3TRpLTzl9u42z5eRzCDH3O+QtAmLAHlgAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>, 
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.0
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

This patch series adds support for the MDP and DSI PHY as found on the
MSM8937 platform.

Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
Changes in v2:
- Remove MDP_CAP_SRC_SPLIT from mdp5_cfg
- Link to v1: https://lore.kernel.org/r/20240623-dsi-v1-0-4ab560eb5bd9@gmail.com

---
Barnabás Czémán (2):
      dt-bindings: display/msm: qcom, mdp5: Add msm8937 compatible
      dt-bindings: msm: dsi-phy-28nm: Document msm8937 compatible

Daniil Titov (2):
      drm/msm/mdp5: Add MDP5 configuration for MSM8937
      drm/msm/dsi: Add phy configuration for MSM8937

 .../bindings/display/msm/dsi-phy-28nm.yaml         |  1 +
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml |  1 +
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 88 ++++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         | 18 +++++
 7 files changed, 112 insertions(+)
---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240607-dsi-851ebb226a8d

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>

