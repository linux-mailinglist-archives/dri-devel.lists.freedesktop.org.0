Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C27E69963D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 14:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA0910E18A;
	Thu, 16 Feb 2023 13:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0170410E18A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 13:48:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8185FB827FE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 13:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C408C433D2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676555292;
 bh=Axe+MZ6PqOII/9yrOZjouMR1L1EuzmtcGU8e82nJ7ic=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HDSDAF0doNEAHyDZ8g1Eu1LbF8TRBkUYvFeDPMBB8UMZWq22wJmmhz1W6vQFiO4kw
 ezv7/FHSut8LRdssp9KRbassGaN80M0iiGNliWBHigzKGC6khG94BHIFX0zU1S4G8X
 e6JGkPzVUdpaLq8O0Fn4vVqixMYUNaRJ73qUOjRXlvLMaMsmQeDzhH/CODqFfsVZn+
 wTeOxU5i9vEOwVjzPhcLgsIAGySgn1dDG3AEiUykwxw1V7RX/nuSdYkOSDDudRSrzd
 N5qm0RzAA11YVmIZcVw58PnqcFVgmgx8HGIT5zEnEdscsL6WHpqYbyJxX59zTlIOWp
 9oWCrFTask/Pw==
Received: by mail-yb1-f177.google.com with SMTP id a63so1017149ybg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 05:48:12 -0800 (PST)
X-Gm-Message-State: AO0yUKXp7NG/xn2t7zVvlCpFECNgqrxuVGsjJB0R8e7vAKQMO5S9HwRU
 82EROiN8cVtm7WtJzjrML217k1+V5zXXOPZE5wg=
X-Google-Smtp-Source: AK7set+RNSCV1UfJdRpQBwUG79UuWDPgNnRsYMGcx3yVWVOTsY0NsyuWTbE5X0BOVuBhaMGid2mPBzXjl2OO5KNOVns=
X-Received: by 2002:a25:e906:0:b0:91f:507f:f261 with SMTP id
 n6-20020a25e906000000b0091f507ff261mr599308ybd.463.1676555291222; Thu, 16 Feb
 2023 05:48:11 -0800 (PST)
MIME-Version: 1.0
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-18-ogabbay@kernel.org>
 <20230216102821.GA2849548@linux.intel.com>
In-Reply-To: <20230216102821.GA2849548@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 16 Feb 2023 15:47:44 +0200
X-Gmail-Original-Message-ID: <CAFCwf13K+y7GgYkVYSgxOrQK6VJkQ+vV6uxs9qy06J-6Ds1ZuA@mail.gmail.com>
Message-ID: <CAFCwf13K+y7GgYkVYSgxOrQK6VJkQ+vV6uxs9qy06J-6Ds1ZuA@mail.gmail.com>
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

On Thu, Feb 16, 2023 at 12:28 PM Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> Hi
>
> On Sun, Feb 12, 2023 at 10:44:45PM +0200, Oded Gabbay wrote:
>
> >  irqreturn_t hl_irq_handler_user_interrupt(int irq, void *arg)
> > +{
> > +     return IRQ_WAKE_THREAD;
> > +}
>
> This is not needed. You can pass NULL to request_threaded_irq() and
> the irq core will use irq_default_primary_handler() which is exactly
> the same function :-)
>
> Regards
> Stanislaw
>
>
You are correct but in patch 19/27 (the one after this), this function
is filled with actual code, so I don't know if it's worth changing
this patch...
Oded
