Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218E244E61D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 13:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826DB6EABC;
	Fri, 12 Nov 2021 12:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564BC6EABC
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 12:08:43 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id c4so15086452wrd.9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 04:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=otZ0McVJ5SiYRqP7yOEzIbw/1AxWwGOspMcAdakaeds=;
 b=LQvnnW/sBfmRpWNRpou+Po67N6Z73lHiWzAUWeL56rM8KZQ3wcMuaQRgL4/GQOgHAr
 NR1N8PTQ7wPb9IWjzJE/t1++yyiwBNJyVLj/9x1KLhsENhmeUAOwV23X9xgrxu9dlZlK
 seKCNreAhLBnz43Fg9g9UkKZpJNfC9Ft9GORMdYh4HJwBa0vHgHlHtAlp4EhcTk/OdNy
 wRWINay5dRtLg7UIlQbAA7oPswjbqMCoX1c9wJB1r0beZvHgeuw/9uWDWc9AgbQOUVuV
 ksKKfkkdm5ZXqiFm2hH26ZX6Uf503hnuuVwow3sJy2yfebYMkBaHDCTwrwEvvfjVLwkv
 qmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=otZ0McVJ5SiYRqP7yOEzIbw/1AxWwGOspMcAdakaeds=;
 b=jSR6C/iZ/MvwotBJuPsPc4oKzyKKlK+s3uEeet5iwkrZv6vXuCiryr49mvNppx09fk
 38Of8KbpA9bLx5xFPA5CRImHo8Tm/kbNdQQfzn55A/Rkof5tQS9S4QLgiOdyudcK3WR/
 0dzNQfLJ6iVnXEMvloF/Ysda+B4Tay7XmYAPp7Bjv6M2mpwiIJmnSkx998iq5DyX0VpU
 w+pPD6lwBMDsgVyrQU36ukERoAO3nwGOGbyxslputPogAhOMGmFwWBVJjA12Z5pfYNTe
 ocO90RijNwnbOIYp2McL6HJJvAbTqtfnYmTTSvem/54xWKR4F3yfMtvQ90G/HASBX4N/
 FBVw==
X-Gm-Message-State: AOAM531CjoXdu563rqJketRp+3JNNSWndQZBRCHUgAmCkdmgN1TLVxb2
 c0Q+IEOfYbmFBIfP0IRXCng5vA==
X-Google-Smtp-Source: ABdhPJxBlMEeY7j5TABoz1gcsiHhfYOgh3JsBIzuuI4vMpGemDgBxW2s1QNyVKfFDMXNmN/UEcWvGA==
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr17741380wrz.401.1636718921903; 
 Fri, 12 Nov 2021 04:08:41 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id 126sm11086997wmz.28.2021.11.12.04.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 04:08:41 -0800 (PST)
Date: Fri, 12 Nov 2021 12:08:39 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [RESEND PATCH v2 04/13] backlight: qcom-wled: Fix off-by-one
 maximum with default num_strings
Message-ID: <20211112120839.i6g747vewg6bkyk7@maple.lan>
References: <20211112002706.453289-1-marijn.suijten@somainline.org>
 <20211112002706.453289-5-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112002706.453289-5-marijn.suijten@somainline.org>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Courtney Cavin <courtney.cavin@sonymobile.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 12, 2021 at 01:26:57AM +0100, Marijn Suijten wrote:
> When not specifying num-strings in the DT the default is used, but +1 is
> added to it which turns WLED3 into 4 and WLED4/5 into 5 strings instead
> of 3 and 4 respectively, causing out-of-bounds reads and register
> read/writes.  This +1 exists for a deficiency in the DT parsing code,
> and is simply omitted entirely - solving this oob issue - by parsing the
> property separately much like qcom,enabled-strings.
> 
> This also allows more stringent checks on the maximum value when
> qcom,enabled-strings is provided in the DT.  Note that num-strings is
> parsed after enabled-strings to give it final sign-off over the length,
> which DT currently utilizes to get around an incorrect fixed read of
> four elements from that array (has been addressed in a prior patch).
> 
> Fixes: 93c64f1ea1e8 ("leds: add Qualcomm PM8941 WLED driver")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 51 +++++++++++------------------
>  1 file changed, 19 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 977cd75827d7..c5232478a343 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1552,6 +1520,25 @@ static int wled_configure(struct wled *wled)
>  		}
>  	}
> 
> +	rc = of_property_read_u32(dev->of_node, "qcom,num-strings", &val);
> +	if (!rc) {
> +		if (val < 1 || val > wled->max_string_count) {
> +			dev_err(dev, "qcom,num-strings must be between 1 and %d\n",
> +				wled->max_string_count);
> +			return -EINVAL;
> +		}
> +
> +		if (string_len > 0) {
> +			dev_warn(dev, "qcom,num-strings and qcom,enabled-strings are ambiguous\n");

This warning occurs even when there is no ambiguity.

This could be:

	if (string_len > 0 && val != string_len)

The warning should also be below the error message on the next if statement.
Combined these changes allows us to give a much more helpful and assertive
warning message:

qcom,num-strings mis-matches and will partially override
qcom,enabled-strings (remove qcom,num-strings?)


> +			if (val > string_len) {
> +				dev_err(dev, "qcom,num-strings exceeds qcom,enabled-strings\n");
> +				return -EINVAL;
> +			}
> +		}


Daniel.
