Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53DA7C00A1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 17:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FBC10E399;
	Tue, 10 Oct 2023 15:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB7E10E399
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 15:46:34 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9b98a699f45so984369666b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 08:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696952793; x=1697557593; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMkYHrfhXWipN/ee6VJFogJnXBxiy/M8Hxj4mP6AF/w=;
 b=i7TH39Pw4sXrxZsDjcsIZE2RMepDNKnIlGW+XAKmm1M2zAewfArLmIGaHCNi5qM2fo
 grrQwogoKy+v0HA8JQednO+taogimLQR7Bw7OcCho27h53+7LOHCizUQmpx+/+cF1kov
 y+dEXvMZbr/gfFh8IV9irZ0X1n78XFIXQf1C63VXS5IBXkWtAUut15BznrXdBEBaK+81
 /d3zQO0mTztvVQkyGKKOYUhby+bcSsGsK4oynZuQ/FyweX8lrf/MGWPWcZvJRm+pol2X
 4YIkVVIS8dvfufrg46jBUTyKYn39wAOwQbGWJe9Q2U9OaXc8ilyKWbSfouIe9z91BhRw
 nBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696952793; x=1697557593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZMkYHrfhXWipN/ee6VJFogJnXBxiy/M8Hxj4mP6AF/w=;
 b=bEsJUn2YgQX7MbpVCv/vjpxQMQnpwMvBGF5rxfHwbXukCe4z8gmROCTQIduJMMMoic
 cQplYCKNUcTs7q0sv0PouW6oUTdpNPr+hEVissBriY24IHCluNuCKdJvh964TqZjQBFx
 YCIJl5SsliTt2yzX9/MyGJLEkrEp6p8/tT9cAkQ7c+QXmKyBa86ghHc+D0qu+0JUa5pb
 XG/04BQkIAUqQODHjgfM+o71ZyW++n3Dm+JQ20FAfOzY9d/xyXMETxDlLyFQ8G6VPnlm
 fyCB/9qwV/A2zhMpwrpYRp3WcKNRyA1w2S/0tcmEJGBhuUpaZ8Z5PijtcwvOfDJos9bM
 a9tg==
X-Gm-Message-State: AOJu0Yz2qisa2m+uGJq8Luu6alMukpoLf69nV8+yt4Xhjp92VoXDe2VD
 38wKDEzNke10OAm2qi2CzYg=
X-Google-Smtp-Source: AGHT+IG6zqiukIzWsJKn9OL4P8A2iPIED1bxFNTAhVCUbLFrwSbvu5J1IObjwfklPC/cJl6Vo5ewnQ==
X-Received: by 2002:a17:906:3050:b0:9ad:df85:97ae with SMTP id
 d16-20020a170906305000b009addf8597aemr15366554ejd.66.1696952792886; 
 Tue, 10 Oct 2023 08:46:32 -0700 (PDT)
Received: from localhost
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a1709065fd200b009adc7733f98sm8628023ejv.97.2023.10.10.08.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 08:46:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: (subset) [PATCH v3 0/5] Support bridge/connector by Tegra HDMI
Date: Tue, 10 Oct 2023 17:46:25 +0200
Message-ID: <169695268806.976123.4285803254322342270.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230807143515.7882-1-clamor95@gmail.com>
References: <20230807143515.7882-1-clamor95@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>


On Mon, 07 Aug 2023 17:35:10 +0300, Svyatoslav Ryhel wrote:
> This patch adds support for the bridge/connector attached to the
> HDMI output, allowing to model the hardware properly. It keeps
> backwards compatibility with existing bindings and is required
> by devices which have a simple or MHL bridge connected to HDMI
> output like ASUS P1801-T or LG P880/P895 or HTC One X.
> 
> Tested on ASUS Transformers which have no dedicated bridge but
> have type d HDMI connector directly available. Tests went smoothly.
> 
> [...]

Applied, thanks!

[1/5] ARM: dts: tegra: Drop unit-address from parallel RGB output port
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
