Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC03808FCB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E9D10E94C;
	Thu,  7 Dec 2023 18:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8DE10E94A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 18:24:13 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a1ef2f5ed01so112857366b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 10:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701973449; x=1702578249;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hRjWkx56RHR1r5cAwUPqSGXDNsuGHCsvk8l76pBIe10=;
 b=OzFMxnVb+bILSv4xFHhTTmCKQt4T2/7nt9SU9ocMdhTtlHJn9dTh5Ft1RaV7EG5/LP
 wFsUX8bjhTvAaycu2AwjHZqy72sPS95EuYhRMBZkFJGp2Y2HOExSWBsLBW8YiDbPT54t
 ubmh4oioTkKWpTBPGdhCj4Kj7LsXGKIDy6uo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701973449; x=1702578249;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hRjWkx56RHR1r5cAwUPqSGXDNsuGHCsvk8l76pBIe10=;
 b=JZSqCFwPXR8YcpH6LOr7/cYe8BA+mg4j7F9A92TYcLOPGeR1jC0Trsv6BE1+q7cMkY
 AerWycKvW/kcGw5CxfKFCTd3o/vmYx5CJA6mWy5GGbWT07Sg+6IDdY3tnAlNIivjSxCt
 DZG9ZsI7nyGbuK6/psrs9dBvCIGXXALcxSm+ayo0mEZ/oaBOzK3eFGyFpZ2d/XTvsjA8
 iZNXB8HFizkjg+XmIZT7+X2kfc/MMuK5lzE8hiQWOkPZu0c7KdfTknZtVSMaaw5U7T8W
 ZOeHFiJClyTU7sArN1VC4VhvFo2Ml1Ak25Jhv1N8j5KJ721RGUFBBMx0MXrQcf3y8PAD
 yiEw==
X-Gm-Message-State: AOJu0YzIOIzYiLUTMKKiGzz57pfXw6Un0YoubdoAE/nTkGKOQ79Qr60L
 a0Vi9Nqn4oIPMtxOuG+R38rhckM5YbuYE58tBW7SQKK+
X-Google-Smtp-Source: AGHT+IGA+UatioingpEl0qGlklG4IGtCkSqvdaB+MW2f8/SA8RJbmzLaVQoX6jGJpCxbgjkaChS8qA==
X-Received: by 2002:a17:906:2210:b0:a1e:86a3:8f4 with SMTP id
 s16-20020a170906221000b00a1e86a308f4mr499614ejs.94.1701973449275; 
 Thu, 07 Dec 2023 10:24:09 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 th8-20020a1709078e0800b00a1df93ed441sm51358ejc.135.2023.12.07.10.24.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 10:24:09 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-40b367a0a12so3795e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 10:24:06 -0800 (PST)
X-Received: by 2002:a05:600c:54cf:b0:40c:2399:d861 with SMTP id
 iw15-20020a05600c54cf00b0040c2399d861mr175294wmb.6.1701973446020; Thu, 07 Dec
 2023 10:24:06 -0800 (PST)
MIME-Version: 1.0
References: <20231207081801.4049075-1-treapking@chromium.org>
 <20231207081801.4049075-5-treapking@chromium.org>
In-Reply-To: <20231207081801.4049075-5-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 Dec 2023 10:23:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U6M5rpQXmjC+iGf0BGtiyjRAAcMfo4Fr3pDyYVp3m4aQ@mail.gmail.com>
Message-ID: <CAD=FV=U6M5rpQXmjC+iGf0BGtiyjRAAcMfo4Fr3pDyYVp3m4aQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/panel-edp: Add some panels with conservative
 timings
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <groeck@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Dec 7, 2023 at 12:18=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> These panels are used by Mediatek MT8173 Chromebooks but we can't find
> the corresponding data sheets, and these panels used to work on v4.19
> kernel without any specified delays.
>
> Therefore, instead of having them use the default conservative timings,
> update them with less-conservative timings from other panels of the same
> vendor. The panels should still work under those timings, and we can
> save some delays and suppress the warnings.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Repeating my comments from v1 here too, since I expect this patch to
sit on the lists for a little while:


This is OK w/ me, but it will need time on the mailing lists before
landing in case anyone else has opinions. Specifical thoughts:

* I at least feel fairly confident that this is OK since these panels
essentially booted without _any_ delays back on the old downstream
v4.19 kernel. Presumably the panels just had fairly robust timing
controllers and so worked OK, but it's better to get the timing more
correct.

* This is definitely better than the very conservative timings and the
WARN_ON splat.

* I don't love the "Unknown" string, but it doesn't do anything other
than print to dmesg anyway and at least it conveys to anyone else
reading the table that the timings may not be quite as tight.
