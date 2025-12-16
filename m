Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C8CC1F43
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 11:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8105010E7D1;
	Tue, 16 Dec 2025 10:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C7dFy/Bm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C87110E7C9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 10:23:13 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id
 ffacd0b85a97d-42f9ece6387so1761460f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 02:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765880591; x=1766485391; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4IZdqT3f5FjLJw92pQmwl5xRGES7bj8LR/OQmW30pQg=;
 b=C7dFy/BmavqtxOZum8ACsCgZTMVNwJW3bBguPOt/o6w9M/x795SDq97dtwby9jZR4i
 59Yev96TeriiR/Tnr1bwUIUIJvJMlmuLlxif3WA709hjkohzxqOeaA223G2JIuIrM+6z
 tm+0JFuCnC5sJCjomSks5wkDa/0Zw3esucZ3n69e8U/18kDljH1e/1Ns3D/Q7LBn6xCe
 RQF46MvtG3EcTVG6zs/b4l0FnETc8xeIO+6y9vdfENkeHJ/LhshtBLWUrPedA0D8SpiE
 Z9UWSP1kTryTYPs1WIcrS26eiOJ67rIvESxTHbqSDYLBES86OQjTKxG4oh1LeCI+Xgl9
 7yuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765880591; x=1766485391;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4IZdqT3f5FjLJw92pQmwl5xRGES7bj8LR/OQmW30pQg=;
 b=K1UTy7JwGHP1VIA7DEQ4t3OdwZVyd5HjFP0YEPbMRQdmQzJa6jsS1L9wEJO4AmohTn
 4GwKvMLYwLDs0G1dWr/quZ5tonBxecegD2m6WIkUjyDAvu9Sd4toUTktfOL0hszC0mOg
 HVso+ZwpSgKnF0ZoFMjTGCRJbCkNLGomYk+1r0s/lpvcY/L6OSOeoN5xDnsbKjO0Rvwk
 OWDANHqfbxYk7JWg/F7KXJE2HKYnOfyCq+1T/oxd47M77ebH/Ldw49pMFsEUk0x4S5GA
 Phq2Oip5HzIYVxmdIzWSiAVWFSbuHtkr0ksAqOU4NRQod3VM1j5UeINbiMbA3EHauLlB
 vksg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnnGYxmDLdEa8rhqtxsfEGMCdYpYbebVchbJ8NAhEOUBOPY2hsxRU5XchnydfPgn8S/L+XtDzqJD4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/GapGfSuRM0hGtemjNbgF1N3dLMqU+N/jSUr+z6GLHva9NAB4
 J2IV/sEyFqRV2V38ts1OBnSDYGKfCRh0a3/cJTwOK1OS2CdTaRzcnl6lJjxUGrcdVpM=
X-Gm-Gg: AY/fxX4+wl5VG+cQfw0bxgMxMK9CBm32oUgVY79245etusy7Y1V78WJm9PrF5cHa9D2
 yrOuaOTakx5wlK7XAxdTRjCxF52Gcx92eJ01ehQo2UMml6AaaMw42sBOTbWKREJVF+hYYYdk4FD
 Uc9RVe93EHAdvA96p2GCUeumc99m2OH6SoHATGpzjv/6OpNzog0wdp8H3EgDDJiONJQ1ASDz0jd
 1k5iDhLq03a1dy+VAmUTxu7MfaBISOrPQ49fE6ASL31d8tTxxavhJBVt8P1NxLdAYgdQ7hEyiJZ
 ziRe6NO09cTfiUvsIyvtNHQE3mwbB6GBro+qHA9vGUvwDbFWR3aZpgfCkkOtd3fQoN0fWxcYPx7
 7cCXW0vStgZmFtwPj5SRTezvn0KVY7YNNVQgas6XRZTFwklDzXihNMDDfyJf53MOmc9MttESoAk
 JTfhopKQW7OOKFDs6qqa0C7dXGylifTe0=
X-Google-Smtp-Source: AGHT+IHdYoe0Jxs5on7xWo5sC0mu4jrv63ZGB+gV2yfNBNXsZdkj2vvC6F2crM2qJ3WTRAF/bSMiFw==
X-Received: by 2002:a05:6000:2909:b0:42b:3131:5437 with SMTP id
 ffacd0b85a97d-42fb46e1b5fmr12776263f8f.34.1765880591356; 
 Tue, 16 Dec 2025 02:23:11 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f984a268sm14996292f8f.1.2025.12.16.02.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 02:23:10 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
References: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
Subject: Re: (subset) [PATCH v7 0/8] Add support for Pixel 3 and Pixel 3 XL
Message-Id: <176588059015.2230787.12554234444654203091.b4-ty@linaro.org>
Date: Tue, 16 Dec 2025 11:23:10 +0100
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

On Sun, 14 Dec 2025 15:51:16 +0100, David Heidelberg wrote:
> This adds initial device tree support for the following phones:
> 
>  - Google Pixel 3 (blueline)
>  - Google Pixel 3 XL (crosshatch)
> 
> Both phone boards use the same identifiers and differ only slightly
> in their connected peripherals.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[2/8] dt-bindings: panel: sw43408: adjust to reflect the DDIC and panel used
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dbb5d6010c1ecf01560af405c5b503f4cf2b1149
[3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel compatible
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/be85d4124dbe6ed597c7a6a16e53d8b98684fab6
[4/8] drm/panel: sw43408: Separate reset sequence into own function
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5f0cc92fa0dab7cbb999dedc653f5857a62b2022
[5/8] drm/panel: sw43408: Remove manual invocation of unprepare at remove
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cbc1e99a9e0a6c8b22ddcbb40ca37457066f9493
[6/8] drm/panel: sw43408: Switch to devm_regulator_bulk_get_const
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ed2b818a24760d7adc92d2e9b0e135f2c33edd8c
[7/8] drm/panel: sw43408: Improve wording when reset-gpios aren't available
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/29e208a08a8ebb0f214e815eee0a7beff778864f

-- 
Neil

