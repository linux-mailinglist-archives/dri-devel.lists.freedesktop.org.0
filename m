Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11801861524
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 16:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AB610EC36;
	Fri, 23 Feb 2024 15:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BsrGBGfk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD4710EC47
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 15:06:20 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d275e63590so4220901fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 07:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708700778; x=1709305578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4sJGs1NYZ5QUnzqdBB1Q8b+bNbJNb63ZLKIOCTbd53c=;
 b=BsrGBGfkmWHft0C1OQtxmXtwOAGovjO9ZPux8MD7Vbt0fHUz1QWB3UeMacgSsApAdQ
 PkeWL5LpVNNDZI3adt3qpzyn3tEvhBTl00GmclSlUnzA0rTHfTec0N882PnY/LR/s9IT
 00R4IT0V4DeaUBwmt/mBNde1M0q6JrT9ZPcBUlXct+Y2+EizekoqVJ1vsSowyyfyS8ze
 pd+cxl8SfGfHTI5dXelBkUKy+cVtz0+aVOvaePiDtkoXOJhvadf8/j5J+ZmjQcwyma9M
 txGDBt4Y+WoLN89jBM0XZzpn+NvU2nRFzsuKK0Fw4eYah9otYv9qxwF1Xbh6zil15mNX
 JuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708700778; x=1709305578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4sJGs1NYZ5QUnzqdBB1Q8b+bNbJNb63ZLKIOCTbd53c=;
 b=PhHxT8rFOm3ubxR70T1AVp5zFQPvdsQMnn6a4O/zC7DUUT8mdnbjIys9U9Bbrfkp7C
 E8X8rFQFu/FZ952d8uczXKHLT8cKXD2cuT7Hs6zL4hMP54S6ePKEUdExx4wTpptKQQ1c
 F9ijdoMl0KA9fNKij84g3EeauSkAaZHwSmplgRUz3kf1fzdT9ess9PW3Q5RWESBqwpn2
 8pIpcPIWx311u7p3fKHxa2IZ+HFpLPIg8G7R8hGWE1CP/sdRBqXOYjqs9+2+TDfbZjuX
 owFjQ63k9a0MwLeyRwNt/wnkEqejqLbMhLnzN4XcB/rpzvnj1t6nCTY/B3WR/zxVupL6
 xefg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnVN20B4Jn1fdSKl4nGe43ewgf4jP3lNDTxF7kzkMpetCkc0Bhl3V88TkKMhz5HC/G5MqknlOYK/MaGksEeFMbG8lthfW8rlLXqpljzDDd
X-Gm-Message-State: AOJu0YwZQdi6m6NDKlsviFsMhFcuJ/XOF/korqzx4bcQhq9zPtvJC7a4
 MWnHgrukw5npa/jxcg42T95aR/cc1n7bszcvnvegFqhffpWoggzrZeStgr+ugGA=
X-Google-Smtp-Source: AGHT+IGfCIE307IqSzsAUBlWRNDb7b8z9zOXY/2OH+3bNQA44KSVllJBbJFnbX+Qnh3P7Q37qv1Exw==
X-Received: by 2002:a2e:a488:0:b0:2d2:61fd:7c2d with SMTP id
 h8-20020a2ea488000000b002d261fd7c2dmr63698lji.17.1708700778286; 
 Fri, 23 Feb 2024 07:06:18 -0800 (PST)
Received: from eriador.lan (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300::227]) by smtp.gmail.com with ESMTPSA id
 u24-20020a2e91d8000000b002d0c8fa072asm2681353ljg.20.2024.02.23.07.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 07:06:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm
 bridge use-after-free
Date: Fri, 23 Feb 2024 17:06:15 +0200
Message-ID: <170870071756.13438.16980480346490993922.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217150228.5788-1-johan+linaro@kernel.org>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
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

On Sat, 17 Feb 2024 16:02:22 +0100, Johan Hovold wrote:
> Starting with 6.8-rc1 the internal display sometimes fails to come up on
> machines like the Lenovo ThinkPad X13s and the logs indicate that this
> is due to a regression in the DRM subsystem [1].
> 
> This series fixes a race in the pmic_glink_altmode driver which was
> exposed / triggered by the transparent DRM bridges rework that went into
> 6.8-rc1 and that manifested itself as a bridge failing to attach and
> sometimes triggering a NULL-pointer dereference.
> 
> [...]

Applied to drm-misc-fixes, thanks!

[2/6] drm/bridge: aux-hpd: separate allocation and registration
      commit: e5ca263508f7e9d2cf711edf3258d11ca087885c
[3/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
      commit: b979f2d50a099f3402418d7ff5f26c3952fb08bb
[4/6] soc: qcom: pmic_glink: Fix boot when QRTR=m
      commit: f79ee78767ca60e7a2c89eacd2dbdf237d97e838

Note, PHY patches (5,6) do not have dependency on the drm patch, so they can go
through the phy/fixes tree.

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
