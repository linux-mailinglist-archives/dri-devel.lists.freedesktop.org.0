Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3394B529B6D
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 09:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF383112EB3;
	Tue, 17 May 2022 07:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45EC112EB3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 07:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652773879; x=1684309879;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LWIEB4/lPMy65N4AJNM7XhWmKfMhu8OaBtUPWfYPFRM=;
 b=a8znuvY6f31m/e3Ax0pAMkfSukD9wnSi0NtUlNEdxT90bCcSed4YD77g
 wl6dtTJ6jWdAJDnswVoyJ8Ablrinpf9+7SWH5Lucizphd3NZcAgQUW2ib
 YkdXUo54TgPg9JJmzQp6HcK7EGkor3MnAAnRWGFiYhdqKJaNKwalh+PPV
 bmKnCoidcE510LAaygubm96Ci1eJU6mI9leI0BqyOZ3Yo47j236KvYbF/
 UNCIdcZFOPH2sjVim2u7kw9lpWb7FBe/5sl1XTa+7PA3lrrCzHblcYHM9
 p6CJM0cuKDpIrQjIeoG3olIeQNiemksEmqIogIEK+QCf1P+ar9GJlwXgB g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="270794004"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="270794004"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 00:51:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="568758921"
Received: from psagan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.132.13])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 00:51:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mark Yacoub <markyacoub@chromium.org>
Subject: Re: [PATCH] drm: Add a debug message when getting a prop is missing
In-Reply-To: <20220510182810.1223574-1-markyacoub@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220510182810.1223574-1-markyacoub@chromium.org>
Date: Tue, 17 May 2022 10:51:14 +0300
Message-ID: <87bkvwfvgt.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, markyacoub@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, Thomas Zimmermann <tzimmermann@suse.de>,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 May 2022, Mark Yacoub <markyacoub@chromium.org> wrote:
> [Why]
> If a connector property is attached but
> drm_atomic_connector_get_property doesn't handle a case for it,
> modeteset will crash with a segfault without.
>
> [How]
> Add a debug message indicating that a connector property is not handled
> when user space is trying to read it.
>
> TEST=modetest
>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index acb1ee93d206..36b0f664dd80 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -884,6 +884,12 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
>  	} else {
> +		// LOG that the kernel is missing handling this property as a case here.

The comment is unnecessary, and we also don't use // comments.

> +		drm_dbg_atomic(
> +			dev,
> +			"[CONNECTOR:%d:%s] Get Property [PROP:%d:%s] is not handled\n",
> +			connector->base.id, connector->name, property->base.id,
> +			property->name);

Why not use the same message as in drm_atomic_connector_set_property()?

Blank line here.

BR,
Jani.

>  		return -EINVAL;
>  	}

-- 
Jani Nikula, Intel Open Source Graphics Center
