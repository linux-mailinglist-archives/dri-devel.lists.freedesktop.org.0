Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D496B827A3D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 22:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468C610E2FC;
	Mon,  8 Jan 2024 21:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2030E10E2FC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 21:34:45 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-55770379ed4so2155444a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 13:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1704749680; x=1705354480;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWxsWguEo6oxPOkdBZrsX0wCrUXIc1xVbC/XTm3MrEA=;
 b=VNGpGRLE9I9PCr/+H9a3OAiPeAmYHBbH0PakT8rVFQRdWEiic45zpDpMIX6fsReK5d
 l2u3DLsg9Enu1K5FBcC5rwdfh4PkaGQF01OFsCYGxRLe68UI70ZPBdEvDU0tH2siyDa3
 i/eg9m69J3LMG//qvjXa5PrAog5m4ygM2AGT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704749680; x=1705354480;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UWxsWguEo6oxPOkdBZrsX0wCrUXIc1xVbC/XTm3MrEA=;
 b=NBAZHGAgkBbDlMnX5kj8HDxLjfZr7+6Da61qQ1fBKJkFZddbDLi+kERJ+YJP29jL3u
 AJQ7ZWYsMUTs6gYS6KGbg4oRatLJHLPWDlSvR/otJn8NISkMf0dqGvG+kGmoaIn1of4M
 oAX//B4Vtgye51WOc3+gGRFyzF92g8YCD2qRTwvU2nwKTdOHd0l0z9+eLdcBT46JADtH
 uAWpLyT5NxQLuD/+Z70zVgz8lAYZsOWlx3UO6+NKunBgitc8W1xr/oQh2X3Kwmvlp0iy
 aCkT+aoD1cHXeZrZfi23gTs8DFQMudtRZctgQuT7y6H9LAHEMYOjStDuMul1jE1ItELF
 T/rw==
X-Gm-Message-State: AOJu0YzsqwHWYMHBCs0v27Cfd293uxbsTA3nbpewquLvy/vpUFPo/khr
 DgWABUwENeDQ1VvAI09c1P9saLlRv9x6DmYdOhV2PCqQjDLM
X-Google-Smtp-Source: AGHT+IHReRw9TZClMwMU8QGx8/zb0wJKrbFqP/anf8ilew3szQmWD8/3feUA6oJFwX29NdYpmybSyg==
X-Received: by 2002:a50:ab4d:0:b0:554:401f:f737 with SMTP id
 t13-20020a50ab4d000000b00554401ff737mr2254607edc.7.1704749680191; 
 Mon, 08 Jan 2024 13:34:40 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 c6-20020a0564021f8600b005574064b4fesm231299edc.18.2024.01.08.13.34.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 13:34:40 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-40e43e55b87so17415e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 13:34:39 -0800 (PST)
X-Received: by 2002:a05:600c:3b02:b0:40e:4990:d566 with SMTP id
 m2-20020a05600c3b0200b0040e4990d566mr36wms.4.1704749679036; Mon, 08 Jan 2024
 13:34:39 -0800 (PST)
MIME-Version: 1.0
References: <20231220221418.2610185-1-hsinyi@chromium.org>
 <CAD=FV=VdO=V51jbK5Ym9g9m2naJ4tfC-vKFCnfbpT+F-pNM_OA@mail.gmail.com>
In-Reply-To: <CAD=FV=VdO=V51jbK5Ym9g9m2naJ4tfC-vKFCnfbpT+F-pNM_OA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Jan 2024 13:34:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ws5M9_oFCMdakAN5YDQow=vkWg29_o6etmfC9XzOBDOQ@mail.gmail.com>
Message-ID: <CAD=FV=Ws5M9_oFCMdakAN5YDQow=vkWg29_o6etmfC9XzOBDOQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: use put_sync in unprepare
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Dec 20, 2023 at 2:43=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Dec 20, 2023 at 2:14=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org=
> wrote:
> >
> > Some edp panel requires T10 (Delay from end of valid video data transmi=
tted
> > by the Source device to power-off) less than 500ms. Using autosuspend w=
ith
> > delay set as 1000 violates this requirement.
> >
> > Use put_sync_suspend in unprepare to meet the spec. For other cases (su=
ch
> > as getting EDID), it still uses autosuspend.
> >
> > Suggested-by: Douglas Anderson <dianders@chromium.org>
> > Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-simp=
le")
>
> Probably instead:
>
> Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid
> excessive unprepare / prepare")
>
> ...you could send a new version or I could just fix it up when I apply it=
.
>
>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
>
> Yeah, it's really unfortunate but I think we have to do this. It will
> add big delays any time we need to turn the panel off and quickly back
> on again, but I don't think we can reliably meet T10 without it. Even
> turning down the autosuspend delay won't really help since someone
> could do something like read the EDID while the delay was happening to
> reset the delay. At least we can still use "autosuspend" to avoid
> powering off between reading the EDID and powering up the panel since
> the EDID grabs runtime_pm itself and still uses autosuspend.
>
> I don't remember this particular problem before and nobody has yelled
> about it in the past. ...and the requirement seems crazy, but it
> certainly is in the spec sheets so we should be good citizens and
> honor it. On the plus side, this means that we will always fully power
> cycle the panel whenever we turn video off and that means that if any
> other panels out there have weird issues like "samsung-atna33xc20"
> this will also fix them since this is the same fix I had to do in that
> driver.
>
> In any case:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'm about to go on vacation, so I won't apply this until January.
> Other drm-misc maintainers are free to apply sooner than that if
> they're comfortable with it.

Things were silent and I'm back from vacation, so I've gone ahead and
pushed this to drm-misc-next.

Technically I could have pushed it to drm-misc-fixes, but from my
understanding of the issue it was not causing any actual problems
other than making someone upset who was staring at oscilloscope traces
and comparing them to a spec sheet. Given that this changes timings,
I'd rather have the extra bake time of going through drm-misc-next.

49ddab089611 drm/panel-edp: use put_sync in unprepare


-Doug
