Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E18B3BF8C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 17:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC42110EC03;
	Fri, 29 Aug 2025 15:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="CQ2GSonU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D09310EC03
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 15:40:21 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7f84c170734so262905485a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756482020; x=1757086820;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vMllst7gcBdZpXi7zdiPGvGRd+qrzm4OkoKr77sAH60=;
 b=CQ2GSonUYnp+Fk86KaS3nsw38yp7C50bwzFLJsJjFF9mLDwuYJ+6yq5GvmFihYQbYH
 nEqvYSL0LawtVm0D8sErCPbgjjlt1Mme6u75IlMsNNlnHvE/hbvfMZAerx5tZbNPLqY1
 leaiIWcj6dUm0L0e/eXnrjFDLWSRHGwSvEcNnWnZG5q2nVUHklLhWfzg633h/D5v/eU+
 OOOgXgBFrSAB1CrID9R38gvR6plw3xBfizUziCqYloFaR/twbawr0IUTdercOgbdgA8Y
 dyzIe2T/HapcIfJ5oFkDUvkVsr+DqZVDSqRjqqdIQ3OMeNhXhFBGCxKbPBCNU51w46he
 NY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756482020; x=1757086820;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vMllst7gcBdZpXi7zdiPGvGRd+qrzm4OkoKr77sAH60=;
 b=aTMIax5/gLhr+vZLVy+mJRjLY5PnB4zu7oxpJGtU2eTWbFbgOpIqI8zeKMpAEW5n3G
 vo3VpMOhlwhiWgDaLzaT6MDZHUuhxKkk/hhOv9ImtBbEI/u2UMhmgL72EjH/nsruVzkC
 xBpIYHuvXIc9VczD3H35MEAF++aVfCekLaUQFyfh3HTYvmR7PsFRUbopBI4H0CUpTorn
 EXqHXEO46o5bLDiILqhXeYd7S/b/p0Y8hlrz7YW7BiztXaWhfzpwWNDfKBRea4FUKy0N
 fZJ/uxk8+K+tFCCnPuNvN9PqvKQ++Cy/8+9Fq4pRNDM63kGS8d7P5NXp47J8lwrfNWdc
 67oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwEXE5fhrKhrq/Ckfn8ZodtSrkMmAN9CaNwmdhFHxh8BPJvPIpuSKDW4x5oqs/Jeb3EXiD9sy/Vn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEhKtYGHlAQGR148pkI2PzMuti4eFoRFXzdi2CxmhMgliajRtH
 fVRkcamkq6wZwCr/uLSgvN8plywNBc19i+oY4XbMuMMnNBrkwqjDLa7KKBYB1Snk8/lkUwuOtKy
 GTqhUeyfbyKc41RuiLDyr9We2Jv+rOErAMwB5vq3FEA==
X-Gm-Gg: ASbGncv5VG4v3cowWphf6/XeSTh/OZktVtVm1sDmrsAmHLdpf/3iLQjuvokhlL073gk
 Km3gYC78mHSWDN6s83QJX/6+Km5c0yp0XS3Ffz5I6REsp1s02oTxOCygpT2YxN0lv/0EVlGdQej
 1m+NhdlKsa8L9wRYKjrTlJZXRLR/6yoLKM1xFpPUV2gIOV6gL+hNfj6o88Mde4JfBrSt1heip6e
 gQwYYLYFd864MGZ
X-Google-Smtp-Source: AGHT+IE8Uc8yE6e7x+T9rqx7j4SzBv64YwjT0y2LqCPYIhx7HTc0mU0MQAVdWTXexDU/wbuTY+TnRdDvA85/7NRQ3wc=
X-Received: by 2002:a05:620a:a08c:b0:7e9:f81f:ce8a with SMTP id
 af79cd13be357-7ea11095a39mr2507020285a.76.1756482020300; Fri, 29 Aug 2025
 08:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-rk3588-10bpc-v2-0-955622d16985@collabora.com>
In-Reply-To: <20250825-rk3588-10bpc-v2-0-955622d16985@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 Aug 2025 17:40:08 +0200
X-Gm-Features: Ac12FXwMRvICk8YV3mQ4_G0eTMWJVkBD72BsJ-WaKgZKQMAHDd1L4Y9QuXJV1oE
Message-ID: <CAPj87rNgW5-1YzurL-sFJF2SsGFmENF9JD+82cqHAYLfa67LZA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] High color depth support for RK3576/RK3588 HDMI
 output
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Cristian,

On Mon, 25 Aug 2025 at 12:08, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Since both Rockchip RK3576 and RK3588 SoCs are capable of handling 10
> bpc color depth HDMI output and we've already landed the required HDPTX
> PHY driver changes to support the setup, let's add the missing bits and
> pieces to VOP2, DW HDMI QP encoder and bridge library.
>
> Please note this conflicts with the HDMI CEC series [1], hence I added
> that as a b4-managed dependency.

Thanks, no comments on this one, but having not read the PHY changes
at all, the series is:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
