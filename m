Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5851C2F74A6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20D389C86;
	Fri, 15 Jan 2021 08:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8103889498
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 03:33:46 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id w3so7292124otp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 19:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fRczbUbBhyeMbRNGSVxv3+jG6ocVKICkYf8hNaQiA40=;
 b=WwM8HsQenb0RHqPUfHN8HlIOusKmws4CAUPzJUQKgPTivnrm+e/L/o6SRP8uxsqKSW
 wu8AKrlTSeL33CdsxW7+Q2IuHLzuFq+SOyBoLVex2SzB4Jaws37irmyUnn0whudzEvYb
 qqN9y6aDMXodpMw7Fie8WNBDAbCDZuixL/H2NbOfd/+uKfjCzGbleHgTdfblmwHrYjof
 jjLNo68t4xnYQnzXMYRUvWq5nGwS3ux+iQ0dWarO9b9tlzzSfe/MWrkjEVdTkPnZYP+6
 xNd6Gc+HOuA+oWvRHVLSn7WPJpNkkTb2+X9vs5lE3sEaQv0hY8VpvrOP21f0hI/I7TfY
 gdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fRczbUbBhyeMbRNGSVxv3+jG6ocVKICkYf8hNaQiA40=;
 b=sjynexfjvM44H+SDSUhTGmPLRpRQqExAFsbtcPdmWRCS1GAb9EM4NRLGWS6UFRJE//
 WgAOgTEafD7UzCwrLvWCSmIitHiHIzmG2bZ+ij3eM/hKWMfwd7ERQukOeXzwoeaeRO0k
 mDx6hcggEDSWufGp0F9JjMZUeztsEdEBmJocvFqfL7xMBKcochQhgrUg1NW4LF11S/Es
 Zyu+KoxI6KuPA9FeWvAiqruxMqTuUZcQFbHIsRxaglbUXaaMT85tJQdKzJH8hv3MRc7f
 ctf0NfIjqmzLc0Nz3aViF3/TZTA3MUHvbgHIRpLab9L3GuLYWkpPjBSoJH5K+aUIgVmj
 u9MA==
X-Gm-Message-State: AOAM531QSlc41EIS4vfPDUhh7kA/ictywEgxE5eXPoqjyD1RBWCm2odC
 qnUeRqVrc7oJB5L6+kDK/zs7WA==
X-Google-Smtp-Source: ABdhPJzFL6cdTF4R58GGCBOQmQ22buEMMhKJfkQk0vF8xh2lAjnh5m3SIuBeuBCg/rEWwlp7yGqgUQ==
X-Received: by 2002:a9d:7c82:: with SMTP id q2mr6777669otn.205.1610681625635; 
 Thu, 14 Jan 2021 19:33:45 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 94sm1548656otw.41.2021.01.14.19.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 19:33:44 -0800 (PST)
Date: Thu, 14 Jan 2021 21:33:43 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/2] drm/bridge/lontium-lt9611uxc: move HPD notification
 out of IRQ handler
Message-ID: <YAENF3G66CGFRQ68@builder.lan>
References: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
 <20201127092316.122246-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127092316.122246-2-dmitry.baryshkov@linaro.org>
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 27 Nov 03:23 CST 2020, Dmitry Baryshkov wrote:

> drm hotplug handling code (drm_client_dev_hotplug()) can wait on mutex,
> thus delaying further lt9611uxc IRQ events processing.  It was observed
> occasionally during bootups, when drm_client_modeset_probe() was waiting
> for EDID ready event, which was delayed because IRQ handler was stuck
> trying to deliver hotplug event.
> Move hotplug notifications from IRQ handler to separate work to be able
> to process IRQ events without delays.
> 

I see a couple of other drivers doing the same, and the patch looks
good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 30 +++++++++++++++++-----
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index b708700e182d..88630bc2921f 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -14,6 +14,7 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/wait.h>
> +#include <linux/workqueue.h>
>  
>  #include <sound/hdmi-codec.h>
>  
> @@ -36,6 +37,7 @@ struct lt9611uxc {
>  	struct mutex ocm_lock;
>  
>  	struct wait_queue_head wq;
> +	struct work_struct work;
>  
>  	struct device_node *dsi0_node;
>  	struct device_node *dsi1_node;
> @@ -52,6 +54,7 @@ struct lt9611uxc {
>  
>  	bool hpd_supported;
>  	bool edid_read;
> +	bool hdmi_connected;
>  	uint8_t fw_version;
>  };
>  
> @@ -151,15 +154,26 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
>  	}
>  
>  	if (irq_status & BIT(1)) {
> -		if (lt9611uxc->connector.dev)
> -			drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
> -		else
> -			drm_bridge_hpd_notify(&lt9611uxc->bridge, !!(hpd_status & BIT(1)));
> +		lt9611uxc->hdmi_connected = !!(hpd_status & BIT(1));
> +		schedule_work(&lt9611uxc->work);
>  	}
>  
>  	return IRQ_HANDLED;
>  }
>  
> +void lt9611uxc_hpd_work(struct work_struct *work)
> +{
> +	struct lt9611uxc *lt9611uxc = container_of(work, struct lt9611uxc, work);
> +
> +	if (lt9611uxc->connector.dev)
> +		drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
> +	else
> +		drm_bridge_hpd_notify(&lt9611uxc->bridge,
> +				      lt9611uxc->hdmi_connected ?
> +				      connector_status_connected :
> +				      connector_status_disconnected);
> +}
> +
>  static void lt9611uxc_reset(struct lt9611uxc *lt9611uxc)
>  {
>  	gpiod_set_value_cansleep(lt9611uxc->reset_gpio, 1);
> @@ -447,7 +461,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
>  	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
>  	unsigned int reg_val = 0;
>  	int ret;
> -	int connected = 1;
> +	bool connected = true;
>  
>  	if (lt9611uxc->hpd_supported) {
>  		lt9611uxc_lock(lt9611uxc);
> @@ -457,8 +471,9 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
>  		if (ret)
>  			dev_err(lt9611uxc->dev, "failed to read hpd status: %d\n", ret);
>  		else
> -			connected  = reg_val & BIT(1);
> +			connected  = !!(reg_val & BIT(1));
>  	}
> +	lt9611uxc->hdmi_connected = connected;
>  
>  	return connected ?  connector_status_connected :
>  				connector_status_disconnected;
> @@ -931,6 +946,8 @@ static int lt9611uxc_probe(struct i2c_client *client,
>  	lt9611uxc->fw_version = ret;
>  
>  	init_waitqueue_head(&lt9611uxc->wq);
> +	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
> +
>  	ret = devm_request_threaded_irq(dev, client->irq, NULL,
>  					lt9611uxc_irq_thread_handler,
>  					IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
> @@ -967,6 +984,7 @@ static int lt9611uxc_remove(struct i2c_client *client)
>  	struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
>  
>  	disable_irq(client->irq);
> +	flush_scheduled_work();
>  	lt9611uxc_audio_exit(lt9611uxc);
>  	drm_bridge_remove(&lt9611uxc->bridge);
>  
> -- 
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
