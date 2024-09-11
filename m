Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC309975B5B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 22:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A7710EA8B;
	Wed, 11 Sep 2024 20:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mwF4tRV/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD0E10EA82
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 20:08:01 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4581ec0e00eso892871cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 13:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726085279; x=1726690079;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/UenxOqMB8aSc4sONnJe1Vz69L/1xBEXPOvkJcAvqc4=;
 b=mwF4tRV/Y0ZyRhMmv8R42gAwZGIeQrEzWcqNiS4g0E9pVxN8UcEKIIHbCLRj8PbagT
 xx8VkaqjvDw3ojbXa5mu7jt8aShqqw4BT2eIVFNj1tee3d+WoaoZndAiVRJbWm7cIQjo
 i/ksXwoNqxXepQhrYZ//FeOntX/RDKc+psw78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726085279; x=1726690079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/UenxOqMB8aSc4sONnJe1Vz69L/1xBEXPOvkJcAvqc4=;
 b=YdSUvTMtJYDgpcUXGxhDwsfq7/TNaW3my6Hl8xaYl5844voXL8u+aZxcTK5fdf4nG1
 4w7jbtbbFCp93e8v/Ir11Gk7qwyozL58jHMG2rEHc6CjG4KgMbVJhfI13gYx6v3ho5Fd
 pmPtcwwUtthDjC1eBR5VBzv8po7R02kR4+eEPmAgaVOdvXpy5eexEuwoad4md1dufA1Z
 ixzeSHxkJse7Mn2+evouLwaXMA9CiAcLAgHa/FvHY82LDe3650MfSckNbinkaf7+P3zV
 9kFl+H2ScIeCUG1OXGu9YzYZXhwjukTLQ8AFIBmH0fxkI0xoWEjhPYNDuxxidXyqxBO9
 quKw==
X-Gm-Message-State: AOJu0YyjSzG9CIBaO6Ke73rPYdKgEDdmGOFAPd3PPmb1KPmmAABjJ2gE
 wM5oy3FPqi5EyGu5DTCqRPNWa2RcZVzoe3YICMdSK4a/Lxu1p3nPaisH9POvYzFMT/lrrSPvoLk
 =
X-Google-Smtp-Source: AGHT+IHDIp03QXHucpR9O9F76xCDakLR64KvNbxltRalTDTTU8F0pifBQBoWEE8lGv0xbRGrl2kzYQ==
X-Received: by 2002:ac8:5f87:0:b0:453:5f05:2ba3 with SMTP id
 d75a77b69052e-458602bb10emr7610991cf.8.1726085278955; 
 Wed, 11 Sep 2024 13:07:58 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com.
 [209.85.219.50]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45822e637c5sm44532881cf.14.2024.09.11.13.07.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 13:07:57 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6c548eb3354so1359676d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 13:07:57 -0700 (PDT)
X-Received: by 2002:a05:6214:5984:b0:6c3:5dcf:bf5a with SMTP id
 6a1803df08f44-6c5735940b9mr13497026d6.37.1726085276966; Wed, 11 Sep 2024
 13:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725962479.git.jani.nikula@intel.com>
 <136ecd978aedd7df39d1b1c37b70596027ff0a3e.1725962479.git.jani.nikula@intel.com>
 <CAD=FV=XgddDYmOiX1ouQo2ayhJn4GVQrErj-XBy3og5eJ0uBOA@mail.gmail.com>
 <87h6amk49e.fsf@intel.com>
In-Reply-To: <87h6amk49e.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 Sep 2024 13:07:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vi58YipOuyy9uhU=ps=tUW8h33znpjfJW9VigJ-b8nHA@mail.gmail.com>
Message-ID: <CAD=FV=Vi58YipOuyy9uhU=ps=tUW8h33znpjfJW9VigJ-b8nHA@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/bridge: ti-sn65dsi86: annotate
 ti_sn_pwm_pin_{request, release} with __maybe_unused
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
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

On Wed, Sep 11, 2024 at 1:02=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Tue, 10 Sep 2024, Doug Anderson <dianders@chromium.org> wrote:
> > Hi,
> >
> > On Tue, Sep 10, 2024 at 3:04=E2=80=AFAM Jani Nikula <jani.nikula@intel.=
com> wrote:
> >>
> >> Building with clang, W=3D1, CONFIG_PM=3Dn and CONFIG_OF_GPIO=3Dn leads=
 to
> >> warning about unused ti_sn_pwm_pin_request() and
> >> ti_sn_pwm_pin_release(). Fix by annotating them with __maybe_unused.
> >>
> >> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused stat=
ic
> >> inline functions for W=3D1 build").
> >>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >>
> >> ---
> >>
> >> Cc: Douglas Anderson <dianders@chromium.org>
> >> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> >> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> >> Cc: Robert Foss <rfoss@kernel.org>
> >> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> >> Cc: Jonas Karlman <jonas@kwiboo.se>
> >> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> >> Cc: Nathan Chancellor <nathan@kernel.org>
> >> ---
> >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'm happy to land this in drm-misc-next unless there are any extra
> > dependencies. Let me know. In some sense I guess this could even be
> > considered a "Fix", though I guess given the history of the compiler
> > options that might be a bit of a stretch.
>
> drm-misc-next is fine. Agree on not considering this a fix.

It's only been on the list a day but it's simple so I just landed it
to drm-misc-next:

[4/8] drm/bridge: ti-sn65dsi86: annotate ti_sn_pwm_pin_{request,
release} with __maybe_unused
      commit: 868cd000c19f77e4c25ce87c47b6f951facf4394
