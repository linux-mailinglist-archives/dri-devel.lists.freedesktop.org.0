Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3804BAA9374
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 14:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2A789DFF;
	Mon,  5 May 2025 12:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xw//hKjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4300189DFF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 12:43:13 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-224191d92e4so46338045ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 05:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746448993; x=1747053793; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=itsdfpxgqr9T28YDfLuBCV4kCGXrZvdi4BFAEN1n0j4=;
 b=Xw//hKjMujJaZiIyLbddDSOVifF8ntbyjwNPmwvtz/z4ExUDsM/o3zQ5t4DuwPCga5
 AOgr8l/z1sl0QJZj9lCBXRYST5hY2MPJ6hpKlSwFSm/e+/kppX7Oc7QeeXqLGmeofnd0
 eh1NUEzjK2zIsAWQMRw3pDy+YC0ZHYsnU81twl4EGwUFymEJKea5uPhW6LBLlfwE7k1g
 FLsAmYIJK611/FVwWxtuqm04HVIyJaYAVvQL+AQfzzW98Pzymyvvx6BxIrctPcT1OOa2
 mHCboYzVtn+2T1ghhnBxP666ULM21iKPLBkh5TvrvnXQh1G7F9Xwo31PIoMmq47CkaAq
 afLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746448993; x=1747053793;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=itsdfpxgqr9T28YDfLuBCV4kCGXrZvdi4BFAEN1n0j4=;
 b=oMeMyq7ZqSiTg/gh/TsJaDzee37KB/EwpjtAhZWIvum4oppvUFNukH6SJFY3FSy0Lv
 BVXwPBvZzAIbg9w0r6QjBOg8GNx9l/6GEathoniauRdkIt/IJjeih6s8CpTm/PED07nH
 w05oQ9V214j+O0RIgYTzi5ZBH0Jp0VyZ1ShiNbTH97YM6qi/mmpkcHxNVcRegdWv+zbq
 4sZrQowng2gB/NjFXH/WfLqaqV66S3msFvQtI6DwxGTuzbdXS+J8v31pFcmNxriqHEtz
 ZqulCFv6Nvi/HiKX0+GKlMLB7scAs8a3P9rE5XZ1M1UOJV3AC7NM4BpkeQfIZWO0zQnR
 MUMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW39d4WR3wIxq/pV4mB30RVv2/luakqd9/qKJj1rLePk7RUo4tCxruhnm+8WOB7XqB8xOcvHBc88Ag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrzMfzaxCyLZ3bCz2Q86Ll6W0Brx6pYqAElzLNcsc2PEwLZl72
 yf6urj3z7x3fNGyHiTUfn4QV7S78Y6j15FAj4ezspJUNi1nGaTdD
X-Gm-Gg: ASbGncth4PMBEkq4X48+gdmj/BqndQpE7HMLIc5zSn+5UaJm8EnS1PqETqw+xIvbqRM
 NxgE+ddejtNbKF2Yg857gYFT7ztNkAjNprSZMGjl5pNpzsJY9GiJhi9jlEjdBIEfWpNzCeAc5Y2
 3LXQj2k/7odaWhhEmqHsiLA/rGBrYv2CzD2iiJSfzpgPgXZMFVch0XrJItF7ig/Kbz0sZWR3z8S
 nZVAOvn1LrJZOZIEsvFaPwBH6pymKGsK3JHQpJraLqU/pRW7QGxXrHa5jnlGH0JKKzPdu/Q7zoW
 yUf7M+DUbfvmAt+MoT7TKFKdbieM1Z0MtQm/Be8azsvxra543b+XAbiMOxsY31hoejg=
X-Google-Smtp-Source: AGHT+IG2KkrrZuW4JZYAu2SgF1mIQ5x6uKuF20k8DiGK8/U7q4/P+FzZt88l6w+tkDWWksMwAnmVlg==
X-Received: by 2002:a17:903:2f07:b0:21f:45d:21fb with SMTP id
 d9443c01a7336-22e1e8c1dcemr101041235ad.3.1746448992997; 
 Mon, 05 May 2025 05:43:12 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:bd19:74c5:b39c:cda])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e194aa391sm41645485ad.154.2025.05.05.05.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 05:43:12 -0700 (PDT)
Date: Mon, 5 May 2025 20:43:06 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
Subject: Re: [PATCH] drm/meson: Cast mode->clock to unsigned long long
Message-ID: <aBiyWnKKGMpMYnJ1@vaxr-BM6660-BM6360>
References: <20250429190724.330883-1-richard120310@gmail.com>
 <d5a8e781-6936-4c83-83d1-92daa2da8ca2@wanadoo.fr>
 <CAFBinCCL6OQrbQ_UY_nhnbodN2TquuKPk9unhp3YjpR5u=EXag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCCL6OQrbQ_UY_nhnbodN2TquuKPk9unhp3YjpR5u=EXag@mail.gmail.com>
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

On Sun, May 04, 2025 at 11:06:06PM +0200, Martin Blumenstingl wrote:
> On Tue, Apr 29, 2025 at 11:00 PM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
> >
> > Le 29/04/2025 à 21:07, I Hsin Cheng a écrit :
> > > Coverity scan reported the usage of "mode->clock * 1000" may lead to
> > > integer overflow. Cast the type of "mode->clock" to "unsigned long long"
> > > when utilizing it to avoid potential integer overflow issue.
> > >
> > > Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
> > > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > > ---
> > >   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> > > index 7752d8ac85f0..fe3d3ff7c432 100644
> > > --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> > > +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> > > @@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
> > >       unsigned long long venc_freq;
> > >       unsigned long long hdmi_freq;
> > >
> > > -     vclk_freq = mode->clock * 1000;
> > > +     vclk_freq = (unsigned long long) mode->clock * 1000;
> >
> > Hi,
> >
> > maybe, using 1000ULL instead would do the same, but would be less verbose?
> Agreed, that would make the code more similar to drm_hdmi_compute_mode_clock().
> The goal is to switch to drm_hdmi_compute_mode_clock() mid-term anyways.

Hi,

Thanks for your review and suggestions !
I'll make the corresponding changes and send v2.

Best regards,
I Hsin Cheng

