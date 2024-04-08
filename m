Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAED189B807
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 08:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4158112168;
	Mon,  8 Apr 2024 06:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XOvwGvPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA96112167
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 06:55:55 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-78d68de297fso16062585a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Apr 2024 23:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712559352; x=1713164152;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KiL5NK1zEz9PbV0+Ph8O0V6ZiOSvtAFLDmRrhTbxNlw=;
 b=XOvwGvPqa97IVHYPOuTSGEVnN7R42j/xzOhF1+sK5p16GxzJvI/TTBpUb1PVIi/2Xx
 7kx+dw475SuvSr2L8kFpeb8yhFzI7e4FKZDbKzqEIUM8vYyTyctsEKyced3uxqv3IHk7
 Y2WXy+4sq4GOZiyo22Al2fZ3I6MZjxBloPzaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712559352; x=1713164152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KiL5NK1zEz9PbV0+Ph8O0V6ZiOSvtAFLDmRrhTbxNlw=;
 b=VgNiNXgBR7yqwIXfU3ZUmENmt6aOVZ/2wbp11vNpSlSX94TYR5RzH9q4fEkDFf0HRK
 OIWckl0SXbm1nV3dBvYEM4uJNIL3jhU3Z6hyhgvKG9yjTUTQXnUoDz5k1RqI/R5FDCSV
 PeuT8lj3MQc6wWrHlRGSdX30Zv5KmRB+0XSM4I+LNscs55y+hDoOx4ygFZKIAOJxyLL6
 0iYrC7nh47cW95gFVp8+EQgZw5BeLnHKndVrZNWvCVtZbc0FKRP10cIfzPg4gb+ou5Tc
 tX9T7YFgKFca3V5lybtxwqS96u+M9Tk4iKj2UuxHata/bgxNBnuesWCBeBh6OGWzslm7
 GLeA==
X-Gm-Message-State: AOJu0Yw8r56E2oU8t9mI8gsdkwRG2HT502Qs2wHXGigZB7ERiRjsZ81U
 5pSlUFFmXC5PVZMeYSVpQR2460ypdKuVfr2JFG55fKJqBAmFC9Gu2CT1wscuupy829Kl8cv/FGM
 O1g==
X-Google-Smtp-Source: AGHT+IG1gqVm7UifAppX+Cr2pT2yyt0Jg2Ku2rzg3EnQMV5jgwljD/pdQgzaP466FIV4QZcrO89Cew==
X-Received: by 2002:a05:620a:47b8:b0:78d:5cda:aa73 with SMTP id
 dt56-20020a05620a47b800b0078d5cdaaa73mr4950693qkb.73.1712559352106; 
 Sun, 07 Apr 2024 23:55:52 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 bk29-20020a05620a1a1d00b0078d6136bf10sm1383153qkb.8.2024.04.07.23.55.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 23:55:51 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4348110e888so193091cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Apr 2024 23:55:51 -0700 (PDT)
X-Received: by 2002:a05:622a:40cc:b0:431:4e0b:d675 with SMTP id
 ch12-20020a05622a40cc00b004314e0bd675mr440115qtb.18.1712559350887; Sun, 07
 Apr 2024 23:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240325215631.3804796-1-dianders@chromium.org>
 <20240325145626.3.I552e8af0ddb1691cc0fe5d27ea3d8020e36f7006@changeid>
 <CAJMQK-iu6Z5kfEij1K8TdAxpCOoR3FL_gfRQMT2LS=e9o6C6qg@mail.gmail.com>
In-Reply-To: <CAJMQK-iu6Z5kfEij1K8TdAxpCOoR3FL_gfRQMT2LS=e9o6C6qg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 7 Apr 2024 23:55:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X1MRRdeP36j3SF3Wrp+iwd5R9aUKHDSbp38Hg6Pni-aw@mail.gmail.com>
Message-ID: <CAD=FV=X1MRRdeP36j3SF3Wrp+iwd5R9aUKHDSbp38Hg6Pni-aw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm-panel: If drm_panel_dp_aux_backlight() fails,
 don't fail panel probe
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

On Mon, Mar 25, 2024 at 5:07=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> On Mon, Mar 25, 2024 at 2:57=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > If we're using the AUX channel for eDP backlight and it fails to probe
> > for some reason, let's _not_ fail the panel probe.
> >
> > At least one case where we could fail to init the backlight is because
> > of a dead or physically missing panel. As talked about in detail in
> > the earlier patch in this series, ("drm/panel-edp: If we fail to
> > powerup/get EDID, use conservative timings"), this can cause the
> > entire system's display pipeline to fail to come up and that's
> > non-ideal.
> >
> > If we fail to init the backlight for some transitory reason, we should
> > dig in and see if there's a way to fix this (perhaps retries?). Even
> > in that case, though, having a panel whose backlight is stuck at 100%
> > (the default, at least in the panel Samsung ATNA33XC20 I tested) is
> > better than having no panel at all.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

Pushed to drm-misc-next:

b48ccb18e642 drm-panel: If drm_panel_dp_aux_backlight() fails, don't
fail panel probe
