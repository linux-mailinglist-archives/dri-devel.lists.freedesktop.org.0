Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5810078B512
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 18:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FED610E30F;
	Mon, 28 Aug 2023 16:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF8910E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 16:06:44 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-52a3ff5f0abso4579051a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 09:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693238802; x=1693843602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NJIQq3Q5XZugkIRvBGCko5sB8qNI0t2ngmpOadONnhI=;
 b=I6hXe9gXAg/Ab4pKStl06By0B3kwpNnVMg+7P/uW484iu3rZAaYLiwXh3hstkJhJHb
 D3ZBtFXuy3PZiHgXSltCmK8JIdz/x8hDLyVg0VORNuaeodHbjzZfYwLR4wVvTSxDlwQ7
 iAMDy2u65KNa7IyIm1ssvJ6V0AFwYvcXDjHeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693238802; x=1693843602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NJIQq3Q5XZugkIRvBGCko5sB8qNI0t2ngmpOadONnhI=;
 b=XOvlnFX7rKz1JbvzV4yFUb/4btjgcFLsmn1uoj48CRgPZSV7o/Hodro9Fo9pgN1naG
 rVLSL9Hg4+J7tic3qf+OLu1AmynsyOqttA6094yqQYmmMzpQWk+FWPxwr+4sK5wgN+Xi
 wLbigUz24MfZCLSwwyeQZMgcXVSP7aJbp/4hkdrH/1D6V6K2VGrQ37NAKGhAFbAxFLJB
 EeRR6CqoB3DouWhEgxEHyzRY2gVqkTBDzoPLRqoH6eQ4guAvSmCDDfgAOqfftALjcdqB
 nnPW6NziGbiuapA90JPSq79C8mhQY0uXrCBC5j2PhSvaB2yo4klPOE4j3NS0ZZksOcB2
 hp7A==
X-Gm-Message-State: AOJu0Yw+Qrn7aHRfHDeGEpEBx0ZNPWLJma+OZ7Z8zelg5ZuXAGrV4U64
 ilghO8AoI28y5EsDlFaGvY6FmBnZeojSE8auOduTmnKk
X-Google-Smtp-Source: AGHT+IG07TGswKQLrS7/EWZFEKPPhjjmU64PXnSPoCKsEJhMYg1SUVEaeI6+qLwGe7nLiWcrDQ4TZg==
X-Received: by 2002:aa7:d058:0:b0:51b:d567:cfed with SMTP id
 n24-20020aa7d058000000b0051bd567cfedmr22296699edo.5.1693238802622; 
 Mon, 28 Aug 2023 09:06:42 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 e5-20020a056402148500b0052996528b81sm4571966edv.45.2023.08.28.09.06.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 09:06:42 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-3fef2fafee2so131905e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 09:06:41 -0700 (PDT)
X-Received: by 2002:a05:600c:600d:b0:3f6:f4b:d4a6 with SMTP id
 az13-20020a05600c600d00b003f60f4bd4a6mr316974wmb.7.1693238801578; Mon, 28 Aug
 2023 09:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230804210644.1862287-1-dianders@chromium.org>
 <20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid>
 <bphkopaq76imqzut7xrx7aprqybhx3veajdympqhig2wqlix6c@64ck23rc5cv7>
 <CAD=FV=XiVkoCsjin4R74nkcd8vzOq9uPq+o5cRjd=YOoPXuQkg@mail.gmail.com>
 <lhd6ai7d6swlxhisjhikytguor7pptrymo3bmfwej4k7zqrnv4@hp2gvhw7mh3m>
In-Reply-To: <lhd6ai7d6swlxhisjhikytguor7pptrymo3bmfwej4k7zqrnv4@hp2gvhw7mh3m>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Aug 2023 09:06:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XUhzguFCC=aKzHFMV0bBnZzkHXP_tx+P=PNkVr=8SnTA@mail.gmail.com>
Message-ID: <CAD=FV=XUhzguFCC=aKzHFMV0bBnZzkHXP_tx+P=PNkVr=8SnTA@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Aug 28, 2023 at 12:45=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
> > For removal I'd be fine with just dropping the call and saying it's
> > the responsibility of the driver to call drm_atomic_helper_shutdown(),
> > as you suggest. I'd tend to believe that removal of DRM drivers is not
> > used anywhere in "production" code (or at least not common) and I
> > think it's super hard to get it right, to unregister and unbind all
> > the DRM components in the right order.
>
> It depends on the kind of devices. USB devices are very likely to be
> removed, platform devices very unlikely, and PCIe cards somewhere in the
> middle :)

Good point. Obviously those cases need to work. I guess I've just
spent lots of time on the SoC case where all the pieces coming
together are very intertwined with each other...


> > Shutdown is called any time you reboot a device. That means that if a
> > DRM driver is _not_ calling drm_atomic_helper_shutdown() on the
> > panel's behalf at shutdown time then the panel won't be powered off
> > properly. This feels to me like something that might actually matter.
>
> It does matter. What I disagree on is that you suggest working around
> that brokenness in the core framework. What I'm saying is driver is
> broken, we should keep the core framework sane and fix it in the driver.
>
> It should be fairly easy with a coccinelle script to figure out which
> panels are affected, and to add that call in remove.

I think I'm confused here. I've already figured out which panels are
affected in my patch series, right? It's the set of panels that today
try to power the panel off in their shutdown call, right? ...but I
think we can't add the call you're suggesting,
drm_atomic_helper_shutdown(), to the _panel_'s shutdown callback, can
we? We need to add it to the shutdown callback of the top-level DRM
driver, right?


> > Panels tend to be one of those things that really care about their
> > power sequencing and can even get damaged (or not turn on properly
> > next time) if sequencing is not done properly, so just removing this
> > code and putting the blame on the DRM driver seems scary to me.
>
> Sure, it's bad. But there's no difference compared to the approach you
> suggest in that patch: you created a helper, yes, but every driver will
> still have to call that helper and if they don't, the panel will still
> be called and it's a bug. And we would have to convert everything to
> that new helper.
>
> It's fundamentally the same discussion than what you were opposed to
> above.

I think the key difference here is that, if I understand correctly,
drm_atomic_helper_shutdown() needs to be added to the top-level DRM
driver, not to the panel itself. I guess I'm worried that I'll either
miss a case or that simply adding a call to
drm_atomic_helper_shutdown() in the top-level DRM driver will break
something. Well, I suppose I can try it and see what happens...


I'll try to cook up a v2 and we'll see what people say. I might keep
the RFC tag for v2 just because I expect it to still be touching a lot
of stuff.

-Doug
