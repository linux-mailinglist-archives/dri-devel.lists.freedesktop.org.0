Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B22956FA1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7E710E2FE;
	Mon, 19 Aug 2024 16:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WFTTAUp+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE2E10E2FA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:03:03 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-371b015572cso1675734f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724083382; x=1724688182; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QSGdUUsmjOuUqs3Sb/HBP7VBG8yMf91ri1hASSPUnjM=;
 b=WFTTAUp+aI8xR+PDIWZpjetLvnX/Kg7G9EF1bTFhRabL0vwrvkmhFKG86+iRBI87OO
 BgahooyTDng/0irbruxdE9eqqeqp1oo53yAutROFzLNv32CKlX/poXxYzvaGcXVk4eMn
 CLFKlmLIroC8rIwRUdx3dj2ECOhRcrxIi8TZ3NZGfAzrGNQm2joQpqL3u7Vn4O/2Is+W
 q/iS5QqQYKoYgmVtDlL8bKEu4YA0Ng9OYI5aDjzpwSGt+nHsXFQVw+6LqK7wz1WqS5Zq
 /GWy1/GYUR+LtoDZ1i5oFZrssSZJH8yGbwY+9JapFmdl3SnfEuET+dOqlNL0DFMgYsxb
 CSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724083382; x=1724688182;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QSGdUUsmjOuUqs3Sb/HBP7VBG8yMf91ri1hASSPUnjM=;
 b=JlWefVdUASyIvtIDmWwlnnwAlFssO1KPMvGVTByB9fADpxQlUjBHxRnFnuBMoC001z
 2MDD5bf/yFEaNZ4EmMH8vIS4E2M7FU35T0hPbwfA61m82T3whs5lpwI7+BICROimnymk
 isZG2pnEEi08iup3H3VbqEiPMi19fQSM8GVvO1BAXWkuMLXjoCPlfR7XC+0KKgsxyFwg
 e+3Bh3k2+BCo6LE0sVg5GaUIYqKRg+BgNQMqAnJkz5+jaB78ovZ8LvFFALxRUpsItjCs
 fXkwigS5zkcdGW0Zq5/IF37zs+S1aFCce5qk51YwJ74R558Wz3MAZa31vPUvaro7IMlV
 MGxA==
X-Gm-Message-State: AOJu0YwdxZVinrojSSxs8uJS++kZ2cK3CENzMhtVYrIc+TNIE9+rZroi
 O4abZMUHCC1Hrh+KcGSMfa9zSZy+Tdy7EnIXC5Ia4/FvNSPI5Q77+JURMV4RT/E=
X-Google-Smtp-Source: AGHT+IE027jEWALLQjfHSgPFYDvatdKVAfuyDGITo5V0HDNJZ1Z7dl4sInpAcLoDEHOXsxvRP+KByg==
X-Received: by 2002:a5d:5a15:0:b0:371:8e9c:e608 with SMTP id
 ffacd0b85a97d-371946a1a0dmr14651679f8f.52.1724083381406; 
 Mon, 19 Aug 2024 09:03:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-371898aabe9sm10907638f8f.92.2024.08.19.09.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:03:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 thierry.reding@gmail.com, sam@ravnborg.org
In-Reply-To: <20240816085004.491494-1-victor.liu@nxp.com>
References: <20240816085004.491494-1-victor.liu@nxp.com>
Subject: Re: [PATCH 0/2] drm/panel: simple: Add ON Tat Industrial Company
 KD50G21-40NT-A1 panel
Message-Id: <172408338025.1748689.1253255812043892050.b4-ty@linaro.org>
Date: Mon, 19 Aug 2024 18:03:00 +0200
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

On Fri, 16 Aug 2024 16:50:02 +0800, Liu Ying wrote:
> This patch series aims at adding ON Tat Industrial Company KD50G21-40NT-A1
> 5" WVGA LCD panel support.  The panel has a DPI interface.
> 
> The LCD module specification can be found at:
> https://cdn-shop.adafruit.com/datasheets/KD50G21-40NT-A1.pdf
> 
> Liu Ying (2):
>   dt-bindings: display: panel-simple: Add On Tat Industrial Company
>     KD50G21-40NT-A1
>   drm/panel: simple: Add ON Tat Industrial Company KD50G21-40NT-A1 panel
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel-simple: Add On Tat Industrial Company KD50G21-40NT-A1
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/773a0e3e89b354f14ec9ea8bddf3e86a602d162d
[2/2] drm/panel: simple: Add ON Tat Industrial Company KD50G21-40NT-A1 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/91a759d402b5c17263f82097c647e784f217e2d4

-- 
Neil

