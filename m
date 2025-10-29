Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABEAC1D59E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 22:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158D110E852;
	Wed, 29 Oct 2025 21:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="we5Z3z2Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D3F10E84D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 21:05:39 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so321889f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761771938; x=1762376738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=svITpYAx9yweNnxVjT+0+O3geT9huO9jW855FUX+XhA=;
 b=we5Z3z2ZOgB985Xm6drY9XoPY7XHvVe9xvsqEHEEr9g7Gp6XlZTzKa1LngYN7I/v6K
 hycumv5NSRs3FIJyeSUL5lSYZ0wwQlc9DiI2dbC5ibk4uRtx7MchgWyLupt/KV3yw4g6
 S4IOvI/6NZYBUBwk3yTnoltBifmVbT9mDK6+k8q51dNdwJBJJij1gpI3vDtn6nbQ4HJG
 KQlHxfkiqPUCG3d/ZZaBjGWBFTQmIDO/oSLFxLN6WpheI7/hJpYrSAU33YnLr9JpX0d3
 ZS300cH17+5RRHKZkEQbtsMFOozQSvpMfstg4SnVa+o/Gmwxc3YK0GQpUKeyI/u4grUi
 XwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761771938; x=1762376738;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=svITpYAx9yweNnxVjT+0+O3geT9huO9jW855FUX+XhA=;
 b=qxHz1ePQIOKYD+jz84tvH8+Gw6EcB3j7NRWiXd9JdDHapSycXHPMr34n4LffyAcmNr
 2NORxxrm9b7+Vjn8lBbKiZo8/PzEpFrZw2mYaLHIN4c3XMEjOnG0dR7JeQhBaz+2g9h7
 Yn9/SC5R1qibobPsJtbmKdj6JzuyAcb/q0omor5n5pK10dU6tr3+kFz024Oj93GhaU+U
 DFjQT9cTDTNonbiBqcR+mNIsmH4anYzUfQsoIZR1c7/ElKri4CZdPUgpRAXMpEB/BDTK
 KdKoB8XcvGUdS53t0PePmGwa7MFpx87OcnbAPbdwKm7/j7uRbwuz7Z5aWrvt7Kk63b74
 KQhw==
X-Gm-Message-State: AOJu0YyJAyn4+8ECjTeSQAANiR8NqArhnAXk0uOWoc1lhgwJWxgfoxU4
 52HNssoXXXtWgFKyDRHkqJUUfZg6HlHaL+hnh25CNzUOujOaOptC3DZ9bsLpbiZL7ng=
X-Gm-Gg: ASbGncvtaIomtr8NhYEz5+Nt+Q73qMdGwWG6sN5DWVMiYbQjj0E/rKFGz2X7Khmpqko
 KzHvu+lTP+xdhGV9QGtL6ol/WnxO4livgPvetoq/RHxJS6O72BaQ2hPv1Drt9h/taBKYM55/rnr
 dLzpop0jGv6vtPNLTZOGlbBD/2C2X/f2w7L2+1FPrfC0lhU0r74p5Iy6CeRADnW/LjX70bPe0EE
 RlnmVanGty+CtB7HZK5JSZ9oVbiX3Z+PzrajL3CPKw9i+xR0XnKKCgMn9n9UrvMDOBfNElU++/a
 e2Rm+At9brEMBI+DCKNZiYrS1TdQmgCuesauqMBXA0TdJcK11WpezlRNo0ZqtxZr4JZqZ4gfLnV
 c1PQBhBCS41ZX96H8jVUCW1aNKWbD94MOx9Oahz8WNUsDAwPKtvFIt65V1G/TmgcBZQKP3Rcj+j
 feMKXdkyMeHKf5wBNvjOOA
X-Google-Smtp-Source: AGHT+IGjUyoyzO/jtzz8hqH4iMiJKrG0QJvlJqguCgOC62nY4tjJMHbN2DvHDlUADKcH7/pRsAHM2Q==
X-Received: by 2002:a5d:64e8:0:b0:405:3028:1be2 with SMTP id
 ffacd0b85a97d-429aef7358dmr3777675f8f.11.1761771938241; 
 Wed, 29 Oct 2025 14:05:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de971sm27815109f8f.39.2025.10.29.14.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 14:05:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
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
 phone-devel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
References: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
Subject: Re: (subset) [PATCH v5 0/6] Add OnePlus 6T display (Samsung
 S6E3FC2X01 DDIC with AMS641RW panel)
Message-Id: <176177193744.2073083.518976981687833729.b4-ty@linaro.org>
Date: Wed, 29 Oct 2025 22:05:37 +0100
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

On Thu, 23 Oct 2025 22:24:24 +0200, David Heidelberg wrote:
> This patchset enables the display on the OnePlus 6T smartphone.
> 
> Patches 1-2 add the bindings and the panel driver.
> Patches 3-6 document the panel, pinctrls, and GPIOs.
> 
> Since the display node is shared between the OnePlus 6 and 6T,
> the following warning appears:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/6] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/986f28f3a71e44ebd984ee45c4f75c09109ae7ee
[2/6] drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/88148c30ef26593e239ee65284126541b11e0726

-- 
Neil

