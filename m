Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5461D9F88F5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 01:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEAB10E0B6;
	Fri, 20 Dec 2024 00:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mUGMmP0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3A610E0B6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 00:24:35 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-303548a933aso10684731fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 16:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734654274; x=1735259074; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j9aA+J4KAEL9ckXuLkeGovDW+0nmkLkY7QB9nHqUkr8=;
 b=mUGMmP0P8B15lJj7bH2B5NKDp1Mm49LYfJnAxLGiTv2ymsTTtibUtpLRjpCw14TIdu
 0g2roGiOrnu8NLKjl3l4mDIpAPF2i/g1AZqaiN6EX1uENnFwiiuVO4SvsAxbfnjVT76g
 OoxtvxKZ0VLOvRxSv4m6oQoj0DpXnBZzohRcZZyrGOHsJPUhcu/UFshG7dPyVdDbRqAH
 uB1wFCXI1qmSoDQ+BMUX7PcX+oUYYYvFBZQv8j/XgDr7kFIziwiR2EmnINyLRnjHWB2e
 lwC6gL+/lwSv+sF5nmS6ENlp0g71Fp0/aheapuwO1ahaSxnxQMO9/yViKTyEPFJwisqh
 w1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734654274; x=1735259074;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j9aA+J4KAEL9ckXuLkeGovDW+0nmkLkY7QB9nHqUkr8=;
 b=lkkft9dUgqZ+JQ2a8qPF9aCiHz5+Z5eAoP6gbeAvZk036RYIX5Bt+9iDHVqyRDq7FS
 fcYKtxweeI+RDb05gMQ3urPn7a9Eqrr5D5jBQkqj+0z0mXk2qSEVYNsPKlte8VDIN2Kc
 ixFUE9PnHPq2ZTAz1O7EPCyegYaFWYpHeKhp3nzKlpp8exXGwZwJfipY9Jt/03wFAekh
 10uWTt9ouGm31SH1pEkf1uKx4of5SnazkzeEmzU09sQaSZUVX++l01A3UHNsnQ9KN1O7
 8RkH9PDup2V9wPJSe0GmZ1YbGlcWykd4GtohesReofIj1/o88g/W/i1cNuGPYG2GKlHW
 TXGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdrfVcJU54FTU1hvlFVbV2GmdQs6HiT3xvrv7zrD8N+NcLAD93kwHcbz57kVWw6EsgwEAGa8S3gv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzR7Cb0ULb3FlDz3v8XJpZfMaaV/3ykFRP04Y+YKT7cxsmltgw8
 6Id/EyHJv7b1i6VnYVeBwpNc7TuaxljbrlyJKSXMTvwEM5UGpnIqOjyUCRS1YOE=
X-Gm-Gg: ASbGnctTENeV+tYjKII+3oISkmKbmMqCKu9uhq03typlRqGhI9kjekBeG96WzHDGNjn
 MwoSHgZ92XYhIhf4uxhEDflUVNx4db8TSosloJs8b+OD1zSbcmisXnJ7mWCQSYZNRXxwTbC5oN6
 Y1K2yz6i2StTifwvo4JbEOpkXUQAPwcUSEGa48QXF9nyyVyzNnMACePbhRiEc6AJQLC08uaBobJ
 jISnrZQwShdPhB4+wxYDWh7SORPJcsFLJhDaA5cocoX/L+PzbI4bnAMo0MrUqKgw2guPXb5lpJg
 SOy+JPsgXbHf3kYK24RqEBonaYkenQxbkF0l
X-Google-Smtp-Source: AGHT+IGppx8Kmkryfb0GYdlOCxHA4tLNUnggUumXDpfxWFzDsbli5xdvOY0HQOWHJriZ9xmqK4yo7Q==
X-Received: by 2002:a2e:a685:0:b0:302:2598:dec5 with SMTP id
 38308e7fff4ca-30468639cb1mr2096551fa.40.1734654273949; 
 Thu, 19 Dec 2024 16:24:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b082dc8sm3673401fa.108.2024.12.19.16.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 16:24:32 -0800 (PST)
Date: Fri, 20 Dec 2024 02:24:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xin Ji <xji@analogixsemi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 bliang@analogixsemi.com, 
 qwen@analogixsemi.com, treapking@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/bridge:anx7625: Update HDCP content status
Message-ID: <f5ff3gailkpkxx24jkt4z7dp2r2laazpr6oj5wiqqnoyvefd5p@5dhkmugqthjq>
References: <20241219070330.224996-1-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219070330.224996-1-xji@analogixsemi.com>
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

On Thu, Dec 19, 2024 at 03:03:29PM +0800, Xin Ji wrote:
> When user enabled HDCP feature, userspace will set HDCP content
> to DRM_MODE_CONTENT_PROTECTION_DESIRED. Next, anx7625 will update
> HDCP content to DRM_MODE_CONTENT_PROTECTION_ENABLED if down stream
> support HDCP feature.
> 
> As anx7625 bridge IC will be power down after call .atomic_disable(),
> then all HDCP status will be lost on chip. So we should reestablish
> HDCP again in .atomic_enable(), and update hdcp content to DESIRE if
> current HDCP content is ENABLE in .atomic_disable().
> 
> v4:
>  - Change HDCP content value to DESIRED if HDCP status is ENABLE in bridge
> interface .atomic_enable().
> 
> v3:
>  - Move hdcp content value checking from bridge interface
> .atomic_check() to .atomic_enable()
> 
> v2:
>  - Add more details in commit message
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 73 +++++++++--------------
>  1 file changed, 29 insertions(+), 44 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you for going through the reviews and explaining the issue!

-- 
With best wishes
Dmitry
