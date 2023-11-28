Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D537FC088
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC3410E59C;
	Tue, 28 Nov 2023 17:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102BB10E595
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 17:49:34 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a03a900956dso2375766b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 09:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701193772; x=1701798572; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2Q6ar52kT12/oSOUgsQunGkK9992ePoRC0ssPbZWDgw=;
 b=Gal93c3ZUCjNxU1axE3SEl3ichMbXLYFAaPQ+9M0DqTnSwCu2mrVTsustztIwiW1pX
 t6NCH7CkDT4lWRxAIbTt2f1AV1l4i/HaA9Qh4+BIbUNfKmdGg2a+qkoXpl/51/Vfpdqi
 PyQhJkZcjrhbJOwLfVvda2rRAZ4v2imYmecue/723ZmX4vAKbJYUextXUjpWsBpk8LwS
 T9m9fIrjPE17qEPlYSs9IGAWtq21ps9IPeyJvU5+TrChTAjmSxF+38HNHkjA+/vs1+Ti
 BT+6vKX5LfSxTvMagnnsehwA/xqYOt9I0VQwYXcLyGXeo9OL6kiIde8XvglnuYzUX7CX
 +2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701193772; x=1701798572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Q6ar52kT12/oSOUgsQunGkK9992ePoRC0ssPbZWDgw=;
 b=i3SUgmWrXoex6VkbWbiV1C8HegS59DDRUMHSn5WrMgQpkBN3Mj4tpESdJtwR2hGziK
 8HMwNZIhqtbhNQ1FOUQ1w3uCOe03lGQ3iwI7w40eulaq4/EgM/GKh00VVjY773z3HyCV
 n2mAWGJmlHAXqbpaFGD5T1fwjjztglqoMoFTs6factAtofCm1VlpmB0dDpU4CxGEc5k3
 QwepIjT/VYM8A7Lj8rvTJLsn8nDtCxAoK5t0wrh1s6SKPYmgxNx+ow2p95c5pXfWPo1l
 UqIuZkTHwNCe8ym0VYaB7xfVMAL06zd5Oos4jEbD7pjRjjw9vh7ju3sYOeWjzG/t9Bq5
 g4nA==
X-Gm-Message-State: AOJu0YxENHwNminW8FMrb5JQHvJpOQ6DssuGXAilMEp5/FjoIkH/0fv9
 QXvz+xEJIHnve7D6YrDMKF0=
X-Google-Smtp-Source: AGHT+IFegfjLsT1XNjq4u1dJkNE5gSVojRjltbsyE47RsYa/oKV+OirEmiPZK9QlSr1+eKKQQmVk8w==
X-Received: by 2002:a17:906:f811:b0:a0f:1882:d5e with SMTP id
 kh17-20020a170906f81100b00a0f18820d5emr5384410ejb.37.1701193772296; 
 Tue, 28 Nov 2023 09:49:32 -0800 (PST)
Received: from localhost
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 cm26-20020a0564020c9a00b0054ae75dcd6bsm5742280edb.95.2023.11.28.09.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 09:49:30 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 00/17] dt-bindings: samsung: add specific
 compatibles for existing SoC
Date: Tue, 28 Nov 2023 18:49:23 +0100
Message-ID: <170119374454.445690.515311393756577368.b4-ty@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 08 Nov 2023 11:43:26 +0100, Krzysztof Kozlowski wrote:
> Merging
> =======
> I propose to take entire patchset through my tree (Samsung SoC), because:
> 1. Next cycle two new SoCs will be coming (Google GS101 and ExynosAutov920), so
>    they will touch the same lines in some of the DT bindings (not all, though).
>    It is reasonable for me to take the bindings for the new SoCs, to have clean
>    `make dtbs_check` on the new DTS.
> 2. Having it together helps me to have clean `make dtbs_check` within my tree
>    on the existing DTS.
> 3. No drivers are affected by this change.
> 4. I plan to do the same for Tesla FSD and Exynos ARM32 SoCs, thus expect
>    follow up patchsets.
> 
> [...]

Applied, thanks!

[12/17] dt-bindings: pwm: samsung: add specific compatibles for existing SoC
        commit: 5d67b8f81b9d598599366214e3b2eb5f84003c9f

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>
