Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9397906A8C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 12:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7118910E0B9;
	Thu, 13 Jun 2024 10:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MChvNHGs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608CF10E0B9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 10:57:55 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52bc29c79fdso1210282e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 03:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718276273; x=1718881073; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HjOhHNOacsMW4MB4hjQYhSrZ5af1JEJEzNmI8PwgHzg=;
 b=MChvNHGs4DkwflATk8pws/8pMvmZSaQPikUAB4SZmc8e3cXyX6w8nxSxHd8b5LX4Yq
 JVkBUKF1j6hiKc5O5XNtNdzZcLeekwWZLFCGFcq04pSDg2jYwF8ZVM+uY72PpIuWKIfd
 gtokm6kqDtPmXUrA7QA9iYjd/afIMD82DOJhdZ7Ne4hmkIj2I5dVz927+4PW0HhOSS4p
 q1lJdqZTp7A9Zpgb1c3yuYUa3yLKkNVFly0OhwPmOZz09i44tU5IJlym/IAUS8C1nZwa
 +x3b+t3K2jnjuUpIZzpWCoynKYEZPS7BUFySfJIinfG6jyBtkiUP6KzPNkqmHjUhoa9V
 H8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718276273; x=1718881073;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HjOhHNOacsMW4MB4hjQYhSrZ5af1JEJEzNmI8PwgHzg=;
 b=JqH/Y2lD9pOopcn/rECw4GghppUUqafLtSnsqwzOVETt60VYLnpsfSrJfVBifAqohF
 MAp2eV9/JmVKoqm5jSu/TCTVxyMkfylm4BWUTfzfoBvt71bK4ySTkKY2w78zWhUEuW6L
 3FK9j7sBC2JcQbBqHKanP7BCz/Qq+VApnfzqKaR00XHMrEitYUed68baqZxUBm4yt34p
 ZwFImQ0lQqjle/+5Tm2bTEfSoQTZI7ofjgAFMcdwJuMg20jxS7TbHGY7mPJfyzpXRGbV
 XssTjRnF0fl5TKL5V34OaJ22r2iKXLeiJG9m7mI+L++eFcMCfvCbFkHR/dqQPY3FVE3r
 wJag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP+6zdfQWZoXpKy6bcrTB4U7BQQq+dPbdZr81ZWv40BJkK/ccWBQVutzargDoQv20TpuMVkAmfU7pq8Q12l5VXUz7OKd8bTL8ipppODAZ2
X-Gm-Message-State: AOJu0YxVtc075lVFG2JuSXB5VGVGtXmBTVxzFAEhHHndQLjx/Gcujurv
 g2o1ibWskmnkRW/kXNrudAY1I6KBlaiRSB3RcrFoNQGcrmz+GUljHL/mNDORLzg=
X-Google-Smtp-Source: AGHT+IGbicDiaCIJkOAL+0Rjmm4rUZwfFW4J5Zoz2JYkWj7C7cqiiUK3ah9YkVF21mxgc45Hb/drBA==
X-Received: by 2002:a19:e00a:0:b0:52c:8811:42f7 with SMTP id
 2adb3069b0e04-52c9a3d2020mr3424759e87.19.1718276273406; 
 Thu, 13 Jun 2024 03:57:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825955sm162210e87.22.2024.06.13.03.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 03:57:53 -0700 (PDT)
Date: Thu, 13 Jun 2024 13:57:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: linux-kernel@vger.kernel.org, sui.jingfeng@linux.dev, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org, sam@ravnborg.org,
 jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, a-bhatia1@ti.com, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 3/3] drm/bridge: sii902x: Add pixel clock check in
 atomic_check
Message-ID: <depev66c3pk2bxf7hrd6mk6jgzpv3uhpy5o5frgsoytsjcre4z@5dbjsia7gtg6>
References: <20240613083805.439337-1-j-choudhary@ti.com>
 <20240613083805.439337-4-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613083805.439337-4-j-choudhary@ti.com>
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

On Thu, Jun 13, 2024 at 02:08:05PM +0530, Jayesh Choudhary wrote:
> Check the pixel clock for the mode in atomic_check and ensure that
> it is within the range supported by the bridge.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
