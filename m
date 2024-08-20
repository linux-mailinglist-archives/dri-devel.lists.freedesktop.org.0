Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E40958247
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FA010E578;
	Tue, 20 Aug 2024 09:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p+nuAz3Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0C410E578
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:31:35 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ef2c56d9dcso62314291fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 02:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724146293; x=1724751093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1bNc9l8XiGEm1hW0c81TkZnlO34t4wQ/crzh+T3fF2s=;
 b=p+nuAz3Zsv8+aBTeXHH23kR0xuakgPG5DO6H5x7K2fGScGZnh63y5oOA6jX2MgkfS9
 XBUThAKoAbAcOTHFjlwGaEKDef8Y5yTa3VzqBdaS2Khr3dkBruZL+D1xMaV5jZzqr1Te
 PYlhogk2Rwr+Cb4TawWA0q2EWxOp8f4ihDgAMHBT/uZrC3EoFNEYKUiu6DsP6fNV4QuY
 VsHa/dv0lf3Tp7bxHQjeaPrnNBHkyrI2PFkJK/cPGr/cmDZoj2CI2XVLFHhOnvHuf6cV
 U1oaiqjFamUzpVflcmVrpSYTS4BGXl6ccxMLrLxtAJRGc8ncjPI8z/fP5eACHH2ZuY1o
 pdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724146293; x=1724751093;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1bNc9l8XiGEm1hW0c81TkZnlO34t4wQ/crzh+T3fF2s=;
 b=oMvZmuuybjc8jIuf8ghF6WorWX3bK7dbnWc9rYaZK2k+jhQX9NKqRisny6BdblNnts
 L08dXRhyRsZTBMmbaajnRPDaNsXaH5ycAm0iGjTB46PfXBU9V4DfI0/O7eav12M8iaSP
 lWM7EYUWm0Cf7ZhmAS8CTXnS98NcJ3Zxt4wpu/ZrBMb9dyF9mtvp8zEg6dqxnWXhQaAB
 ohoXXlh0SrKW5sCr0g4qHU8X8Od4njZIfv1iJbo6+PjOGavfhcVC3o/a4eAndL6NGg9m
 xMSSI+rFJdQSsbu2dF0awn4LVU/6ev31OqSH2iCYR/K84u//OU5YcMPC/MpjVBOoGP7u
 KxmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZSXiahOXc1UaJkZmVptR1nHbdUV+4DPZDsnkcdMpUYQPJEEIWtZ+WNFQ+p8K6PUpAjwIs/gCnHUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUAlIe1VBcoYnypekFWUb19tefgjhRFFJgjrYMkU4Q54/82Qql
 cQvDw/5uMq7uxfhdVPwjTAAxxc85kfsfkpXEAyx/vMYTj6pj3eCtsSPmZftALzk=
X-Google-Smtp-Source: AGHT+IHblW4gV3DpsU8/IHEQKTGcs6OrOgAvGPIjBHkHUBepvRVzyoB1s/Fv/Hbq19HVXW/1GWWKXQ==
X-Received: by 2002:a05:6512:641b:b0:533:44d2:e682 with SMTP id
 2adb3069b0e04-53344d2e7fbmr439573e87.34.1724146292925; 
 Tue, 20 Aug 2024 02:31:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed648f00sm136597505e9.7.2024.08.20.02.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:31:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: agx@sigxcpu.org, kernel@puri.sm, Tejas Vipin <tejasvipin76@gmail.com>
Cc: dianders@chromium.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240820091556.1032726-1-tejasvipin76@gmail.com>
References: <20240820091556.1032726-1-tejasvipin76@gmail.com>
Subject: Re: [PATCH v2 0/2] convert mantix-mlaf057we51 to use multi style
 functions and cleanup
Message-Id: <172414629205.2571141.13215409630895562248.b4-ty@linaro.org>
Date: Tue, 20 Aug 2024 11:31:32 +0200
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

On Tue, 20 Aug 2024 14:45:52 +0530, Tejas Vipin wrote:
> Uses mipi_dsi_*_multi function in the mantix-mlaf057we51 panel and
> converting uppercase hex to lowercase hex for cleanup.
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] drm/panel: mantix-mlaf057we51: transition to mipi_dsi wrapped functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e139c0eb22ce5b2ab6a2056c1ff495f3a38322d7
[2/2] drm/panel: mantix-mlaf057we51: write hex in lowercase
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b61c4bc674c6032827f2682a0c72ff577c36143f

-- 
Neil

