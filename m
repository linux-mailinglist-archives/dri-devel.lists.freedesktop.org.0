Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9324C92BB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 19:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C0C10E3D9;
	Tue,  1 Mar 2022 18:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4A910E469;
 Tue,  1 Mar 2022 18:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646158472; x=1677694472;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8UFFYIrygmrfUfSS+/c3XfQxpFskaBZaOkDuGUB3CIU=;
 b=CP/X6gDRsE6KtET7L7fIOeI3fkZ2vil0KPPrKX7kDC/2AZCzO8MrdFG8
 8G/mA1RLPYvOxrk4lBvWzkFtoJSpgcUjJB6JZrARBAgHJ+YYnLUB32KNE
 YiCuVsR+UCTddjTC0mMrnoqh0gfK/uoAZ8D2uJ7kJv4c+yBKpkHXJJTd5
 Ppy/edXe8nmEFHFkyXeE977g2O2R1repPXXcwA4t027uaGSIE0oU4kinS
 bredhsJsNYmrWDTjwmAzq5ihB+TrB6l38aaxGHoW47JLsfM5C4raQnvl2
 pLg0DuwnpaSKxFFNFDwKm5G4iMek8ufSqm0AVIhJGra66Aw6sV2nK5YvO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="253394355"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="253394355"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 10:14:31 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="535003662"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 10:14:29 -0800
Date: Tue, 1 Mar 2022 20:14:25 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Add a DP1.2 compatible way to read LTTPR
 capabilities
Message-ID: <20220301181425.GA1465351@ideak-desk.fi.intel.com>
References: <20220228201234.1448613-1-imre.deak@intel.com>
 <Yh4qQD/hlQCuNUFx@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yh4qQD/hlQCuNUFx@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 01, 2022 at 04:14:24PM +0200, Ville Syrjälä wrote:
> On Mon, Feb 28, 2022 at 10:12:34PM +0200, Imre Deak wrote:
> > At least some DELL monitors (P2715Q) with DPCD_REV 1.2 return corrupted
> > DPCD register values when reading from the 0xF0000- LTTPR range with an
> > AUX transaction block size bigger than 1. The DP standard requires 0 to
> > be returned - as for any other reserved/invalid addresses - but these
> > monitors return the DPCD_REV register value repeated in each byte of the
> > read buffer. This will in turn corrupt the values returned by the LTTPRs
> > between the source and the monitor: LTTPRs must adjust the values they
> > read from the downstream DPRX, for instance left-shift/init the
> > downstream DP_PHY_REPEATER_CNT value. Since the value returned by the
> > monitor's DPRX is non-zero the adjusted values will be corrupt.
> > 
> > Reading the LTTPR registers one-by-one instead of reading all of them
> > with a single AUX transfer works around the issue.
> > 
> > According to the DP standard's 0xF0000 register description:
> > "LTTPR-related registers at DPCD Addresses F0000h through F02FFh are
> > valid only for DPCD r1.4 (or higher)." While it's unclear if DPCD r1.4
> > refers to the DPCD_REV or to the
> > LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV register (tickets filed
> > at the VESA site to clarify this haven't been addressed), one
> > possibility is that it's a restriction due to non-compliant monitors
> > described above. Disabling the non-transparent LTTPR mode for all such
> > monitors is not a viable solution: the transparent LTTPR mode has its
> > own issue causing link training failures and this would affect a lot of
> > monitors in use with DPCD_REV < 1.4. Instead this patch works around
> > the problem by reading the LTTPR common and PHY cap registers one-by-one
> > for any monitor with a DPCD_REV < 1.4.
> > 
> > The standard requires the DPCD capabilites to be read after the LTTPR
> > common capabilities are read, so re-read the DPCD capabilities after
> > the LTTPR common and PHY caps were read out.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4531
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/dp/drm_dp.c                   | 58 ++++++++++++-------
> >  .../drm/i915/display/intel_dp_link_training.c | 30 +++++++---
> >  include/drm/dp/drm_dp_helper.h                |  2 +
> >  3 files changed, 59 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
> > index 703972ae14c64..f3950d42980f9 100644
> > --- a/drivers/gpu/drm/dp/drm_dp.c
> > +++ b/drivers/gpu/drm/dp/drm_dp.c
> > @@ -2390,9 +2390,36 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
> >  }
> >  EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
> >  
> > +static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE], int address,
> > +				  u8 *buf, int buf_size)
> > +{
> > +	/*
> > +	 * Some monitors with a DPCD_REV < 0x14 return corrupted values when
> > +	 * reading from the 0xF0000- range with a block size bigger than 1.
> > +	 */
> 
> This sounds really scary. Have we checked what other registers might
> end up corrupted? Eg. couple of rounds of comparing full dd bs=1 vs. 
> dd bs=16.

Yes, checked now on a DELL P2715Q/ADLP/native-DP (w/o any LTTPR):

dd bs=1 count=1M failes at offset 81 and 83, bs=16 doesn't have this
problem.

Replacing the above two bytes with 0s in the bs=1 output, the only
difference is at 0xf0000:

bs=1:  0x12 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
bs=16: 0x12 0x12 0x12 0x12 0x12 0x12 0x12 0x12 0x12 0x12 0x12 0x12 0x12 0x12 0x12 0x12

I attached the edid and bin files to the bugzilla ticket.

> > +	int block_size = dpcd[DP_DPCD_REV] < 0x14 ? 1 : buf_size;
> > +	int offset = 0;
> > +	int ret;
> > +
> > +	while (offset < buf_size) {
> 
> Can we use a for loop?

Yes, will change this.

> > +		ret = drm_dp_dpcd_read(aux,
> > +				       address + offset,
> > +				       &buf[offset], block_size);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		WARN_ON(ret != block_size);
> > +
> > +		offset += block_size;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> 
> -- 
> Ville Syrjälä
> Intel
