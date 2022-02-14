Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AED3A4B560A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CC010E212;
	Mon, 14 Feb 2022 16:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B3E910E212
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 16:23:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93B7D13D5;
 Mon, 14 Feb 2022 08:23:28 -0800 (PST)
Received: from [10.57.37.216] (unknown [10.57.37.216])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B44923F70D;
 Mon, 14 Feb 2022 08:23:27 -0800 (PST)
Message-ID: <265e99b9-fbde-bdcf-d8e9-e5deba1d9564@arm.com>
Date: Mon, 14 Feb 2022 16:23:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/9] drm/panfrost: Add HW_ISSUE_TTRX_3485 quirk
Content-Language: en-GB
To: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-6-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220211202728.6146-6-alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: airlied@linux.ie, tomeu.vizoso@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/02/2022 20:27, alyssa.rosenzweig@collabora.com wrote:
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> 
> TTRX_3485 requires the infamous "dummy job" workaround. I have this
> workaround implemented in a local branch, but I have not yet hit a case
> that requires it so I cannot test whether the implementation is correct.
> In the mean time, add the quirk bit so we can document which platforms
> may need it in the future.

This one is hideous ;) Although to me this isn't the 'infamous' one as
it's not the earliest example of a dummy job.

However... I believe as Panfrost currently stands this is probably not
very possible to hit. It requires a job to be stopped (soft or hard) at
a critical point during submission - which at the moment Panfrost
basically never does (the exception is if you close the fd immediately
while a job is in progress). And of course the timing has to be 'just
right' to hit the bug.

That said I think we should probably add pre-emption support sometime at
which point this could become an issue.

> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_issues.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
> index 058f6a4c8435..b8865fc9efce 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_issues.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
> @@ -132,6 +132,9 @@ enum panfrost_hw_issue {
>  	 * to hang */
>  	HW_ISSUE_TTRX_3076,
>  
> +	/* Must issue a dummy job before starting real work to prevent hangs */
> +	HW_ISSUE_TTRX_3485,
> +
>  	HW_ISSUE_END
>  };
>  

