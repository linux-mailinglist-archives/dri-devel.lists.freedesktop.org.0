Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622D12AB363
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 10:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17A689829;
	Mon,  9 Nov 2020 09:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B922089829
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 09:17:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 425E91042;
 Mon,  9 Nov 2020 01:17:44 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6ED713F718;
 Mon,  9 Nov 2020 01:17:42 -0800 (PST)
Subject: Re: [PATCH 6/7] drm/panfrost: dev_pm_opp_put_*() accepts NULL argument
To: Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <cover.1604646059.git.viresh.kumar@linaro.org>
 <43be6d118201f9feb70fb030390fddce0852ab0b.1604646059.git.viresh.kumar@linaro.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <8f59b818-306e-05e2-3a0a-8351098b1bbb@arm.com>
Date: Mon, 9 Nov 2020 09:17:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <43be6d118201f9feb70fb030390fddce0852ab0b.1604646059.git.viresh.kumar@linaro.org>
Content-Language: en-GB
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Rafael Wysocki <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, digetx@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/11/2020 07:03, Viresh Kumar wrote:
> The dev_pm_opp_put_*() APIs now accepts a NULL opp_table pointer and so
> there is no need for us to carry the extra check. Drop them.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_devfreq.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 8ab025d0035f..97b5abc7c188 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -170,10 +170,8 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
>   		pfdevfreq->opp_of_table_added = false;
>   	}
>   
> -	if (pfdevfreq->regulators_opp_table) {
> -		dev_pm_opp_put_regulators(pfdevfreq->regulators_opp_table);
> -		pfdevfreq->regulators_opp_table = NULL;
> -	}
> +	dev_pm_opp_put_regulators(pfdevfreq->regulators_opp_table);
> +	pfdevfreq->regulators_opp_table = NULL;
>   }
>   
>   void panfrost_devfreq_resume(struct panfrost_device *pfdev)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
