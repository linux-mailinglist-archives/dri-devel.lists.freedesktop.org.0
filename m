Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1744715BDFA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 12:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AA86E29B;
	Thu, 13 Feb 2020 11:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BF26E23F;
 Thu, 13 Feb 2020 11:46:25 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 03:46:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,436,1574150400"; d="scan'208";a="238013209"
Received: from unknown (HELO intel.com) ([10.223.74.178])
 by orsmga006.jf.intel.com with ESMTP; 13 Feb 2020 03:46:22 -0800
Date: Thu, 13 Feb 2020 17:07:49 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/5] drm/hdcp: fix
 DRM_HDCP_2_KSV_COUNT_2_LSBITS
Message-ID: <20200213113748.GC11041@intel.com>
References: <20200212102942.26568-1-ramalingam.c@intel.com>
 <20200212102942.26568-3-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212102942.26568-3-ramalingam.c@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-02-12 at 15:59:39 +0530, Ramalingam C wrote:
> Need to extract the 2 most significant bits from a byte for constructing
> the revoked KSV count of the SRM.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>  include/drm/drm_hdcp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> index d512089b873f..c6bab4986a65 100644
> --- a/include/drm/drm_hdcp.h
> +++ b/include/drm/drm_hdcp.h
> @@ -276,7 +276,7 @@ void drm_hdcp_cpu_to_be24(u8 seq_num[HDCP_2_2_SEQ_NUM_LEN], u32 val)
>  #define DRM_HDCP_2_VRL_LENGTH_SIZE		3
>  #define DRM_HDCP_2_DCP_SIG_SIZE			384
>  #define DRM_HDCP_2_NO_OF_DEV_PLUS_RESERVED_SZ	4
> -#define DRM_HDCP_2_KSV_COUNT_2_LSBITS(byte)	(((byte) & 0xC) >> 6)
> +#define DRM_HDCP_2_KSV_COUNT_2_LSBITS(byte)	(((byte) & 0xC0) >> 6)
LGTM, verified wrt Table 5.1 HDCP HDMI specs page 64.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com> 
>  
>  struct hdcp_srm_header {
>  	u8 srm_id;
> -- 
> 2.20.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
