Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50603453193
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 12:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A1E6E9ED;
	Tue, 16 Nov 2021 11:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28166E9ED
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 11:58:56 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso1729719wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 03:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J2lkNEPN5OP5kdyraYR6h2y5fmHN+EL9Nmvifn0raI8=;
 b=FQZ6Ler4mcGoHSNJn3muv8L4ILy3TD4a1XiNFd+PKkvccjN5vXFeFkdICO76YhBRv+
 FqZYorusGyCMUNrSKQByBk0fL6jscTvPKdzqhjHpTswLiuxMy749jrdtLRCS3JPNma6O
 PuKQji62b5n+mkiyZ96bLuEwQaSuWj051q3wXrj8kEanRC+Wl3EVnvrjr7N/E0Dr1yC8
 F/i/tfjKlIWdZVZN7RNPPwptxki7oZDKWX4HBsf6X3IbmyWXuOcOoFw5PAbCja/b12PW
 ajaeZiyi0+T7Egr+ZetGs7leXZgGRlfppNIoN+F5U+30y2G5jBsMBkruPyzGnfgoS9ij
 1mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J2lkNEPN5OP5kdyraYR6h2y5fmHN+EL9Nmvifn0raI8=;
 b=VmarUizut3DHQdyXdDupEK3nuPo7l4id+7Rwd86YJJkbI8/Ja1JsAJhOwYe5idsmZV
 D7HcEN2WC2LiO0zTQYLQIHTVJFD5U/Ce2OS6eEqwUu1sRGgHFrGDIgZTclqY54WMLuHb
 QoDigErzLhyqyU9ebUCend/Pnl1t1i4Yob9HbaLgD1oQTO2vmnRhJfQbYwX3bmTteK/F
 ZFKGsDRzoG8WsETXP79gcTCvPirVOUEuvm53TfHikLUclCLnrXxHTW4JkY1cOCcS0tY5
 kFSXYmG6p4D1gM9ZxxFcB4VkFCU1/fXiv9yx/3+qmfeTDQv+a2wnZBGMR1oEgh2aIytm
 pNyA==
X-Gm-Message-State: AOAM531LNOPKliQx6ZlC13I6Vw+cxRnCJ2OrIDGF5NM8Is9xRET4thFx
 mse4wb9mue/p/kLRhu/Q8DZ3UA==
X-Google-Smtp-Source: ABdhPJyGcsDTHEkbLZBHATBRRsdkDFubekjiZ9m89IVYrT7musLvksci1JED4nkakdtkXd6kzec2Og==
X-Received: by 2002:a1c:21d7:: with SMTP id h206mr6973409wmh.60.1637063935397; 
 Tue, 16 Nov 2021 03:58:55 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id n15sm2458635wmq.38.2021.11.16.03.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:58:55 -0800 (PST)
Date: Tue, 16 Nov 2021 11:58:53 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 4/9] backlight: qcom-wled: Fix off-by-one maximum with
 default num_strings
Message-ID: <20211116115853.mujwmb3v4r5s6c5v@maple.lan>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-5-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115203459.1634079-5-marijn.suijten@somainline.org>
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

On Mon, Nov 15, 2021 at 09:34:54PM +0100, Marijn Suijten wrote:
> When not specifying num-strings in the DT the default is used, but +1 is
> added to it which turns WLED3 into 4 and WLED4/5 into 5 strings instead
> of 3 and 4 respectively, causing out-of-bounds reads and register
> read/writes.  This +1 exists for a deficiency in the DT parsing code,
> and is simply omitted entirely - solving this oob issue - by parsing the
> property separately much like qcom,enabled-strings.
> 
> This also enables more stringent checks on the maximum value when
> qcom,enabled-strings is provided in the DT, by parsing num-strings after
> enabled-strings to allow it to check against (and in a subsequent patch
> override) the length of enabled-strings: it is invalid to set
> num-strings higher than that.
> The DT currently utilizes it to get around an incorrect fixed read of
> four elements from that array (has been addressed in a prior patch) by
> setting a lower num-strings where desired.
> 
> Fixes: 93c64f1ea1e8 ("leds: add Qualcomm PM8941 WLED driver")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
