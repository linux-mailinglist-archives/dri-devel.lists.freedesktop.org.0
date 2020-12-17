Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A20C92DCF9C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 11:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705C789733;
	Thu, 17 Dec 2020 10:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC856E249
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:41:03 +0000 (UTC)
Date: Thu, 17 Dec 2020 10:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1608201661;
 bh=PNrA2eFz33SvuAQdDbxBhvPSipJKE3uObff+4QEUuK0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=g3PkGpaQrjp06As99Mdil1H0FY+XmirTau30DoJj7o0lbFK9lPsJmE0qayjm+OskM
 C6bBcdrm4RqeaARFFy+n9xZXMEA8MHg78aSVMppjqB/iHjwS901pJCMnsJZR731mDS
 60oz2c46rkJIkSNRc1pF+6pBaaqIJozv62VASAC5CR3mjc5wz4EKgGlTDdJpiOMmTy
 1z2Ziuy98fAKdw5k1vHmIvhpP4D/q+/20s3sSQGO9xlLwuNVzUllY6PpuSz7vozDJN
 X0iWgu2rV5rUmErbzvynPocaS8ltfn+rcCxfKiHgfwmd22l2l/YakbUvfSLIqcn+Yc
 2pEuBlnDL9jBg==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 8/8] drm/doc: document the type plane property
Message-ID: <zg8iRcg5FuA6xTm47AXmIyBUBV8KVfnk4G61EVlu3gqaOdIg77OmCL_8weafYpfDxa4rnaDufT6eA_SLzVpP90hkgWtoat5H77zRZMl7hjk=@emersion.fr>
In-Reply-To: <X9p65bX22V6SndAA@phenom.ffwll.local>
References: <20201216202222.48146-1-contact@emersion.fr>
 <20201216202222.48146-9-contact@emersion.fr>
 <X9p65bX22V6SndAA@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, December 16th, 2020 at 10:23 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> > + * type:
> > + *     Immutable property describing the type of the plane.
> > + *
> > + *     For user-space which has enabled the &DRM_CLIENT_CAP_UNIVERSAL_PLANES
>
> While we're at this: Does the kerneldoc for this cap mention that it's
> implicitly enabled when you're enabling atomic?
>
> Maybe worth repeating here too.

Good point. v2 will do both.

> > + *     capability, the plane type is just a hint and is mostly superseded by
> > + *     atomic test-only commits. The type hint can still be used to come up
> > + *     more easily with a plane configuration accepted by the driver.
> > + *
> > + *     The value of this property can be one of the following:
> > + *
> > + *     "Primary":
> > + *         To light up a CRTC, attaching a primary plane is the most likely to
> > + *         work if it covers the whole CRTC and doesn't have scaling or
> > + *         cropping set up.
> > + *
> > + *         Drivers may support more features for the primary plane, user-space
> > + *         can find out with test-only atomic commits.
>
> We need to mention here that this is the implicit plane used by the
> PAGE_FLIP and SETCRTC ioctl (maybe spell them out in full since these are
> userspace docs).

I intentionally didn't write that down here, because as previously discussed,
user-space has no way to guess the drm_crtc.{primary,cursor} pointers, so
user-space cannot guess which planes will be used for legacy IOCTLs. Adding any
hint that user-space _could_ do it will result in broken user-space.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
