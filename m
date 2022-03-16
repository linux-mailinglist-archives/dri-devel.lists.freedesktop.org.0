Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D811C4DB9A8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 21:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D84310EA4F;
	Wed, 16 Mar 2022 20:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E973710EA54
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 20:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647463586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FfhhJ7yUS0yyFlZxS6rDyNHEgGv69Jd6+/vC86VElHk=;
 b=CoK19oBeFPUCQVw2wBv3WlDRlGgya+fWqyWy8ot/u8sFx+mlqxAEFF/FRkUmIGXWBkmI0+
 W0XhbUu99FqNWyqbh1c/UAsYVfCfCG5CoSCjChqIxRPsKB1boyBrqMC9XySoYC35NdkTsh
 LicvWO6num4jezFUp0jDBNWZse7tgIE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-lWJWLr1QMbWfPMzVg2Pb6g-1; Wed, 16 Mar 2022 16:46:25 -0400
X-MC-Unique: lWJWLr1QMbWfPMzVg2Pb6g-1
Received: by mail-qt1-f198.google.com with SMTP id
 x10-20020ac8700a000000b002c3ef8fc44cso2222763qtm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 13:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=FfhhJ7yUS0yyFlZxS6rDyNHEgGv69Jd6+/vC86VElHk=;
 b=GOejPgixu7vkjrH5KXC5DbgJBLUbZc5IZ+83PKtf9ZNGBEh1XgYP1kruiJH/77Xj/j
 34kVXFkvZgZJYKSIjkOnjBvn+SUJIzQxldEhKZAKXEAsSI2mvrcqdesBZbI90tafThxG
 mMY8noeaenHf95V36aAuZMIJlo6gjUI8KdRenwCBGmV+Wfx/S0Qr+gKjJllppF528pu0
 Ujt1g/ntrKvexjSkpp2f6A043GVusBvz2WenHQjhAbgm2PbaoL+JCiP+4524iXy4UvKl
 wIlwb+yQ7UqTTaVt0qDUMOuyWEOx7OipJibScBUrC+GULnSqG9tu0er7zrI67zCjnULg
 D7Fg==
X-Gm-Message-State: AOAM530bstyCRFfKZh3hAc2ew78OHHwNQ1NihVkiNFGm9wDXr7pfIf1k
 NDWZNYm/b5D0FA34MJ1vb/9jw1YIeGvDD6u9ya7juJwrNosI4hubrYQ0DnnZNdkgBHgGiviYKSt
 WtAJ0OW4MqhNv2E2U3NnSFRQTLJuQ
X-Received: by 2002:a05:6214:2aa8:b0:440:e21a:481e with SMTP id
 js8-20020a0562142aa800b00440e21a481emr920495qvb.124.1647463585470; 
 Wed, 16 Mar 2022 13:46:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhGOJ38oQnyB4tkZz/yMIApAMry1UbUhBbTBbzmqYsaCSF25WehrTI7qOdDymlw16Z2KFyKg==
X-Received: by 2002:a05:6214:2aa8:b0:440:e21a:481e with SMTP id
 js8-20020a0562142aa800b00440e21a481emr920483qvb.124.1647463585243; 
 Wed, 16 Mar 2022 13:46:25 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 f185-20020a37d2c2000000b0067e342d5e4dsm416449qkj.105.2022.03.16.13.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 13:46:24 -0700 (PDT)
Message-ID: <473115e2ed01b0d47ae74d29d6f8f66286a78ccb.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix spelling mistake "endianess" ->
 "endianness"
From: Lyude Paul <lyude@redhat.com>
To: Colin Ian King <colin.i.king@gmail.com>, Ben Skeggs
 <bskeggs@redhat.com>,  Karol Herbst <kherbst@redhat.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Wed, 16 Mar 2022 16:46:23 -0400
In-Reply-To: <20220315221929.2959700-1-colin.i.king@gmail.com>
References: <20220315221929.2959700-1-colin.i.king@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in just a moment

On Tue, 2022-03-15 at 22:19 +0000, Colin Ian King wrote:
> There is a spelling mistake in a nvdev_error error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index 88d262ba648c..62efbd0f3846 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -2935,7 +2935,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>                 /* switch mmio to cpu's native endianness */
>                 if (!nvkm_device_endianness(device)) {
>                         nvdev_error(device,
> -                                   "Couldn't switch GPU to CPUs
> endianess\n");
> +                                   "Couldn't switch GPU to CPUs
> endianness\n");
>                         ret = -ENOSYS;
>                         goto done;
>                 }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

