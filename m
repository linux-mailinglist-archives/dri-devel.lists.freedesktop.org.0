Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDC6CBC1C0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 00:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFAA10E043;
	Sun, 14 Dec 2025 23:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ocLb0b0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0758410E043
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 23:32:58 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b727f452fffso440881266b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 15:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1765755175; x=1766359975;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rtrFecLG4IAM21Y0TGPD4xSZD3ZK4EO/mYIQ/fZdH68=;
 b=ocLb0b0bSp4bEJj8L8Nf73klW+hOP5y5SQzCKSlk0IPtPOIwttbILyz6PUd/5+luuF
 v7UhtF+eOVhVKqkhz5Fs6ja2DIF0njSK3fJmvKcBvAwaqr3Dtliev20czp9v6zaTfkxd
 jIV18FgiEpd2mNdCc+T/Q0XaK/lMVYP3GKvdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765755175; x=1766359975;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rtrFecLG4IAM21Y0TGPD4xSZD3ZK4EO/mYIQ/fZdH68=;
 b=uKGUINQmvOdjQDiOP8JsWL3Ve5H38Enh3Odk4bZiO3wr2EEkHmYDBHYiJC/tDJvI0D
 c4BM5I65xbBUlF1lXHj6bikyaj8F0LUiUR8Y9pEJBptNBb6fERyKZOVx8nep8Sd4H958
 LYxRHESByIsSKYGRO5GXiB8yChVsMUVVcyg81Dl6thBrWE4dPr5/CJ17SSx1V4gr3wAD
 4KBFVyO1LZ1+W3A4/uLPaENFZYevyMP5KdgmTVMGKfVtEmpU5bza+/Dfq/dvseoergbv
 GHJFIa9GXbSY7FetHbq9gajyhNF53vEvzdw78Ea5gOYo/cyAQdHHieMiZlm/ITsEMQG5
 FH1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWet6IRJzzXzi9VulnbqOjr3685NgRyQxzjfSI4MLzGhigBLBGgyEqVFvjGZMSUI0KyZ5OqJS8aQU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjKNxO4hXW0ipcvjgyGjRF2+thk/lh1vjHJLS9XUcAgX2jMFn+
 lEYyuashKk60i0hoqLoQPrCsVsjv11NyLqxRi/fFQFYbBMgjVLqiTdPa3rk3FF0g4yJiVTj5VPL
 gfp3NqQ==
X-Gm-Gg: AY/fxX414LY+VtP2i55xao7S00Fgq+Gzj8O2Z2/tonQqT5k7jozeeMgn+oaHRzF7W6I
 oqw/8z55m49wGJQMsE+ANCJxyICUGp696bUuzBjX6rzAiki1uLkInkmofoKUe16CTHmkJOR3Iqz
 y62LUX4Atom8Ad6m/CyMDfvhRAbzjPicsjrvZX79mhidqjQtNbUIyleEaxwPZGG8JaQ7zto/c8C
 h5P/ZnCpuLrVtKuaQmxbo3u8ymd+T0DaXsQHAIZL2dKlEhTVflrfRe5fmQwtsSGL9BtLAdxokbf
 NLjVfx06gkvGrYA9doT/i56xnRjD0nllv/wkWXMVDaLxPcRkMBf7bwHk3fgpbUmtnk7Vk/0D4o4
 DHECGpoKE/4xJDse+YBIIk9awthrAF/jdcLlAKqGKo6N3J6ndbyxuWqSfp/7sJBo78PGmJZJwH4
 mY8BODeQ2o0PQnVvHa2xveubw4OwhhbgoVHb99msdNM4trrtZbcmnMS4IoGJr4
