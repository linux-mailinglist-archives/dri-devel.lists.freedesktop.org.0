Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEC2836C58
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 18:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BC610E090;
	Mon, 22 Jan 2024 17:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECCA10E090
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 17:02:40 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a2821884a09so254314866b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 09:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705942896; x=1706547696;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uy+XgE6dRrCm1kEyPh0L3J8oRZMz37vPT45FSGIvqe8=;
 b=Kojaixvw4EBvrgDZfntlxZ6KHuGA+VitZVJaGlbBFUvwrU7y7rI4ddpzv1n28KcpJW
 TcprBRPNYalJb5e1rR2nDPRBEnTFSiOChO8flRCTYx5McRcV4rI/tjROwgqRUtSRRpVm
 c/46wo2l6NN0g9zc2A/A87kfHlum5I4EcdP1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705942896; x=1706547696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uy+XgE6dRrCm1kEyPh0L3J8oRZMz37vPT45FSGIvqe8=;
 b=pH2iizmvX9OoH29feB8bejYOzt6i6u7XR1miQf4cYt2BVpayWXVG/w057sJgU60pWW
 yhZT1t6H/RuyEOAnLPozYYBEK8bd05zCvWZVixIJRCUEeSrz2BMTMvxLlHAnEj66nUpC
 9gcFZZZ9IUgYUcmw2zQjJ/JmLVdqh03eggnjwPkLUJgXo7EvLxfuf/4oRz6lP3VXWBre
 YhKux76o6vpiKgtMnMqS2nf79BY6dvq/W+/PrBSEHWz2cR9O9RbIdJwgQlc/dK/0JTkB
 t8g3dYCp1npGZ9A7OXd01CG/rkJnNm6O/SIxDu2E77KvP8RV3lE98jZQxFx49JF0FQoR
 bWGQ==
X-Gm-Message-State: AOJu0YzweF2IYH3EE3z8uINx5OcTdxdagssnIPozzP0dOS2LtIJ1d/oM
 UZafU/y3EJkDfpbZXx6Tsx+BYbAncvJn6+tMfsY3KbJ+RfHtP80evP0JcZv2aqcauEkKOdXALrA
 Ftg==
X-Google-Smtp-Source: AGHT+IHd+88XPoNeIhhGJWdsyMD+gpZ2Q0DMK4BkewwIeLtRB3C6I1E7Z+zOWETX2Uz4HGhLtx2HKw==
X-Received: by 2002:a17:907:7357:b0:a2e:9ac1:4357 with SMTP id
 dq23-20020a170907735700b00a2e9ac14357mr2421051ejc.44.1705942896374; 
 Mon, 22 Jan 2024 09:01:36 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 lt18-20020a170906fa9200b00a2ac199ff67sm13689315ejb.170.2024.01.22.09.01.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 09:01:35 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-40e865bccb4so87405e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 09:01:35 -0800 (PST)
X-Received: by 2002:a05:600c:4fd0:b0:40e:61cf:af91 with SMTP id
 o16-20020a05600c4fd000b0040e61cfaf91mr340412wmq.7.1705942895107; Mon, 22 Jan
 2024 09:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20240118015916.2296741-1-hsinyi@chromium.org>
 <CAD=FV=WYm0=uyQMf8yZpqaCWN2dympTt_bUVPOe+nafBLdS_DQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WYm0=uyQMf8yZpqaCWN2dympTt_bUVPOe+nafBLdS_DQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jan 2024 09:01:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UXqsULhVL0Mpk=V0VoR1yQaeBQA_6zYriCdQxNfEHktA@mail.gmail.com>
Message-ID: <CAD=FV=UXqsULhVL0Mpk=V0VoR1yQaeBQA_6zYriCdQxNfEHktA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Ensure bridge is suspended in
 disable()
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pin-yen Lin <treapking@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jan 18, 2024 at 9:30=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Jan 17, 2024 at 5:59=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org=
> wrote:
> >
> > Similar to commit 26db46bc9c67 ("drm/bridge: parade-ps8640: Ensure brid=
ge
> > is suspended in .post_disable()"). Add a mutex to ensure that aux trans=
fer
> > won't race with atomic_disable by holding the PM reference and prevent
> > the bridge from suspend.
> >
> > Also we need to use pm_runtime_put_sync_suspend() to suspend the bridge
> > instead of idle with pm_runtime_put_sync().
> >
> > Fixes: 3203e497eb76 ("drm/bridge: anx7625: Synchronously run runtime su=
spend.")
> > Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid through=
 aux channel")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Tested-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 7 ++++++-
> >  drivers/gpu/drm/bridge/analogix/anx7625.h | 2 ++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
>
> This looks good to me.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I guess this started showing up more because of commit 49ddab089611
> ("drm/panel-edp: use put_sync in unprepare"), right? Since that's a
> recent commit then that means there's probably a little more urgency
> in getting this landed. That being said, it feels like it would be
> most legit to allow this to hang out on the list for a few days before
> landing. I'll aim for early next week unless someone else has any
> comments.

Pushed to drm-misc-fixes.

4d5b7daa3c61 drm/bridge: anx7625: Ensure bridge is suspended in disable()


> I guess we should see if we need to do something similar for
> ti-sn65dsi86 too since I could imagine it having similar problems.

I tried this myself and I couldn't see any problems there. I also
spent some time thinking about it and it seemed fine. There should be
no fundamental reason why we'd have to necessarily power cycle the
bridge chip in this case. Presumably ps8640 needs it because the
embedded firmware on ps8640 is easy to confuse. I'm less familiar with
the anx bridge chip, but I could believe something similar is
happening there.

-Doug
