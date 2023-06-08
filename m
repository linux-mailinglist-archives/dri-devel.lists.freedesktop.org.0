Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87625728427
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 17:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6038C10E5D7;
	Thu,  8 Jun 2023 15:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB3010E5D7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 15:50:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F196661636;
 Thu,  8 Jun 2023 15:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6D0C433EF;
 Thu,  8 Jun 2023 15:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686239458;
 bh=AQ6hR3FzA39YWv7fHa7/a1etUE1gUTycGOqZra1Bjwo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MLU1X4hdYhUkVxzpTAb17ez2F1tMW0Zd7Y9jQdqBR1p1xjXd2UyXOI5rvwfRR9Iqo
 piKOSm5ZBrdeWRXIw44MR464pFo8P5qJCP3hjo7imsKBpjsD3j66BpwhiDoTOd5g99
 Ux3sF8ugQFlwlCyfOy7D+utESHxwu4kZCykPVasDyeLx9Ma9ONVyE3hfRwKvZinrRe
 diei8P4/N0un6y8mtdSg3S7fHYl7a3zPx9XRi0yo30Tc6pDfModkOrUVoo79dHx5aC
 eqXzDQak9ZwaU4Ucm+fiO5Msquz5KBnFkahchdmaeTohhBTTMa2NXlyGW6uHEUI045
 B4HzGBskHnOQA==
Date: Thu, 8 Jun 2023 16:50:51 +0100
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH v2 2/4] video: backlight: lp855x: get PWM for PWM mode
 during probe
Message-ID: <20230608155051.GR1930705@google.com>
References: <20230519180728.2281-1-aweber.kernel@gmail.com>
 <20230519180728.2281-3-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230519180728.2281-3-aweber.kernel@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Helge Deller <deller@gmx.de>, Jonathan Hunter <jonathanh@nvidia.com>,
 Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 linux-tegra@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 May 2023, Artur Weber wrote:

> Also deprecate the pwm-period DT property, as it is now redundant
> (pwms property already contains period value).
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  drivers/video/backlight/lp855x_bl.c | 48 ++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 22 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
