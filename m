Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF28BF7C68
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 18:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5862B10E63F;
	Tue, 21 Oct 2025 16:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ORvjyIrd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7284310E63D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 16:47:43 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-781ea2cee3fso5227771b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 09:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761065263; x=1761670063;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OT9BDqZbtTZ8FlPJwy4YL51bMKIbhKLdUmKCp9QkH1I=;
 b=ORvjyIrdb0D39//8gGZgi08gVpJf3JfzJuyxzi/Pf5TEGeZbNXpg54qALJpFu+L/W7
 /mnSqhC5SUBzxqzqulBVrug1tSe1CsUcVdZ81ui+3xp83CgFyHP8sMXoamnU55vqUQVv
 gddnwzoDPescN/SWcjFnEB+OmewC0TNU9zTy7Vf3BWEYyU+eUM5VJbFdptuLtggSy4Hn
 7rOicDuCYTI/MpV/UpwIt+8qvrMlHI1AinC91HPfl6/mmSILmPpYMzOh9op5Vp+BoqlX
 R4XMwioqhltRw2nZ55rQx8gZJTe7B6kF8px0sggUpV1IEJImEb3Pu6SElK5sPCcLMl/v
 dRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761065263; x=1761670063;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OT9BDqZbtTZ8FlPJwy4YL51bMKIbhKLdUmKCp9QkH1I=;
 b=YUijCoS4l20QUf9lNVC702Tde5x8w6ItEkCmFQds4HhpLyww8OC6p7nZn4cLUWcTNk
 t1/TwKE30HUT+q6BudMldr9qwMNbOcdgbRkT0ftWVjTGxpdWPt3U8BwW8moNyW9OfgUU
 H8NETKpJPxq3j7ZKkebZS53sew3F3LhjUBtu+mY6pDyuyIEcgm2oXentCHbc5P7OZ80Y
 f4rD5Gh4Sr9ppdNLjbWUiYbzGuLZ2UGkMmQFKqyYK962wr4b5iavF2f7T2Sk42VrsD+S
 Pbbp64oAb4skLsdl8tetUpSfot4d0MFC2tkk0uV7N83HYitnme0TRxSyRLzR5wZLNe1g
 V2vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkiDdBegWShy2HcHYRgoljkbL5PV4IEfzxJta6WAdahFaZeyoxqrA9QGr9ZFPq00Fds3yxD//7qzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/ICHmrk4TNUWoZdG410URjTC6WlRm/9vBnF6abONT3NwlrbxU
 HrCxtBvaCLVc0IMcqQt5D9HyVIyxlHZGKihalgewg8ALNP5Dwkms5ToANQCv2ygnaQ==
X-Gm-Gg: ASbGncvnwWGjX0RD066T6kMsFAUBfuuiFbnhCW0kwf1UAv16Xjs1iBryiH1A3ZaddzK
 59NaTr2M3d3/dCKTyXpvtS41ymoZw/cQRLHt2TqWJvVO002aL1NrPYCh45b4aBq0frPU42axgah
 SCoDl19ZjaU+sWAz0jgL+Pgcz4x+X8emUzbls0JWQzJ6Ti93DVlOguOStbCdO26gt9En11FHvCZ
 5m2QwAH0jzIRYcRA8X29h/OmfTYXhELYnZtbdhECmfGgRNeu6KOSoEVX8XvLN9j45j6OEyyChQ7
 CxULyyl9ngRpFO1sISCPu/h/wVtL8P/AyLRF8TiZ/wEgJKnfZ0IpeK1dDBEr4l/xpC9NDyaxBwb
 PvPrCrJTu8GBSsABFMjglD7n1ipzcbLAVzzC7nHewv+90lqMMOS+ccJnaOjWmengB4x1O7OSfOw
 iNm14UDVuQmowMjyeOg1f9syGki40bgJV7KI13rtjQodM=
X-Google-Smtp-Source: AGHT+IGansT+A0rkfAhKvQNOk21vPK7u8dZSK91Dy5X88gGuQfgY22M2jXK6HVEdK0aJoNY/t4sDOg==
X-Received: by 2002:a17:902:ce12:b0:271:479d:3de2 with SMTP id
 d9443c01a7336-290c9ca2a4bmr199750875ad.13.1761065262494; 
 Tue, 21 Oct 2025 09:47:42 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:ef0c:c990:b2a8:9da9])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29246ec0847sm114116915ad.22.2025.10.21.09.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 09:47:42 -0700 (PDT)
Date: Tue, 21 Oct 2025 09:47:36 -0700
From: Ryan Neph <ryanneph@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/xe/configfs: fix clang warnings for missing
 parameter name
Message-ID: <qgugikjwzoc2ia7no5x5jspgu6dx6p6yeuhpxkqfsdggxtk5ty@ptmw53oycmnk>
References: <20251017-rn-cfi-v1-0-bf66e6ad4fcd@google.com>
 <20251017-rn-cfi-v1-2-bf66e6ad4fcd@google.com>
 <20251020110513.48d18788@pumpkin> <20251021063957.GA757076@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021063957.GA757076@ax162>
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

On Tue, Oct 21, 2025 at 08:39:57AM +0200, Nathan Chancellor wrote:
> On Mon, Oct 20, 2025 at 11:05:13AM +0100, David Laight wrote:
> > On Fri, 17 Oct 2025 12:46:26 -0700
> > Ryan Neph <ryanneph@google.com> wrote:
> > 
> > > Fixes warning from clang-17 that look like:
> > > 
> > > drivers/gpu/drm/xe/xe_configfs.h:35:97: error: omitting the parameter name in a function definition is a C2x extension [-Werror,-Wc2x-extensions]
> > >    35 | static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> > 
> > Why did that become invalid?
> > It has pretty much always been used - and can be used to avoid -Wshadow warnings.
> > This looks like a clang bug.
> > And you'd want a specific -W 'knob' for it as well.
> > 
> > At a guess the C2x extension lets the name be omitted in the function body for
> > an unused parameter (the same as C++).
> > I think that is the 'definition' and the ones being changed here are the 'declaration'.
> > But I might be wrong.
> 
> I don't think you read the patch clearly enough. Both declarations and
> 'static inline' definitions are being updated in this patch, likely for
> consistency rather than necessity (but the commit message could call
> this out). I don't see how there is a clang bug here.

Correct. The warning is generated for the stub definitions on the false branch of the
`#if IS_ENABLED(CONFIG_CONFIGFS_FS)`.

The pure declarations on the true side of the branch don't need a named variable but I included them for
consistency. I can mention this in the commit message for v2 if desired.

> 
> > > 
> > > Signed-off-by: Ryan Neph <ryanneph@google.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_configfs.h | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> > > index fed57be0b90e146d57d966bab0e55e1723513997..a0d614b37efd54b89390f04a238aef1a8d4df4e2 100644
> > > --- a/drivers/gpu/drm/xe/xe_configfs.h
> > > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > > @@ -21,9 +21,9 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
> > >  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
> > >  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> > >  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> > > -u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> > > +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class class,
> > >  				       const u32 **cs);
> > > -u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> > > +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class class,
> > >  					const u32 **cs);
> > >  #ifdef CONFIG_PCI_IOV
> > >  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
> > > @@ -37,9 +37,11 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
> > >  static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
> > >  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> > >  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> > > -static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> > > +static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> > > +						     enum xe_engine_class class,
> > >  						     const u32 **cs) { return 0; }
> > > -static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> > > +static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> > > +						      enum xe_engine_class class,
> > >  						      const u32 **cs) { return 0; }
> > >  static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
> > >  #endif
> > > 
> > 
