Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEB793ADAE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 10:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716A010E4F3;
	Wed, 24 Jul 2024 08:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bNrbksrI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAAD10E503
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 08:00:06 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-427d2cc1c4eso46223935e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 01:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721808004; x=1722412804; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9gksPNd/8mTl0AswME5OKgNNN/KzZPdsYR5KlLDDwAY=;
 b=bNrbksrIjawn6Y/1QLLMDbzSLJv715+y8KDnhy0xMU7cDfc74nrYjD5sy+C+BlyH6/
 YG/JrrplX3gpdMNdF67INSJZyoHqdmI54+brdSjaIxKoNrfGHXJTnoCmlwO2vGkcxob2
 aY6slnUZwLqxHNLnkCz23Mxww+X4ovOKiI65uIxlMwDWmqseeXus/CAfq8hwqt6uRyir
 gQHaFR6pugrQo54JknnUMSXgxYduExB+OVIxkNtb+ETS/Ma9IAVRsWpw4P5rlax4R05n
 PWcav2buljcEmanqa4MHs982zf2xBnl7DcVNIz9hOq5nBMCI9YAF5Xn7wrJqRE26HOij
 H6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721808004; x=1722412804;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gksPNd/8mTl0AswME5OKgNNN/KzZPdsYR5KlLDDwAY=;
 b=WrzMiE/Sd8UmpSRMzxG1G4PFHQf72MroVpZaqZTXt2LBKgvlVRtDthW2QKmhWfHmxB
 oQacVdcw5JLsx9nLtAK9Ozih9obvU/mUC2/xzxHn7+W/UbrRpuqLwXf4U7wH/t+nmIhs
 cfJrzTd6wrlFcPHuduJ/tpMCli8G35ZJa5KAvI5h6/R0SsKgVaBPu0DWbNpghafj2vEy
 GujXovdoyunJVHeLRT0AZ9AAh7aKt0ok2XhskvDbrnOU8kZEFEf5hC6dFmHt3TG1VeAH
 AmmvXx6wNwfHFXmuAwS/abcZKHj5hqLOdECu30xt/DiJ4/+cmbme0KOFdQC72PUrXLSM
 tDpw==
X-Gm-Message-State: AOJu0Yz9rN8Rl4ru20zYAMtgphbmVeytsLUROLsUr+oem6Sqf5rGmGFI
 7qZFWToM3rDxlKHqC/q3KXtHkASMTC0ycSVLk1oK2hDA0XDdsaqtaTnwCm6eZ2k=
X-Google-Smtp-Source: AGHT+IH0/YSxaGFFUnlIWu+/ToSP2Peo7hMQ3mRiuobNjGX5FoeFex9AY3X59ni2+Va2L5RP5LR6yg==
X-Received: by 2002:a05:600c:4746:b0:426:6960:34b2 with SMTP id
 5b1f17b1804b1-427f95c1e5emr8646555e9.33.1721808003111; 
 Wed, 24 Jul 2024 01:00:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f1f52b8dsm33884015e9.1.2024.07.24.01.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 01:00:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 dianders@chromium.org, hsinyi@google.com, awarnecke002@hotmail.com, 
 dmitry.baryshkov@linaro.org, 
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240723062615.14796-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240723062615.14796-1-lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v4 0/2] Modify the method of obtaining porch parameters
Message-Id: <172180800228.4044086.14282905036923611293.b4-ty@linaro.org>
Date: Wed, 24 Jul 2024 10:00:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

Hi,

On Tue, 23 Jul 2024 14:26:13 +0800, Zhaoxiong Lv wrote:
> The current driver can only obtain the porch parameters
> of boe-th101mb31ig002. Modify it to obtain the porch
> parameters of the panel currently being used.
> 
> Also switch to the drm_connector_helper_get_modes_fixed() function
> to get the porch parameters.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] drm/panel: boe-th101mb31ig002 : Fix the way to get porch parameters
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c60ca14bfd2d399a66f7164e044b63991c6a5a82
[2/2] drm/panel: boe-th101mb31ig002 : using drm_connector_helper_get_modes_fixed()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/708899133615bdb8087cafa129b8e24397d0c79d

-- 
Neil

