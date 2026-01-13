Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23DBD177B0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C9210E482;
	Tue, 13 Jan 2026 09:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lhzNW0rJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D8A10E47F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:06:06 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47d3ffa6720so67621155e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768295165; x=1768899965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wBHm0UMPO/uRIvftVI/GqiTQVe5y+FWrxBiEdra4N2A=;
 b=lhzNW0rJfbpf8LQYvFk9Ynzku0z64PhGzs7FLbydVXAkQ0cuTHx9HbmCSVWrh6UAGA
 aE4BEw8SJwNuMpSYYbX9TiupaPqIAHPOmkv8xRJGVgE84wwUcekgJzFJepFGi0IvPVqc
 RL15iC12eQMjhSOSahrpIC+lgkH4tDIIkzdQ8Iub03vXryEbxVmp+Cga9Crap4Ro4TCe
 EwayFg3BfyHgk9nphGaNKYzuwj5P/7nCq21737PoX+0+TMwPZrKerAsP3GH/R5ish6Gn
 UrUXPVI+wPK+rIDn4iE8u2W3RHAwyU6xw7R2Rls7W8aymaoNrIbV/DQOiJjc3EqaAqLT
 Gxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768295165; x=1768899965;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wBHm0UMPO/uRIvftVI/GqiTQVe5y+FWrxBiEdra4N2A=;
 b=h+YDs6DkgTT9yaI4baAG/FhoUfJIsSrjjYFhShGwgf89XAlRypVSA1VjSKpBDvL27/
 WjzhxCfJ1wZoJpDU2A0uSHy7EVY2KSXaBcOM2Ao6Gp54J2fiqaY26qPlSo9cbKQ71dnp
 bF0eRNCNy1IA+QmH2+lhDoWkutOxSBIGdPJ+L/CYu7lZJoiNy5AQxadMFp+UECfZyXwI
 PkTtuMSwftKRiKIcUlg+fUCV/gpmhta3r7YMlYQUKZ2Tx6DkN/c1p8uryz1ps4xMikrj
 Iv8E7VNKrqoE9Gp1lw6fqMc6TCrHOjCV99DGPfwYqzqH7DsEYCzDCwvIGAlc10aNoOy/
 K2Jw==
X-Gm-Message-State: AOJu0YwzA6PdbdcOrJvFXSEfcD/v6rboFIhivltaLBxt7jzq5PsNvmzO
 wJX09yOzrpJBn8T6LBZy0mUxbZwOBQuCcw06evlBxLKIQ3tKoQCbYgozTA3o9n5mtIo=
X-Gm-Gg: AY/fxX4H3h64NgXgBy8DY0q1mq+Rw8njbpnjqHpzbhcGekzZQeEFOtWLzb+dzlUDo85
 M7QZRHkSxPFAoooYUTV5Zh/4Ei63a9G0F2thDWbeN1QZqdeQPI7OTOnUIp/yWgbUEoQo85Kzzy/
 7qpVye7EeUFJvrNeWPMsavhAZ7R1TzPGnzTTMEEchb7h9kZrWqOurwZOA2Oj/p3+Up58Zq7cCJ6
 jR4QS8MV/JojCEsQ73xfRYQoxFIQ6yxT4YKPNNvYC8O0t8CPK5nvMH+FTiemij80wJ00jXEZ5tH
 /1pGXy1PT8qCWeRhijHwiajUwxuxsW7npfxTiV0NoyhnqY00GnzYMLLZbhOg0bUHS6gvMMlghao
 cJSyZpRtK727/UES3sCYb4CVnxr+lBaf9s+vNvIKiShGp0cu0YsTYO97FazeIRms79bLzIjlv3x
 KTPQgIX7HnWyRIv8wdbJs=
X-Google-Smtp-Source: AGHT+IFMjUBDgdXOxGZoCIGp3dpNQZ2YPOJ/jUIDnCVFlqbHOF2UO2llstUj8Yd4LxOlF4Si14WbMg==
X-Received: by 2002:a05:600c:8506:b0:477:a219:cdb7 with SMTP id
 5b1f17b1804b1-47d849bd9fdmr211778385e9.0.1768295165325; 
 Tue, 13 Jan 2026 01:06:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080::17ad:35a9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ed9fe7ac3sm11118635e9.4.2026.01.13.01.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:06:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260105-mantix-halo-fixes-v1-0-1ebc9b195a34@puri.sm>
References: <20260105-mantix-halo-fixes-v1-0-1ebc9b195a34@puri.sm>
Subject: Re: [PATCH 0/5] drm/panel: mantix-mlaf057we51: Power sequence
 improvements
Message-Id: <176829516449.3839584.873916749545237546.b4-ty@linaro.org>
Date: Tue, 13 Jan 2026 10:06:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Mon, 05 Jan 2026 21:24:39 +0100, Sebastian Krzyszkowiak wrote:
> These are the patches that fix the issues with low contrast, "halo",
> temporary burn-in and occasional black screen on the Librem 5 phones,
> which use Mantix MLAF057WE51-X and Yashi Changhua YS57PSS36BH5GQ panels.
> 
> They're mostly about improving the power sequences to match the ones
> described in FT8006P datasheet, so the driver does not end up disturbing
> the internal initialization process performed by the controller.
> Aside of that, using LP mode has been found to improve the reliability of
> sending DSI commands to the panel to the point where long chains
> of commands can be sent without erroring out - something that, at least
> on i.MX8MQ, wasn't possible without LPM.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] drm/panel: mantix: Enable DSI LPM
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ef789ce4980b2bf9d61c53207f2b0aa1d32d9da8
[2/5] drm/panel: mantix: Improve power on sequence timings
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dca84cc795df7f0cf790fbc2afcde53e6abd403a
[3/5] drm/panel: mantix: Improve power off sequence
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/61f028c13c42495964afb61974ec60c22230d81b
[4/5] drm/panel: mantix: Drop bank 9 initialization
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c8b59651ebe678da004b71e8c20f79ed6881ea8d
[5/5] drm/panel: mantix: Don't turn on MIPI peripheral
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8096e71bc875485dd34aa8bf5af15ab3c443cb54

-- 
Neil

