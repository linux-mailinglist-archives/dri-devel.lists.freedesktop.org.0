Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1272A04DB1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 00:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA5A10E35F;
	Tue,  7 Jan 2025 23:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NxVNc8kk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF90310E35F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 23:39:44 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso2980948066b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 15:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736293123; x=1736897923; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=saDkxKPzND6kGX9Zm7OhdbVJz8Bwy8nbMVqPFGjs41Y=;
 b=NxVNc8kk9SueyYwMrzkWpYXyv6Bht0w6SAqq16SQQcob3GjsgO2Hi6sOqr2DTJGOt0
 ZURDvkQHNXHEDxe67034DOnaULGlHONfcs5gc5SWhJSzOBZnGotd+6tpxzaQSqa59i+o
 ElWCqk2VbjZZBESj5NDKfV4v7ubhY0x/ypXLhcBJmVhYrcq1xq1MHPAqHF76mB31CCDo
 qhmyao0AJRFTSycWSoOXE66XnqcmGP4PFboEfruJAXikYBhregVEWMSHnFZmm59ENo/K
 UNVHsKjR7d2v7RmSKa0tsqQlD6IG7XFjU6l1OwcIRdBJUoP8OpGkQb17tT6Govis5Dn8
 Yyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736293123; x=1736897923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=saDkxKPzND6kGX9Zm7OhdbVJz8Bwy8nbMVqPFGjs41Y=;
 b=ePXdXgngLzkpVTr1o0GoQanDAch9c8F+PGaWGTxsUv38deiNfNayO8fwrPngypJbvJ
 PBWc+y5OLKo1hTZ+Th5I8vzEQSE6SaTO5f+2c1v3R5V9TC+SOnczrUhgHPI4/EfjZnOp
 hzKOBN5uicB2xss9wPSIkim5J+vi0aZB+gCB0I+KMlyclNMU/NLNnHqyy4sr4pX/8hfL
 tjlUjvIAihb80WV9vSBsoBbhYXHPXK1RkVr6JnGAxfLYOjJoaysYdCaSC/ajhLOyd/2Z
 6wTiXjUWQnAnRQRXstR3OGMWK37+8DU1P/w9tqg/Kz9AXT04+UXS+GZ/9vW2o55RxXaR
 6PgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4gFYbYY45AgcvpRZt1fcOG/EFYlTe/DuXjHZQ0cN01TshqH/dSB7xbwuWBxFvvK139SUp48vK+oE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQtjJOkp0bh670HU5/V0AVBBx3RKcFj9Wttc29A8cT12rJlICn
 SC1+iBm+iGLeQuwocQLiAFd38AZF+VKK32I4R5luTqnbPf2lrB23EqohMko4HueLO53V1LiKn1T
 J
X-Gm-Gg: ASbGncth5UluGBxl3OUvRlAJFISubb1uYXYysEJIigehcMFdc7RyTQ8BLed28TDdldZ
 gUchMBXzmOBbRk+OdoZZKVwPb0peELPZjzCAEE0HZMa9mKl3EvOOrSehkWUnivyLLf2scVe1FFL
 lqCOjuRLFoee6UaFvmPP/NDxCMwVhnZDYIu/eeWIczV2SHXsIZ0RjvYk9S5oUKaUo7uyOkGzZbf
 tD/zHEKP6OwuM0ZY8j4eGfAlwDo6jNVniGkR0N2g5VnVDSSA4XwMZKoG5zeBzvW6aAJm4mIeypo
 +NBOEjm9L8xWUvJvalkrAwzl
X-Google-Smtp-Source: AGHT+IEHAM57Ay2FedhL/isnX+hhpE4mGhbj0zi1B2i+cfE2fJRZYdfUUgoRKszhnhZ/teObH14f8w==
X-Received: by 2002:a05:6512:2214:b0:53e:3a79:1ad2 with SMTP id
 2adb3069b0e04-542847fea7cmr110985e87.40.1736292719750; 
 Tue, 07 Jan 2025 15:31:59 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223600273sm5378189e87.95.2025.01.07.15.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 15:31:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com
Subject: Re: [PATCH v3 0/2] drm: Allow encoder modeset when connectors are
 changed
Date: Wed,  8 Jan 2025 01:31:55 +0200
Message-ID: <173629271136.1554633.10366344657085975397.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211-abhinavk-modeset-fix-v3-0-0de4bf3e7c32@quicinc.com>
References: <20241211-abhinavk-modeset-fix-v3-0-0de4bf3e7c32@quicinc.com>
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

On Wed, 11 Dec 2024 13:18:41 -0800, Jessica Zhang wrote:
> Call encoder mode_set() when connectors are changed. This avoids issues
> for cases where the connectors are changed but CRTC mode is not.
> 

Applied to drm-misc-next, thanks!

[1/2] drm: allow encoder mode_set even when connectors change for crtc
      commit: 7e182cb4f5567f53417b762ec0d679f0b6f0039d
[2/2] drm/tests: Add test for drm_atomic_helper_commit_modeset_disables()
      commit: 73d934d7b6e39a3e52586467a30ca3ff3f6f9eb4

Best regards,
-- 
With best wishes
Dmitry

