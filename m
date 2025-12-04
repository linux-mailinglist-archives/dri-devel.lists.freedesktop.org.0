Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6F4CA2F05
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5E910E8DB;
	Thu,  4 Dec 2025 09:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lXMJFlx5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C0F10E8DB
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 09:17:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D7E8E601E0
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 09:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDEAC4AF09
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 09:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764839863;
 bh=bdxR7v9DL4giaQ0nD6cGSOn8HPdLK+CBHB+mv5p51TE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lXMJFlx51rTedas29KHnOrmyDSqkZ9OMYrKSulTiX57PBwHm2eQiqLevCstNDBnVT
 nCVGTNp7fzETozRNuQAA5mbYmXhdurch8QsIn1ts0SUX0878qPP6F5FVDYrBr3wT9W
 AkgTKbQXFCzm1WMgZMKHaINZLTSqwLCCAD0dAxU5Kk45tsxO0uZPJvt91vcWn+0bYC
 C2IgMJeK7my4B4xpP9tsR0pWBNKZ4d4GMAlf00wpJGT2bjit1qFoztrZDlC8sl6QNP
 7TWkDlYiX/OoujuaVpQfW9eeV92YLP9lkU3JZRQx/bEk4561i1k13l8QYbKxWEI4oz
 nLySSoiGo2EBQ==
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-596ba05aaecso664919e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 01:17:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXYe3ajVkpQ6bmuPt65mj7BAbPDrJ5gDuD/UfPpb5BBSFCUmlFg6KegLTp3bybKnDXN7ex/RDNX89k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlUQM0iyGycuT32UmpyrJjuzwYVbGe8jh3BKgueFF26h0GqZce
 TwnQ8uDE+oXLT2SvRcV11rAuUZasPXQlPQK/u6DgP+LBpLOXXIq8p4iY5OSPoVLSgJFRt8StIA3
 qazleYPnhV6quFh2IyCuIfZjy+X/t4Rs=
X-Google-Smtp-Source: AGHT+IEepIIomfWFRr0Rx3UmKjb+4HGFPEe9u/4871RbpTRAjdKjp2QqrAmQWNspq2CaP1lGYKWgUBnucw5FQcFMAE4=
X-Received: by 2002:a05:6512:3b0e:b0:55f:4633:7b2 with SMTP id
 2adb3069b0e04-597d3fdddf4mr1972090e87.46.1764839861912; Thu, 04 Dec 2025
 01:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20251126160854.553077-1-tzimmermann@suse.de>
 <aSe1ZBXa3JBidhem@r1chard>
 <fc4ea259-3389-46e2-b860-972aa8179507@suse.de>
In-Reply-To: <fc4ea259-3389-46e2-b860-972aa8179507@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 4 Dec 2025 10:17:29 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE8Q6FGX5+64gPyW=ExicR4UbnEDeW4ycCsSsD2WtaYJA@mail.gmail.com>
X-Gm-Features: AWmQ_bm9xn92SSdHRbzJXHCDOFUkHMVJIr0kEdVYpgmMwEspup4WiDKMgeR24mo
Message-ID: <CAMj1kXE8Q6FGX5+64gPyW=ExicR4UbnEDeW4ycCsSsD2WtaYJA@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] arch, sysfb,
 efi: Support EDID on non-x86 EFI systems
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Richard Lyu <richard.lyu@suse.com>, javierm@redhat.com, arnd@arndb.de, 
 helgaas@kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 27 Nov 2025 at 08:43, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 27.11.25 um 03:20 schrieb Richard Lyu:
> > Hi Thomas,
> >
> > I am attempting to test this patch series but encountered merge conflicts when applying it to various trees.
> > Could you please clarify the specific base commit (or branch/tag) this series was generated against?
>
> Thanks for testing.
>
> >
> > When testing on the next branch on commits 7a2ff00 and e41ef37, I hit a conflict on PATCH v3 4/9:
> > patching file drivers/pci/vgaarb.c
> > Hunk #2 FAILED at 557.
> > 1 out of 2 hunks FAILED -- rejects in file drivers/pci/vgaarb.c
> >
> > When testing against 3a86608 (Linux 6.18-rc1), the following conflicts occurred:
> > patching file drivers/gpu/drm/sysfb/efidrm.c
> > Hunk #1 FAILED at 24.
> > 1 out of 2 hunks FAILED -- rejects in file drivers/gpu/drm/sysfb/efidrm.c
> > patching file drivers/gpu/drm/sysfb/vesadrm.c
> > Hunk #1 FAILED at 25.
> > 1 out of 2 hunks FAILED -- rejects in file drivers/gpu/drm/sysfb/vesadrm.c
> >
> > Please let me know the correct base, and I will retest.
>
> It's in the cover letter: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5 The
> commit is in linux-next. The idea is that the EFI tree can pick up the
> changes easily in the next cycle. linux-next seemed like the best
> choice. Best regards Thomas

Thanks. I will queue this up as soon as -rc1 is released.
