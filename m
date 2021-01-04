Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2486B2E9CAD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 19:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6447789FCE;
	Mon,  4 Jan 2021 18:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE218994D;
 Mon,  4 Jan 2021 18:05:46 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id r4so86282wmh.5;
 Mon, 04 Jan 2021 10:05:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jOT7bogYKKGgIq8O2irZ9r1kFpEDJmSFkZaBnss719w=;
 b=AZEs1IuODqDxVfNryTzjwydWD2e+mw+WRHIhiY38bCDj3/4kDP5BNNfU52vTV9fYNK
 ycaciHrx74Mg0zfyqe/7vYiDzhNCla9hznhbMUnKMG3EwOMwVA/oX4zPnlr0XVyoRRWU
 IVa9aIsqRyYWXF6iAfpC1ewC8qUelixTe9Z+K2VDOpR+2KMPJy759US3zQDCrxTpnvT9
 Q3LoP7pOo4jedS1O7YYGd6XGGv7NBc+7AP6WRV+Gncm1++3NwzNX2O2dZu1invZpqNTE
 hxxN0dL5xl79S/6xeZ3QUiMqlt2Veh8s0HDfM1Ig4Gq9zX1ImTRlJfnUBoGGAMDKRPN+
 4DvA==
X-Gm-Message-State: AOAM531BPjrzQIUCW8IcteksbQzvERjts+hI8kl/spYJ0hxCc400Cg9w
 uhmVbEn4ZutBlQsWrW/pwQQ=
X-Google-Smtp-Source: ABdhPJyWxf8aqXZ72N3yUrhdj4LKkC0F8cRhPjKuApDiViHhoYgl46TOLAmISrBtj83N/Gp1V/qsrA==
X-Received: by 2002:a1c:9949:: with SMTP id b70mr105327wme.72.1609783545149;
 Mon, 04 Jan 2021 10:05:45 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id d191sm124746wmd.24.2021.01.04.10.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 10:05:44 -0800 (PST)
Date: Mon, 4 Jan 2021 19:05:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 24/31] memory: tegra20: convert to use devm_pm_opp_* API
Message-ID: <20210104180541.GC26189@kozik-lap>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-25-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210101165507.19486-25-tiny.windzz@gmail.com>
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

On Fri, Jan 01, 2021 at 04:55:00PM +0000, Yangtao Li wrote:
> Use devm_pm_opp_* API to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 29 +++++++++--------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
