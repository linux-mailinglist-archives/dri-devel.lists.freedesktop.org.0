Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B602B2E17
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 16:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8D56E928;
	Sat, 14 Nov 2020 15:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6758B6E928
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 15:37:47 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 19so19068100wmf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 07:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZmlbFh0hWx58b0n2enEM67BSZj4OZbN+MaKTEZMGf/M=;
 b=pbq1XHrkN0yqM/R+f3Fu+pLmra69IrXDxVVnurIu6Dsj5c8dqbM5BEcZM12eZwuAbx
 Syy4Amz2aApsOlnH1L13+3uYykQdFD44zdnLEM6CHyHqwxqzfpzmQ1avEni68L5Bm0yl
 COrK4Yh8RELRIRcES1Xzi/HG6OfBupNOAX4GmGPdLA1Z+/uecG9LX/4i+u0PROmoGoUL
 CBhenPKb/anZU+jDM3ufXIhARdUTWZ7hMT8IW0JvNVqZkyFo8EoJdNguaW41MsSbem9X
 4gS1rR379wFxat0UoTHXkhBPRKuOqC4vGUNlSOOkYFy24v7pAO5LXuAa/nO4QwboPeAq
 EQOA==
X-Gm-Message-State: AOAM530kbMVkZBF58fvL0QlicDYZg3et4/BFUMUVjoegJeIzySk+wq35
 kPHjS6RYqd0qqgzL26Ywj+I=
X-Google-Smtp-Source: ABdhPJyzI7AG4iGUF1QmLcRFpwG9j3+/23Zyv6fGfHY4T0G4UfxJYHELxIV+Rch7MrTMAHHH5in7ow==
X-Received: by 2002:a1c:acc1:: with SMTP id v184mr6898730wme.63.1605368265988; 
 Sat, 14 Nov 2020 07:37:45 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id m22sm15946562wrb.97.2020.11.14.07.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:37:44 -0800 (PST)
Date: Sat, 14 Nov 2020 16:37:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 03/26] memory: tegra20-emc: Factor out clk
 initialization
Message-ID: <20201114153743.GC4106@kozik-lap>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111011456.7875-4-digetx@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 04:14:33AM +0300, Dmitry Osipenko wrote:
> Factor out clk initialization and make it resource-managed. This makes
> easier to follow code and will help to make further changes cleaner.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 70 ++++++++++++++++++++----------
>  1 file changed, 47 insertions(+), 23 deletions(-)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
