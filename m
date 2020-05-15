Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7929A1D463B
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799886EBD9;
	Fri, 15 May 2020 06:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D536E0F6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 05:07:20 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id z80so1399693qka.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 22:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NfF55UVZjZM13JJTcnu7JHGlCcIWGQ0KC6+T1Qa4Oq4=;
 b=AUvyL4TrY/k0uZRpPONkWX0+DRa3JypYhUj9VUTVReBzRNCwB1qGlwB9+xMr/5qKUx
 662uoI0vmPYDQnkLnnoPeZk/8z5J82Bqaw2vZ2igGOXzasFB4XeQNy5SnPAM3aL8d+dm
 HgPH9ubkVbJpPFnpDTFwU2IAAxWbjm6erdork=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NfF55UVZjZM13JJTcnu7JHGlCcIWGQ0KC6+T1Qa4Oq4=;
 b=M6wKcUzwsXYzimcVZnqMXv71S5Xji5xchZHNnfDWaqlb8Y91oBhz5mYsL08Ngqi2dq
 ZoAxhAFfEZhN3IbXj78IXXqYztCMGDwWxdcTDnTYFuuNLTDjHDUUJdH2Z6THurYR7KE4
 V4aoClN0sbphdvDBLW3SlDYTXJNFno15JUOwb+bNW8+xBYYLpgayz+fLMlyEagRavJbb
 93wYw1z7ry3bwTVtnGWx6W2I26vRTtfLapXr2rH6Bl9+qogxQKG4lcjZovoq3y3WoTXr
 Tz10fH8oRvFMvHTBWYdS55W5PiuvvBmrL+7NZAxmatSL05MK+k0iW/DQImfdIFIBgSed
 JD0A==
X-Gm-Message-State: AOAM530Y6PITr78e6JAPKuO7y+paqEZNx69QB+yCfNoYxDgSMfDLfwR5
 2Tjp9n0GSLDDWPkOB6L17W1YWYfBsO92+RAyydCdLQ==
X-Google-Smtp-Source: ABdhPJyqOHTg5AoTGt1Wmzq0ZYIgGB8E4GOtO/n0hCoWBO8WJJlXQqAIbxufbFlLVFtiOfb9I3n6izakdsqzpPkbIcE=
X-Received: by 2002:a37:a3d6:: with SMTP id m205mr1607571qke.241.1589519239498; 
 Thu, 14 May 2020 22:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
 <CAD=HUj6k-y1=64zY8ZFOQBZ7WSUWiQfvkiTpXXt10JB_CGqk1A@mail.gmail.com>
 <20200514123007.GP206103@phenom.ffwll.local>
In-Reply-To: <20200514123007.GP206103@phenom.ffwll.local>
From: David Stevens <stevensd@chromium.org>
Date: Fri, 15 May 2020 14:07:06 +0900
Message-ID: <CAD=HUj7452eFfn9i=JWm54Mke3Lew-7AWYeoKZLAjCSg7eLO6A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
To: David Stevens <stevensd@chromium.org>, Tomasz Figa <tfiga@chromium.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 virtio-dev@lists.oasis-open.org
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 9:30 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, May 14, 2020 at 05:19:40PM +0900, David Stevens wrote:
> > Sorry for the duplicate reply, didn't notice this until now.
> >
> > > Just storing
> > > the uuid should be doable (assuming this doesn't change during the
> > > lifetime of the buffer), so no need for a callback.
> >
> > Directly storing the uuid doesn't work that well because of
> > synchronization issues. The uuid needs to be shared between multiple
> > virtio devices with independent command streams, so to prevent races
> > between importing and exporting, the exporting driver can't share the
> > uuid with other drivers until it knows that the device has finished
> > registering the uuid. That requires a round trip to and then back from
> > the device. Using a callback allows the latency from that round trip
> > registration to be hidden.
>
> Uh, that means you actually do something and there's locking involved.
> Makes stuff more complicated, invariant attributes are a lot easier
> generally. Registering that uuid just always doesn't work, and blocking
> when you're exporting?

Registering the id at creation and blocking in gem export is feasible,
but it doesn't work well for systems with a centralized buffer
allocator that doesn't support batch allocations (e.g. gralloc). In
such a system, the round trip latency would almost certainly be
included in the buffer allocation time. At least on the system I'm
working on, I suspect that would add 10s of milliseconds of startup
latency to video pipelines (although I haven't benchmarked the
difference). Doing the blocking as late as possible means most or all
of the latency can be hidden behind other pipeline setup work.

In terms of complexity, I think the synchronization would be basically
the same in either approach, just in different locations. All it would
do is alleviate the need for a callback to fetch the UUID.

-David
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
