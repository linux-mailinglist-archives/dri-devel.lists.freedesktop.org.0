Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73AA37844
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 00:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C542110E10F;
	Sun, 16 Feb 2025 23:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8F010E10F
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 23:06:27 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id ECDC6402B1;
 Mon, 17 Feb 2025 00:06:22 +0100 (CET)
Date: Mon, 17 Feb 2025 00:06:21 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] drm/msm/dsi: Set PHY usescase (and mode) before
 registering DSI host
Message-ID: <xtcwuscf3nz6o6qhv4lerpeoxep34iloj6kvxxuad7yoqsus22@tmuv2jqvfpo7>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
 <nzm3tokbvho3hxz3e5vblp5ndagfcv5ah3j7gtkqjmt7ynr6f3@v36juvu73i5v>
 <vsxfi43d7rxh5xxc7ctivjslf6w4yy5iprqpqid3u3diylrtwd@wayafjlgzz7v>
 <x4jced57uhdfnq4d7tdqsozxbdosu2fcmsjlqtuuvh25ltx2rc@2eqsa7e4vcdv>
 <c5503020-0224-428a-9452-f8d668b47caf@quicinc.com>
 <ca80bd37-3b3f-48d3-a57d-2440d20d0c6c@quicinc.com>
 <hvwpqzvdoeosz34ptbksc44ad7ohi6uwioy6o7qc4ewwcvx4d4@g3kksn3rwk6j>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hvwpqzvdoeosz34ptbksc44ad7ohi6uwioy6o7qc4ewwcvx4d4@g3kksn3rwk6j>
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

