Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8461092BE81
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 17:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E2910E5A1;
	Tue,  9 Jul 2024 15:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rwf1zbzC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C62C10E599
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:47 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52e9fe05354so7769027e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 08:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720539285; x=1721144085; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7yG/ZDYim4z9LC6qifUBZG0/p5bmD5z8CTGL0U90n4A=;
 b=rwf1zbzCODJlvsVld1o8MoCtQ6bljrsBTM44PzoJkXvFwlfAL0vO2C6KErPzQDBLK2
 Se7dIqUAdYjOh1PVBHosJGuPXCdjLb75MeSUEslzjrsNQm1js0SDznl9AoHm0EMHLYVt
 0comLi8vbOGJldmWDntLl7QOzou8Nz9oFUoU1sZOgDxzL0jUhkajeG6ornCfqadPKp+/
 vCXa6Dl/9Pprd3ZovMlS5NB2OJ6Nau9AN/y3YuthZcu82iQ+TQCnwiLrPta61dxT+LOn
 n9Y2PHpnNepMRec34gdImVF3jsENH3twwIz/ySYs7ezrEqr/9/1HNTIWbxby7aoj6yXN
 YHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720539285; x=1721144085;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7yG/ZDYim4z9LC6qifUBZG0/p5bmD5z8CTGL0U90n4A=;
 b=h1JmPSIfCa1JflKdqh9ztxBVMHo1R3EDoxLEC64kQzEUImUXJt5AI0NjIeslGRTkP4
 gI5ZTlPs9j1P40qrs/KJTc7canI8ewF+BwZZg6xcL5wgG9wgq9S8pXbULFrZ2uOK1ZbN
 os+DW3VDrMBlirV5bpgFzy7rcmSkOe7fS+kEa2LZ+r+TOsfkeGg4hZ3aONHhX2ukp73P
 ttQow8hGh/VJUvhSqdO6Yvyj9OTCGFR0jUyemVjQheGKlse762G7logY9pDPCVFPTI2H
 ZUOknRS5JK0nfstH4Qc/2k1D6EjCpxJ7e7xfAKDne5+B7jzAqHIomScHMEg4UspLc/87
 No7A==
X-Gm-Message-State: AOJu0YxMgvZaJb/HporyNVv9KrCOXeaoM56/k2eGiF3iySLQtb5e/F1g
 nQnmvvdMwE3lKNdudVyPNc3uN1NU+VMDVR+g0NNhwnnSQYk+Z7NGJqZbq/qjOStBpOjhCMeGARX
 BR24=
X-Google-Smtp-Source: AGHT+IGM3pUx5C/Cg6m7uBP+vTz1fPg9IUGzC77G9bSZyWmRGAOxTkESVD8m4RIjQ+Lwn/adRidfWA==
X-Received: by 2002:a19:6b19:0:b0:52e:9f43:c13f with SMTP id
 2adb3069b0e04-52eb9990cecmr1756059e87.7.1720539285216; 
 Tue, 09 Jul 2024 08:34:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6f1182sm44663495e9.14.2024.07.09.08.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 08:34:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Jourdan <mjourdan@baylibre.com>, Yao Zi <ziyao@disroot.org>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240703155826.10385-2-ziyao@disroot.org>
References: <20240703155826.10385-2-ziyao@disroot.org>
Subject: Re: [PATCH] drm/meson: fix canvas release in bind function
Message-Id: <172053928435.1226690.16610517501511162578.b4-ty@linaro.org>
Date: Tue, 09 Jul 2024 17:34:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Wed, 03 Jul 2024 15:58:27 +0000, Yao Zi wrote:
> Allocated canvases may not be released on the error exit path of
> meson_drv_bind_master(), leading to resource leaking. Rewrite exit path
> to release canvases on error.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: fix canvas release in bind function
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a695949b2e9bb6b6700a764c704731a306c4bebf

-- 
Neil

