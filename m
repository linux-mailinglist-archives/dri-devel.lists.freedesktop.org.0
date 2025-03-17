Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5FBA646A5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 10:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7FF10E0ED;
	Mon, 17 Mar 2025 09:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MZyXHxD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000E210E0ED
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 09:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742202570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bww8JOfOpzHjN4KnEpLdpIzThEx7K4HigFEfHRKZmPk=;
 b=MZyXHxD5Lk08gm8DibmNOYPJZoOiabAFypR1AR/GkdM1mTYis/1bX6fWVLxtRDFbz3bhox
 tzJtBTNEHzPFM0X4HmlzqwnDlVCXbT3cwCTqFomkVToB0wptphPasm/xcz0+FoElLrP3n5
 1GEw6Q2GCyORpuqHWGDMRK+hEWfS/6g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-bBuZHAq-MfyAKV9xYcpPsg-1; Mon, 17 Mar 2025 05:09:23 -0400
X-MC-Unique: bBuZHAq-MfyAKV9xYcpPsg-1
X-Mimecast-MFC-AGG-ID: bBuZHAq-MfyAKV9xYcpPsg_1742202562
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5d9e4d33f04so3580420a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 02:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742202562; x=1742807362;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bww8JOfOpzHjN4KnEpLdpIzThEx7K4HigFEfHRKZmPk=;
 b=tuOeSLx1Lp392aavPFjp37thwWTfg/zBODE+4CiBq174wNI5nA4hmuhdu295V4RAHM
 l0dK6Ply5wlTZb2o2bZ24t26S9sLHcZjmmxv6/xkaCDOEtJIqBom7ed8rElmJx3apkuf
 AvDtQ/lxBiVoTd3UaJQPx/Azh0oWNFVwpPLNQyZHfftKmhxGU6nFcCzvI5yjTwLtnSfF
 SsiYI6z2N9NY/szm/Pu5ac1+U6luhd6qlHZuJ/j2oK2vJDQ6evaKnEGG1d1h/C/R1f/m
 jUcbIpYbBUep0t9Le/hXuoGHnASsKFceIQh9kXZZqFjXflL0oMsM8S/2PC75ftNU1cfc
 6YRg==
X-Gm-Message-State: AOJu0YxhjlaAuajPbmlmx0hqEWy9Fn5UBTmgtz5aj62mp0boz/KR9X6i
 RlQQiVrBVzFAs27OHT0CekRj4QCA3kTf9B6wyQnAAXAlAHvlI7qXExcgWIqSJ12ESm5JA3pbdyP
 X2vBcwGfPvZQhDR869Pt38M3/XHSPBBimkRvNDt2xt1S5u2n8qp2g4gi7E3b4hWgR5w==
X-Gm-Gg: ASbGnctZdeL51I2Q8jAH57Rx0ahdLayoAFvmew9MTfTTtGWZeFvvi7DHPEzGa6hzH1R
 XXzgno5oLly8NjxpCgEflbaB+lC0YY9cVZ1z4SWolPO0+L5QhZvphqv0Ek2Lqo6dMiAkUaWQ+XC
 i6BvV2tR7iJxDsOEJTLE9lgt/Z/kmP3p9W6atVYj3Mszz5lXjl70osdeGOo76fniTVKIUsBpD/2
 goulIzxCq39QokswWDKmylME8hNhhtMuao449SgYSTedcNBzn6jjdvfc53m4nczXGkHEBk+Mxz5
 /ljD/MhlmKiz1d9C7iw=
X-Received: by 2002:a17:907:7d87:b0:ac3:26fb:f420 with SMTP id
 a640c23a62f3a-ac3303715c9mr1316676566b.42.1742202562176; 
 Mon, 17 Mar 2025 02:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbzLKOvU6u087cvw4eQbB3+jMOWQmFWk87CZXwlrr7X5z5g/l5JBC7ADKxnGSg2zX1KEVA2A==
X-Received: by 2002:a17:907:7d87:b0:ac3:26fb:f420 with SMTP id
 a640c23a62f3a-ac3303715c9mr1316673666b.42.1742202561824; 
 Mon, 17 Mar 2025 02:09:21 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a3d3d7sm634405166b.132.2025.03.17.02.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 02:09:21 -0700 (PDT)
Message-ID: <9ca06bfe-84fc-44fb-bd32-c5914ab553d8@redhat.com>
Date: Mon, 17 Mar 2025 10:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm: panel-orientation-quirks: Add OneXPlayer X1 Mini
 (AMD) quirk
To: Antheas Kapenekakis <lkml@antheas.dev>, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
References: <20250222164321.181340-1-lkml@antheas.dev>
 <20250222164321.181340-3-lkml@antheas.dev>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250222164321.181340-3-lkml@antheas.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VUx_ZSCt8mjToIJicVU61X3i5RScAQ4XkrhNN34Ajvg_1742202562
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 22-Feb-25 17:43, Antheas Kapenekakis wrote:
> The OneXPlayer X1 mini features a 2k 8.8 display with a portrait
> orientation. Add a quirk to set the panel orientation to portrait
> mode. There is no Intel variant.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 17b4f57d64d7..1378690b7287 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -461,6 +461,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 i"),
>  		},
>  		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OneXPlayer X1 mini (AMD) */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 mini"),
> +		},
> +		.driver_data = (void *)&lcd1600x2560_leftside_up,
>  	}, {	/* OrangePi Neo */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),

