Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 436431A1E4B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 11:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111F76EA03;
	Wed,  8 Apr 2020 09:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB4F6EA02;
 Wed,  8 Apr 2020 09:50:33 +0000 (UTC)
IronPort-SDR: N6by7E+BzejNWw7JhhH8wSGcKEhEYtNMGfSWrWbUnuBUWoZHMPvH0ly9GfroctKypsWPzc7uuL
 F1Ic+Fsm1o/A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 02:50:33 -0700
IronPort-SDR: RoXShaBzUn2z3CptHK6wvQLQ9kVn1jRnoIpN5mDOc/bjVbQq0GuVnlcXEk/GI8ieZitkht1rQ4
 P6VG47IDxx4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; d="scan'208";a="398152989"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga004.jf.intel.com with ESMTP; 08 Apr 2020 02:50:33 -0700
Received: from fmsmsx118.amr.corp.intel.com (10.18.116.18) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Apr 2020 02:50:32 -0700
Received: from BGSMSX107.gar.corp.intel.com (10.223.4.191) by
 fmsmsx118.amr.corp.intel.com (10.18.116.18) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Apr 2020 02:50:32 -0700
Received: from BGSMSX108.gar.corp.intel.com ([169.254.8.65]) by
 BGSMSX107.gar.corp.intel.com ([169.254.9.81]) with mapi id 14.03.0439.000;
 Wed, 8 Apr 2020 15:20:26 +0530
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH RESEND 2/7] drm/dsc: add helper for calculating rc
 buffer size from DPCD
Thread-Topic: [PATCH RESEND 2/7] drm/dsc: add helper for calculating rc
 buffer size from DPCD
Thread-Index: AQHWBDU5lwXOE0wMV0GGXpV1f0sx4ahvDbxw
Date: Wed, 8 Apr 2020 09:50:25 +0000
Message-ID: <57510F3E2013164E925CD03ED7512A3B80A883DF@BGSMSX108.gar.corp.intel.com>
References: <20200327124229.26461-1-jani.nikula@intel.com>
 <20200327124229.26461-2-jani.nikula@intel.com>
In-Reply-To: <20200327124229.26461-2-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
MIME-Version: 1.0
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Navare, Manasi
 D" <manasi.d.navare@intel.com>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jani Nikula <jani.nikula@intel.com>
> Sent: Friday, March 27, 2020 6:12 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Alex Deucher
> <alexdeucher@gmail.com>; Harry Wentland <hwentlan@amd.com>; Navare,
> Manasi D <manasi.d.navare@intel.com>; Kulkarni, Vandita
> <vandita.kulkarni@intel.com>
> Subject: [PATCH RESEND 2/7] drm/dsc: add helper for calculating rc buffer size
> from DPCD
> 
> Add a helper for calculating the rc buffer size from the DCPD offsets
> DP_DSC_RC_BUF_BLK_SIZE and DP_DSC_RC_BUF_SIZE.
> 
> Cc: Alex Deucher <alexdeucher@gmail.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Looks good to me.
Reviewed-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/drm_dsc.c | 27 +++++++++++++++++++++++++++
>  include/drm/drm_dsc.h     |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dsc.c b/drivers/gpu/drm/drm_dsc.c index
> 09afbc01ea94..ff602f7ec65b 100644
> --- a/drivers/gpu/drm/drm_dsc.c
> +++ b/drivers/gpu/drm/drm_dsc.c
> @@ -49,6 +49,33 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header
> *pps_header)  }  EXPORT_SYMBOL(drm_dsc_dp_pps_header_init);
> 
> +/**
> + * drm_dsc_dp_rc_buffer_size - get rc buffer size in bytes
> + * @rc_buffer_block_size: block size code, according to DPCD offset 62h
> + * @rc_buffer_size: number of blocks - 1, according to DPCD offset 63h
> + *
> + * return:
> + * buffer size in bytes, or 0 on invalid input  */ int
> +drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size) {
> +	int size = 1024 * (rc_buffer_size + 1);
> +
> +	switch (rc_buffer_block_size) {
> +	case DP_DSC_RC_BUF_BLK_SIZE_1:
> +		return 1 * size;
> +	case DP_DSC_RC_BUF_BLK_SIZE_4:
> +		return 4 * size;
> +	case DP_DSC_RC_BUF_BLK_SIZE_16:
> +		return 16 * size;
> +	case DP_DSC_RC_BUF_BLK_SIZE_64:
> +		return 64 * size;
> +	default:
> +		return 0;
> +	}
> +}
> +EXPORT_SYMBOL(drm_dsc_dp_rc_buffer_size);
> +
>  /**
>   * drm_dsc_pps_payload_pack() - Populates the DSC PPS
>   *
> diff --git a/include/drm/drm_dsc.h b/include/drm/drm_dsc.h index
> 887954cbfc60..537a68330840 100644
> --- a/include/drm/drm_dsc.h
> +++ b/include/drm/drm_dsc.h
> @@ -602,6 +602,7 @@ struct drm_dsc_pps_infoframe {  } __packed;
> 
>  void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
> +int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8
> +rc_buffer_size);
>  void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set
> *pps_sdp,
>  				const struct drm_dsc_config *dsc_cfg);  int
> drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
> --
> 2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
