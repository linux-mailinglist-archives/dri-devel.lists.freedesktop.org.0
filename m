Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDBB361CB2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 11:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DDB6EB43;
	Fri, 16 Apr 2021 09:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767266EB43
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 09:07:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3145C613BA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618564059;
 bh=S1RgGOvLnt8Uq+i5YbXxuESPSFtFlBFj8NXZsRYtyYU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TrbtffF9jVbxJ+tb3hJiiPgd2BcMAxp2TSa1h8omIasuU+URPtW7urBygsErjRQvE
 exLWkyz0NyDc2WeOVvo8NRj7GUKwW/QgrkhXBE3Gbk3xh4KU2Pt3SrqAkrEwObwrY8
 WKwuKbLhV+NY5hGILQM0iMFowvDlA2SlgB0K/8xQ8PHKfjR/upvWZhi+lmy5W/PZgB
 xOY6JLarkmgreVxiiThVeTihatl3aHoPjhjSP92oqPCvLGEZOlsSiETxX3o2FyT5Gd
 tKtoBdyW2aBcXL/LJmhBMNqmJm6S7X3RathWWCZTUKs9+r8Sikr2JwVbn6e0zPQRU8
 T5q+nvh3YXiXQ==
Received: by mail-ed1-f51.google.com with SMTP id e7so31300710edu.10
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 02:07:39 -0700 (PDT)
X-Gm-Message-State: AOAM532p+B6UB4ZD5typL5uuDEq02KsvYfyJoC3iqR30mNWg8PbJ3lP+
 XnqGj2/2XwsP2nVMXg71p+DgmWOHn8eP/y7yLIY=
X-Google-Smtp-Source: ABdhPJyoLKjcIf5H3PNFNwAinXaqu3cZQXJay5heRNq9YsT2IQ1iB7QMeeaB0QcE6v0s0pHHd4CoF8oe7YmBOMxa694=
X-Received: by 2002:a05:6402:11c9:: with SMTP id
 j9mr8734093edw.348.1618564057803; 
 Fri, 16 Apr 2021 02:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <1616403070-35776-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1616403070-35776-1-git-send-email-yang.lee@linux.alibaba.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 16 Apr 2021 11:07:25 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdPcQ1=UZiUumuLz8JSR2gTh=a-E01WE8ffdaa4+vsHUw@mail.gmail.com>
Message-ID: <CAJKOXPdPcQ1=UZiUumuLz8JSR2gTh=a-E01WE8ffdaa4+vsHUw@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: dsi: Add missing IRQF_ONESHOT
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, tomba@kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Mar 2021 at 09:53, Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> fixed the following coccicheck:
> ./drivers/gpu/drm/omapdrm/dss/dsi.c:4329:7-27: ERROR: Threaded IRQ with
> no primary handler requested without IRQF_ONESHOT
>
> Make sure threaded IRQs without a primary handler are always request
> with IRQF_ONESHOT
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index b31d750..844cb0b 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4326,7 +4326,7 @@ static int omap_dsi_register_te_irq(struct dsi_data *dsi,
>
>         irq_set_status_flags(te_irq, IRQ_NOAUTOEN);
>
> -       err = request_threaded_irq(te_irq, NULL, omap_dsi_te_irq_handler,
> +       err = request_threaded_irq(te_irq | IRQF_ONESHOT, NULL, omap_dsi_te_irq_handler,
>                                    IRQF_TRIGGER_RISING, "TE", dsi);

Did you test it? There are several patches like this all over the tree
so it looks like "let's fix everything from Coccinelle". It's a trend
recently... multiple people send these patches. The point is that you
should not blindly follow coccinelle but adjust the change for real
case (e.g. is it a nested interrupt). Without this consideration and
testing - NACK.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
