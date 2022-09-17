Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36F75BB85B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 15:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EB310E39B;
	Sat, 17 Sep 2022 13:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C6410E36B
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 13:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663419860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IB1HQdme8YEeD8Kj1n47Nas4fnkU0luDWqOLkZyPEI8=;
 b=UDhaA6vtQ241d/LQWj8VbVK/i9+dQ2HG3xygCnOYAVMFkrVCa8MTxp7XzOwfADKMWMDutn
 mvPWvgkjQbX6uXrScRvL71FZ/2qGjyKvBBNdPCJtUGLC0UC+Ljwy2Gqic058Qy3yrHDcrV
 /ce/ydkoqZapjQxhFz67WsbnNai/M1I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-63-Ga5fAYIkOCKtg13H7JsP5A-1; Sat, 17 Sep 2022 09:04:18 -0400
X-MC-Unique: Ga5fAYIkOCKtg13H7JsP5A-1
Received: by mail-ed1-f71.google.com with SMTP id
 e15-20020a056402190f00b0044f41e776a0so16803813edz.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 06:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IB1HQdme8YEeD8Kj1n47Nas4fnkU0luDWqOLkZyPEI8=;
 b=b/b+JrhaT0pR5moimeyIBf/iiHyQkxlnLGhQtc1aibcW6FRUWPiavgXvjeTVoJkZ6L
 5iy0/OEKNhSGug2yIdsjV94t/NG2zPDj0fKgaIAc8Gkr0elomxDqo09qxUyTx6BB+mIm
 /Ttz6fXcFMhwEy9bhwgdusnLZkYDwe+LXc8mYO+udNfOy0t8tR/yFiVIs9ghJV2vCAdP
 dP6pi/rl5Iz5hRALJQ995IS0jr9pl6ziVrexCz20+lC5X+rK/+XRGkGNcN/eCnEsV0rU
 tswUBCQojJasVqhGBKFGvdUKp3/DXyCeDndh9n93Ulwf5lIOdgzuJb6V/lBUNi5ERv6h
 hZkg==
X-Gm-Message-State: ACrzQf3GWDgzFlW+PwiNoPNOn9GU4ygXWkd6YVrtgef5WgQ9hRI3lJjx
 BfxFazrZIdWK4Ey1pVxnDJFu3P2onSErMtHPcqUSLHeF/bRVfiNpHDCt+xZodtMeZsXYzuOuD1v
 8cMKYS/QWH0yEn7e1YE9on3KvYS9B
X-Received: by 2002:a17:907:2bdd:b0:77d:e0f3:81e5 with SMTP id
 gv29-20020a1709072bdd00b0077de0f381e5mr6715848ejc.328.1663419857336; 
 Sat, 17 Sep 2022 06:04:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5DA5wCcsH5iDV6cyNETXig/uwsG/BWf9W8xSsm4akO2vs30QZ2677QvL2RXV5XAdhbL/QNsA==
X-Received: by 2002:a17:907:2bdd:b0:77d:e0f3:81e5 with SMTP id
 gv29-20020a1709072bdd00b0077de0f381e5mr6715837ejc.328.1663419857180; 
 Sat, 17 Sep 2022 06:04:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b0071cbc7487e1sm12079684eje.69.2022.09.17.06.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 06:04:16 -0700 (PDT)
Message-ID: <4e145e1d-db9a-0edb-cdd4-1da3e02131fd@redhat.com>
Date: Sat, 17 Sep 2022 15:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Anbernic
 Win600
To: Maccraft123 <maccraft123mc@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220803182402.1217293-1-maccraft123mc@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220803182402.1217293-1-maccraft123mc@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 8/3/22 20:24, Maccraft123 wrote:
> From: Maya Matuszczyk <maccraft123mc@gmail.com>
> 
> This device is another x86 gaming handheld, and as (hopefully) there is
> only one set of DMI IDs it's using DMI_EXACT_MATCH
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>

Thanks I have added this patch to my local drm-misc-next branch.

I will push this out to the official drm-misc-next branch after
running some local tests.

(unfortunately it is too late now to push this to drm-misc-fixes
for this cycle, sorry).

Regards,

Hans



> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index d4e0f2e85548..a8681610ede7 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -128,6 +128,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "One S1003"),
>  		},
>  		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* Anbernic Win600 */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Anbernic"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Win600"),
> +		},
> +		.driver_data = (void *)&lcd720x1280_rightside_up,
>  	}, {	/* Asus T100HA */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),

