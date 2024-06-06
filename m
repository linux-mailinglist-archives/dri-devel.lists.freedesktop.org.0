Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEB18FE298
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 11:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4EE10E889;
	Thu,  6 Jun 2024 09:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LNqif37W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDE710E889
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 09:25:51 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42138eadf64so8649865e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 02:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717665950; x=1718270750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tcqdEefUwbLDF0Q15e/COsQkexWvEaGN2lXHG6coCLo=;
 b=LNqif37WFRiwXG8s1v4rmvK6SmXqH3Xqv/60IAE/9uWrdOly98pld7GhwO1OEJisM3
 gRWu3ZEqrKb3KX0mYuScd4Y+y/80c4SPg9gYgCDc7xr7zYh2Gguc9gWp1a5tQiOjyfpA
 96OcFDNImFs2QvD2eFQVKnkxNdk3xCiYd0fALdBhB9cdsM2CoVj1/lYguD+IDtUfYZ6H
 +VwR9UC548ooOwamfr+rVatwrh+B3JnlLaIggOWlm6Qw3gyStsnSFkgM9DzXNURZrNKZ
 aewXUvgoXkN0YWXzGC9rkxw1jVvF2Ntj4TKbfdgNP0xiRa/opBSRfQS7UsHNwcwYwtUi
 yfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717665950; x=1718270750;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tcqdEefUwbLDF0Q15e/COsQkexWvEaGN2lXHG6coCLo=;
 b=LqO11eUwsub2Tm9fJ512YfhSt3/6ZWU7ISxfxQeoa8fR5gg60zvDOhfefchq4Af+nm
 SbLYlh+zbo9suZOPm/LWc70fXEts/S1xhmIeZM8Nkd/dmt6mlOD59WpE+ykrbjGB3TWv
 DOR7i9ecJ6U9/NM6OohhNxRxmnMw/ow5+iYN1pBpHOdJG6XrXeEoQeBiHj5gGQFNBznl
 H61g4kdyv99EHeYm9pxLdnm3pnQVCfJhV6HWGbTa5ngpx25S37tClKxKAzoYicAt/FgQ
 2Hllaz8i3wzHDr4cZJwtWXNeVA7viiupcYdliNrZ0dtKtCOK+gC4gwBUdA4/HsiRQ9mC
 8vgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCnKl1M/iSfPiy50+ygv7lDuOvuWrk2U9/PbjgyOui82fLRyjFB+3K1juEHtBSCsGIacx+JA9BasX0pdxew8W+4ZiGCvMQO8IS+Lit4fGm
X-Gm-Message-State: AOJu0Yz8WY3O+IyQynxLC+mEUmSi0yvp3KL1ZwYWcneSuqTIVECHThNu
 VB0kf1LmQjlrDevE5SHNkHZpKfVnYa+wUPoHa4qH54mCdcoDfRAVKxZr0UwCTe4=
X-Google-Smtp-Source: AGHT+IFbB8BHHN2WaElCWWkVsvsXwSQADBUM+mKiyFDG++QWWYRhOyBsyMb0orv0Unm9/QUc/7vtrQ==
X-Received: by 2002:a05:600c:1c84:b0:41b:143b:5c2d with SMTP id
 5b1f17b1804b1-4215633fce8mr44418375e9.28.1717665949760; 
 Thu, 06 Jun 2024 02:25:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c19e719sm15426995e9.3.2024.06.06.02.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 02:25:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: maarten.lankhorst@linux.intel.com, Haoran Liu <liuhaoran14@163.com>
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
 daniel@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231129113405.33057-1-liuhaoran14@163.com>
References: <20231129113405.33057-1-liuhaoran14@163.com>
Subject: Re: [PATCH v2] [drm/meson] meson_plane: Add error handling
 v2(re-aligned)
Message-Id: <171766594896.3953723.13432230473582313779.b4-ty@linaro.org>
Date: Thu, 06 Jun 2024 11:25:48 +0200
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

On Wed, 29 Nov 2023 03:34:05 -0800, Haoran Liu wrote:
> This patch adds robust error handling to the meson_plane_create
> function in drivers/gpu/drm/meson/meson_plane.c. The function
> previously lacked proper handling for potential failure scenarios
> of the drm_universal_plane_init call.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] meson_plane: Add error handling v2(re-aligned)
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3c28b239620e249b68beeca17f429e317fa6b8d4

-- 
Neil

