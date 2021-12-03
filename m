Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B09467294
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 08:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F337338B;
	Fri,  3 Dec 2021 07:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4A77338B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 07:25:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="216948663"
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="216948663"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 23:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="655810306"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 02 Dec 2021 23:25:21 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Dec 2021 09:25:20 +0200
Date: Fri, 3 Dec 2021 09:25:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mark Yacoub <markyacoub@chromium.org>
Subject: Re: [PATCH] drm: send vblank event with the attached sequence rather
 than current
Message-ID: <YanGYFVo6etc/j0T@intel.com>
References: <20211202151200.3125685-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211202151200.3125685-1-markyacoub@chromium.org>
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
Cc: chunkuang.hu@kernel.org, David Airlie <airlied@linux.ie>,
 jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzungbi@google.com, seanpaul@chromium.org,
 Thomas Zimmermann <tzimmermann@suse.de>, matthias.bgg@gmail.com,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 02, 2021 at 10:11:55AM -0500, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> drm_handle_vblank_events loops over vblank_event_list to send any event
> that is current or has passed.
> More than 1 event could be pending with past sequence time that need to
> be send. This can be a side effect of drivers without hardware vblank
> counter and they depend on the difference in the timestamps and the
> frame/field duration calculated in drm_update_vblank_count. This can
> lead to 1 vblirq being ignored due to very small diff, resulting in a
> subsequent vblank with 2 pending vblank events to be sent, each with a
> unique sequence expected by user space.
> 
> [How]
> Send each pending vblank event with the sequence it's waiting on instead
> of assigning the current sequence to all of them.
> 
> Fixes igt@kms_flip "Unexpected frame sequence"
> Tested on Jacuzzi (MT8183)
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/drm_vblank.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 3417e1ac79185..47da8056abc14 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1902,7 +1902,7 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
>  
>  		list_del(&e->base.link);
>  		drm_vblank_put(dev, pipe);
> -		send_vblank_event(dev, e, seq, now);
> +		send_vblank_event(dev, e, e->sequence, now);

This doesn't look right. The timestamp corresponds to 'seq' not
e->sequence (ie. whatever sequqnece number the user asked to wait
for).

>  	}
>  
>  	if (crtc && crtc->funcs->get_vblank_timestamp)
> -- 
> 2.34.0.rc2.393.gf8c9666880-goog

-- 
Ville Syrjälä
Intel
