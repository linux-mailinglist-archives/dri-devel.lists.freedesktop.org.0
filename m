Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C5D1A7919
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 13:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4716E079;
	Tue, 14 Apr 2020 11:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0AE6E079
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:07:07 +0000 (UTC)
IronPort-SDR: mLij580rPov+oYjkrHtJKqgRVOBKaCb1BAZDJrhkzmjReCwH5R6grOSd4xugr1OEuY2TlUnYal
 pSPY/1vV6GNA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 04:07:07 -0700
IronPort-SDR: pA7/gJMubPfJMQ+e+plvninRb7LQT9IuPX6aKRV0HMneYUaN57/nWrJxnfeeFNVC9hvq+8bQLQ
 FC3QtUzAYLdQ==
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; d="scan'208";a="427025524"
Received: from mdoerbec-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 04:07:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] component: Silence bind error on -EPROBE_DEFER
In-Reply-To: <20200411054106.25366-1-james.hilliard1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200411054106.25366-1-james.hilliard1@gmail.com>
Date: Tue, 14 Apr 2020 14:07:01 +0300
Message-ID: <87lfmymilm.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Hilliard <james.hilliard1@gmail.com>, linux-kernel@vger.kernel.org,
 "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Apr 2020, James Hilliard <james.hilliard1@gmail.com> wrote:
> If a component fails to bind due to -EPROBE_DEFER we should not log an
> error as this is not a real failure.
>
> Fixes:
> vc4-drm soc:gpu: failed to bind 3f902000.hdmi (ops vc4_hdmi_ops): -517
> vc4-drm soc:gpu: master bind failed: -517

I'd think the probe defer is useful information anyway. Maybe just tone
down the severity and/or the message?

BR,
Jani.

>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/base/component.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/component.c b/drivers/base/component.c
> index e97704104784..157c6c790578 100644
> --- a/drivers/base/component.c
> +++ b/drivers/base/component.c
> @@ -256,7 +256,8 @@ static int try_to_bring_up_master(struct master *master,
>  	ret = master->ops->bind(master->dev);
>  	if (ret < 0) {
>  		devres_release_group(master->dev, NULL);
> -		dev_info(master->dev, "master bind failed: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_info(master->dev, "master bind failed: %d\n", ret);
>  		return ret;
>  	}
>  
> @@ -611,8 +612,10 @@ static int component_bind(struct component *component, struct master *master,
>  		devres_release_group(component->dev, NULL);
>  		devres_release_group(master->dev, NULL);
>  
> -		dev_err(master->dev, "failed to bind %s (ops %ps): %d\n",
> -			dev_name(component->dev), component->ops, ret);
> +		if (ret != -EPROBE_DEFER) {
> +			dev_err(master->dev, "failed to bind %s (ops %ps): %d\n",
> +				dev_name(component->dev), component->ops, ret);
> +		}
>  	}
>  
>  	return ret;

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
