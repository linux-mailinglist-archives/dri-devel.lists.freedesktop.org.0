Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBsGJP1EfmkFWwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 19:07:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08A4C37A3
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 19:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D9B10E3A9;
	Sat, 31 Jan 2026 18:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RJwmLVQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24F210E3B7
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 18:07:52 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b872f1c31f1so405688366b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 10:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1769882869; x=1770487669;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X+AQYS+TusQHgAHae79mDDylrSIIyPCYier7HoHWNSA=;
 b=RJwmLVQKabaQD1X7ED6oDSRxm2ylmrAD9cU9xmHQfMi7SUPRhzmjk6Ti93M5OE8z/F
 vEJhvzGkmME9aGI4S+whQ6H0CvtCAq0zkCTWy3ata/aHWLfFUeAqNp0XEL4nHodxtPzD
 R26XLaJnbIYmaRl1XlKCWdAqsjwi1+WoeoPxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769882869; x=1770487669;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X+AQYS+TusQHgAHae79mDDylrSIIyPCYier7HoHWNSA=;
 b=fhpNw5QH5aJ1ibiuhYI3UHlzJ7g3B6ShJhh3wMkjhqPtR8wN2vwz5tle+HhIInwAoM
 MUhz3Hzv93uAUa4KxTpbtsG/ej+JiIpr0DKnHKIt76uk5zoO+/L8OuF1MY+hkNrPAIW0
 ToXvXMQ2uofdknLQc0B1DbSzJb2+EHVGgusY5eOkWDozQT7zXya2U6PsbN2bQnPU5fYz
 zlLG4DRma9Flov/3+qsTzpkNHuu79k7VLUdzXHhJ0YmaEkHx89kMzJXBMAMt7XQueycH
 V6E7+gefK9Bn13KOmvd4EOGz7BKzBA/X8REjUjEBlyjVT++LcIAYjIQsbe5Ms/+Q94It
 rBCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcRYKh06OjcLIRVCCj9oVyKcuKRx6RLt0q/YbfnAMAzRuMmGaFcSRvSef2MNOMy9dKyoDSAXOmihE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRmIIaf3+jvvFzUcaEBbAWmzHeBP/PT+CBuJnSKIyBDOlB4oto
 oz8zHYaQn5p5jcCLT3vstaGFmWl3E+NRaii0/0pGEphQubWXzf19qOWe69ED60oB6fF8oYOtgO4
 74220IA==
X-Gm-Gg: AZuq6aKhinEzSEUhgYr9MsdYnPo0XKsFzMBw/cuRwN/JX28KZGwiR2UdMRQdkjgs0fR
 8F/HT/l9zDqdTcmskvwdksc6rUMjV1edDaxwHh2W8TDWXIVHAajY5IC3rdjJEuiXHFIAAvgelhv
 zeserU7PECFSMJqRyQpP+I5KnhHWEVQLqLozuq5s84JvYdvcTZg2W9h0aXBKS6HwO8X8shfrA6l
 ekeMxpHrVrKdpFHz5q7BNp36CC1sfkFEwlujBBtn3/IoC+SM2hu3cv3Tj3esWoVDJdjkuwFfFq2
 7R28d94Rfohc66LnAeUdi0LjQ3/QwOLZWukM10r0bLxLhPUCT7d6ObsKt93tr7IQSI1sGbEWMt7
 8H9wOOnjrk3f1rUk5NnyNiwdbXfIlKFuJeJK/4NCbXHjNopnLFhIWXqcnVFTJGxA8jXQjdPptbZ
 2hw52sIZObQuqW2gPVjAbmc7kmfjJ1WkSt86UG+YmtnmvH9qLDFBwpXSb0oPza
X-Received: by 2002:a17:907:7b87:b0:b87:1839:2600 with SMTP id
 a640c23a62f3a-b8dff684645mr401697766b.33.1769882869377; 
 Sat, 31 Jan 2026 10:07:49 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbf2ed58fsm606569066b.66.2026.01.31.10.07.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Jan 2026 10:07:48 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4359a316d89so2412915f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 10:07:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWpd9Koh/v4zUsZseePvvJaMuWxCkkdOJRpfFw+ATBtMeEh+jhSOBhXCqUoCjCcQ9CXJpPE3vhFLuo=@lists.freedesktop.org
