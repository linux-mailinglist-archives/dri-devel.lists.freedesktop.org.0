Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD087A921DA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AF810EB54;
	Thu, 17 Apr 2025 15:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H/Yso4P6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A60210EB52
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:43:15 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4394a823036so1483915e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744904594; x=1745509394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kiy6O1+ukmiBCdmursvfIZ1ixOUonC4Bg5yCWPYc6cs=;
 b=H/Yso4P6lmQex5C3Idd2uyUlZlZB640n13wMB35OSGgbMTtkplqtyeXg76H53L+DxS
 KdOrpNp0GpcLmRn1X50x2fFJfviff5GRdzfGCtbq9TdTP/AUrszOdNAm38yU9HIkTNc0
 eYcHu7xiFi4Ej2MevyK1lo0fbK4A6YLwK9lV/lbV217rbClW8MUCJH1vWA8ks+/TSauH
 G4DodEhH9jXQAr6JM4nykFtYSWpG1AYiKI9m/yTWBgBBjibSK+/QIpxCzFJK8Z1SzjTb
 aKCuO1zQXuFu/RQDNolMCOF4sAcGOFZO4SjGAqryt0xrbo/n5wDzaKRVcK3gk1uPrRS0
 prpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744904594; x=1745509394;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kiy6O1+ukmiBCdmursvfIZ1ixOUonC4Bg5yCWPYc6cs=;
 b=BSEMJZo9U4k4FCOOPaHoBsOcaJMADqgCvD2P8eJYQs4/KcvDAPxyYE0h+KgK/4gtbQ
 Nq5P0FblVouw6HUoK+njKuNT0ze7YO52cKi0ZuQKb/o2hi1rL+M7DbQUvFhziiXGgybc
 /Js6/exB6UctkzDwJxNJ1H6hc6NpmvkO1u3Liq5P33069gtfOMKnTve9hoBEQlfo1AVr
 EnMqAdEhJCZgM9sgH+C+S9KtlUWCNZvbiY/YxmdgsRI9dVQeN0w1Ak45XkEUXjQ33SY3
 BE8EXjEGK1l7VLjWOkY0Giw0pTD2ecisXl2iWQ/wzrgPxNev+oLuHUWk2otzOXFvasbz
 MbYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBWUQQjfNBu7oqRgD97sTimNVH+Anv+Q4YL+hHlbnCeEN2HfQegrl9SoJQo/VC7VtqdOLNVDKzmaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUWv4usSkHDM3Ahj3clfRGCRAtNhlXutMscKKnQFlcFqgDYFBT
 8uTdHyqRnRkaA6aczFvmdOdVSEfEKy+mXJqsY/hPG2GBGC6D+h9eQEDw5ZjgGfI=
X-Gm-Gg: ASbGncsBIdzJU0NaPfX2eaokA7x0BZri82/3L9p9SPCGFSy/lm9AmiolFBJfx9hRr61
 18Yn2C8RaV7xqLmNuF5gjEXQj1qUXqtIsYGT8FNOlr6jj1Bgfa3FvCMBphmbtuIgHzRHYQ3irG1
 iIvew98XBNPYGOW2dG6GJySEj3mhNU9L0X2u4AAdTHCLi6W94hkK9ZZZsJpdpTvrzFfPnPnyqX7
 Bl+PaFU56VJoP434N6UYSJHCqNoaV6LOb2wgxWEtlOtTB35wZInM1E5vj+yipW4SxBstzFWjL7x
 aCxxrDIJa5g/xNOk+74zUwTtZNwCvhwdrY9wgz7AgoxYmFh66giaW0ocR7tJwQ==
X-Google-Smtp-Source: AGHT+IGul/ExpZp37TdPvsaZIQLJkYja32KQl4f188bFltaB6kMTGBke5KI4F7K8YdebH3KDbIM3SQ==
X-Received: by 2002:a5d:59ae:0:b0:39e:dbee:f644 with SMTP id
 ffacd0b85a97d-39ee5b8954amr5771154f8f.46.1744904593983; 
 Thu, 17 Apr 2025 08:43:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf44577dsm20773640f8f.94.2025.04.17.08.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 08:43:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Pu, Hui" <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org
In-Reply-To: <20250411-tianma-p0700wxf1mbaa-v3-0-acbefe9ea669@bootlin.com>
References: <20250411-tianma-p0700wxf1mbaa-v3-0-acbefe9ea669@bootlin.com>
Subject: Re: [PATCH v3 0/3] drm/panel: simple: add Tianma P0700WXF1MBAA and
 improve Tianma TM070JDHG34-00
Message-Id: <174490459305.1152288.16433755651449379930.b4-ty@linaro.org>
Date: Thu, 17 Apr 2025 17:43:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Fri, 11 Apr 2025 21:19:43 +0200, Luca Ceresoli wrote:
> This short series adds power on/off timings to the Tianma TM070JDHG34-00
> panel and adds support for the the Tianma P0700WXF1MBAA panel.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: display: simple: Add Tianma P0700WXF1MBAA panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/12ad686ffdf51920000e7353351b163f3851c474
[2/3] drm/panel: simple: Tianma TM070JDHG34-00: add delays
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/716c75afd83c837f14042309126e838de040658b
[3/3] drm/panel: simple: add Tianma P0700WXF1MBAA panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/178ac975357e9563ff09d95a9142a0c451480f67

-- 
Neil

