Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9853940FF57
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 20:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBEF6EE67;
	Fri, 17 Sep 2021 18:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADA06EE67
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 18:27:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631903236; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=5g+Ojy4ab6jkRV4pXusw6XPq/EyGblL5efPC4kLhvqA=;
 b=dS8tBUTvsCZAtJ35wKEIBupmNDsT2RO30DhRU51n/AeJJ2WjyPI33qh9r6kfinZ1igknKNQI
 98GpRnBlbEAyPE4pcyNdjQSUCau5qYq/vd94bVdunRdmB6shWPfM8/HH+lN/N1srA1U4ooTs
 2ApbjIXwkVAu6KOIOvMEy1KovM4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6144ddf9c1b30e2f02699a6b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 18:27:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 05D42C4360D; Fri, 17 Sep 2021 18:27:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 13E05C4338F;
 Fri, 17 Sep 2021 18:27:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 17 Sep 2021 11:27:03 -0700
From: abhinavk@codeaurora.org
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>
Subject: Re: [RESEND PATCH v6 10/14] drm/print: Add drm_debug_category_printer
In-Reply-To: <20210721175526.22020-11-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-11-sean@poorly.run>
Message-ID: <cb17a4b73b5d542c139661633c595ae2@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-07-21 10:55, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds a new printer which will select the appropriate output
> for a given debug category. Currently there is only one output target,
> which is syslog. However in the future we'll have tracefs and it will 
> be
> useful to print to syslog, tracefs, or both. Drivers just need to 
> create
> the printer for the appropriate category and the printer will decide
> where to send the output.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-11-sean@poorly.run
> #v5
> 
> Changes in v5:
> -Added to the set
> Changes in v6:
> -None
> ---
>  drivers/gpu/drm/drm_print.c |  5 +++++
>  include/drm/drm_print.h     | 28 ++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 2ff7a6ecc632..4d984a01b3a3 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -172,6 +172,11 @@ void __drm_printfn_err(struct drm_printer *p,
> struct va_format *vaf)
>  }
>  EXPORT_SYMBOL(__drm_printfn_err);
> 
> +void __drm_printfn_noop(struct drm_printer *p, struct va_format *vaf)
> +{
> +}
> +EXPORT_SYMBOL(__drm_printfn_noop);
> +
>  /**
>   * drm_puts - print a const string to a &drm_printer stream
>   * @p: the &drm printer
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 2ea0ffd9c1ce..af31beeb82a1 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -87,6 +87,7 @@ void __drm_puts_seq_file(struct drm_printer *p,
> const char *str);
>  void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf);
>  void __drm_printfn_debug_syslog(struct drm_printer *p, struct 
> va_format *vaf);
>  void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf);
> +void __drm_printfn_noop(struct drm_printer *p, struct va_format *vaf);
> 
>  __printf(2, 3)
>  void drm_printf(struct drm_printer *p, const char *f, ...);
> @@ -329,6 +330,33 @@ static inline bool drm_debug_enabled(enum
> drm_debug_category category)
>  	return drm_debug_syslog_enabled(category);
>  }
> 
> +/**
> + * drm_debug_category_printer - construct a &drm_printer that outputs 
> to
> + * pr_debug() if enabled for the given category.
> + * @category: the DRM_UT_* message category this message belongs to
> + * @prefix: trace output prefix
> + *
> + * RETURNS:
> + * The &drm_printer object
> + */
> +static inline struct drm_printer
> +drm_debug_category_printer(enum drm_debug_category category,
> +			   const char *prefix)
> +{
> +	struct drm_printer p = {
> +		.prefix = prefix
> +	};
> +
> +	if (drm_debug_syslog_enabled(category)) {
> +		p.printfn = __drm_printfn_debug_syslog;
> +	} else {
> +		WARN(1, "Debug category %d is inactive.", category);
> +		p.printfn = __drm_printfn_noop;
> +	}
> +
> +	return p;
> +}
> +
>  /*
>   * struct device based logging
>   *
