Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8BA9627A2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 14:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3751310E4FF;
	Wed, 28 Aug 2024 12:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="BmkweRdi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7D410E4FF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:46:53 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42812945633so57647095e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724849212; x=1725454012; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mCKUfCxdP4MKeenzWS0OMigepVfsXKGfVEcSb+4JFCU=;
 b=BmkweRdiG/dIz86G4RXvuFC6iXPi94rOOoGy3dR214xESO5qo3P8mWmO2U5IF4bkTJ
 iq4UG+dtxDn1VmoBeF5/UNjiCroD2T1w82+MfGNPdEyKQ+sppMtC4SnxIDxUEeVKo4L+
 Ayd3VE+KDU7E5tZhtZYLT7wuqVl9wjBTBm6Ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724849212; x=1725454012;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mCKUfCxdP4MKeenzWS0OMigepVfsXKGfVEcSb+4JFCU=;
 b=A/R3++RNbRV0Mk8U2N1W4TqWjkHj5ABFc+3Iiy7ZTi6whK35qZJJuqDzf/tuKSsY+3
 dYmflAMYF9YlSIQ5+GIJFlMR4z+rtJ5B1vrIMlf3reotPbART0zYitNAd2PkLj8nl2GQ
 UYSS3Nnv2rOMDlpgSFEzA7k/a1YirKiVyqOBtACZuvbfKF5dvgdZ2osnW0CZ+UqU85Jl
 GOC83O9NBaDEdb1bqh0FP6mBHZq2nPKcUT3npIRyZ3k9kYV4I6b7OkJykx438vkeOR2P
 CwXzHT7rij5azNif75EtARnqbSuUUWdeIsMu9vGgczrhdrgXN9ax55Q5nvnQfE9A8gBn
 SGFQ==
X-Gm-Message-State: AOJu0YzyAgB4ox/906/jd4/W+nKn9SH6hJ39fwWMe6NDbktASNMXAjit
 D4Jg6fxLvmHIsnxgQZHUUGpTNBoL0XjwfBwkdhs3n46PkNceO0rNHwf+b+WJdMc=
X-Google-Smtp-Source: AGHT+IEme/NvDEwaIsmdsaghdQUIdj9mcmi4fC5Q5iTXRkC9Kk2qvrAxmk0wwPZtl6O4mKao5Ms1RQ==
X-Received: by 2002:a05:600c:310e:b0:426:6353:4b7c with SMTP id
 5b1f17b1804b1-42acc8d4a11mr121210565e9.8.1724849211908; 
 Wed, 28 Aug 2024 05:46:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bac862326sm6344815e9.17.2024.08.28.05.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 05:46:51 -0700 (PDT)
Date: Wed, 28 Aug 2024 14:46:49 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/6] drm/tegra: convert to struct drm_edid
Message-ID: <Zs8cOVli_dYQO5v4@phenom.ffwll.local>
References: <cover.1724348429.git.jani.nikula@intel.com>
 <e764b50f4ad2de95e449ccb37f49c3f37b3333fc.1724348429.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e764b50f4ad2de95e449ccb37f49c3f37b3333fc.1724348429.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 22, 2024 at 08:42:50PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

This time a slightly less blind ...

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

:-)

> 
> ---
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/drm.h    |  2 +-
>  drivers/gpu/drm/tegra/output.c | 29 +++++++++++++++++------------
>  2 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index 682011166a8f..2f3781e04b0a 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -133,7 +133,7 @@ struct tegra_output {
>  	struct drm_bridge *bridge;
>  	struct drm_panel *panel;
>  	struct i2c_adapter *ddc;
> -	const struct edid *edid;
> +	const struct drm_edid *drm_edid;
>  	struct cec_notifier *cec;
>  	unsigned int hpd_irq;
>  	struct gpio_desc *hpd_gpio;
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index 4da3c3d1abbc..e6b5863fec71 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -21,7 +21,7 @@
>  int tegra_output_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct tegra_output *output = connector_to_output(connector);
> -	struct edid *edid = NULL;
> +	const struct drm_edid *drm_edid;
>  	int err = 0;
>  
>  	/*
> @@ -34,18 +34,17 @@ int tegra_output_connector_get_modes(struct drm_connector *connector)
>  			return err;
>  	}
>  
> -	if (output->edid)
> -		edid = kmemdup(output->edid, sizeof(*edid), GFP_KERNEL);
> +	if (output->drm_edid)
> +		drm_edid = drm_edid_dup(output->drm_edid);
>  	else if (output->ddc)
> -		edid = drm_get_edid(connector, output->ddc);
> +		drm_edid = drm_edid_read_ddc(connector, output->ddc);
>  
> -	cec_notifier_set_phys_addr_from_edid(output->cec, edid);
> -	drm_connector_update_edid_property(connector, edid);
> +	drm_edid_connector_update(connector, drm_edid);
> +	cec_notifier_set_phys_addr(output->cec,
> +				   connector->display_info.source_physical_address);
>  
> -	if (edid) {
> -		err = drm_add_edid_modes(connector, edid);
> -		kfree(edid);
> -	}
> +	err = drm_edid_connector_add_modes(connector);
> +	drm_edid_free(drm_edid);
>  
>  	return err;
>  }
> @@ -98,6 +97,7 @@ static irqreturn_t hpd_irq(int irq, void *data)
>  int tegra_output_probe(struct tegra_output *output)
>  {
>  	struct device_node *ddc, *panel;
> +	const void *edid;
>  	unsigned long flags;
>  	int err, size;
>  
> @@ -124,8 +124,6 @@ int tegra_output_probe(struct tegra_output *output)
>  			return PTR_ERR(output->panel);
>  	}
>  
> -	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
> -
>  	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
>  	if (ddc) {
>  		output->ddc = of_get_i2c_adapter_by_node(ddc);
> @@ -137,6 +135,9 @@ int tegra_output_probe(struct tegra_output *output)
>  		}
>  	}
>  
> +	edid = of_get_property(output->of_node, "nvidia,edid", &size);
> +	output->drm_edid = drm_edid_alloc(edid, size);
> +
>  	output->hpd_gpio = devm_fwnode_gpiod_get(output->dev,
>  					of_fwnode_handle(output->of_node),
>  					"nvidia,hpd",
> @@ -187,6 +188,8 @@ int tegra_output_probe(struct tegra_output *output)
>  	if (output->ddc)
>  		i2c_put_adapter(output->ddc);
>  
> +	drm_edid_free(output->drm_edid);
> +
>  	return err;
>  }
>  
> @@ -197,6 +200,8 @@ void tegra_output_remove(struct tegra_output *output)
>  
>  	if (output->ddc)
>  		i2c_put_adapter(output->ddc);
> +
> +	drm_edid_free(output->drm_edid);
>  }
>  
>  int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
