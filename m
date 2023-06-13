Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A8B72EA90
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 20:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3242810E131;
	Tue, 13 Jun 2023 18:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D7A10E131
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 18:10:01 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-51870e2dc48so1930363a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686679799; x=1689271799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3Po5spbpb4nIlZOQHtySXaHRCrpmcN+t2eknJKAn38=;
 b=j+TQQaIqISC+ws6oemEm7jkGMJEbYY13uvvVNl8F67whHXCrt3kPc5KppeGcA8bt0J
 AaxujUF7CtvkJJsCLcsUqQNVK9EjTlPMat37zZ6JwPFdOA5mpMNTz2u/jYvflWGRx3dC
 flD5JJYBThGmpGDTcTPk8xIhjXl2kDm0ouXJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686679799; x=1689271799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3Po5spbpb4nIlZOQHtySXaHRCrpmcN+t2eknJKAn38=;
 b=BxRtmX6jbwJWtBAD1QniP5DYr7xZPx4+ks5Heu93ruwO5eAL49KL1PxwHy/pDabiWv
 Ehy9rCGDPiJaQJIoy7InjdSurmaiT81u5aDk4NdhpaLe8Aq8N1MWXPGPQDtYtHd913vs
 m4bOdzLCypFdAWfyLuNmhCmUCWU+Y2cbigaV4zMdFP5nMZcSWELga9ctjWFN5XirDFNT
 UphcO8J5Bj5zjck27YeMJDeEMIwtAlU/L7sd7PzS/IP61RTNoN2FjWHX4MEeZUn0VQvn
 KjqvhkjLZKcF06gZYVI1iwpSbWOPv5WqXsZKPG6hs8TvK8o+8GtfDYz+dc05KI4A8AUV
 XoOg==
X-Gm-Message-State: AC+VfDyCEV1weDqGNg7szN33jcvgF09AeAfWpxuOIoQ1qhefIWk/EB6N
 SBNPH54nzVsJD5SraHB8VKVRxJZqeoa9GiJYtUrBOyJT
X-Google-Smtp-Source: ACHHUZ6kWm/DH6VrmJ2Uje/1phm/0JMOQx4jYvLdqiX8nwtHpbdsNE1IaTkD9Ig5U7utY2QbumtzIQ==
X-Received: by 2002:a17:907:162c:b0:978:8925:7a00 with SMTP id
 hb44-20020a170907162c00b0097889257a00mr14585533ejc.15.1686679799400; 
 Tue, 13 Jun 2023 11:09:59 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 k25-20020a170906579900b00965c6c63ea3sm6941523ejq.35.2023.06.13.11.09.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 11:09:56 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-513ea2990b8so1637a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:09:55 -0700 (PDT)
X-Received: by 2002:a50:bac8:0:b0:507:6632:bbbf with SMTP id
 x66-20020a50bac8000000b005076632bbbfmr952ede.6.1686679795562; Tue, 13 Jun
 2023 11:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230608012443.839372-1-suhui@nfschina.com>
 <CAD=FV=WqmqaKXG20MuMwjwyR-8deFF7+chqphN=hiJ05mfC=HA@mail.gmail.com>
In-Reply-To: <CAD=FV=WqmqaKXG20MuMwjwyR-8deFF7+chqphN=hiJ05mfC=HA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Jun 2023 11:09:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V=+L-x8PP3jHO7i+=s+Fb9cRAwj9JMzLJvDQryrOk9DQ@mail.gmail.com>
Message-ID: <CAD=FV=V=+L-x8PP3jHO7i+=s+Fb9cRAwj9JMzLJvDQryrOk9DQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Avoid possible buffer
 overflow
To: Su Hui <suhui@nfschina.com>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 8, 2023 at 8:15=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Wed, Jun 7, 2023 at 6:25=E2=80=AFPM Su Hui <suhui@nfschina.com> wrote:
> >
> > Smatch error:buffer overflow 'ti_sn_bridge_refclk_lut' 5 <=3D 5.
> >
> > Fixes: cea86c5bb442 ("drm/bridge: ti-sn65dsi86: Implement the pwm_chip"=
)
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi86.c
> > index 7a748785c545..4676cf2900df 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -298,6 +298,10 @@ static void ti_sn_bridge_set_refclk_freq(struct ti=
_sn65dsi86 *pdata)
> >                 if (refclk_lut[i] =3D=3D refclk_rate)
> >                         break;
> >
> > +       /* avoid buffer overflow and "1" is the default rate in the dat=
asheet. */
> > +       if (i >=3D refclk_lut_size)
> > +               i =3D 1;
> > +
>
> Looks great now, thanks!
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Unless someone beats me to it or objects, I'll plan to commit this to
> drm-misc-fixes early next week.

Pushed to drm-misc-fixes:

95011f267c44 drm/bridge: ti-sn65dsi86: Avoid possible buffer overflow
