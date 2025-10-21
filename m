Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762FBBF4B8D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 08:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991C910E2CE;
	Tue, 21 Oct 2025 06:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PgMnY18E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD5210E2A4;
 Tue, 21 Oct 2025 06:40:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C1F6948F10;
 Tue, 21 Oct 2025 06:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95055C4CEF1;
 Tue, 21 Oct 2025 06:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761028802;
 bh=F2zvaeQRjxCV9dowQndodgCihh96j40DHwUJSTG9P3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PgMnY18EYc3QVP6yWuffB+ybMJ48IIL718IgG80fqKIceXw3+LZD/8dHlaYBw7UAc
 gl2Zt+tEMriLTyK1u/vtmCbos4lFzWSHWQ4APoOIaom8p8osTbRrSmkaEjrg55UCrA
 L6+6REIablmshf4uuliN8qmjek1QvQoTnBjULymIkn24dVlAfPpnr1aCipdn4+Zd6R
 FydEDDMlhr+MVWMu2iuQ7CrsAwuy56573601v4+KMP0Rmocq0ifDp33NIbRE11uf5+
 Tdmvjxz+wrJiW50qMiBNdcjYbGnV9/5Ay0sijhrz55JCGAUI0jvMeU6crUzuVJoZi9
 RbhrMFRAAuf/A==
Date: Tue, 21 Oct 2025 08:39:57 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Ryan Neph <ryanneph@google.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/xe/configfs: fix clang warnings for missing
 parameter name
Message-ID: <20251021063957.GA757076@ax162>
References: <20251017-rn-cfi-v1-0-bf66e6ad4fcd@google.com>
 <20251017-rn-cfi-v1-2-bf66e6ad4fcd@google.com>
 <20251020110513.48d18788@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020110513.48d18788@pumpkin>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 20, 2025 at 11:05:13AM +0100, David Laight wrote:
> On Fri, 17 Oct 2025 12:46:26 -0700
> Ryan Neph <ryanneph@google.com> wrote:
> 
> > Fixes warning from clang-17 that look like:
> > 
> > drivers/gpu/drm/xe/xe_configfs.h:35:97: error: omitting the parameter name in a function definition is a C2x extension [-Werror,-Wc2x-extensions]
> >    35 | static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> 
> Why did that become invalid?
> It has pretty much always been used - and can be used to avoid -Wshadow warnings.
> This looks like a clang bug.
> And you'd want a specific -W 'knob' for it as well.
> 
> At a guess the C2x extension lets the name be omitted in the function body for
> an unused parameter (the same as C++).
> I think that is the 'definition' and the ones being changed here are the 'declaration'.
> But I might be wrong.

I don't think you read the patch clearly enough. Both declarations and
'static inline' definitions are being updated in this patch, likely for
consistency rather than necessity (but the commit message could call
this out). I don't see how there is a clang bug here.

> > 
> > Signed-off-by: Ryan Neph <ryanneph@google.com>
> > ---
> >  drivers/gpu/drm/xe/xe_configfs.h | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> > index fed57be0b90e146d57d966bab0e55e1723513997..a0d614b37efd54b89390f04a238aef1a8d4df4e2 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs.h
> > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > @@ -21,9 +21,9 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
> >  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
> >  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> >  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> > -u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> > +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class class,
> >  				       const u32 **cs);
> > -u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> > +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class class,
> >  					const u32 **cs);
> >  #ifdef CONFIG_PCI_IOV
> >  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
> > @@ -37,9 +37,11 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
> >  static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
> >  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> >  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> > -static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> > +static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> > +						     enum xe_engine_class class,
> >  						     const u32 **cs) { return 0; }
> > -static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> > +static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> > +						      enum xe_engine_class class,
> >  						      const u32 **cs) { return 0; }
> >  static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
> >  #endif
> > 
> 
