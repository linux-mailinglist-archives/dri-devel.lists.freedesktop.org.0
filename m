Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892C84BA404
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 16:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F2B10E34D;
	Thu, 17 Feb 2022 15:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D795F10E161
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 15:11:45 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 966EC3F74E;
 Thu, 17 Feb 2022 16:11:43 +0100 (CET)
Date: Thu, 17 Feb 2022 16:11:42 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [Freedreno] [PATCH v3 12/13] drm/msm/dsi: Add support for DSC
 configuration
Message-ID: <20220217151142.sbp6wslxbxeohsgf@SoMainline.org>
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-13-vkoul@kernel.org>
 <20211211000315.pavmcc7cc73ilb6l@SoMainline.org>
 <Yg4t/G3tgcmkswHg@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yg4t/G3tgcmkswHg@matsya>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod,

Thanks for taking time to go through this review, please find some
clarifications below.

On 2022-02-17 16:44:04, Vinod Koul wrote:
> Hi Marijn,
> 
> On 11-12-21, 01:03, Marijn Suijten wrote:
> 
> > > +static int dsi_dsc_update_pic_dim(struct msm_display_dsc_config *dsc,
> > > +				  int pic_width, int pic_height)
> > 
> > This function - adopted from downstream - does not seem to perform a
> > whole lot, especially without the modulo checks against the slice size.
> > Perhaps it can be inlined?
> 
> Most of the code here is :)
> 
> This was split from downstream code to check and update dimension. We
> can inline this, or should we leave that to compiler. I am not a very
> big fan of inlining...

It doesn't seem beneficial to code readability to have this function,
which is only called just once and also has the same struct members read
in a `DBG()` directly, abstracted away to a function.  Not really
concerned about generated code/performance FWIW.

Also note that the caller isn't checking the `-EINVAL` result...

