Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35868D375
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 11:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1400910E4B2;
	Tue,  7 Feb 2023 10:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C1A10E4AE;
 Tue,  7 Feb 2023 10:02:52 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id j9so8789793qvt.0;
 Tue, 07 Feb 2023 02:02:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ChFbUh5V5b2PhTg4oql0omqyT7uX9lKhtti+6M022E4=;
 b=E6uaWJqx72kTJxHCkw7bK/IWFJXqBDCoJA4sOxf8ZUqCCD+o8OxQITe1+/a6KLOXEM
 wCoMD0RDaR84iE7CqHiZfUdmKT/d5xx84l89305PwcPvlBqiP1lhVTVQYikQkfMjZ6O6
 ZrmzYYAdDM+/9H5Dw9C2ck5fwSCaIln6AG+lg9Eos3pfyBJMlFkH2Dp8/cQ9EsfKVnZR
 YyzZCslfvJTkru5XP8E4qazbwhB2lcGkuTeGetA9nrE6jSI8XOiC6exJj8PTx1bDOG8M
 Ukr6eRjGMhVsaT1Q8I4uLkj/JVnoLJJ7qAkdNH4aIH2e9NJJG6+50y3fh3QWDdQEuFb6
 wZ4A==
X-Gm-Message-State: AO0yUKU7y+OPtqW9NZ8u9V+o0MyRlJiSdrJSdi8LjNvvoGt2gFZrvYdn
 SHQT1sJRbQxUfnRq3gijVW6uvR1pyiFeJQ==
X-Google-Smtp-Source: AK7set/aM3iWrwOz/Iumm6qWPHgOSmDvhngr8OQ0vJO9xxNpAfRS0ucoOrK6+sEUJ2tAlpWFTvFtQg==
X-Received: by 2002:a05:6214:d6e:b0:54f:c21f:f273 with SMTP id
 14-20020a0562140d6e00b0054fc21ff273mr4384845qvs.5.1675764170954; 
 Tue, 07 Feb 2023 02:02:50 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 l11-20020a05620a28cb00b007259807a512sm9469053qkp.12.2023.02.07.02.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 02:02:50 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-4c24993965eso189048027b3.12; 
 Tue, 07 Feb 2023 02:02:50 -0800 (PST)
X-Received: by 2002:a81:6988:0:b0:52a:7537:98a6 with SMTP id
 e130-20020a816988000000b0052a753798a6mr231706ywc.384.1675764169824; Tue, 07
 Feb 2023 02:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
 <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org>
 <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
 <bf92569b-3886-113c-9e27-508e4cbfa4ba@linaro.org>
 <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
 <4bf0e5a2-23b6-1964-b30f-a5cb57f35e68@linaro.org>
In-Reply-To: <4bf0e5a2-23b6-1964-b30f-a5cb57f35e68@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Feb 2023 11:02:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyMJZaeeaLjzhbb_A7_WDcyjAzpKNWG8f5gtvmZLW0AA@mail.gmail.com>
Message-ID: <CAMuHMdXyMJZaeeaLjzhbb_A7_WDcyjAzpKNWG8f5gtvmZLW0AA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
To: neil.armstrong@linaro.org
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
Cc: dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Tomi Valkeinen <tomba@kernel.org>,
 freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Tue, Feb 7, 2023 at 10:59 AM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
> On 07/02/2023 10:40, Geert Uytterhoeven wrote:
> > On Tue, Jan 10, 2023 at 5:37 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >> On 10/01/2023 08:57, Laurentiu Palcu wrote:
> >>> On Mon, Jan 09, 2023 at 10:26:28PM +0200, Dmitry Baryshkov wrote:
> >>>> On 09/01/2023 18:21, Laurentiu Palcu wrote:
> >>>>> It looks like there are some issues with this patchset... :/ I just
> >>>>> fetched the drm-tip and, with these patches included, the "Hot plug
> >>>>> detection already enabled" warning is back for i.MX DCSS.
> >>>>
> >>>> Could you please provide a backtrace?
> >>>
> >>> Sure, see below:
> >>
> >> I wondered, why didn't I see this on msm, my main target nowadays. The
> >> msm driver is calling msm_kms_helper_poll_init() after initializing
> >> fbdev, so all previous kms_helper_poll_enable() calls return early.
> >>
> >> I think I have the fix ready. Let me test it locally before posting.
> >
> > Is this fix available?
> > Do you have a lore link?
>
> The fix at [1] has been applied on 2023-01-26
>
> [1] https://lore.kernel.org/all/20230124104548.3234554-1-dmitry.baryshkov@linaro.org/

Applied where? linux-next does not have it.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
