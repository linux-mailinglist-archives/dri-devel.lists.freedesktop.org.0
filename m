Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313AF17E25E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 15:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BC06E174;
	Mon,  9 Mar 2020 14:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE2B06E174
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 14:15:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D4DE30E;
 Mon,  9 Mar 2020 07:15:27 -0700 (PDT)
Received: from [10.1.195.32] (e112269-lin.cambridge.arm.com [10.1.195.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C26743F67D;
 Mon,  9 Mar 2020 07:15:21 -0700 (PDT)
Subject: Re: [PATCH v4 4/4] drm/panfrost: Register devfreq cooling and attempt
 to add Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
References: <20200309134117.2331-1-lukasz.luba@arm.com>
 <20200309134117.2331-5-lukasz.luba@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <9747ca5c-ba4c-521f-11c1-45ee6a5018e3@arm.com>
Date: Mon, 9 Mar 2020 14:15:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309134117.2331-5-lukasz.luba@arm.com>
Content-Language: en-US
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
Cc: "nm@ti.com" <nm@ti.com>, "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "bsegall@google.com" <bsegall@google.com>,
 Morten Rasmussen <Morten.Rasmussen@arm.com>,
 "amit.kucheria@verdurent.com" <amit.kucheria@verdurent.com>,
 Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 Javi Merino Cacho <Javi.MerinoCacho@arm.com>,
 "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
 "mingo@redhat.com" <mingo@redhat.com>, "mgorman@suse.de" <mgorman@suse.de>,
 "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "alyssa.rosenzweig@collabora.com" <alyssa.rosenzweig@collabora.com>,
 =?UTF-8?Q?=c3=98rjan_Eide?= <Orjan.Eide@arm.com>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Dietmar Eggemann <Dietmar.Eggemann@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "tomeu.vizoso@collabora.com" <tomeu.vizoso@collabora.com>,
 "qperret@google.com" <qperret@google.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "agross@kernel.org" <agross@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Sudeep Holla <Sudeep.Holla@arm.com>,
 "patrick.bellasi@matbug.net" <patrick.bellasi@matbug.net>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2020 13:41, Lukasz Luba wrote:
> Register devfreq cooling device and attempt to register Energy Model. This
> will add the devfreq device to the Energy Model framework. It will create
> a dedicated and unified data structures used i.e. in thermal framework.
> The last NULL parameter indicates that the power model is simplified and
> created based on DT 'dynamic-power-coefficient', voltage and frequency.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

LGTM!

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 413987038fbf..8759a73db153 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -105,7 +105,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  	}
>  	pfdev->devfreq.devfreq = devfreq;
>  
> -	cooling = of_devfreq_cooling_register(dev->of_node, devfreq);
> +	cooling = devfreq_cooling_em_register(devfreq, NULL);
>  	if (IS_ERR(cooling))
>  		DRM_DEV_INFO(dev, "Failed to register cooling device\n");
>  	else
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