> > 
> > > +{
> > > +	if (!dsc || !pic_width || !pic_height) {
> > > +		pr_err("DSI: invalid input: pic_width: %d pic_height: %d\n", pic_width, pic_height);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	dsc->drm->pic_width = pic_width;
> > > +	dsc->drm->pic_height = pic_height;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> > >  {
> > >  	struct drm_display_mode *mode = msm_host->mode;
> > > @@ -940,7 +954,68 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> > >  		hdisplay /= 2;
> > >  	}
> > >  
> > > +	if (msm_host->dsc) {
> > > +		struct msm_display_dsc_config *dsc = msm_host->dsc;
> > > +
> > > +		/* update dsc params with timing params */
> > > +		dsi_dsc_update_pic_dim(dsc, mode->hdisplay, mode->vdisplay);

That is, the result code here should be checked (or function inlined).

> > > +		DBG("Mode Width- %d x Height %d\n", dsc->drm->pic_width, dsc->drm->pic_height);
> > 
> > This seems to be pretty non-standard and perhaps unnecessary debug code,
> > with a stray dash in there.  Is is needed here, and if so how about
> > using %dx%d\n to format width and height?
> 
> I can update that, sure...
> 
> > 
> > > +
> > > +		/* we do the calculations for dsc parameters here so that
> > > +		 * panel can use these parameters
> > > +		 */
> > > +		dsi_populate_dsc_params(dsc);
> > > +
> > > +		/* Divide the display by 3 but keep back/font porch and
> > > +		 * pulse width same
> > > +		 */
> > 
> > A more general nit on the comments in this patch series: it is
> > appreciated if comments explain the rationale rather than - or in
> > addition to - merely paraphrasing the code that follows.
> 
> Yes it might be the case here, but in this case I wanted to explicitly
> point out hat we need to divide display by 3...

The main point here is justifying _why_ there's a division by 3 for the
active portion of the signal, I presume that's the compression ratio
(having not read into the DSC compression standard yet at all)?

> > 
> > > +		h_total -= hdisplay;
> > > +		hdisplay /= 3;
> > > +		h_total += hdisplay;
> > > +		ha_end = ha_start + hdisplay;
> > > +	}
> > > +
> > >  	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > > +		if (msm_host->dsc) {
> > > +			struct msm_display_dsc_config *dsc = msm_host->dsc;
> > > +			u32 reg, intf_width, slice_per_intf;
> > > +			u32 total_bytes_per_intf;
> > > +
> > > +			/* first calculate dsc parameters and then program
> > > +			 * compress mode registers
> > > +			 */
> > > +			intf_width = hdisplay;
> > > +			slice_per_intf = DIV_ROUND_UP(intf_width, dsc->drm->slice_width);
> > > +
> > > +			dsc->drm->slice_count = 1;
> > > +			dsc->bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width * 8, 8);
> > 
> > If I am not mistaken this is the same value as dsc->drm->slice_width,
> > since a multiple of 8 is inherently "a multiple of 8" and hence needs no
> > rounding when divided by 8 again.
> 
> Yes this doesnt look right, I will update
> 
> > Also note that the cmdmode variant below uses bits_per_pixel here; is
> > that discrepancy intended?
> 
> Nope both should use bits_per_pixel..
> 
> > > +			total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
> > > +
> > > +			dsc->eol_byte_num = total_bytes_per_intf % 3;
> > > +			dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
> > > +			dsc->bytes_per_pkt = dsc->bytes_in_slice * dsc->drm->slice_count;
> > > +			dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
> > > +
> > > +			reg = dsc->bytes_per_pkt << 16;
> > > +			reg |= (0x0b << 8);    /* dtype of compressed image */
> > > +
> > > +			/* pkt_per_line:
> > > +			 * 0 == 1 pkt
> > > +			 * 1 == 2 pkt
> > > +			 * 2 == 4 pkt
> > > +			 * 3 pkt is not supported
> > > +			 * above translates to ffs() - 1
> > > +			 */
> > > +			reg |= (ffs(dsc->pkt_per_line) - 1) << 6;
> > > +
> > > +			dsc->eol_byte_num = total_bytes_per_intf % 3;
> > 
> > This was already calculated and assigned just a couple lines above.
> 
> Yup, dropped now.
> 
> > 
> > > +			reg |= dsc->eol_byte_num << 4;
> > > +			reg |= 1;
> > 
> > Note that the XML register file exists to map out the layout of these
> > registers, including bit offset, size, and (enum) constant values.  It
> > is appreciated if you can replace all these magical shifts and magic
> > flags/bits with the appropriate enum constants and constructor
> > functions, after mapping them out in the XML file.
> 
> Yeah I am trying to get those details, if I manage to get it, will
> update for sure as Dmitry already pointed in MESA PR.

That'd be lovely.  In any case, even if you can't get the meaning for
all these bits, offsets and constants, it's still desired to at least
add them to the XML as "unknown" or something (including offset in the
name).  Then perhaps the details can be filled in over time while
keeping the driver free of magic constants.  See for example how some of
the Adreno register XML descriptions set this up.

For example, without those details we can already state that
`eol_byte_num` has an offset of 4 in the MODE_CTL register, and probably
a size of 2 bits since its value is always modulo 3.  Likewise
pkt_per_line can be turned into an `<enum>` and so on for the other
segments that build up this register.  Let me know in the mesa MR if you
need assistance/suggestions for mapping out the registers in XML.

> > > +
> > > +			dsi_write(msm_host,
> > > +				  REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
> > > +		}
> > > +
> > >  		dsi_write(msm_host, REG_DSI_ACTIVE_H,
> > >  			DSI_ACTIVE_H_START(ha_start) |
> > >  			DSI_ACTIVE_H_END(ha_end));
> > > @@ -959,8 +1034,40 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> > >  			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
> > >  			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
> > >  	} else {		/* command mode */
> > > +		if (msm_host->dsc) {
> > > +			struct msm_display_dsc_config *dsc = msm_host->dsc;
> > > +			u32 reg, reg_ctrl, reg_ctrl2;
> > > +			u32 slice_per_intf, bytes_in_slice, total_bytes_per_intf;
> > > +
> > > +			reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
> > > +			reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
> > 
> > Shouldn't old values be masked out first, before writing new bits or
> > values below?  The video-mode variant doesn't read back old register
> > values.
> 
> This follows downstream where the registers are read, modified and
> written back

Are you sure about this?  The register values are never cleared, meaning
that only bits get added through the `|=` below but never unset - unless
downstream clears these registers elsewhere before ending up in (their
equivalent of) dsi_timing_setup.

> > > +
> > > +			slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->drm->slice_width);
> > > +			bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width *
> > > +						      dsc->drm->bits_per_pixel, 8);
> > > +			dsc->drm->slice_chunk_size = bytes_in_slice;
> > > +			total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
> > > +			dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
> > > +
> > > +			reg = 0x39 << 8;
> > 
> > Same comment about moving magic constants and shifts into the XML file.
> 
> yes if we get details of bits

As mentioned above, even without those details this constant can be
represented in the XML, as belonging to offset `8` of the register.

> > 
> > > +			reg |= ffs(dsc->pkt_per_line) << 6;
> > 
> > Doesn't the calculation need -1 here just like video mode?
> 
> yes will update now

Thanks.  I forgot to mention: there seem to be a lot of similarities
between the video and commandmode computations, can those possibly be
factored out of the if-else to save on duplication and accidental
mismatches like these?

- Marijn
