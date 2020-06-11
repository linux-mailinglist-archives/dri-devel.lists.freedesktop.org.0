Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B301F6431
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 11:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5026E030;
	Thu, 11 Jun 2020 09:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C8C6E030
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 09:03:48 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y20so4262380wmi.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 02:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=611EZXoXvMC0wgvkSoDqQkuDX4b96jfM5TQTQEW07+g=;
 b=rBu3ZBBsiU7BegTaLT92EmVcTqTQ1ln4TngPt+QtaRUJwZJvFNvlbvL3HcjTBtXw9H
 G1BFGLxRjII2qe+n6Wb4wAjp/MIbndhkzRvvFKrM4W8lQT+ibssLtH8TT46cMB5P5uU3
 5NUykMXB6wJxIim5uZLsueE9Lb1sMJwsx7fkaWRSDcEwhKWAYhiGyzIwnkpl/z6oq0Or
 4x+BtmbF9c7Gs6DTj+RsOX7oSNj6Q0tkv5onPLhaBIsEtG4yxV9T70vq8ePrXAlDNpD8
 5sB2zFwst0zY2C9XYIlAcPCJ2JUIt9V9Hjz4+vjSenZxVun25fMG+8FtkYQcjlFwLPq+
 dTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=611EZXoXvMC0wgvkSoDqQkuDX4b96jfM5TQTQEW07+g=;
 b=V+5sjUPRs0TnsradGiloLYqbxR93rc/rgxnKgMqiVefZO+RlqE1vMhcU7p2EQhAP6z
 djzXBrDlKnwnORdM8J14AXnRL0OXEcqYquqoYvuVhsK1H4iCxFjvXpCziIFDAPSQ+x+Y
 1sndFBfXLDA2+990SEUcYwZa5Ra/ZhbO0+bpdbKkQ7SK2ggbF/vg8GxT5I3ptnXmMaBV
 6rpqxgM2xatQPRkJtGqtf1NJO9TpSKyduO+kUmdneMLiMtkaWbmI7rWi01vJKOHAqanM
 kHuq/Ce3MrgeF3TExrGS5WdosHiSRVySBBudRvyrphEq6IpYO2FTLvt64Q8J8Gw0CsYX
 vWmQ==
X-Gm-Message-State: AOAM532vLZ1gsrbZUZ5fzDBX93cOjQXbKO4oGDRu1kqhVyjvvYsTm83e
 NE8d1RcsLgwJwZRQ/bHz87uO3TvZQbDh3yEKRJAUbw==
X-Google-Smtp-Source: ABdhPJxPKKxxiM1BfEdkh9RUDLtOEwohJAfgWmxAu+vR7pTgkQ6fdURfjYcm3A4r4/Ejum+DBwaGettYUqKJ7IOPnc8=
X-Received: by 2002:a1c:6a01:: with SMTP id f1mr6984797wmc.52.1591866227178;
 Thu, 11 Jun 2020 02:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-4-daniel.vetter@ffwll.ch>
 <159186243606.1506.4437341616828968890@build.alporthouse.com>
 <CAPM=9ty6r1LuXAH_rf98GH0R9yN3x8xzKPjZG3QyvokpQBR-Hg@mail.gmail.com>
In-Reply-To: <CAPM=9ty6r1LuXAH_rf98GH0R9yN3x8xzKPjZG3QyvokpQBR-Hg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 11 Jun 2020 10:01:46 +0100
Message-ID: <CAPj87rM0S2OPssf+WA+pjanT-0Om3yuUM1zUJCv4qTx5VYE=Fw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/18] dma-fence: basic lockdep annotations
To: Dave Airlie <airlied@gmail.com>
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 11 Jun 2020 at 09:44, Dave Airlie <airlied@gmail.com> wrote:
> On Thu, 11 Jun 2020 at 18:01, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > Introducing a global lockmap that cannot capture the rules correctly,
>
> Can you document the rules all drivers should be following then,
> because from here it looks to get refactored every version of i915,
> and it would be nice if we could all aim for the same set of things
> roughly. We've already had enough problems with amdgpu vs i915 vs
> everyone else with fences, if this stops that in the future then I'd
> rather we have that than just some unwritten rules per driver and
> untestable.

As someone who has sunk a bunch of work into explicit-fencing
awareness in my compositor so I can never be blocked, I'd be
disappointed if the infrastructure was ultimately pointless because
the documented fencing rules were \_o_/ or thereabouts. Lockdep
definitely isn't my area of expertise so I can't comment on the patch
per se, but having something to ensure we don't hit deadlocks sure
seems a lot better than nothing.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
