Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2FE4B57A4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 18:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6129F10E1DE;
	Mon, 14 Feb 2022 17:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C21610E1DE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 17:01:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 979B31F43B0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644858070;
 bh=atKSjsx0XQFoKGzkpyMGLy6eYCI5dpDgDO8AgjmSynU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AjiJQXUG+2LBNr+V2PPXXAtk0dEQy9+RdF3Apytuqml6gcbBDNrloo3zNkud53yWC
 lL7ikkah2dFAK87Y2h0BOgM1j8HFWluXX7tQFy49SQs46jdQpWNWR0cqliJdeXlmuB
 dPiXA1y4n0u5sxZjt+O5So/mTLqiyZIYlDFw4e//4eWnJcXpepShYGf/OAl0xaWHLU
 b0yRrhR6r2M/G3tAxzVIeDdCn9r1mHzDUWMQnCK5xYNoR5B70q7AwsghkSXzUsPFyz
 lv/aOpw9dvmenW8HsWDL/jRhu2TZqpFfm91OsCkdP+WB7aoE7M59XUuoSrWyCxQhOg
 yMLGA4qNDsz7g==
Date: Mon, 14 Feb 2022 12:01:05 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 6/9] drm/panfrost: Add "clean only safe" feature bit
Message-ID: <YgqK0ZjnXVux9d6Y@maud>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-7-alyssa.rosenzweig@collabora.com>
 <fcfedc32-32c6-4827-4cfa-d2b7098ee22b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcfedc32-32c6-4827-4cfa-d2b7098ee22b@arm.com>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > Add the HW_FEATURE_CLEAN_ONLY_SAFE bit based on kbase. When I actually
> > tried to port the logic from kbase, trivial jobs raised Data Invalid
> > Faults, so this may depend on other coherency details. It's still useful
> > to have the bit to record the feature bit when adding new models.
> > 
> > Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Sadly I don't have the hardware to try this out on, but it should be a
> simple case of the below (untested):
> 
> ----8<----
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 908d79520853..602e51c4966e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -212,9 +212,13 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>          * start */
>         cfg |= JS_CONFIG_THREAD_PRI(8) |
>                 JS_CONFIG_START_FLUSH_CLEAN_INVALIDATE |
> -               JS_CONFIG_END_FLUSH_CLEAN_INVALIDATE |
>                 panfrost_get_job_chain_flag(job);
>  
> +       if (panfrost_has_hw_feature(pfdev, HW_FEATURE_CLEAN_ONLY_SAFE))
> +               cfg |= JS_CONFIG_END_FLUSH_CLEAN;
> +       else
> +               cfg |= JS_CONFIG_END_FLUSH_CLEAN_INVALIDATE;
> +
>         if (panfrost_has_hw_feature(pfdev, HW_FEATURE_FLUSH_REDUCTION))
>                 cfg |= JS_CONFIG_ENABLE_FLUSH_REDUCTION;

Yes, this is the patch I typed out... causes DATA_INVALID_FAULTs for me
with Mesa. Which makes me wonder if userspace needs to respect some
extra rules for this to be safe.
