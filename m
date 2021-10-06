Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA67423779
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 07:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABAB6ECFA;
	Wed,  6 Oct 2021 05:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5879C6ECF2;
 Wed,  6 Oct 2021 05:24:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AAEE611C5;
 Wed,  6 Oct 2021 05:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633497890;
 bh=cMNu6FCqgjsDuLKBexlofzbQh1accEh+KkJp8jMeKJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ROe8Bm8gBydsupMVtG3HdpW6qsLjipMrqBLxHcBeI/cajE/eRrtK0/lq7FmVQ3Gng
 VnxBvjDgsTRqJy52DHX6DcQqOqmUNt4c10cEAX/dlyBN0XZQR+BVnx31TfLjqMARLt
 VOJy4AhiwfalHBNSnBswAuPnauM+0T/9lIyNyhJnpLP6PQeIWBbj68DTvCI3yY+AoB
 Lxu4m3QCR4x8jxAQseu0ordikEPgXJw7P6HDbcQ+lBYWs67hjVtxULMLWawUk/Kl+o
 +pGAstLJ3m2I8So2VbmFikcXCZ3gMhd0CamS4SyW2hrfkZLiG9K6HZrUn76PBj3wg8
 REkVQXxX5rLww==
Date: Wed, 6 Oct 2021 10:54:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: abhinavk@codeaurora.org
Cc: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 01/11] drm/msm/dsi: add support for dsc data
Message-ID: <YV0zHet/25Zx9ld5@matsya>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-2-vkoul@kernel.org>
 <c411e4d60efd3029b2dc6b0d899ea8a9@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c411e4d60efd3029b2dc6b0d899ea8a9@codeaurora.org>
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

Hi Abhinav,

On 02-08-21, 15:55, abhinavk@codeaurora.org wrote:

