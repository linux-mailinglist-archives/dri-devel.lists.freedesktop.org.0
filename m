Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AB58683BF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 23:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235AD10E2D3;
	Mon, 26 Feb 2024 22:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="O7xwwRxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56F510E2D3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 22:29:24 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-564a53b8133so2820956a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708986562; x=1709591362;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HwHOxhCzVgWRYHLx5UlREeeks0w7r8W0vRg5wArpOeU=;
 b=O7xwwRxxWN8QQEmgJ1c/EA+Rqiza3t2UeHvRepc0ehVTKi0L0Uce8I9I3R/OO/c2Hm
 sBXEwZrY+PVi1KdusRpvO/TQ4pF/JoIFbNkIWwRahwUF205fJxzUVsZ/2CDHRLeqq91M
 6NUxNLRdorgX4rhNR3ebCNUArX/V/Eaxb0uCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708986562; x=1709591362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HwHOxhCzVgWRYHLx5UlREeeks0w7r8W0vRg5wArpOeU=;
 b=RF9LsJHmjFbP6IFrexM3P3NKWkKDCtBJAyBc2iaqixxyVvy5E2edSCYVWzmAVbA/Ay
 d4G+Xk6J27qIBueIUiUbIsTU9MYFsgbxqGf27K4mBNv++3lxW8admTQPKVdyUc97TTYG
 +xHzX2FDJsKX782fwyGc4y6U3t8f8Mh9Wcf5mo6mfie6nTUTQ2qsw7qidwnNXeXo+f9j
 1VEGGLvMo40zrdny7M7mmfT+Zq1nnBOyVXIvbwHPSxCU8QDCkDMi4d42M6bIdSdEkuCO
 kwBAAdDKrUtrFfdFBp/S6p7JOLkMYvhoh0XgASc6e/aVKe7RamwBisDGldHm5yH0gOrb
 uVyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSeyw9CqLm1wsJFIAUXCRXn2eQ1mMJN60lHezSePd9kdKI22c/bvk3DAk5AvaXbNqj5/eRhElbabu+DsXyKa9M6QZTX9AHyv0AdwkO2WTJ
X-Gm-Message-State: AOJu0YzEWxLHAWsfKF5cZkrPgxrvqthSg8apRjD0ipUoQNgHp92tq52n
 BFl7E0uDzDFlOKHh5en3O8DiEp7pAuEYshW283Bia/BgD7R9fiBTGpNYDWtOzGGQRNL16cLKjYA
 R8h8X
X-Google-Smtp-Source: AGHT+IHg9BcmPqZb4dGKWz+ei+BaBu/4zyv6o58fQalacznx+dEzkPXCH2mjZTLd0jVnsorto3igfw==
X-Received: by 2002:a05:6402:7cf:b0:564:eb44:8cca with SMTP id
 u15-20020a05640207cf00b00564eb448ccamr4963200edy.18.1708986561988; 
 Mon, 26 Feb 2024 14:29:21 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 k2-20020aa7c042000000b0055d333a0584sm162043edo.72.2024.02.26.14.29.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 14:29:21 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-412a9f272f4so14885e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:29:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU8vNcQUbZ0xAsi5GhLsF+iIOcJdcSTzMgakMoE6IvzmhndbYKrdkUrx9SIvUpS0nqBFC31G/HxSpOvjA9BETK3X/fkQFRfTFOYno1zIYy2
X-Received: by 2002:a05:600c:4e15:b0:412:a786:e8a1 with SMTP id
 b21-20020a05600c4e1500b00412a786e8a1mr82285wmq.6.1708986560846; Mon, 26 Feb
 2024 14:29:20 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <20240223223958.3887423-2-hsinyi@chromium.org>
In-Reply-To: <20240223223958.3887423-2-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Feb 2024 14:29:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XZJgFhufr8EkUfBYK+00Kb6R3dHob=EY8XUZ8NJmSChA@mail.gmail.com>
Message-ID: <CAD=FV=XZJgFhufr8EkUfBYK+00Kb6R3dHob=EY8XUZ8NJmSChA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm_edid: Add a function to get EDID base block
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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

Hi,

On Fri, Feb 23, 2024 at 2:40=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> @@ -2770,58 +2770,63 @@ static u32 edid_extract_panel_id(const struct edi=
d *edid)
>  }
>
>  /**
> - * drm_edid_get_panel_id - Get a panel's ID through DDC
> - * @adapter: I2C adapter to use for DDC
> + * drm_edid_get_panel_id - Get a panel's ID from EDID base block
> + * @base_bock: EDID base block that contains panel ID.

s/base_bock/base_block, as identified by:

scripts/kernel-doc -v drivers/gpu/drm/drm_edid.c | less 2>&1

drivers/gpu/drm/drm_edid.c:2787: warning: Function parameter or struct
member 'base_block' not described in 'drm_edid_get_panel_id'
drivers/gpu/drm/drm_edid.c:2787: warning: Excess function parameter
'base_bock' description in 'drm_edid_get_panel_id'


>   *
> - * This function reads the first block of the EDID of a panel and (assum=
ing
> + * This function uses the first block of the EDID of a panel and (assumi=
ng
>   * that the EDID is valid) extracts the ID out of it. The ID is a 32-bit=
 value
>   * (16 bits of manufacturer ID and 16 bits of per-manufacturer ID) that'=
s
>   * supposed to be different for each different modem of panel.
>   *
> + * Return: A 32-bit ID that should be different for each make/model of p=
anel.
> + *         See the functions drm_edid_encode_panel_id() and
> + *         drm_edid_decode_panel_id() for some details on the structure =
of this
> + *         ID.
> + */
> +u32 drm_edid_get_panel_id(void *base_block)
> +{
> +       return edid_extract_panel_id(base_block);
> +}
> +EXPORT_SYMBOL(drm_edid_get_panel_id);
> +
> +/**
> + * drm_edid_get_base_block - Get a panel's EDID base block
> + * @adapter: I2C adapter to use for DDC
> + *
> + * This function returns the first block of the EDID of a panel.
> + *
>   * This function is intended to be used during early probing on devices =
where
>   * more than one panel might be present. Because of its intended use it =
must
> - * assume that the EDID of the panel is correct, at least as far as the =
ID
> - * is concerned (in other words, we don't process any overrides here).
> + * assume that the EDID of the panel is correct, at least as far as the =
base
> + * block is concerned (in other words, we don't process any overrides he=
re).
>   *
>   * NOTE: it's expected that this function and drm_do_get_edid() will bot=
h
>   * be read the EDID, but there is no caching between them. Since we're o=
nly
>   * reading the first block, hopefully this extra overhead won't be too b=
ig.
>   *
> - * Return: A 32-bit ID that should be different for each make/model of p=
anel.
> - *         See the functions drm_edid_encode_panel_id() and
> - *         drm_edid_decode_panel_id() for some details on the structure =
of this
> - *         ID.
> + * Caller should free the base block after use.

Don't you need a "Return:" clause here to document what you're returning?


Other than the kernel-doc nits, this looks fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

It'll probably need at least an Ack from someone else in the DRM
community before it can land, though, since this is touching a core
file.


-Doug
