Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F2F7F1BE8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 19:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D763210E0FC;
	Mon, 20 Nov 2023 18:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8C410E0FC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 18:05:05 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53f9af41444so6788272a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 10:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700503502; x=1701108302;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zfQgWIiUL3Fow7Ad2MX3WF/O+vZdxL2eavqBiY3Rc9k=;
 b=KUXbC7vAujcZ1lbn+xxKmsIqhZ2z5hoj1Izj3zd6tadC/PPi0WrmSdIn8g3oYAD6bV
 p5HOkcdi1nRb6jAo/nROmx6xUMRmpPoNL0ra8kNzvmV/TveoNUPcorgorJ/YdupyfdU9
 /yyQh3qej5U5w7L5DSJIjLKhdOYrn+r3DhSkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700503502; x=1701108302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zfQgWIiUL3Fow7Ad2MX3WF/O+vZdxL2eavqBiY3Rc9k=;
 b=O/TRh8/MWXUMJ3h0UGQHlBoARuLxGDKf1Fiwl8w8kDGjUPd18bahBAJOEDPC3vjsf9
 grBDChTpvFcI6iwwXANzUR1wkLPkt7XYmBSP2TpwSBm4Ec3kybYybFTeB4RGjTJ6Coby
 qhxXmfzRjBUS7L4OTCg2ny5brCUo+ON6cW/76K7P0rr7FHrZDvucYazG4o2aGqriochJ
 sKtR8NXbn60hq4K6m7JCJicTEII+hTAkhcRnb/Bv9ah/IYXHdr+EVkepvONu2Vis2Wo2
 dK3qDu19VN91HS06F8PkbuXuOBX7b5f3PPi4/SfwuCYbU25xGADgH0EdOcwNYvmw47zZ
 dvVA==
X-Gm-Message-State: AOJu0YyTdNeBqsvmHiVKS/sB1UZOZOQ01955rlmqMm/aLwUac7FZbFhC
 ji7XadLh5qcs4/v64QT6G6G2TkOMOFNjdURSJ6j1eg==
X-Google-Smtp-Source: AGHT+IFlUBiy8IZt2IAzgK8+5qLWY3a0Sc2r+kY7WYrDxh1J+4mID0RfegSf2iteWwpFzOWDx6HZzQ==
X-Received: by 2002:aa7:dace:0:b0:543:caf4:e5bc with SMTP id
 x14-20020aa7dace000000b00543caf4e5bcmr170639eds.1.1700503501629; 
 Mon, 20 Nov 2023 10:05:01 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 bf26-20020a0564021a5a00b00548ae896153sm1566674edb.61.2023.11.20.10.05.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 10:05:01 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-408c6ec1fd1so2585e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 10:05:00 -0800 (PST)
X-Received: by 2002:a05:600c:3c8b:b0:3f7:3e85:36a with SMTP id
 bg11-20020a05600c3c8b00b003f73e85036amr395736wmb.7.1700503500479; Mon, 20 Nov
 2023 10:05:00 -0800 (PST)
MIME-Version: 1.0
References: <20231117032500.2923624-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=WAPAhMfK5jgkMS=m3grxaUtrDoZnQs3rmbLpLX84+j1w@mail.gmail.com>
 <CAHwB_NLHqyP6mpQJHw86Hk-g3d8Q9xjRBde_YTTQiuLBwAhEKQ@mail.gmail.com>
In-Reply-To: <CAHwB_NLHqyP6mpQJHw86Hk-g3d8Q9xjRBde_YTTQiuLBwAhEKQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 Nov 2023 10:04:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vf0t_-t0CgLdGM2KMYtDcmf5sq4ej-G94ecKBxMO8K2w@mail.gmail.com>
Message-ID: <CAD=FV=Vf0t_-t0CgLdGM2KMYtDcmf5sq4ej-G94ecKBxMO8K2w@mail.gmail.com>
Subject: Re: [PATCH V2] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
 panel HFP and HBP
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, zhouruihai@huaqin.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Nov 19, 2023 at 5:33=E2=80=AFPM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Hi,
>
> On Sat, Nov 18, 2023 at 1:11=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Thu, Nov 16, 2023 at 7:25=E2=80=AFPM Cong Yang
> > <yangcong5@huaqin.corp-partner.google.com> wrote:
> > >
> > > The refresh reported by modetest is 60.46Hz, and the actual measureme=
nt
> > > is 60.01Hz, which is outside the expected tolerance.
> >
> > Presumably you've swapped the numbers above? The value reported by
> > modetest is 60.01Hz and the actual measurement is 60.46Hz?
>
> No, the value reported by modetest is 60.46Hz.

Indeed. I somehow assumed that the old value of "clock / (htotal *
vtotal)" would have been the one that was closer to 60 Hz, but doing
the math I agree with you. Specifically:

>>> 161600000 / ((1200 + 40 + 20 + 40) * (1920 + 116 + 8 + 12))
60.46093983837174

>>> 162850000 / ((1200 + 50 + 20 + 50) * (1920 + 116 + 8 + 12))
60.005453366348306

Thanks for correcting me!

-Doug
