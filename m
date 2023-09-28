Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 241F27B205F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 17:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3E410E675;
	Thu, 28 Sep 2023 15:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D8910E675
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 15:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695913512; x=1727449512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N04qohs+AWISaufUQK3LBxc2PACVC5jMK1v0k1hnR4s=;
 b=BHE3/mYlB/+oV39Kn/kcl4t3QfVidT+0D8rC6ehRlw3tpN+nLdiHk4se
 kvrtp9pCiPH3lHj2M2qZKw7//CGc8SMrVW7gmHUz1A5yZm70/I609JTNG
 BujEuQnuEiWBJ/HNF7/qifeIM3zEIc7/OonN/8MOOpGL5DcQiF/4AT9H8
 ob6vkb16IsdmQcw+iZIxFJNxjmsX8lNRvroTqz4o8YriUWimFkSsLY7D3
 x3sKcGY1i7e6Kbvm2I7o6UuhGEgFzC7o4IjH55RTEZsobhUt6bkCp4xS5
 WIuTU0Y1/eNBvQ0+A7bZ4hZZMZvSYVbjMPLBlM+kkO+CjfCLrFRsprwkj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="372443508"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="372443508"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 08:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="839910695"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="839910695"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by FMSMGA003.fm.intel.com with SMTP; 28 Sep 2023 08:03:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 28 Sep 2023 18:03:00 +0300
Date: Thu, 28 Sep 2023 18:03:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ray Strode <halfline@gmail.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Message-ID: <ZRWVpCaQUefzdZ4-@intel.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926170549.2589045-1-halfline@gmail.com>
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
Cc: Ray Strode <rstrode@redhat.com>, daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, mdaenzer@redhat.com,
 alexander.deucher@amd.com, airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 01:05:49PM -0400, Ray Strode wrote:
> From: Ray Strode <rstrode@redhat.com>
> 
> A drm atomic commit can be quite slow on some hardware. It can lead
> to a lengthy queue of commands that need to get processed and waited
> on before control can go back to user space.
> 
> If user space is a real-time thread, that delay can have severe
> consequences, leading to the process getting killed for exceeding
> rlimits.
> 
> This commit addresses the problem by always running the slow part of
> a commit on a workqueue, separated from the task initiating the
> commit.
> 
> This change makes the nonblocking and blocking paths work in the same way,
> and as a result allows the task to sleep and not use up its
> RLIMIT_RTTIME allocation.
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2861
> Signed-off-by: Ray Strode <rstrode@redhat.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 292e38eb6218..1a1e68d98d38 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -2028,64 +2028,63 @@ int drm_atomic_helper_commit(struct drm_device *dev,
>  	 * This is the point of no return - everything below never fails except
>  	 * when the hw goes bonghits. Which means we can commit the new state on
>  	 * the software side now.
>  	 */
>  
>  	ret = drm_atomic_helper_swap_state(state, true);
>  	if (ret)
>  		goto err;
>  
>  	/*
>  	 * Everything below can be run asynchronously without the need to grab
>  	 * any modeset locks at all under one condition: It must be guaranteed
>  	 * that the asynchronous work has either been cancelled (if the driver
>  	 * supports it, which at least requires that the framebuffers get
>  	 * cleaned up with drm_atomic_helper_cleanup_planes()) or completed
>  	 * before the new state gets committed on the software side with
>  	 * drm_atomic_helper_swap_state().
>  	 *
>  	 * This scheme allows new atomic state updates to be prepared and
>  	 * checked in parallel to the asynchronous completion of the previous
>  	 * update. Which is important since compositors need to figure out the
>  	 * composition of the next frame right after having submitted the
>  	 * current layout.
>  	 *
>  	 * NOTE: Commit work has multiple phases, first hardware commit, then
>  	 * cleanup. We want them to overlap, hence need system_unbound_wq to
>  	 * make sure work items don't artificially stall on each another.
>  	 */
>  
>  	drm_atomic_state_get(state);
> -	if (nonblock)
> -		queue_work(system_unbound_wq, &state->commit_work);
> -	else
> -		commit_tail(state);
> +	queue_work(system_unbound_wq, &state->commit_work);
> +	if (!nonblock)
> +		flush_work(&state->commit_work);

Here's my earlier take on this: https://patchwork.freedesktop.org/series/108668/
execpt I went further and moved the flush past the unlock in the end.

-- 
Ville Syrjälä
Intel
