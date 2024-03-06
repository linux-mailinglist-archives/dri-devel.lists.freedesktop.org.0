Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B7E873A24
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C308010F0A8;
	Wed,  6 Mar 2024 15:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JJSMYms3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C307810F0A8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 15:05:51 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-68facd7ea4bso4533616d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 07:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709737549; x=1710342349;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEL7jZMgML85VNjr4PtxvsHiPMSN5+DPoz2ZgxK9Hjw=;
 b=JJSMYms3aFX4pdQZEM935KUC1iDn1Rto6WkNPm+B95nat3KNAK3DNJj8gXQ9ayRTng
 k8heNmemNMcWWartErsmMqEG6RwwOD7BWUIiK4EdeS0FltPhgKq6Up3XemIkwczaadqN
 6QAd2VFCyJthLY3YKuXGMLdPlV5T0bKk8c2wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709737549; x=1710342349;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TEL7jZMgML85VNjr4PtxvsHiPMSN5+DPoz2ZgxK9Hjw=;
 b=hVVd1FsWPTv/RDBrHS9sjqfdiDRR4fGxOA06YSP20bZY0fmR+Hci+iT4Wob2O7VgVs
 pLhUTbOAZlfE0sdy+eTDg0+x/Vwe5u77RKkZENlQMSqiCe+geckQ6SFi/w8bXNdfd1u/
 FPEoraaOcpqXC9+v3tORe3nk0XvBbm1X6jhvfuxwc47X67gDQRe8Hvp8zlZoDJ9gjfYM
 nfRuAGizJxam0NMen3p+3rK1CCd4fAkPl812MYgGUFyPSA7u9XyCGDEfSvHJ8ulcrLpy
 ObKm6Z4CwzVkPrFKaliY+QNKvqQ4VSVlQNelV9KyHuAyNY/O79IDJyzhJULU+vZIhknQ
 vhKA==
X-Gm-Message-State: AOJu0Yw3R++sCaEBiZMffEhIsierJe5ObvuOlxoIpGqxmjJdQDLfXC7/
 WaAksJUZwtPTuKp+pzolJtnhpVUzP8tg9qWhESpDgeMIcCteB2GCN3+BhLVtxOlQM7hwz8nKCfR
 FMTHl
X-Google-Smtp-Source: AGHT+IFKx0RT6s1CYt55aTiPXwzgKNnCfPqfFfIzSWSlhA1UPCaU7MuOckYE7T4y2eoQ3qXu1Io7HA==
X-Received: by 2002:a0c:eccb:0:b0:690:8182:78f0 with SMTP id
 o11-20020a0ceccb000000b00690818278f0mr5715362qvq.16.1709737549052; 
 Wed, 06 Mar 2024 07:05:49 -0800 (PST)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 om10-20020a0562143d8a00b0068fbe134921sm7460073qvb.61.2024.03.06.07.05.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 07:05:48 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-42ee0c326e8so267661cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 07:05:48 -0800 (PST)
X-Received: by 2002:a05:622a:118e:b0:42f:a3c:2d46 with SMTP id
 m14-20020a05622a118e00b0042f0a3c2d46mr275703qtk.7.1709737547815; Wed, 06 Mar
 2024 07:05:47 -0800 (PST)
MIME-Version: 1.0
References: <20240227141928.1.I24ac8d51544e4624b7e9d438d95880c4283e611b@changeid>
 <60dc7697-d7a0-4bf4-a22e-32f1bbb792c2@suse.de>
In-Reply-To: <60dc7697-d7a0-4bf4-a22e-32f1bbb792c2@suse.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Mar 2024 07:05:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VSFEFPzFhvMKwc7D3NBgnDq9qRp6eN1stSuhBCi_HoMQ@mail.gmail.com>
Message-ID: <CAD=FV=VSFEFPzFhvMKwc7D3NBgnDq9qRp6eN1stSuhBCi_HoMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/udl: Add ARGB8888 as a format
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Sean Paul <sean@poorly.run>,
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

On Wed, Mar 6, 2024 at 4:07=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi,
>
> sorry that I did not see the patch before.
>
> Am 27.02.24 um 23:19 schrieb Douglas Anderson:
> > Even though the UDL driver converts to RGB565 internally (see
> > pixel32_to_be16() in udl_transfer.c), it advertises XRGB8888 for
> > compatibility. Let's add ARGB8888 to that list.
>
> We had a heated discussion about the emulation of color formats. It was
> decided that XRGB8888 is the only format to support; and that's only
> because legacy userspace sometimes expects it. Adding other formats to
> the list should not be done easily.

Sorry! I wasn't aware of the previous discussion and nobody had
brought it up till now. As discussed on #dri-devel IRC, I've posted a
revert:

https://lore.kernel.org/r/20240306063721.1.I4a32475190334e1fa4eef4700ecd278=
7a43c94b5@changeid


> > This makes UDL devices work on ChromeOS again after commit
> > c91acda3a380 ("drm/gem: Check for valid formats"). Prior to that
> > commit things were "working" because we'd silently treat the ARGB8888
> > that ChromeOS wanted as XRGB8888.
>
> This problem has been caused by userspace. Why can it not be fixed there?

I guess the one argument I could make is that the kernel isn't
supposed to break userspace. Before the extra format validation patch,
AKA commit c91acda3a380 ("drm/gem: Check for valid formats"),
userspace worked. Now it doesn't.

That being said, one can certainly argue that userspace was working in
the past simply due to relying on a bug. ...and in such a case fixing
the bug in userspace is preferred.

I don't personally know _how_ to fix userspace but it feels like it
should be possible.


> And udl is just one driver. Any other driver without ARGB8888, such as
> simpledrm or ofdrm, would be affected. Do these work?

It's the ChromeOS compositor. I can totally believe that those drivers
don't work. In this case, though, those drivers aren't needed by a USB
peripheral that someone might plug in. ;-)


-Doug
