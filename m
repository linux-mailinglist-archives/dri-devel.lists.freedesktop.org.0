Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBE37DF6F3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FC710E914;
	Thu,  2 Nov 2023 15:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5FC10E914
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 15:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698940067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FvAUr4hZgHRbDlVAWSx46K/GuyuYkJdZPNWAKauBdmI=;
 b=R6c4puwCkUQzfOJLhazTz2jBD4fWBSGts1s58NLz0igzxow53AMbhT6hOXyxumf3r0yQHT
 3M4HiRqBLJT9L5pp/N+T1p5t9Sq1Dbj2qzOfv9svRyFTRxqHOUKBrutsPoMQTPIBWeOczq
 98VKajn4ntHEdctn1dEQ7Q0PXcuW/C4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-PP1-DqLPPh6e4dMNckHA1A-1; Thu, 02 Nov 2023 11:47:44 -0400
X-MC-Unique: PP1-DqLPPh6e4dMNckHA1A-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9c75b999aaaso83848866b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 08:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698940063; x=1699544863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FvAUr4hZgHRbDlVAWSx46K/GuyuYkJdZPNWAKauBdmI=;
 b=myDcA/FNsMM5Rzt8iHg8+Ao+hHaHODS2Cd26xZfTBPdvwzuMAgNhEdyiV50bpVscig
 Di4HtOQIiWimYSHoBQsEMu5JcmC4o5QKRIT9czhZw8Q19ze1YbqzpZ+2wPnpQNytxG/B
 40bvhG7Jb8RBc3n03NUtaCK+ysI535zHy8ODHlDHRfVbHKy1I0brO0+WpsFESyiR5Xgl
 yBqQYk/wO7AyUdCP81B7HFp3tGdvIj16kOrVr2LMu9LtQZ/clXnPVewe3Fh+dzsw+LbY
 f8yV5gkhx3qEOlOXyoCPb29yABh6jiQvtjaMP7AUSAGQSgjyuRs+7awH/j6s2VEMUMEN
 RL8g==
X-Gm-Message-State: AOJu0YyODfkY00VDvs0B+1Kj6+duJHPU9uKgW/5gIi2AS8ovHva6h5yD
 nMM/uxWkspxRRPbV9yphKTpSl6TJ9P3BLOKvmY00l/0qaRq6kRRezqkm9HIvkztPn0xVwAoczQb
 Jj+ALJ2Rf9jDYkGUAR/sX921oHjkI
X-Received: by 2002:a17:906:ee85:b0:9c7:5a01:ffea with SMTP id
 wt5-20020a170906ee8500b009c75a01ffeamr4623654ejb.30.1698940063007; 
 Thu, 02 Nov 2023 08:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzI7xE88HMRLtwJOqNP+R3hLF6K5NNjmsfP6ywgX/MZ9A1Er5VfgcQ792R7hS+PVUVTjbgAg==
X-Received: by 2002:a17:906:ee85:b0:9c7:5a01:ffea with SMTP id
 wt5-20020a170906ee8500b009c75a01ffeamr4623630ejb.30.1698940062707; 
 Thu, 02 Nov 2023 08:47:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a1709063b0900b009a9fbeb15f5sm1267377ejf.46.2023.11.02.08.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 08:47:42 -0700 (PDT)
Message-ID: <34b4f396-ecf3-576d-69e5-f8eac2a5d488@redhat.com>
Date: Thu, 2 Nov 2023 16:47:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 14/15] drm/i915/dsi: Replace poking of CHV GPIOs behind
 the driver's back
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
 <20231102151228.668842-15-andriy.shevchenko@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231102151228.668842-15-andriy.shevchenko@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/2/23 16:12, Andy Shevchenko wrote:
> It's a dirty hack in the driver that pokes GPIO registers behind
> the driver's back. Moreoever it might be problematic as simultaneous
> I/O may hang the system, see the commit 0bd50d719b00 ("pinctrl:
> cherryview: prevent concurrent access to GPIO controllers") for
> the details. Taking all this into consideration replace the hack
> with proper GPIO APIs being used.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 47 +++++---------------
>  1 file changed, 10 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> index b1736c1301ea..ffc65c943b11 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -66,19 +66,6 @@ struct i2c_adapter_lookup {
>  #define CHV_GPIO_IDX_START_SW		100
>  #define CHV_GPIO_IDX_START_SE		198
>  
> -#define CHV_VBT_MAX_PINS_PER_FMLY	15
> -
> -#define CHV_GPIO_PAD_CFG0(f, i)		(0x4400 + (f) * 0x400 + (i) * 8)
> -#define  CHV_GPIO_GPIOEN		(1 << 15)
> -#define  CHV_GPIO_GPIOCFG_GPIO		(0 << 8)
> -#define  CHV_GPIO_GPIOCFG_GPO		(1 << 8)
> -#define  CHV_GPIO_GPIOCFG_GPI		(2 << 8)
> -#define  CHV_GPIO_GPIOCFG_HIZ		(3 << 8)
> -#define  CHV_GPIO_GPIOTXSTATE(state)	((!!(state)) << 1)
> -
> -#define CHV_GPIO_PAD_CFG1(f, i)		(0x4400 + (f) * 0x400 + (i) * 8 + 4)
> -#define  CHV_GPIO_CFGLOCK		(1 << 31)
> -
>  /* ICL DSI Display GPIO Pins */
>  #define  ICL_GPIO_DDSP_HPD_A		0
>  #define  ICL_GPIO_L_VDDEN_1		1
> @@ -278,23 +265,21 @@ static void chv_gpio_set_value(struct intel_connector *connector,
>  			       u8 gpio_source, u8 gpio_index, bool value)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> -	u16 cfg0, cfg1;
> -	u16 family_num;
> -	u8 port;
>  
>  	if (connector->panel.vbt.dsi.seq_version >= 3) {
>  		if (gpio_index >= CHV_GPIO_IDX_START_SE) {
>  			/* XXX: it's unclear whether 255->57 is part of SE. */
> -			gpio_index -= CHV_GPIO_IDX_START_SE;
> -			port = CHV_IOSF_PORT_GPIO_SE;
> +			soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:03", "Panel SE",
> +					     gpio_index - CHV_GPIO_IDX_START_SW, value);

The "gpio_index - CHV_GPIO_IDX_START_SW" here needs to be "gpio_index - CHV_GPIO_IDX_START_SE".

Also this patch needs s/soc_exec_opaque_gpio/soc_opaque_gpio_set_value/ to compile ...

Regards,

Hans




>  		} else if (gpio_index >= CHV_GPIO_IDX_START_SW) {
> -			gpio_index -= CHV_GPIO_IDX_START_SW;
> -			port = CHV_IOSF_PORT_GPIO_SW;
> +			soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:00", "Panel SW",
> +					     gpio_index - CHV_GPIO_IDX_START_SW, value);
>  		} else if (gpio_index >= CHV_GPIO_IDX_START_E) {
> -			gpio_index -= CHV_GPIO_IDX_START_E;
> -			port = CHV_IOSF_PORT_GPIO_E;
> +			soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:02", "Panel E",
> +					     gpio_index - CHV_GPIO_IDX_START_E, value);
>  		} else {
> -			port = CHV_IOSF_PORT_GPIO_N;
> +			soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:01", "Panel N",
> +					     gpio_index - CHV_GPIO_IDX_START_N, value);
>  		}
>  	} else {
>  		/* XXX: The spec is unclear about CHV GPIO on seq v2 */
> @@ -311,21 +296,9 @@ static void chv_gpio_set_value(struct intel_connector *connector,
>  			return;
>  		}
>  
> -		port = CHV_IOSF_PORT_GPIO_N;
> +		soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:01", "Panel N",
> +				     gpio_index - CHV_GPIO_IDX_START_N, value);
>  	}
> -
> -	family_num = gpio_index / CHV_VBT_MAX_PINS_PER_FMLY;
> -	gpio_index = gpio_index % CHV_VBT_MAX_PINS_PER_FMLY;
> -
> -	cfg0 = CHV_GPIO_PAD_CFG0(family_num, gpio_index);
> -	cfg1 = CHV_GPIO_PAD_CFG1(family_num, gpio_index);
> -
> -	vlv_iosf_sb_get(dev_priv, BIT(VLV_IOSF_SB_GPIO));
> -	vlv_iosf_sb_write(dev_priv, port, cfg1, 0);
> -	vlv_iosf_sb_write(dev_priv, port, cfg0,
> -			  CHV_GPIO_GPIOEN | CHV_GPIO_GPIOCFG_GPO |
> -			  CHV_GPIO_GPIOTXSTATE(value));
> -	vlv_iosf_sb_put(dev_priv, BIT(VLV_IOSF_SB_GPIO));
>  }
>  
>  static void bxt_gpio_set_value(struct intel_connector *connector,