On 2025-02-13 04:13:06, Dmitry Baryshkov wrote:
> On Wed, Feb 12, 2025 at 05:13:08PM -0800, Abhinav Kumar wrote:
> > Hi Marijn
> > 
> > On 2/10/2025 2:17 PM, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 2/10/2025 6:24 AM, Dmitry Baryshkov wrote:
> > > > On Mon, Feb 10, 2025 at 01:54:29PM +0100, Marijn Suijten wrote:
> > > > > On 2025-02-10 01:11:59, Dmitry Baryshkov wrote:
> > > > > > On Sun, Feb 09, 2025 at 10:42:53PM +0100, Marijn Suijten wrote:
> > > > > > > Ordering issues here cause an uninitialized (default STANDALONE)
> > > > > > > usecase to be programmed (which appears to be a MUX) in some cases
> > > > > > > when msm_dsi_host_register() is called, leading to the slave PLL in
> > > > > > > bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
> > > > > > > 
> > > > > > > This should seemingly not be a problem as the actual
> > > > > > > dispcc clocks from
> > > > > > > DSI1 that are muxed in the clock tree of DSI0 are way
> > > > > > > further down, this
> > > > > > > bit still seems to have an effect on them somehow and causes the right
> > > > > > > side of the panel controlled by DSI1 to not function.
> > > > > > > 
> > > > > > > In an ideal world this code is refactored to no longer have such
> > > > > > > error-prone calls "across subsystems", and instead model the "PLL src"
> > > > > > > register field as a regular mux so that changing the clock parents
> > > > > > > programmatically or in DTS via `assigned-clock-parents` has the
> > > > > > > desired effect.
> > > > > > > But for the avid reader, the clocks that we *are* muxing into DSI0's
> > > > > > > tree are way further down, so if this bit turns out to be a simple mux
> > > > > > > between dsiXvco and out_div, that shouldn't have any effect as this
> > > > > > > whole tree is off anyway.
> > > > > > > 
> > > > > > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > > > > > ---
> > > > > > >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 30
> > > > > > > ++++++++++++++++++ +-----------
> > > > > > >   1 file changed, 19 insertions(+), 11 deletions(-)
> > > > > > 
> > > > > > 
> > > > > > Fixes: 57bf43389337 ("drm/msm/dsi: Pass down use case to PHY")
> > > > > 
> > > > > I'm not exactly confident about that.  Abhinav pointed out in
> > > > > https://gitlab.freedesktop.org/drm/msm/-/issues/41#note_2375646 that
> > > > > msm_dsi_host_register() was not supposed to be enabling the PHY, which I
> > > > > provided a counter-stacktrace for to show that is indeed the case.
> > > > > 
> > > > > Either this was always a problem that's only become visible now
> > > > > (and it's an
> > > > > issue with that patch), or a different change causes
> > > > > msm_dsi_host_register()
> > > > > to enable the PHY and program the usecase too early?
> > > > 
> > > > As currently usecase is being programmed after the DSI host being
> > > > registered, there might be a race condition between panel driver probe
> > > > _and_ usecase programming.
> > > > 
> > > > > 
> > > > > What do you think?
> > > > > 
> > > > > - Marijn
> > > > > 
> > > 
> > > Yes I agree with Dmitry's explanation. The race condition between the
> > > two can cause this. Hence I am also fine with this change.
> > > 
> > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > 
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > > > > > b/drivers/gpu/ drm/msm/dsi/dsi_manager.c
> > > > > > > index a210b7c9e5ca281a46fbdb226e25832719a684ea..b93205c034e4acc73d536deeddce6ebd694b4a80
> > > > > > > 100644
> > > > > > > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > > > > > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > > > > > @@ -74,17 +74,33 @@ static int dsi_mgr_setup_components(int id)
> > > > > > >       int ret;
> > > > > > >       if (!IS_BONDED_DSI()) {
> > > > > > > +        /* Set the usecase before calling
> > > > > > > msm_dsi_host_register(), which would
> > > > > > > +         * already program the PLL source mux based on
> > > > > > > a default usecase.
> > > > > > > +         */
> > > > > > > +        msm_dsi_phy_set_usecase(msm_dsi->phy,
> > > > > > > MSM_DSI_PHY_STANDALONE);
> > > > > > > +        msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > > > > > +
> > > > > > >           ret = msm_dsi_host_register(msm_dsi->host);
> > > > > > >           if (ret)
> > > > > > >               return ret;
> > > > > > > -
> > > > > > > -        msm_dsi_phy_set_usecase(msm_dsi->phy,
> > > > > > > MSM_DSI_PHY_STANDALONE);
> > > > > > > -        msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > > > > >       } else if (other_dsi) {
> > > > > > >           struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
> > > > > > >                               msm_dsi : other_dsi;
> > > > > > >           struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
> > > > > > >                               other_dsi : msm_dsi;
> > > > > > > +
> > > > > > > +        /* PLL0 is to drive both DSI link clocks in bonded DSI mode.
> > > > > > > +         *
> > > > > > > +        /* Set the usecase before calling
> > > > > > > msm_dsi_host_register(), which would
> > > > > > > +         * already program the PLL source mux based on
> > > > > > > a default usecase.
> > > > > > > +         */
> > 
> > My compiler is throwing a warning here
> > 
> > drivers/gpu/drm/msm/dsi/dsi_manager.c: In function
> > 'dsi_mgr_setup_components':
> > drivers/gpu/drm/msm/dsi/dsi_manager.c:94:3: warning: "/*" within comment
> > [-Wcomment]
> >    /* Set the usecase before calling msm_dsi_host_register(), which would
> >    ^
> > drivers/gpu/drm/msm/dsi/dsi_manager.c: At top level:
> > 
> > Can you pls address this one so that I can pick this one up?

Whoops, that looks like copy-paste mistake when copying the comment from
!IS_BONDED_DSI() and merging it with the original comment about PLL0.
Will resend when I understand Dmitry's question below;

> 
> While you are at it, Marijn, could you please also fix the first comment
> to be properly formatted?

What exactly do you need to be reformatted about the first comment?  It's
exactly the same in both branches.  No multiline comments in dsi_manager.c
start with a newline after the first /*.  Anything I'm missing?

- Marijn

> -- 
> With best wishes
> Dmitry
