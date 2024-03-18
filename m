Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25D187EC09
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FF010F9C3;
	Mon, 18 Mar 2024 15:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Jx/aSujB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26D110ED05
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:23:05 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-513e10a4083so2300152e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 08:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710775384; x=1711380184; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHYqxUZiYcMsHyyVaTfgVdhGSdNorfQ+WAKs2dhWXW0=;
 b=Jx/aSujBoe5Wsz6LapX4EmXXDdrvERhzlUYFGQ/KK7z8L43Z8Z2ZDJZfd5M7KDqGQb
 zaPskcHIihKIBTKGrSx0mQeo3ifTcJq2G/4vcUa+xGl+zXHvc9db8mb3sHrdOLfwwwEC
 5jpRZRpsliDWGNlrSLtCaOXqELCiGn0Gk7NVy6ZUXHBcBZ8TxkZKoPmA4cJezFBRSmyn
 V6MxOzjTkCJidq/mnVkeqcR3r3CM4hX/s4/rV11o/qNDOD9TjZJMKQzDmPYtlkbXJyb8
 N6Plq8iujOJhFAN3ytRkqSeDx1+1VPzVEtsIQlZoWAWKFS6yMjBtMPy7a77+Ai9EsZvE
 mtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710775384; x=1711380184;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHYqxUZiYcMsHyyVaTfgVdhGSdNorfQ+WAKs2dhWXW0=;
 b=vNudgbKDI/quwuRaeWt7zxGKOd5med1ezdWDtd/CX5Q+MItK4Dmo+jWbbRd061hbbb
 JCSA7v3758mh8rqerdmaovE9op3aOGDdVykRMiT3w8/7M7Yb5N/cb4JEYKBZvpZ98Gb2
 6p3ze1bSzLw5wSq+NVVVkFkmrgGD2KJj3Ih5xO3t/6fI5ozYWcj4DWh2nkjB8j819zd5
 9bqeC1sd18xN9lIIySj+JMHkvbXVdX0GU8DKT6JihKymZg3TbF23WQzAd0WFP0ge9mTZ
 QabppfQUymU0CYKXZPqT7BoRUvSFQFxoyva/pgwytVpvO80ZDmCdeSX/PYp3d979LKB/
 Cg3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA0v2zxdQ4VkhxS8TUIH3GDcZ+n18jgJbEja3SyGAePB/QaYa77cCiYxKRY67UxSvf6QT46BRMCl19s9JwuFOWDeGrh3GsUl7h/MuNWRZC
X-Gm-Message-State: AOJu0YxOI7Ouck27W4wqdFMe1O2fTxlubteg2NZJjkdIHaY+TOfYDpet
 8eDQJKPwuK/+P2k+LY0IJHgT5blismEmkutyrI+pIBWK6Ai0DiNRZYb8Ont58V0=
X-Google-Smtp-Source: AGHT+IGdW6Rs9fAb/f5/EuohFyICrbr9FOyNrbeWuCtyQ7XWcKBTHyHyNwheZWb/cVMxxMAURmY5WQ==
X-Received: by 2002:ac2:5b03:0:b0:513:bd72:a677 with SMTP id
 v3-20020ac25b03000000b00513bd72a677mr8323420lfn.19.1710775383623; 
 Mon, 18 Mar 2024 08:23:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c310600b00413294ddb72sm15047500wmo.20.2024.03.18.08.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 08:23:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240316172800.1168390-1-sui.jingfeng@linux.dev>
References: <20240316172800.1168390-1-sui.jingfeng@linux.dev>
Subject: Re: [PATCH] drm: bridge: thc63lvd1024: Switch to use
 of_graph_get_remote_node()
Message-Id: <171077538263.2168000.4639473590716964266.b4-ty@linaro.org>
Date: Mon, 18 Mar 2024 16:23:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Sun, 17 Mar 2024 01:28:00 +0800, Sui Jingfeng wrote:
> To reduce boilerplate, use of_graph_get_remote_node() helper instead of
> the hand-rolling code.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm: bridge: thc63lvd1024: Switch to use of_graph_get_remote_node()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/00084f0c01bf3a2591d007010b196e048281c455

-- 
Neil

