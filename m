Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7798B82BD01
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADDD10EACC;
	Fri, 12 Jan 2024 09:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628C610EAEE
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:25:24 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e490c2115so30000345e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 01:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705051523; x=1705656323; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3bfVv8WtMnQ2fP3XkB2eOBLDf/LsCJjP8wfwX/T4wM=;
 b=OtZA3XjlwLm2GRVrp9AiaZx89sJxosUjiBdW+Sr2GLWqGRpkFsKjH2bodwXV2+pBUo
 3SBMGF3HR2jwtj09UKtGkm013qMN5JDO8PBtZe67Fjp+IBx6VOXPLPtOHSskr1I9mr1v
 IRa1xwxkMLRgyE/gmzu+Qb/OHMhCQ4jI+QdGvO4hmZuMD2LP9b1oLnNFTh+n1cQtar7N
 atv6tyiw1XAQTtd3+Bf4eP0QhOZyvBW8Q1heItUztKxoMOet/AYAw3LxsPShFmHNKpJY
 dRO1oZGpGPnfIQb57DAqBKyQVVVu8n/6pcG4j5xaQm3O6+7aLJu4ydtvI6niVMNkD2vJ
 ghvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705051523; x=1705656323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q3bfVv8WtMnQ2fP3XkB2eOBLDf/LsCJjP8wfwX/T4wM=;
 b=GdaQIIsQNyHGxvn1FR/wmWRGehfe9mSlIAA76Sb56JcUro2Dd4lytByhI3zKLw6dJZ
 67ORBVohw64BafaZ5E9mAZSA8s64+6Ss2fIbj7G9fwb/F5UQjkYSgDrRutTS0AkAkrpZ
 oiaPTYY469EajN9e3904AqHI0G9bnB+5YJESzz79yIF3k8723HbJD0IVbBzxYG8nTdln
 Fk7zRmsUCIefzI/R28c4y2wfW3SPEax1xHEpZ3wNayjoeHvX4dOx63HmaQg0zb9ERhVk
 wfsjzJdnuLV5+m8eMyKWZzOtX8iuJVGrYWJ9k2N9ibV2X1hM+iYGjZ6kNegmoN22x/3a
 Mh+A==
X-Gm-Message-State: AOJu0YwD3PonotT3EqCBQT9Mk1FvatLQmcw5ViQX2z5i8YPPYQtej+Kc
 oL4zYPAB0Q5DE2VHDs6Qz21mJg5xyE+lXA==
X-Google-Smtp-Source: AGHT+IEMwKZ9XV3E5enGXhcHiQsIucq3Zsj1wJo8Uj7nGouthpJzDE5uay5WsPpo048DpY1o1KYFwg==
X-Received: by 2002:a05:600c:6a19:b0:40d:8881:4d1e with SMTP id
 jj25-20020a05600c6a1900b0040d88814d1emr550199wmb.66.1705051522693; 
 Fri, 12 Jan 2024 01:25:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a7bc346000000b0040d81ca11casm4901880wmj.28.2024.01.12.01.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 01:25:22 -0800 (PST)
From: neil.armstrong@linaro.org
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Segfault <awarnecke002@hotmail.com>,
 Arnaud Ferraris <aferraris@debian.org>, Danct12 <danct12@riseup.net>,
 Ondrej Jirman <megi@xff.cz>, Manuel Traut <manut@mecka.net>
Subject: Re: (subset) [PATCH v3 0/4] arm64: rockchip: Pine64 PineTab2 support
Date: Fri, 12 Jan 2024 10:25:18 +0100
Message-Id: <170505150474.933870.7165654280857450168.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net>
References: <20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Neil Armstrong <neil.armstrong@linaro.org>

Hi,

On Tue, 02 Jan 2024 17:15:43 +0100, Manuel Traut wrote:
> This adds support for the BOE TH101MB31IG002 LCD Panel used in PineTab2 [1] and
> PineTab-V [2] as well as the devictrees for the PineTab2 v0.1 and v2.0.
> 
> The BOE LCD Panel patch was retrieved from [3]. The function-name prefix has
> been adapted and the LCD init section was simplified.
> 
> The PineTab2 devicetree patch was retrieved from [4]. Some renaming was needed
> to pass the dtb-checks, the brightness-levels are specified as range and steps
> instead of a list of values.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/4] dt-bindings: display: panel: Add BOE TH101MB31IG002-28A panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=baae3a0b10c499d4228514a701602f6fd2a8d6b4
[2/4] drm/panel: Add driver for BOE TH101MB31IG002-28A panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=420186db1483da4e16cd5d5a472f511a35dbc1b7

-- 
Neil
