Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF48578C11C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 11:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF10E10E1C6;
	Tue, 29 Aug 2023 09:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C7110E1C6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 09:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693300803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+has96YDsBU2Isc2Wi2Mx8jpqY6K0CoeNcnvCWbwfbg=;
 b=SXobm+p79DqAo76Q5RqvRdlojzrxZlMEl9ui+wh9IE7Qp5XNe5WQdCgARY7imybAJxO1dg
 MdANazEp0YC5Tu/L7UpjTqpZtH9eDRZP18nrZRqeAlpPQwubE3VCQhfwVJcyXjBJh21gLG
 /dMg8QmkSLg6UYAX+atF0EgXmrO0H7M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-lRqQAXSDOgit3evR9Vp5JQ-1; Tue, 29 Aug 2023 05:20:01 -0400
X-MC-Unique: lRqQAXSDOgit3evR9Vp5JQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-31c5c55fd70so2121565f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 02:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693300800; x=1693905600;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+has96YDsBU2Isc2Wi2Mx8jpqY6K0CoeNcnvCWbwfbg=;
 b=D4CFo7Nn5bXfLhF1tsCBnJv4kNoifKXjq8dEz+g6FDCs9zwTEhMSewWqmCIzLkqx8W
 BqTMSliX7l9I2ZwYBxQ5WRNrQnyedBvzkmNJ4mIetqI4b72mzjacd30bzhHh6qS9Ubfa
 sbS3rOXi/A/tGDQzhxS39KUV9L4ENuB3eScwNH0BantGsrMjlAGrIb/SofSwEUIG+bh4
 pTpzY3HxCatdLATqDE3gSvT8PnvLCasB2DOjC5xFi6myN1LhCpcVsahgPS9NcU06G/N7
 QuJ+AJP7BZvvgqDdHAIK/y54LSCyN1+QiPJr2jlThsDwciKk8yE6SPvvsLh0iszRlwss
 edAQ==
X-Gm-Message-State: AOJu0YzcDzZztxZA7b1VfKfV8WXF5aLQ48McoOn1bfruU8D8r+mHsIJN
 Cwpz2AIOLvNbATeFkA4XFPFexUNExSNWyyzp+lLSDPr8Jrp0wq6Uyx+0LPDCPFoeT/w+2rHU0FF
 BbQ365ck7q7MmtbbBGMUm1feXNsjMH38mWbWS
X-Received: by 2002:adf:e807:0:b0:317:417e:a467 with SMTP id
 o7-20020adfe807000000b00317417ea467mr1497038wrm.6.1693300800641; 
 Tue, 29 Aug 2023 02:20:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqb8tzfm00AI0tzbfKt+pG/jWIzRAZ3dc7hHDt9sKQ62QtWRu7UWirAMyTtclkiGPEe9sLVA==
X-Received: by 2002:adf:e807:0:b0:317:417e:a467 with SMTP id
 o7-20020adfe807000000b00317417ea467mr1497027wrm.6.1693300800367; 
 Tue, 29 Aug 2023 02:20:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x15-20020adfdd8f000000b003177074f830sm13191866wrl.59.2023.08.29.02.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 02:20:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Stone
 <daniel@fooishbar.org>
Subject: Re: [PATCH v2 5/8] drm/client: Convert drm_client_buffer_addfb() to
 drm_mode_addfb2()
In-Reply-To: <CAMuHMdWyMNZJ3seWWHqigLfXwCnp47Xwzs1B6ixOyY+n7cir-A@mail.gmail.com>
References: <cover.1692888745.git.geert@linux-m68k.org>
 <50762fd1694d3b5f6df1bdfa482564adb2ee7f36.1692888745.git.geert@linux-m68k.org>
 <CAPj87rNr7PTcquaz+VzwmXh0mSWSSK25_Fa6uxC2VOfj=wMmcQ@mail.gmail.com>
 <CAMuHMdWyMNZJ3seWWHqigLfXwCnp47Xwzs1B6ixOyY+n7cir-A@mail.gmail.com>
Date: Tue, 29 Aug 2023 11:19:58 +0200
Message-ID: <87r0nmtdc1.fsf@minerva.mail-host-address-is-not-set>
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

Hello Geert and Daniel,

> Hi Daniel,
>
> On Thu, Aug 24, 2023 at 5:12=E2=80=AFPM Daniel Stone <daniel@fooishbar.or=
g> wrote:
>> On Thu, 24 Aug 2023 at 16:09, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
>> >         struct drm_client_dev *client =3D buffer->client;
>> > -       struct drm_mode_fb_cmd fb_req =3D { };
>> > -       const struct drm_format_info *info;
>> > +       struct drm_mode_fb_cmd2 fb_req =3D { };
>> >         int ret;
>> >
>> > -       info =3D drm_format_info(format);
>> > -       fb_req.bpp =3D drm_format_info_bpp(info, 0);
>> > -       fb_req.depth =3D info->depth;
>> >         fb_req.width =3D width;
>> >         fb_req.height =3D height;
>> > -       fb_req.handle =3D handle;
>> > -       fb_req.pitch =3D buffer->pitch;
>> > +       fb_req.pixel_format =3D format;
>> > +       fb_req.handles[0] =3D handle;
>> > +       fb_req.pitches[0] =3D buffer->pitch;
>> >
>> > -       ret =3D drm_mode_addfb(client->dev, &fb_req, client->file);
>> > +       ret =3D drm_mode_addfb2(client->dev, &fb_req, client->file);
>> >         if (ret)
>> >                 return ret;
>>
>> This should explicitly set the LINEAR modifier (and the modifier flag)
>> if the driver supports modifiers.
>
> Thanks for your comment!
>
> I have no idea how to do that, and I do not know what the impact
> would be.  All I know is that the current implementation of
> drm_client_buffer_addfb() does not do that, so changing that in this
> patch would mean that this would no longer be a trivial conversion.
>

Agree with Geert, this patch basically just inlines the drm_mode_addfb()
implementation which already calls drm_mode_addfb2() but without setting
a struct drm_mode_fb_cmd2 .modifier field or anything modififers related.

So if that is wrong then it should be done as a follow-up patch (which
should also fix the drm_mode_addfb() helper implementation) ?

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

