Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4280DCBF533
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 18:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D8010E1E7;
	Mon, 15 Dec 2025 17:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="bC9viX4t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30F710E1E7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 17:57:19 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4ee328b8e38so33872351cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1765821439; x=1766426239;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JrDNYX4hqSI6y4PGIj6+dxdIojaAEYXvHqNt+FhuuhY=;
 b=bC9viX4txxbWzverDZYsazCohkdfqcqYk3JPKgb70vg9XObXdr/vSt8uy8IwD4dsBu
 GWkAcdqDG9+AEjEo501jElvXGeoyAlrKgWyZlXsIHZ8kN73zWw9tzadHp3tZpWphRaHU
 spoOllBKGP7mHMkNVU64FmJbotZonXlZLHYzAa0YPvv9gNlSC1KX/BkCFE5jw1V9z/UP
 Koba8IQnqah49+AW94s/SxorKLxkGZjV8/yB3/uWKge7y+1x0VI0OK9ZbJHjtj/FrUYL
 88dzsvTyiY5UXfWlreBlH7BYyV2NzHwADvaVgZiYcXQXMsaDbRrDnm22xquGDYj8ZM2Z
 cvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765821439; x=1766426239;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JrDNYX4hqSI6y4PGIj6+dxdIojaAEYXvHqNt+FhuuhY=;
 b=eIfiAVviCtUNJHMxAg+1kIH0CxiVmm5K1RDdIq8jbAqnxeR7LgIPrFxouwS344bJhX
 a6I3u4N2UYO9tJOu1AOCsus+TR5dPzlcczmQlZyj//O6Shcbk3PcpeJXdG3m3eIe4abR
 oX2yEH+Pv19hFNMeB3c7dQ+kOvZDkKm/3/srkUb6XZE3h/welUJNm25ffFqvCfRI4z1A
 aPjA1sHUC1q564hrdRuywThoGiJgMsuK4maXSceHjUgDtcLN0DsFaZW8HyjK00rplNG6
 iuumpcXt7uoR/E3cL7+vW5bdm47Tnym7pzUSPzts6Ngzhw+0aDpwAT/gc6g6iz7lGsFH
 cCrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUMTBK7DwFGkRFSPPc92YgjGZIuUhnGXFmjw8QpnOkaK9O/Q8tWQKnxwyf5aTUye5E2Xz06YFdgrc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjmkJaKVBrGc56i0u19Aezknihp5Vq2ahg1J11lj1chfQivx15
 EIwGf4K0Tgl52O7ag5f4a9BWPjUtjry/rri6sBPOlRScYSRTW3+3e5/KOhrSPgaAT8ruNdpLq5+
 qsyw4UIIYN4YsNNE0JenH95rsXBN3DhGxKn7p+V7bVg==
X-Gm-Gg: AY/fxX7mTlQRcPL9RJ+VcOxvjVJanPRww1q/yiFX2foi/ngdhMzV9QolqcVwMECQXeP
 iPfh9QT+S1ZJ4rjQMw9rRHo1Hu0jukBOUkCJQJTQJG7UUYHR8Hf5R1873lTasmZ5uG5UlH8k2h5
 45mW/N3naDnhz/qFRvyJwm7G+AQgpu4Sk0O+qTObb8Mm3zVfwBMdY37+3NMAt0XdiaStK2T3JGg
 igJaY18i+OVsCs3+GCjyjKjbICDCbIa2CPbiAy7LN7wnkuGhhk3rI0dQQTxvjM7hFSg5F0=
X-Google-Smtp-Source: AGHT+IGFC2JQ4V1SECaV//h1EmhEsxokdnKGAqKcXjQqd+tP6HAhA9hYS9lkjNvisVQC+6Z2K5Vl/WM78Ka8I+v/P7A=
X-Received: by 2002:a05:622a:481a:b0:4ee:213b:3391 with SMTP id
 d75a77b69052e-4f1d049ff6dmr180679491cf.20.1765821438771; Mon, 15 Dec 2025
 09:57:18 -0800 (PST)
MIME-Version: 1.0
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
 <20251211-vop2-atomic-fixups-v4-2-5d50eda26bf8@collabora.com>
 <20251211224102.5e079d70@pumpkin>
In-Reply-To: <20251211224102.5e079d70@pumpkin>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 15 Dec 2025 17:57:07 +0000
X-Gm-Features: AQt7F2oFXSBO4SC0UxvNyq3w7s43LPnK4r_t9yQh-dyuuj24u5z5H133-vHKl9M
Message-ID: <CAPj87rO45oAihxRhshwvP=9N6oDtd+yRN-R4M3=TsFYmwjr1cA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] drm/rockchip: vop2: Switch impossible pos
 conditional to WARN_ON
To: David Laight <david.laight.linux@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
 kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 11 Dec 2025 at 22:41, David Laight <david.laight.linux@gmail.com> wrote:
> On Thu, 11 Dec 2025 21:40:32 +0100
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> > -     if (dest->y1 + dsp_h > adjusted_mode->vdisplay) {
> > -             drm_dbg_kms(vop2->drm,
> > -                         "vp%d %s dest->y1[%d] + dsp_h[%d] exceed mode vdisplay[%d]\n",
> > -                         vp->id, win->data->name, dest->y1, dsp_h, adjusted_mode->vdisplay);
> > -             dsp_h = adjusted_mode->vdisplay - dest->y1;
> > -             if (dsp_h < 4)
> > -                     dsp_h = 4;
> > -             src_h = dsp_h * src_h / drm_rect_height(dest);
> > -     }
> > +     /* drm_atomic_helper_check_plane_state calls drm_rect_clip_scaled for
> > +      * us, which keeps our planes bounded within the CRTC active area
> > +      */
> > +     WARN_ON(dest->x1 + dsp_w > adjusted_mode->hdisplay);
> > +     WARN_ON(dest->y1 + dsp_h > adjusted_mode->vdisplay);
> > +     WARN_ON(dsp_w < 4);
> > +     WARN_ON(dsp_h < 4);
> > +     WARN_ON(src_w < 4);
> > +     WARN_ON(src_h < 4);
>
> You need to do something when the tests fail.
> Carrying on regardless is never right.

When we arrive at this point, because the load-bearing assumption in
the comment has not been met, our options would be:
* display random incorrect content, and hope that we aren't reading
out of bounds from a buffer that's too small
* turn the display off
* there is no third option

Which are you suggesting?

Cheers,
Daniel
