Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAE56073EE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 11:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5AF8825B;
	Fri, 21 Oct 2022 09:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D66510E654
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 09:23:19 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j4so4191667lfk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 02:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J1RNHVZAlYqvVNMkJ9Cu4Gwto63/N1MXzP1Wa1k9d2E=;
 b=AlKZoQqopEAWugfSkq6WIAXlaVfYQLcPU9osed/ks7wOMTiaIw2/8CC7rLuW7ZKdmf
 lDMLVDjNXVyya6eG+jGG9tGQGtWjA+Sm3INelImMPzsU0hSfKFR3fnAHZwdPZJ4nHpZI
 eI4fbCm0D1OvsMGwhM7NM352E5wvaDdixIqao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J1RNHVZAlYqvVNMkJ9Cu4Gwto63/N1MXzP1Wa1k9d2E=;
 b=L2gFSGUNCWqRvipleTUfuwsCsr3lWchQmgcAolR3UgN4eoXTzHmFlaHFii5EC14Rsv
 MQKJvnWzH5ge7mDzwlHB/FpAmYZo+NDZ0g6AQkXyAlzAdA73eUM4UX1iLUbs6LQYqqDi
 UYYWfq8/qn/rmNyRjpQEWQWhuL1+wZblu6xuT5qM7IqKcZGEE4+dhVgWshB388z3h20n
 Wft59tDVzlSM0bjtIOKEmM16GHmDU6ZjbdBJcdQLE9nqe/kAo5GbH+g3E9y30YZeBEWW
 lwI3rzG+LNmnATbXiK8uNJqsTA/frJETb6h9e3XeU+rgCF5YkTUZOKkplh4hd2pi4O8d
 z19w==
X-Gm-Message-State: ACrzQf3p3WWKnlUKM40CLCbKUVs/27tv/xG2rRpWxOgwzz3rOHnX2xAW
 LeeGmrx7SWPymdgeWGJzkyf9B9+oruwFN2pfS0AWsA==
X-Google-Smtp-Source: AMsMyM6E1RO5bPgBJJ7bJB20EeO7Dt1oYJRPWVogV1JYZ+KHx9rH6xAHT884xK669jtVcUdQ0tLsRnGhjWjZjsgaSrk=
X-Received: by 2002:a05:6512:3c8b:b0:4a2:6e64:7049 with SMTP id
 h11-20020a0565123c8b00b004a26e647049mr6707439lfv.196.1666344197716; Fri, 21
 Oct 2022 02:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-11-maciej.kwapulinski@linux.intel.com>
 <Y1IfySBTBiwog9Vy@kroah.com>
In-Reply-To: <Y1IfySBTBiwog9Vy@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 21 Oct 2022 11:23:06 +0200
Message-ID: <CAKMK7uGS51VAws2zYPEwxQUSBNY+S8JT-Uxuqw+7q76OBZG+uA@mail.gmail.com>
Subject: Re: [PATCH v5 10/10] gna: add open and close operations on GNA device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Oct 2022 at 06:27, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 20, 2022 at 07:53:34PM +0200, Maciej Kwapulinski wrote:
> > From: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> >
> > Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> > Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
> > Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> > Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> > Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
> > Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
>
> That's a lot of people who missed that there is nothing described here
> at all :(
>
> Please please please work with the Intel internal kernel developers and
> get this all reviewed properly first before sending anything out again.
> I want to see their signed-off-by or reviewed-by on them before anything
> is sent out again.

This is partially on me, because I'm asking everyone (including intel
folks) to ditch internal review for dri-devel patches and submit
directly.

Of course that means you can get stuff like this which isn't really reviewable.

This part here is for the gna folks, not for Greg.

Now the other side of dri-devel review is that generally subsystem
maintainers never ever look at the patches, and instead we fully rely
on peer review.

This means:
- you review other people's driver patches, ideally also in the
accel/render space and not so much display drm drivers (there's plenty
of everything)
- you ask these people to review your patches
- usually one of them has commit rights already and can push the
stuff, if not _then_ and only then ask maintainers to land things

Quick search on lore says that gna posts on dri-devel have been rather
one-way thus far. Someone has to pay for upstream/community review of
your gna patches, and tit-for-tat economy is about the best we've
figured out thus far. Also tit-for-tat will get rid of unreviewable
patches real fast in my opinion because suddenly it becomes very
important that you're not squandering the painfully acquired review
credits you have on pointless stuff.

If you need help in figuring out what other patches you can review
please show up on #dri-devel irc on oftc, there's tons of people there
usually and we have enormous piles of patches inflight at any moment.

Back to Greg: I much appreciate you reviewing all the various
(occasionally nonsense) patches dri-devel comes up with, but maybe
it's best if you set the gna (and vpu too I guess) driver efforts onto
your ignore lists? I assume you very much want to stay up to date on
the patches that come out of the accel bof discussion from Oded, and I
guess i915 folks having questions about driver/pm changes is also
good. But for the random oddball drivers intel's pushing I think it's
just net negative on your time here.

Plan B is that we also put stern limits into place for intel patches
to dri-devel, but looking at gna+vpu we already seem to have a one-way
dumping ground going on, so I really don't want to encourage intel to
be even more a silo and disappear behind the company firewall.

Cheers, Daniel

>
> thanks,
>
> greg k-h




--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
