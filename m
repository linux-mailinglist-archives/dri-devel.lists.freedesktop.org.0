Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34F38569A9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 17:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117FE10E9D8;
	Thu, 15 Feb 2024 16:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ss4cvBmS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4129710E9C7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 16:37:15 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6e2da00185dso606823a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 08:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708015032; x=1708619832;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KmHGzp5FxmeS/Awr4jPPRzY9AtNn0hlFjjkqswS8JcA=;
 b=Ss4cvBmSsll0QkmC6lZ09SaBGM6sDTAJkK7m7HLO1WABP/SYwZ65fAc79sO04oXabt
 OLF0uSgy9oHZdD9gaG4AwL9Mcrf8PkQoOUOvP3n2evqjOF3KiDVLyYzy6vnZcEfLAOH3
 sgLUdmJBrN82veRSENn24Y5W26YWqddwhab94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708015032; x=1708619832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KmHGzp5FxmeS/Awr4jPPRzY9AtNn0hlFjjkqswS8JcA=;
 b=qcsXtT83ZUnwnVs8n9FxWJruSwt0QBro1Lw7hINivOKM0ioswv3HxUlyxdMnnwvTtm
 172fh8r1gjQokmWpwnCSvmYCC6DRhdtLO83ROrLe4uWdh8s0E2dAlZcIhIkPb+3IPJ8C
 W+dbQ0VT7cHsxiNhEWq0KVvHSubotZD3hWm3ATc0dFJieUAZ3I5lCxbbM0J4ucGWoleR
 9SMdE7WXKP9KyNZlcKBLDKeltL3rjJl2GVx/bSQO6Cqj0CFhYl09Yd9KM3HF1jZoiCK0
 q4aUkaKGZKV5b3ZkW8S/eO9sAI+s6rzf3dKb0GgzcOc8IELFhrS4oq+JQ0921fXIWJPA
 PyCQ==
X-Gm-Message-State: AOJu0YwvD1KuO6z2gxmkFuz61wkfsGDdyqBqXciei0pm11Lla6gcviiB
 PR/kV79Hsf+uXkd3l4YJyjYRJLkI768NKPbibAyrWpG+gbi7dKggm8cnv22UK07Au+b7Sb3W/Q7
 w7Cin
X-Google-Smtp-Source: AGHT+IG4Pyx0FeTtCELvH1I0i35ZcZvNsgoAmYIkjMbGCdYBcyeTJqwKzO2M/0LJCesIF2BwF+/zjg==
X-Received: by 2002:a05:6830:13d7:b0:6e2:f6b9:bdf9 with SMTP id
 e23-20020a05683013d700b006e2f6b9bdf9mr2001396otq.15.1708015032166; 
 Thu, 15 Feb 2024 08:37:12 -0800 (PST)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 h22-20020ac87156000000b0042c5512c329sm705931qtp.17.2024.02.15.08.37.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 08:37:11 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-42dc7306ca1so181591cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 08:37:11 -0800 (PST)
X-Received: by 2002:ac8:1247:0:b0:42c:1aba:c8c4 with SMTP id
 g7-20020ac81247000000b0042c1abac8c4mr13457qtj.12.1708015030579; Thu, 15 Feb
 2024 08:37:10 -0800 (PST)
MIME-Version: 1.0
References: <20240214072435.1496536-2-hsinyi@chromium.org>
 <CAD=FV=VmDZvWVJ+DKN5bMPvJaLouNq26=Qyd4N9O+a0FeWCJpA@mail.gmail.com>
In-Reply-To: <CAD=FV=VmDZvWVJ+DKN5bMPvJaLouNq26=Qyd4N9O+a0FeWCJpA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 15 Feb 2024 08:36:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xeq59G_teWKj4LkUCMxQqVh4Hzjp1hWRU4VDBAUW9TqA@mail.gmail.com>
Message-ID: <CAD=FV=Xeq59G_teWKj4LkUCMxQqVh4Hzjp1hWRU4VDBAUW9TqA@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/panel-edp: Add auo_b116xa3_mode"
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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

On Wed, Feb 14, 2024 at 1:41=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Feb 13, 2024 at 11:24=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.or=
g> wrote:
> >
> > This reverts commit 70e0d5550f5cec301ad116703b840a539fe985dc.
> >
> > The overridden mode fixes the panel glitching issue on mt8186 chromeboo=
k.
> > However, it causes the internal display not working on mt8173 chromeboo=
k.
> > Revert the overridden mode for now to let mt8173 have a functional disp=
lay.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 19 ++-----------------
> >  1 file changed, 2 insertions(+), 17 deletions(-)
>
> Given that the breakage for affected mt8173 Chromebooks is pretty bad
> (black screen), I'll plan to just wait an extra day for any screams
> and then I'll apply to drm-misc-fixes.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

It caused a merge conflict against drm-misc-fixes since other panels
have been added in the meantime. I'm going to stick this in
drm-misc-next to avoid the merge headache. If someone is affected and
really wants this in fixes, please shout and we can figure out how to
make it happen.

1a5e81de180e Revert "drm/panel-edp: Add auo_b116xa3_mode"

-Doug
