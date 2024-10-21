Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768E79A67E4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D662B10E4BA;
	Mon, 21 Oct 2024 12:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cVImfNE5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F2A10E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:17:57 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539e6c754bdso4192522e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729513076; x=1730117876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=prphtPU0Rb62bRXSWJ4X3+5cxLNBcE3V+GKAi8EyFnY=;
 b=cVImfNE5wSiivYAu4EqYw1I7hzsGqgdZxXgayrq/N+u4kXgPzPwF04QTdBPvy7rvqI
 qDB+xVWaRWnOkkSc6QEd7jJmxYzOT3eDiFU+/F5G36CZTaCxifH/k2G0BqOGyEduMNZt
 Xd6LSx1AciCf0vU+NKQ1QAKAPFmIDUrFKTPDNrgy4fl1vtKTbP7KQ2e9OyfSpeJf6oPF
 Cx5cnBJTjBcFP/a714k2hmwRiQmCi6smauYNgWRmQryq4dre6gGFBeN8mjo4lyV4LhNj
 TTrboNdufFsnsQFNcULymjCblXIbmUiHsGfQloD1VjWv8LhYSGSwf98UceLWmuZIHztM
 opzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513076; x=1730117876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=prphtPU0Rb62bRXSWJ4X3+5cxLNBcE3V+GKAi8EyFnY=;
 b=r5ZhMtoiGoCA31zmNebBymWm8SwxGIHb0P8Oi742wp/quI7MQwvhMi979J1N5n82ZO
 ENwIxRH52VAopMoliFhh2f1dJT6PspJvX837PWMgHTE3ceCkixPdqCmTJX0UQ92fD6vL
 lNNOsSP3qhm1TTqeuwMrV/ioLFO0/FYACVrqqCK3S+Q5lb+3wM5Zp20yjhaa58bu5aHw
 BOB8nob0unCg51JtK5hjVQ2DKWT1+Q49TqP0xuTzO5BQ4yBuwdN/6uNJKtm03/D1r13/
 g3McjQjxzuu/MvpLCiCwIMUYv2SNS3QWAKBenK/J7P3rSo5MApwnffDK/1KvdC2OxuNK
 FKHQ==
X-Gm-Message-State: AOJu0YwmV7I7w6J2MJKi4sB26+YhDP/N02vhW3gwc2GjiBipWyT3skQT
 Smr8yP8P4C7N51ifce0Dwql24AANFQzhuKhMPN/j4H5vfUYzLXIfQ4ewkAWLvYc=
X-Google-Smtp-Source: AGHT+IFNrDA2mdhvvKnYVCFjWkWFdc+2kOvP18TFsD7M+Ufianm1YsNMhkTyVIEclzmrFo67RWAnAQ==
X-Received: by 2002:a05:6512:3a8d:b0:539:f1e3:ca5e with SMTP id
 2adb3069b0e04-53a154fa75fmr5584953e87.44.1729513075791; 
 Mon, 21 Oct 2024 05:17:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:17:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_abhinavk@quicinc.com, robdclark@gmail.com, airlied@gmail.com,
 Yang Li <yang.lee@linux.alibaba.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next v2] drm/msm: Remove unneeded semicolon
Date: Mon, 21 Oct 2024 15:17:44 +0300
Message-Id: <172950935861.2053501.17039063548411571436.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240918023357.59399-1-yang.lee@linux.alibaba.com>
References: <20240918023357.59399-1-yang.lee@linux.alibaba.com>
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


On Wed, 18 Sep 2024 10:33:57 +0800, Yang Li wrote:
> ./drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c:282:2-3: Unneeded semicolon
> 
> This patch removes an unneeded semicolon after a switch statement in the
> pll_get_post_div function. Adding a semicolon after a switch statement is
> unnecessary and can lead to confusion in the code structure.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Remove unneeded semicolon
      https://gitlab.freedesktop.org/lumag/msm/-/commit/00adf52efec3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
