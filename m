Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A21A0B34B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D232810E5F3;
	Mon, 13 Jan 2025 09:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EwcYAI4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756DB10E5F3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:42:24 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53e3c47434eso3818011e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736761283; x=1737366083; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9BPOCCJm2N1Pa4RYwwEm5KQb8lK0h5iQJXFaC1ATBoc=;
 b=EwcYAI4q0Z1hmpO1x6bOdYJlL+CpBfyomwuXCUPuxhTmtrK4twM6mvW8yrwv/qcIGh
 jz/dwg0T8G62bNXt9AltU2xlNJwsJ2n8GIzkjc1OUQZqCTD1ziFzgP/hjCvRdTqfmnxJ
 rGVYs5KEECrqvbZ7Gp46KyhIJo9gQ9nrkGE0UStME9W3pXS3jAoFhYcdlJpAC6p8qvvb
 I7ADNq1LOw6Cw/80lwsnK+vWwM8249XgV0e3QblAv4Awic5QepxqYyoDcA8BdxvDBPT+
 zUY7oMj6vcJDlTBJOFhewqpca9+aiFePanYBFcVIxV9YrxZSklvzqLB4REXgQv0E2cDd
 pXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736761283; x=1737366083;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9BPOCCJm2N1Pa4RYwwEm5KQb8lK0h5iQJXFaC1ATBoc=;
 b=vAGWeJvKK0RtjjwW5dR/kquqlwoRrHyNGvcdcPU79L5HedHdSRvBOZx04ObaXkYjI3
 DJZGqJIsFlP6oxGR/En/4gSk53xdaBP1QYqb29DkWqPqPzQhhyUf3IOwjHnUzZLJRVVH
 upfMpPh4wIpTWMzDcoQiKkwPyOSXH4SXEJxKuqhNrgcpIWL4gTU6k14mkS8jLyezOTd6
 6kMl9GLxiH+dfSpuZh5PUxUdvwFv2YnJpy1cxvZmbiYZ+I8R9tWIhj+cszDTFaRM5ump
 czh5/8GiWZC/VigIcj7Sp0YjGn+eHY4j79d0LE/NYHgn/aCVjW32PGLNMJeIKv7+xe3S
 DDzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoxXsWmJD2562frRDzTRJGI4Fu/TruRP+absZb4iBvlT8NJBtVwb75/P/Gw5KAOg7iL8vBs3ZvMME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGxX8AKcYGLJrq07iIBOXt/BGyclkiY6AKgeb/T4rK3JLpSnz3
 53pQ0xmjrcVFfsyt5BD5X/uhBCVK19jU7K9RE7vg4Moi3M13mbbiM8my7YLNv2U=
X-Gm-Gg: ASbGncufZ5RFn31Ax1rXV+nfbvn4e7Z4+1irXqFwvTonAitz/1NwiJPFqGpJKFbCry1
 +SwO2mrfUwXcKtuN1X51KDUOs+xX+nxv/CHgT4YKtEfKSIG531FuTl3iEjoyGNQgzQLo+FA97fp
 MBe0ii9mBiMrnsXahoj4ToeHbci7QjaZTcVtyMxCWzwCDghmuSHfKPcg8l63wy58eE6Ki1QqKaW
 fJTHuXjrjV+UpPZNkDAkJhG6q7IbYIrOYdMQjUxeOkRhi+yMQkTwHhe/8pqAklk/UfRLMhSWub6
 ejTGQf8DUYWAfV9L8pniKnoksZpTwY7cUTAy
X-Google-Smtp-Source: AGHT+IGmrqCsL1oBAe7SOVHiP9w367bkYMzFr+BMUlM17Ahn5Tf9Y36+XkYJFnis1sEVwHOr3IiL9A==
X-Received: by 2002:a05:6512:281c:b0:540:22bd:e25c with SMTP id
 2adb3069b0e04-54284817cffmr5741864e87.50.1736761282870; 
 Mon, 13 Jan 2025 01:41:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec0664sm1308561e87.193.2025.01.13.01.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 01:41:21 -0800 (PST)
Date: Mon, 13 Jan 2025 11:41:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 06/12] drm/bridge: cdns-dsi: Check return value when
 getting default PHY config
Message-ID: <rlzpru3tsfwdyvkezil3uu5ycndisusilc4fookmfcdl5lusfi@6bhh3bw2uobn>
References: <20250111192738.308889-1-aradhya.bhatia@linux.dev>
 <20250111192738.308889-7-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111192738.308889-7-aradhya.bhatia@linux.dev>
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

On Sun, Jan 12, 2025 at 12:57:32AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> Check for the return value of the phy_mipi_dphy_get_default_config()
> call, and incase of an error, return back the same.
> 
> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
