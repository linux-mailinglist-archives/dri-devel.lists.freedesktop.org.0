Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD01422979B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 13:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CD66E48E;
	Wed, 22 Jul 2020 11:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BDA6E48E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 11:41:02 +0000 (UTC)
IronPort-SDR: khEp3EhOYMyTaXcAV7SGgXmXYij94jWXdHOOvN6m5liC/k5hKnIGP+78eTpaQT3IFgbTAd9Hq+
 OMja/WiteJkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="149476685"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="149476685"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 04:41:02 -0700
IronPort-SDR: CPRDPXyTLrGTxqjHXK+hY6q+J6I6HCj+cKvlgtwwTIOVjegRPEfmanoT9nQFTbYBYprvy/jDpt
 bTDCPu0pAJGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="328188473"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 22 Jul 2020 04:40:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Jul 2020 14:40:56 +0300
Date: Wed, 22 Jul 2020 14:40:56 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Xu Qiang <xuqiang36@huawei.com>
Subject: Re: [PATCH -next] gpu: drm: Fix spinlock vblank_time_lock use error.
Message-ID: <20200722114056.GB6112@intel.com>
References: <20200722010527.52293-1-xuqiang36@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722010527.52293-1-xuqiang36@huawei.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 rui.xiang@huawei.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 01:05:27AM +0000, Xu Qiang wrote:
> The drm_handle_vblank function is in the interrupt context.
> Therefore, the spin lock vblank_time_lock is obtained
> from the interrupt context.
> =

> Cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Qiang <xuqiang36@huawei.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index f402c75b9d34..4ca63ff33a43 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -229,10 +229,11 @@ static void drm_reset_vblank_timestamp(struct drm_d=
evice *dev, unsigned int pipe
>  {
>  	u32 cur_vblank;
>  	bool rc;
> +	unsigned long irqflags;
>  	ktime_t t_vblank;
>  	int count =3D DRM_TIMESTAMP_MAXRETRIES;
>  =

> -	spin_lock(&dev->vblank_time_lock);
> +	spin_lock_irqsave(&dev->vblank_time_lock, irqflags);

Nak. This is always called with interrupts off, so no point on wasting
time saving/restoring the flags. And it's the same situation for all the
other cases you have below.

>  =

>  	/*
>  	 * sample the current counter to avoid random jumps
> @@ -257,7 +258,7 @@ static void drm_reset_vblank_timestamp(struct drm_dev=
ice *dev, unsigned int pipe
>  	 */
>  	store_vblank(dev, pipe, 1, t_vblank, cur_vblank);
>  =

> -	spin_unlock(&dev->vblank_time_lock);
> +	spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags);
>  }
>  =

>  /*
> @@ -1106,11 +1107,12 @@ static int __enable_vblank(struct drm_device *dev=
, unsigned int pipe)
>  static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> +	unsigned long irqflags;
>  	int ret =3D 0;
>  =

>  	assert_spin_locked(&dev->vbl_lock);
>  =

> -	spin_lock(&dev->vblank_time_lock);
> +	spin_lock_irqsave(&dev->vblank_time_lock, irqflags);
>  =

>  	if (!vblank->enabled) {
>  		/*
> @@ -1136,7 +1138,7 @@ static int drm_vblank_enable(struct drm_device *dev=
, unsigned int pipe)
>  		}
>  	}
>  =

> -	spin_unlock(&dev->vblank_time_lock);
> +	spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags);
>  =

>  	return ret;
>  }
> @@ -1917,6 +1919,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsi=
gned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
>  	unsigned long irqflags;
> +	unsigned long irqflags_vblank;
>  	bool disable_irq;
>  =

>  	if (drm_WARN_ON_ONCE(dev, !drm_dev_has_vblank(dev)))
> @@ -1931,18 +1934,18 @@ bool drm_handle_vblank(struct drm_device *dev, un=
signed int pipe)
>  	 * vblank enable/disable, as this would cause inconsistent
>  	 * or corrupted timestamps and vblank counts.
>  	 */
> -	spin_lock(&dev->vblank_time_lock);
> +	spin_lock_irqsave(&dev->vblank_time_lock, irqflags_vblank);
>  =

>  	/* Vblank irq handling disabled. Nothing to do. */
>  	if (!vblank->enabled) {
> -		spin_unlock(&dev->vblank_time_lock);
> +		spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags_vblank);
>  		spin_unlock_irqrestore(&dev->event_lock, irqflags);
>  		return false;
>  	}
>  =

>  	drm_update_vblank_count(dev, pipe, true);
>  =

> -	spin_unlock(&dev->vblank_time_lock);
> +	spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags_vblank);
>  =

>  	wake_up(&vblank->queue);
>  =

> -- =

> 2.25.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
