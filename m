Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7285AF682
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 23:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1EC10E3A6;
	Tue,  6 Sep 2022 21:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176D310E318;
 Tue,  6 Sep 2022 21:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=ahAQHE+1iY9jvcUUdT9evfOPFE+6F0GSGPnh72g4V/Q=; b=VhDEBnkyj7coyyzA54oFVLlrMP
 oKLICLLOw7M+tjyB9dG0vGsW0034q2Pmi1xrRWccCls5l7cy9oAxWKMGDERQgBGThrYF2cuo+VpLJ
 TRyrVUviAoDvU/BQpFrZBe1ngt1gU1PWXtUztGA9r1cC2HluF8dcPflmnL17DFZhhOF+mVl0lH1RL
 c0pKWr8M6h/FUf3ZuO1AIVuV4cFHJF6/qTEGN6ZilhSKDhzg/xDkxh8yHw+MBxoPn3Txt68KsOxUQ
 twjkPEpTntJQM2R42/EagEWnOjDkT0bs0cNy2YRoEk21LfmbJxv4CkFlvVTpK+wVEqUrMvieZb9U3
 xjfLAWVg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oVfiC-00AlOm-Mi; Tue, 06 Sep 2022 21:02:24 +0000
Date: Tue, 6 Sep 2022 22:02:24 +0100
From: Matthew Wilcox <willy@infradead.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH v4 1/3] drm: Use XArray instead of IDR for minors
Message-ID: <Yxe1YDcVfqbjgT6a@casper.infradead.org>
References: <20220906201629.419160-1-michal.winiarski@intel.com>
 <20220906201629.419160-2-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906201629.419160-2-michal.winiarski@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 10:16:27PM +0200, Michał Winiarski wrote:
> IDR is deprecated, and since XArray manages its own state with internal
> locking, it simplifies the locking on DRM side.
> Additionally, don't use the IRQ-safe variant, since operating on drm
> minor is not done in IRQ context.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Suggested-by: Matthew Wilcox <willy@infradead.org>

I have a few questions, but I like where you're going.

> @@ -98,21 +98,18 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
>  static void drm_minor_alloc_release(struct drm_device *dev, void *data)
>  {
>  	struct drm_minor *minor = data;
> -	unsigned long flags;
>  
>  	WARN_ON(dev != minor->dev);
>  
>  	put_device(minor->kdev);
>  
> -	spin_lock_irqsave(&drm_minor_lock, flags);
> -	idr_remove(&drm_minors_idr, minor->index);
> -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> +	xa_release(&drm_minors_xa, minor->index);

Has it definitely been unused at this point?  I would think that
xa_erase() (an unconditional store) would be the correct function to
call.

> @@ -122,20 +119,12 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
>  	minor->type = type;
>  	minor->dev = dev;
>  
> -	idr_preload(GFP_KERNEL);
> -	spin_lock_irqsave(&drm_minor_lock, flags);
> -	r = idr_alloc(&drm_minors_idr,
> -		      NULL,
> -		      64 * type,
> -		      64 * (type + 1),
> -		      GFP_NOWAIT);
> -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> -	idr_preload_end();
> -
> +	r = xa_alloc(&drm_minors_xa, &id, NULL,
> +		     XA_LIMIT(64 * type, 64 * (type + 1) - 1), GFP_KERNEL);
>  	if (r < 0)
>  		return r;
>  
> -	minor->index = r;
> +	minor->index = id;

Wouldn't it be better to call:

	r = xa_alloc(&drm_minors_xa, &minor->index, NULL,
			XA_LIMIT(64 * type, 64 * (type + 1) - 1), GFP_KERNEL);

I might also prefer a little syntactic sugar like:

#define DRM_MINOR_LIMIT(type)	XA_LIMIT(64 * (type), 64 * (type) + 63)

but that's definitely a matter of taste.

> @@ -172,9 +161,12 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
>  		goto err_debugfs;
>  
>  	/* replace NULL with @minor so lookups will succeed from now on */
> -	spin_lock_irqsave(&drm_minor_lock, flags);
> -	idr_replace(&drm_minors_idr, minor, minor->index);
> -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> +	entry = xa_store(&drm_minors_xa, minor->index, &minor, GFP_KERNEL);
> +	if (xa_is_err(entry)) {
> +		ret = xa_err(entry);
> +		goto err_debugfs;
> +	}
> +	WARN_ON(entry);

Might be better as an xa_cmpxchg()?

> @@ -187,16 +179,13 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
>  static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
>  {
>  	struct drm_minor *minor;
> -	unsigned long flags;
>  
>  	minor = *drm_minor_get_slot(dev, type);
>  	if (!minor || !device_is_registered(minor->kdev))
>  		return;
>  
>  	/* replace @minor with NULL so lookups will fail from now on */
> -	spin_lock_irqsave(&drm_minor_lock, flags);
> -	idr_replace(&drm_minors_idr, NULL, minor->index);
> -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> +	xa_erase(&drm_minors_xa, minor->index);

This isn't an exact replacement, but I'm not sure whether that makes a
difference.  xa_erase() allows allocation of this ID again while
idr_replace() means that lookups return NULL, but the ID remains in
use.  The equivalent of idr_replace() is:
	xa_store(&drm_minors_xa, minor->index, NULL, GFP_KERNEL);

> @@ -215,13 +204,10 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
>  struct drm_minor *drm_minor_acquire(unsigned int minor_id)
>  {
>  	struct drm_minor *minor;
> -	unsigned long flags;
>  
> -	spin_lock_irqsave(&drm_minor_lock, flags);
> -	minor = idr_find(&drm_minors_idr, minor_id);
> +	minor = xa_load(&drm_minors_xa, minor_id);
>  	if (minor)
>  		drm_dev_get(minor->dev);
> -	spin_unlock_irqrestore(&drm_minor_lock, flags);

This is also not an exact equivalent as the dev_drm_get() is now outside
the lock.  Does that matter in this case?  I don't know the code well
enough to say.  If you want it to be equivalent, then:

	xa_lock(&drm_minors_xa);
	minor = xa_load(&drm_minors_xa, minor_id);
	if (minor)
		drm_dev_get(minor->dev);
	xa_unlock(&drm_minors_xa);

would be the code to use.

> @@ -1037,7 +1023,7 @@ static void drm_core_exit(void)
>  	unregister_chrdev(DRM_MAJOR, "drm");
>  	debugfs_remove(drm_debugfs_root);
>  	drm_sysfs_destroy();
> -	idr_destroy(&drm_minors_idr);
> +	xa_destroy(&drm_minors_xa);

I don't know if this is the right call.  xa_destroy() is the exact
replacement, but if the xarray should already be empty (and it should,
right?) then asserting the xa_empty() is true may be the better call
to make.


Phew, that was a lot of comments/questions.  I hope that was useful!
