Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D982C3FB7E8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 16:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBDA89E2B;
	Mon, 30 Aug 2021 14:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077D289C6E;
 Mon, 30 Aug 2021 14:22:42 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 910501F4B4;
 Mon, 30 Aug 2021 16:22:39 +0200 (CEST)
Date: Mon, 30 Aug 2021 16:22:38 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/dsi: Use "ref" fw clock instead of global
 name for VCO parent
Message-ID: <YSzprptcXt6hxYRt@Marijn-Arch-PC.localdomain>
References: <20210829203027.276143-1-marijn.suijten@somainline.org>
 <20210829203027.276143-3-marijn.suijten@somainline.org>
 <CAA8EJppmBvohk3CC87N_P3m+CP=bRLWWknS7esDrYb-xArJFvg@mail.gmail.com>
 <a27b4e74-3856-8c5c-73af-05e976430ea2@somainline.org>
 <CAA8EJpp38fRff+j-+iG2pATSQ9e_R4zRxepmbGqpKP=gcOZotA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpp38fRff+j-+iG2pATSQ9e_R4zRxepmbGqpKP=gcOZotA@mail.gmail.com>
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

Hi Dmitry,

On Mon, Aug 30, 2021 at 04:17:32AM +0300, Dmitry Baryshkov wrote:
> On Mon, 30 Aug 2021 at 00:53, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > Hi Dmitry,
> >
> > On 8/29/21 10:39 PM, Dmitry Baryshkov wrote:
> > > Hi,
> > >
> > > On Sun, 29 Aug 2021 at 23:30, Marijn Suijten
> > > <marijn.suijten@somainline.org> wrote:
> > >>
> > >> All DSI PHY/PLL drivers were referencing their VCO parent clock by a
> > >> global name, most of which don't exist or have been renamed.  These
> > >> clock drivers seem to function fine without that except the 14nm driver
> > >> for the sdm6xx [1].
> > >>
> > >> At the same time all DTs provide a "ref" clock as per the requirements
> > >> of dsi-phy-common.yaml, but the clock is never used.  This patchset puts
> > >> that clock to use without relying on a global clock name, so that all
> > >> dependencies are explicitly defined in DT (the firmware) in the end.
> > >
> > > msm8974 (28nm-hpm) does not define the "ref" clock. So you'd have to:
> > > 1) add ref clock to the dtsi (should come in a separate patch).
> >
> >
> > Thanks for double-checking and noticing this!  I've queued up this patch
> > for v2.
> >
> > > 2) add .name = "xo" as a fallback to the 28nm driver (to be compatible
> > > with older devices)
> >
> >
> > Are there msm8974 devices out there that might upgrade kernels, but not
> > firmware (DT)?  On other boards (sdm630) I'm removing these from various
> > drivers as to not have any possibility of relying on global names, in
> > favour of having the clock dependencies fully specified in the DT.
> 
> IIUC it is a general policy of trying to be (somewhat)
> backwards-compatible. For example because your dts might come from a
> different source/be a part of different build process/etc.

Good thinking; DT was after all intended to be used as firmware shipping
on the device, when we're usually modifying and shipping it with the
kernel in the end.

Just to make sure other platforms aren't affected by these changes,
every board currently providing a "ref" clock has done so since the DSI
node was added, except these for these three patches that added them
after the fact:

    79e51645a1dd ("arm64: dts: qcom: msm8916: Set 'xo_board' as ref clock of the DSI PHY")
    6969d1d9c615 ("ARM: dts: qcom-apq8064: Set 'cxo_board' as ref clock of the DSI PHY")
    0c0e72705a33 ("arm64: dts: sdm845: Set 'bi_tcxo' as ref clock of the DSI PHYs")

Their commit-messages confuse me.  They make it seem like the "ref"
clock was previously used when this doesn't seem to be the case (hence
my patch).  Has there possibly been a patchset like mine that removed
the mentioned hardcoded clock, but ended up never being merged?

Either way, perhaps it's worth mentioning those patches with Fixes: so
that this commit can be backported (have to be careful that DT changes
for the other drivers are also backported, or this patch is split per
PHY file), and maybe it's worth cc-ing the original authors to ask for
clarification or at least make them aware?

- Marijn
