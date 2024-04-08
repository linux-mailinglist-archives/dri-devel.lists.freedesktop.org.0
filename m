Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B9F89B802
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 08:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF549112162;
	Mon,  8 Apr 2024 06:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CU2h23oM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DE6112162
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 06:55:19 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4347cbdb952so4481201cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Apr 2024 23:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712559314; x=1713164114;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxld6Wy8KQmN20c+bWuyU8Dcu8mgfZTFKb7o7eOZHzE=;
 b=CU2h23oMhll0Ja3YHRxlIdlVLD/Oos7l69LwTws+5iMEvTToLU98qPKWnH8HYObeh+
 Xzvof1D8kK33cwStoycgmbiaTepwhHppmzw/xRUt/LUIDz5IlYJzxr/InYRo/1czdcio
 EiUyrgRkZxEuGbrx7Cmko3vOUuhRS+DcblZDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712559314; x=1713164114;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nxld6Wy8KQmN20c+bWuyU8Dcu8mgfZTFKb7o7eOZHzE=;
 b=vpg9CQntxj+RlOjEO1q4FTCZeGyMLzmEVn8He+yqSyYMoWrZI+x1R28svCUA0BIG+A
 aKjujTqntpUY3iNNHRe0Y+9PrOlz/wUK+GJjzsRlofWOWdWwo6L1EwkCHdr9reAN+IXh
 U4TybNHFUDTeDQ3hhtmjw3clO45pMKzzz/PjqzLbzvrygfL+/r71R9DiBoWkh6WbPWfl
 pjCaF/pz72/kV/srNZCDjUdnyVfJLlDoJ5bLLbqJLX9ixnyoTdnCI4fksKHj3EQmj2TT
 KWskvojuXxff7bQICesjl7G/eyq/Vj2b7RWmpiPyMsVTgltKD+lc2eO4aHZexF+plS5T
 Krmg==
X-Gm-Message-State: AOJu0Yz2ANh6slKaY7wS+5/0pGb3HogOybN8DZVjLfCkHrjeYm/a+Vu3
 0olbB9CuAjb3nslwK4Ac+593RYQ7ylJ7LOhfDREQJNHTveqhb5JVysU9teCI31rNzxyMbWP0HB2
 0UA==
X-Google-Smtp-Source: AGHT+IG7JQhqOVwzZClu/AsF6uSdwtYNaQbv2cMqKAwaiejLv5psIgjNpK0kGJfmJOQcNsBUUQ3j3Q==
X-Received: by 2002:ac8:7fd5:0:b0:432:939:de2c with SMTP id
 b21-20020ac87fd5000000b004320939de2cmr10346930qtk.14.1712559314586; 
 Sun, 07 Apr 2024 23:55:14 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 cb22-20020a05622a1f9600b00430eb19dd06sm3426979qtb.91.2024.04.07.23.55.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 23:55:13 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-42ee0c326e8so346231cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Apr 2024 23:55:13 -0700 (PDT)
X-Received: by 2002:a05:622a:510b:b0:430:ed37:bad0 with SMTP id
 ev11-20020a05622a510b00b00430ed37bad0mr368183qtb.13.1712559312989; Sun, 07
 Apr 2024 23:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240325215631.3804796-1-dianders@chromium.org>
 <20240325145626.1.I659b2517d9f619d09e804e071591ecab76335dfb@changeid>
 <CAJMQK-gcN06k2zFQoSYKZcxxoRvkXVqCFmFtQ0xUS=+1VG+92Q@mail.gmail.com>
In-Reply-To: <CAJMQK-gcN06k2zFQoSYKZcxxoRvkXVqCFmFtQ0xUS=+1VG+92Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 7 Apr 2024 23:54:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQXzJJG4Lf1=LR=sDs6M4w8auLzfc_uG1Hb-9qC_qaRg@mail.gmail.com>
Message-ID: <CAD=FV=UQXzJJG4Lf1=LR=sDs6M4w8auLzfc_uG1Hb-9qC_qaRg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel-edp: Abstract out function to set
 conservative timings
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>, 
 Prahlad Kilambi <prahladk@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Mon, Mar 25, 2024 at 4:52=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> On Mon, Mar 25, 2024 at 2:56=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > If we're using the generic "edp-panel" compatible string and we fail
> > to detect an eDP panel then we fall back to conservative timings for
> > powering up and powering down the panel. Abstract out the function for
> > setting these timings so it can be used in future patches.
> >
> > No functional change expected--just code movement.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

Pushed to drm-misc-next:

2cbee8ae55f5 drm/panel-edp: Abstract out function to set conservative timin=
gs
