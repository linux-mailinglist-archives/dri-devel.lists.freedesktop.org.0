Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45BA646CC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 10:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A9910E3CF;
	Mon, 17 Mar 2025 09:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c2dt3s+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E9810E3CF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 09:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742202933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIAAOpiRs4TxQJqO3H8zMcg5EqmQaISUPGVnUqQhVH0=;
 b=c2dt3s+9CJ8JD0FKht79XpudQlWYdxowsLdrt+1Dfg1CwLZkNLvlwiAEZWU7AWrbv3ImDI
 WGs3Iq8LVhDXbRaK/NuLJZN8mt6cYj+G+ajrPt8q3f4wqoma5Gvpw/yfUIywoM6o9CUZtt
 uv45L6VCL09SIWD+J6FYeokuuo5ksFg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-Ij617HyUPtWScPzc1zjIXw-1; Mon, 17 Mar 2025 05:15:32 -0400
X-MC-Unique: Ij617HyUPtWScPzc1zjIXw-1
X-Mimecast-MFC-AGG-ID: Ij617HyUPtWScPzc1zjIXw_1742202931
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ac218738618so350829166b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 02:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742202931; x=1742807731;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iIAAOpiRs4TxQJqO3H8zMcg5EqmQaISUPGVnUqQhVH0=;
 b=RMNel6sfuCS7gkdkHK+lHBEIh7mcTUskYbl2iUPqK5Fu+aY4Vwz1VCNZ47D+hCOLiQ
 joJNVMbpoEK7k6jzXSYbgmLJoHEEnK75m4TWwMHEZBSMxGmm0/ZuegSy5rLH0z9oHO7n
 +4P93Gfdfv+1fn6Yk3Kpi9DXhI+meSlVWVOZXygkoCu9ZEE8AbamRFtAdIlvBU8nSwjX
 DBNGOzRzRKDjXsdAprGuj7pBm8zevnr1NtLKANYHbQcxbiC7Ic8OWKayaJTI3B8VU0Lz
 C0hO1DU0ZkRYbfXWOqdEyzlgBm9gRVzGXjFQ4UcwQ994E7phOaRh0p326jxHhsZWnHF2
 2tuA==
X-Gm-Message-State: AOJu0Yw3RjLSKdCziYQD1lKTIhnS4TfaSqUip48tChukiKNy9Fulv2eh
 7+NHzjtQMQbcZF8+uQtRyr2cUj6RvgWxEek1SgAzMzu5GWSjJB/+hxJF7Qa7B7VhA+fi5V/c7bn
 29kkbgMi9ndtpJr8B0Wjrfvbx01wEE/s57R5lwBHg4u0mw4GaRnpphvNFziqp+joGZg==
X-Gm-Gg: ASbGncvLwsuB0mQvA0EDLNSKJvQ0RQHSmA/2HKPavRZXMjXoAY3AcitOrB1I8kC5y6Z
 wBUW8fnCSd6YXa/8Yno0PmM44O0YguXRkgFfeC9OPJwclRlbicey9K1NWw+A1bFYoWvF5Xf5WoW
 qAZrpr0aOHG6QQ9jqWKlBMc6Gmz1R6mZyLB2XF1t4uwk/TZqSbrp7x8oF4kyNmGv6uqmdD4XDiu
 EcI9sS2m4UaGOLQSROsVVkCfan+D1cOYOFr3nRkciCrChP/Hma85vD7xIheWZQJ3o75cxYWQjFG
 f+SevO9WsRn9VSTKqLw=
X-Received: by 2002:a17:907:6ea9:b0:abf:4da0:28e3 with SMTP id
 a640c23a62f3a-ac330263cd0mr1145881466b.18.1742202930787; 
 Mon, 17 Mar 2025 02:15:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVgEQXboyYbKmNrxQ7JHNVXHwE52bzpv/usHr3Z/ihOWkRD9dFEsRbbwPj02jUfIcYiqzTjQ==
X-Received: by 2002:a17:907:6ea9:b0:abf:4da0:28e3 with SMTP id
 a640c23a62f3a-ac330263cd0mr1145879566b.18.1742202930421; 
 Mon, 17 Mar 2025 02:15:30 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a9d12fsm627043366b.163.2025.03.17.02.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 02:15:29 -0700 (PDT)
Message-ID: <bce3cdbf-2056-4735-9c6e-d67e0cd1dcd4@redhat.com>
Date: Mon, 17 Mar 2025 10:15:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm: panel-orientation-quirks: Add OneXPlayer F1Pro
 quirk
To: Antheas Kapenekakis <lkml@antheas.dev>, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
References: <20250222164321.181340-1-lkml@antheas.dev>
 <20250222164321.181340-4-lkml@antheas.dev>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250222164321.181340-4-lkml@antheas.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0a2vCOVPtxZW-r3Yj-XXcwktXmYc3DaIULmuobAd-y8_1742202931
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
> The OneXPlayer F1Pro has a 144hz 1920x1080 portrait OLED panel.
> Add a quirk to correct the panel portrait orientation. In addition,
> it comes with a red limited edition variant in the Chinese market,
> so add that as well.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

drm-misc maintainers, I'm dealing with a huge backlog of
patch-review, bugs and other work.

So I would appreciate it if one of you can merge patches 1-3
into drm-misc.

Regards,

Hans

> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 1378690b7287..f08cdc81dd9a 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -467,6 +467,18 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 mini"),
>  		},
>  		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OneXPlayer OneXFly F1 Pro (OLED) */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1Pro"),
> +		},
> +		.driver_data = (void *)&lcd1080x1920_leftside_up,
> +	}, {	/* OneXPlayer OneXFly F1 Pro (OLED) LE Red variant */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 EVA-02"),
> +		},
> +		.driver_data = (void *)&lcd1080x1920_leftside_up,
>  	}, {	/* OrangePi Neo */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),

