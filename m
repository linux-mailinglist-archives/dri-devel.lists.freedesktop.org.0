Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 952F6756029
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 12:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7004310E22D;
	Mon, 17 Jul 2023 10:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18D510E226
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 10:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689588695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nRj22T9/512zPxvkOqC1vXSxbaDljwzw9UUPmIr2es=;
 b=Tc9SZO3f+5zAGUEayExBN9t1fLRWdwoRdftdA2ulCCWzI0Ci7ZGJEcVTh3Hj7x0EFRc2Mp
 e1Z/b2h2r0V9TDwPOl93w0oqyd7wmLSSld73WTEp4fgPMnOcTS6gYl5lZEyBQkvM9Bca9u
 vRn+L51tRNTA15y0mQ6E7YUS8SO3xPI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74--WmGeDDMP2Gw--tupxEIFQ-1; Mon, 17 Jul 2023 06:11:34 -0400
X-MC-Unique: -WmGeDDMP2Gw--tupxEIFQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3faabd8fd33so22451165e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 03:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689588693; x=1692180693;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8nRj22T9/512zPxvkOqC1vXSxbaDljwzw9UUPmIr2es=;
 b=kF36aJ7lALC0TgBiGJaZNphPIugC5oz6WudVSg+PMzqVJpfnq7yLPPauGZwNjuvE3i
 b3AjY+grpy7pr/b3xvXj8rU4v3HE9MT4Tku5B3A8NkgMvKsVfqKdAwUcBAuQBw824pQJ
 Y6RkFS1NRm2DQakve1NJXIPkTM3pTNhvamBwU9XCP9AlsfWNnG7UvPQXygjTkJjBQ1GN
 OPDRCJnOYj1Olw8zC5TYOM7MZmQPxlT7nWND0iP7+iTzkwlvrM8o5KL/jGFiHWASSkhz
 +vlEzCuSCw0Q356z63yel5VnffNcCpRjy7BbuIjcBRYcHbWKvA4xMY/u3sQNuh4kyaJy
 qreQ==
X-Gm-Message-State: ABy/qLY3l3r4yHpLDHzf+XCJSYK7pOeaBt6Y3VFw8ehZ8wiqXqjqbNGi
 AuWSx1J9/rm3f37CU3dfwOnRxwp+Zt03FQT5L5U4KvKL6HnPDMOGYCt8paagw2pZw+8f8Fmp+H+
 HLH4D3DBwuijFrlJdj/oLFFbtRs7G
X-Received: by 2002:a1c:730c:0:b0:3f7:f884:7be3 with SMTP id
 d12-20020a1c730c000000b003f7f8847be3mr9353273wmb.4.1689588693188; 
 Mon, 17 Jul 2023 03:11:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG4NMi/EOG4DbyTAfW6xDy5Sl4Jzmh3AyVQ2FAtVi551OsEy6xNNEX2UpRf+vdorITRBLLbbQ==
X-Received: by 2002:a1c:730c:0:b0:3f7:f884:7be3 with SMTP id
 d12-20020a1c730c000000b003f7f8847be3mr9353257wmb.4.1689588692905; 
 Mon, 17 Jul 2023 03:11:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j1-20020a5d4641000000b0031434936f0dsm18696149wrs.68.2023.07.17.03.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 03:11:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/8] drm: fb-helper/ssd130x: Add support for DRM_FORMAT_R1
In-Reply-To: <CAMuHMdUiEXgk51Bjo+SdTXJz=bCrPzrcd8k1cZcEJUamsn0d1g@mail.gmail.com>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <87zg3w7zlz.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdV_qNfytroBEfqDMe04POt27s9o=FevXht7N4YXRmBz8Q@mail.gmail.com>
 <87o7kakijn.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdURa8E9cmphbDkTgS2o3ORWd7JAj68PV9bxd3aygKZRJg@mail.gmail.com>
 <87jzuykhm5.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdUiEXgk51Bjo+SdTXJz=bCrPzrcd8k1cZcEJUamsn0d1g@mail.gmail.com>
Date: Mon, 17 Jul 2023 12:11:31 +0200
Message-ID: <87edl6kfu4.fsf@minerva.mail-host-address-is-not-set>
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
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Javier,
>
> On Mon, Jul 17, 2023 at 11:33=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> >> >> penguin in test004 is not displayed correctly. I was expecting tha=
t to be
>> >> >> working correctly since you mentioned to be using the Linux logo o=
n boot.
>> >> >
>> >> > Linux has logos for displays using 2, 16, and 256 colors. Note that=
 the
>> >> > default logos are 80x80, which is larger than your display, so no l=
ogo
>> >> > is drawn.
>> >> > Fbtest has only the full color logo, so it will look bad on a monoc=
hrome
>> >> > display.
>> >>
>> >> I see. Should the test check for minimum num_colors and skip that tes=
t then?
>> >
>> > The test still works (you did see an ugly black-and-white penguin), do=
esn't it?
>>
>> Fair enough. But when it defaulted to XRGB8888, it looked better. So I
>> thought that it was a regression. No strong opinion though if the test
>> should be skipped or not.
>
> IC, fbtest's mono_match_color() just finds the closest color (black or
> white), while drm_fb_xrgb8888_to_gray8_line() uses a weighted average
> of the RGB components. That might make a small but visible difference.
>
> We could make it look even better using Floyd-Steinberg dithering... ;-)
> Fbtest does have an unused match_color_error() helper, so I must have
> had that in mind, initially...
>

Interesting. I'll take a look to that if I have time! But as mentioned,
all that is something to improve in your fbtest suite and the ssd130x
changes in the driver do look good to me and are working as expected.

> Gr{oetje,eeting}s,
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

