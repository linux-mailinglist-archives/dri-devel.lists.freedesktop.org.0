Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9106581A945
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 23:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A116710E05C;
	Wed, 20 Dec 2023 22:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9613210E05C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 22:43:21 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54cb4fa667bso222432a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1703112199; x=1703716999;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sEFY4if4/679Rdgt31ROtX+FDj3QF5c4Pc3cIpXt5aY=;
 b=arXY/ijlIe6gp4b6jfCclXPvuuHeamjeygkKzPr+qDdxVpQJ+S9gw2nhIrqTxmQsw3
 7NHWrnMKdkZMxmxqHnbkJks7i8XzQLiBGb/XJsyFb485IRzd4fjCi0A7Qt2hKsctk6a/
 97jm5dkPi2GzTJM2K9xn+mbtRwlXDC9jGMSQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703112199; x=1703716999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sEFY4if4/679Rdgt31ROtX+FDj3QF5c4Pc3cIpXt5aY=;
 b=jOdgyre/lIdmkD7fLDl41hSbhMY2EXxwbBSO2FKOX4orkyBRP2wq25ZnWU8vyVZ6Pk
 dmcJRqq97LbduShfQREjzKTtlRYng+uY7grAaW3xe1kg4uJFWbaGYZPpG3FjW0I9nLWS
 4stEb4doNjBqJI+wyE3txl2hUjbwj8rWbYEwDY5SrF9GFlZ0sb1VFo1MfNrtgGLAj33a
 VO7uzcXDGTzdpHBgRWYGe24JMvH0dRTqzc2q4FGT4rFKBJf7qZhevhMoiePM1qCq8gkC
 QENSdKDVymML3WwnQ35x7LfeOHJtLCVV4gdUAMd1Ay4oEemfT2UnmA60aPR3ngdtak2G
 0KJQ==
X-Gm-Message-State: AOJu0YzneRNWK5F2a8sooPSK1gjcfKukKYsh6e1QmMoAtlusrwic/BKs
 l3NNJaLrD4n/n+/13wtO3/ALnOym1cDMvJ1hpRR7yQ==
X-Google-Smtp-Source: AGHT+IGyw5TtxzA2DRB+j/++To061RAsMPsqgfUnbjZPWNJcQSUuEhruk9WHpMn3rYp29WglV1znCw==
X-Received: by 2002:a17:906:3288:b0:a19:a19b:78af with SMTP id
 8-20020a170906328800b00a19a19b78afmr9430400ejw.114.1703112198754; 
 Wed, 20 Dec 2023 14:43:18 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 zx16-20020a170907349000b00a1e852ab3f0sm292812ejb.15.2023.12.20.14.43.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 14:43:18 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-40d3102d5d6so22715e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:43:18 -0800 (PST)
X-Received: by 2002:a05:600c:1c27:b0:40c:256f:756b with SMTP id
 j39-20020a05600c1c2700b0040c256f756bmr50610wms.2.1703112197939; Wed, 20 Dec
 2023 14:43:17 -0800 (PST)
MIME-Version: 1.0
References: <20231220221418.2610185-1-hsinyi@chromium.org>
In-Reply-To: <20231220221418.2610185-1-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Dec 2023 14:43:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VdO=V51jbK5Ym9g9m2naJ4tfC-vKFCnfbpT+F-pNM_OA@mail.gmail.com>
Message-ID: <CAD=FV=VdO=V51jbK5Ym9g9m2naJ4tfC-vKFCnfbpT+F-pNM_OA@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Dec 20, 2023 at 2:14=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Some edp panel requires T10 (Delay from end of valid video data transmitt=
ed
> by the Source device to power-off) less than 500ms. Using autosuspend wit=
h
> delay set as 1000 violates this requirement.
>
> Use put_sync_suspend in unprepare to meet the spec. For other cases (such
> as getting EDID), it still uses autosuspend.
>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-simple=
")

Probably instead:

Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid
excessive unprepare / prepare")

...you could send a new version or I could just fix it up when I apply it.


> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Yeah, it's really unfortunate but I think we have to do this. It will
add big delays any time we need to turn the panel off and quickly back
on again, but I don't think we can reliably meet T10 without it. Even
turning down the autosuspend delay won't really help since someone
could do something like read the EDID while the delay was happening to
reset the delay. At least we can still use "autosuspend" to avoid
powering off between reading the EDID and powering up the panel since
the EDID grabs runtime_pm itself and still uses autosuspend.

I don't remember this particular problem before and nobody has yelled
about it in the past. ...and the requirement seems crazy, but it
certainly is in the spec sheets so we should be good citizens and
honor it. On the plus side, this means that we will always fully power
cycle the panel whenever we turn video off and that means that if any
other panels out there have weird issues like "samsung-atna33xc20"
this will also fix them since this is the same fix I had to do in that
driver.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'm about to go on vacation, so I won't apply this until January.
Other drm-misc maintainers are free to apply sooner than that if
they're comfortable with it.
