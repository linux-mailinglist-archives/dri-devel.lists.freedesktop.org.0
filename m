Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 325385BB857
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 15:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7FE10E35A;
	Sat, 17 Sep 2022 13:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5986C10E35A
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 13:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663419809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WFKTAY2KdmvVhG4mVk5ksHM9On8VSZSUeVOe+Zo5PYw=;
 b=HwLSgwFgnoc3Wqsq4uBAvG8yH83cdh8/iYiphyn+x+XMHMzaR5Pd/X3MnlV0KmVlknqrXc
 HWVxzXoLrvU6z5ULygKZY8swps6cyKSApM0GgWsQageZmGzUD8J+OJhIj7+jIKy2pQcik+
 EkBCYI4/wXY78iD4SnSlLcTFKiPsOyU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-228-NPUoWWg-P--lFMH8S7sJuA-1; Sat, 17 Sep 2022 09:03:28 -0400
X-MC-Unique: NPUoWWg-P--lFMH8S7sJuA-1
Received: by mail-ed1-f70.google.com with SMTP id
 f10-20020a0564021e8a00b00451be6582d5so13038282edf.15
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 06:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=WFKTAY2KdmvVhG4mVk5ksHM9On8VSZSUeVOe+Zo5PYw=;
 b=jGfDRhiHcSaD9Tw6eH7BPw2i1yC0C3oZEhEHwsTQiRUslEpdbC1aaZwKqSqzTIlOcx
 j+RUysM9zp3zCdBmXnCmxMfKdqD0K7MHNJqCig4aG+CI/1iTCxXgTqIGyTgue5lZaPYD
 Ocvigs4DiTKSAa+/2EFH90BF/tvaIWE9u6f91mpT3zFiwNshYeq/p1xR/dMc9bhNMneT
 J5J5mS37om8QrIGldPysIw/D+/j0cwtDPca+2Y7cYkfkPVgcmtBPfAnsC5OB5O62t6G6
 WUBxL2RTKWQqXYoIRZ86QXAxDyfkLkzSrJaOBn6kNRT74hHWU3jLhmJCC8jpGgLBhGS8
 3XXw==
X-Gm-Message-State: ACrzQf1+1rrIgKmWoYJfAghXTP7mwP52nc3vqRTwXAk8SQPFx/JmhPEs
 LXTri2fkmEGWMNzUDKqYIprdCYYY1+8PP/W0CoR9mAsqwF+b4pFQJRryH73X+EErGLfLfZCy6y9
 crhg5OXTnq6DvxX7xg9afy7n/6V47
X-Received: by 2002:a05:6402:1a4f:b0:44e:f731:f7d5 with SMTP id
 bf15-20020a0564021a4f00b0044ef731f7d5mr7674567edb.357.1663419806894; 
 Sat, 17 Sep 2022 06:03:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6TW9DUcujFVXamr90lXX/vora3cXH38exH0amphyAyGDcARckDksaj8d4kVVegyUocYnJKGg==
X-Received: by 2002:a05:6402:1a4f:b0:44e:f731:f7d5 with SMTP id
 bf15-20020a0564021a4f00b0044ef731f7d5mr7674555edb.357.1663419806755; 
 Sat, 17 Sep 2022 06:03:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170906364b00b007803cffd31fsm5100377ejb.215.2022.09.17.06.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 06:03:26 -0700 (PDT)
Message-ID: <83c3c020-40e3-3114-ca77-997e0c1d2579@redhat.com>
Date: Sat, 17 Sep 2022 15:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: drm/vboxvideo: fix repeated words in comments
To: Jilin Yuan <yuanjilin@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch
References: <20220824130226.33980-1-yuanjilin@cdjrlc.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220824130226.33980-1-yuanjilin@cdjrlc.com>
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

On 8/24/22 15:02, Jilin Yuan wrote:
> Delete the redundant word 'the'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Thanks I have added this patch to my local drm-misc-next branch.

I will push this out to the official drm-misc-next branch after
running some local tests.

Regards,

Hans



> ---
>  drivers/gpu/drm/vboxvideo/vboxvideo.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vboxvideo.h b/drivers/gpu/drm/vboxvideo/vboxvideo.h
> index a5de40fe1a76..f60d82504da0 100644
> --- a/drivers/gpu/drm/vboxvideo/vboxvideo.h
> +++ b/drivers/gpu/drm/vboxvideo/vboxvideo.h
> @@ -43,7 +43,7 @@
>   * VBE_DISPI_INDEX_VBOX_VIDEO is used to read the configuration information
>   * from the host and issue commands to the host.
>   *
> - * The guest writes the VBE_DISPI_INDEX_VBOX_VIDEO index register, the the
> + * The guest writes the VBE_DISPI_INDEX_VBOX_VIDEO index register, the
>   * following operations with the VBE data register can be performed:
>   *
>   * Operation            Result

