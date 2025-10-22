Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61367BFD471
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 18:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9389910E813;
	Wed, 22 Oct 2025 16:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="COOOtQ0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350C910E14F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:38:08 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-471193a9d9eso65645565e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761151086; x=1761755886; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dk/4ZoqQnuZjGsM9q5wggvWU1iFzfw9iqDvZDTlZi+Q=;
 b=COOOtQ0YvWoKO+e+ZxcAQivI2Uutenwib7wKHKNtBNWFB3JP/uNHNmLKarxDcQ+8M0
 2gvb+JfpwYb66LX20maB3m/iQj17w6XPuRi8yMHBsz0hmTbVki7Pta9cLgL5w5ij/vOJ
 tLZBaOKgKXgkWdTffUen9P52i1ZeSnAK4v43VPbRBjVGbAvG+7NE5SQ3zgZ5BfbiH20X
 GJP5e7B05RsMCLhlXBRkSnPaTDQtm4DR/fXFjMZEkRfFsnI+WcZN/Gk7SxlIMbPRwKtQ
 v8TNdpwN+46es8jxwnpBtzMlDI02alpeb1V/CCZHRl4A2HTtYN55kY24EZuhszPVe3au
 toJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761151086; x=1761755886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dk/4ZoqQnuZjGsM9q5wggvWU1iFzfw9iqDvZDTlZi+Q=;
 b=DuTXQv9lpyxxcP/K+thOBgaWyBp3mzOlo51wLRHPAzzwHLuvZR3OUICbI6jVOuyGlU
 jeUZqRfg5kOSfo23Rvvk9qc0BekxbUKUjW6pylWG93GT7nVKHIsetZ1SNB08KRBhU1K9
 dhj6Oc7KM05D+4uwfsssG0BqPKEOJW+G/Sp8ANWfFve/Mn9mQNQLz63pGTmXaOrCASMv
 1gXp7xm/4k1GfM/hf4jFwmOQf+vUX8CXrjtmBrEHecrsd7bc+WX9Mc0D6nP9EtihRtkZ
 UnuDiFfXN9kjDcZNAS0C/WzAZqEyaGhpHAWERn7URyM7HYHWmYk7tGMmXvIuKGzoeysJ
 aYRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtgeScm3sojUiqEBNiv3PTgG9eNG2iOb7D05iNGH5yYyENgTt6DTOs82cp22/mh4BiRxxio8b/SeY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw861OTK8EW+4WbJkj2Bqe7MdKiqcvVBNuhbdoffbEMEa3JiB3+
 uU0D4b4AB0A7z9+vJ6xICJZ0M4x4vjKAVGtVtU+zU5hrZSaXXELEjqiR
X-Gm-Gg: ASbGncvsTZJzQ2YNrnsAKCIW43n3/AgA6TBYIY6jYEkmrRPqibiZ2OZauWnmvcE+HUB
 TyEXV8rMqd7HtNMTiy9lbL4vdTmOwboHBgTXiaj+dG6Lo04WMUVdSgT2iUpkKBUh9v7tX0lzJBE
 gpZMP8xKQO0EnO54FvyGYaBC9OJcP/EXXzG1mCmg/MLlHT1Cwxuqgs5b3uzsDEFGbD7JOZDfTxb
 I80vUg6u5b7qUKnTKtrc5t9uAQn4opfBgHi+XlLUVtPRreqShpqa+u5wo/zrd1qWRWPEXXMgmgI
 KGqYSb5TEZRnDpAEa+g1JgXwOtRYwoUTtlAZT9TB+8UOggCLWHEtrfE5a8S2ar4NmKmepwP0wKX
 ABL60BoHEecZ554oIJPhp2tfNhhEnmCEWBQ/gCYeW/O/WkrjtX7RarHxHn36NhjWHWdlSPGS4UJ
 3tjJKSeOY2bKMTHPjOXxhhcTzpBJu8gu0PcxV8m0Za5Q==
X-Google-Smtp-Source: AGHT+IHnj3ehGxJN2+JHKpPdZQwBjMorNnDAsuy0gAmpVUMFwxWZqRD/ApfaITrwLRrw0TIRv+66RA==
X-Received: by 2002:a5d:5850:0:b0:428:3ee0:6959 with SMTP id
 ffacd0b85a97d-4283ee06d92mr10911700f8f.63.1761151086240; 
 Wed, 22 Oct 2025 09:38:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f009a78csm26028279f8f.26.2025.10.22.09.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 09:38:06 -0700 (PDT)
Date: Wed, 22 Oct 2025 17:38:04 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ryan Neph <ryanneph@google.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/xe/configfs: fix clang warnings for missing
 parameter name
Message-ID: <20251022173804.26af8d39@pumpkin>
In-Reply-To: <20251021063957.GA757076@ax162>
References: <20251017-rn-cfi-v1-0-bf66e6ad4fcd@google.com>
 <20251017-rn-cfi-v1-2-bf66e6ad4fcd@google.com>
 <20251020110513.48d18788@pumpkin> <20251021063957.GA757076@ax162>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 21 Oct 2025 08:39:57 +0200
Nathan Chancellor <nathan@kernel.org> wrote:

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

Ah, I only looked closely at the declaration, thought the second change was the
same.

	David

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

