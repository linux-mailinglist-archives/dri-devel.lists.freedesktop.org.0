Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5EB7B272C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 23:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EF610E0AE;
	Thu, 28 Sep 2023 21:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3625C10E0AE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 21:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695935465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Gf4p1uEJwB77Lm6SIy/Ej2I7eFhDlgmjpD+naFs9dg=;
 b=jTvKB0kE15oDzn/PL9XS+2gjA/+t4GEXLrt9JsOf/9FTfRKQ6z1h78bDs7SbZewJzvpEqX
 3WWytU9k+JxKhcesI41UtpBIKiTxmuWn+KaRCHD5xTLWIdytiRl1hxybTS9dp5PXMshf/5
 1BSOLRWfUuPxv7aywZAOQx6RKStJdLU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-tbZEQHbiM5yXr7ELe3g5iQ-1; Thu, 28 Sep 2023 17:11:03 -0400
X-MC-Unique: tbZEQHbiM5yXr7ELe3g5iQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31fd48da316so10309572f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 14:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695935462; x=1696540262;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Gf4p1uEJwB77Lm6SIy/Ej2I7eFhDlgmjpD+naFs9dg=;
 b=PdyyuYWSte9FgsGihHjZb9wGXjLUkNis6ZhqT+AbKlwno0vLjMd9eUeDdNLn+oezA6
 E9v7uFfRyZ7/ABNfpLZeVyQVDWMxf/+shE3ByQmhsBwM58uovbiqXIFzTIekNUuFXee7
 BRr9Sz4O3tjV0OPjUi0S8R6iMqyom1dtZ9HjSp/O5BcwuLMjaZ52CoCAUjOPPUaP036W
 smBqsFglVfi28ta91V8uGkZXODPKOfPdUKihIR3OEIqtyZsyI1J+1KHxUjvEXA3H8/AL
 Fq0q+STgeiadcAdSFERzrGtgHJZr3Gk1s4tg7HwLM64CDbWR8ApsDBWoylt0xE7JMk3A
 nmCQ==
X-Gm-Message-State: AOJu0YzRxXmmEOktH/Edt+wMJdsXjxNXBlzV5VinUhb/BfW3Rstgi7mo
 ME8qRYe8g8AIyzbFCGqvlcFj8uTCUVksVY8gykWJ42lNhVzIhkZ4Ntsf1B1AzSSTcLlPTMdgy+d
 1SIKPGOaHwatsfm4Vr4T+TJ+rxE+8
X-Received: by 2002:a5d:54ca:0:b0:314:748:d59d with SMTP id
 x10-20020a5d54ca000000b003140748d59dmr2212284wrv.27.1695935462475; 
 Thu, 28 Sep 2023 14:11:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTcZDViznOS+Z5kDGH34AfAZ0fPb2Xiok4ghYy5tNixFUnuBdOf7r8LmYNPrNGXn3bR/aJjQ==
X-Received: by 2002:a5d:54ca:0:b0:314:748:d59d with SMTP id
 x10-20020a5d54ca000000b003140748d59dmr2212275wrv.27.1695935462140; 
 Thu, 28 Sep 2023 14:11:02 -0700 (PDT)
Received: from [10.10.158.202] ([213.144.205.82])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a056000010500b0031ddf6cc89csm20014940wrx.98.2023.09.28.14.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Sep 2023 14:11:01 -0700 (PDT)
Message-ID: <c95d672e-1ec1-c901-602c-f472f57b65c3@redhat.com>
Date: Thu, 28 Sep 2023 23:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for One Mix 2S
To: Kai Uwe Broulik <foss-linux@broulik.de>, linux-kernel@vger.kernel.org
References: <20230928193558.2228730-1-foss-linux@broulik.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230928193558.2228730-1-foss-linux@broulik.de>
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/28/23 21:35, Kai Uwe Broulik wrote:
> The One Mix 2S is a mini laptop with a 1200x1920 portrait screen
> mounted in a landscape oriented clamshell case. Because of the too
> generic DMI strings this entry is also doing bios-date matching.
> 
> Signed-off-by: Kai Uwe Broulik <foss-linux@broulik.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

drm-misc maintainers, I'm currently traveling can
one of you push this to drm-misc-fixes please?

Regards,

Hans




> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 0cb646cb04ee..cc9a9099faaf 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -38,6 +38,14 @@ static const struct drm_dmi_panel_orientation_data gpd_micropc = {
>  	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>  };
>  
> +static const struct drm_dmi_panel_orientation_data gpd_onemix2s = {
> +	.width = 1200,
> +	.height = 1920,
> +	.bios_dates = (const char * const []){ "03/04/2019",
> +		NULL },
> +	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
> +};
> +
>  static const struct drm_dmi_panel_orientation_data gpd_pocket = {
>  	.width = 1200,
>  	.height = 1920,
> @@ -401,6 +409,14 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LTH17"),
>  		},
>  		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* One Mix 2S (generic strings, also match on bios date) */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Default string"),
> +		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Default string"),
> +		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
> +		},
> +		.driver_data = (void *)&gpd_onemix2s,
>  	},
>  	{}
>  };

