Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F204966DD06
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 12:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C694F10E19B;
	Tue, 17 Jan 2023 11:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D1210E19B;
 Tue, 17 Jan 2023 11:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673956739; x=1705492739;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RFZiPd4/mN4/1uvopLmdyWed3E2H4WrMg1o5mcAhlTA=;
 b=V3Apylk3SwjXbCHC0YLROUJng98GePdJU77Gk5Xv/6F9g0jum56eTids
 ccW1HpWPdNqSW8OJTla/Ut1siIfNe6IROOaQrCJ1gHlpZ3xO7bw2b84Y2
 9YG69bhEAFdEzV9aIb1vExXEoXShdWp6O/AWVB3Web7U8D154QOMwKjAO
 JTLXpZpVBYhaezSB5u11b9QPb9Olh1SLQVe0H/In1OqtVt9XCCxC+yUXW
 u6l1bR2Hq0/JapfNoKReVHh6F1QIM7yPvYN+iMv/ekWLmDivxRo+djHzs
 DKmImhNDmjkbR4vX4LGq86ttnTgW6QN2sTF+4GcHJLLo00C4dW48N0ytu w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="326745686"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="326745686"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:58:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="722628176"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="722628176"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.10.213])
 ([10.213.10.213])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:58:56 -0800
Message-ID: <4e5013ce-ee4c-3f29-8289-7f72d9ea4075@intel.com>
Date: Tue, 17 Jan 2023 12:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/print: Add drm_dbg_ratelimited
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230117115350.1071-1-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230117115350.1071-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.01.2023 12:53, Nirmoy Das wrote:
> Add a function for ratelimitted debug print.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   include/drm/drm_print.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index a44fb7ef257f..1d839f507319 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -602,6 +602,9 @@ void __drm_err(const char *format, ...);
>   		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
>   })
>   
> +#define drm_dbg_ratelimited(drm, fmt, ...) \
> +	__DRM_DEFINE_DBG_RATELIMITED(DRIVER, drm, fmt, ## __VA_ARGS__)
> +
>   #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
>   	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
>   

