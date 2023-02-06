Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE2F68B924
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 10:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FB310E2D3;
	Mon,  6 Feb 2023 09:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616E410E2D3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 09:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675677512; x=1707213512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5jHinQDRKsI41qmvXyGuFiVNpEoZkR1m6/ioaZhntFw=;
 b=mIIYjq1t4JghtRByB1SEU+pZK2rvNiimFEx6sN5O4qNH+1OYM1QAoYVO
 zLrTR6oBzcaWi9/fTl5FkYyltsxPbgju5LpZ1GVnqCCnBu+L+Fkqjp/Bo
 vj6SCBr4+9LE2vYJEoz4S3/kx6ROl+6q6r6JICZPasJ2Pfv2woYmpJUjV
 xBlDINeu/ano7wJlQafIBiQRD2xisOjLaOVKXRrV40pGrgetUeveEItxM
 qCa29U5HmxPKDvCGqoZmeqZD8+p2Y1T5aDgBkTlmS45eG10HzqQH+5dnR
 P0Nfc3eo1nM4VCWl5IV/ValxPfAkW0YyZc1SKwPSk/6gJsq8TmCTA6Gaq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="330462233"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="330462233"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 01:58:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="668367134"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="668367134"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga007.fm.intel.com with SMTP; 06 Feb 2023 01:58:27 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 06 Feb 2023 11:58:26 +0200
Date: Mon, 6 Feb 2023 11:58:26 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 RFC] video/hdmi: Fix HDMI_VENDOR_INFOFRAME_SIZE
Message-ID: <Y+DPQjukgC0BELkN@intel.com>
References: <20230109223110.1165433-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109223110.1165433-1-martin.blumenstingl@googlemail.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Bernard Zhao <bernard@vivo.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hans.verkuil@cisco.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 11:31:10PM +0100, Martin Blumenstingl wrote:
> When support for the HDMI vendor infoframe was introduced back with
> commit 7d27becb3532 ("video/hdmi: Introduce helpers for the HDMI vendor
> specific infoframe") it's payload size was either 5 or 6 bytes,
> depending on:
>   if (frame->s3d_struct >= HDMI_3D_STRUCTURE_SIDE_BY_SIDE_HALF)
> When true the size was 6 bytes, otherwise 5 bytes.
> 
> Drivers that are using hdmi_infoframe_pack() are reserving 10 bytes (4
> bytes for the header and up to 6 bytes for the infoframe payload data)
> or more (exynos_hdmi reserves 25 bytes).
> 
> Over time the frame payload length was reduced to 4 bytes. This however
> does not match the code from hdmi_hdmi_infoframe_pack() where ptr[8] and
> ptr[9] are written, which means the infoframe has to allow up to 6 bytes
> of payload data (considering that the header takes 4 bytes).
> 
> Change HDMI_VENDOR_INFOFRAME_SIZE to 6 bytes so
> hdmi_vendor_infoframe_pack_only() can properly check the passed buffer
> size and avoid an out of bounds write to ptr[8] or ptr[9].

The function should return -ENOSPC if the caller didn't
provide a big enough buffer. Are you saying there are
drivers that are passing a bogus size here?

> 
> Fixes: c5e69ab35c0d ("video/hdmi: Constify infoframe passed to the pack functions")
> Fixes: d43be2554b58 ("drivers: video: hdmi: cleanup coding style in video a bit")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> I'm not an expert on this topic and I'm not sure if the size still
> depends on that if condition from long time ago. So please share your
> thoughts.
> 
> 
>  include/linux/hdmi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> index 2f4dcc8d060e..026c5ef5a1a5 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
> @@ -57,7 +57,7 @@ enum hdmi_infoframe_type {
>  #define HDMI_SPD_INFOFRAME_SIZE    25
>  #define HDMI_AUDIO_INFOFRAME_SIZE  10
>  #define HDMI_DRM_INFOFRAME_SIZE    26
> -#define HDMI_VENDOR_INFOFRAME_SIZE  4
> +#define HDMI_VENDOR_INFOFRAME_SIZE  6
>  
>  #define HDMI_INFOFRAME_SIZE(type)	\
>  	(HDMI_INFOFRAME_HEADER_SIZE + HDMI_ ## type ## _INFOFRAME_SIZE)
> -- 
> 2.39.0

-- 
Ville Syrjälä
Intel
