Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A254877F7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 14:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F36A11AB5A;
	Fri,  7 Jan 2022 13:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD8611AB59;
 Fri,  7 Jan 2022 13:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641560890; x=1673096890;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VcIKE74w/UT5ER8m6tL8s4tMrZXJHh6ou1Acc4hPq6Q=;
 b=Z1eqW095za+QrFCNAz1OlTDxAmVDSXdTQ5XPQz5Cxbrn2Xo/cODESHfS
 DAe/GXuYjwJ3WwFXk0qQuHWrNb+sVWJN6hsC0pfgRWWW4ifVH2TaiEbQB
 TbLskKIA3cvzEkBL+78XDnnzhdSkd+aPePfPNYKHWzxOXpFH7Rd0smRPi
 mKpYoTRyrYKss+eTOODQWBK1+i7xbi/1igroDmo4jVy3k+3AV5wvsbofZ
 9BjSrGESw6fjjzwRMp2qS1CPni5GvvMEPjMFeNlDqUEo81LyQAul6DXve
 qMkl5qKmO/yE7WDHhJ1pOaeoglrt8mmtGi1sJq7DftpvVDe+bxXYXTu+8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="230203824"
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; d="scan'208";a="230203824"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 05:08:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; d="scan'208";a="513789182"
Received: from dgreerx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.24.206])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 05:08:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Boyd <swboyd@chromium.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 03/32] component: Move struct aggregate_device out to
 header file
In-Reply-To: <20220106214556.2461363-4-swboyd@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220106214556.2461363-1-swboyd@chromium.org>
 <20220106214556.2461363-4-swboyd@chromium.org>
Date: Fri, 07 Jan 2022 15:07:59 +0200
Message-ID: <87pmp3lmmo.fsf@intel.com>
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 06 Jan 2022, Stephen Boyd <swboyd@chromium.org> wrote:
> This allows aggregate driver writers to use the device passed to their
> probe/remove/shutdown functions properly instead of treating it as an
> opaque pointer.

You say it like having opaque pointers with interfaces instead of
exposed data is a bad thing.

Data is not an interface. IMO if you can get by with keeping the types
private, go for it. Unless I'm missing something, you only need the
parent dev pointer. Maybe add a helper function for it?

It's trivial to expose the guts like this, but it's usually a lot of
hard work to go the other way. Look at the dependencies of component.h
now. To keep it self-contained, i.e. buildable without implicit
dependencies, you'd need to add #include <device.h>, which goes on to
include the world. Then have a look at [1].

Please at least let's not do this lightly.


BR,
Jani.


[1] https://lwn.net/ml/linux-kernel/YdIfz+LMewetSaEB@gmail.com/


>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/base/component.c  | 15 ---------------
>  include/linux/component.h | 19 ++++++++++++++++---
>  2 files changed, 16 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/base/component.c b/drivers/base/component.c
> index eec82caeae5e..dc38a8939ae6 100644
> --- a/drivers/base/component.c
> +++ b/drivers/base/component.c
> @@ -56,21 +56,6 @@ struct component_match {
>  	struct component_match_array *compare;
>  };
>  
> -struct aggregate_device {
> -	const struct component_master_ops *ops;
> -	struct device *parent;
> -	struct device dev;
> -	struct component_match *match;
> -	struct aggregate_driver *adrv;
> -
> -	int id;
> -};
> -
> -static inline struct aggregate_device *to_aggregate_device(struct device *d)
> -{
> -	return container_of(d, struct aggregate_device, dev);
> -}
> -
>  struct component {
>  	struct list_head node;
>  	struct aggregate_device *adev;
> diff --git a/include/linux/component.h b/include/linux/component.h
> index 95d1b23ede8a..e99cf8e910f0 100644
> --- a/include/linux/component.h
> +++ b/include/linux/component.h
> @@ -5,6 +5,8 @@
>  #include <linux/stddef.h>
>  #include <linux/device.h>
>  
> +struct component_match;
> +
>  /**
>   * struct component_ops - callbacks for component drivers
>   *
> @@ -39,8 +41,6 @@ void component_del(struct device *, const struct component_ops *);
>  int component_bind_all(struct device *master, void *master_data);
>  void component_unbind_all(struct device *master, void *master_data);
>  
> -struct aggregate_device;
> -
>  /**
>   * struct component_master_ops - callback for the aggregate driver
>   *
> @@ -80,7 +80,20 @@ struct component_master_ops {
>  	void (*unbind)(struct device *master);
>  };
>  
> -struct component_match;
> +struct aggregate_device {
> +	const struct component_master_ops *ops;
> +	struct device *parent;
> +	struct device dev;
> +	struct component_match *match;
> +	struct aggregate_driver *adrv;
> +
> +	int id;
> +};
> +
> +static inline struct aggregate_device *to_aggregate_device(struct device *d)
> +{
> +	return container_of(d, struct aggregate_device, dev);
> +}
>  
>  /**
>   * struct aggregate_driver - Aggregate driver (made up of other drivers)

-- 
Jani Nikula, Intel Open Source Graphics Center
