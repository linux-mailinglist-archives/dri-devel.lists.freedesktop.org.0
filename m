Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7A292AACD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 22:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B8110E0E0;
	Mon,  8 Jul 2024 20:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NmOzuS9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B4810E0E0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 20:57:19 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-64d408a5d01so40861487b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 13:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720472238; x=1721077038;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r3bRIc+iREACl7d76GifVlBEhZSKcdfkiZIocigdrSs=;
 b=NmOzuS9pvvhBP8mqmT+9S7lnFdffS6OnaIjRwrNtc4jSnq8YgJxq3H8OBu7o9XKX9C
 o0/jGRoWZIodV7lDk5iq8bI06GGS0g4fC/75pI/LdkAygIc3W4fsPFwv3kCOWBX6jBPb
 nbYCY4dbVeYT9EzAu1f04BXHRwOSycUxTi3bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720472238; x=1721077038;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r3bRIc+iREACl7d76GifVlBEhZSKcdfkiZIocigdrSs=;
 b=KkA09poXRPsn0TQeAW84HH2LrNIbhUQ7j7ky2NUcd+/StHtVRyKTJFIpoZlp0mCcje
 jzWlJFtMl65l1h9av20IPezuA7mPtvBiCAikk/KED2iKakGaXVrQ6U0CqTOBEZnCAc5G
 vNA+HXdcJRchVyx8qL8IFXebv2tq5Wz2ic5AcSqnAEwvtqrtsG7UnpmBVqCtwKSa/19r
 DOmFAikwf5iSnuruW65LqW2KoqmTkqI82obQ3Qusp6shb66D6YcdC5Wgm+y99NyWVQWT
 xn93U6rOc8zxalvev5mv7aLvAyX64RYg7kQ0KGeEHPtt/cIjbEx84PcdbmfPDE1/JMNC
 y6Vw==
X-Gm-Message-State: AOJu0YwftiBbF7iJbudoXU2QATaMtf5j4c0fNMMjttWJaOktO+r4e4zk
 F4apYcSo+oN+Grv9UoCjCyhiT5RIadyExYIDXC4ljxrh9MH1lt9/1dqF5JVbNu2hTNn3EZpUl2g
 =
X-Google-Smtp-Source: AGHT+IH8c/Tz9YzAUBIf1/FCqdiRCu/QNkuN7QW2vkJQz2UWRlQnQcdK2wfdiLEdF/NzscLP9esCpQ==
X-Received: by 2002:a05:690c:d8d:b0:64a:e7ec:f45 with SMTP id
 00721157ae682-658f02f4d28mr10023787b3.40.1720472237694; 
 Mon, 08 Jul 2024 13:57:17 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f18ff6a7esm27853085a.1.2024.07.08.13.57.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 13:57:17 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-447dabd9562so96071cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 13:57:16 -0700 (PDT)
X-Received: by 2002:ac8:7f4e:0:b0:447:e76a:c04b with SMTP id
 d75a77b69052e-447fb2f9b6dmr1122301cf.10.1720472236373; Mon, 08 Jul 2024
 13:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240612222435.3188234-1-dianders@chromium.org>
 <20240612152336.v2.3.Ifb4450979b62976fd5a98847dade2e5b377d47c8@changeid>
 <D2ALRV4G5SZF.229WKTA9B95QN@gmail.com>
In-Reply-To: <D2ALRV4G5SZF.229WKTA9B95QN@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Jul 2024 13:57:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xs16yXRDURfW_7QA_t4nZhOmpPXiibsLs2BBzJr_h+4Q@mail.gmail.com>
Message-ID: <CAD=FV=Xs16yXRDURfW_7QA_t4nZhOmpPXiibsLs2BBzJr_h+4Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] drm/tegra: Call drm_atomic_helper_shutdown() at
 shutdown time
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
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

On Wed, Jun 26, 2024 at 11:58=E2=80=AFPM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> On Thu Jun 13, 2024 at 12:23 AM CEST, Douglas Anderson wrote:
> > Based on grepping through the source code this driver appears to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > time. Among other things, this means that if a panel is in use that it
> > won't be cleanly powered off at system shutdown time.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case
> > of OS shutdown/restart comes straight out of the kernel doc "driver
> > instance overview" in drm_drv.c.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > This commit is only compile-time tested.
> >
> > (no changes since v1)
> >
> >  drivers/gpu/drm/tegra/drm.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
>
> Acked-by: Thierry Reding <treding@nvidia.com>

Pushed this one to drm-misc-next:

[3/8] drm/tegra: Call drm_atomic_helper_shutdown() at shutdown time
      commit: bc5846d3d3dff9f057e2897a736b51584785da30
