Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E1F73A314
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 16:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E121B10E573;
	Thu, 22 Jun 2023 14:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097EA10E574
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 14:31:44 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-77a62a84855so272163739f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 07:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687444303; x=1690036303;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eNFS3vm6kC5W9sNmMv1a/vs78lFXzuLxWXC2teSXAwc=;
 b=PMQnN9XqbYq80LDFxvjm9TB5/8DLQMmm2wA6g8HFt5nYybN27yizq/2fIkQWQEp3QL
 TsLKbPbC5/YFE07vAJhN4MGziYvDELTE9oIddUXSMH3x2dcvWPFexmZcb0NZFSdlNJ26
 yRad5fO9oni+fNfLhP26APSo0Tnu0aJuxo+dZ1yrCWU2zM0mYnefVsrPcTW44sbufxyv
 1Zk4Ifb/LnZW/NvUeJiQ1w+tVvXc/0NBgSctclWgjkd54C//7TGkY1UBc6knTl6e1JID
 UrzxxpCoJqqdNlmbCWPVsdzK/lydyYuFc16sIXYA5UScThqPovBMeMQ2EqvrZPt6YsYc
 zjdA==
X-Gm-Message-State: AC+VfDwNo7fiA4aqviK2SAxjTqKWbpTA9/1jRaQMWsepUNemDLfCThHv
 rvYCDF017t2xldP9lbE1/Q==
X-Google-Smtp-Source: ACHHUZ7Nz4ISv38/X0NPG83JDoYB3aNBNpw/wKDugP83+Mf3QVAzemrTn06s8xXkrpqqM1oE7q9v8g==
X-Received: by 2002:a05:6602:218a:b0:76c:2759:5cbe with SMTP id
 b10-20020a056602218a00b0076c27595cbemr14962748iob.4.1687444303248; 
 Thu, 22 Jun 2023 07:31:43 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a6bd808000000b0077ac2261248sm2143034iob.5.2023.06.22.07.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 07:31:42 -0700 (PDT)
Received: (nullmailer pid 1657355 invoked by uid 1000);
 Thu, 22 Jun 2023 14:31:40 -0000
Date: Thu, 22 Jun 2023 08:31:40 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 2/2] gpu: host1x: Stop open-coding of_device_uevent()
Message-ID: <20230622143140.GA1638531-robh@kernel.org>
References: <20230609155634.1495338-1-miquel.raynal@bootlin.com>
 <20230609155634.1495338-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609155634.1495338-3-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 09, 2023 at 05:56:34PM +0200, Miquel Raynal wrote:
> There is apparently no reasons to open-code of_device_uevent() besides:
> - The helper receives a struct device while we want to use the of_node
>   member of the struct device *parent*.
> - of_device_uevent() could not be called by modules because of a missing
>   EXPORT_SYMBOL*().
> 
> In practice, the former point is not very constraining, just calling
> of_device_uevent(dev->parent, ...) would have made the trick.
> 
> The latter point is more an observation rather than a real blocking
> point because nothing prevented of_uevent() (called by the inline
> function of_device_uevent()) to be exported to modules. In practice,
> this helper is now exported, so nothing prevent us from using
> of_device_uevent() anymore.
> 
> Let's use the core helper directly instead of open-coding it.
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> ---
> 
> This patch depends on the changes performed earlier in the series under
> the drivers/of/ folder.
> ---
>  drivers/gpu/host1x/bus.c | 29 ++++++-----------------------
>  1 file changed, 6 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index 4d16a3396c4a..dae589b83be1 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -338,32 +338,15 @@ static int host1x_device_match(struct device *dev, struct device_driver *drv)
>  	return strcmp(dev_name(dev), drv->name) == 0;
>  }
>  
> +/*
> + * Note that this is really only needed for backwards compatibility
> + * with libdrm, which parses this information from sysfs and will
> + * fail if it can't find the OF_FULLNAME, specifically.
> + */
>  static int host1x_device_uevent(const struct device *dev,
>  				struct kobj_uevent_env *env)
>  {
> -	struct device_node *np = dev->parent->of_node;
> -	unsigned int count = 0;
> -	struct property *p;
> -	const char *compat;
> -
> -	/*
> -	 * This duplicates most of of_device_uevent(), but the latter cannot
> -	 * be called from modules and operates on dev->of_node, which is not
> -	 * available in this case.
> -	 *
> -	 * Note that this is really only needed for backwards compatibility
> -	 * with libdrm, which parses this information from sysfs and will
> -	 * fail if it can't find the OF_FULLNAME, specifically.
> -	 */
> -	add_uevent_var(env, "OF_NAME=%pOFn", np);
> -	add_uevent_var(env, "OF_FULLNAME=%pOF", np);
> -
> -	of_property_for_each_string(np, "compatible", p, compat) {
> -		add_uevent_var(env, "OF_COMPATIBLE_%u=%s", count, compat);
> -		count++;
> -	}
> -
> -	add_uevent_var(env, "OF_COMPATIBLE_N=%u", count);
> +	of_device_uevent((const struct device *)&dev->parent, env);

Why do you have the cast and the "&"?

Rob
