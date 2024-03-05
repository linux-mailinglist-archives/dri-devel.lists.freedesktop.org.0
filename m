Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FFD872489
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 17:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E1310E519;
	Tue,  5 Mar 2024 16:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="T7ms4AWr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B464110E519
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 16:41:54 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-564fc495d83so7205919a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 08:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709656909; x=1710261709;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4dWdOILkv04MghoL0J2bObNEGpgLHwKa8AFZCAJqUcE=;
 b=T7ms4AWrk6vYCmBkQ9S3jlQQOSBtbwZKUUEZwOb35YGeTFLDGtnDQluFTezICvA6BN
 4RVxlrF9Fc5ClaM9jOoE06JcGV3NZscYRMJYd/ufG0/I0ko3AugsXvwYPT6UQNTf3Bu8
 HFkvYEdkP/yx8TSQgKLvwd2QRI+dMatpH86KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709656909; x=1710261709;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4dWdOILkv04MghoL0J2bObNEGpgLHwKa8AFZCAJqUcE=;
 b=DqlADaybwmF7k62w4isLWw9DiYEZEuqCsBoqpNAps6K218cNwrVJcHzPmkh1mGGE/E
 Lhlgq885lDulIT2IzNSdnb2zMUGRmYjgbMR6VVXdL3xdzFZfBuWhcyH21cDU8Y0Kibbx
 hieyuHxwNLGoCrG4n8/rDNeQZ0Nb6P5tsL98dw/GEsK/W+W26UVYTxm479w/BFW/9AcD
 gfg8kD5u4UVsHFAeHFW4DDfg1vHnU1h3wQYwfJh0HTiIoAK1zJ1WhK1hDPe4T2awuQKb
 zH7F0GOmH8y6DpBEecZ8qFDlCiFW765HHw/7s+4xTA0C2oZH/SMYGwHPPkQiFBRJWUsb
 ytZA==
X-Gm-Message-State: AOJu0YxdjxF/JC6QWAALGD0K1aAgt86IYsss/4m+8GormtQBdnb24RyV
 EVYlvd8/exVJACZ/ILdzvOt+T+DtJHQjzWlwQmjU0iLPi0yM6otM2Lsd9JMoqkjrRKyYFrKFfn2
 6A2o3
X-Google-Smtp-Source: AGHT+IGx0VrXdiKtfHi9SDCX3WR0Up+DoaGJutb4OljtI8ekReezIyalClbKU25eIkZR9nM3qn2vxw==
X-Received: by 2002:aa7:c594:0:b0:567:66b:6bde with SMTP id
 g20-20020aa7c594000000b00567066b6bdemr6844196edq.39.1709656909637; 
 Tue, 05 Mar 2024 08:41:49 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05640243c300b0055edfb81384sm5903070edc.60.2024.03.05.08.41.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 08:41:48 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-412dd723af4so95235e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 08:41:47 -0800 (PST)
X-Received: by 2002:a05:600c:1c90:b0:412:e426:a1a7 with SMTP id
 k16-20020a05600c1c9000b00412e426a1a7mr141737wms.1.1709656907185; Tue, 05 Mar
 2024 08:41:47 -0800 (PST)
MIME-Version: 1.0
References: <20240227141928.1.I24ac8d51544e4624b7e9d438d95880c4283e611b@changeid>
 <CAA8EJppQYQCGL8UCX28JwrkX7Nb4pQStboXbyaEw=T+D6F-OAQ@mail.gmail.com>
In-Reply-To: <CAA8EJppQYQCGL8UCX28JwrkX7Nb4pQStboXbyaEw=T+D6F-OAQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Mar 2024 08:41:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WNCmU9wzZKvcZJH3Cr75tHBrFpfVwro9AG-Mvup7UooA@mail.gmail.com>
Message-ID: <CAD=FV=WNCmU9wzZKvcZJH3Cr75tHBrFpfVwro9AG-Mvup7UooA@mail.gmail.com>
Subject: Re: [PATCH] drm/udl: Add ARGB8888 as a format
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 linux-kernel@vger.kernel.org
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

On Tue, Feb 27, 2024 at 3:26=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 28 Feb 2024 at 00:19, Douglas Anderson <dianders@chromium.org> wr=
ote:
> >
> > Even though the UDL driver converts to RGB565 internally (see
> > pixel32_to_be16() in udl_transfer.c), it advertises XRGB8888 for
> > compatibility. Let's add ARGB8888 to that list.
> >
> > This makes UDL devices work on ChromeOS again after commit
> > c91acda3a380 ("drm/gem: Check for valid formats"). Prior to that
> > commit things were "working" because we'd silently treat the ARGB8888
> > that ChromeOS wanted as XRGB8888.
> >
> > Fixes: c91acda3a380 ("drm/gem: Check for valid formats")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/udl/udl_modeset.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

It's been ~a week, the fix is trivial, and according to MAINTAINERS
this driver goes through drm-misc. ...so I've applied this with
Dmitry's tag (thanks!) to drm-misc-fixes.

95bf25bb9ed5 drm/udl: Add ARGB8888 as a format

-Doug
