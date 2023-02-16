Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15224699645
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 14:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4270310E300;
	Thu, 16 Feb 2023 13:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF3910E300
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 13:49:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C93C661FE9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 13:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE9EC4339C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676555374;
 bh=TWm7pkK57F7LPIkv1nTKfSRyjPpap1cvb/amm8dkcd8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CH4WmfUNA5pLzfz6CHEcaC0x0ha4xH6JCkhUWYcFlk/l2KyDpYldtLKP/++svwwSJ
 gUokFCu9aQ6aiWwDWH4ngD0PJ4JBo20HbSiZ8jK6pEbnEhUMR3/cnUChjdDjl168ED
 YYFnp5367IqqcSZVoJ1LWTCjJDwLoCap/2tPLVnrqldBX5GFunyyCPsSMS+AHVntQb
 ZxWNPWZS9Rg763OyebpYAOo1hrDCFxkkMXqpc7X5wF6lAAfIpIwpNGvxtLuUwWzsB0
 ggu9RDx408VMBMP1k1vtGLsddeZB0estfbzjYAEnubsB1Rq8YUaqH51mR7+N7XZISH
 5r4/sICqkQn1g==
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-530b9a0a789so24835707b3.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 05:49:34 -0800 (PST)
X-Gm-Message-State: AO0yUKU4oz2uL7A1IAI5ghvHbJJ/Q2S7pnwuKMOBAiUwi4uG2Jnp8dRX
 09wogOGy14oVkKbL1BzoReX/sgxBAhnu1OzAbc8=
X-Google-Smtp-Source: AK7set/X845nbpF64GUwUSjOutlyyQaC5NGApecLoQZ/6a/h8hk+ZEO2YiFmxj9APVGN/6nCDtkL3gk579ikcRMhxgc=
X-Received: by 2002:a0d:c846:0:b0:527:ac4c:9f80 with SMTP id
 k67-20020a0dc846000000b00527ac4c9f80mr810869ywd.342.1676555373308; Thu, 16
 Feb 2023 05:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-18-ogabbay@kernel.org>
 <20230216103926.GB2849548@linux.intel.com>
In-Reply-To: <20230216103926.GB2849548@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 16 Feb 2023 15:49:06 +0200
X-Gmail-Original-Message-ID: <CAFCwf12DLazdtWq24KiRKKvTbuuBqJJHQgwJXrEN-tH5ywqegg@mail.gmail.com>
Message-ID: <CAFCwf12DLazdtWq24KiRKKvTbuuBqJJHQgwJXrEN-tH5ywqegg@mail.gmail.com>
Subject: Re: [PATCH 18/27] habanalabs: change user interrupt to threaded IRQ
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
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
Cc: Tal Cohen <talcohen@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 12:39 PM Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> On Sun, Feb 12, 2023 at 10:44:45PM +0200, Oded Gabbay wrote:
> > -             rc = request_irq(irq, irq_handler, 0, gaudi2_irq_name(i), &hdev->user_interrupt[j]);
> > +             rc = request_threaded_irq(irq, irq_handler, hl_irq_user_interrupt_thread_handler,
> > +                             IRQF_ONESHOT, gaudi2_irq_name(i), &hdev->user_interrupt[j]);
> > +
>
> Would be nice to change to devm_ and simplify exit paths. Up to you.
>
> Regards
> Stanislaw
>
Using drm helpers is a part of a much larger task of connecting the
habanalabs driver to accel/drm.
We are working on it now, but we will do it in parts, as this task
will take many months.

Oded
