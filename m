Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EA9A6469C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 10:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0FE10E3CB;
	Mon, 17 Mar 2025 09:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ct5qDh/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646DF10E3CB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 09:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742202514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OUxnWcopxnoAhgCDsSFoLxlEg/lKC1XzCkjkry+Y1ZU=;
 b=ct5qDh/JSX7PdWrP967/2nsL6yi1xBRNtzz7Dn2OWonwCKQfHRNDsfRU3RE5T0SEtc7CV7
 JopwsDOrLMiKaepOXvVPKPHYtoMOw/STsWfKsBFP8Ag+AYj7upm12PGA2pIuhIVnfJXIXO
 Yh6NXQudx10DUIsuCL5ubngtg2lF5oM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-xLCnGb18Neemcfh0GKDwxg-1; Mon, 17 Mar 2025 05:08:32 -0400
X-MC-Unique: xLCnGb18Neemcfh0GKDwxg-1
X-Mimecast-MFC-AGG-ID: xLCnGb18Neemcfh0GKDwxg_1742202512
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ac2db121f95so339562866b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 02:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742202512; x=1742807312;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OUxnWcopxnoAhgCDsSFoLxlEg/lKC1XzCkjkry+Y1ZU=;
 b=lm4vovJixWZUpQTN6SvJqcUhro/5TI0BMHarYCpx9FFL77NDFjxS3UuApxjz9qR1pR
 XBrRUQkbUX1Vw//SF//9fopU9FEb3bhmOonkNOBY+pUuMro+U1JnukFNgrQzYv7s5tJ6
 Plq/O4xpS/LYEr9R5GqZadXtBCXf33PuRHokm7VC8JRAmkhNibRU8Ydcnfwa6RVty7Cp
 Xbl55+IDkJGU53JaNsTXpOOtkuvvJKkfaP3y2OzwrT6liAHdmWmgG2xU9qa68604iUJu
 1vSfNOFiiYtM8lakRZ26bw+FfNnEBCL9LSSuTBxN71m2VFCjdsl8IONKjlYGPjQN8cep
 zZTg==
X-Gm-Message-State: AOJu0YzhtOaCL6lXMdPo9nUoG8gtCiv3kwkZjxDsmqlCrHKRaw/5z3qC
 +f0+6oTt6W3djouvXXLGz/Wptveh0O53jeemgfvMoglxotx68f0q/j6HbllMe1lPfgbP5gMJPb6
 AJawxNTA2oOYT7SvLTpFphR4o/YGFpKgOhpvjzUAAEYWmeZrgI7tQdkDcPoHQBqP9+A==
X-Gm-Gg: ASbGncsEzEjKj+QJpqZDLb89U9BDPkhY9RVmr4YYzHRrLzJM+UiueT8TdSUzflix5CK
 nPOS54RZ1M+8bTtjoqZZQ52hmRMjSol/utzd3DnHP+e3OmbimzY/MVwqDwvkmR6YTp/o3bSkNhv
 c66hpzfImnym1CjRECkiF4G2oBpn/Go5ZnHm6zm3/C9ZrXsxrySRaw+DeyXxajvlhreQPDZ1wuw
 EG4fhv3CzDm6M+Di68C5tGJ9Y2Nhi6E3N7p39gS2qezyMGumKimh3f/WCOBRdmpsSw8pMKxYqVw
 lHKhYhnKHs2glKSBpsw=
X-Received: by 2002:a17:907:6ea9:b0:ac2:e2bf:d437 with SMTP id
 a640c23a62f3a-ac3303defb7mr1289819066b.52.1742202511685; 
 Mon, 17 Mar 2025 02:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmMlwZG7U70Z6pyeZp1t0JdJ780owI88UMoZl46g79qE+kJtjGHcJF7BeCcZnIxxakzcQWHQ==
X-Received: by 2002:a17:907:6ea9:b0:ac2:e2bf:d437 with SMTP id
 a640c23a62f3a-ac3303defb7mr1289816766b.52.1742202511336; 
 Mon, 17 Mar 2025 02:08:31 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aea1fsm625177366b.22.2025.03.17.02.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 02:08:30 -0700 (PDT)
Message-ID: <77079344-5355-4595-a56c-26bf2e39e52c@redhat.com>
Date: Mon, 17 Mar 2025 10:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm: panel-orientation-quirks: Add OneXPlayer X1 AMD
 and Intel quirk
To: Antheas Kapenekakis <lkml@antheas.dev>, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
References: <20250222164321.181340-1-lkml@antheas.dev>
 <20250222164321.181340-2-lkml@antheas.dev>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250222164321.181340-2-lkml@antheas.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DrNrwYpsb9joeDBroRXaXLLW0kP4RZEvE9UjX1E3pvE_1742202512
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
> The OneXPlayer X1 series features a 2k 10.95 display with a portrait
> orientation. Add a quirk to set the panel orientation to portrait mode
> to both the Intel and AMD variants.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 4a73821b81f6..17b4f57d64d7 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -443,6 +443,24 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
>  		},
>  		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OneXPlayer X1 AMD */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 A"),
> +		},
> +		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OneXPlayer X1 AMD Strix Point */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1Pro"),
> +		},
> +		.driver_data = (void *)&lcd1600x2560_leftside_up,
> +	}, {	/* OneXPlayer X1 Intel */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 i"),
> +		},
> +		.driver_data = (void *)&lcd1600x2560_leftside_up,
>  	}, {	/* OrangePi Neo */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),

