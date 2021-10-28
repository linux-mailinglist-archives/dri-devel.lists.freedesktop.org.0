Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F35A43E616
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 18:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E9E6E087;
	Thu, 28 Oct 2021 16:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527486E087
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635438502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=srx/wR4Z0jpwx5qACmRHg2e/sdqCTiZM1D5VqWblfyo=;
 b=QQlzbLHycSyzV9dHrc3w3/Mnbd2sENHmiau2/3Z98KoSRh5MrJldPurCbDEo0X5AhC1N3d
 aIbYw5JvTAjjkHoltq2HHwbO+eosw2C6IJcCGoNjbzqWN0qIz4Q1iU6Tylel6+Tz+AHU/u
 y5gJxHvaGlTGQJCKS9vJvvcVXVdJxE8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-cK57PXt5NXqYCoObSg0ftw-1; Thu, 28 Oct 2021 12:21:27 -0400
X-MC-Unique: cK57PXt5NXqYCoObSg0ftw-1
Received: by mail-wr1-f72.google.com with SMTP id
 g15-20020a5d64ef000000b0016a1331535eso2308301wri.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 09:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=srx/wR4Z0jpwx5qACmRHg2e/sdqCTiZM1D5VqWblfyo=;
 b=EURnK0uKdTDE8YqbVbBsywovbnkrUYHkk3KtXR5e6g1BhzYsmYUHoEDepcTxk45ud0
 xurpkkNZhIoyB1bT2PhBdG6yGv/Uk+26TsP0gOG88Qjf3Lek6s+39nPtsVrisYBtoBfK
 w+PnZxa0Z5Q2vxX5STefvBUwWlV2/GsXv/L7O4NBPwCel0/63RdbMEgwHiNQu4MIkWzm
 DUV3WCniTQWqyOP9qYaZkaTM1Izp/F50QeNLgaDEByaeNHDdooH7ApOjAsWuTN2T3K4Q
 8Kd4Lx6yzpRb5zPsRiuILWLqPV9jkXpzJPiA8mZxeYXsGM5wTq74v5S/P01JbxiyxRzV
 Jalg==
X-Gm-Message-State: AOAM532XZPhMMzteTHumBk62RtxVsDQQuBoJS8veO7YrixcfZq3J8Cwi
 I2HnB23RfoRDi7SWMZHHy1kSSOUpKfW8iDlsbtEkc5GD5FzIIJAYQ1IxzwB7v/GZlLRqf0ZHvba
 UVvdyqrT/TJUWJeWmxLkunoaoc8eFgXTYr7DGl+b7Q5Ej
X-Received: by 2002:a5d:4004:: with SMTP id n4mr7115190wrp.49.1635438085981;
 Thu, 28 Oct 2021 09:21:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyMKgzDB1igDUPyy00UI9mGxcyOY5krHyjEPwcdvs8cObzielWIajyvYSKRXyiHQOxa8HwjbrosORuHuSRvaM=
X-Received: by 2002:a5d:4004:: with SMTP id n4mr7115161wrp.49.1635438085772;
 Thu, 28 Oct 2021 09:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211026220848.439530-1-lyude@redhat.com>
 <20211026220848.439530-3-lyude@redhat.com>
In-Reply-To: <20211026220848.439530-3-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 28 Oct 2021 18:21:15 +0200
Message-ID: <CACO55tt8c6V-AT5J0bX+Dvw-+rNVXoN93a3t9SfPRV7d-qjvSg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v4 2/5] drm/nouveau/kms/nv50-: Explicitly check
 DPCD backlights for aux enable/brightness
To: Lyude Paul <lyude@redhat.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Satadru Pramanik <satadru@gmail.com>, 
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Oct 27, 2021 at 12:09 AM Lyude Paul <lyude@redhat.com> wrote:
>
> Since we don't support hybrid AUX/PWM backlights in nouveau right now,
> let's add some explicit checks so that we don't break nouveau once we
> enable support for these backlights in other drivers.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index 1cbd71abc80a..ae2f2abc8f5a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -308,7 +308,10 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>                 if (ret < 0)
>                         return ret;
>
> -               if (drm_edp_backlight_supported(edp_dpcd)) {
> +               /* TODO: Add support for hybrid PWM/DPCD panels */
> +               if (drm_edp_backlight_supported(edp_dpcd) &&
> +                   (edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP) &&
> +                   (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)) {
>                         NV_DEBUG(drm, "DPCD backlight controls supported on %s\n",
>                                  nv_conn->base.name);
>
> --
> 2.31.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

