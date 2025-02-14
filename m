Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A31DA36157
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FDC10ECE6;
	Fri, 14 Feb 2025 15:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gg8hE+Kk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD8F10ECE5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:18:36 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30613802a59so22439891fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739546315; x=1740151115; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OcMZLvgo2+3kThO/hfiHuPvII26oDwywV7kGrf9ppp8=;
 b=gg8hE+KkafiFsMwZJ+3oblJ/U9PRfYI7SvUGiVojrBbzvRJPeu/AMSa8VzTCTJNOfe
 FOF5rzmuUN+IARW1UHabTl5lw9arqen/XXM+xw1hmCobaOMPU5xS0dZ//YE5zu2Rfm1T
 UEdb2Rbr+Sd2iGSzr3jNH8L9RcYLx1HDq3PLhu+yKS9zwHufhH2+aisVLaAGQQcINE8z
 n1ZMkr51TpOX0a10rndfyZfHFZb3T7sSJCsY4QHVy2pz6W8Y9kCTchd+IkGpV5KLfFdc
 80lI1dLxemw98NMXEoQZrfNAa2GcJFifRP38ZOfCFV1jvr58DPkmt7RCmlpThw/TWYaf
 5XqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739546315; x=1740151115;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OcMZLvgo2+3kThO/hfiHuPvII26oDwywV7kGrf9ppp8=;
 b=fcCMZ0+btgFefwnjTxM/8bcwCAE6uGG8LJOv+52+AXbzAhLbuBycvandlLtL4OiZau
 Yw7ZHzwmiGtICBBOdKcr42bpgSKhAbhFA9+LTCy7hM6vQwSZzjKtMSbErDxU5DnbalR3
 EkAo6ulZvD/xUCnFp5254+cf7hFUxe0y2G7F+xGiBDCi2YhDCtuPRWWW99bwjzaqBsn3
 ym9km0G4Qz9ruaIfW8RrleLUoAVbkOV1MRDczFU4cKfTxGcr5x+bKDejmNXmVXix2D27
 h3uyZtmlYAWOPYseZO6gl422Az/8E8IIuCum9fRAUNEPOjWlO4VssT+wLiSFSXPo/uE/
 hAsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJtnldL6OgwyEQN0as9Kk+JseN/I1jlEJN4MRBQu23xDAizzcDTgW9NFYTFURE+N47Nq4aqdxnicY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgfnkrP5ym9oBrkhaRPd7Mea3c8DJThGOSf4u0usBDn3a67jUO
 Q0hKiPd+L57QWq06q5kHkiIg5Kkxl2BUUzh99wzjOzhe2WO6lK/Xni+/NBnW9DA=
X-Gm-Gg: ASbGnct7PjqcQ4UEAmxOrNfjruSjWXI95t332FcGQKF4JMBJyXTOt0FBTSalz5IPFip
 KuFnRSxq5uAUgA5BGLp1/18K/U61BR4shaIdr/rXJbrJwgBJPnLM6yJZErYtbYZy09bPB5kPRyo
 LBc56QsnkAF0B4qmsreJ1D6FIg6wrdkAPbqcaia3M3SJ65ldyKHL5iN4r9ZP0WaJhAk8SKDbaqa
 Nyb7oFKHHTANpI+SfLMLKCz+MlQILraqkDFfHjgCW6AIWypHl8JdTBInbUeUTi22+IvStWWjp81
 P0VK9Dy/T6YnHWgD2w+9dYfAp5sJcYMohzKvgON9bhww052dJQZ9nEDiPmTiYGUcxSUiYbw=
X-Google-Smtp-Source: AGHT+IEezzYlzsneQzuZxQe4Yo+jf7QLilk9BuU0obW1zoL2W/XDA76D0mSIeKsRAt8vyBqyYw8shw==
X-Received: by 2002:a05:651c:b29:b0:306:10d6:28b0 with SMTP id
 38308e7fff4ca-30903630202mr37322251fa.1.1739546314624; 
 Fri, 14 Feb 2025 07:18:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309100c528asm5887331fa.22.2025.02.14.07.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:18:34 -0800 (PST)
Date: Fri, 14 Feb 2025 17:18:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <g6ddzfh6vsd7zgyopzassfp5ehife2t5mlq5jbjdcas3ewed2t@th37tsj7mmsw>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
 <20250214-drm-msm-phy-pll-cfg-reg-v3-2-0943b850722c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-phy-pll-cfg-reg-v3-2-0943b850722c@linaro.org>
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

On Fri, Feb 14, 2025 at 04:08:42PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> clock from Common Clock Framework:
> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> concurrent and conflicting updates between PHY driver and clock
> framework, e.g. changing the mux and enabling PLL clocks.
> 
> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> synchronized.
> 
> While shuffling the code, define and use PHY_CMN_CLK_CFG1 bitfields to
> make the code more readable and obvious.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
