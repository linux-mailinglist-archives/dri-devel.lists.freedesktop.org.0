Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B101225601E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 19:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5C26E047;
	Fri, 28 Aug 2020 17:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F756E047
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 17:55:56 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A12C6201C5;
 Fri, 28 Aug 2020 19:55:50 +0200 (CEST)
Date: Fri, 28 Aug 2020 19:55:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH RFC v6 2/6] drm/sprd: add Unisoc's drm kms master
Message-ID: <20200828175548.GA660103@ravnborg.org>
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
 <1595930879-2478-3-git-send-email-kevin3.tang@gmail.com>
 <20200728204532.GC1277651@ravnborg.org>
 <CAFPSGXaXxr+Du0ptbBHguEPgoHULozSUb-rS3-61pef1fF6b-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFPSGXaXxr+Du0ptbBHguEPgoHULozSUb-rS3-61pef1fF6b-g@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=Gh0u76Fc2OF9ojEVt64A:9 a=CjuIK1q_8ugA:10
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Orson Zhai <orsonzhai@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin

> >
> > > +
> > > +     drm->dev_private = sprd;
> > dev_private is deprecated. Alwyas use upclassing.
> dev_private is deprecated ? I see everyone is still using it, so it
> will be deprecated in the future?
It is deprecated - and a lot of drivers is in need up an update to get
away from using it.

From the kernel-doc:

        /**
         * @dev_private:
         *
         * DRM driver private data. This is deprecated and should be left set to
         * NULL.
         *
         * Instead of using this pointer it is recommended that drivers use
         * drm_dev_init() and embed struct &drm_device in their larger
         * per-device structure.
         */
        void *dev_private;

> > > +     }
> > > +     /* with irq_enabled = true, we can use the vblank feature. */
> > > +     drm->irq_enabled = true;
> > Can drm_irq_install() be used?
> > Then this flag shall not be set by the driver, And the interrupt numbers on different Soc are not necessarily the same
> >
> We need to set "IRQ_NOAUTOEN" flag for CRTC IRQ, you can see that we
> manually turn the interrupt on and off by crtc
> atomic_enable/atomic_disable
> and the interrupt number on different Soc are not necessarily the
> same. So intall interrupt in kms maybe is not suitable for us...

Maybe drm_irq_install() does not fit the need here. But please take an
extra look as what is does is quite basic. And no need to roll your
own if there is available infrstructure that can be used.

But there is nothing wrong rolloing your own if needed.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
