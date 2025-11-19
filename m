Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3869BC70358
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 17:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B110010E669;
	Wed, 19 Nov 2025 16:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OV0+wu9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA74810E679
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 16:49:11 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42b379cd896so4031782f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763570950; x=1764175750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GL7qlh37zkRZTRlu95aZolyP82BIEUWrPCKsF6oXxAU=;
 b=OV0+wu9dEQ9ZdymV+C2lbQtCGh+wrkIDBAF/68CKXS0DnzGlshR059dFX40vm4S1lR
 35yp8IR5Ekvm+01czIDSZn7nIytI7a03MlWhx7Fdd0T9YYI9PvWqAfKsfJ5Ad7+EBNC+
 /mD5W3lbgp81dhTMybMYMZG4cVuhp+YaCAXo3PtUVHA52f59yLgLW4Kq894E/N6zTYdN
 M4QP43I6JoB91uIwOwcqRHRtP7v2FeLdzYOHIVUA6Ame+IOBifdphVg0tvzGcZ3DwOwL
 p3NjVJeyPlkmdMPpF//6uySEqB5MgdG3Oja9cqMQtjoA2jsqo0uLtPM26bxvSU5wP/f5
 uZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763570950; x=1764175750;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GL7qlh37zkRZTRlu95aZolyP82BIEUWrPCKsF6oXxAU=;
 b=RWPEzj+fZ5y+KcHr/7KZFXi1NNPl+zHLauplpHbNOgxF7NjbgQHqNprqgM+o7dgm/j
 2GlLjDonT33hzQG4ZW/Apt7KKig1R3avo0fSe9NdAaOs4KRHKqIdGlr/xk8uAo6IqzsD
 t7fP4foemwLC4WtCH1EGb4dsJSgvUxIwb4afKsJlINP/u97gIbsxrMvtTnc0F1kcYBSu
 cMO86sS6jTuDkTHayURqcXCbVbzedHZnhSCY99oW1g/WspZRUflB7TTo/qyIj8gs9B91
 C7kCFlAGh5LokrlkBwV4CO5N5G6mcEaAMLOzC2P6S+NN+yEMMwRoiAEesNrKgGyVSzwZ
 coaw==
X-Gm-Message-State: AOJu0Yw0okkj7fJ85b971u7SaM/iQ4kB6mXeCcOLihwdJ87dR8ChjQvW
 x8aEni6Iew0LnKQ1rCaACZifh4mJBQrBTFJn/yhWut+4RbnUzhGSDdwFg/2ZbmGDe3U=
X-Gm-Gg: ASbGncuUX2ewtHY+1DUjNcOtkP0eobSovU2y//cqhY6DElm4lGl+F1Ko6a43rhdA05E
 +MexLvChUWmSZURaWDI6L7UTxWfCZgkMSEOSOy9gpvwIbmaVOuLTXpE+sCawumUQzfuLcXv01CI
 JxIcLtffh8Zpj8axU2MBxLBpSgKoI1hhierUFwRWkCSEU3ptJhnm8yI4IZjKXdovPgZdsjvAHzi
 P3m5rrK2RP5BxWV/Dctq0BCaYkinDDlydISJE0Oav8JcplB8gWo+iKsOTv/tnoi7M/91fLQI2oq
 zKTOFKEI7gPy4N6AfMC7ZPRcSNf+nOHGuCwPI6TsFHUhUm67y9sc7mNzMeSYNHTUAjwF8fp8WUj
 V4x1ONLSJcCg5DgNw5zmsK3ojj6CXGybniFavPXbGJpTO0qPfezX9OjH0DND2SEA3248kT2NAxP
 jKmNvwMpHBgDEDlW0SzUDzvDD6e3BhPzxkxE89t0kXrg==
X-Google-Smtp-Source: AGHT+IEOxKlCU0fVyUxW6LWeLn7CtAluz8WjPTxaroJlgm9DOICHacN8yAahbHX8pTucfhXi884sbA==
X-Received: by 2002:a05:6000:64a:b0:42b:4267:83d5 with SMTP id
 ffacd0b85a97d-42b5935dde3mr18285757f8f.8.1763570950069; 
 Wed, 19 Nov 2025 08:49:10 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3592sm117957f8f.21.2025.11.19.08.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 08:49:09 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Heidelberg <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
References: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
Subject: Re: (subset) [PATCH v3 00/12] Make Samsung SOFEF00 DDIC and panel work
Message-Id: <176357094919.280640.16902732888424119445.b4-ty@linaro.org>
Date: Wed, 19 Nov 2025 17:49:09 +0100
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

On Wed, 19 Nov 2025 15:21:25 +0100, David Heidelberg wrote:
> This DDIC is essential for panels used in OnePlus 6 and Pixel 3a XL
> (SDC variant). With proper support, all downstream patches in
> sdm845-mainline and sdm670-mainline can be dropped.
> 
> The mainline driver was broken so far, and with my recent introduction
> of S6E3FC2X01 driver, I had to "break it even more" due to OnePlus 6
> common device-tree changes which defined all the regulators and
> corrected properties.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[01/12] dt-bindings: panel: Convert Samsung SOFEF00 DDIC into standalone yaml
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1388c08c84a2b1f37abae656c1f88d18ecb1364e
[03/12] drm/panel: sofef00: Clean up panel description after s6e3fc2x01 removal
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/05aeb5bb4b699b51f88d9f5585005b6eb66a496b
[04/12] drm/panel: sofef00: Handle all regulators
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dfc7e0859e05991b0920bd249434e44866a11bd1
[05/12] drm/panel: sofef00: Split sending commands to the enable/disable functions
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/18642542ac4916807fc0925cdcb9356f5802e2ae
[06/12] drm/panel: sofef00: Introduce page macro
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9f1ba273f55f93759cfd1098e0682b03eb115bb4
[07/12] drm/panel: sofef00: Add prepare_prev_first flag to drm_panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1e534a56578bbea59165c3507d2b967f29771792
[08/12] drm/panel: sofef00: Initialise at 50% brightness
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e2e94464cf44f91c92eb631d609f812c7aef8840
[09/12] drm/panel: sofef00: Introduce compatible which includes the panel name
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6a353661e7058795a800de3535e4e1448d125676
[10/12] drm/panel: sofef00: Simplify get_modes
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/940c451981ebd0901f39675c9ff3b3e1c9760571
[11/12] drm/panel: sofef00: Mark the LPM mode always-on
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/73540e5e7c52264633c66aad681e53f7e2f54c57
[12/12] drm/panel: sofef00: Non-continuous mode and video burst are supported
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8bff3a2bf7c50bf45766edcd5440329d6b5cdf96

-- 
Neil

