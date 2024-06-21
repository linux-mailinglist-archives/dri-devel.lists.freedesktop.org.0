Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9681C912EF8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 22:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0497C10E268;
	Fri, 21 Jun 2024 20:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="B7w2Xi+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC1910E268
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 20:53:30 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3762ef0c451so3649435ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1719003208; x=1719608008;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vvcq6KNwg3xO4omyLiVP0kO5WMfy03mczyeSqWYQtY=;
 b=B7w2Xi+kY8FDKG2BB+mEPcCKCxQGOilfoMkV5x9MRsnmfXo2XqSt/8qoHpwUzC68Yn
 Sv6OG1o0h2E+Q1fUod8jCnaFCu3JOcnKtNAVNuBwTUInuowGizvlzMT5BntOYj8KxZMV
 OP9NmNcTDEgutyQdeRtiSOoKE1rZ4kBFaORrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719003208; x=1719608008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vvcq6KNwg3xO4omyLiVP0kO5WMfy03mczyeSqWYQtY=;
 b=ovXdHvlFEGgnSEN1eGmGmwfIIQ5fufK2MCYTt2fn3DeBQAKjR9IZn7afAzH0YDJUDU
 zIg0bT3s5DK9Xyuww/+6Qq6hQfN0/xH1sNQmrkNGxwn6rIts0UJRmJw8hf2iC1ib964L
 kqr17YaC78yQmGj1vzJiG7zi2s/soHErRBrf9kOKlcWtC+XohVpF6J1OO5r5XUDAMQqE
 H9GT3QUflHONKJUohWxMf5fBe6ovbGu2SGQVoqM+2vNRzghaM+OEqt+ShuApAVC/js+7
 mFV4C6pDqdyPHCPAsA68MBIgjjNItoSAtTCl8J0j1wRHMDuUMF3sDguIKhs4DSaeYZWv
 QdPg==
X-Gm-Message-State: AOJu0YyJeW6FuswcsUSXxsF3ZkWQ35AHjWRi7AluAVmMes23S8hd2l8Y
 Mp/CGnQZu5h3V8qz8yfG1Gc7jh7eiwd4ObAPSoq1b+bJkAyO7PljDuEIRoDl/OS8JRMQqpW6+zk
 =
X-Google-Smtp-Source: AGHT+IGSMLERTquu1QyJS3AVc1rf8JR5ah2z2D/iROOzS3W2bPajMsy5DaS8/WzRZcmKkErGilEixA==
X-Received: by 2002:a05:6e02:1523:b0:375:a3d8:97a5 with SMTP id
 e9e14a558f8ab-3761d68b13bmr108557865ab.5.1719003208409; 
 Fri, 21 Jun 2024 13:53:28 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com.
 [209.85.166.175]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3762f3a6b25sm5071125ab.83.2024.06.21.13.53.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jun 2024 13:53:27 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-375fc24a746so138185ab.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:53:27 -0700 (PDT)
X-Received: by 2002:a05:622a:38e:b0:441:565e:8d31 with SMTP id
 d75a77b69052e-444ce32b611mr440721cf.19.1719002828083; Fri, 21 Jun 2024
 13:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240621134427.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
In-Reply-To: <20240621134427.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Jun 2024 13:46:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VwebY8F3XjeVt6kvKwB7QZ8Khn5oJJoDThuemiGx9y+g@mail.gmail.com>
Message-ID: <CAD=FV=VwebY8F3XjeVt6kvKwB7QZ8Khn5oJJoDThuemiGx9y+g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, 
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org, 
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

On Fri, Jun 21, 2024 at 1:45=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> At shutdown if you've got a _properly_ coded DRM modeset driver then
> you'll get these two warnings at shutdown time:
>
>   Skipping disable of already disabled panel
>   Skipping unprepare of already unprepared panel
>
> These warnings are ugly and sound concerning, but they're actually a
> sign of a properly working system. That's not great.
>
> We're not ready to get rid of the calls to drm_panel_disable() and
> drm_panel_unprepare() because we're not 100% convinced that all DRM
> modeset drivers are properly calling drm_atomic_helper_shutdown() or
> drm_helper_force_disable_all() at the right times. However, having the
> warning show up for correctly working systems is bad.
>
> As a bit of a workaround, add some "if" tests to try to avoid the
> warning on correctly working systems. Also add some comments and
> update the TODO items in the hopes that future developers won't be too
> confused by what's going on here.
>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This patch came out of discussion on dri-devel on 2024-06-21
> [1]. NOTE: I have put all changes into one patch since it didn't seem
> to add anything to break up the updating of the TODO or the comments
> in the core into separate patches since the patch is all about one
> topic and all code is expected to land in the same tree.
>
> Previous versions:
> v0: https://lore.kernel.org/r/20240604172305.v3.24.Ieb287c2c3ee3f6d3b0d5f=
49b29f746b93621749c@changeid/
> v1: https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b2=
9f746b93621749c@changeid
>
> [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=3Ddri-devel&d=
ate=3D2024-06-21
>
>  Documentation/gpu/todo.rst           | 35 +++++++++++++---------------
>  drivers/gpu/drm/drm_panel.c          | 18 ++++++++++++++
>  drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++-------
>  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++-------
>  4 files changed, 68 insertions(+), 37 deletions(-)

Ugh! I realized right after I hit "send" that I forgot to mark this as
V2 and give it version history. Sorry! :( Please consider this to be
v2. It's basically totally different than v1 based on today's IRC
discussion, which should be linked above.

If I need to send a new version I will send it as v3.

-Doug
