Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975ED9F08B9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E5210EF84;
	Fri, 13 Dec 2024 09:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SK1BLxUB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FC110EF84
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:56:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so18404425e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 01:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734083780; x=1734688580; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3P5AumGTt5EpGjou5Xk0XGfS/r0rhdsRhRXqKX5dfdI=;
 b=SK1BLxUBKWCKOxrABC7uiBsXCEfC5HWCCl1WDpxAeoUwg4dNVevANQR9LwOkz/t+qb
 3UEwNyo3ArTRpp1//aKwAU+fXHucXZSaVHrnkVnKUSgQkPpt9X8ofxRtlKKjniE9rL6H
 JjJf2nvbjqVNL5zf9XULlSeuKSClxnGuOOixYGjF0mXIJxaGHi+4KZvspNHlLjTFd9eS
 aDUFGmKAejhwreLMnr9/j89Uodra+AyUyBGjn7pJ7bQ4uOC438kGPWeI8PF/x/h/ps7E
 0kcjIDWrDyeyp6qZ9sAFkGNecpYzvnZMzTE+YyyCRPDsgRCa03zmcTzefRiOftFzv3oR
 rKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734083780; x=1734688580;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3P5AumGTt5EpGjou5Xk0XGfS/r0rhdsRhRXqKX5dfdI=;
 b=jr8kxLdCa7Tt8bQmoP4A4Zfv8Y8tcljNY0NY4IXMvIwnd/gV0HedxVoW3zYc+3UCjq
 JbPE/3dNfbODcuqb/lkFlOdMaALdc+1bi0Ekm6Ilp5a4qa3XA7umzhvATSctQH29l4wd
 5jIMWTM8e3mFrl+3/wTc5wUf49wzF9HuDLLVdokkDQRBZVW3VManRmoQuPj9CpXo6iyt
 luEovb5pzDXj3IsVIO5gfaaYGrZjLV7dn4m9S3GHae8bJTyC32U5H3fy17VW5GBwLLNQ
 FdOA+s+euM3oVt1++joYh+cZSkfUsMvDIlApTuT1LIa2Apk4ioQxt/MuMiN1YdNHfFhV
 cpEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAXxKHq1htBgndpL/ua4D6ntQgzdyMhLuGVrk1RIsZDMJhg+qxlLGJtjSh9rZ9wsY7+CctD2/gflY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpiFIZu969pE2hGSXEY2n1qCBgtyb+SIYy3yGXyyLxeTrNfvKE
 GR7KY6TFfxsuLk0sCg+lMuN2/sNjwLhRksnYC2I+uSYpWmoZOx/Pk6K3EnToBo0=
X-Gm-Gg: ASbGnctDWZg/3f5XO8IPTKKGnkIq9XGJVKfseWh5BEMTCWPkDo4GJCUUjc/WOKoRQzJ
 DiJ5IRKtPTE5hsEM1gLHvub4Nz7/MD8Lr5wl9IPsuGKpNiOVi0tnqO1/kFFUO29qAG1lB/oxXtu
 J9TKc/z98jT1BfsGmXNpXQoD04KL4S7pOQW5Bj0c+BtSN0eId9SbWliAHslK+yf9vvJsGUMSoCB
 exkuqG29XfFspBtf1BpzAQn9fsLEyiyqvyHEX+bvPWzf9OwSn0+RXDfioxo3k4wA5Q2veuPRlx5
 nw==
X-Google-Smtp-Source: AGHT+IH6hziwd+Jot0z7u6xIBpvd5SUJI/mxVC3aYc9TZI3T8sPaU6WajyTG0FX/qZLf/iS6hNUmIw==
X-Received: by 2002:a05:600c:8518:b0:434:a04d:1670 with SMTP id
 5b1f17b1804b1-4362a987aecmr16582815e9.0.1734083780492; 
 Fri, 13 Dec 2024 01:56:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625706c77sm43616845e9.34.2024.12.13.01.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 01:56:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
 Zhang Zekun <zhangzekun11@huawei.com>
Cc: chenjun102@huawei.com
In-Reply-To: <20241025073408.27481-1-zhangzekun11@huawei.com>
References: <20241025073408.27481-1-zhangzekun11@huawei.com>
Subject: Re: (subset) [PATCH 0/2] drm: Add a check to prevent NULL pointer
 dereference
Message-Id: <173408377979.189325.12173243623284012365.b4-ty@linaro.org>
Date: Fri, 13 Dec 2024 10:56:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Fri, 25 Oct 2024 15:34:06 +0800, Zhang Zekun wrote:
> drm_mode_duplicate() could return NULL due to lack of memory, which
> could cause NULL pointer dereference. Add a check to prevent it.
> 
> Zhang Zekun (2):
>   drm/i2c/ch7006: Add a check to prevent NULL pointer dereference
>   drm/panel: himax-hx83102: Add a check to prevent NULL pointer
>     dereference
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[2/2] drm/panel: himax-hx83102: Add a check to prevent NULL pointer dereference
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e1e1af9148dc4c866eda3fb59cd6ec3c7ea34b1d

-- 
Neil

