Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25948487601
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 11:58:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD8E10FD5A;
	Fri,  7 Jan 2022 10:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827A310FDAF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 10:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641553122; x=1673089122;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BMc9Z3LTtaONxwRGR93Wx3i0m7MuqSXfo4BQM2965WY=;
 b=NituwgX3U7C8QRUcAiInl/+cN0rBXUDuFUq9t4NAR/q2YJVlrzHF/kWU
 159dxEBhqOJTICkUcMu85+12z7TTdZgGVwQtBdNOGn+T6K1ald8OCzg0+
 3UihEfaquYE2vIjqsMHO5tLQ/bIFAOqpMFgH/lvOn9k27565BqJOA0Mc5
 PhmKs3qURP/ophSuSrIlFWj1OBTTdvqtCjsc7YGLyvk5QH6uJuKbJzZaB
 BrdU1weoaTPAiuqTmTWCzMiq/lSSORUKnEV1eRW4MSm90w1a0R4LIONwY
 QC2UnGxhHpVKuthu2BR2JDIWJltYYBByYda9tbqFUwsPO0LZLJtRpNhW9 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="230191047"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="230191047"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 02:58:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="513754516"
Received: from dgreerx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.24.206])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 02:58:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] drm/dp: Remove common Post Cursor2 register handling
In-Reply-To: <202201051410.8F65E4E0@keescook>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220105173507.2420910-1-keescook@chromium.org>
 <878rvujc4t.fsf@intel.com> <202201051410.8F65E4E0@keescook>
Date: Fri, 07 Jan 2022 12:58:32 +0200
Message-ID: <87y23rlsmf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 05 Jan 2022, Kees Cook <keescook@chromium.org> wrote:
> On Wed, Jan 05, 2022 at 08:00:50PM +0200, Jani Nikula wrote:
>> On Wed, 05 Jan 2022, Kees Cook <keescook@chromium.org> wrote:
>> > The link_status array was not large enough to read the Adjust Request
>> > Post Cursor2 register, so remove the common helper function to avoid
>> > an OOB read, found with a -Warray-bounds build:
>> >
>> > drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
>> > drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
>> >    59 |         return link_status[r - DP_LANE0_1_STATUS];
>> >       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
>> > drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
>> >   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
>> >       |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> >
>> > Replace the only user of the helper with an open-coded fetch and decode,
>> > similar to drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c.
>> >
>> > Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
>> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> > Cc: Maxime Ripard <mripard@kernel.org>
>> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> > Cc: David Airlie <airlied@linux.ie>
>> > Cc: Daniel Vetter <daniel@ffwll.ch>
>> > Cc: dri-devel@lists.freedesktop.org
>> > Signed-off-by: Kees Cook <keescook@chromium.org>
>> > ---
>> > This is the alternative to:
>> > https://lore.kernel.org/lkml/20211203084354.3105253-1-keescook@chromium.org/
>> > ---
>> >  drivers/gpu/drm/drm_dp_helper.c | 10 ----------
>> >  drivers/gpu/drm/tegra/dp.c      | 11 ++++++++++-
>> >  include/drm/drm_dp_helper.h     |  2 --
>> >  3 files changed, 10 insertions(+), 13 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
>> > index 23f9073bc473..c9528aa62c9c 100644
>> > --- a/drivers/gpu/drm/drm_dp_helper.c
>> > +++ b/drivers/gpu/drm/drm_dp_helper.c
>> > @@ -144,16 +144,6 @@ u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
>> >  }
>> >  EXPORT_SYMBOL(drm_dp_get_adjust_tx_ffe_preset);
>> >  
>> > -u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
>> > -					 unsigned int lane)
>> > -{
>> > -	unsigned int offset = DP_ADJUST_REQUEST_POST_CURSOR2;
>> > -	u8 value = dp_link_status(link_status, offset);
>> > -
>> > -	return (value >> (lane << 1)) & 0x3;
>> > -}
>> > -EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
>> > -
>> >  static int __8b10b_clock_recovery_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
>> >  {
>> >  	if (rd_interval > 4)
>> > diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
>> > index 70dfb7d1dec5..f5535eb04c6b 100644
>> > --- a/drivers/gpu/drm/tegra/dp.c
>> > +++ b/drivers/gpu/drm/tegra/dp.c
>> > @@ -549,6 +549,15 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
>> >  {
>> >  	struct drm_dp_link_train_set *adjust = &link->train.adjust;
>> >  	unsigned int i;
>> > +	u8 post_cursor;
>> > +	int err;
>> > +
>> > +	err = drm_dp_dpcd_read(link->aux, DP_ADJUST_REQUEST_POST_CURSOR2,
>> > +			       &post_cursor, sizeof(post_cursor));
>> 
>> There's a drm_dp_dpcd_readb() for the common 1-byte reads. Other than
>> that,
>> 
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
> Thanks!
>
>> 
>> Though obviously that's not enough to actually merge to tegra.
>
> As in, "a review by Jani isn't sufficient to land via the tegra tree"?

Yeah. Or, in this case, via any tree, really.

> What should next steps be?

Get an ack from tegra and/or drm-misc maintainers. All the relevant
folks and lists are in the recipients already.

BR,
Jani.


>
> -Kees
>
>> 
>> > +	if (err < 0) {
>> > +		DRM_ERROR("failed to read post_cursor2: %d\n", err);
>> > +		post_cursor = 0;
>> > +	}
>> >  
>> >  	for (i = 0; i < link->lanes; i++) {
>> >  		adjust->voltage_swing[i] =
>> > @@ -560,7 +569,7 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
>> >  				DP_TRAIN_PRE_EMPHASIS_SHIFT;
>> >  
>> >  		adjust->post_cursor[i] =
>> > -			drm_dp_get_adjust_request_post_cursor(status, i);
>> > +			(post_cursor >> (i << 1)) & 0x3;
>> >  	}
>> >  }
>> >  
>> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
>> > index 472dac376284..fdf3cf6ccc02 100644
>> > --- a/include/drm/drm_dp_helper.h
>> > +++ b/include/drm/drm_dp_helper.h
>> > @@ -1528,8 +1528,6 @@ u8 drm_dp_get_adjust_request_pre_emphasis(const u8 link_status[DP_LINK_STATUS_SI
>> >  					  int lane);
>> >  u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
>> >  				   int lane);
>> > -u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
>> > -					 unsigned int lane);
>> >  
>> >  #define DP_BRANCH_OUI_HEADER_SIZE	0xc
>> >  #define DP_RECEIVER_CAP_SIZE		0xf
>> 
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
