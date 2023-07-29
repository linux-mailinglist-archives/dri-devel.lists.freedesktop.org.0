Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B718C768107
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 20:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552DA10E0F9;
	Sat, 29 Jul 2023 18:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC7510E0F9
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:36:23 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4EB083F2A4;
 Sat, 29 Jul 2023 20:36:21 +0200 (CEST)
Date: Sat, 29 Jul 2023 20:36:19 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: shift IRQ indices by 1
Message-ID: <poi2s3buyyxubsha2pq5sbf5x7ljegwxdqgrd2yfu4p4kweaf6@gnutzjm45zbu>
References: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
 <20230727150455.1489575-5-dmitry.baryshkov@linaro.org>
 <dzqrazaaedomrvdr6xjawzc75zy2whp7nyfuzwsamd22bvbpzq@wdv7k3vpovgf>
 <CAA8EJpqPa8uAqQ3r929Js1b8vYfEhjvEXBNCan8faS08AtOZaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqPa8uAqQ3r929Js1b8vYfEhjvEXBNCan8faS08AtOZaw@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-28 18:03:35, Dmitry Baryshkov wrote:
<snip>
> > > -     if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
> > > +     if (!irq_idx || irq_idx > intr->total_irqs) {
> > >               pr_err("invalid IRQ index: [%d]\n", irq_idx);
> >
> > Logs like this might be harder to interpret (and compare) when the
> > numbering is different.  In addition, all the IRQs in
> > /d/dri/0/debug/core_irq are shifted up by 1 making them harder to
> > compare to downstream.
> > (Which I hope to not have to do again for a while, now that my INTF TE
> >  series is finalized and merged)
> 
> I hesitated here. Maybe we should log the register and index instead
> of logging the raw index.

Sure that might help.

> As for the core_irq vs downstream, that's a good question. I don't
> like the idea of adding -1 there. Maybe I'll change that again to
> register + index.

I don't like that either.  It also isn't a given that the numbers will
always match up, as they're a software/kernel construct for bookkeeping
purposes and not a hardware index.  In other words, it only matches when
enum dpu_hw_intr_reg is in sync with downstream.  And I don't think it
still is (in the higher numbers) now that 7xxx variants have been
culled.

Preferably both downstream and upstream should have a named "interrupt
register" together with the bit index, but again it's not something
that's super critical nor used often.

- Marijn
