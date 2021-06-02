Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF1398788
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 13:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8612189861;
	Wed,  2 Jun 2021 11:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E5889861;
 Wed,  2 Jun 2021 11:01:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9325C60FF2;
 Wed,  2 Jun 2021 11:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622631700;
 bh=X1r+/2vqrhf2eopgUmFN+gmnFQ6uhol2dVCw4nc+dR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TJKit5piuyWTiZE2++rnwBc+NWnC2oVLAFRNuEEhQCVKac8lXQjlMiqUjfKJ+0+2g
 loDXAsOAAiNwUIewxgKX7kcLZgbBu2928pW7IbObJBT/qPH8uJ1pTyLoX+Cne1BGRP
 oQUlve0vN2S3bU9ECooK7eF3uPC7GbIvvsqSoCpCNvvvYE9DGtGqiVI19Qh3D6fyhJ
 DXO0D4CgfnUrVMnl5hWpukOKLvDe/wEGnDkz5qViZsH2e5EbY0zeY3/kd78I6XWlpd
 AYo6ZSaGnX6rpyBOM5GKVQX7N4xWngbhqqvmz9PvjA4tco2EykT2QndUrW/vAKy/z6
 jNrq8I6s7Fh2A==
Date: Wed, 2 Jun 2021 16:31:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [RFC PATCH 00/13] drm/msm: Add Display Stream
 Compression Support
Message-ID: <YLdlEB3Ea6OWaLw4@vkoul-mobl>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <CAOCk7Nqep_Db+z3fr5asHZ1u0j8+6fKkPFs2Ai8CbA_zGqV6ZA@mail.gmail.com>
 <YK3gxqXBRupN/N+Q@vkoul-mobl.Dlink>
 <CAOCk7NqvhGvYw8xCBctqj7H+o-Qwp2UuUJK1gatW9EWfXv56xA@mail.gmail.com>
 <CAF6AEGuoyPr8PgfwFX0JCYZ7S_pryn_OXacHBqoMAAPvSq6aRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGuoyPr8PgfwFX0JCYZ7S_pryn_OXacHBqoMAAPvSq6aRw@mail.gmail.com>
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
Cc: DTML <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27-05-21, 16:30, Rob Clark wrote:
> On Wed, May 26, 2021 at 8:00 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> > On Tue, May 25, 2021 at 11:46 PM Vinod Koul <vkoul@kernel.org> wrote:

> > Frankly, I don't like the MSM ACPI solution that I've seen on the laptops.
> > The ACPI assumes the entire MDSS (including DSI parts) and GPU is one
> > device, and ultimately handled by one driver.  That driver needs to
> > get a value from UEFI (set by the bootloader) that is the "panel id".
> > Then the driver calls into ACPI (I think its _ROM, but I might be
> > mistaken, doing this from memory) with that id.  It gets back a binary
> > blob which is mostly an xml file (format is publicly documented) that
> > contains the panel timings and such.
> 
> tbh, I kinda suspect that having a single "gpu" device (which also
> includes venus, in addition to display, IIRC) in the ACPI tables is a
> windowsism, trying to make things look to userspace like a single "GPU
> card" in the x86 world.. but either way, I think the ACPI tables on
> the windows arm laptops which use dsi->bridge->edp is too much of a
> lost cause to even consider here.  Possibly ACPI boot on these devices
> would be more feasible on newer devices which have direct eDP out of
> the SoC without requiring external bridge/panel glue.

yeah that is always a very different world. although it might make sense
to use information in tables and try to deduce information about the
system can be helpful...

> I'd worry more about what makes sense in a DT world, when it comes to
> DT bindings.

And do you have thoughts on that..?

-- 
~Vinod
