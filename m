Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ADA82DE5F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 18:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C9110E25D;
	Mon, 15 Jan 2024 17:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BCA10E25D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 17:21:30 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e78238db9so11222315e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 09:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705339289; x=1705944089; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IjkFYZF4OJsSCux1ae0KuULOn1wykr+CXrlgMJayfq0=;
 b=WM1vmzB/WT2vD9EgLZVlZO1G8D6/0lxl4XoCP62Fsp1O/BfKy99fA1DCxCAIK+tS3U
 C5S1ETuvorCf2oSTSeAlXTn3Exk5dzAG9ylV6X68raILWsLhzpnujyuELiEDoYSElJrO
 om+wiZ2zuT4eSoZwuuXlq+0Y13NA04OLyzF28pUcX4Qmyoh68QS69ey370yiY1tRsy8H
 Np4zXi7LF4mghjUWZiJkFUhfak92MoHFdDs4prE9OqFVqJ0fc4AF50InT2nLoVFUq/yr
 FvI43ON1az1AA6kX8x/f52oo0qyPHep+pmQiHAayXU5rXbk7XVArvtyIe6U1CxnxUhzP
 e/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705339289; x=1705944089;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IjkFYZF4OJsSCux1ae0KuULOn1wykr+CXrlgMJayfq0=;
 b=UyGI8zMndyS+ToribWCM9m77y5W0dLF4zJ7frIDDdGC1QqnbHRYZCl2tyY9IF0XKst
 d6jNpEkyrMbaiac7YCpfK/YlQv5FU4EgFVAriKG9tb2rHivhq1oYG6Ei3aDoXzGykzO2
 8GUvAgq2/NH5Y6SdCZaHVNxEEyFbh0rpl2XfsOC/lzrXK8mG0dyBu+8LZtSIf4135o6n
 G0RJYF3UkVlQxG54Ej2BLls3OK53DooxXHUhUsneKy5PN1m254MozsG2rVGn0mk9s5Jg
 HqP3KR1b1uHmqk8fXDoaqNEhhvcoEoQv5zolBZn/Xt2XPnHNXN85ynTWUx27lSEAKA0z
 6FxA==
X-Gm-Message-State: AOJu0Yxo3Kl/4nQS/3dW/FyLCgC4QpO+0clJ6P9ocTyl8hkgBL9Q8Vkc
 U+NzM2QYgCewNJRHWeb7oH8aP3pnFFZpBQ==
X-Google-Smtp-Source: AGHT+IGEIWTLvbhgXwT8d2oD5iyG6zHn0v20sib1KcKMQWPEWI9LPUGG9Iy5hCJrKDalyprRbZDANg==
X-Received: by 2002:a05:600c:44f:b0:40d:3fee:97f6 with SMTP id
 s15-20020a05600c044f00b0040d3fee97f6mr3339548wmb.34.1705339288709; 
 Mon, 15 Jan 2024 09:21:28 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a7bc346000000b0040d81ca11casm16167428wmj.28.2024.01.15.09.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 09:21:28 -0800 (PST)
Date: Mon, 15 Jan 2024 17:21:26 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] backlight: hx8357: Fix potential NULL pointer
 dereference
Message-ID: <20240115172126.GA31203@aspen.lan>
References: <20240114143921.550736-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240114143921.550736-1-andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 14, 2024 at 04:39:21PM +0200, Andy Shevchenko wrote:
> The "im" pins are optional. Add missing check in the hx8357_probe().
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/642e1230-3358-4006-a17f-3f297897ae74@moroto.mountain
> Fixes: 7d84a63a39b7 ("backlight: hx8357: Convert to agnostic GPIO API")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
