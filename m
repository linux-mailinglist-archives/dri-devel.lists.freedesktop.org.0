Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D451B2D41BF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 13:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BF56EA0A;
	Wed,  9 Dec 2020 12:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1241F6EA0A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 12:08:27 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id d27so1484672oic.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 04:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lH2aIPfGReG41oXFiTar8tydTSQbukFakurAPPWGMXA=;
 b=AkyDU2MLEg2Ckg19uqmebMIu3iOIaW0Eg+HXBF2aHuu+PIh24fXm4VlH0AxHXe6ubn
 b2/VGR2A7LtTAH8jMaxQiGwbCXjO50F0ySd+DRDV0jIAO8vwWOe0sSgWC2SmoUUeDLiK
 rhk+Vwhzuq+RH3VLrRYQdxXKoih79/Rb5GORk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lH2aIPfGReG41oXFiTar8tydTSQbukFakurAPPWGMXA=;
 b=g+Gr+km2jIYa1144zZuWnsQis/xRnx74juKSX3Tzzr5v6XMBuIsyW+SPSw6GD5r4zA
 gIC65zNs4tdGqvF7FZjAVTfuSxsXMS5665vLiiySeid6nT6IDIuPnSxexAwpiOXr0/f0
 TC0xF3el33uyjb7Z/7FDKHT37nH3Ht+JNcy1BdCufbmQcsCy1Yoj6XQHNTNoZ2nOrQZf
 hIZ9SgZ4WN6aa9V+Ps+I14ik6whUC+qxwVDnXNSDTrbSwlBKUSH1OCGQP7PA98Jl5IOp
 y9bGshxIy7+y8sbcG3j1Du/L+RMZUn1oFrpLKMKPZg/cPWVDQqobMR7NtF35gqvaKWk8
 t3xQ==
X-Gm-Message-State: AOAM531m+nDHvlUObztrIcv9i9EGFspAEAga4Hp1N6CaRhQxsMP2o3t0
 +so8OOMu4Pu8Pu4j74R/RbefsEAOyoSWuzz2vA33IA==
X-Google-Smtp-Source: ABdhPJwoW0k/Ycf4RkiHqchEKdArbJsk2wgrBa641oQiDnlhnZB0lgPOzYGPaAay2fQ/XrCgU9Xx5nSGPQu7cs4taaU=
X-Received: by 2002:aca:54d8:: with SMTP id i207mr1425847oib.101.1607515706418; 
 Wed, 09 Dec 2020 04:08:26 -0800 (PST)
MIME-Version: 1.0
References: <1607413859-63365-1-git-send-email-tiantao6@hisilicon.com>
 <20201209004828.GN401619@phenom.ffwll.local>
 <06c1dee7-488d-8a74-a55c-74043cb060cd@ti.com>
 <CAKMK7uFsDPH3+CHGwkgtnDOc6pJY=_SocyaghETZda+RgjAJnQ@mail.gmail.com>
 <327508b7-2c63-8f2c-36a7-362c83b4243d@ti.com>
In-Reply-To: <327508b7-2c63-8f2c-36a7-362c83b4243d@ti.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 9 Dec 2020 13:08:15 +0100
Message-ID: <CAKMK7uH25qMZy0fLVTAu+Um5r0A-iCQtGc5yFFwNHXd3KZ3VBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/tidss: Use the new api devm_drm_irq_install
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Tian Tao <tiantao6@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 9, 2020 at 1:06 PM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> On 09/12/2020 13:56, Daniel Vetter wrote:
> > On Wed, Dec 9, 2020 at 12:29 PM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> >>
> >> On 09/12/2020 02:48, Daniel Vetter wrote:
> >>> On Tue, Dec 08, 2020 at 03:50:59PM +0800, Tian Tao wrote:
> >>>> Use devm_drm_irq_install to register interrupts so that
> >>>> drm_irq_uninstall is not needed to be called.
> >>>>
> >>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> >>>
> >>> There's another drm_irq_install in the error path. But I'm not sure this
> >>> is safe since you're chaning the order in which things get cleaned up now.
> >>> So leaving this up to Tomi.
> >>
> >> Right, I don't think this works. tidss irq_uninstall uses runtime_get/put, which needs to happen
> >> before pm_runtime_disable. With devm_drm_irq_install that's not the case.
> >
> > Hm I don't spot devm_ versions of these, surely we're not the only
> > ones with this problem?
>
> drm-misc-next has these. hisilicon uses it, but doesn't have an irq_uninstall hook, so possibly late
> uninstall is fine there.

I meant a devm_ version of pm_runtime_enable. Or some other way to
make this just work.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
