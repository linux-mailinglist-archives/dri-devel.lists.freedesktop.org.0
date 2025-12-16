Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EE6CC1F40
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 11:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B34610E7D0;
	Tue, 16 Dec 2025 10:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="td1OQEYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A995110E7D0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 10:23:11 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id
 ffacd0b85a97d-42fbc305882so1889805f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 02:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765880590; x=1766485390; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ze9f59WmdiD1RKyapKn+TyPhf9K2IQWnxAlZ0aFA2E8=;
 b=td1OQEYkfJ/+QWUgAzmHm/xG2XDc5Lpw6pvkicibOvKTmEoBswY5MNv8gWuPByBn/V
 ZT2Y2EdxLxaB+BSPBycwcXj/HEKi+cUnt/L44WH0YyQ811FL4k44d4c0TBAyhroRReac
 yPiM5KjpWasXtzYsShLGFKSzPs+Q0luZ99lUD71jwPXCFsSYMxkrExH3ZnC+e5B6KJ7E
 ZVdoUwPAaS3BibRZRiLj3zVLqeO581gmhaKNwmcH71uiCo5Zb/93hhovyIyzn0mmoMq3
 xNn/DnoVZiX23PjU9v8BPxURueVpmOx7DKWEoJadGWPn2y++llGbII2AmGBf8OHtsAUV
 RgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765880590; x=1766485390;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ze9f59WmdiD1RKyapKn+TyPhf9K2IQWnxAlZ0aFA2E8=;
 b=dzZtdFvzLhjrFqsAYFiiZl85n9p1FYaBu+4VUhOxPAgaxWrjlS0z5cQjeyaTXHeGT1
 3dGLPRSt1WppxA0ZKitlU3NNbsX6YX9w3u9F4IMChC4Iri8t5E2NlP/8Iasr6KvrVncj
 gkcgn6B61n/ghtbedCBrABJAzwtvrQm6uxQIbbJpALWiurxiYZZyT+h3HLvRCtFQqbbg
 Kau0XB6rTyCNooq7PBuu4AKwZO/QQ5kvtNQvAc4eOlYh0AeQKf6NU7OSBB4HFd7G0j9B
 W3H9iFWKRGYGqTKGzc06zdaUx05JuS79ZSCoomG5Okop6eM+EaxjaoKgu3wdqEb5fOCz
 PvyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTnTotDpmFNMU+34LY5Xt41fjaKgJAG7T10iiajvrSA3o+U654CY99ukHwz2sfOwc6fL4hfypwRxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI4jJK06xoqvLYGvcyRqSyWpWE1eDsq58aG9AJsB/D8OcRjSYC
 qUlF/hAw3IGgTFN8NrIk0tbdkARPrQ2Ujruojdn5kVZr15tljLUetjQAxT8kYjULxz0=
X-Gm-Gg: AY/fxX6VdndU7rQALcTL5Xk5NznHKn0c65qGQ6fPmqonZO5dx5G7jFS8GXohA6T4/qm
 Cd+aMkecyTdlxo4Ife9dpmssmY0QFQA02N2JkXjSiSfUs2JjpEVzCtPn0lluAp1GRL77J4bsJBW
 KJXAdt+svU6cwgJ+HiBD+y3j2RnYO3cAl5DSVMIxQM0y/zMdrGGdfC6WmegtrwS4bTT+Arm+yud
 eB/TH0gsFl/0/SnT5nOYWNXZIJUvKojnjKCO50SouZ1dqLA9yFZ8jurE7viLn+1p+K8C2DjjdyY
 I4iIC/hudOtyqWE+9vVaLxKErbYBm31N38gaNvrmTWrj4T6NYg5viLCI2H3/wlBnbZB94zRTumS
 VKvQPUQPOBAvibId7UpW731NF2qS+caGOzakeALihWaGYkw2WGaBGfX746VgLdcHDj1Pd+ZXqUS
 DpXzrMp61u65HlKtFuVoLMMWgJRoiSzI8=
X-Google-Smtp-Source: AGHT+IHzblOU6qS3xdy6Gx34exYBvYPRSoThWMUw+n4HwFxheYsbf2pwX7M22tELRrFn0CYHV7ok+Q==
X-Received: by 2002:a05:6000:26d1:b0:430:fdfc:7de2 with SMTP id
 ffacd0b85a97d-430fdfc7f6emr7106184f8f.40.1765880589964; 
 Tue, 16 Dec 2025 02:23:09 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f984a268sm14996292f8f.1.2025.12.16.02.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 02:23:09 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Amin GATTOUT <amin.gattout@gmail.com>
Cc: jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
 dianders@chromium.org, simona@ffwll.ch, dri-devel@lists.freedesktop.org
In-Reply-To: <20251213142421.6762-1-amin.gattout@gmail.com>
References: <CAD=FV=Ub2xYsLcOzL2_AQ+JreWVVd2F1n+meL1NH7ztC1=jZmw@mail.gmail.com>
 <20251213142421.6762-1-amin.gattout@gmail.com>
Subject: Re: [PATCH v3] drm/panel: otm8009a: Switch to
 mipi_dsi_multi_context helpers
Message-Id: <176588058908.2230787.14243286003863985818.b4-ty@linaro.org>
Date: Tue, 16 Dec 2025 11:23:09 +0100
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

On Sat, 13 Dec 2025 15:24:21 +0100, Amin GATTOUT wrote:
> Update the driver to use the non-deprecated mipi_dsi_*_multi()
> helpers, as recommended in Documentation/gpu/todo.rst. The multi
> variants provide proper error accumulation and handle the required
> DCS NOP insertions, which suits the OTM8009A command sequences.
> 
> Refactor otm8009a_dcs_write_buf() and the dcs_write_seq/dcs_write_cmd_at
> macros to take a mipi_dsi_multi_context pointer, passing it through
> from callers. This ensures consistent error handling throughout the
> driver.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: otm8009a: Switch to mipi_dsi_multi_context helpers
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4855f26007d97b3dd7331d673d5410f1eaf30e24

-- 
Neil