X-Received: by 2002:a05:6000:2c01:b0:435:e460:235b with SMTP id
 ffacd0b85a97d-435f3ab32acmr8202185f8f.59.1769882866681; Sat, 31 Jan 2026
 10:07:46 -0800 (PST)
MIME-Version: 1.0
References: <20260131032321.6332-1-chintanlike@gmail.com>
In-Reply-To: <20260131032321.6332-1-chintanlike@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 31 Jan 2026 10:07:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W1SHQDSxfWLhiR3LyGZioqm8VVGOp+FBUp_+r53ejSxQ@mail.gmail.com>
X-Gm-Features: AZwV_QjK-TvJ7UIQzbsFyd48hL5Hz6cL4b9UpMGkxi0LZpKWBvwMgIfQI01PKiI
Message-ID: <CAD=FV=W1SHQDSxfWLhiR3LyGZioqm8VVGOp+FBUp_+r53ejSxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: jdi-lt070me05000: Use MIPI DSI multi functions
To: Chintan Patel <chintanlike@gmail.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chintanlike@gmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E08A4C37A3
X-Rspamd-Action: no action

Hi,

On Fri, Jan 30, 2026 at 7:23=E2=80=AFPM Chintan Patel <chintanlike@gmail.co=
m> wrote:
>
> Convert to the non-deprecated mipi_dsi_*_multi() helpers per the TODO
> list. These reduce boilerplate error checking while providing proper
> error accumulation via mipi_dsi_multi_context.
>
> Also use mipi_dsi_msleep()/mipi_dsi_usleep_range() macros for all
> delays, which automatically skip on error.
>
> Suggested-by: Doug Anderson <dianders@chromium.org>

I'd skip my Suggested-by here. I'm already on the TODO. ;-)


> -       msleep(120);
> -
> -       ret =3D mipi_dsi_generic_write(dsi, (u8[]){0xB0, 0x00}, 2);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to set mcap: %d\n", ret);
> -               return ret;
> -       }
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 120);
>
> -       mdelay(10);

It's worth noting that the old code used a "mdelay" instead of a
"msleep" here. ...but I recognize that there is no "mipi_dsi_mdelay".
It's _probably_ OK to change this and we've already got other sleeping
calls in this function, but it could change the amount of delay a bit.

People always have fun bikeshedding about when to use the various
delays, but IMO slightly better in this case would be to change this
to the "usleep_range" call instead of "msleep". For functions like
this that aren't run very often, you probably don't want a very large
slop, so the mdelay(10) could probably be mipi_dsi_usleep_range(10000,
11000) and the later mdelay(20) could probably be
mipi_dsi_usleep_range(20000, 21000). You'd probably want to at least
mention this change in the commit message.

I'd leave the preexisting usleep_range(10000, 20000) with the
preexisting 10ms slop just to be on the safe side.


> +       mipi_dsi_generic_write_multi(&dsi_ctx, (u8[]){0xB0, 0x00}, 2);

FWIW, instead of the above I believe it's cleaner to do this:

mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x00);

...it's probably worth changing to that while you're doing your cleanup?

I'll also note that lowercase hex (0xb0 instead of 0xB0) is the
preferred style of the Linux kernel, so maybe switch to that as you're
touching the code, too?


>  static void jdi_panel_off(struct jdi_panel *jdi)
>  {
>         struct mipi_dsi_device *dsi =3D jdi->dsi;
> -       struct device *dev =3D &jdi->dsi->dev;
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
>         dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
>
> -       ret =3D mipi_dsi_dcs_set_display_off(dsi);
> -       if (ret < 0)
> -               dev_err(dev, "failed to set display off: %d\n", ret);
> -
> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> -       if (ret < 0)
> -               dev_err(dev, "failed to enter sleep mode: %d\n", ret);
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);

The old code still runs the "enter sleep mode" even if the "set
display off" failed. This is probably on purpose. Power down code
often ignores errors (other than reporting them) and continues on
because there's not really better choices.

In this sense, you probably want a `dsi_ctx.accum_err =3D 0` between the
above two commands.


> -       msleep(100);
> +       mipi_dsi_msleep(&dsi_ctx, 100);

Let's keep it as "msleep(100)". Old code would have slept here even if
there were errors, and that could possibly make sense in power off.
Let's preserve the old behavior. That makes sure even if there some
errors we sleep enough before we start turning off regulators / GPIOs.
