Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85E7EC7C0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 16:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E9A10E09C;
	Wed, 15 Nov 2023 15:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFEC10E086
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700063466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v1fbGF7Qkv7teUuJLTRPkGkYvp5FXnG2+paeUI2HZvM=;
 b=A/MVRO5dXV6JdI9hMwmSffxdZG4gQV7c03AD1BbcWUIEAbjARpfYVkZ4PURa4fBtcNRRXd
 KgOV59Q1ExSRoq0T0F6sxZ+uasUJvB8QtayGggox2g/W69wKuEsnjrKZKESj4h4TxLgkKH
 9GwOWs28ioxFl+Vgi3MMbGifS3LoYd0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-kRTgX3rMOy2Nfh5UHZ8JcA-1; Wed, 15 Nov 2023 10:50:59 -0500
X-MC-Unique: kRTgX3rMOy2Nfh5UHZ8JcA-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2c506abc320so56006191fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700063458; x=1700668258;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v1fbGF7Qkv7teUuJLTRPkGkYvp5FXnG2+paeUI2HZvM=;
 b=daItRrmySslYvCLA4ojNkt7OfrPPEdhkuoZqSxRWs6+GVQ031xDM1Fqt0MLhpUl4HC
 n/MBhBT103vFHT2RXjxcvjiKsLzW5RXZUpeQlbVOJPVl2nahU8veilUVl5xz3E569OTo
 tdnvtA0HLlCEYJNIzQrn8Kryullxh0K3wux31K2RJuFhngLh2zT2qzPEEzQ20Pfhr8fV
 Nqeirfd8fRczVzRzbUli5jfAAH2YDT0tv5PoApKNXPNCoLEjqBPn1CH8nFdnM7RGLDB+
 RMzIBhqTxaGDIJpLe91TPv3kqB5wUKHcDT3LWvGAvitYz7r7AScPZ+VTxTUWK0deIkGw
 d6sw==
X-Gm-Message-State: AOJu0Ywb+zNwNijE4A6LrySJVav0Z/fanYDysH6OlIfgRMCYyaohgeg3
 CDgX2rozEVwJ/UHz5NCOY0AlJ98tNAzmU6u2g7EMK2h/Ob13y/fs01Ugm+RN54jZPW0MCYlGVy4
 jr6abmZAmL9RodM268N2AlaHc1qWU
X-Received: by 2002:a19:2d59:0:b0:507:984b:f174 with SMTP id
 t25-20020a192d59000000b00507984bf174mr8384274lft.48.1700063458234; 
 Wed, 15 Nov 2023 07:50:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL1znuxl2ULUiExZruoVbV/H+47fM+nDMFfZuJyFLjC1AAX5XUVosc+FBmsmiqu+o1APToBQ==
X-Received: by 2002:a19:2d59:0:b0:507:984b:f174 with SMTP id
 t25-20020a192d59000000b00507984bf174mr8384254lft.48.1700063457912; 
 Wed, 15 Nov 2023 07:50:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 gy18-20020a170906f25200b009b95787eb6dsm7216951ejb.48.2023.11.15.07.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 07:50:57 -0800 (PST)
Message-ID: <4570d94e-b446-4fd1-a24a-db11a87846c4@redhat.com>
Date: Wed, 15 Nov 2023 16:50:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel-orientation-quirks: add Lenovo Legion Go
To: Brenton Simpson <appsforartists@google.com>
References: <20231114233859.274189-1-appsforartists@google.com>
 <70f12e96-0fcc-4954-8507-27cf5e15a3b2@redhat.com>
 <CAAL3-=9YYQBV-T-KhHdYrtGHH1RC29uzTuQ98roAY9GwrNrwmg@mail.gmail.com>
 <CAAL3-=-b3-RZNNfQEYzQxK=SW4PPJ7cmrX8omBniec+tgC2frw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAAL3-=-b3-RZNNfQEYzQxK=SW4PPJ7cmrX8omBniec+tgC2frw@mail.gmail.com>
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
Cc: Patrick Thompson <ptf@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jared Baldridge <jrb@expunge.us>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Allen Ballway <ballway@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/15/23 16:48, Brenton Simpson wrote:
> Resending from the email address linked to my GitHub account.

Ok, this doesn't really help. I'll just fix-up the author
field of the original patch.

Do understand correctly that both the author and the Signed-off-by
should be set to:

Brenton Simpson <appsforartists@google.com>

?

Regards,

Hans



> 
> -- >8 --
> 
> The Legion Go has a 2560x1600 portrait screen, with the native "up" facing =
> the right controller (90=C2=B0 CW from the rest of the device).
> 
> Signed-off-by: Brenton Simpson <appsforartists@google.com>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/d=
> rm/drm_panel_orientation_quirks.c
> index d5c1529..3d92f66 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -336,6 +336,12 @@ static const struct dmi_system_id orientation_data[] =
> =3D {
>  =09=09  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IGL5"),
>  =09=09},
>  =09=09.driver_data =3D (void *)&lcd1200x1920_rightside_up,
> +=09}, {=09/* Lenovo Legion Go 8APU1 */
> +=09=09.matches =3D {
> +=09=09  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +=09=09  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
> +=09=09},
> +=09=09.driver_data =3D (void *)&lcd1600x2560_leftside_up,
>  =09}, {=09/* Lenovo Yoga Book X90F / X90L */
>  =09=09.matches =3D {
>  =09=09  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> --=20
> 2.43.0.rc0.421.g78406f8d94-goog
> 

