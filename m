Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF34589954
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 10:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAD110F578;
	Thu,  4 Aug 2022 08:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEEB10F703
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 08:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659601949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0auJsCK06PWTESW74y0ftQcvvf4/UB9cG0roNrgm6PM=;
 b=HoSfioQLx/TlkONr7r6cptFhNK0B6OCZ/Vh9kyq3+xtcXHPOkPtjQkzQzEVz/UC6qkzael
 tABhLSd/3gRI3WPhNvSxNaX/xWulBxQSRQc1xk7HwLq0BT9723MQrKjz5fimqrBjb54CmO
 y0sGmReaolFQoZhheuPTIiN3HTecOYo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-mRX2S-BHMa2gmv0wmr2VfQ-1; Thu, 04 Aug 2022 04:32:28 -0400
X-MC-Unique: mRX2S-BHMa2gmv0wmr2VfQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 f13-20020a0564021e8d00b00437a2acb543so12549687edf.7
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 01:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0auJsCK06PWTESW74y0ftQcvvf4/UB9cG0roNrgm6PM=;
 b=fnTgkSI1p+dRKjrwrBqhrhMFguPXURRTyz5wHTECCzYraI6psSW5m2Ss0uguciNh52
 aCvKBl1SuWI8PCR6DHzU81ZoqYHDg29ZStNHU3Ga9KQYwWfdel8m1dG/A3OvKk1BGIO7
 rvrFiMCvXC1voBEQu8TD8gnJUtbHe1UUKDaBT2kBnxGhT/rmZzFqWKBewsajpoaYZ/Qb
 shV0q12nsHCRTqcfR+4wqDS2E+ANE0ZR8dSEWhDMIQbgJDmUF6b8o5qULMSb//KtLJCW
 vQB/yWwesZzsF0zVyEU1OK8hkGs6mHpDoIsza3XsukE44YPqR41kDZYha+Kxm34kv022
 9gKg==
X-Gm-Message-State: ACgBeo2ZTsndM24SeiWHotUUyEUtGZkdjenEOcVjuOFJ60u9TAQhwuqw
 q3roQqe7AmK95m0II7B2AhCtJ883ccB0EJdk2QqbcCcQ3RByn0ml/z1LeDbPPeyK5oC88Yc9+42
 d9gY/Hf52/9PVdM4ivldqdQuKhY9e
X-Received: by 2002:a05:6402:4381:b0:43b:cb55:ae3c with SMTP id
 o1-20020a056402438100b0043bcb55ae3cmr889701edc.45.1659601947647; 
 Thu, 04 Aug 2022 01:32:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ftOGy44vO+4n3LYxeMS36KALCYj0N9kx8p1IMh8cFSJwJS1ngCJxRjXd3sz+0KKmEt8qqMA==
X-Received: by 2002:a05:6402:4381:b0:43b:cb55:ae3c with SMTP id
 o1-20020a056402438100b0043bcb55ae3cmr889679edc.45.1659601947436; 
 Thu, 04 Aug 2022 01:32:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a1709063db200b00726c0e63b94sm112530ejh.27.2022.08.04.01.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 01:32:26 -0700 (PDT)
Message-ID: <d24e781c-3c84-26eb-14b9-8cb4ea3b32ba@redhat.com>
Date: Thu, 4 Aug 2022 10:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
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

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Since we are currently in the middle of the merge window
and this patch needs to go to a -fixes branch I'm not quite
sure how to handle this.

Hopefully one of the drm-misc maintainers can pick this
up (once rc1 is out?) .

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

