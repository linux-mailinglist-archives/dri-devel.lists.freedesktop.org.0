Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGKyJ2nWgGmFBwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:52:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07819CF330
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0954010E50A;
	Mon,  2 Feb 2026 16:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JU2Hc/i7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B0910E50A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 16:52:53 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id
 a640c23a62f3a-b88593aa4dcso637531766b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 08:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1770051169; x=1770655969;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QGLSQGBxItX/p5vDeLcxHCTPSeYQPRqcWlnQBJSqWY0=;
 b=JU2Hc/i7NJaHJb9RIoRRaP0TdJRVLktR2YEd+TzPShWxk7XOGh1oX7FB0MFvSi2kY4
 /4QoVZl1ANNKUcglW8dWoQ0F9WZLtubdnhuJ2gglkZd6sxa/HTJuRZ13qUOM1TNIT8JL
 iZ64u5KPO+6dmMoWiXNTax3VnMBMmVAPulzv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770051169; x=1770655969;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QGLSQGBxItX/p5vDeLcxHCTPSeYQPRqcWlnQBJSqWY0=;
 b=NzncY66BgNq95QZM0Gw560OjNd3IiuTd7fVF3jsKxr4gegGfr5RsBzntaHLnuk97Ir
 AHJ8CE1IfwiW2ARipqRC8jtkz4cRNLjrWzABDuEML4cb+MZI2nvmkI+cFhC7RwAbSaOh
 lOG8YDQ/KoiMw7qWTyeGesR8A39D9mvVGIarEOHhv1F6/HrIBdrPXG6MFqwniQNHxO86
 C9HL+eXNly6H+A60+7m31r7P//59oS72/Bg4LUaua+EOwGKwiKns57L38PWh7IseSnDX
 2JaOWnaXwkLUPGuGygpAeO8ReV9voQF0o1iUgtMYVuUKZ6dWtpOn1NkqAfPvwZPuNqaA
 qWXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvKebQleGlpRQblraOBT/GevisggOkXKYsZbuSa77hdYJY55EPMTKLHA04Ka1+SyC1/dMIUZbUxlc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHbPw4nBUhB72ZNexuEJjPYWnTINuxtcz8IqMgq5C7YAG5rRA7
 oCfQiKT/TWPxGhb/aotZ+rFvGl52XkT7M5Qog1DLCnsAR0/G7BAi8ZyKfREipr1GZ88Kj5mnLJG
 84GGfjwrt
X-Gm-Gg: AZuq6aLJ0clx5z2cMa5DJtx0D3M5QEuLBSTkzUNBdjyi97lm8A88if0o7TSY2ZNXO9p
 nOhT6x1Rq9NNHbs49ijteoHMLSmMoksNAcyXgyewXpPE1K4NO4bVM3JGPiVy7BL9Rqgy+M2twRe
 P1b5RRP2Pz9SNPWud7fNAWTcb42UGacr+kvn96v+XUpnPzlAR/iGBrZfqZ8mITVTte9VXkEAjAk
 Xi9V1YN4gcgfcGqfeiQDekWzUJSljXpM3H5QS9Nvgkd0bQsbNTtIH2F8FL9jk1adX03dsBugDJo
 qG1LEQdpc7K3W/EbPIt68nREBunGMpZKy+VIZKsyJ9uUie9ku6oZUqGdM9BTE42fm2HC1uM0IxX
 9W5LXu50f2rgnOV69P9Wsu6vn2N2SMuWWpvZO5BjUu6ui9VEKdU/sFkwLITMV5FM0GGgPAFVJSD
 Z07Vh0OwGvtCgR/p3gkD6ZFYN/xiL/eb9cokbx2qHbWAkifY9ZYQ==
X-Received: by 2002:a17:907:7207:b0:b88:5a74:4cd6 with SMTP id
 a640c23a62f3a-b8dff755042mr835648866b.43.1770051169490; 
 Mon, 02 Feb 2026 08:52:49 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbf1baa42sm906049566b.46.2026.02.02.08.52.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 08:52:47 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48068ed1eccso43079995e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 08:52:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVhT+Qfbi4y105LD87rZO9iThWoc24xIx9p0+LnYK2yEqKaniN8fzJiJXLdMFt+i7RZfxMMcjC6BSY=@lists.freedesktop.org
X-Received: by 2002:a05:600c:8b12:b0:47d:5e02:14e5 with SMTP id
 5b1f17b1804b1-482db44e7f7mr158073105e9.5.1770051167405; Mon, 02 Feb 2026
 08:52:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769191673.git.robin.murphy@arm.com>
 <a00a59dcef3693efb02a8ee942848fbeaeaf05ba.1769191673.git.robin.murphy@arm.com>
 <CAD=FV=ViHWqjMGfYFgHBNRY-ex2vZjMaYoYLJb=vcUfPQRb9FA@mail.gmail.com>
In-Reply-To: <CAD=FV=ViHWqjMGfYFgHBNRY-ex2vZjMaYoYLJb=vcUfPQRb9FA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Feb 2026 08:52:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UKL5mSr3b_0eBuYZ04RFjFLAG1ZRw=JC5wtPy=t7+7wA@mail.gmail.com>
X-Gm-Features: AZwV_Qg8mOHmFnRAdN4OmDJbt-Yo140VuLppfyIQONLjHwqHVTpsMUgdZpTJYuk
Message-ID: <CAD=FV=UKL5mSr3b_0eBuYZ04RFjFLAG1ZRw=JC5wtPy=t7+7wA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/panel-edp: Move FriendlyELEC HD702E
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com, 
 sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sntech.de,linaro.org,gmail.com,ravnborg.org,lists.freedesktop.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.murphy@arm.com,m:heiko@sntech.de,m:neil.armstrong@linaro.org,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:jesszhan0024@gmail.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arm.com:email,mail.gmail.com:mid,chromium.org:email,chromium.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 07819CF330
X-Rspamd-Action: no action

Hi,

On Sat, Jan 24, 2026 at 3:52=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Jan 23, 2026 at 11:22=E2=80=AFAM Robin Murphy <robin.murphy@arm.c=
om> wrote:
> >
> > FriendlyELEC's HD702E module is an eDP panel (in as much as it's some
> > LVDS LCD behind a Chrontel CH7511B eDP bridge), so move its data over
> > to the eDP driver, also resolving the warning about the missing bpc
> > value in the process.
> >
> > The unfortunate combination of HPD not being wired up and the RK3399 eD=
P
> > controller's behaviour seems to result in the EDID not being readable
> > over DP-AUX without probing the panel first, thus the hard-coded mode i=
s
> > still needed to get things going.
> >
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > ---
> > v2: Clarify issue with the generic binding
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/panel/panel-simple.c | 25 -------------------------
> >  2 files changed, 26 insertions(+), 25 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll plan to apply patches #1 and #2 in ~1 week to drm-misc-next if
> there are no other comments. If someone else wants to beat me to it,
> though, I'm also OK w/ that.

Pushed patches to drm-misc-next:

[2/4] drm/panel-edp: Move FriendlyELEC HD702E
      commit: 5c323ea948ff0f9e50418119cbbb3d94f2bd6a96
