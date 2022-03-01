Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169C64C92F8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 19:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7C410E2B2;
	Tue,  1 Mar 2022 18:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF4310E2B2;
 Tue,  1 Mar 2022 18:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646159103; x=1677695103;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PR2futapiZvhBTp56YG5bd4UdkcTWckhuLtgCJbXvXI=;
 b=XfbpY6dc8xOO1jxFh0ZlsmoaCkAYQErk60StzkVq4eNImeZBzQbE1Tgd
 at7Q7jzt9F8RPw5hSDvEgLpwu6LjPgeSugwM6bZwmvNhtu0LeRtnyS5rJ
 KZ0QTFT5U0L7TaAMMt8YMl2JH666XjSx/bsTlnyVpQTv8o62HTJgRo/eF
 W7iMdytTzXTi7pSnojHi5eSOaiKCNE17ec+Vu8aVYEL6zITRdoHyN/C23
 YpIiUM+ytdovllqwd9EUrie1MFnGrtXYCXiQXBXNECCurj8xMR5/YMdGZ
 GOPE6ASnCeC3NTb5qasTxiN9z5sYZ8b5ZThIl36PhAtNcIizg1Ue/tCZQ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="236715434"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="236715434"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 10:25:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="535006409"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga007.jf.intel.com with SMTP; 01 Mar 2022 10:25:00 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Mar 2022 20:24:59 +0200
Date: Tue, 1 Mar 2022 20:24:59 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH] drm/i915: Add a DP1.2 compatible way to read LTTPR
 capabilities
Message-ID: <Yh5k+9MAgZPX5NTk@intel.com>
References: <20220228201234.1448613-1-imre.deak@intel.com>
 <Yh4qQD/hlQCuNUFx@intel.com>
 <20220301181425.GA1465351@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220301181425.GA1465351@ideak-desk.fi.intel.com>
X-Patchwork-Hint: comment
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

On Tue, Mar 01, 2022 at 08:14:25PM +0200, Imre Deak wrote:
> On Tue, Mar 01, 2022 at 04:14:24PM +0200, Ville Syrjälä wrote:
> > On Mon, Feb 28, 2022 at 10:12:34PM +0200, Imre Deak wrote:
> > > At least some DELL monitors (P2715Q) with DPCD_REV 1.2 return corrupted
> > > DPCD register values when reading from the 0xF0000- LTTPR range with an
> > > AUX transaction block size bigger than 1. The DP standard requires 0 to
> > > be returned - as for any other reserved/invalid addresses - but these
> > > monitors return the DPCD_REV register value repeated in each byte of the
> > > read buffer. This will in turn corrupt the values returned by the LTTPRs
> > > between the source and the monitor: LTTPRs must adjust the values they
> > > read from the downstream DPRX, for instance left-shift/init the
> > > downstream DP_PHY_REPEATER_CNT value. Since the value returned by the
> > > monitor's DPRX is non-zero the adjusted values will be corrupt.
> > > 
> > > Reading the LTTPR registers one-by-one instead of reading all of them
> > > with a single AUX transfer works around the issue.
> > > 
> > > According to the DP standard's 0xF0000 register description:
> > > "LTTPR-related registers at DPCD Addresses F0000h through F02FFh are
> > > valid only for DPCD r1.4 (or higher)." While it's unclear if DPCD r1.4
> > > refers to the DPCD_REV or to the
> > > LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV register (tickets filed
> > > at the VESA site to clarify this haven't been addressed), one
> > > possibility is that it's a restriction due to non-compliant monitors
> > > described above. Disabling the non-transparent LTTPR mode for all such
> > > monitors is not a viable solution: the transparent LTTPR mode has its
> > > own issue causing link training failures and this would affect a lot of
> > > monitors in use with DPCD_REV < 1.4. Instead this patch works around
> > > the problem by reading the LTTPR common and PHY cap registers one-by-one
> > > for any monitor with a DPCD_REV < 1.4.
> > > 
> > > The standard requires the DPCD capabilites to be read after the LTTPR
> > > common capabilities are read, so re-read the DPCD capabilities after
> > > the LTTPR common and PHY caps were read out.
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4531
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  drivers/gpu/drm/dp/drm_dp.c                   | 58 ++++++++++++-------
> > >  .../drm/i915/display/intel_dp_link_training.c | 30 +++++++---
> > >  include/drm/dp/drm_dp_helper.h                |  2 +
> > >  3 files changed, 59 insertions(+), 31 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
> > > index 703972ae14c64..f3950d42980f9 100644
> > > --- a/drivers/gpu/drm/dp/drm_dp.c
> > > +++ b/drivers/gpu/drm/dp/drm_dp.c
> > > @@ -2390,9 +2390,36 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
> > >  }
> > >  EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
> > >  
> > > +static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE], int address,
> > > +				  u8 *buf, int buf_size)
> > > +{
> > > +	/*
> > > +	 * Some monitors with a DPCD_REV < 0x14 return corrupted values when
> > > +	 * reading from the 0xF0000- range with a block size bigger than 1.
> > > +	 */
> > 
> > This sounds really scary. Have we checked what other registers might
> > end up corrupted? Eg. couple of rounds of comparing full dd bs=1 vs. 
> > dd bs=16.
> 
> Yes, checked now on a DELL P2715Q/ADLP/native-DP (w/o any LTTPR):
> 
> dd bs=1 count=1M failes at offset 81 and 83, bs=16 doesn't have this
> problem.

Huh. Oh well, it's a Dell monitor after all. Not sure what else I was
expecting tbh.

-- 
Ville Syrjälä
Intel
