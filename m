Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0937268D30C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 10:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89E610E086;
	Tue,  7 Feb 2023 09:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F5410E086;
 Tue,  7 Feb 2023 09:41:11 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id w11so3350833qvs.7;
 Tue, 07 Feb 2023 01:41:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zp5hYF87tC7LgQJgcE73rMx2/POX2EkkI6L+Y1/9hfw=;
 b=bjeFdGf9LFjjuGtDd9w4B6rJjZk7vqQHDcnBBVaUrLrFttdDBbPGPEZgamFsrCId1L
 YcWTy3MIJ1JXBTQHmun2S0FmbtRiGMsFgtLcdX0u0qO5el2CU2eaDHQqC7bcroGOeB+O
 gISTN/aqX4SzagRtXbJt98IclTFjOgv2ygdwmozz7boonA/0cqLZrGnrabD0j6whDAkM
 M0jHNe1sC49WLrUtadCzC18E54OUyd6B0eaF50SpEidYtmfW95fuErrWuu254Ddf+77d
 XY+3rNe6XKFWktfNDR85LclaX0RwtYNEMl2md9fxGwFtMenoBI1SPFyrMvYmpdj1EgoD
 VxaA==
X-Gm-Message-State: AO0yUKVWVrHSHU3Y+dZq19j/0lECElcBY5cbz8D/6z+a+SeIqpasJjTL
 s63jVDns+s7+KNmQ8aJ1TmJzagzPtsc7RQ==
X-Google-Smtp-Source: AK7set/fpMdmuPXV0UKlOJQvPhXDRm3lb9wuaCH0ZLE0r8U5uv5CxVdIJgEEsznlnsiyjVbcOEL1fw==
X-Received: by 2002:a05:6214:246b:b0:538:baf2:3ca7 with SMTP id
 im11-20020a056214246b00b00538baf23ca7mr4483354qvb.2.1675762870125; 
 Tue, 07 Feb 2023 01:41:10 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 a27-20020a05620a103b00b0070736988c10sm9073202qkk.110.2023.02.07.01.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 01:41:08 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id n139so550374ybf.11;
 Tue, 07 Feb 2023 01:41:08 -0800 (PST)
X-Received: by 2002:a25:eb04:0:b0:7b4:6a33:d89f with SMTP id
 d4-20020a25eb04000000b007b46a33d89fmr229443ybs.543.1675762868169; Tue, 07 Feb
 2023 01:41:08 -0800 (PST)
MIME-Version: 1.0
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
 <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org>
 <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
 <bf92569b-3886-113c-9e27-508e4cbfa4ba@linaro.org>
In-Reply-To: <bf92569b-3886-113c-9e27-508e4cbfa4ba@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Feb 2023 10:40:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
Message-ID: <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Tue, Jan 10, 2023 at 5:37 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On 10/01/2023 08:57, Laurentiu Palcu wrote:
> > On Mon, Jan 09, 2023 at 10:26:28PM +0200, Dmitry Baryshkov wrote:
> >> On 09/01/2023 18:21, Laurentiu Palcu wrote:
> >>> It looks like there are some issues with this patchset... :/ I just
> >>> fetched the drm-tip and, with these patches included, the "Hot plug
> >>> detection already enabled" warning is back for i.MX DCSS.
> >>
> >> Could you please provide a backtrace?
> >
> > Sure, see below:
>
> I wondered, why didn't I see this on msm, my main target nowadays. The
> msm driver is calling msm_kms_helper_poll_init() after initializing
> fbdev, so all previous kms_helper_poll_enable() calls return early.
>
> I think I have the fix ready. Let me test it locally before posting.

Is this fix available?
Do you have a lore link?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
