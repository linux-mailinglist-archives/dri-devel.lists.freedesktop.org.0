Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56443752328
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 15:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12FB10E0D9;
	Thu, 13 Jul 2023 13:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFA910E0D9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689254150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xvPO9Xojgtw3Qok/szSpmL9QReDGF4Uu7/gCOdSZo3Y=;
 b=TY0XuQBgR8QGQAeVDJoHrmaPRCS0NL/1zV1zfnPrxw6AZZt0QvUgarRzHQ/L8J0CPHKT+B
 itbFJwWJfrirOL+CtllAt97uOk/eVjU1Bc6ovQE0ZgaLO5FDakJzMrwWbdBSmFlbn+qwjU
 HtwQePxhIdrpFVJbnl0FSSA5SqFU9i8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-dS__0FrfOz6w0YeweN0YVA-1; Thu, 13 Jul 2023 09:15:49 -0400
X-MC-Unique: dS__0FrfOz6w0YeweN0YVA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-314256aedcbso462146f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 06:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689254148; x=1691846148;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+W653bQgYnkrDlOyPaGyC+VUCI2YgiP6l1CnjaSmytU=;
 b=ehxP65zDCh6dnTFPQRLJos5UDJ7Wa8Tx7iygqsM3P0JpBVDz4c0QL0Rv3YVvrhXoN2
 FItLUdsnHwuddkc/OuBJaZjjw1lJPMMGFWdEo3u7QuUiT5YGkObxUVr4mp91b5YmgUOw
 g7kz+wwQlSaGM56i5BpuQfnpZm7k2eydbfY7wsZNL9qcNMcK1I5fC/vMJoae6HOELmhf
 TLXjxCzjY0m2boyCv4pnTVlqaSRz743gsiVfaC6GT3ClO/DbG59xeIrNL9UcWM4c8HWl
 dMJ0vWoLH3cMRTFTZLeXs8/x9sREdVclOe2ubTnP1AJMK9L/jmBTHD+81vJ19ja5npGi
 gOkQ==
X-Gm-Message-State: ABy/qLZerw2yzKnrxX8vmf39rPqeKCJuIjPzz+bXhFDYTuGiAYJa0h5G
 e+QZ0yRYFhe6i1TaZ22ZLsRYkS1+G793BkcPDVs5crtOIuFq1k2NUKBCOYJ5heiAfJGiRTkcaa9
 K4blTOjPTnlw08NMffcSGeCiAMGdzb3cioE7m
X-Received: by 2002:a5d:6603:0:b0:313:ee2e:dae1 with SMTP id
 n3-20020a5d6603000000b00313ee2edae1mr1377233wru.18.1689254147838; 
 Thu, 13 Jul 2023 06:15:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGcwH17n+61+faw0EOmRZrjFZUmAq9pqWras4eL7iwT2iWWC+qh/xr6DBkUXMGcDHuJWJH95Q==
X-Received: by 2002:a5d:6603:0:b0:313:ee2e:dae1 with SMTP id
 n3-20020a5d6603000000b00313ee2edae1mr1377213wru.18.1689254147547; 
 Thu, 13 Jul 2023 06:15:47 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k4-20020a056000004400b00314326c91e2sm8002635wrx.28.2023.07.13.06.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 06:15:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 4/5] drm/ssd130x: Don't allocate buffers on each
 plane update
In-Reply-To: <CAMuHMdVXhi52KfpCmnum+9t74UWP+AOLE95xQU6VV6Nz=VHk1Q@mail.gmail.com>
References: <20230609170941.1150941-1-javierm@redhat.com>
 <20230609170941.1150941-5-javierm@redhat.com>
 <CAMuHMdVXhi52KfpCmnum+9t74UWP+AOLE95xQU6VV6Nz=VHk1Q@mail.gmail.com>
Date: Thu, 13 Jul 2023 15:15:46 +0200
Message-ID: <87fs5sgdfh.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> Hi Javier,
>
> On Fri, Jun 9, 2023 at 7:09=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> The resolutions for these panels are fixed and defined in the Device Tre=
e,
>> so there's no point to allocate the buffers on each plane update and tha=
t
>> can just be done once.
>>
>> Let's do the allocation and free on the encoder enable and disable helpe=
rs
>> since that's where others initialization and teardown operations are don=
e.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>
>> (no changes since v1)
>
> Thanks for your patch, which is now commit 49d7d581ceaf4cf8
> ("drm/ssd130x: Don't allocate buffers on each plane update") in
> drm-misc/for-linux-next.
>
>> --- a/drivers/gpu/drm/solomon/ssd130x.c
>> +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> @@ -701,14 +709,22 @@ static void ssd130x_encoder_helper_atomic_enable(s=
truct drm_encoder *encoder,
>>                 return;
>>
>>         ret =3D ssd130x_init(ssd130x);
>> -       if (ret) {
>> -               ssd130x_power_off(ssd130x);
>> -               return;
>> -       }
>> +       if (ret)
>> +               goto power_off;
>> +
>> +       ret =3D ssd130x_buf_alloc(ssd130x);
>
> This appears to be too late, causing a NULL pointer dereference:
>

Thanks for reporting this issue.

> [   59.302761] [<c0303d90>] ssd130x_update_rect.isra.0+0x13c/0x340
> [   59.304231] [<c0304200>]
> ssd130x_primary_plane_helper_atomic_update+0x26c/0x284
> [   59.305716] [<c02f8d54>] drm_atomic_helper_commit_planes+0xfc/0x27c
>

I wonder how this could be too late. I thought that the encoder
.atomic_enable callback would be called before any plane .atomic_update.

> Bailing out from ssd130x_update_rect() when data_array is still NULL
> fixes that.
>

Maybe we can add that with a drm_WARN() ? I still want to understand how
a plane update can happen before an encoder enable.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

