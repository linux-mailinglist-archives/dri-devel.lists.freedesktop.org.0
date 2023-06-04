Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9770721452
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 05:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD13510E0AB;
	Sun,  4 Jun 2023 03:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB7E10E208
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:51 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b1bb2fc9c6so12180861fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847709; x=1688439709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BoDmEqdjgADGppA5pdPKPSiVhqTr16jFOpE9tYVHKIk=;
 b=n9ilQJgRuvWxI6him4PxD1czi6TyIoEqM/b57419MXMdiSlvLxONSwBZXFBbmBO/pC
 Iu4Dfrz/s5q+3DiaxV/Xtga37l5amnrVKtb4nxaBiusNimXzjmrIxzijywAcd+TH/DF7
 cT904Q2kZPYQXGlh4VlOfDwPl/MECbiXTPSKClpKswh0Elu2QapSRKTSD1rRWhR/10YZ
 ymW1JnGEHD+fy3QXsgzF2WK3pJAfLjTao5PxN/Ffz92OKatQKmGehQF2fOx1N8N8h6EU
 NtdcmABQrhMGdvx5jeGg9EwuCRLPc+ohQ20NOIMZMDoEPLznkbKKdgEY2KONZjRKi2HS
 i8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847709; x=1688439709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BoDmEqdjgADGppA5pdPKPSiVhqTr16jFOpE9tYVHKIk=;
 b=IAM1srrLatCuTnzdgfmm8LQ2p8ky8bxYQ25La7a/r9BiCmgoJlYhB3G/pvJIs60ooq
 RFYyM2FhwJ+vy1F7Gppz7jVrKybZcSyWsnTzgF3SqSWNm4d7HgTQlYlZzZe5PPma0DTA
 rAEgDXSBSJ41QqZsW1LlM7orexuc25lhlJLyrQNhXWe/yd/8HSAS+8u89zUW4EwWBk3I
 ltvZdk8FjCkcYL2mIXRqLbQrorbAI3yDeJpN5orhlqiYj/XJeZ4eB0JPK1kzZwKFeWHt
 Mv1ogys1EVvrt5LKTfdT/mOzdNISiMIMTM28TUK6KRMP6Z8ys5IVMcfUGvcnJyMqg0CT
 KMWg==
X-Gm-Message-State: AC+VfDw69mmie8CDfcj3qr2SSUsjOI1gShvnF1cE0TgUaWhouDRoXNzy
 5ZiCHy5GGqXLl1L+8uc01pYWqA==
X-Google-Smtp-Source: ACHHUZ6vyK8kmwfY1u4AC4cTxf1sVIa3uyxiHbkLLwPpzTC2Klc0LFD/frFQcwahThhl2ZjqGKudXA==
X-Received: by 2002:a2e:b0f2:0:b0:2b0:5a04:a5bc with SMTP id
 h18-20020a2eb0f2000000b002b05a04a5bcmr2290645ljl.13.1685847709393; 
 Sat, 03 Jun 2023 20:01:49 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/msm: Use struct fb_info.screen_buffer
Date: Sun,  4 Jun 2023 06:01:38 +0300
Message-Id: <168584750429.890410.10110988637937008875.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522191701.13406-1-tzimmermann@suse.de>
References: <20230522191701.13406-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 22 May 2023 21:17:01 +0200, Thomas Zimmermann wrote:
> The fbdev framebuffer is in system memory. Store the address in
> the field 'screen_buffer'. Fixes the following sparse warning.
> 
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26: warning: incorrect type in assignment (different address spaces)
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    expected char [noderef] __iomem *screen_base
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    got void *
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Use struct fb_info.screen_buffer
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4fb5ad612c5c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
