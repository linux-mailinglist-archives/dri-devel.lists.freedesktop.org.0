Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F30C1FD59F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 21:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75026E0A1;
	Wed, 17 Jun 2020 19:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ACC6E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 19:57:52 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5DEDA208B8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 19:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592423872;
 bh=6EOWrWAPKgFLB8ZGNw/bkhy+Y9laihybAO1W8FLLgE0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=xaFHz/iozgWgycs5vkKMyLQhywn8LIE3m4thJ9lGfq/ft4mvHZp8Zw5f5pCL9xn6y
 OItViZbot/baWh8iOwsng7TD4RkNT/wrwtmxpkuvcb4ss3L9Bhxhi5Sbnz/RSCxTze
 1EUmCWL24KfJLS2lOEh6Vtau7NF1OyGZ4zODcKlU=
Received: by mail-ot1-f42.google.com with SMTP id d4so2672615otk.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 12:57:52 -0700 (PDT)
X-Gm-Message-State: AOAM5310sux//QxYQo+s1VREtJDc98tQlRnJkYXJ3czAS0LH0WuiHdw6
 9rTS2X5Ac1xv4cVTh3GQ3vHfpWsQzI9Eh5+pFQ==
X-Google-Smtp-Source: ABdhPJxYGD7ydPNempaQlxGwlY6okLDhzODVF+rKdYIQX8opUjKSSSQ82BnNVzZIgHkIo8WpU9K2CdFtcuufRw2uHTk=
X-Received: by 2002:a05:6830:3104:: with SMTP id
 b4mr598307ots.192.1592423871739; 
 Wed, 17 Jun 2020 12:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200527200544.7849-1-krzk@kernel.org>
 <20200527204334.GA15485@kevin> <20200617141547.GA30516@kozik-lap>
 <b41bfead-7b73-be78-c63f-79a0a7e23b2a@arm.com>
In-Reply-To: <b41bfead-7b73-be78-c63f-79a0a7e23b2a@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 17 Jun 2020 13:57:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLrFFOVQVR0dWbru6bJvz7sXs8v6Op-hiNgdMwH3N=2Fw@mail.gmail.com>
Message-ID: <CAL_JsqLrFFOVQVR0dWbru6bJvz7sXs8v6Op-hiNgdMwH3N=2Fw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panfrost: Reduce the amount of logs on deferred
 probe
To: Steven Price <steven.price@arm.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 17, 2020 at 8:36 AM Steven Price <steven.price@arm.com> wrote:
>
> On 17/06/2020 15:15, Krzysztof Kozlowski wrote:
> > On Wed, May 27, 2020 at 04:43:34PM -0400, Alyssa Rosenzweig wrote:
> >> Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> >>
> >> On Wed, May 27, 2020 at 10:05:44PM +0200, Krzysztof Kozlowski wrote:
> >>> There is no point to print deferred probe (and its failures to get
> >>> resources) as an error.  Also there is no need to print regulator errors
> >>> twice.
> >>>
> >>> In case of multiple probe tries this would pollute the dmesg.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >>> Reviewed-by: Steven Price <steven.price@arm.com>
> >>>
> >>> ---
> >>>
> >>> Changes since v2:
> >>> 1. Rebase
> >>> 2. Add Steven's review
> >>>
> >>> Changes since v1:
> >>> 1. Remove second error message from calling panfrost_regulator_init()
> >>> ---
> >>>   drivers/gpu/drm/panfrost/panfrost_device.c | 8 ++++----
> >>>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>>
> >
> > Hi Rob, Tomeu and Steven,
> >
> > You're listed as maintainers for panfrost. Is anyone going to pick this
> > up?
>
> I'm only a reviewer so I've been leaving it for Rob or Tomeu, but I can
> pick it up if Rob/Tomeu are happy for me to do that.
>
> > Maybe I sent it to wrong mailing list or forgot about anything?
>
> No, there's actually a few Panfrost commits waiting, it was on my todo
> list to ask if Rob/Tomeu needed some help with merging patches.

Please do, I haven't had the cycles for panfrost lately.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
