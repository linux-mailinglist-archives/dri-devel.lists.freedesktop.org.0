Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3EE169F1A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 08:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245EB6E15C;
	Mon, 24 Feb 2020 07:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7786E15B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 07:22:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g4so2688420wro.13
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 23:22:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3uWqpH0FizNQxnodtS0BMO7C44y4V2HGUhMB2HUYwPs=;
 b=cDo10ov9LeS5rKbLB3EcxUxT1b5FVjN49iq9PJPSh8dD7TWQHFJWAIlYvk++6F3jtA
 0fX3tK0WyxlTkNgY55p4V4BHhjpHCphcsZ6t3S4UkdM6MWi6UKVabAfGWgFDEJCO4d9o
 w9Bcl2648NcpVef+qCES0CjmQY5BINiS/Xkn4ZG/RBdLSI2ooLzfyJ1Hpx193ZKvwj4k
 dNZSClT6mZ0/0RGIC2bWbW/sEMx6Oh1diliMasiSMOFVplM0Zy62IDe9TgWeM4w7ZvvJ
 URb73jOFGCimqo3F8urNSIWsDJ60PxgnIifieB5gujL2Nh6bZBB9APcTjPi1qAGbITWW
 +vKA==
X-Gm-Message-State: APjAAAWM7vyOZad4rs0dU9e6JGEK3hAyIRPBS6xeIPTZowxLUTlGcZfm
 amrX5A6n3TXi+BXcdnGLpO20wApV6s0GE4yXXVg=
X-Google-Smtp-Source: APXvYqxdjZnbif7bpRaQNJiBwyEsuJs/aB/6ns4Tb7r8+8Jic7+2DM/05pAk/J8TW1lgRsRDnMiyVJDa+sjcJk6tMd4=
X-Received: by 2002:adf:eec3:: with SMTP id a3mr61552115wrp.337.1582528970137; 
 Sun, 23 Feb 2020 23:22:50 -0800 (PST)
MIME-Version: 1.0
References: <20200212202236.13095-1-robh@kernel.org>
In-Reply-To: <20200212202236.13095-1-robh@kernel.org>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Mon, 24 Feb 2020 08:22:38 +0100
Message-ID: <CAAObsKB8e2MN-VJKYSeX1iibmA4d4i+GL+SWYiLHpg3g_Qby7g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panfrost: Don't try to map on error faults
To: Rob Herring <robh@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Feb 2020 at 21:22, Rob Herring <robh@kernel.org> wrote:
>
> From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>
> If the exception type isn't a translation fault, don't try to map and
> instead go straight to a terminal fault.
>
> Otherwise, we can get flooded by kernel warnings and further faults.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I rewrote this some simplifying the code and somewhat following Steven's
> suggested. Still not using defines though. No defines here was good
> enough before IMO.
>
> Only compile tested.

Looks good, I also tested it on RK3399.

Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Thanks,

Tomeu

>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 44 +++++++++++--------------
>  1 file changed, 19 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 763cfca886a7..4f2836bd9215 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -596,33 +596,27 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>                 source_id = (fault_status >> 16);
>
>                 /* Page fault only */
> -               if ((status & mask) == BIT(i)) {
> -                       WARN_ON(exception_type < 0xC1 || exception_type > 0xC4);
> -
> +               ret = -1;
> +               if ((status & mask) == BIT(i) && (exception_type & 0xF8) == 0xC0)
>                         ret = panfrost_mmu_map_fault_addr(pfdev, i, addr);
> -                       if (!ret) {
> -                               mmu_write(pfdev, MMU_INT_CLEAR, BIT(i));
> -                               status &= ~mask;
> -                               continue;
> -                       }
> -               }
>
> -               /* terminal fault, print info about the fault */
> -               dev_err(pfdev->dev,
> -                       "Unhandled Page fault in AS%d at VA 0x%016llX\n"
> -                       "Reason: %s\n"
> -                       "raw fault status: 0x%X\n"
> -                       "decoded fault status: %s\n"
> -                       "exception type 0x%X: %s\n"
> -                       "access type 0x%X: %s\n"
> -                       "source id 0x%X\n",
> -                       i, addr,
> -                       "TODO",
> -                       fault_status,
> -                       (fault_status & (1 << 10) ? "DECODER FAULT" : "SLAVE FAULT"),
> -                       exception_type, panfrost_exception_name(pfdev, exception_type),
> -                       access_type, access_type_name(pfdev, fault_status),
> -                       source_id);
> +               if (ret)
> +                       /* terminal fault, print info about the fault */
> +                       dev_err(pfdev->dev,
> +                               "Unhandled Page fault in AS%d at VA 0x%016llX\n"
> +                               "Reason: %s\n"
> +                               "raw fault status: 0x%X\n"
> +                               "decoded fault status: %s\n"
> +                               "exception type 0x%X: %s\n"
> +                               "access type 0x%X: %s\n"
> +                               "source id 0x%X\n",
> +                               i, addr,
> +                               "TODO",
> +                               fault_status,
> +                               (fault_status & (1 << 10) ? "DECODER FAULT" : "SLAVE FAULT"),
> +                               exception_type, panfrost_exception_name(pfdev, exception_type),
> +                               access_type, access_type_name(pfdev, fault_status),
> +                               source_id);
>
>                 mmu_write(pfdev, MMU_INT_CLEAR, mask);
>
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
