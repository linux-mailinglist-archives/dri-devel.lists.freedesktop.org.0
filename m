Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591C8293879
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 11:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713846EC2E;
	Tue, 20 Oct 2020 09:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B096EC2E;
 Tue, 20 Oct 2020 09:48:54 +0000 (UTC)
IronPort-SDR: z6tBvEHGj0wxGxvFwCK0rdpc6pRWQ6y8UIXTOqusUjazPZmlHWGpa49S87Ni1bq2mx43ZrA5Ai
 9pjXGGPjJALg==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="228814540"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="228814540"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 02:48:53 -0700
IronPort-SDR: BdKH1d3V4U9yeou6vSHhHEMV5NU6D8VMe+qMVfEAu9FUFAEOLfY2QUc8V8KHU1kuorQS2sHzjt
 DYBsR9+q/Exw==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="465874987"
Received: from genxfsim-desktop.iind.intel.com (HELO intel.com)
 ([10.223.74.178])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 02:48:51 -0700
Date: Tue, 20 Oct 2020 15:08:42 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 09/13] drm/i915/hdcp: mst streams support in
 hdcp port_data
Message-ID: <20201020093841.GY25390@intel.com>
References: <20201014045252.13608-10-anshuman.gupta@intel.com>
 <20201019102041.26178-1-anshuman.gupta@intel.com>
 <878sc19u3a.fsf@intel.com> <20201020083059.GW25390@intel.com>
 <875z759qyv.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875z759qyv.fsf@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 Tomas Winkler <tomas.winkler@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-10-20 at 12:39:04 +0300, Jani Nikula wrote:
> On Tue, 20 Oct 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> > On 2020-10-20 at 11:31:37 +0300, Jani Nikula wrote:
> >> On Mon, 19 Oct 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> >> > Add support for multiple mst stream in hdcp port data
> >> > which will be used by RepeaterAuthStreamManage msg and
> >> > HDCP 2.2 security f/w for m' validation.
> >> >
> >> > v2:
> >> > Init the hdcp port data k for HDMI/DP SST strem.
> >> >
> >> > Cc: Ramalingam C <ramalingam.c@intel.com>
> >> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> >> > ---
> >> >  .../drm/i915/display/intel_display_types.h    |  4 +-
> >> >  drivers/gpu/drm/i915/display/intel_hdcp.c     | 92 ++++++++++++++++---
> >> >  drivers/misc/mei/hdcp/mei_hdcp.c              |  3 +-
> >> >  include/drm/drm_hdcp.h                        |  8 +-
> >> 
> >> ...
> >> 
> >> > diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
> >> > index 9ae9669e46ea..b10d266fb60a 100644
> >> > --- a/drivers/misc/mei/hdcp/mei_hdcp.c
> >> > +++ b/drivers/misc/mei/hdcp/mei_hdcp.c
> >> > @@ -569,8 +569,7 @@ static int mei_hdcp_verify_mprime(struct device *dev,
> >> >  	verify_mprime_in->header.api_version = HDCP_API_VERSION;
> >> >  	verify_mprime_in->header.command_id = WIRED_REPEATER_AUTH_STREAM_REQ;
> >> >  	verify_mprime_in->header.status = ME_HDCP_STATUS_SUCCESS;
> >> > -	verify_mprime_in->header.buffer_len =
> >> > -			WIRED_CMD_BUF_LEN_REPEATER_AUTH_STREAM_REQ_MIN_IN;
> >> > +	verify_mprime_in->header.buffer_len = cmd_size  - sizeof(struct hdcp_cmd_header);
> >> >  
> >> >  	verify_mprime_in->port.integrated_port_type = data->port_type;
> >> >  	verify_mprime_in->port.physical_port = (u8)data->fw_ddi;
> >> > diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> >> > index fe58dbb46962..c8a37bb406b2 100644
> >> > --- a/include/drm/drm_hdcp.h
> >> > +++ b/include/drm/drm_hdcp.h
> >> > @@ -101,11 +101,11 @@
> >> >  
> >> >  /* Following Macros take a byte at a time for bit(s) masking */
> >> >  /*
> >> > - * TODO: This has to be changed for DP MST, as multiple stream on
> >> > - * same port is possible.
> >> > - * For HDCP2.2 on HDMI and DP SST this value is always 1.
> >> > + * TODO: This is based upon actual H/W  MST streams capacity.
> >> > + *
> >> > + * This is should be moved out to platform specific header.
> >> >   */
> >> > -#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	1
> >> > +#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	4
> >> >  #define HDCP_2_2_TXCAP_MASK_LEN			2
> >> >  #define HDCP_2_2_RXCAPS_LEN			3
> >> >  #define HDCP_2_2_RX_REPEATER(x)			((x) & BIT(0))
> >> 
> >> These two hunk should probably be separate changes... would be easier to
> >> record the changes (as they're not mentioned in the commit message at
> >> all!) and the acks from other maintainers.
> > Thanks Jani for comment, as this need to sens DRI too, so I formatted a
> > separate patch to avoid other related HDCP noise. 
> > https://patchwork.freedesktop.org/series/82806/
> > Based upon ack of maintainers i will rebase my this series.
> 
> I see the mei change as more important to be split out to be honest, and
> I'd prefer all of these to be retained in the same *series* albeit as
> separate patches. We'll want to get the acks to merge via drm-intel as
> dependencies, instead of them being merged directly in their trees and
> then waiting for weeks for merges and backmerges.
Sure i will do that this with same series.
> 
> BR,
> Jani.
> 
> 
> > Thanks,
> > Anshuman Gupta.
> >> 
> >> Cc: Tomas.
> >> 
> >> 
> >> BR,
> >> Jani.
> >> 
> >> 
> >> -- 
> >> Jani Nikula, Intel Open Source Graphics Center
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
