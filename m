Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B701A934086
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 18:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8244610E2DF;
	Wed, 17 Jul 2024 16:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TNGHTaHb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63A610E2DF;
 Wed, 17 Jul 2024 16:33:58 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a77bf336171so180731466b.1; 
 Wed, 17 Jul 2024 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721234037; x=1721838837; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GInFX+KjHCh2SZ3uixPMhANVTPTX0s1Mpxztx+WvSTA=;
 b=TNGHTaHbxqE52ywDjRFUDanQ1RTs+BcwoK0fJwTQyPx5IRkkQ0/pkdNQgc4cwuKZjI
 RcHJEyWWEFwVtzrGNwgy/VIGENPlo9avdk2f2PE52J/j+JsFnVb526HU40vzDFtd9I/y
 sBnNj3/tjBWIWOnP9XOF/HfhNLuGxZYdFt7r932Xu6SiVAg8y6SSylaD3IwdT+Wa6yG6
 kU7cBSgTqoHlcKp6y+eZXFjyGwHSB56X9KvNjseEkqsIVB6fJnxa2W2ppm2SRpvP9zGa
 xkTb1R12nHY4YXHLOpXyf/hy1QDIv8ef2UEwage11RnoOWKv0PGOy5aGsxx3uv3ZKEMg
 iIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721234037; x=1721838837;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GInFX+KjHCh2SZ3uixPMhANVTPTX0s1Mpxztx+WvSTA=;
 b=AozZmr1s5nTLkjb/FO32hmTUp3R43EGTfycri8uJ093b1h4Bw+i5nxViicJqBbIGbH
 HeVbWqpbi/rjjztFM6ImpHtqrnKmTcuo2c3H0LzqQzfqBV41HI1Nx8ByXPg5Ob8vRTQR
 yZJhQkZi81ZK3bTvyKPGMU4bWw/SL7gt7bfxnicZutgD6wC9d3r/5tJapF/LbhB2PvA+
 5GMT6dMFyrvXvi+jCt7paoVQ5/N9QWd6jUOYuFcxiWT1mqZ5lvNeqepEFFgCqclYGyKY
 XaFW1RC7NW9XWewzys9xbGw98BNIq8U1sQHOZqm45zBuVfojfGTwsd1nwxM26E45Vf2D
 sqFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5JlrQUO1CiEBE8vESWekJnkGSQn0HOHEhAxGuA91aV12YfA5jMeuOPoZ7+zZlZUbOFWP1ivhW1o7RWTPjGKef8pFxUtMztEJ11LKpsNQVhBPfxmfxCXpE6rnpE9yBY+QHKic8TKVpytHT+fTo5qwy
X-Gm-Message-State: AOJu0YzAwIKcHdSyNmP1Ugf8HkTgVekXlZ08eQtRq6Mj5+7G3wioTL6Z
 QoXS2DP+Ax2d74M5sJm9433JKBtnImKUsFSrdRztZwGGEv22Qjdx
X-Google-Smtp-Source: AGHT+IG+pJCuJO7wqUIo6mEWXUTt+L9f5QLWe2SlWxtz8fE12AIl6KwlmaFJE+tbVXCalbz5FHfNHg==
X-Received: by 2002:a17:906:af0d:b0:a77:ecf0:84e5 with SMTP id
 a640c23a62f3a-a7a0f13be53mr16604966b.14.1721234036828; 
 Wed, 17 Jul 2024 09:33:56 -0700 (PDT)
Received: from trashcan (public-nat-01.vpngate.v4.open.ad.jp. [219.100.37.233])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5a342esm463059366b.40.2024.07.17.09.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 09:33:56 -0700 (PDT)
Date: Wed, 17 Jul 2024 16:31:59 +0000
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] fixes for Adreno A5Xx preemption
Message-ID: <Zpfx_xnRmwoMkSFw@trashcan>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <CACu1E7HROtx1Zgyy0EJuHj_HWE8Nd6OtFnxTcrDrHP+2HA5o6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7HROtx1Zgyy0EJuHj_HWE8Nd6OtFnxTcrDrHP+2HA5o6A@mail.gmail.com>
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

On Wed, Jul 17, 2024 at 10:40:26AM +0100, Connor Abbott wrote:
> On Thu, Jul 11, 2024 at 11:10 AM Vladimir Lypak
> <vladimir.lypak@gmail.com> wrote:
> >
> > There are several issues with preemption on Adreno A5XX GPUs which
> > render system unusable if more than one priority level is used. Those
> > issues include persistent GPU faults and hangs, full UI lockups with
> > idling GPU.
> >
> > ---
> > Vladimir Lypak (4):
> >   drm/msm/a5xx: disable preemption in submits by default
> >   drm/msm/a5xx: properly clear preemption records on resume
> >   drm/msm/a5xx: fix races in preemption evaluation stage
> >   drm/msm/a5xx: workaround early ring-buffer emptiness check
> >
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 18 ++++++++++----
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 12 ++++++---
> >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 30 ++++++++++++++++++++---
> >  3 files changed, 47 insertions(+), 13 deletions(-)
> > ---
> > base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
> > --
> > 2.45.2
> >
> 
> Hi Vladimir,

Hi Connor!

> 
> While looking at preemption on a7xx, where the overall logic is pretty
> much the same, and I've been seeing the same "soft lockups". However
> even after porting patch 3, it turns out that's not enough because
> there's a different race. The sequence of events is something like
> this:
> 
> 1. Medium-prio app A submits to ring 2.
> 2. Ring 0 retires its last job and we start a preemption to ring 2.
> 3. High-prio app B submits to ring 0. It sees the preemption from step
> 2 ongoing and doesn't write the WTPR register or try to preempt.
> 4. The preemption finishes and we update WPTR.
At this point with patch 3 applied it should switch to ring 0 right away
because of trigger call in the end of a5xx_preempt_irq. Didn't you
forget it? Downstream has such call too. Even though it makes preemption
a little more aggressive it doesn't work without it.

> 5. App A's submit retires. We try to preempt, but the submit and
> ring->cur write from step 3 happened on a different CPU and the write
> hasn't landed yet so we skip it.

I don't think this is possible on modern CPUs. Could it be that retire
IRQ appeared earlier (while it was switching from 0 to 2) and you are
looking at msm_gpu_submit_retired trace event which is called from
retire work later.

> 
> It's a bit tricky because write reordering is involved, but this seems
> to be what's happening - everything except my speculation about the
> delayed write to ring->cur being the problem comes straight from a
> trace of this happening.
> 
> Rob suggested on IRC that we make retire handling happen on the same
> workqueue as submissions, so that preempt_trigger is always
> serialized, which IIUC would also make patch 3 unnecessary. What do
> you think?

In this patch series i have tried to do least amount of changes so it
could be easily back-ported. It isn't pretty but it works reliably for
me. Otherwise it would be fine to just disable preemption like it's done
on LTS before 5.4 and rework preemption in new kernel releases.

Kind regards,

Vladimir

> 
> Best regards,
> 
> Connor
