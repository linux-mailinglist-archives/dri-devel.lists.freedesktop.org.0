Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGobAT5bdWm5EQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 00:52:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589C27F4C5
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 00:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B210810E0F6;
	Sat, 24 Jan 2026 23:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="k589/Sf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7002910E0F6
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 23:52:26 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id
 a640c23a62f3a-b872f1c31f1so468100866b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 15:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1769298743; x=1769903543;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PIfml6cmBSDqptc9LOz4z9hdECIJ2oI0juXYl4HG5Xk=;
 b=k589/Sf73C713zaD1Pa8Wfgf0PHSeNr1kZ3XgRw5PEJEdZLv0MBZIHqmZayYgGFMLH
 KIF4jFN0uM3u/WKgChBicVvR+BuU56BEIRvV859Bb4GcCtY9cr1zN5BTECOHHXdwlJsj
 8eXyKv9Sp/6SJGjzpzgNXoDhlLMKPS8Upm9i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769298743; x=1769903543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PIfml6cmBSDqptc9LOz4z9hdECIJ2oI0juXYl4HG5Xk=;
 b=e9dmru9lVhdW/s0l2DNhtNK+Mgo/QP+EMQb12uhxT7iI9GCveloiNZq2gGbg09+OAD
 aSeKwpx3nift4HVWaCk+UUyG5wGR6SGLo6GMEdi76aREg6BpC8sIKFdNfi2jzO5aFut/
 uSBW6Z+olAe3gqTsps0RcjH70pgbHZoD8fwK2HXmovXhQHPRFJ6B1d6YFgY0jSvWpR+i
 Fz+CAq0BH0Dn65zEJqLDRhKm/rao0xtCMPVDlh8Vnovcsf/dXaMnP814jiD0ZXyVkLf8
 pI+hWesORcWoXU7iTofwLPYIXGOmD41wsONxDqutd7LdNkn+sJql8yrsAWCSmhG2stmR
 4RwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs0qO1hrOvR84V6SUs6dRHY2/8fFSR/2l6gV6zdIJSPh0bLywDx1pGsfijwKEVokhg+tOWb95TVts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6fMwqIHgDhhe/+YIC11kr4YffL3yVjjMhAZIzmffwsHwl6LXd
 HvL7Os7x0AL6F1rafEm5Smkx/um1EwrXWDIdY5b7NP+mdkahNPPPOT3mI8LcpC4dZIeBfY/KK6w
 lUal1VTGS
X-Gm-Gg: AZuq6aJYvH3R/pqxLXHLqFjqsoQlGYv/8d6iEy9SkdRBNV5vNUK6GKjG33uw6fJYBuW
 sM96+6nsyFNaswKfOXPUyhwIXyZeRfNdJcAD/ots3btQiE6erA/SeYgIGC1h64SJx5N9q2o5x+0
 /biHY/KwOKK8FIk35prhchAMD/diLWaSFF3umbn+BkZ3nwuVITcYrNu3xJ8EAEJlU4Vho6AFzfg
 hWux0Zb/kewpQ0ATyydKY5AA1lNytsxxJ83YatK3/7WFXt4o6R15249nnkXcmMYSrU8Ob7DfMnl
 VF1ClPslZn5xd2yPUq5fuXeWmxycp+5MuLWpM818Z2i4vcwefG2VCzt8228U1zBgh0Pmna7HYSF
 Lo91auRXL+bFBoiDsScpiQwEBQ95cTKIRr8zAciAlttyq2PljAq1CFrdOaY10VMa1bRlApew8UD
 Ro0m9Eif/9k1X9mnEgOI8d7EUqHUJkpzlMfRbNQRIGpkLxTowVlA==
X-Received: by 2002:a17:907:7211:b0:b88:f0f5:382f with SMTP id
 a640c23a62f3a-b8cfedfb96dmr11695766b.2.1769298742902; 
 Sat, 24 Jan 2026 15:52:22 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6584b94738dsm2798005a12.29.2026.01.24.15.52.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jan 2026 15:52:22 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47ee4539adfso36849975e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 15:52:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUMIiSojcNi9AaXTihJZ6BHXMGxljDV4fHB0G2ej326waYW98qewvnTHL544deE7I8KqIBVBarxrF8=@lists.freedesktop.org
X-Received: by 2002:a05:600c:64cf:b0:47d:403e:9cd5 with SMTP id
 5b1f17b1804b1-4805ce4dcc4mr3092475e9.11.1769298741403; Sat, 24 Jan 2026
 15:52:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769191673.git.robin.murphy@arm.com>
 <a00a59dcef3693efb02a8ee942848fbeaeaf05ba.1769191673.git.robin.murphy@arm.com>
In-Reply-To: <a00a59dcef3693efb02a8ee942848fbeaeaf05ba.1769191673.git.robin.murphy@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 24 Jan 2026 15:52:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=ViHWqjMGfYFgHBNRY-ex2vZjMaYoYLJb=vcUfPQRb9FA@mail.gmail.com>
X-Gm-Features: AZwV_QgqvLshh6AyFk-0oo1A1QJCI8IT1Nk4fy1OUz5UpJUZH977eNP0Jn9jIQc
Message-ID: <CAD=FV=ViHWqjMGfYFgHBNRY-ex2vZjMaYoYLJb=vcUfPQRb9FA@mail.gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,chromium.org:email,chromium.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arm.com:email,linaro.org:email]
X-Rspamd-Queue-Id: 589C27F4C5
X-Rspamd-Action: no action

Hi,

On Fri, Jan 23, 2026 at 11:22=E2=80=AFAM Robin Murphy <robin.murphy@arm.com=
> wrote:
>
> FriendlyELEC's HD702E module is an eDP panel (in as much as it's some
> LVDS LCD behind a Chrontel CH7511B eDP bridge), so move its data over
> to the eDP driver, also resolving the warning about the missing bpc
> value in the process.
>
> The unfortunate combination of HPD not being wired up and the RK3399 eDP
> controller's behaviour seems to result in the EDID not being readable
> over DP-AUX without probing the panel first, thus the hard-coded mode is
> still needed to get things going.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> v2: Clarify issue with the generic binding
> ---
>  drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c | 25 -------------------------
>  2 files changed, 26 insertions(+), 25 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll plan to apply patches #1 and #2 in ~1 week to drm-misc-next if
there are no other comments. If someone else wants to beat me to it,
though, I'm also OK w/ that.

-Doug
