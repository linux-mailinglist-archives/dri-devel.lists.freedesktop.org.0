Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15DF664957
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 19:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB8B10E12A;
	Tue, 10 Jan 2023 18:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B826F10E12A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 18:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673374841; x=1704910841;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gEDEe6v6P56XKTKVod6hHvBcJizZdWIOCj+46/uxJjc=;
 b=Agjq5E3iXs4cTLas1xFngzftUT+M/SYy0IGoYl+pp1WDIZ9E4u9oyklg
 SMIiL7BEsn3whY//FnKNsMU4hceeWszUGRjHz6aD6ceoUcb7x9WBtW/nL
 /+0UZZkg/nDSMB09k+zUhfYGmTSQXafr5ReOdnfXPe36RYq0LlsTiokuD
 HqpNR7/NhqK1tkmQMW5ZHjFTbeQ72d+P2Sb6Tkoke7tb1viWfXAA4kbvB
 GEMi01SAV7u0HCoJy3rZty5IVIMExIAEpUOiuL6bpsnarT0CYonWPQYPi
 6nGbA0xRipm4kLBvjiP/hv+SRtYklwXcOp0ynUpGtIKiX65Pk1oJh4pcZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311025542"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="311025542"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 10:20:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="657139780"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="657139780"
Received: from drooney-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.11.80])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 10:20:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 RFC] video/hdmi: Fix HDMI_VENDOR_INFOFRAME_SIZE
In-Reply-To: <20230109223110.1165433-1-martin.blumenstingl@googlemail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230109223110.1165433-1-martin.blumenstingl@googlemail.com>
Date: Tue, 10 Jan 2023 20:20:34 +0200
Message-ID: <87lemai74d.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bernard Zhao <bernard@vivo.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 09 Jan 2023, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
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
>
> Fixes: c5e69ab35c0d ("video/hdmi: Constify infoframe passed to the pack functions")
> Fixes: d43be2554b58 ("drivers: video: hdmi: cleanup coding style in video a bit")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> I'm not an expert on this topic and I'm not sure if the size still
> depends on that if condition from long time ago. So please share your
> thoughts.

I tried to look at this quickly, but it makes my brain hurt. I don't
think simply changing the size here is right either.

Cc: Ville.

BR,
Jani.



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

-- 
Jani Nikula, Intel Open Source Graphics Center
