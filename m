Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AB47F2844
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 10:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6EB10E2C3;
	Tue, 21 Nov 2023 09:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A6F10E2C3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 09:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700557291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yw6fiQH/1FP5RDlAJ71lbPk23ChcGSwEJZF1AzUc87o=;
 b=HEt933z9U7z1zIIvnH6xhc1XeGc+OKSqFZ9KMV376i4lWzFme9b/H7yQauyp8s9TUt0tRL
 wlp8bjRMpyFbyA8zwFYehJNLYNQRO9BbpVCEHFUP/dyD9GKXXVG8iUO+7I1jZOr8PLSQV/
 XBbniYJbvJgdibV5OJdAZPWwTcEChkY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-7I153x5_M7ei0XpNDC9KNQ-1; Tue, 21 Nov 2023 04:01:21 -0500
X-MC-Unique: 7I153x5_M7ei0XpNDC9KNQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a0180b0190eso39103066b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 01:01:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700557280; x=1701162080;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yw6fiQH/1FP5RDlAJ71lbPk23ChcGSwEJZF1AzUc87o=;
 b=rWeT4nmhEMi8COfP1h7DNli/C3P2jIpDdPkExdFYuUF+quHIMmr3glaYRGYF9jImdh
 n4y9xVfaL0YroEQYhFona0rIdKm6IHdzz0RXLYUytn2T9DarQ86ff0tlnlLad6quc+R+
 bBgAl4sSN9Ym4lSA7qtbwPbXuy/sCVbNDMwLFnvYtuFyXwPMIfjCAfeCqKPbgAZqmAO1
 upju22dRbRcTBL5QXt8iyHRzPQ6ZwbWHfto4WtJaV1JbyV5j4RFU8C4CbjNfpH1gc7uS
 JwQiyhTGUheN9+qeuAxpIol+TQIPX+HOZGH+uZ2wuDOydI6XJbB9HJC5dflulo9fyGJU
 MFXQ==
X-Gm-Message-State: AOJu0YxMmv8wmXLqwJpigekTavn34Pp4W11gqaLRj1EMlYrBfXJt+QCb
 FcLEFNf1UFjuEfpeQzgCWYD6oiL0aeUs3VKkd22IO/12zQMjKMakwwgQooxi9FtqiUNX6dUJG+h
 FCU3kIDy6LR7Qew/ldUTviCj9E2hL
X-Received: by 2002:a17:906:20cb:b0:9ff:f8a:9a63 with SMTP id
 c11-20020a17090620cb00b009ff0f8a9a63mr3241572ejc.42.1700557280605; 
 Tue, 21 Nov 2023 01:01:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiYJ4B+rN090BRUTXWJ2HSbLBLGW+75Ux43XGlRHNyHYdwHWFMFeWg/QHljH1q731acsvpLQ==
X-Received: by 2002:a17:906:20cb:b0:9ff:f8a:9a63 with SMTP id
 c11-20020a17090620cb00b009ff0f8a9a63mr3241554ejc.42.1700557280182; 
 Tue, 21 Nov 2023 01:01:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 gq16-20020a170906e25000b009fca9484a62sm2797671ejb.200.2023.11.21.01.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 01:01:19 -0800 (PST)
Message-ID: <60319873-e1f5-43b4-aa22-68a5671d413b@redhat.com>
Date: Tue, 21 Nov 2023 10:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fbdev/simplefb: Add support for generic
 power-domains
To: Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20231101172017.3872242-1-thierry.reding@gmail.com>
 <20231101172017.3872242-3-thierry.reding@gmail.com> <ZVwFNfkqjrvhFHM0@radian>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZVwFNfkqjrvhFHM0@radian>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/21/23 02:17, Richard Acayan wrote:
