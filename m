Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5526578FAB2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 11:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B445510E183;
	Fri,  1 Sep 2023 09:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8D710E183
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 09:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693560197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ysodjYQK6gu5s3qZImaEMLzqoqH+yV+4jl06kd6/dh8=;
 b=QLsSVGWKiyMZAqvWy1FcyJ6YC1rzmKGFM+tHTR34P7mC0xIIWU3BhsADjsvflxLZBSU7Ph
 qxjDYemtJzhxL2A/s4GdLE5vEDNoDgF6hrakcJOBy8aMyolJP937deR8letppw2yQ8coLh
 oJCloZAuOHUfApgtR+z7Ct00snBgk9U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-Bl7mc4DkNDqsHGbAzUbayA-1; Fri, 01 Sep 2023 05:23:15 -0400
X-MC-Unique: Bl7mc4DkNDqsHGbAzUbayA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31400956ce8so964678f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 02:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693560195; x=1694164995;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3JiqN1iSPyqNyznyXLs6ZwGpCEi8bweMuS3U8aoR6Xg=;
 b=PgUpv0kNIcehq22BmsTDlxY1cKNzEoilGLDqzBOrFFxxeaS0oNbqQblGVsU3ia3mG8
 McewvGVno3v09KSezYrzHe5GGN0Xtq+KBq6JFjbFnHRD+5EHIgdLAbxK3w9sYvZlQMu4
 yKy/wgO84g6UWX4yLvbERSH2VePBWGYM00wlZpTjjy0vB1dG6N3IorFFOwt4OlXIROc/
 GX+M/flPCUZ7OkJgf5ccTw7RTIaufYeQO+fzJ5vLiKqa/oj6kFQ74joUj54je7FU/qhG
 1e0oro7OLFaGBWS/WPa3xCXoTEbxmuAoE5HjGqo3gM7Cj68rXen2IulKFRPXv03NwbV1
 EpfQ==
X-Gm-Message-State: AOJu0YwTpmxhk8Ma9GE48tLDzV7f26oAJcWR1tRebQPiwDZKmxbesb14
 XdYft8gew0NBrcdkWP6qhQ3ON/iJj+qJ6q6pQrciS/L6VIapczxsn+TPrkJVlTlU/qtgVOrI+NG
 xX7gN7pvVpOL15DA9AOh0N90D9r/T
X-Received: by 2002:adf:e9cf:0:b0:31c:65aa:b15a with SMTP id
 l15-20020adfe9cf000000b0031c65aab15amr1248550wrn.65.1693560194868; 
 Fri, 01 Sep 2023 02:23:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnVXywsk9L8AfytnZixOeQ8XSkN487jgB7u3LA7+rTXed2ndu9kqHa49rXP5sHOxvFdS+u9Q==
X-Received: by 2002:adf:e9cf:0:b0:31c:65aa:b15a with SMTP id
 l15-20020adfe9cf000000b0031c65aab15amr1248534wrn.65.1693560194548; 
 Fri, 01 Sep 2023 02:23:14 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m15-20020a056000180f00b003142ea7a661sm4629884wrh.21.2023.09.01.02.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 02:23:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <mripard@kernel.org>
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
In-Reply-To: <CAMuHMdWv_QSatDgihr8=2SXHhvp=icNxumZcZOPwT9Q_QiogNQ@mail.gmail.com>
References: <20230830062546.720679-1-javierm@redhat.com>
 <zitno3p7tbnld5auedkx5g4wey2csng4ncmtdhzinbuhblunyk@chnwsnsgq36v>
 <CAMuHMdWv_QSatDgihr8=2SXHhvp=icNxumZcZOPwT9Q_QiogNQ@mail.gmail.com>
Date: Fri, 01 Sep 2023 11:23:13 +0200
Message-ID: <87h6oe5jsu.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Maxime,
>
> On Fri, Sep 1, 2023 at 10:22=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
>> On Wed, Aug 30, 2023 at 08:25:08AM +0200, Javier Martinez Canillas wrote=
:
>> > The commit 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane's
>> > .atomic_check() callback") moved the allocation of the intermediate an=
d
>> > HW buffers from the encoder's .atomic_enable callback to primary plane=
's
>> > .atomic_check callback.
>> >
>> > This was suggested by Maxime Ripard because drivers aren't allowed to =
fail
>> > after drm_atomic_helper_swap_state() has been called, and the encoder'=
s
>> > .atomic_enable happens after the new atomic state has been swapped.
>> >
>> > But that change caused a performance regression in very slow platforms=
,
>> > since now the allocation happens for every plane's atomic state commit=
.
>> > For example, Geert Uytterhoeven reports that is the case on a VexRiscV
>> > softcore (RISC-V CPU implementation on an FPGA).
>>
>> I'd like to have numbers on that. It's a bit surprising to me that,
>> given how many objects we already allocate during a commit, two small
>> additional allocations affect performances so dramatically, even on a
>> slow platform.
>
> To be fair, I didn't benchmark that.  Perhaps it's just too slow due to
> all these other allocations (and whatever else happens).
>
> I just find it extremely silly to allocate a buffer over and over again,
> while we know that buffer is needed for each and every display update.
>

Is not efficient that's true, but on the other hand we have other objects
that are destroyed and created on each atomic update.

In the ssd1307fb driver, the buffer is allocated on ssd1307fb_update_rect()
(by calling the ssd1307fb_alloc_array() function), so it also happens for
every display update in the fbdev driver.

> Gr{oetje,eeting}s,
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

