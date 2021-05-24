Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B802038F3EC
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 21:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8016E92B;
	Mon, 24 May 2021 19:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF696E92B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 19:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621886252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iSZbqBpwXxhRxgLalbxYi9DG9zLeoxjojz5l6OSoZKg=;
 b=TIuYikGJr54IzcpvsyLbZ5aMSxFt6ZsZZjm1ntOo6zNSUcmNAWoSNXYwPXzLGiDNuGxNy1
 vtTRwWwMLulrjOPp8p4EhhvLcVj8/XlG7/XXmJoCmXD7r9gRypseWoL6SFUmZY9PsKgn8M
 yLRHJt6zsgjgyfFkVUQDjSdfnirO0iY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-699hlR5_NVywv9IwRM25Ig-1; Mon, 24 May 2021 15:57:30 -0400
X-MC-Unique: 699hlR5_NVywv9IwRM25Ig-1
Received: by mail-ed1-f70.google.com with SMTP id
 c21-20020a0564021015b029038c3f08ce5aso16245043edu.18
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 12:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iSZbqBpwXxhRxgLalbxYi9DG9zLeoxjojz5l6OSoZKg=;
 b=qDMQ28N9CtjioXlegd5QROdT0us8T73BmcX67mSgETrZu6vy/zqcmJyVqwTBnpVQHv
 jRr5jNwZPL6tg9Bqtm0WU0deVkiuLxXb0WKMnT7BeIF1CX+jJCXKgrPsDO7rfFGXcI8P
 l0E3Erj01QjtSICyWvBdNcj1yYlwRiWdAzeUnxLsJUEuIQvsE/CcYgz1eUlFxRSSie8x
 MqRdjRe/dMVAYKhiBo0zskLhQ1mBW1RqHnK5WUEdSYlIssjWEOKyXGZSg+FnZhf/Km/J
 h8yclDk7QWFUT2wtel/lt8XpltI28H+WSRbvPYJNwr6kpn7DIdKFalxUln6mlUS8INnh
 injw==
X-Gm-Message-State: AOAM531pbmGjAthE98E5EEqQETIeY+XKa2BGQkF1y0x2z51bdoUVS3zi
 D6f+vN/S6TRFdvcAOM40nyI78mU3zLvRU/w5pqFVIybQfPs8KnSISoed/H2tUCuPXRDnv0FLC3T
 Rs++lN8sbeA/d49BOuVlPUjItkQ84
X-Received: by 2002:a17:906:4d44:: with SMTP id
 b4mr24292637ejv.306.1621886248865; 
 Mon, 24 May 2021 12:57:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzK+tcRFYU+sXHbKBxIQgCyBgNZwT9ySuAlJOtYI8S1JxeVk5KtR+1KzJxvVjQawHxZreQUvg==
X-Received: by 2002:a17:906:4d44:: with SMTP id
 b4mr24292624ejv.306.1621886248693; 
 Mon, 24 May 2021 12:57:28 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id n12sm10005648edr.84.2021.05.24.12.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 12:57:28 -0700 (PDT)
Subject: Re: [PATCH 3/3] drm: Add orientation quirk for GPD Win Max
To: Anisse Astier <anisse@astier.eu>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210524164719.6588-1-anisse@astier.eu>
 <20210524164719.6588-4-anisse@astier.eu>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8d9bc4b3-1b4e-670d-5170-3112c566841d@redhat.com>
Date: Mon, 24 May 2021 21:57:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210524164719.6588-4-anisse@astier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Jani Nikula <jani.nikula@intel.com>, Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/24/21 6:47 PM, Anisse Astier wrote:
> Panel is 800x1280, but mounted on a laptop form factor, sideways.
> 
> Signed-off-by: Anisse Astier <anisse@astier.eu>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index f6bdec7fa925..3c3f4ed89173 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -148,6 +148,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MicroPC"),
>  		},
>  		.driver_data = (void *)&lcd720x1280_rightside_up,
> +	}, {	/* GPD Win Max */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1619-01"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_rightside_up,
>  	}, {	/*
>  		 * GPD Pocket, note that the the DMI data is less generic then
>  		 * it seems, devices with a board-vendor of "AMI Corporation"
> 

