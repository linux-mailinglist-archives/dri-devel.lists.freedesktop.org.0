Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFAD631F17
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 12:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3501D10E2A4;
	Mon, 21 Nov 2022 11:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C5310E2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 11:06:07 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso12463462wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 03:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=evsmNawcwqO6lha6bUl7Gf+9LrN+sO/Pwn+zWyJO1wM=;
 b=G7QARcYbyW9f0dfiOsuBOrzCi/KpTEH27qaR9M7P1StW3Su1gT/rmw6fHc+4P/zfIf
 hkSo6DC9X6i+YByHPbQiIJTE6T9n15th1reaNS1U4nfIuDwCmGFuIir81EODva9IqJQJ
 RjnH4fy8CwH2PD54C7YIcoeAq+yo8qq04nMIhz+cNHYwO7hl12P07Gp46hvFgltwXK13
 FS3Z/QZ93naI77vLXZPWC1xmUvSYPXkReYh6jb0QtdMw/cO9J7L0XxniiOAomxKljHqo
 azsgIR5KmfZbZsAL2q6df0Nk4WPpV6ELMjGg6LSMFb1T5QyK2pnlT8jpvjNUT+B2/z0z
 /j5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=evsmNawcwqO6lha6bUl7Gf+9LrN+sO/Pwn+zWyJO1wM=;
 b=ZoFEbdq92SGPeYztJGeKA4Vo7D3NnMrwy+OQxDukHc92OATxyss29S535NOEedEtR/
 6zHaP7R3R4b6erXKIjRaN+Aw07D+KKz+5DnejcC8oxGOnhY9otBTqCf8sAPkFeqLYVdi
 KDN/f2/pV0aBwIJJ0tB49gG5k8v33gtKjPpTzBswzLK1wGZj+GvPgjTzjvxPXSHIJwqY
 rxnrMhAOpBldB7qs3O0045gUZrtilCjDDoG70v52f0sZ8tyjS29AIL3a9xw45txaRZeP
 CXHEzrFZsB5ZeCG1wWagthPERQQiFxQxoD9/RPQOn0Ah4Sax5GSiTYocCvvwmHmZm5kO
 XDJA==
X-Gm-Message-State: ANoB5plCC702AP3MI32ubk54vKMB0iGF2M6SOQ4FjhjOuo2fmbRGhtVo
 P/QQ4T4Fj5mCwCXHTjhSfVd4bg==
X-Google-Smtp-Source: AA0mqf6lVXLamDzYQYOoqpf6gqacemtmk+Na0iIl6z9H0biRW1QNT519RrWCrVA/rY7FWftqZiXvzw==
X-Received: by 2002:a05:600c:a41:b0:3cf:895a:b22b with SMTP id
 c1-20020a05600c0a4100b003cf895ab22bmr3567784wmq.81.1669028766360; 
 Mon, 21 Nov 2022 03:06:06 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 v3-20020a1cf703000000b003cf774c31a0sm16576295wmh.16.2022.11.21.03.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 03:06:05 -0800 (PST)
Date: Mon, 21 Nov 2022 11:06:04 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 589/606] backlight: lm3630a: Convert to i2c's .probe_new()
Message-ID: <Y3tbnHgRScTsI+o6@maple.lan>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-590-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-590-uwe@kleine-koenig.org>
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
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:45:23PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
