Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97461728411
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 17:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F8E10E025;
	Thu,  8 Jun 2023 15:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1937710E025
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 15:46:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EDEA64E7A;
 Thu,  8 Jun 2023 15:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A29C433D2;
 Thu,  8 Jun 2023 15:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686239202;
 bh=psBvk6mN593bIlBgtU6wkxUL3ZGst2R4Vx8Kkhe4M3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UW02NtL8Fjy1LUBBkVDvMOiLTfqqjG4rdVzRLHS+d+X2PtkJov6QX7+BRfRoYiIc+
 HB4YYXI8UFYzuBRam+RrVAuC9Kifdjmz05Nnr/eRIRoGlqYUQx2GgkCKMiP98KhOKx
 LiA6ja35HQG0kahlijXRE7SJEscPykCkRgipmLYjrYJawdXFZl4SbyP6Z2RlzGaNug
 Aoex1Dq9eJ/DhcYklNW+fIPLSbLxtS7TiKzO8KyKJ2Y8ZKLMZcHbiHsTgwMxF8p8P5
 N/dwaxqgEPPOs2lheKsKHOuBoeibPrx/1s91s+DJGR9/kW/E+W+/Amj0na58ZHA3Em
 lVUkmWafBmHzg==
Date: Thu, 8 Jun 2023 16:46:34 +0100
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: lp855x: convert to YAML
 and modernize
Message-ID: <20230608154634.GQ1930705@google.com>
References: <20230519180728.2281-1-aweber.kernel@gmail.com>
 <20230519180728.2281-2-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230519180728.2281-2-aweber.kernel@gmail.com>
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

> Notable changes:
> - ROM child nodes use dashes instead of underscores; the driver
>   reads all child nodes regardless of their names, so this doesn't
>   break ABI.
> - pwm-period argument is deprecated, as it effectively duplicates
>   the period value provided in pwms. The driver continues to accept
>   the property, so this should not break ABI.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changed in v2:
>  - Added additionalProperties to ROM patternProperties
> ---
>  .../leds/backlight/lp855x-backlight.yaml      | 149 ++++++++++++++++++
>  .../bindings/leds/backlight/lp855x.txt        |  72 ---------
>  2 files changed, 149 insertions(+), 72 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/lp855x.txt

Applied, thanks

-- 
Lee Jones [李琼斯]
