Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E75B6E161F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 22:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188B710E0F5;
	Thu, 13 Apr 2023 20:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CBB10E0A1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 20:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681419046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eA15TxiCUZPdxrd+DAVR5aEn1HQmg1ANAGx56rle4iY=;
 b=US05DPnbmGTGMDo0hmQ+ik6OebdepAV6Ns2+EmnTzgAQEerg1cVGCW4AIQxaqpA6t5aE3J
 gdZFsIUK76ZV0y2f9yNZEN00SJOELZrWrtzv57HBzB8RdEF+4n8Wr9yHD2vi9q/LIyN5Ur
 wayghToERImYh+noM1xqcSt/mAOuBMY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-lOAd3p5GNU2V2jJddDS4QA-1; Thu, 13 Apr 2023 16:50:45 -0400
X-MC-Unique: lOAd3p5GNU2V2jJddDS4QA-1
Received: by mail-qv1-f72.google.com with SMTP id
 n12-20020a0cbe8c000000b005e79f8d1417so9789646qvi.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 13:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681419045; x=1684011045;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KmQxpMzSuEyk+3REh88Siq0gb5rqCSxABB+pkkoj8lI=;
 b=QZDgCjdnoxzl2dO/cGrtR0GxT4uKTLo4jpamz7jgAN1dmwl5/mMuNowEhzLC/+0UZ4
 lBV6H9E2vv4eOWOHO3p4m0G9qvUa40V3MOi5UF35fri7Vq062iAod94e/MipAOvzTkVW
 EO2rQhw8+1xUdN6Ar91/1Wrzc8oJHIpDkE91quPPCh6iV+TQMMMKBgXsXMGbnWu9PM8O
 Tc36I7MS7KrTpQ7YZmIqxFh+zTIgjARhbY70cRWiXEU1LTIhkFJUd4kpf8j9e+iXokAw
 v5EhNOizf2uml8dx2yrkUz8iPIpTyPz9NytzlfVI/+7+HkWWbQX1JGNhMDF0/ZiZFNZO
 j9kA==
X-Gm-Message-State: AAQBX9d++lbYwGHnN/h1V02hn5O8B8kyJlSAklKZBdjFQNTzYDlIhPDF
 wZzzqTs5MWymRYgf6aKMG4vVwGbwCqirp3HMkmw+NWxYyFjhL8ueGwKbI7rGWC8E02ISyVKOmBH
 ZyVcceARatUrSd0Cta237PQq1iKKh
X-Received: by 2002:a05:622a:178f:b0:3d2:7950:f790 with SMTP id
 s15-20020a05622a178f00b003d27950f790mr5567155qtk.62.1681419044903; 
 Thu, 13 Apr 2023 13:50:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350b12qT4nXWBVHubQJPdBC5iGLT75vNx2WB6Tcl30hDHb8I1dl6zwV8CoKpd3QHFzc9a8KqSHw==
X-Received: by 2002:a05:622a:178f:b0:3d2:7950:f790 with SMTP id
 s15-20020a05622a178f00b003d27950f790mr5567138qtk.62.1681419044690; 
 Thu, 13 Apr 2023 13:50:44 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 a24-20020ac84358000000b003e64303bd2dsm739869qtn.63.2023.04.13.13.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 13:50:44 -0700 (PDT)
Message-ID: <61cccdbc80bfcaa2222c274e40c329ed84d41e55.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau: constify pointers to hwmon_channel_info
From: Lyude Paul <lyude@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Date: Thu, 13 Apr 2023 16:50:43 -0400
In-Reply-To: <20230407150031.79749-2-krzysztof.kozlowski@linaro.org>
References: <20230407150031.79749-1-krzysztof.kozlowski@linaro.org>
 <20230407150031.79749-2-krzysztof.kozlowski@linaro.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2023-04-07 at 17:00 +0200, Krzysztof Kozlowski wrote:
> Statically allocated array of pointed to hwmon_channel_info can be made
> const for safety.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> This depends on hwmon core patch:
> https://lore.kernel.org/all/20230406203103.3011503-2-krzysztof.kozlowski@=
linaro.org/
>=20
> Therefore I propose this should also go via hwmon tree.
>=20
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/no=
uveau/nouveau_hwmon.c
> index e844be49e11e..db30a4c2cd4d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -211,7 +211,7 @@ static const struct attribute_group temp1_auto_point_=
sensor_group =3D {
> =20
>  #define N_ATTR_GROUPS   3
> =20
> -static const struct hwmon_channel_info *nouveau_info[] =3D {
> +static const struct hwmon_channel_info * const nouveau_info[] =3D {
>  =09HWMON_CHANNEL_INFO(chip,
>  =09=09=09   HWMON_C_UPDATE_INTERVAL),
>  =09HWMON_CHANNEL_INFO(temp,

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

