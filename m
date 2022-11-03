Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 819D9617C07
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 12:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DE910E5E3;
	Thu,  3 Nov 2022 11:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE6510E5D9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 11:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667476620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xUsslBgfioG7+iWyattqFfLmG0F1gkOA/LUNlKDCuUE=;
 b=AA+v/mC3NlIRz9QI9wTP9DqGSbJdMpHkdWxm0LzyQhkjUcTVUff9e5gjdFl5rr5ofdDpOw
 2z5KN5HVw00vls0CZcJNo37z9mZbMyUW4rx1kUKQqkgi3plIP83OA6Y1N56q1ZudCtg5GG
 ub5aLO/HyFPmaC+9C4g8wVV3axN6K/U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-5hQimdWUP92jFmARmgBd1A-1; Thu, 03 Nov 2022 07:56:59 -0400
X-MC-Unique: 5hQimdWUP92jFmARmgBd1A-1
Received: by mail-wm1-f69.google.com with SMTP id
 p14-20020a05600c204e00b003cf4cce4da5so390690wmg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 04:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xUsslBgfioG7+iWyattqFfLmG0F1gkOA/LUNlKDCuUE=;
 b=gajTP7OjyB7sWWNPkQbhL/QFqpPHjUAyKLztPkbTwyK0D8uH57bnd5YXVL02gluXa9
 4KT0WwHyaTIbduoQ/jNqlk446Oe51Ya5nuEKQaWkzq9y7UZkNbddWBU/eIiY4DAc98UI
 +/v/siFSSpnIEsNFYQGRwDBPou9S5VH/n4en0TKTgU79W4plizFkjwG3rvH+6K4WYhS2
 hC2HVkPG9oxKCHFGQBVFN/p0tAs7Hu+RIdN47gExKjIp9yOoBYxN9jwUWO23OGZHeiIe
 W6BwUG9GmH52mQl+ovlkEq62bo8gGd08EIgWSgf5oUdbAOS3qpQ41EPi8Mnsav7E8QmX
 LtRg==
X-Gm-Message-State: ACrzQf0x6iLpji6Bc3MWnKiZHenegp+EscV9yiXvWhekb+S9bluyJZUH
 z4oE9sQVL/25LceGUmMA/FxaXKIpXNl/3Rx9wwv0QiACXknh3dMnvJObe4LnDgIazS/NBTp8i6X
 hoIEcDObsPrbUi83b+ftvfOJSOmK5
X-Received: by 2002:a05:600c:5563:b0:3cf:857e:18c0 with SMTP id
 ja3-20020a05600c556300b003cf857e18c0mr6148486wmb.24.1667476618222; 
 Thu, 03 Nov 2022 04:56:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6jlojoGO8BlWc+DQVkk3s3r1Mp7Cu2UjhVDtTHUEWmRy034Ohm8DlDf7vSROFbjktagpDy0w==
X-Received: by 2002:a05:600c:5563:b0:3cf:857e:18c0 with SMTP id
 ja3-20020a05600c556300b003cf857e18c0mr6148473wmb.24.1667476617980; 
 Thu, 03 Nov 2022 04:56:57 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l12-20020a1c790c000000b003c5571c27a1sm1145704wme.32.2022.11.03.04.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 04:56:57 -0700 (PDT)
Message-ID: <88d5165b-1825-3a71-c8c0-dd5a99cd8bf6@redhat.com>
Date: Thu, 3 Nov 2022 12:56:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm: rcar_du: DRM_RCAR_DU optionally depends on
 RCAR_MIPI_DSI
From: Javier Martinez Canillas <javierm@redhat.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20221018181828.19528-1-rdunlap@infradead.org>
 <a68a24a0-eda3-8711-21c1-334289eca0d3@infradead.org>
 <166747314442.3962897.9754510086268412956@Monstersaurus>
 <c9064cc6-2a9d-1094-53fb-cf56f9cbf191@redhat.com>
In-Reply-To: <c9064cc6-2a9d-1094-53fb-cf56f9cbf191@redhat.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/3/22 12:53, Javier Martinez Canillas wrote:

[...]

>>
> 
> What this Kconfig expression is saying is that it depends on DRM_RCAR_MIPI_DSI=y
> if DRM_RCAR_DU=y and DRM_RCAR_MIPI_DSI=m if DRM_RCAR_DU=m. But that the it can

It should had been s/and/or here but you get the idea.

> also be satisfied if is not set DRM_RCAR_MIPI_DSI.
> 
> This is usually used to make sure that you don't end with a configuration where
> DRM_RCAR_MIPI_DSI=y and DRM_RCAR_DU=m or DRM_RCAR_MIPI_DSI=m and DRM_RCAR_DU=y.
> 
> Randy, I think that it's more idiomatic though to it express as following:
> 
> depends on DRM_RCAR_MIPI_DSI || !DRM_RCAR_MIPI_DSI
> 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

