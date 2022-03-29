Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D02764EB1E4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 18:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1406710F10A;
	Tue, 29 Mar 2022 16:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBF610F10A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 16:37:13 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id yy13so36296568ejb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 09:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fbJk0tnKIVIGfOYC3TDZlX4uGjeQKwVPpyRczD7tbFk=;
 b=K22KiM1d/xsIZkexASjSgNs8svDl3aD0kPeEa1JQfSfINsXxJ7HcVaM8mccdfRxXBj
 1JlsSV3RtwXllgCf6PYJH+ZAN1lYhTedkQhP8XJ7qkfnEyldYxkMp3FlnFHkXjUntFXL
 7cat0tJr/MYu4d+EWFFGx9P44wtA1tUDrjH54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fbJk0tnKIVIGfOYC3TDZlX4uGjeQKwVPpyRczD7tbFk=;
 b=eUZq5JISPHu5URPlS6FRI4te016kZyyt+UNiFjpJ3rPiecUMw3ulg1m/XY051d3wDL
 PV1jaj+Qop8ebSTXN3f+4G4ynWf83tHWPiPFLGcB1UiSAOMczOqVLOhReir8LJwmVwOH
 HZykn5yCxAo/IDU9NrG39ivgdm3FepfntYVipHYZuFMtlbF39utrRpxMPAp5co5ZmUU1
 n44wywwouo79XavNfdLKVlHccfPZ11IEy4d2y8+VhpapYoFbMpptQEvlo63AkRUtA6Mh
 kVYvR1ueg0vfVyQxMGOkdgrTvl4jHGANFwopGaCqv6gBNmU4hAYJVEIe0axKdLJyLcGa
 RGsQ==
X-Gm-Message-State: AOAM532/y+f3loXGZDdIXIWmWerZ+9cnnl6k+q9zs9+855oWztexPQC1
 5vhybE/J0NHpsqlPVBFX8WRPuC5550yR85hZ
X-Google-Smtp-Source: ABdhPJygHbvUR5sA+wSUVmJy+Q21Rg0JxSGUDubzRKAYludrRv1cbi1zHdxBCNm6M9MLI05NQzE68Q==
X-Received: by 2002:a17:906:6a1a:b0:6e1:87a:151f with SMTP id
 qw26-20020a1709066a1a00b006e1087a151fmr15167583ejc.715.1648571831238; 
 Tue, 29 Mar 2022 09:37:11 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b006daa26de2fbsm7119958ejc.153.2022.03.29.09.37.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 09:37:08 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id
 i131-20020a1c3b89000000b0038ce25c870dso1550206wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 09:37:08 -0700 (PDT)
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr677656wmc.29.1648571827704; Tue, 29 Mar
 2022 09:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220324134819.v2.1.I816014b6c62da5a33af5021f3cc35cea66552c00@changeid>
 <CAD=FV=UdRzeHio5Vo+zmXDt9a8oUwXiZyHvxkqjx4HVcrx7W-g@mail.gmail.com>
In-Reply-To: <CAD=FV=UdRzeHio5Vo+zmXDt9a8oUwXiZyHvxkqjx4HVcrx7W-g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Mar 2022 09:36:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqO1E_pvChX-mBy3T+bOuWt+SoJD2MgW2Njzxosohxhw@mail.gmail.com>
Message-ID: <CAD=FV=WqO1E_pvChX-mBy3T+bOuWt+SoJD2MgW2Njzxosohxhw@mail.gmail.com>
Subject: Re: [PATCH v2] panel-edp: drm/panel-edp: Add AUO B133UAN01
To: Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 24, 2022 at 1:51 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Mar 24, 2022 at 1:48 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Add support for the AUO B133UAN01 13.3" WUXGA panel.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> > Changes in v2:
> > - autodetect and configure the panel based on the EDID data instead of
> >   relying on a compatible string and hardcoded mode settings.
> >
> >  drivers/gpu/drm/panel/panel-edp.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Given the trivial nature of this change, I'll plan to land it in a few
> days barring someone else yelling about it.

I modified the patch subject slightly since the extra "panel-edp:"
prefix was redundant, then pushed to drm-misc-next:

ec57376fba5a drm/panel-edp: Add AUO B133UAN01

-Doug