X-Google-Smtp-Source: AGHT+IEGYQlWtACUunZiXM3tUDmkghzOAUZHVd65wsf/RdX1QNiE3K2L+vRtgoPNWmui3P2cae3u6g==
X-Received: by 2002:a17:907:96a0:b0:b72:d577:11cc with SMTP id
 a640c23a62f3a-b7d216b7fb9mr1087328966b.12.1765755174585; 
 Sun, 14 Dec 2025 15:32:54 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7d0dec2a8dsm1075452066b.29.2025.12.14.15.32.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Dec 2025 15:32:52 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so21759175e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 15:32:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUtVSBRq+ErT0B2dIZp7vRyfJwOSaB5gDy7anshG/jxc2nsI80DtCU1gHr0PKg0+burCmTRBx0Qk5A=@lists.freedesktop.org
X-Received: by 2002:a05:600c:4f48:b0:477:9fa0:7495 with SMTP id
 5b1f17b1804b1-47a8f2c3de3mr103762735e9.14.1765755172204; Sun, 14 Dec 2025
 15:32:52 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ub2xYsLcOzL2_AQ+JreWVVd2F1n+meL1NH7ztC1=jZmw@mail.gmail.com>
 <20251213142421.6762-1-amin.gattout@gmail.com>
In-Reply-To: <20251213142421.6762-1-amin.gattout@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 14 Dec 2025 15:32:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UUFPhHUZboHYD1Ev9eRGhKrvBgx5u5JAMHbUMMWZ+z0A@mail.gmail.com>
X-Gm-Features: AQt7F2ot9vgmxgC4Gdo_DZwtow8i4rxz1rFbskHz4yTJmM3LMoIq45lnIR81dCs
Message-ID: <CAD=FV=UUFPhHUZboHYD1Ev9eRGhKrvBgx5u5JAMHbUMMWZ+z0A@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel: otm8009a: Switch to mipi_dsi_multi_context
 helpers
To: Amin GATTOUT <amin.gattout@gmail.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
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

On Sat, Dec 13, 2025 at 6:24=E2=80=AFAM Amin GATTOUT <amin.gattout@gmail.co=
m> wrote:
>
> Update the driver to use the non-deprecated mipi_dsi_*_multi()
> helpers, as recommended in Documentation/gpu/todo.rst. The multi
> variants provide proper error accumulation and handle the required
> DCS NOP insertions, which suits the OTM8009A command sequences.
>
> Refactor otm8009a_dcs_write_buf() and the dcs_write_seq/dcs_write_cmd_at
> macros to take a mipi_dsi_multi_context pointer, passing it through
> from callers. This ensures consistent error handling throughout the
> driver.
>
> Replace all mdelay() and msleep() calls within DSI command sequences
> with mipi_dsi_msleep() for proper error accumulation.
>
> The init, disable, and backlight update paths now return dsi_ctx.accum_er=
r,
> ensuring errors are propagated to callers.
>
> Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
> ---
>  .../gpu/drm/panel/panel-orisetech-otm8009a.c  | 183 +++++++-----------
>  1 file changed, 74 insertions(+), 109 deletions(-)

No need to resend, but for future reference you should be including
version history "after the cut" when you send new versions. If you're
using a tool like b4 or patman to help send the patches, both should
make it easy to do this.

In any case, this looks nice to me! Always good to see the code get
more readable and smaller at the same time (35 lines of code less!).
...and even handle errors more properly now! "scripts/bloat-o-meter"
shows that, while we don't save tons of bytes like we did on drivers
that used to actually do error checking, we still save a little
(1.5%):

add/remove: 0/2 grow/shrink: 2/6 up/down: 56/-416 (-360)
Function                                     old     new   delta
otm8009a_disable                             156     204     +48
otm8009a_backlight_update_status             204     212      +8
.Ltmp9                                         8       -      -8
otm8009a_prepare                            2128    2100     -28
$d                                          3364    3324     -40
.Ltmp3                                      3092    3028     -64
.Ltmp2                                      3164    3100     -64
.Ltmp1                                      3620    3556     -64
$x                                          3720    3656     -64
otm8009a_dcs_write_buf                        84       -     -84
Total: Before=3D23340, After=3D22980, chg -1.54%

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I was thinking of landing this mid way through this week unless anyone
has any objections.

-Doug
