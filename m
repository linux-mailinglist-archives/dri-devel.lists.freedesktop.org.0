Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481991691E1
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 22:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C764989A35;
	Sat, 22 Feb 2020 21:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1846D89A35
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 21:27:20 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B446120095;
 Sat, 22 Feb 2020 22:27:14 +0100 (CET)
Date: Sat, 22 Feb 2020 22:27:13 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: tang pengchuan <kevin3.tang@gmail.com>
Subject: Re: [PATCH RFC v3 2/6] drm/sprd: add Unisoc's drm kms master
Message-ID: <20200222212713.GA30872@ravnborg.org>
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-3-git-send-email-kevin3.tang@gmail.com>
 <20200221213652.GD3456@ravnborg.org>
 <CAFPSGXacMKTPrxk_FOrwrvH_XfmO3dYCCa_GoPCe_HUfQFPHtw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFPSGXacMKTPrxk_FOrwrvH_XfmO3dYCCa_GoPCe_HUfQFPHtw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=GLTfEzBshYVTt7jvnNEA:9 a=CjuIK1q_8ugA:10
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
Cc: mark.rutland@arm.com, Baolin Wang <baolin.wang@linaro.org>,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, robh+dt@kernel.org,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin/tang.

Thanks for the quick and detailed feedback.
Your questions are addressed below.

	Sam


> > > +static int sprd_drm_bind(struct device *dev)
> > > +{
> > > +     struct drm_device *drm;
> > > +     struct sprd_drm *sprd;
> > > +     int err;
> > > +
> > > +     drm = drm_dev_alloc(&sprd_drm_drv, dev);
> > > +     if (IS_ERR(drm))
> > > +             return PTR_ERR(drm);
> > You should embed drm_device in struct sprd_drm.
> > See example code in drm/drm_drv.c
> >
> > This is what modern drm drivers do.
> >
> > I *think* you can drop the component framework if you do this.
> >
> I have read it(drm/drm_drv.c) carefully, if drop the component framework,
> the whole our drm driver maybe need to redesign, so i still want to keep
> current design.
OK, fine.

> > > +     sprd_drm_mode_config_init(drm);
> > > +
> > > +     /* bind and init sub drivers */
> > > +     err = component_bind_all(drm->dev, drm);
> > > +     if (err) {
> > > +             DRM_ERROR("failed to bind all component.\n");
> > > +             goto err_dc_cleanup;
> > > +     }
> > When you have a drm_device - which you do here.
> > Then please use drm_err() and friends for error messages.
> > Please verify all uses of DRM_XXX
> >
>   modern drm drivers need drm_xxx to replace DRM_XXX?
Yes, use of DRM_XXX is deprecated - when you have a drm_device.

> >
> > > +     /* with irq_enabled = true, we can use the vblank feature. */
> > > +     drm->irq_enabled = true;
> > I cannot see any irq being installed. This looks wrong.
> >
> Our display controller isr is been register on crtc driver(sprd_dpu.c), not
> here.

I think you just need to move this to next patch and then it is fine.

	Sam

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
