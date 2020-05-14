Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9491D28A6
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 09:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDB86EAC0;
	Thu, 14 May 2020 07:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8027B6EAC4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 07:18:32 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w19so16433667wmc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 00:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KwsrubFMdsohuVw3k+AW4SokzRCKruqC4RxMJbHellQ=;
 b=XeJZZXguWFmQdcxAWwRyIallPaF2na2dURhFnL3DvhTCKCHaML5FT5HkEikDsIBc/I
 UmnsskKAiRu1s8Vd3xwkEwzvjz6wtmQfQtrYifqjN8pibQzwWUCU9Q9gmAvkJgqHhkTJ
 H77ojThXWduDZzVSZ/F3qqUv2z5HcX4vk6vxnchzpwCSOQDuA166WzUcmNiTNXCnb7Ld
 131vwj9LsmWFIBbXqR0ltrfMjJdsbCujjwD15z25BkxoNIGd94AMzrM6UOiBXO6TPV0R
 rg87sGW8Vub3W7LVRBPHbjrvu7IyS2ZzU4J+hyWEi1LTzZeiKbJBNmZuJvpSkPLZvfYJ
 F53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KwsrubFMdsohuVw3k+AW4SokzRCKruqC4RxMJbHellQ=;
 b=ZHTSb6FkAioHRIqheNnNyBEeIKuu4nnSiouNwTnQTPW1oLs5qZxMBTMHoRILyeBOJf
 bGnqVnFoWuP1sLD46mqtf7wVfjJ3le96gd6RVa5/Kgj5baTVX5kMTEz5LO5JfnmtaqGn
 FW+Dl/b/Me1TPZlk9jnOIG0zRNrypmK4THJ2Sdjo3+pTJbHIOcRZtVMIiyF5qLv8XpcE
 ibsCV9oIlgun1lrM2oJQ9UqQ3L9yGE5WbDM2+F8Pf8T9T5drdrTdrrexDUtLgxO2idqA
 H+C+oPjZHYCCFlzt1Hv94HtlOX37BONthY9NXMOYwu0REXgca6NVn2eovCH7CvsOLrzg
 qJjw==
X-Gm-Message-State: AGi0PuZCtgj4OWleiiMQhc1lxgEFXrkZCGuZUcZKOjXJGAekFlTBwNC/
 V+erIsZOU1iC8lVTIvBpKMqZsLXBIa0zYvx6Nd5FsyYZ
X-Google-Smtp-Source: APiQypItK+3Ag9iMlQsKLMwKNV7jEfzjuiS974Q1t1WWHMFMnl9AqF7tQz2yuugS4mvkbkdNZYo1ZbVOSLtkiy1MzBs=
X-Received: by 2002:a1c:2d02:: with SMTP id t2mr46769139wmt.98.1589440710998; 
 Thu, 14 May 2020 00:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200408162403.3616785-1-daniel.vetter@ffwll.ch>
 <CAPj87rMJNwp0t4B0KxH7J_2__4eT7+ZJeG-=_juLSDhPc2hLHQ@mail.gmail.com>
 <CAKMK7uFU7ST9LWmpfhTuk1-_ES6VU-cUogMnPjA15BWFsEVacw@mail.gmail.com>
In-Reply-To: <CAKMK7uFU7ST9LWmpfhTuk1-_ES6VU-cUogMnPjA15BWFsEVacw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 14 May 2020 08:16:52 +0100
Message-ID: <CAPj87rNRLsGJcGEM3dYnitYMwjh7iMNjo9KT=xcDZ0hebRC9iw@mail.gmail.com>
Subject: Re: [PATCH] drm: avoid spurious EBUSY due to nonblocking atomic
 modesets
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Stone <daniels@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 14 May 2020 at 08:08, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > Did anything happen with this?
>
> Nope. There's an igt now that fails with this, and I'm not sure
> whether changing the igt is the right idea or not.
>
> I'm kinda now thinking about changing this to instead document under
> which exact situations you can get a spurious EBUSY, and enforcing
> that in the code with some checks. Essentially only possible if you do
> a ALLOW_MODESET | NONBLOCKING on the other crtc. And then tell
> userspace you get to eat that. We've been shipping with this for so
> long by now that's defacto the uapi anyway :-/
>
> Thoughts? Too horrible?

I've been trying to avoid that, to be honest. Taking a random delay
because the kernel needs to do global things is fine. But making
userspace either do an expensive/complicated cross-CRTC
synchronisation is less easy; for some compositors, that means
reaching across threads to make sure all CRTCs are quiescent. Either
that, or deferring your ALLOW_MODESET to somewhere else, like an idle
handler, far away from where you were originally trying to do it,
which wouldn't be pleasant. The other option is that we teach people
to ignore EBUSY as random noise which can just sometimes happen and to
try again (when? how often? and you still have cross-CRTC
synchronisation issues), which doesn't scream compositor best practice
to me.

I'd be very much in favour of putting the blocking down in the kernel
at least until the kernel can give us a clear indication to tell us
what's going on, and ideally which other resources need to be dragged
in, in a way which is distinguishable from your compositor having
broken synchronisation.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
