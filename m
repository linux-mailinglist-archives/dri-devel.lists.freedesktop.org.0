Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8210330DD26
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 15:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8F06EB0D;
	Wed,  3 Feb 2021 14:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958D96EABF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 14:45:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D275764F8D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 14:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612363537;
 bh=/mNZhD1AQ7J9rZQHjBYJPM+0/9SB4BdSnDbakyYFAg8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dFWtWSNMUwRnRB0EeHhsGNnuQP/yXEAnX2pl+aU1DIQVDtcjGb2UitSv9cOMzep0Q
 Tnf+18FkiCDsCWup/p5s8iodU0RFubBonvkaSuZ8RG73Ce3rYlKekrmsEVuLgC6yz/
 bVFPCm3+ZPqjtLfhae7qpa6RZZfmHZ27lSLIaJD3kLtNVXh4UBsMxjbxObhfs8qsJj
 77yKwdC8ziKF1lfX2TFKDY7o2r4788HhWN9+U6OsVLEPRe2to6odBqolXqI7S8iBZQ
 h3camFG0IdIA/6qec94ssnlDU8DhDXUTcMWl86Yb0vFI4zpY5U3+sFwrw2PK65gIqo
 GDvVaH4n1micg==
Received: by mail-ej1-f46.google.com with SMTP id b9so16582381ejy.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 06:45:36 -0800 (PST)
X-Gm-Message-State: AOAM531HdvAsJ0HHCiPXVqug0OQivtFISFNUN3NylYKGUXBMiZXYvm6l
 3WIlPQz70/AZw4GpjW+cx5J4FOC2NZN262boLA==
X-Google-Smtp-Source: ABdhPJz2MQnC+MFPQSo855PEDG7bdQnTfKs1+dOd3n4U6Q/F5HLasq+mvrZcXsyjVJ2qQ96RMGb75aeY6kxktbB89Nw=
X-Received: by 2002:a17:906:958f:: with SMTP id
 r15mr3403866ejx.360.1612363535313; 
 Wed, 03 Feb 2021 06:45:35 -0800 (PST)
MIME-Version: 1.0
References: <20210201082116.267208-1-boris.brezillon@collabora.com>
 <20210201082116.267208-4-boris.brezillon@collabora.com>
In-Reply-To: <20210201082116.267208-4-boris.brezillon@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 3 Feb 2021 08:45:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLGfjbu1AmuqHtSCqFpkWFdZ7qPb4BWAr3d5eHzq55+0g@mail.gmail.com>
Message-ID: <CAL_JsqLGfjbu1AmuqHtSCqFpkWFdZ7qPb4BWAr3d5eHzq55+0g@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panfrost: Stay in the threaded MMU IRQ handler
 until we've handled all IRQs
To: Boris Brezillon <boris.brezillon@collabora.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 1, 2021 at 2:21 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Doing a hw-irq -> threaded-irq round-trip is counter-productive, stay
> in the threaded irq handler as long as we can.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 21e552d1ac71..65bc20628c4e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -580,6 +580,8 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>         u32 status = mmu_read(pfdev, MMU_INT_RAWSTAT);
>         int i, ret;
>
> +again:
> +
>         for (i = 0; status; i++) {
>                 u32 mask = BIT(i) | BIT(i + 16);
>                 u64 addr;
> @@ -628,6 +630,11 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>                 status &= ~mask;
>         }
>
> +       /* If we received new MMU interrupts, process them before returning. */
> +       status = mmu_read(pfdev, MMU_INT_RAWSTAT);
> +       if (status)
> +               goto again;
> +

Can't we avoid the goto? Change the for loop like this:

i = 0;
while (status = mmu_read(pfdev, MMU_INT_RAWSTAT)) {
    ...

    i++;
    if (i == 16)
        i = 0;
}

>         mmu_write(pfdev, MMU_INT_MASK, ~0);
>         return IRQ_HANDLED;
>  };
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
