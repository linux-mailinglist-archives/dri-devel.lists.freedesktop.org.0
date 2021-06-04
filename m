Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE7039BAAC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 16:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F264E6E043;
	Fri,  4 Jun 2021 14:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080036E043;
 Fri,  4 Jun 2021 14:09:12 +0000 (UTC)
IronPort-SDR: DnpoU4K6YyZZ+glynSZta2OvG7io/Csn+yY5d6k9aKfDJQu6Dg1NX5dujzH4jE087bSTa0PZNj
 8zJxMr/m9sUQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="289925108"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="289925108"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 07:08:58 -0700
IronPort-SDR: KPXmf99+P6VoEJe2JhtYMp2eVCwwZ/bjSp6mBK0IyRlhdrdJP737/S8WvsEG+Xv+OfM3V1uOib
 RrtqHSZA0+TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="412379056"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 04 Jun 2021 07:08:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Jun 2021 17:08:54 +0300
Date: Fri, 4 Jun 2021 17:08:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm/i915: only disable default vga device
Message-ID: <YLoz9oZSzdE97OOj@intel.com>
References: <20210516171432.1734268-1-emil.l.velikov@gmail.com>
 <YKKmsbvTZBwCUiRu@intel.com>
 <CACvgo53H7GAjN_aFsCBOw+xtVbjcbR1q-U3vdgjT1KUPKoMkkg@mail.gmail.com>
 <YKOiN1EFXz7TfYyV@intel.com>
 <CACvgo52f_8XzkKpzAsgQ-E4VHn9md+rZVbTau5H40PPRVa4SdQ@mail.gmail.com>
 <CACvgo53nKn0nKL195FEJ6gRyTyA_23QnLnP-awPXOtv4DwDyiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACvgo53nKn0nKL195FEJ6gRyTyA_23QnLnP-awPXOtv4DwDyiQ@mail.gmail.com>
X-Patchwork-Hint: comment
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 kernel@collabora.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 02:47:16PM +0100, Emil Velikov wrote:
> On Wed, 26 May 2021 at 17:21, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > Hi Ville,
> >
> > On Tue, 18 May 2021 at 12:17, Ville Syrjälä
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Tue, May 18, 2021 at 12:09:56PM +0100, Emil Velikov wrote:
> > > > Hi Ville,
> > > >
> > > > On Mon, 17 May 2021 at 18:24, Ville Syrjälä
> > > > <ville.syrjala@linux.intel.com> wrote:
> > > > >
> > > > > On Sun, May 16, 2021 at 06:14:32PM +0100, Emil Velikov wrote:
> > > > > > From: Vivek Das Mohapatra <vivek@collabora.com>
> > > > > >
> > > > > > This patch is to do with seamless handover, eg when the sequence is
> > > > > > bootloader → plymouth → desktop.
> > > > > >
> > > > > > It switches the vga arbiter from the "other" GPU to the default one
> > > > > > (intel in this case), so the driver can issue some io().
> > > > >
> > > > > I don't understand what this commit message is trying to say.
> > > > >
> > > > Bunch of context is lost due to the patch age, so I'm not 100% sure of
> > > > the actual hardware setup where this occurs.
> > > > Does the following make sense?
> > > >
> > > > Currently on dual GPU systems, we do not get seamless handover as the
> > > > output flickers during the transition bootloader -> plymouth ->
> > > > desktop.
> > > > This happens as a result of switching (via the VGA arbiter) from the
> > > > "other" GPU back to the default i915 one and issuing io() commands.
> > >
> > > Hmm. Does this work?
> > >
> > > --- a/drivers/gpu/drm/i915/display/intel_vga.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> > > @@ -29,6 +29,9 @@ void intel_vga_disable(struct drm_i915_private *dev_priv)
> > >         i915_reg_t vga_reg = intel_vga_cntrl_reg(dev_priv);
> > >         u8 sr1;
> > >
> > > +       if (intel_de_read(dev_priv, vga_reg) & VGA_DISP_DISABLE)
> > > +               return;
> > > +
> > >         /* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
> > >         vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> > >         outb(SR01, VGA_SR_INDEX);
> > >
> > Was able to replicate the issue somewhat and the above does help quite a lot.
> > Feel free to add my:
> > Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> > Tested-by: Emil Velikov <emil.velikov@collabora.com>
> >
> Humble poke.
> 
> Cannot see this patch in the drm-misc or drm-intel trees. Is there
> anything I do to help move it forward?

Can you just respin the patch with this?

-- 
Ville Syrjälä
Intel
