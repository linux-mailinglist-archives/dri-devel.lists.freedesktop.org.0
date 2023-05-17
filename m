Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D4B7064FB
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 12:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6564710E3DB;
	Wed, 17 May 2023 10:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2E510E3DB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 10:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684318695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VO8kS0tlMDmjStKGPZ02CpcX5eueZJZ6rX71I8VGfNg=;
 b=ThL9vhalYBBO8id+jor9ijxVM9+9kZbJ7pyZR/o3FuOkSZt1ZnjLvFP3PnFlFzwgEDpv7+
 eSLhI5ZndePkUJ5/Vyr4SB0T77G2Ujf0GgpjuswcDVvugZ4l8ERpZnZKBMdwS5yWW4S+gv
 S93HbnkdnV1GcBjid1hKYdWRt7VqX7A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-yidaV4xVPhK5t0fmdctFaA-1; Wed, 17 May 2023 06:18:14 -0400
X-MC-Unique: yidaV4xVPhK5t0fmdctFaA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50a16ab50e6so628001a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 03:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684318693; x=1686910693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VO8kS0tlMDmjStKGPZ02CpcX5eueZJZ6rX71I8VGfNg=;
 b=AsGJ5KW7QLA96zmcApG10PMcwLx3NVZKHUo7NcTTyFItJqtgUdPx+t5LR0/dRaNBMB
 rPyWVtmpTMN6ncsCFuhQ9BLGjM0YjWGVGqKbGR+knXmeKzhfOLIpWkX7NXgHEyi41XCb
 PfSEWx+wlEHtGoK+DxCoZB3EkhDZjTgEieMsAxfV5YKM+9K3ZtrjELeRpwGUXDGMLIe9
 hvOL0oTm5iNJD6P5QiZS9U5yLur5vaMFfZlYBKqJLPhs/Gq2P0NmI8ae/7tLpiArtq34
 CmRMwunv3WTK46qAwWwM46wySGpThbN6SoaPyKNlwCSJzwjzj/4q8WkKMtWcLHMoyrwL
 rzgg==
X-Gm-Message-State: AC+VfDwqEs2nODgPnk+aIEPBreHOEpFhEgkpNqJd+tvmmk66RBlwlcoT
 FXFReRKzeZSkYYQh1zaZowytOWG7PXWqxI5VluMb3UIXUZQDpxCptThKbrvJeDmBYUs6iRvOTad
 x3oRJ0OqhK1ZI3eRZegwKqdQmqjm+
X-Received: by 2002:aa7:d8c7:0:b0:50b:c4fb:770f with SMTP id
 k7-20020aa7d8c7000000b0050bc4fb770fmr1555037eds.34.1684318693041; 
 Wed, 17 May 2023 03:18:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4N949aPI7PbDK1bzrwrLZKfDGBjlleUFDD3GoCm+EHJRnE4sQd5PiK68L7e9P5jJuHW2iMPQ==
X-Received: by 2002:aa7:d8c7:0:b0:50b:c4fb:770f with SMTP id
 k7-20020aa7d8c7000000b0050bc4fb770fmr1555016eds.34.1684318692692; 
 Wed, 17 May 2023 03:18:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 t21-20020aa7d715000000b0050bc041d2a8sm8956601edq.15.2023.05.17.03.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 03:18:12 -0700 (PDT)
Message-ID: <b3175daa-956b-9311-d209-e5837dd3de2e@redhat.com>
Date: Wed, 17 May 2023 12:18:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm: panel-orientation-quirks: Change Air's quirk to
 support Air Plus
To: Maya Matuszczyk <maccraft123mc@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230515184843.1552612-1-maccraft123mc@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230515184843.1552612-1-maccraft123mc@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/15/23 20:48, Maya Matuszczyk wrote:
> It turned out that Aya Neo Air Plus had a different board name than
> expected.
> This patch changes Aya Neo Air's quirk to account for that, as both
> devices share "Air" in DMI product name.
> 
> Tested on Air claiming to be an Air Pro, and on Air Plus.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I have just pushed this to drm-misc-fixes, so it should get
send to Linus with the next drm-fixes pull-req.

Regards,

Hans




> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index b1a38e6ce2f8..0cb646cb04ee 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -179,7 +179,7 @@ static const struct dmi_system_id orientation_data[] = {
>  	}, {	/* AYA NEO AIR */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
> -		  DMI_MATCH(DMI_BOARD_NAME, "AIR"),
> +		  DMI_MATCH(DMI_PRODUCT_NAME, "AIR"),
>  		},
>  		.driver_data = (void *)&lcd1080x1920_leftside_up,
>  	}, {	/* AYA NEO NEXT */