> Hello,
> 
> On Wed, Nov 01, 2023 at 06:20:17PM +0100, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> The simple-framebuffer device tree bindings document the power-domains
>> property, so make sure that simplefb supports it. This ensures that the
>> power domains remain enabled as long as simplefb is active.
>>
>> v2: - remove unnecessary call to simplefb_detach_genpds() since that's
>>       already done automatically by devres
>>     - fix crash if power-domains property is missing in DT
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  drivers/video/fbdev/simplefb.c | 93 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 93 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
>> index 18025f34fde7..fe682af63827 100644
>> --- a/drivers/video/fbdev/simplefb.c
>> +++ b/drivers/video/fbdev/simplefb.c
>> @@ -25,6 +25,7 @@
>>  #include <linux/of_clk.h>
>>  #include <linux/of_platform.h>
>>  #include <linux/parser.h>
>> +#include <linux/pm_domain.h>
>>  #include <linux/regulator/consumer.h>
>>  
>>  static const struct fb_fix_screeninfo simplefb_fix = {
>> @@ -78,6 +79,11 @@ struct simplefb_par {
>>  	unsigned int clk_count;
>>  	struct clk **clks;
>>  #endif
>> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
>> +	unsigned int num_genpds;
> 
> This is the cause of the crash that occurred on the older patch series.
> The field is unsigned, a deviation from v6.6:drivers/remoteproc/imx_rproc.c.
> 
> Instead of making it signed, this version emits an error whenever the
> count is negative.

I'm not sure what you are trying to say here ?

>> +	struct device **genpds;
>> +	struct device_link **genpd_links;
>> +#endif
>>  #if defined CONFIG_OF && defined CONFIG_REGULATOR
>>  	bool regulators_enabled;
>>  	u32 regulator_count;
>> @@ -432,6 +438,89 @@ static void simplefb_regulators_enable(struct simplefb_par *par,
>>  static void simplefb_regulators_destroy(struct simplefb_par *par) { }
>>  #endif
>>  
>> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
>> +static void simplefb_detach_genpds(void *res)
>> +{
>> +	struct simplefb_par *par = res;
>> +	unsigned int i = par->num_genpds;
>> +
>> +	if (par->num_genpds <= 1)
>> +		return;
>> +
>> +	while (i--) {
>> +		if (par->genpd_links[i])
>> +			device_link_del(par->genpd_links[i]);
>> +
>> +		if (!IS_ERR_OR_NULL(par->genpds[i]))
>> +			dev_pm_domain_detach(par->genpds[i], true);
>> +	}
>> +}
>> +
>> +static int simplefb_attach_genpds(struct simplefb_par *par,
>> +				  struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	unsigned int i;
>> +	int err;
>> +
>> +	err = of_count_phandle_with_args(dev->of_node, "power-domains",
>> +					 "#power-domain-cells");
>> +	if (err < 0) {
>> +		dev_info(dev, "failed to parse power-domains: %d\n", err);
>> +		return err;
> 
> This error path is taken when there is no power-domains property in the
> device tree with err = -ENOENT.
> 
> Strangely, this does not suppress the error like the next if statement,
> even though it is possible that nothing is wrong.
> 
>> +	}
>> +
>> +	par->num_genpds = err;
>> +
>> +	/*
>> +	 * Single power-domain devices are handled by the driver core, so
>> +	 * nothing to do here.
>> +	 */
>> +	if (par->num_genpds <= 1)
>> +		return 0;
>> +
>> +	par->genpds = devm_kcalloc(dev, par->num_genpds, sizeof(*par->genpds),
>> +				   GFP_KERNEL);
> <snip>
>> @@ -518,6 +607,10 @@ static int simplefb_probe(struct platform_device *pdev)
>>  	if (ret < 0)
>>  		goto error_clocks;
>>  
>> +	ret = simplefb_attach_genpds(par, pdev);
>> +	if (ret < 0)
>> +		goto error_regulators;
> 
> With the error case specified above, not specifying power-domains (which
> is valid according to dtschema) causes the entire driver to fail
> whenever there are no power domains in the device tree.
> 
> On google-sargo, this causes a bug where the framebuffer fails to probe:
> 
>     [    0.409290] simple-framebuffer 9c000000.framebuffer: failed to parse power-domains: -2
>     [    0.409340] simple-framebuffer: probe of 9c000000.framebuffer failed with error -2

Ok so this is a problem, sorry for not catching this during review.

I believe that this should be fixed by changing the code to:

	err = of_count_phandle_with_args(dev->of_node, "power-domains",
					 "#power-domain-cells");
	if (err < 0) {
		if (err == -ENOENT)
			return 0;

		dev_info(dev, "failed to parse power-domains: %d\n", err);
		return err;
	}

Can you submit a (tested) patch fixing this? Then I'll push it
to drm-misc-next right away.

Regards,

Hans




