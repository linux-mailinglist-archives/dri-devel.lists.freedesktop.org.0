Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3020439AA75
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 20:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3516E1A2;
	Thu,  3 Jun 2021 18:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480856E1A2;
 Thu,  3 Jun 2021 18:48:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D1B66140D;
 Thu,  3 Jun 2021 18:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622746113;
 bh=ZUGi28CzawjzJFRPa1IvCeYStgPTnkk5SqqRbIhNZDM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=soH8j4t25NOwvyZBPPkJbKQtyXAAn4mzrtMX7uqb2Ajqfc9qqVQZzXVxgrOqs77qY
 Xl3ftEyqTMUxxFHbsiZM07FAsNHDEbrAWM763p1acyUeLmoTPFia89LgdzyfvXdZdX
 g1nv5X+rzVxk8jvbe6aH/34P0mjtMvILQPExuvv4LSgrMHxdTAqwtV3HIWvRuJ9cwd
 z4yOK6cm7k8NyboSpL4W6Whr+46niYdAyMZ0lcy1HscbNbU+x14tCvJE7xdzIfjgIk
 sn+N8oOYCTktX17MTbukrUS3kiVKP7JYisWZBiEmDkLTuciLPzA1gH3nut4+bc+aVp
 0BdMkvyhHybHQ==
Received: by mail-ej1-f47.google.com with SMTP id k25so5250414eja.9;
 Thu, 03 Jun 2021 11:48:33 -0700 (PDT)
X-Gm-Message-State: AOAM532s1JDcBLTQMWw+ixoqeaYhZvluWJlSXovgnDT95jYdP4IywZsE
 q0+ltvMjCTk1c0AEOlA0zHZ/qZMJCSVQBWxMmg==
X-Google-Smtp-Source: ABdhPJw6rdWaR+EBOCW3Z6uvG9Ev3pS5OtlzkBci2gYyzny++PgdOWYgLxObTC4SuMLjl6sYA51sEw2fqRUI5kQVgOo=
X-Received: by 2002:a17:906:1d0a:: with SMTP id
 n10mr660877ejh.341.1622746111501; 
 Thu, 03 Jun 2021 11:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210602215252.695994-1-keescook@chromium.org>
 <20210602215252.695994-2-keescook@chromium.org>
 <YLiXYa8OG9hlaEE5@phenom.ffwll.local>
In-Reply-To: <YLiXYa8OG9hlaEE5@phenom.ffwll.local>
From: Rob Herring <robh@kernel.org>
Date: Thu, 3 Jun 2021 13:48:19 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Vjz9V=of5XXizTBGEq1Cbx3hU9vi-CC3587B1BXphDQ@mail.gmail.com>
Message-ID: <CAL_Jsq+Vjz9V=of5XXizTBGEq1Cbx3hU9vi-CC3587B1BXphDQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: Avoid circular dependencies for CONFIG_FB
To: Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 kernel test robot <lkp@intel.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 3:48 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jun 02, 2021 at 02:52:50PM -0700, Kees Cook wrote:
> > When cleaning up other drm config dependencies, it is too easy to create
> > larger problems. Instead, mark CONFIG_FB as a "depends":
> >
> > drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
> >
> > Suggested-by: Arnd Bergmann <arnd@kernel.org>
> > Link: https://lore.kernel.org/lkml/CAK8P3a3jUQs6c5tESSNMbqfuymewj9FhqRizyHcfOXf8Rgy-nA@mail.gmail.com/
> > Signed-off-by: Kees Cook <keescook@chromium.org>
>
> I rebased this one for -next and applied all three patches to
> drm-misc-next.

Patch 3 is not the right fix and I think breaks some platforms.

Rob
