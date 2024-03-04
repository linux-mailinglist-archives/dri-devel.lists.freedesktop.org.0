Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914CB8706CE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84F81122F5;
	Mon,  4 Mar 2024 16:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Am8V6hM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B6A1122F5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:17:55 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-565b434f90aso6792340a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 08:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709569070; x=1710173870;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=km22joOP3BJvhNiKy5z6xew4BuTiJqbVYs51+71h3NQ=;
 b=Am8V6hM3ZaqM83NpKIqPg4ja05LfwCtGcv7QZVotNnkxB/Z0jqTooxHxdewe655XKb
 h7fTVYIxMiSaKok9aJq3/6DLXijoVLGpvHo70q5yUMCJTa4BKGAFCUhOQr9Kl6S9QMXe
 92gCQ1R8db31gl09VTMrolRZsLyJQfhbV7qZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709569070; x=1710173870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=km22joOP3BJvhNiKy5z6xew4BuTiJqbVYs51+71h3NQ=;
 b=ZheW/AVP62a4DqhKoG1XVcfFfsNwOMyM62FOR3hhBUM1UFtrJ1c/jShveNSJstTJgS
 DYzYZc6l/ZPx4mDhLJfP59Z5HHvTMuiOLkQ5+XKOdRrKFeplOBC31ZQ8jSPHNzbj+Q+m
 UKFFw+BHKzb4avGSvvAZ2TOL7ZQDfHcwUdkKYwyCchbsU0dm8iKUjcgCNovL6WGArd/O
 KuYI6vPqBbOX7kWctTbwzf1sQSJvoHwnu8i/1zh1wyK8efE2d19krkmogFTkrwvgFTnH
 G3Mq4Z1R8JIG79LhkTa5N58uQMvGe8/HVI8UZqWr1T9Qo0rsPDnx30g7RMT/A+32t0u5
 F0/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQUJ0WAJOVn9aWJeVy6QFaVhcQ3TmlanSALuUNY7aI4cgUeVOWvIaxpgQGclTRgYxlTJtfbTKNFNG+XLiu3tjvjwLx+XhqR6t8KBalU56n
X-Gm-Message-State: AOJu0Ywa8L1oszQymJKHH8P4l7LqTEQg9u83Ckl8V3/vrxpGzgjXVIkJ
 Erg2Zy5hcE4A9SQkToRubvJt8X2ao3SjokKrqnCJTFmG7VG+CaMOHYoMMnwb+4mCz+cCTS5K7mj
 yVQ==
X-Google-Smtp-Source: AGHT+IFxmeA8LKTHf7kV4v1imdvnM0wH2MlVS6sj4j8SZkWSrff/ji1XVqeL8tWikMxqPs4j9OcJow==
X-Received: by 2002:a05:6402:c94:b0:566:a235:7f14 with SMTP id
 cm20-20020a0564020c9400b00566a2357f14mr6428416edb.16.1709569070676; 
 Mon, 04 Mar 2024 08:17:50 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 n3-20020aa7db43000000b005656bbb5b3fsm4797589edt.63.2024.03.04.08.17.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 08:17:49 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-412d84ffbfaso93925e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 08:17:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW09NRW7lnetP8aiOI5yu/53mBnPIkp3CDg6ahknvgMn+l23xqJJJzC7g7+PiX6d8DnXmMsVMS/WyAZ4avSDyE9bg94CNyqjnKFNKTR0vvc
X-Received: by 2002:a05:600c:518b:b0:412:e492:7e5 with SMTP id
 fa11-20020a05600c518b00b00412e49207e5mr156141wmb.1.1709569068931; Mon, 04 Mar
 2024 08:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <20240223223958.3887423-2-hsinyi@chromium.org>
 <87wmqqjmt9.fsf@intel.com>
 <CAJMQK-jSPg6vU3SLmRy7zwNHJ4yqO2hT6RaiYxA4ifZ7CzwD9Q@mail.gmail.com>
 <CAD=FV=WU-2yystd40e+g9VNDNTiv5c=nP0uQg-AR03o7UGMTdA@mail.gmail.com>
 <87bk7z6x1w.fsf@intel.com>
 <CAD=FV=Wzm9Y7m9Q6KqO7yWdnc1xToaRMb2f1s2TQMJqpqVYLOg@mail.gmail.com>
 <CAA8EJpqHJTbc+TCpkccjx_eQH36zaNgcQ9QssecNeQUQgfYApQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqHJTbc+TCpkccjx_eQH36zaNgcQ9QssecNeQUQgfYApQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Mar 2024 08:17:32 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XyV=V-USfq8kp058=FzRQq=bPA5A4GDb1p0zO-KPbtwQ@mail.gmail.com>
Message-ID: <CAD=FV=XyV=V-USfq8kp058=FzRQq=bPA5A4GDb1p0zO-KPbtwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm_edid: Add a function to get EDID base block
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Mar 3, 2024 at 1:30=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > The problem is that Dmitry didn't like the idea of using a hash and in
> > v2 Hsin-Yi has moved to using the name of the display. ...except of
> > course that eDP panels don't always properly specify
> > "EDID_DETAIL_MONITOR_NAME". See the discussion [1]. If you want to see
> > some of the EDIDs involved, you can see Hsin-Yi's post [2]. The panels
> > included stuff like this:
> >
> >     Alphanumeric Data String: 'AUO'
> >     Alphanumeric Data String: 'B116XAN04.0 '
> >
> > The fact that there is more than one string in there makes it hard to
> > just "return" the display name in a generic way. The way Hsin-Yi's
> > code was doing it was that it would consider it a match if the panel
> > name was in any of the strings...
> >
> > How about this as a solution: we change drm_edid_get_panel_id() to
> > return an opaque type (struct drm_edid_panel_id_blob) that's really
> > just the first block of the EDID but we can all pretend that it isn't.
> > Then we can add a function in drm_edid.c that takes this opaque blob,
> > a 32-bit integer (as per drm_edid_encode_panel_id()), and a string
> > name and it can tell us if the blob matches?
>
> Would it be easier to push drm_edid_match to drm_edid.c? It looks way
> more simpler than the opaque blob.

Yeah, that sounds reasonable / cleaner to me. Good idea! Maybe Hsin-Yi
will be able to try this out and see if there's a reason it wouldn't
work.

-Doug
