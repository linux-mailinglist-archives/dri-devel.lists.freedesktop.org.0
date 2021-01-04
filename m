Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8086A2E9CAE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 19:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9C989FCE;
	Mon,  4 Jan 2021 18:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C8D8994D;
 Mon,  4 Jan 2021 18:06:32 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id y17so33088939wrr.10;
 Mon, 04 Jan 2021 10:06:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y4OzI0Gift9qAQwCOItPNRXBZiGMCN5H3dDmQ5W7k7k=;
 b=TOLHf7iZMfTKsux/XyYKa9eHyMRxJxFhGEFCCuQx+zeSEs3RQnvcGESZWUl0gSI7r3
 vOUB2/YENKI3xoyo3gWEAIoPOivMwCQsqeKy+ThQgnFCANesAssARSKJUbVegMYn/vo/
 5CwlJCmP3E4dBkWbzBi4kOb1HeQeyEqtkhAt6vn9ds8bXJW8WnQOcnai6ncrjWnTX9DS
 Ocq28KjA4rHCANB5fb0H9hLixPM44y7MpFaD7tux95XQ7fCh5+zwizymBE1QkZsmH1iI
 eC7L5OOHEVCegiS46Ryjbo+hnoBlv5HAw3uTpm7LZvm7zSaWk4+mKEaYoKQ2p5Jqj56y
 kMdQ==
X-Gm-Message-State: AOAM531KxtH/HE8W6VyxeA55f8qcWPwecr0+6N2z7sQpcvQIffBjA4MA
 Qb7G7J0HVHNWlvoOg0PqpHo=
X-Google-Smtp-Source: ABdhPJwSJr+8sc9s0gJbtsMMAxXbPISgkriOlKIqFLVyMTanzET3gDdnClIP2ae3HciFRhbuw7YS/g==
X-Received: by 2002:adf:9e47:: with SMTP id v7mr44312549wre.185.1609783591011; 
 Mon, 04 Jan 2021 10:06:31 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id b7sm86189365wrv.47.2021.01.04.10.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 10:06:29 -0800 (PST)
Date: Mon, 4 Jan 2021 19:06:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 25/31] memory: tegra30: convert to use devm_pm_opp_* API
Message-ID: <20210104180627.GA27043@kozik-lap>
References: <20210103035415.23600-1-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210103035415.23600-1-tiny.windzz@gmail.com>
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
Cc: nm@ti.com, ulf.hansson@linaro.org, gustavoars@kernel.org,
 jirislaby@kernel.org, airlied@linux.ie, linux-mmc@vger.kernel.org,
 stanimir.varbanov@linaro.org, tanmay@codeaurora.org,
 bjorn.andersson@linaro.org, natechancellor@gmail.com, thierry.reding@gmail.com,
 tongtiangen@huawei.com, groeck@chromium.org, marijn.suijten@somainline.org,
 digetx@gmail.com, steven.price@arm.com, mka@chromium.org,
 chandanu@codeaurora.org, emil.velikov@collabora.com,
 linux-samsung-soc@vger.kernel.org, jonathan@marek.ca, harigovi@codeaurora.org,
 adrian.hunter@intel.com, vireshk@kernel.org, linux-pm@vger.kernel.org,
 kyungmin.park@samsung.com, miaoqinglang@huawei.com, jonathanh@nvidia.com,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 alyssa.rosenzweig@collabora.com, linux-serial@vger.kernel.org,
 airlied@redhat.com, smasetty@codeaurora.org, linux-imx@nxp.com,
 freedreno@lists.freedesktop.org, kernel@pengutronix.de, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 abhinavk@codeaurora.org, akhilpo@codeaurora.org, khsieh@codeaurora.org,
 lima@lists.freedesktop.org, broonie@kernel.org, rikard.falkeborn@gmail.com,
 kalyan_t@codeaurora.org, linux-tegra@vger.kernel.org, varar@codeaurora.org,
 mchehab@kernel.org, sean@poorly.run, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org, akashast@codeaurora.org, rnayak@codeaurora.org,
 parashar@codeaurora.org, tomeu.vizoso@collabora.com, sboyd@kernel.org,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, rjw@rjwysocki.net,
 agross@kernel.org, linux-kernel@vger.kernel.org, hoegsberg@google.com,
 yuq825@gmail.com, ddavenport@chromium.org, masneyb@onstation.org,
 shawnguo@kernel.org, georgi.djakov@linaro.org, lukasz.luba@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 03, 2021 at 03:54:15AM +0000, Yangtao Li wrote:
> Use devm_pm_opp_* API to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/memory/tegra/tegra30-emc.c | 29 +++++++++--------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
