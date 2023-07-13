Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA53751CCD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4579010E652;
	Thu, 13 Jul 2023 09:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F116710E660
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689239343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUpFy+8PT4u79LgrjVCf5QWEAaQj/iACvNS6/iRtcoM=;
 b=USvGPQ5kz7jUvhywCTCWj5H6wyyN0h662IqyGfj8o7Fh9AQwNfoKGr2AeryVMrU2TDqps5
 I97JLa6iHSBzdm45IDyyvejP+dpn2Js4XWq7NRQKO/juM/dHEKWpbtfzUmTuvrS9N0rdbD
 R61dx5pdDdFQ51Iyqru6iV/kbBJr0h8=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-_nrJh9YRPQqjcgk5iBExkA-1; Thu, 13 Jul 2023 05:09:01 -0400
X-MC-Unique: _nrJh9YRPQqjcgk5iBExkA-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b6c4c018aaso1227681fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 02:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689239340; x=1689844140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hUpFy+8PT4u79LgrjVCf5QWEAaQj/iACvNS6/iRtcoM=;
 b=APsVvrvw8z9ON4bkyFUMiQTTzHTHEwPs3sFii5niTXhlTyL8Oz01uU9/R0VBYvY1p9
 /nK3vAU1SOMwg+LtmCr/S1NFmSSqdBcBYsHslrE9DXcQtiCa/cTu4eowQos5cZ7D+ylY
 zKhlK7kMKiU3BsXs4GHSsVPPQ3DgTUc/nKQVl3GImOXpenD2DgBSDvgihyW6VNJ0sOES
 FQNiEDpJ9g0cQEOZxhb0W29KsqOHxygLqrMSez9Z/8z29czfC6rT0SqNMBycNv9pvVek
 XCv1hOLYlrQVlIWl/ajHd8YsGNWzdknTBT7LKXQN0arNl8Gn3GgaN/PJPU1GK3UUVHpD
 j6pw==
X-Gm-Message-State: ABy/qLZqY0NL/fQo7dFYUUZaV76ddDS2BfZ5TPygmGRv3k8vylPQoqcs
 7dEPcR4/nPHCFiBp9v2vPSc/N6ltmLaGHnHQVvfI16v+rigj89ywOwLqxdwX2RlAJK5SyrIHPJX
 U5k4kDCdcwbnVvpAqzxXx+1UeWkFeRphGah4hRKn2JmMy
X-Received: by 2002:a05:651c:1c7:b0:2b6:9b02:cf1c with SMTP id
 d7-20020a05651c01c700b002b69b02cf1cmr786693ljn.2.1689239339833; 
 Thu, 13 Jul 2023 02:08:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHkkcDpkbmRv5mhgZhEUsmC9uPWxawlczs6fpfBEbxv/TjvIaMUhATKq+oc+c0OgRiAoxO+FmksdCen7QhUoPY=
X-Received: by 2002:a05:651c:1c7:b0:2b6:9b02:cf1c with SMTP id
 d7-20020a05651c01c700b002b69b02cf1cmr786682ljn.2.1689239339523; Thu, 13 Jul
 2023 02:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230710063529.53769-1-xujianghui@cdjrlc.com>
 <2156ff3c1fcec8914f1493ac6d7cd807@208suo.com>
In-Reply-To: <2156ff3c1fcec8914f1493ac6d7cd807@208suo.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 13 Jul 2023 11:08:48 +0200
Message-ID: <CACO55tuMNXZmuqSCVoRTOanWd5m26sf-nYOW7OHuhwC-gV9GwQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/i2c: do not use assignment in if condition
To: sunran001@208suo.com
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Mon, Jul 10, 2023 at 9:23=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Assignments in if condition are less readable and error-prone.  Fixes
> also checkpatch warning:
>
> ERROR: do not use assignment in if condition
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c
> index 96bbdda0f439..a1cf406ff141 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c
> @@ -85,7 +85,8 @@ gf119_i2c_bus_new(struct nvkm_i2c_pad *pad, int id, u8
> drive,
>   {
>       struct gf119_i2c_bus *bus;
>
> -    if (!(bus =3D kzalloc(sizeof(*bus), GFP_KERNEL)))
> +    bus =3D kzalloc(sizeof(*bus), GFP_KERNEL);
> +    if (!bus)
>           return -ENOMEM;
>       *pbus =3D &bus->base;
>

