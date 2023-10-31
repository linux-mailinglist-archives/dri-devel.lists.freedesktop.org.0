Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 177007DCA6F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 11:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F05C10E44E;
	Tue, 31 Oct 2023 10:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A60310E44E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 10:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698747089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PzDDRWNXtvF0AiHkzgS2GcOo69dWjTdD9mgnyNtPC9Q=;
 b=XedIwXIDonZna4qP1PDBoxGZxb+HAcmf8jXKkeIkGAckVtacU5IoI+x87uJNToIJ/xc84i
 NPveTCzYuD2elsRl0ixcIneqhZAIExjsnMVOGEmxzevY4vS34eYOsh8Tvu6zFnWwOe3CwQ
 EGwZxN9v4dFRPWP3nfTJ3hMYzouNqs0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-q72CnQkiMF-whFOLBvlpLg-1; Tue, 31 Oct 2023 06:11:27 -0400
X-MC-Unique: q72CnQkiMF-whFOLBvlpLg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32dceab634dso2725360f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 03:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698747086; x=1699351886;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PzDDRWNXtvF0AiHkzgS2GcOo69dWjTdD9mgnyNtPC9Q=;
 b=m3d6tz/+V/tOUuzvpkyuE5dFT1L5FnJpmtlyOlfk59ebhxFaf8r/jZcuOUXHL0pIfK
 c2vhxdp7VRtcG+/5N00Pb+OSgCd5lk+5/MVVUjITTtXJNMhJb60s2rZQiOJmf5f2LIs+
 Kuvtka77ehGJtUq6c+BsRvGMZzdUEUTVPqlBjqBDmyohBEcGughCxsjBq+3ncYWOEk+L
 AeG+HrycE4GDu/m1YSUthGcRwNe0ue3oF8q9vdRo2ojK035mrUm/HozUnIs5DchnTfhc
 GvXLgJq6cGT1OhcR2cqto+BT5zXplqyrrUwTV+YvrPdfsys6lARowiH6s1+pUlexwsnx
 ErCg==
X-Gm-Message-State: AOJu0YypB+Ubkx5Ioj7v7zxlxLd852Q/i+hx3Oo4Fd1dF4SNfYVx9Ny8
 8ZYAW/8yp//go/PH7DICSSviHW1ec/D7CcXZmA3KnQo1OvNU1gdfuUy8pX0VAYpc+jwLnXnlHtL
 xE5jGzAao9lrNJcczoPDdMTHAdWUu
X-Received: by 2002:a5d:5191:0:b0:32f:9709:df75 with SMTP id
 k17-20020a5d5191000000b0032f9709df75mr845856wrv.24.1698747086664; 
 Tue, 31 Oct 2023 03:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCrFfBWko6jbrSVOEoQNO1U5Ek3OR2diEsBd5CV4xGBcmuAciNM/F+1O/7eI0IwAJOI8X+sw==
X-Received: by 2002:a5d:5191:0:b0:32f:9709:df75 with SMTP id
 k17-20020a5d5191000000b0032f9709df75mr845843wrv.24.1698747086364; 
 Tue, 31 Oct 2023 03:11:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a8-20020adffac8000000b003296b488961sm1127397wrs.31.2023.10.31.03.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 03:11:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm/ssd130x: Fix possible uninitialized usage of
 crtc_state variable
In-Reply-To: <CAMuHMdVLf=H7QWaUXrN17ABw9eE1MjBdzFEM0AhMNj8_ULSz+Q@mail.gmail.com>
References: <20231020225338.1686974-1-javierm@redhat.com>
 <b048247c-75e9-488e-a4f3-b227a38bca5e@redhat.com>
 <87v8aso1ha.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdVLf=H7QWaUXrN17ABw9eE1MjBdzFEM0AhMNj8_ULSz+Q@mail.gmail.com>
Date: Tue, 31 Oct 2023 11:11:24 +0100
Message-ID: <87lebjksoj.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> Hi Javier,
>
> On Fri, Oct 27, 2023 at 11:33=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Jocelyn Falempe <jfalempe@redhat.com> writes:
>> > On 21/10/2023 00:52, Javier Martinez Canillas wrote:
>> >> Avoid a possible uninitialized use of the crtc_state variable in func=
tion
>> >> ssd132x_primary_plane_atomic_check() and avoid the following Smatch w=
arn:
>> >>
>> >>      drivers/gpu/drm/solomon/ssd130x.c:921 ssd132x_primary_plane_atom=
ic_check()
>> >>      error: uninitialized symbol 'crtc_state'.
>> >
>> > That looks trivial, so you can add:
>> >
>> > Acked-by: Jocelyn Falempe <jfalempe@redhat.com>
>> >
>>
>> Pushed to drm-misc (drm-misc-next). Thanks!
>
> Looks like you introduced an unintended
>
>     (cherry picked from commit 9e4db199e66d427c50458f4d72734cc4f0b92948)
>
> ?
>

No, that's intended. It's added by the `dim cherry-pick` command, since I
had to cherry-pick to drm-misc-next-fixes the commit that was already in
the drm-misc-next branch.

You will find that message in many drm commits, i.e:

$ git log --oneline --grep=3D"(cherry picked from commit" drivers/gpu/drm/ =
| wc -l
1708

> Gr{oetje,eeting}s,
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

