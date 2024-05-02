Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAB98B9571
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 09:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3492810F200;
	Thu,  2 May 2024 07:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cs7gdXcq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E522010EB16
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 07:43:44 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-34e0d8b737eso306664f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714635823; x=1715240623; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oGgotSGp9gsuipLMYd1ZWIVlu9K3yF2blE80Dn0oYuM=;
 b=cs7gdXcq0XuQB8rhdHGDjcT+v5MMbvYCdHensVVCz5sEYlVTfXAzQ9NA5uIl6n8OwQ
 QiJCZZjX+eUlFx3SGLUXj+En8gS55rqdxYKKxKsEOeXxLaOEUvaA9LRjfd9b6pZFM7Ft
 ej/te/uME9dVxOwIolQACt1nlnqLEcQBw/acmZZlE0xddhqqlDEwuLjwuDVdHlIZOOCC
 mrCQ5RWQnEj8AOfZyp4OH2ADMIVsLzURFUV4pb9Ym5YMbHStR+QNsy8gNsCJG52HiRP+
 IzLcPlVZ91/lQqQs5moZDjwwG6G/UiTfec4OIWESHzLTVm1tI5mRAsGA68ZxoFkCcz+8
 0oWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714635823; x=1715240623;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oGgotSGp9gsuipLMYd1ZWIVlu9K3yF2blE80Dn0oYuM=;
 b=vJ50R2iA6GC4mAZiQ1fOUgHIQHH1hvEzRIuPI8guAN6QU3XPnptBNuMhh+MQIXrC1K
 Mj+QRPJQFD9IP8/vHEuCygBnicxPhKBLiPAGW6SE3GhS1gBMrBZYORKTXEuxo3i1sp7J
 OZtC17xyyuFl9MkPERQNpXZ/9ksoEjDdfi+sEYbaJFN54jbTSVGq+MOYmJPyybLChfGO
 s9jCXuC4nn1QeyKF/X36bwMBZvYNE9rB82HW4PW2d9dtO6ZAIH3UDxHFPRO7+zAZ4q0C
 YO/QDBAJfNNyraCGv8ckts77BKKmMo2VFVAIg08nNdd9Zgg+JpfAucdxdh1rQ2+sqLjo
 h+RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6GLu/uAZj7b+iP2kOSo7DYynDyZP8acsDLdqhM1GwRyS5pJ1by0RUJpe6QSc1iHTkhWUDMEIIiL7rPsssRkSR/RE04CIf40m4kfEO8x9v
X-Gm-Message-State: AOJu0YzJD2XfEOaCfCS+hEQ/wjjpJyVNyMXbk7saBcwggYAjiBnP02tc
 9LuldghctgZ19Kg67hIHig2nUjDZFyi2MPOfYgnDEH+9UkN5ZRH0aya4av1QBzI=
X-Google-Smtp-Source: AGHT+IHBvi5rUF5z4sbErHKgeUt1U8sqlRkmtV1aGTApGe5CPviRWujQqws9zO9M7mkcLfw0+m7IbQ==
X-Received: by 2002:a5d:64ca:0:b0:34c:769e:d9a0 with SMTP id
 f10-20020a5d64ca000000b0034c769ed9a0mr1877617wri.26.1714635822953; 
 Thu, 02 May 2024 00:43:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a5d4691000000b0034da966c3d8sm567903wrq.16.2024.05.02.00.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 00:43:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
In-Reply-To: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
References: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/3] drm/panel: ili9341: Obvious fixes
Message-Id: <171463582219.3069182.3806050898196009292.b4-ty@linaro.org>
Date: Thu, 02 May 2024 09:43:42 +0200
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

On Thu, 25 Apr 2024 17:26:16 +0300, Andy Shevchenko wrote:
> A few obvious fixes to the driver.
> 
> Andy Shevchenko (3):
>   drm/panel: ili9341: Correct use of device property APIs
>   drm/panel: ili9341: Respect deferred probe
>   drm/panel: ili9341: Use predefined error codes
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/3] drm/panel: ili9341: Correct use of device property APIs
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d43cd48ef1791801c61a54fade4a88d294dedf77
[2/3] drm/panel: ili9341: Respect deferred probe
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/740fc1e0509be3f7e2207e89125b06119ed62943
[3/3] drm/panel: ili9341: Use predefined error codes
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/da85f0aaa9f21999753b01d45c0343f885a8f905

-- 
Neil

