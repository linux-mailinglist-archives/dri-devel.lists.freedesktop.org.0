Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630CD76F913
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 06:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220F010E238;
	Fri,  4 Aug 2023 04:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFB710E238
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 04:43:40 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-349099fce6dso6249845ab.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 21:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691124220; x=1691729020;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9UTWHLndGeXwlwFxJfP692jPfynwn2x9U2iKvEF971w=;
 b=dDOn4jen7D2FSeI5qe7zmIjUi5bp7bqRTm1TT7lupA7wnP61sKRJxiF6m44iE8hM6z
 gkY/ToZPsP88o+o/vPHogeLwIT8OSeZ9VUybix4P2E9sEYK5P2MR+kLhifNeU8G+poxi
 DrkLzsIQw1ZtTEyTMqgPChkpUgclKykJrMayo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691124220; x=1691729020;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9UTWHLndGeXwlwFxJfP692jPfynwn2x9U2iKvEF971w=;
 b=Z0GcSuEyT3RZ8uWoGPQeV/Hc8mXKOYh+jGrJHqCkJvYBBwA4rMBFQ1C5kTsdffztk5
 OAbZUc0Sn2idjNgnQvW4nWwE/S6zPTH+eBvOpVIVAqar8xIq4gD6KhZR24u+zfocJ+1g
 pwBdOamCn1xkYT4m5RuDceuEMRgDcoDSZkPjgOV8AijEd5xJGEwlp0rxXbsUFmEGdClQ
 plsgpAwruYrvPyFmV4d7y44Tnp5vBnYgTXnL89R+gZpMRhwamyxAmjv/a+m193kwhUAM
 vVxnBRF1st7K1lbwAS+32/BrUH2nrSa1RQTaGFK40rR8pqsEYQiLTQYtxnobwYBy9sMo
 zRwQ==
X-Gm-Message-State: AOJu0YylvFNRdIyYPH82XfiGUGkVwo1NdITfxyCWY67r5LWxsVVQRxLV
 nF1EK5TqOtV0cRReGaOwcsiPDZRgEIDxqf6O76c=
X-Google-Smtp-Source: AGHT+IFkHN7uedLQlAGcEdKXXv9lclDlILqMzS6g2WuaGP3u4i9mXplcwUOAKv0VO3J+Y9o2+lvGqw==
X-Received: by 2002:a05:6e02:12e1:b0:349:48eb:4e2f with SMTP id
 l1-20020a056e0212e100b0034948eb4e2fmr1236699iln.22.1691124219837; 
 Thu, 03 Aug 2023 21:43:39 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50]) by smtp.gmail.com with ESMTPSA id
 r17-20020a92d451000000b0034607609251sm422446ilm.87.2023.08.03.21.43.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 21:43:35 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-79095499a17so62870439f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 21:43:35 -0700 (PDT)
X-Received: by 2002:a5e:a815:0:b0:790:bf09:55b7 with SMTP id
 c21-20020a5ea815000000b00790bf0955b7mr715779ioa.6.1691124214863; Thu, 03 Aug
 2023 21:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230724175839.675911-1-greenjustin@chromium.org>
 <ZMtkIHkfhbOCodhw@phenom.ffwll.local>
 <CAHC42Rfz6jjY9RfVsrrPuENgXiaCB7EecH=-Dnfzm0KynGFNjA@mail.gmail.com>
 <ZMvAV42bm7ZTKXfv@phenom.ffwll.local>
In-Reply-To: <ZMvAV42bm7ZTKXfv@phenom.ffwll.local>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 4 Aug 2023 12:42:58 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngh4z5vbKYQ0yEULfmmQLA-deadJYKvvKcPyyaVOEcbdw@mail.gmail.com>
Message-ID: <CAC=S1ngh4z5vbKYQ0yEULfmmQLA-deadJYKvvKcPyyaVOEcbdw@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: chunkuang.hu@kernel.org, Justin Green <greenjustin@chromium.org>,
 jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 3, 2023 at 10:57=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Thu, Aug 03, 2023 at 08:48:56AM -0400, Justin Green wrote:
> > > See c91acda3a380 ("drm/gem: Check for valid formats") and the related=
 gem
> > fb helper functions to see how this is supposed to be done.

Thanks for shedding the light, Sima.
I think that change is exactly what we need here, which is somehow
recent and we don't have that in our downstream kernels.
Applying that also fixes the test failure I saw, so I agree with you
that this patch is not needed for the mainline kernel.

Thanks,
Fei


> >
> > Oh that's interesting, so does this imply that the infrastructure
> > automatically calls format_mod_supported() during framebuffer
> > creation? In that case, this entire patch might be unnecessary in the
> > tip of tree kernel.
>
> It /should/, but maybe a wheel fell off somewhere. So please double-check
> that it doesn indeed work.
>
> Also because we had to put the check into gem helpers, if your driver
> doesn't use those but hand-rolls a bit of that code (the helpers predate =
a
> bunch of drivers, not sure all got converted), then you might also have a
> validation gap here.
>
> Cheers, Sima
