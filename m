Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71764A0B2CD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BD210E5EC;
	Mon, 13 Jan 2025 09:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qz17Rwk2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4A410E5EC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:30:23 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so4057369e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736760622; x=1737365422; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8HRood49Au1Xu9yxh25Exam1Qf+qPfikTCGRnvB8zgw=;
 b=qz17Rwk2sAYXP0mNfRBdZwYQnqIezdwru03SuB15h9Dp98nFhJVN07cVT6yrfelE5I
 4eZiuhBA2JeiGxFTiuu0C2jCtH3iA+FqejBuDbTJqG5L5garxgXjN9l41RhE0UNJ/rKo
 2CBmlQlz3xSYxL/fI5TRNVIHDWuHPVpTieVzufMR6GHi4lh/9Y5kNix4q1lt84tzHq5L
 Q0Pf6vIaCXt7a+uA2doEmL5YKYpcQDsud3IeQ34t3bPFeeAlHgb7EZJlwc7kijRWT310
 x40JIpf9dHma4T4Zn7GDtGyWJ5XIa1YADAFOGo+1j+5vGDvZVmOyR5GAQax60XEK2DaK
 Qhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736760622; x=1737365422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8HRood49Au1Xu9yxh25Exam1Qf+qPfikTCGRnvB8zgw=;
 b=rrezUCLWXTtj0ApVuzgTyKiP2iNzvFclIMfQhHw9E3cUn6lv07Vr2C0b1Mus4PcAbe
 0RoeIthMiTwUbsxYoDsLcl3tfi3HZuM62macL+ouigtUhadZd+vY0q2cMr9hazLZm15Z
 mBrHakvW/jdbQiACPeFHhMl1q4uNYxu/VmWUZpAx3PwzaYnKGMpJI+nUl6DMzKjhaCx3
 B4KFwZMtdUePTOmkbG1rW+S3ctD4iFpBrZQ4AwGOLWV/f0PdoMJ9VLfArqfdJFtvVMZR
 +A0OyJcpge0DOu0qvesesFuCot5M01akO7YZe/TEFnJZy8232mncEbxMnZmS14t3AA/s
 u2pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVChdxRD4VaE6k2f7ysCqGMgT9qVwWpHtndmTiQVNEvtN4RP8cANJBiZg4/YKIz3ezS1bP0tduBOTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+SzeFtA36HW65kQztbDZubC5vEi8bapF9Pux2f9lohd+I17H9
 d/idMIfy8Tc+p9yXbHKYp0h1/LfOgGfx+rDm0qAh3BpFrTTKHA3yYSy9uLSl2v8=
X-Gm-Gg: ASbGncs2HdtGHODl/S8CpRCDjPQBpvgTMw9gZJBpRQfDwt0B0pckKwRu9UZyYIsgMRo
 8Wy8GcFsIxUF8acw4N0eGyhI5d8m1jrDoMdZg+qi8zaRs4swLKjXCB2rHvGTwpn+WTa25RG0Vp8
 bib7JLLhKosEYO+RYsHo+ypsC+cGEhm1c8sa3Shue3ER30hSK9DTIWKFt4X27crReAoZ9l6Srfm
 F+2+0cNPXNNecsqV0lTtDoIf2c7CDhRGPtpy5FkUXjy+DRPDFEjc9ASJBCyPnKBPqgjXvbQZQ/n
 +O4eIx3+sNrA0FMHXxP6WTiU
X-Google-Smtp-Source: AGHT+IEmtW0gBb46cz/weiwBQ5q29VkfMd3JgX5xuhW55LePsBeSdtBWIYwST1Pk/vgWY+RuBfElKw==
X-Received: by 2002:a05:6512:4024:b0:540:3566:5760 with SMTP id
 2adb3069b0e04-542847f9ea2mr6036098e87.35.1736760622139; 
 Mon, 13 Jan 2025 01:30:22 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be49f16sm1273525e87.47.2025.01.13.01.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 01:30:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Fix ycbcr_420_allowed inconsistency for HDMI
 bridges
Date: Mon, 13 Jan 2025 11:29:49 +0200
Message-ID: <173676057962.1900740.810579627964292685.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
References: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
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

On Tue, 24 Dec 2024 20:22:40 +0200, Cristian Ciocaltea wrote:
> Bridges with DRM_BRIDGE_OP_HDMI set in drm_bridge->ops are expected to
> rely on drm_bridge->supported_formats to advertise the supported
> colorspaces, including HDMI_COLORSPACE_YUV420.
> 
> However, when drm_bridge_connector gets initialised, only
> drm_bridge->ycbcr_420_allowed is considered in the process of adjusting
> the drm_connector->ycbcr_420_allowed, which effectively discards the
> formats advertised by the HDMI bridge.
> 
> [...]

Applied to drm-misc-fixes, thanks!

[1/4] drm/bridge: Prioritize supported_formats over ycbcr_420_allowed
      commit: d102ac39fbe181a6f0c9e98bc26bd94018657808
[2/4] drm/bridge-connector: Sync supported_formats with computed ycbcr_420_allowed
      commit: 1bd1562d3522f7a846dad795359c31b371e6303b
[3/4] drm/connector: hdmi: Validate supported_formats matches ycbcr_420_allowed
      commit: f2f96619590f944f74f3c2b0b57a6dcc5d13cd9f
[4/4] drm/tests: connector: Add ycbcr_420_allowed tests
      commit: 93801b8c2d18546fdf807c8e3075e6df93960446

Best regards,
-- 
With best wishes
Dmitry

