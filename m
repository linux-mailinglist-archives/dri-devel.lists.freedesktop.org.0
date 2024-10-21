Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB689A69B4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 15:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59D710E4F8;
	Mon, 21 Oct 2024 13:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OsbctjZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE91B10E4F8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 13:08:06 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-37d533b5412so3035818f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729516085; x=1730120885; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FtUpr+A+8LtT2m5vyRDBgWkwHEqK1Wfgx4gBKVx1DVI=;
 b=OsbctjZCcvUvIAY74ACdRs8pY0IQ23ETU+IZuvUfXCdil/5FfWfz2Q24xrIC5ZoOMn
 otbvK84wOzIPFUi5yRa5LbglSm1DMjfv8aouwlOLmsm1lLInYNJnvZzObS1l3BXsEW/o
 yR5lOE8o3DeoJs9jGqt9zeturQFkfUpN53aK9VbKxswt3ZZTkv71QLqvvFgjNo/SsYzs
 Ef7QwpqndDZeeRKEuLN4ZlcrpvSlDj2RzU+uYLZB7yotGWHKyVos88/zHB05wl0tGrRI
 lobYaJObcaYfbficYVi3fhkl6P8VeUfHa3D8+jjYPE2CjdGQgDK+hRxMXb7mjv96dhWb
 YydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729516085; x=1730120885;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FtUpr+A+8LtT2m5vyRDBgWkwHEqK1Wfgx4gBKVx1DVI=;
 b=OrK3jkrszAUsb/TOOXK+prfm+DiDoipt5UieowRWXo2lQ/4755QXra48kIzdcQwKsy
 vVnY7S1YxhWBzybjRJna+8m1yZwakWrUvo8bCLVLWlwkw1lmTDuo7DEfHGyT13EuSlLR
 aPkL20gInABTpbpRr1AA1yVE3i1nIbNb5I00hoA72urO+XLMaVxGtTgKxTQ3fVhbSVga
 KHOwjG8y0Nte5hrI2CXA9cOw/3w5bTfmfjE89cH+/3mc19cp5Gf4bXgKAm/YoWaH2kAF
 4erUH6i4kFPsQOv4SzfVCxoBWeqJseeFrfVwzDoxdjx4b/TYcd0h6GrI/xsFgSfl7HUr
 Xm1w==
X-Gm-Message-State: AOJu0YycEOR68E4tYtZLpN6IaeLZzyMS8c4i7fVtNtBi3GQLXh9pqydi
 hR0HHSo1wHCOkvfca28N6qvc+e4N+6K61DVZeH/pzVzKQS1tMRB7eJGBphgv9kI=
X-Google-Smtp-Source: AGHT+IEipzMV/DPPme98h3B4GD5zXCo8HzlYNMbwlWUDSxFvwffIlkT58hrTwZJo/fDp/R6yYxaAzA==
X-Received: by 2002:adf:f209:0:b0:37d:4d72:dca3 with SMTP id
 ffacd0b85a97d-37eab7137dbmr7801233f8f.31.1729516085193; 
 Mon, 21 Oct 2024 06:08:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a4864csm4327496f8f.35.2024.10.21.06.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 06:08:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Marek Vasut <marex@denx.de>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241013-tc358767-of_node_put-v1-1-97431772c0ff@gmail.com>
References: <20241013-tc358767-of_node_put-v1-1-97431772c0ff@gmail.com>
Subject: Re: [PATCH] drm/bridge: tc358767: fix missing of_node_put() in
 for_each_endpoint_of_node()
Message-Id: <172951608433.1285208.7143753103186144460.b4-ty@linaro.org>
Date: Mon, 21 Oct 2024 15:08:04 +0200
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

On Sun, 13 Oct 2024 20:11:29 +0200, Javier Carrasco wrote:
> for_each_endpoint_of_node() requires a call to of_node_put() for every
> early exit. A new error path was added to the loop without observing
> this requirement.
> 
> Add the missing call to of_node_put() in the error path.
> 
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/bridge: tc358767: fix missing of_node_put() in for_each_endpoint_of_node()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5c23878252515b8d2b86839bd4cb7dea7088aacd

-- 
Neil

