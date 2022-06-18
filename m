Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257D95506BC
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 22:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7859910F4EB;
	Sat, 18 Jun 2022 20:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E3310F4EB
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 20:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655585827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/9Rw/qc2rEvNr21u2x0vU2jv3bKE7rh5auzV0CxVnQ=;
 b=UsATrAeXj3cHjFyBbc0PlyLQ/3iq/y6rZotNeyafqCiYisQjEEuRkf2qgE092tzIlQOsdQ
 ZFr0GtKOTAMOspGp5n0gycA8hBkms4DUWE0EmTjnog/KB45MqTrkTtWdQe8bQ7FUsnRTnc
 UCPMUEt/BoO7huBvcu3aTPoqoe6Ivm8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-jZBv-zbtP0uk1GSdo5tw4Q-1; Sat, 18 Jun 2022 16:57:06 -0400
X-MC-Unique: jZBv-zbtP0uk1GSdo5tw4Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 f9-20020a056402354900b0042ded146259so5687498edd.20
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 13:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m/9Rw/qc2rEvNr21u2x0vU2jv3bKE7rh5auzV0CxVnQ=;
 b=PxU5iuPVBK2+ZTybuZMv6gWH6knS2w6uTplA2zgEzu4DBu+DMUh+8bKgU2GtxjqGVo
 c1Zrae5ZmGn1kRim+g+bKwLwGH9AZTKehTzPUwsoMytXFMKFJtcfMMVTiiIJLe9KzreV
 pBF7PQbCyP3ck+jviGHf5aMMA6HJEzcc7hl5JQRv3WQGyaHHVRrcHIUhOdIzHD1sbLIR
 QrlgT/rnr9l1cuFJKxjOdMKI5++strN1wLGHcbsfLNcjWG4ciSL+kBBEObVyMEMQQ5Mq
 R2eRuYHLdp/aERWc6bxLO52BR40YnybRZ2D2catEc+zjtjBT9949oB5yie756zluurP/
 Ib6g==
X-Gm-Message-State: AJIora+tbl6Athd62vRjjWMcKxVxDPEedJ8dH9TR3YIAPngSlH73+mU0
 x4j5m/omrD7SZdZBHhpCmbWYvYInRMqcOM+CzZXYnT/RhYaAZ8q4S+4b3+yLO6qkSj23j9vuyH3
 MVHJimGlWYsUpue0c6OwSdAdDO70T
X-Received: by 2002:a05:6402:e9f:b0:435:644e:4a7d with SMTP id
 h31-20020a0564020e9f00b00435644e4a7dmr10532081eda.114.1655585825105; 
 Sat, 18 Jun 2022 13:57:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sj8iyXOUTGmie4p49fgZ9luOnKQsAl0I8JVaS0LjYv4yPc8DiAfDH9430X91EhyaPdNbzI2Q==
X-Received: by 2002:a05:6402:e9f:b0:435:644e:4a7d with SMTP id
 h31-20020a0564020e9f00b00435644e4a7dmr10532070eda.114.1655585824940; 
 Sat, 18 Jun 2022 13:57:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a50fc0e000000b004355d27799fsm4285643edr.96.2022.06.18.13.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jun 2022 13:57:04 -0700 (PDT)
Message-ID: <2573aee8-e1cd-cb62-c87f-f841a173220c@redhat.com>
Date: Sat, 18 Jun 2022 22:57:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: drm: panel-orientation-quirks: Add quirk for Aya Neo Next
To: Maccraft123 <maccraft123mc@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220611103911.9417-1-maccraft123mc@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220611103911.9417-1-maccraft123mc@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: airlied@linux.ie, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maya,

On 6/11/22 12:39, Maccraft123 wrote:
> From: Maya Matuszczyk <maccraft123mc@gmail.com>
> 
> The device is identified by "NEXT" in board name, however there are
> different versions of it, "Next Advance" and "Next Pro", that have
> different DMI board names.
> Due to a production error a batch or two have their board names prefixed
> by "AYANEO" and that's how we ended up with 6 different entries for
> what's basically one device with different hardware specifications.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  .../gpu/drm/drm_panel_orientation_quirks.c    | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 4e853acfd1e8..62fc7eb69341 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -152,6 +152,42 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYA NEO 2021"),
>  		},
>  		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* AYA NEO NEXT */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	},

If you change:

		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),

to:

		  DMI_MATCH(DMI_BOARD_NAME, "NEXT"),

Then the matching code will do a substring search for "NEXT"
in DMI_BOARD_NAME. IOW it will do a strstr using DMI_BOARD_NAME
as the haystack and "NEXT" as the needle.

And since all 6 board-names contain "NEXT", this single entry
will then match all 6 variants.

So please respin this patch using just a single entry with:

		  DMI_MATCH(DMI_BOARD_NAME, "NEXT"),

Thanks & Regards,

Hans



 {	/* AYA NEO NEXT Advance */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Advance"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* AYA NEO NEXT Pro */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Pro"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* AYA NEO NEXT (Batch with different board name) */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO NEXT"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* AYA NEO NEXT Advance (Batch with different board name) */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO NEXT Advance"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* AYA NEO NEXT Pro (Batch with different board name) */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO NEXT Pro"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_rightside_up,
>  	}, {	/* Chuwi HiBook (CWI514) */
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),

