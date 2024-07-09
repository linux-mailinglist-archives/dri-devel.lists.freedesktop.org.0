Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB4692B9EE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 14:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D15B10E549;
	Tue,  9 Jul 2024 12:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VEyspgtz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B252810E540
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 12:49:47 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ee9b098bd5so43895061fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 05:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720529386; x=1721134186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nvRk9NRwvi4Sad8kAKb8C0nIgxvEumP7Jqs1X0zsqU4=;
 b=VEyspgtzuN3X8wOWcjhnUglCfEsN/sh3tFg9Hh7n1TlO3jx7sJBnObQBO7Eeny+t/U
 VgTBfZP3j6Vx/oT1tYvgRFd15pHYVWvC0FBNc/0ml9rulmSy0pWEfjYIGSGNHCL//Zke
 W3tbUReEbGdr5k6YqtEVTo7PWUs+FEAVUK9ATev1mYPu4tItC+R6qfIScGL7pOSXiGDd
 6Ysm04rM3+tMiaWUA6qkxdpotn8Eu8f6IvNNU8yw4VoVNcxm+wtmpO7M9QBnCZPeNFOP
 NbAangI80kaccVNwZpzlTcj0uAI2AXSULr6F9K9nBNsZWSNNDm+hayR6ITSHuapDOFXt
 GPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720529386; x=1721134186;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nvRk9NRwvi4Sad8kAKb8C0nIgxvEumP7Jqs1X0zsqU4=;
 b=Ea/iNLMYyPo17IGOvAXMOxIRqGlDsviPLZq9R4qy8EPY3svCIFaNCYdBK2ZjxCMUH4
 PvWhSwz+ILfQANaDWt44Mz8Qg97BR/3xy+y9oIi9F3wYrnnvhk4Kd0W21l/pQm4CklW9
 j/BdB/FIpOSXgcjT1V3ckYLdPjG+VTtsFSEObDyxUkJl8GgZC1KbVw7AbHFf+FJqzI00
 1bM0til7hLQHweQxamnB+M9Ix53uYeCAU13sG2BN2kwiCM4DEAHRE2/JRrZtBAdEn/8o
 hrVhQG6LyaEN7tHIkXrMKzx2fU16VvceanyAXpXKNrlnrzFCy/ltFa4cFVRIDHW7AUM2
 KNpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3abcO567vfOHTiC2O0yzS47xc3m0aFEO5XhC0gSQwBkOySPp8kQiAJ91srMH4baOOTask/vkpVMoHXIbfcPMLxd8AqKC2BKDjsmgdIipm
X-Gm-Message-State: AOJu0YzTusvSwVXxBHccsGAzXqx0ARnnfvSUJgN9RgaXuOZ9ih0Ec7uO
 er9jKQJ05dTlIEthkBAw7E2DHktM1WTWLp8c5JpEbJtNWBbnImDlEQxX5CNkhjc=
X-Google-Smtp-Source: AGHT+IFzyDrAISLmyfMTkD2U0CnOaEiWNNhOh8Yt33K2jGcGj4upmTfOI84CZT5z68/EAKIkTu9l9Q==
X-Received: by 2002:a2e:a612:0:b0:2ec:5668:3b93 with SMTP id
 38308e7fff4ca-2eeb30dc16emr19340391fa.12.1720529385501; 
 Tue, 09 Jul 2024 05:49:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6e9666sm39540095e9.9.2024.07.09.05.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 05:49:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: sam@ravnborg.org, daniel@ffwll.ch, dianders@chromium.org, 
 linus.walleij@linaro.org, swboyd@chromium.org, airlied@gmail.com, 
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: lvzhaoxiong@huaqin.corp-partner.google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240704045017.2781991-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240704045017.2781991-1-yangcong5@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v2 0/3] Support for Melfas lmfbx101117480 MIPI-DSI
 panel
Message-Id: <172052938462.987180.17478336258755727379.b4-ty@linaro.org>
Date: Tue, 09 Jul 2024 14:49:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Thu, 04 Jul 2024 12:50:14 +0800, Cong Yang wrote:
> This series support for Melfas lmfbx101117480 MIPI-DSI panel with
> jadard-jd9365da controller.
> Add compatible for melfas lmfbx101117480 in dt-bindings.
> Break some CMDS into helper functions.
> 
> Changes in v2:
> - PATCH 1/3: No change.
> - PATCH 2/3: No change..
> - PATCH 3/7: Break some CMDS into helper functions.
> - Link to v1: https://lore.kernel.org/dri-devel/20240702130138.2543711-1-yangcong5@huaqin.corp-partner.google.com/
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: display: panel: Add compatible for melfas lmfbx101117480
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e7305ad465b50deaa7a9f3a97dde3b22cbd00474
[2/3] drm/panel: jd9365da: Support for Melfas lmfbx101117480 MIPI-DSI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c4ce398cf18ae2859cc9930a9486b576ce262de9
[3/3] drm/panel: jd9365da: Break some CMDS into helper functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/533ca79cd9f734aae56814445e3f1e6cc1a50358

-- 
Neil

