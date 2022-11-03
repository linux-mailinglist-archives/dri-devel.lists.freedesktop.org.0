Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB0E617E6B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 14:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057FB10E5DC;
	Thu,  3 Nov 2022 13:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD3010E5DC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667483469; x=1699019469;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MdJs6GJxG+5C4y1kNW92hXKl7i8pmS2mGPoi5urTFW0=;
 b=gYYukWFSCIP2WEt2GE4LLlQX0WK5PL94cpE6ME0vqcpKuy29OXmlI3td
 M6DHb4T8tptA8vbhty8leC1VQR7fJHi3qVFXQP1teynuXBpL/x01uESob
 eKDvqhRoJozew6erezuQJt39cFU0akKukROFphPCWxf0OQXjDutYTu1//
 njMwx+I4ghwQIPpJQj6Y804jlym0cDwQusedPTIvaIy5GmH01YhodWTOz
 1IDm8pExUSKZNuYdgcwLDi7aU6X+VmwveY5mYXjvkqrKEE5uUkt4ytqt2
 xRS9cRgHxaf30FG6mVOtheXyOKnx9RHvdWUtg8D/NlTz5l8jeC7nV4/oM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="395989627"
X-IronPort-AV: E=Sophos;i="5.96,235,1665471600"; d="scan'208";a="395989627"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 06:51:08 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="667972012"
X-IronPort-AV: E=Sophos;i="5.96,235,1665471600"; d="scan'208";a="667972012"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 06:51:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/edid: make a couple of read-only arrays static const
In-Reply-To: <20221103133730.80940-1-colin.i.king@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221103133730.80940-1-colin.i.king@gmail.com>
Date: Thu, 03 Nov 2022 15:51:01 +0200
Message-ID: <87o7tob0ze.fsf@intel.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Nov 2022, Colin Ian King <colin.i.king@gmail.com> wrote:
> Don't populate two read-only arrays on the stack but instead make
> them static const . Also makes the object code a little smaller.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 4671dc23abe0..50d488cc840e 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3916,8 +3916,8 @@ static int drm_cvt_modes(struct drm_connector *connector,
>  	struct drm_display_mode *newmode;
>  	struct drm_device *dev = connector->dev;
>  	const struct cvt_timing *cvt;
> -	const int rates[] = { 60, 85, 75, 60, 50 };
> -	const u8 empty[3] = { 0, 0, 0 };
> +	static const int rates[] = { 60, 85, 75, 60, 50 };
> +	static const u8 empty[3] = { 0, 0, 0 };

The change is fine per se, but I think this whole array is silly. Could
be removed with:

-		if (!memcmp(cvt->code, empty, 3))
+		if (!memchr_inv(cvt->code, 0, sizeof(cvt->code)))


BR,
Jani.

PS. I also note that rates[0] is never used, but that's another story,
maybe a bug.


>  
>  	for (i = 0; i < 4; i++) {
>  		int width, height;

-- 
Jani Nikula, Intel Open Source Graphics Center
