Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E1221B899
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 16:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3416EC6B;
	Fri, 10 Jul 2020 14:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1207D6EC6B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:27:25 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D6BC22064B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594391244;
 bh=z5GS7bzW3vt89ODcDbxTwcqTDUKbrhtLbUgZN/aPJks=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=R5qrVLy9xhyxIqkwH23afO9B6TpqOwOKPFK1OlPug353NvKQiOVXPcyAmI44RTLUu
 lSkgde7BOn/lb5Ng2jMnY5a8haRkku97h6uiu4TE5GZtTkITcqTmg86JN+q3qs1ais
 2hFUPW2HwcR8MB2VnkgiXaQvYl2Z5EHs/exGf5PA=
Received: by mail-oo1-f52.google.com with SMTP id k47so1033960ool.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 07:27:24 -0700 (PDT)
X-Gm-Message-State: AOAM531E52p70MwbHJZTwFDR6BiF/9iNY2I8XJ5jbcdBUrbPej/EtO1i
 3hcFdmBEG4vyPmpv9AhuD4lCuTyCUh3wwXFXh4U=
X-Google-Smtp-Source: ABdhPJz6+EdbHPDvR54y8i1lkJirNkR+7jQgNft2XWsMwOMmyjZqITES3V6nwxYUU7/dFIw3al47o4ejMuE4Cv4kjXk=
X-Received: by 2002:a4a:b34b:: with SMTP id n11mr59771293ooo.41.1594391244224; 
 Fri, 10 Jul 2020 07:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200710142253.28070-1-jgross@suse.com>
In-Reply-To: <20200710142253.28070-1-jgross@suse.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Jul 2020 17:27:13 +0300
X-Gmail-Original-Message-ID: <CAMj1kXEdm8MrdWVLO0w_-LJLvpiUURHhazv4-B39L1Bbk8kqFw@mail.gmail.com>
Message-ID: <CAMj1kXEdm8MrdWVLO0w_-LJLvpiUURHhazv4-B39L1Bbk8kqFw@mail.gmail.com>
Subject: Re: [PATCH v2] efi: avoid error message when booting under Xen
To: Juergen Gross <jgross@suse.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Peter Jones <pjones@redhat.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jul 2020 at 17:24, Juergen Gross <jgross@suse.com> wrote:
>
> efifb_probe() will issue an error message in case the kernel is booted
> as Xen dom0 from UEFI as EFI_MEMMAP won't be set in this case. Avoid
> that message by calling efi_mem_desc_lookup() only if EFI_MEMMAP is set.
>
> Fixes: 38ac0287b7f4 ("fbdev/efifb: Honour UEFI memory map attributes when mapping the FB")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  drivers/video/fbdev/efifb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> index 65491ae74808..e57c00824965 100644
> --- a/drivers/video/fbdev/efifb.c
> +++ b/drivers/video/fbdev/efifb.c
> @@ -453,7 +453,7 @@ static int efifb_probe(struct platform_device *dev)
>         info->apertures->ranges[0].base = efifb_fix.smem_start;
>         info->apertures->ranges[0].size = size_remap;
>
> -       if (efi_enabled(EFI_BOOT) &&
> +       if (efi_enabled(EFI_MEMMAP) &&
>             !efi_mem_desc_lookup(efifb_fix.smem_start, &md)) {
>                 if ((efifb_fix.smem_start + efifb_fix.smem_len) >
>                     (md.phys_addr + (md.num_pages << EFI_PAGE_SHIFT))) {
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
