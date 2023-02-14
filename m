Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F536696ABC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF8F10E19C;
	Tue, 14 Feb 2023 17:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9DB10E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 17:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676394251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQf7VF++vsEYE28OfwY6QsjnITCWGcvqO+/D4YLkQ1s=;
 b=DivQ3ZR4R9NvsONlXdRwmx6H9/6xB1423DYk/bqyqXXIdXrb51+rxggknzG9rmE4o1dAQE
 2xvVCUy5C2nIQbQbPC2EptbRWGjkK6U66t79ney/oylcgoWlqjAftoVYDd2O/0iQH2XBpe
 C/i4Hnkt/8n4lL8f/hqZ95jFceTx1No=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-192-SxE31NntNRKmmzdc8WauuA-1; Tue, 14 Feb 2023 12:04:10 -0500
X-MC-Unique: SxE31NntNRKmmzdc8WauuA-1
Received: by mail-ej1-f69.google.com with SMTP id
 jo5-20020a170906f6c500b008b133fc52e9so1247702ejb.22
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 09:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QQf7VF++vsEYE28OfwY6QsjnITCWGcvqO+/D4YLkQ1s=;
 b=SE+jAUJuZ5YvJot0TKcBDyKrLgmQrvd0uiyzG/lVxwFC4eUMiR6z7nRnD1Sc23+BVi
 9D0JwYiMIWeb5o5J4w0SbldvKRbEqW+3VLeYmxbp3jFXw7v4hJl5vkxk/SsaDJfrrCEl
 Qe9hUfy0PNDnEay1Q6PGfNsRd2jYcBKoQ76+b5JeiLt+KdffSfTeJTfbMOdbmhOUq/WH
 59L3CrPby2VO7hRValbGXO3SYwes0nImqhphMXo7oLCAugkLwHUMpPT9vTto/agjqGkr
 vyf7S5KcJiHMolz9ZgIVHsEdtCG58PTTv/YljZm6mJd1xXrS19TFTcS4p26+JERL9Pj6
 L8Ow==
X-Gm-Message-State: AO0yUKU0naN1lz/WNRKlYQtBtvhpunEkVkoSPnFYQxf4ObLUhGeOvsDS
 p6YRbLk1aKXqOxeNY+touyonKgJNcOQ9TcZuH5MzEIGORUPS2bGjcViRs5wUkBLJfJI7iWmXIzA
 jS/u64ekXSGZR6t3/DUDwIgRd7gWMeMDirg==
X-Received: by 2002:a17:907:7245:b0:8a5:8620:575 with SMTP id
 ds5-20020a170907724500b008a586200575mr4804849ejc.3.1676394248950; 
 Tue, 14 Feb 2023 09:04:08 -0800 (PST)
X-Google-Smtp-Source: AK7set+G6WS93XgxWiIeKYx2w4Em0RKnVWkiSBf5oy07lrp1mrtPM4oYEu01H+nw77Je+MgddziRXw==
X-Received: by 2002:a17:907:7245:b0:8a5:8620:575 with SMTP id
 ds5-20020a170907724500b008a586200575mr4804826ejc.3.1676394248702; 
 Tue, 14 Feb 2023 09:04:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6?
 (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a170906154400b00882f9130eb3sm8363496ejd.223.2023.02.14.09.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 09:04:08 -0800 (PST)
Message-ID: <6c6cbc45-54af-d90c-0f54-eeb350e5e4ee@redhat.com>
Date: Tue, 14 Feb 2023 18:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] drm: panel-orientation-quirks: Add quirk for Lenovo
 IdeaPad Duet 3 10IGL5
To: Darrell Kavanagh <darrell.kavanagh@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230214164659.3583-1-darrell.kavanagh@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230214164659.3583-1-darrell.kavanagh@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/14/23 17:46, Darrell Kavanagh wrote:
> Another Lenovo convertable where the panel is installed landscape but is
> reported to the kernel as portrait.
> 
> Signed-off-by: Darrell Kavanagh <darrell.kavanagh@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Note for other developers the reason this is v2 is to
fix various code-style / submission process issues with v1,
there are no functional changes.

Regards,

Hans

> 
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index b409fe256fd0..5522d610c5cf 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -322,6 +322,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGL"),
>  		},
>  		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* Lenovo IdeaPad Duet 3 10IGL5 */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IGL5"),
> +		},
> +		.driver_data = (void *)&lcd1200x1920_rightside_up,
>  	}, {	/* Lenovo Yoga Book X90F / X91F / X91L */
>  		.matches = {
>  		  /* Non exact match to match all versions */

