Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DB38AC69B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 10:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E0F112899;
	Mon, 22 Apr 2024 08:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Hj/jd0w/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD124112897
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 08:19:06 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-418e4cd2196so30212615e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 01:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713773945; x=1714378745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lt2BkwQqXLpwxVqBhAGtLtKzSow+0YulByb/B8x8jm4=;
 b=Hj/jd0w/8X3sXZwRFJ6mGFovj+4w6cBFMFTqtWuLguuEfHfiSjIk+eJnbNk/OwCEBd
 egYG5v88lL9eTFuE32ZaHrUlelbjQa61te7MzW26S0kyc/khqkrX8Ej2BwQHiiMRxWLJ
 D8BsSuO8JwnLU+2wiUDOEJqWnvfvMwUME27c+q0NmLMP2VjUA0dDZNjHd0Q8kyZiWRE4
 4i24eDm/uDRzLG/FUDU602Yy7xnUMBv7e0ovS4fU0kfAd9XWod8Z0hPWydsDuKv5Pmmu
 ZSr2/FSNuszPc4zXYDKCXYmXvQtoyttuEqjL63I9MuvFHOakBNf2CQ2ZHDxFPzx+YiFr
 46oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713773945; x=1714378745;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lt2BkwQqXLpwxVqBhAGtLtKzSow+0YulByb/B8x8jm4=;
 b=i1XXj6HFS0NdQOuOF9DkGHD7iNSA+YIV6sD+7uIr2emyzLdoDHsm55tQYreKKJ8Q6A
 KPSDchCGlQtXlrHaHpDfI+I5U3Gi8pVaJwPZhO/w3q4GyLTj+fOkEFv77i2hkF61kwps
 X41IwDe9uzW10ydRcwoEaCpq9LXeTZexfv3IREvXYWLT1HndWbsYJgPUYnEdfR5Anmkk
 uLtiaQfnx/VdY7HsDof/nFjD8X3/FmHDnKoRaccdXN4cZPLh6kDgS3R66vpCJf8zgAQZ
 2koeaMiIXkafouJpqLLvI03mSQ9Y3PVlK//R6X4mNhs2rYcFstxmBYsnFE+WSzY1YoO9
 HXnw==
X-Gm-Message-State: AOJu0Yzk59JXnT3ahX9eUTV2q1H53wYswAQo+IAkYEj8jv76p+uJzHS6
 TwfafmoSoRiGcxXDr/Ahpxn3OkvJ32/8c6RIVXsy1oDujs0E1ppOP/1IhEPdVg4=
X-Google-Smtp-Source: AGHT+IFXlMHZ14I8rBJcDUvo536bca1EkYW6D1umCUji+efGTdjaWTO0Ml/fnVCCeSCCFWgwLl8OkQ==
X-Received: by 2002:a05:600c:510b:b0:418:f616:f087 with SMTP id
 o11-20020a05600c510b00b00418f616f087mr5098734wms.29.1713773944733; 
 Mon, 22 Apr 2024 01:19:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c1c0100b00419ea5fb0cbsm7894927wms.42.2024.04.22.01.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 01:19:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Wronek <david@mainlining.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org
In-Reply-To: <20240417-raydium-rm69380-driver-v4-0-e9c2337d0049@mainlining.org>
References: <20240417-raydium-rm69380-driver-v4-0-e9c2337d0049@mainlining.org>
Subject: Re: [PATCH v4 0/2] Add driver for Raydium RM69380-based DSI panels
Message-Id: <171377394364.3456385.10710774432037845943.b4-ty@linaro.org>
Date: Mon, 22 Apr 2024 10:19:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Wed, 17 Apr 2024 18:29:32 +0200, David Wronek wrote:
> This patch adds support the 2560x1600@90Hz dual DSI command mode panel by
> EDO in combination with a Raydium RM69380 driver IC.
> 
> This driver IC can be found in the following devices:
>  * Lenovo Xiaoxin Pad Pro 2021 (TB-J716F) with EDO panel
>  * Lenovo Tab P11 Pro (TB-J706F) with EDO panel
>  * Robo & Kala 2-in-1 Laptop with Sharp panel
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Raydium RM69380
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4f888782d30276b08a32fa3d9b5c13b7dc123e28
[2/2] drm/panel: Add driver for EDO RM69380 OLED panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9a314ea512b7db9d38107ea0284b56f805b8fc9a

-- 
Neil

