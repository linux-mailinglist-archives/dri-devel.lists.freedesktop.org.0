Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D66C179FE0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 07:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0294F8991C;
	Thu,  5 Mar 2020 06:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7538991C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 06:21:12 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f13so4741651ljp.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 22:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PEmhObW/jpADaANqPhkfSckuY3+qAcewjBs0fek5zKc=;
 b=gTA2qM38DxWUoV6HAHoHMGwWShAl0vDPQEcHnQS/KXrKpZo2uVuk5SB0r+UgtYi21j
 W0hTTcDDrl/c9DECGmtDjh0xFtI2NtkqpFpZtCGVCJ0TYuXKXojyk1KS/unGVCLQfjpM
 wUYCNuQS8Ylkz3QT9ip1AEe/N21TrOiUsrSwusufbkcUAoBG3K6m8HHxDer/P6C7hGUm
 6YkPQjybUF1CuEtBxtsXjdSc6u31f5YbQVDXls9bAV947fo9Eqpko43D5LN7FmVr22Or
 prdngeHQ8wVR1GAhx9CeTqDDtZRzwahlKD/cSGAa3fDlgxRNvb5sJqSqM+7pyBgfS+Dr
 MDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PEmhObW/jpADaANqPhkfSckuY3+qAcewjBs0fek5zKc=;
 b=bpoEy2c0lLyxVsBbPYejrSfxLSVT1CH7TzhhkEqBgYVzD6fRKJndvpcvFaA6PwhO0p
 FoQO0EfvvqF7HT2QDPtKdCvlm+FDXjaK5tCCZiHGW++IqEATb9GD1MopsVQm908eGcp7
 FWPSQwi52KKJyU/h5kFhWGUeVOEp5vGNS41ITpZnZEhKZb4marbmT+1yBg4MIXTHbyFk
 G+ZSPNWpPW865r5FsY86Oc6ZfJT6tKc2lEKu9qpPzZWmApxQWFBz3h3ftZieNckgxl55
 MZf/TIGNlDGSPfvmeSDXvhl/oY/HUhlYM2tNeb0x5js5Pa39FKT2sCYn21jU+JuPm532
 rEvA==
X-Gm-Message-State: ANhLgQ1S8ZEvF2znMKA7s/sKfT3R9e/TCD9ppLpUkcl+ktP59FOgXBzS
 t+KvRQRzIb4A+XDaTg8DcIFYoY1bW9XMogZem0953Q==
X-Google-Smtp-Source: ADFU+vu96kevqcEYi2C+kn6iYIEElBuzdXVKXs5nkqdXBqnm2BMBsmPM2ZssqC/Rzj9FOOhuzflrqynM0Gtha43D4ZU=
X-Received: by 2002:a2e:9094:: with SMTP id l20mr3931274ljg.131.1583389270542; 
 Wed, 04 Mar 2020 22:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20200217153145.13780-1-james.hughes@raspberrypi.com>
 <CADaigPXfS4o-QQVPsp1axNz+hAATJqA-vzupC0VRWceJNEZNEg@mail.gmail.com>
 <CAJ+9seGY3owufzm4WZwTQXQA9BonyamCCWCrazA3bukEkGixug@mail.gmail.com>
In-Reply-To: <CAJ+9seGY3owufzm4WZwTQXQA9BonyamCCWCrazA3bukEkGixug@mail.gmail.com>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 4 Mar 2020 22:20:59 -0800
Message-ID: <CADaigPWWMaX0fCMofoLFKHCWRyHunfp8y=YMwgxYKDOkCUQKFA@mail.gmail.com>
Subject: Re: [PATCH] GPU: DRM: VC4/V3D Replace wait_for macros in to remove
 use of msleep
To: James Hughes <james.hughes@raspberrypi.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 1:44 AM James Hughes
<james.hughes@raspberrypi.com> wrote:
>
> On Wed, 19 Feb 2020 at 22:51, Eric Anholt <eric@anholt.net> wrote:
> >
> > On Mon, Feb 17, 2020 at 7:41 AM James Hughes
> > <james.hughes@raspberrypi.com> wrote:
> > >
> > > The wait_for macro's for Broadcom VC4 and V3D drivers used msleep
> > > which is inappropriate due to its inaccuracy at low values (minimum
> > > wait time is about 30ms on the Raspberry Pi).
> > >
> > > This patch replaces the macro with the one from the Intel i915 version
> > > which uses usleep_range to provide more accurate waits.
> > >
> > > Signed-off-by: James Hughes <james.hughes@raspberrypi.com>
> >
> > To apply this, we're going to want to split the patch up between v3d
> > (with a fixes tag to the introduction of the driver, since it's a
> > pretty critical fix) and vc4 (where it's used in KMS, and we're pretty
> > sure we want it but changing timing like this in KMS paths is risky so
> > we don't want to backport to stable).  And adjust the commit messages
> > to have consistent prefixes to the rest of the commits to those
> > drivers.
> >
> > I've been fighting with the drm maintainer tools today to try to apply
> > the patch, with no luck.   I'll keep trying, and if I succeed, I'll
> > push it.
>
> Hi Eric,
>
> unclear whether you want me to do the split or whether you are going
> to (your last paragraph). Also I'm a bit unclear on the exact
> requirements for the prefixes etc.

I debugged what was going on with my maintainer tools and got the
patches applied:

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9daee6141cc9c75b09659b02b1cb9eeb2f5e16cc
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=7f2a09ecf2e8d86e22598dfb879db48e72c5a40e

Apologies for the wait!  I've fixed some mail filters I think so I
should notice pings like this in the future.  But also I hope Maxime
can feel enabled to merge patches to vc4/v3d in the future -- I
certainly don't want to be the limiting factor here, and it's under
drm-misc so any drm-misc maintainer can apply stuff.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
