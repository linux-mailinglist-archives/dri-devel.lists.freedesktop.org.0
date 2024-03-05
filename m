Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA4B8711A1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 01:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F4C112772;
	Tue,  5 Mar 2024 00:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="S+WOgWMt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE3610F525
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 00:25:19 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a3fb8b0b7acso658297366b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 16:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709598316; x=1710203116;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YBogo24J4oBkTlnWGyxK72muXgmgt39KFTxP1mpezRI=;
 b=S+WOgWMtfZAu2XtcpXgC7nZ4vPGjqfp+JfX0F21F4cOpoLOUkpAO4sY8Ezi1ScffIU
 XSFb6SjA9ScxEbqKvQpmqeODM8Obf978yVCz5NpbGAxIPE/Ih1AYEU97VSmQbotT+NpY
 Xr4zZRyTCf5iFdAIhciS35sPXJxG/xKaDowUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709598316; x=1710203116;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YBogo24J4oBkTlnWGyxK72muXgmgt39KFTxP1mpezRI=;
 b=VjWI5Jf6UKWZXtVB/2p6zEn8LET2JdNi/0UlPRaonfXEYHygYFqq35bpe3IImQ9yz6
 75OYQ8jOMERq2rEy/OOSyozcQEUPxLfkkpwxupNySXwvvVu6TR2i/I8Yy1yw5p/FJEvv
 IsRkaW4zyZFMS5LXSFVb3G06ABnpn7QlBGyIU21W9+ddKQDIexggEeuKegOIytUGD5nJ
 H/i3b5uvnv1Z20wmJJOF7T+ETDKP7fUMrUAVdgv9F2+OJ/4GH3vF9rVbd9wZ7hAegEeL
 hU6Ezlvavwbj4Sw/5tCLcuZYeylbJzjn0FOaH5PnwWNVfdAaAGQthqsTNugJn8oRwO4z
 QZ0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6I9IOjoau2v51OdolNi5OYI46VRQH1de2eZXyYxAAXd6X0Lpb2IB6T77IgDmk4fmwuUymzvxEQJxdGYGzn11DX8EEp1RtUsvc3A8FJIxR
X-Gm-Message-State: AOJu0Yx+hn+geCMx/49iHLQXjWSfcgvZVXxnwn2YwDiIuGBPD0fg42Ex
 D4pVPWEUXaBJNFJqmgEUcgohSYmDnsRygcMVgN1kBS86WUljKohUVawv1Hu2AUW7b46tmEpzTZt
 nNXko
X-Google-Smtp-Source: AGHT+IEf7E7vuu8nlVIeCni9pCuIBEppTiXqSNgWhCEC632FVBJeW6zdZkhVT2rgEKEfI1PLWO1M9A==
X-Received: by 2002:a17:906:2b11:b0:a45:5c2a:40aa with SMTP id
 a17-20020a1709062b1100b00a455c2a40aamr2024809ejg.39.1709598315859; 
 Mon, 04 Mar 2024 16:25:15 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 pv13-20020a170907208d00b00a451dc6055fsm2276330ejb.212.2024.03.04.16.25.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 16:25:14 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-412dd723af4so31465e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 16:25:14 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVfR8EHdM8qJUwesqNs4dj6TRdig8W+6D6FmmhkqUpWLi1ghh3pdsor7sY7Ug6jcOoT7W6WSwKhyi+L7NuAy8nSujNSqxOUECd/hzFJHlxC
X-Received: by 2002:a05:600c:34d2:b0:412:e426:a1a7 with SMTP id
 d18-20020a05600c34d200b00412e426a1a7mr22561wmq.1.1709598314010; Mon, 04 Mar
 2024 16:25:14 -0800 (PST)
MIME-Version: 1.0
References: <20240304195214.14563-1-hsinyi@chromium.org>
 <20240304195214.14563-3-hsinyi@chromium.org>
 <87a5nd4tsg.fsf@intel.com>
 <CAJMQK-j4wGah=szyUW53hu-v6Q4QjgR7WMLKnspoFaO9oPfaQw@mail.gmail.com>
 <874jdl4k01.fsf@intel.com>
 <CAJMQK-iWHoh6s-hkcNULzZLjMg9UnTuWfjaJ=YfnHU3sQ1NBEg@mail.gmail.com>
In-Reply-To: <CAJMQK-iWHoh6s-hkcNULzZLjMg9UnTuWfjaJ=YfnHU3sQ1NBEg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Mar 2024 16:24:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UOhTGnhtc9gOQ5C_aAdgVcB+K7NL9RGm4umunF91Wkpg@mail.gmail.com>
Message-ID: <CAD=FV=UOhTGnhtc9gOQ5C_aAdgVcB+K7NL9RGm4umunF91Wkpg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/edid: Add a function to check monitor string
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Mon, Mar 4, 2024 at 4:19=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
>
> > > Probably change to u32 drm_edid_get_panel_id(const struct drm_edid
> > > *);? Given that we still need to parse id from
> > > drm_edid_read_base_block().
> >
> > No, we no longer need to parse the id outside of drm_edid.c. You'll hav=
e
> > the id's in panel code in the form of struct drm_edid_ident (or
> > whatever), and use the match function to see if the opaque drm_edid
> > matches.
> >
> drm_panel prints the panel_id info on whether the panel is detected or no=
t.
> https://elixir.bootlin.com/linux/v6.8-rc7/source/drivers/gpu/drm/panel/pa=
nel-edp.c#L792
>
> Is it okay to remove this information?

Hmmm, I guess it also is exported via debugfs, actually. See
detected_panel_show() in panel-edp.c. We probably don't want to remove
that...
