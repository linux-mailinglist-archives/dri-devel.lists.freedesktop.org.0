Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737DD2E9C8A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 19:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1D689FC3;
	Mon,  4 Jan 2021 18:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0742B89FC3;
 Mon,  4 Jan 2021 18:03:49 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id 91so33070305wrj.7;
 Mon, 04 Jan 2021 10:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h59iCiKuH4MXgrWgjRBSHuWSpOxsm5xD8Y4CubrF3xU=;
 b=Bvrve/W0KMOXYwL4/64fiaeJtAocyYvVPQYM1CPQauYLbaK15EfKK0cYnxR6UBpyPw
 Xp+9GVWk7q1p3sT0No7khXIEd4aQ4F/PxEFZsdSf8H8WfpIF10x7y+ru4JlwHvywLT96
 O0bZJ/P5r9jrFrB9z/Eu4phm5o+cYSjZyFecJQq+tGhVsbqL8skBbERX3LPbFgYaY07a
 nyBTVuUpui96oTSxfT4ESULTUf+fJCzzJ+glEXynnk+hkYkWQdUp8mvkzkbX1lBII3fi
 JGYVQh4POhclawW+t8H/+Qb+deCGXlwbOEb3OzQR4xG1s1KM8Ot1v9XnAHncIAUFNlDN
 ZU4Q==
X-Gm-Message-State: AOAM530lICAAwSLTbboQSC+VKeocfy56Dfx0vC0VjnO777n7Pjf2eNFR
 QQ8oM8WLgJE4yYjc0EtcdMA=
X-Google-Smtp-Source: ABdhPJxrRN4zoC9ySCl3+E0igqJkr5f1LUevrs1pugc92rcCWGC8YwtDgiDHvDzkbPEnhGyP6UumfQ==
X-Received: by 2002:a5d:58fb:: with SMTP id f27mr71674294wrd.22.1609783427686; 
 Mon, 04 Jan 2021 10:03:47 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id w8sm92329342wrl.91.2021.01.04.10.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 10:03:46 -0800 (PST)
Date: Mon, 4 Jan 2021 19:03:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 22/31] memory: samsung: exynos5422-dmc: fix return error
 in exynos5_init_freq_table
Message-ID: <20210104180343.GA26189@kozik-lap>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-23-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210101165507.19486-23-tiny.windzz@gmail.com>
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

On Fri, Jan 01, 2021 at 04:54:58PM +0000, Yangtao Li wrote:
> We can't always return -EINVAL, let's fix it.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/memory/samsung/exynos5422-dmc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

I see that the next patch depends on it so feel free to take it via PM
tree. Otherwise let me know.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
