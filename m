Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0E6387748
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 13:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBFF6EB28;
	Tue, 18 May 2021 11:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17A46EB27;
 Tue, 18 May 2021 11:17:16 +0000 (UTC)
IronPort-SDR: yI+gj/YwlRdn4l1XOAm18pfWTlUVeftaGMdKr6oICcwIjHriwqMvcEAM/JBlNBN+4kGNZdU69T
 5Tt9mZ53MsoA==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="198733675"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="198733675"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 04:17:16 -0700
IronPort-SDR: RP9CB410mQszfPj4yd/i86Q5F8YvKUlcCUp6PK4SNYelpI+h+6rEqT4Acl5z0nIaA7R02Q0Xqh
 7nYDUxPmc/rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="472903493"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 18 May 2021 04:17:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 18 May 2021 14:17:11 +0300
Date: Tue, 18 May 2021 14:17:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm/i915: only disable default vga device
Message-ID: <YKOiN1EFXz7TfYyV@intel.com>
References: <20210516171432.1734268-1-emil.l.velikov@gmail.com>
 <YKKmsbvTZBwCUiRu@intel.com>
 <CACvgo53H7GAjN_aFsCBOw+xtVbjcbR1q-U3vdgjT1KUPKoMkkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACvgo53H7GAjN_aFsCBOw+xtVbjcbR1q-U3vdgjT1KUPKoMkkg@mail.gmail.com>
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
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 12:09:56PM +0100, Emil Velikov wrote:
> Hi Ville,
> 
> On Mon, 17 May 2021 at 18:24, Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Sun, May 16, 2021 at 06:14:32PM +0100, Emil Velikov wrote:
> > > From: Vivek Das Mohapatra <vivek@collabora.com>
> > >
> > > This patch is to do with seamless handover, eg when the sequence is
> > > bootloader → plymouth → desktop.
> > >
> > > It switches the vga arbiter from the "other" GPU to the default one
> > > (intel in this case), so the driver can issue some io().
> >
> > I don't understand what this commit message is trying to say.
> >
> Bunch of context is lost due to the patch age, so I'm not 100% sure of
> the actual hardware setup where this occurs.
> Does the following make sense?
> 
> Currently on dual GPU systems, we do not get seamless handover as the
> output flickers during the transition bootloader -> plymouth ->
> desktop.
> This happens as a result of switching (via the VGA arbiter) from the
> "other" GPU back to the default i915 one and issuing io() commands.

Hmm. Does this work?

--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -29,6 +29,9 @@ void intel_vga_disable(struct drm_i915_private *dev_priv)
        i915_reg_t vga_reg = intel_vga_cntrl_reg(dev_priv);
        u8 sr1;
 
+       if (intel_de_read(dev_priv, vga_reg) & VGA_DISP_DISABLE)
+               return;
+
        /* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
        vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
        outb(SR01, VGA_SR_INDEX);

-- 
Ville Syrjälä
Intel