> > +static int dsi_populate_dsc_params(struct msm_display_dsc_config *dsc)
> > +{
> > +	int mux_words_size;
> > +	int groups_per_line, groups_total;
> > +	int min_rate_buffer_size;
> > +	int hrd_delay;
> > +	int pre_num_extra_mux_bits, num_extra_mux_bits;
> > +	int slice_bits;
> > +	int target_bpp_x16;
> > +	int data;
> > +	int final_value, final_scale;
> > +	int i;
> > +
> > +	dsc->drm->rc_model_size = 8192;
> > +	dsc->drm->first_line_bpg_offset = 12;
> > +	dsc->drm->rc_edge_factor = 6;
> > +	dsc->drm->rc_tgt_offset_high = 3;
> > +	dsc->drm->rc_tgt_offset_low = 3;
> > +	dsc->drm->simple_422 = 0;
> > +	dsc->drm->convert_rgb = 1;
> > +	dsc->drm->vbr_enable = 0;
> > +
> > +	/* handle only bpp = bpc = 8 */
> > +	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
> > +		dsc->drm->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
> > +
> > +	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> > +		dsc->drm->rc_range_params[i].range_min_qp = min_qp[i];
> > +		dsc->drm->rc_range_params[i].range_max_qp = max_qp[i];
> > +		dsc->drm->rc_range_params[i].range_bpg_offset = bpg_offset[i];
> > +	}
> > +
> > +	dsc->drm->initial_offset = 6144; /* Not bpp 12 */
> > +	if (dsc->drm->bits_per_pixel != 8)
> > +		dsc->drm->initial_offset = 2048;	/* bpp = 12 */
> > +
> > +	mux_words_size = 48;		/* bpc == 8/10 */
> > +	if (dsc->drm->bits_per_component == 12)
> > +		mux_words_size = 64;
> > +
> > +	dsc->drm->initial_xmit_delay = 512;
> > +	dsc->drm->initial_scale_value = 32;
> > +	dsc->drm->first_line_bpg_offset = 12;
> > +	dsc->drm->line_buf_depth = dsc->drm->bits_per_component + 1;
> > +
> > +	/* bpc 8 */
> > +	dsc->drm->flatness_min_qp = 3;
> > +	dsc->drm->flatness_max_qp = 12;
> > +	dsc->det_thresh_flatness = 7 + 2 * (dsc->drm->bits_per_component - 8);
> > +	dsc->drm->rc_quant_incr_limit0 = 11;
> > +	dsc->drm->rc_quant_incr_limit1 = 11;
> > +	dsc->drm->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
> > +
> > +	/* FIXME: need to call drm_dsc_compute_rc_parameters() so that rest of
> > +	 * params are calculated
> > +	 */
> > +	dsc->slice_last_group_size = 3 - (dsc->drm->slice_width % 3);
> > +	groups_per_line = DIV_ROUND_UP(dsc->drm->slice_width, 3);
> > +	dsc->drm->slice_chunk_size = dsc->drm->slice_width *
> > dsc->drm->bits_per_pixel / 8;
> > +	if ((dsc->drm->slice_width * dsc->drm->bits_per_pixel) % 8)
> > +		dsc->drm->slice_chunk_size++;
> > +
> > +	/* rbs-min */
> > +	min_rate_buffer_size =  dsc->drm->rc_model_size -
> > dsc->drm->initial_offset +
> > +				dsc->drm->initial_xmit_delay * dsc->drm->bits_per_pixel +
> > +				groups_per_line * dsc->drm->first_line_bpg_offset;
> > +
> > +	hrd_delay = DIV_ROUND_UP(min_rate_buffer_size,
> > dsc->drm->bits_per_pixel);
> > +
> > +	dsc->drm->initial_dec_delay = hrd_delay -
> > dsc->drm->initial_xmit_delay;
> > +
> > +	dsc->drm->initial_scale_value = 8 * dsc->drm->rc_model_size /
> > +				       (dsc->drm->rc_model_size - dsc->drm->initial_offset);
> > +
> > +	slice_bits = 8 * dsc->drm->slice_chunk_size * dsc->drm->slice_height;
> > +
> > +	groups_total = groups_per_line * dsc->drm->slice_height;
> > +
> > +	data = dsc->drm->first_line_bpg_offset * 2048;
> > +
> > +	dsc->drm->nfl_bpg_offset = DIV_ROUND_UP(data, (dsc->drm->slice_height
> > - 1));
> > +
> > +	pre_num_extra_mux_bits = 3 * (mux_words_size + (4 *
> > dsc->drm->bits_per_component + 4) - 2);
> > +
> > +	num_extra_mux_bits = pre_num_extra_mux_bits - (mux_words_size -
> > +			     ((slice_bits - pre_num_extra_mux_bits) % mux_words_size));
> > +
> > +	data = 2048 * (dsc->drm->rc_model_size - dsc->drm->initial_offset +
> > num_extra_mux_bits);
> > +	dsc->drm->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
> > +
> > +	/* bpp * 16 + 0.5 */
> > +	data = dsc->drm->bits_per_pixel * 16;
> > +	data *= 2;
> > +	data++;
> > +	data /= 2;
> > +	target_bpp_x16 = data;
> > +
> > +	data = (dsc->drm->initial_xmit_delay * target_bpp_x16) / 16;
> > +	final_value =  dsc->drm->rc_model_size - data + num_extra_mux_bits;
> As we discussed, can you please check why there is an additional + 8 and /16
> in the upstream final_offset calculation?
> If we can eliminate or root-cause the difference in the calculations, either
> this patch can be substantially reduced or
> we will atleast know for future reference what was the delta and can leave a
> comment.

I am checking this as well, I think there is something more, so will
continue to debug on that.

Meanwhile I propose we continue this and then switch once we have
concluded.

> > +/* DSC config */
> > +struct msm_display_dsc_config {
> > +	struct drm_dsc_config *drm;
> > +	u8 scr_rev;
> Can scr_rev also move into drm_dsc_config? SCR itself is not QC specific.
> Its just telling there was a change request
> for that DSC revision.
> In QC side, we only use this scr_rev to have some different tables. This can
> even be true for other vendors.
> So moving this to drm_dsc_config will only help.

So I checked and looks like this is not used here in the code, so will
drop it for now. Once we add support for this, we can add this back in
drm_dsc_config

-- 
~Vinod
