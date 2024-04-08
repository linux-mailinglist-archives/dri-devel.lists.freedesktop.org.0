Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B395189B804
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 08:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD34112166;
	Mon,  8 Apr 2024 06:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IKvHL99H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FCF11215F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 06:55:33 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-78bd22f8257so261660185a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Apr 2024 23:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712559331; x=1713164131;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZEnBkTJmawels7rfHs4eisYW0lP9mltDK+Dnyfci/+o=;
 b=IKvHL99HHIxQ08j7gf6KO6AmfA/pQSuckWhd7MFzfyvOIjkIWoUE5TjKhvDnyhM5UK
 0UZYOeuuOZyGFFTPphA9ik9Z9gDdpJGrioVbQhi4gDK2ipEzwVEPDu2lRfeId3wCkHBd
 SJZVj7btF4N5ZVS+ghRS7tyEgHZhAE9fzDwVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712559331; x=1713164131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZEnBkTJmawels7rfHs4eisYW0lP9mltDK+Dnyfci/+o=;
 b=r0Cf8n3Z6QbB58hr6sh1SRjWEL6+KYHmAc+cAQ7Za9F1IdS7KT5ArVKuTPO790WwJN
 dgmNy8Jt8QH2Zs7H+cBM7yGy7ppDPGxNz22HwL9Hy5m6o+5J9i9FpM+gdzcZ0WFgqcGl
 LU90MRMD/em9mxkOG/b8ZfAHgMyL+gEvH/+FGc8gtsk854D5MLOfMkMoMRLNgb8ILAnI
 HequvTUTW7S0Azu5sNjO02yFuo7clnPlNyqXUA9CpZmNzNIF9VdSm1HTjaAgYKuseDZa
 mXUu0dDt7rDMyu4JADtDhWrPJD2WDZdeumghYUmdKpxJp/D2/aTyReg/g9K92n6RBgIK
 E9iA==
X-Gm-Message-State: AOJu0Yxiz725i01G3oHadhQKAaVz9r2tTQj+Kojw06w+7YaYsjjhjezd
 hPpDbsXLY7pFG/mQ9qSjMSbVaIIKrImGzGpdqiD1CaslgJTGpGeSLi1PVI7fd3RvECF5Z/RLBQi
 Rnw==
X-Google-Smtp-Source: AGHT+IHeLPV0ObIbufZTO2QDGIocfuoYKHwpAxQv94heAJDLvhvCSyk9sTnn/uRpbesXVbFMSHIAtQ==
X-Received: by 2002:ae9:ec0d:0:b0:78b:dfa0:b8b5 with SMTP id
 h13-20020ae9ec0d000000b0078bdfa0b8b5mr8319641qkg.14.1712559331392; 
 Sun, 07 Apr 2024 23:55:31 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 cz50-20020a05620a36f200b007883184574esm2986202qkb.98.2024.04.07.23.55.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 23:55:29 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4348110e888so192971cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Apr 2024 23:55:29 -0700 (PDT)
X-Received: by 2002:ac8:5255:0:b0:434:7929:93fd with SMTP id
 y21-20020ac85255000000b00434792993fdmr175687qtn.3.1712559329181; Sun, 07 Apr
 2024 23:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240325215631.3804796-1-dianders@chromium.org>
 <20240325145626.2.Ia7a55a9657b0b6aa4644fd497a0bc595a771258c@changeid>
 <CAJMQK-j0aCtH8KU5UiWuJbbgRLTmM4d6rkxXff1VBPsdXX2WHQ@mail.gmail.com>
In-Reply-To: <CAJMQK-j0aCtH8KU5UiWuJbbgRLTmM4d6rkxXff1VBPsdXX2WHQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 7 Apr 2024 23:55:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xwk-pQRsPkFPwD=f_WxRJvARHjt01W5xvVNdnDmp_q9A@mail.gmail.com>
Message-ID: <CAD=FV=Xwk-pQRsPkFPwD=f_WxRJvARHjt01W5xvVNdnDmp_q9A@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/panel-edp: If we fail to powerup/get EDID, use
 conservative timings
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

On Mon, Mar 25, 2024 at 5:05=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> On Mon, Mar 25, 2024 at 2:57=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > If at boot we fail to power up the eDP panel (most often happens if
> > the eDP panel never asserts HPD to us) or if we are unable to read the
> > EDID at bootup to figure out the panel's ID then let's use the
> > conservative eDP panel powerup/powerdown timings but _not_ fail the
> > probe.
> >
> > It might seem strange to _not_ fail the probe in this case since we
> > were unable to powerup the panel and confirm it's there. However,
> > there is a reason to do this. Specifically, if we fail to probe the
> > panel then it really throws the whole display pipeline for loop. Most
> > DRM subsystems are written so that they wait until all components
> > (including the panel) have probed before they set everything up. When
> > the panel doesn't come up then this never happens. As a side effect of
> > not setting everything up then other display adapters don't get
> > initialized. As a practical example, I can see that if I open up a
> > sc7180-trogdor based Chromebook that's using the generic "edp-panel"
> > and unplug the eDP panel that it causes the _external_ DP monitor not
> > to function. This is obviously bad because it means that a device with
> > a dead eDP panel becomes e-waste when it could instead still be given
> > useful life with an external display.
> >
> > NOTES:
> > - When we fail to probe like this, boot is a bit slow because we try
> >   several times to power the panel up. This doesn't feel horrible
> >   because it'll eventually work and the retries are known to help
> >   bring some panels up.
> > - In the case where we hit the condition of failing to power up, the
> >   display will likely _never_ have a chance to work again until
> >   reboot. Once the panel-edp pm_runtime resume function fails it
> >   doesn't ever seem to retry. This is probably for the best given that
> >   we don't have any real timing/modes. eDP isn't expected to be
> >   "hotplugged" so this makes some sense.
> > - It turns out that this makes panel-edp behave more similarly for
> >   users of the generic "edp-panel" compatible string and the old fixed
> >   panel compatible string. With the old fixed panel compatible string
> >   we don't talk to the panel during probe so we'd actually behave much
> >   the same way that we'll now behave for the generic "edp-panel".
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

Pushed to drm-misc-next:

ce0ff22388ab drm/panel-edp: If we fail to powerup/get EDID, use
conservative timings
