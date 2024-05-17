Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8818C816C
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 09:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3928010EDF3;
	Fri, 17 May 2024 07:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NEanaEiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CE110EDF3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 07:29:34 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51f4d2676d1so333797e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 00:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715930972; x=1716535772; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVPPHFIivYXuI34xT6IINY7pJ/j08GTAqcpDxWlNso0=;
 b=NEanaEiB2gZAzzLKLH8lADcihDwUNHP8GUpDily3ELRHcQEhdWHXW01tdDd+RXT5i0
 Dlu/wQyTyC457RksMD3LVJZR+YtdNEeR9sZqX/8rFvXyhXvbh2kATCuU+nGU3kdLz+OH
 twulYKw9sNxhEVqFDktyACvJyh7sBUdglV5dimnHKnaZkeVh+eqCJseohWtA71kADnUq
 DlA1PE5s0oHmrOk3U7dIRqGWYfgwn2iOa8nhsbQHPNcjYYFkJdT8Um5qVDqrkGKZ0yNN
 aCI28n3oTG0Cswot8YD5AGLFJsmy1phdTU+NhldsCPut9HLE05v6jGkJEOZMfg5v/Toi
 K2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715930972; x=1716535772;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aVPPHFIivYXuI34xT6IINY7pJ/j08GTAqcpDxWlNso0=;
 b=IjaW/0wgfoArNTJfpWTdu3Ercb80ZFw+GpEq3DDxNv5HwygC1ttScddGc8vkwnzF1k
 nxAmHzgEQoysMFVYhvqte6odsyhn6PhPBdOD+KdMyFFJVY1YvfJVTj9fY2LxkoODEOR4
 AMT+oDhIECTj48kpwQ8jHNIJosuSmS9NvP74zdiZveaJVyggwEFgrWv2x729X/b8E+Qz
 xMExqX4Xj+VJgHyx2xiowoeX5DcyUhkswGttvFP/1Clovr0JlXWARaiSbgxOgtzWGKKR
 6lsyI7fHBhuosDh9/cnyLcnl62UBLYXR6r0Dhpnzcy0TLBrBpxVpU/IKmx1bePukfpyJ
 AwgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLHikOm0yZxkgp8YfgtJmmeyGoXBxSRgnj9GHyqztkagE4UDnLFU2ZAXm2f9MTXwGjWYgBFeNAwNGxRTiDYBVfYtEUeCghgjtlDQajAHmO
X-Gm-Message-State: AOJu0YxjjntTDnHHMP1H9NDpkc/OG4YA/ZfZepXCSolz8iJSmAXo91hY
 uyzsBWPrfirtlrU0vTXht/GtrIsOEDi9g9wMIE+htBSXRi9Rgv+eYPJK8gz+Sak=
X-Google-Smtp-Source: AGHT+IEByhpEBP2/NAYzx4xA5Xdb/FpCPkawAti9cQxu7lP4ASb8NBnpce6OPIRbtXOTo5hO+WcPeg==
X-Received: by 2002:a05:6512:2201:b0:51e:bc4f:ed2a with SMTP id
 2adb3069b0e04-523d39f8176mr1966362e87.37.1715930972165; 
 Fri, 17 May 2024 00:29:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502e5e0b0esm20746461f8f.26.2024.05.17.00.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 00:29:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: sam@ravnborg.org, daniel@ffwll.ch, dianders@chromium.org, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xuxinxiong@huaqin.corp-partner.google.com
In-Reply-To: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
Subject: Re: (subset) [PATCH v7 0/7] Break out as separate driver and add
 BOE nv110wum-l60 IVO t109nw41 MIPI-DSI panel
Message-Id: <171593097129.261191.6486205696755307663.b4-ty@linaro.org>
Date: Fri, 17 May 2024 09:29:31 +0200
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

On Wed, 15 May 2024 09:46:36 +0800, Cong Yang wrote:
> Discussion with Doug and Linus in V1, we need a
> separate driver to enable the hx83102 controller.
> 
> So this series this series mainly Break out as separate driver
> for Starry-himax83102-j02 panels from boe tv101wum driver.
> 
> Then add BOE nv110wum-l60 and IVO t109nw41 in himax-hx83102 driver.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/7] dt-bindings: display: panel: Add himax hx83102 panel bindings
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/eba54e9c4483b585f6e2b9dd2472eb110417331b
[2/7] drm/panel: himax-hx83102: Break out as separate driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0ef94554dc40fbdb7e57ff90cd1e7fa71e1e89fd
[4/7] dt-bindings: display: panel: Add compatible for BOE nv110wum-l60
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4fd07f679bebc432c72fc2c5cea23e39098e00c2
[5/7] drm/panel: himax-hx83102: Support for BOE nv110wum-l60 MIPI-DSI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1173db117634b42383cf5d397ddfd4d4860ae20b
[6/7] dt-bindings: display: panel: Add compatible for IVO t109nw41
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4020c15c0fcac8d66818dceae7f39736cf9f16b0
[7/7] drm/panel: himax-hx83102: Support for IVO t109nw41 MIPI-DSI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3179338750d83877bbc491493032bdf192266ad9

-- 
Neil

