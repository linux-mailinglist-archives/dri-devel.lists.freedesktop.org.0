Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9843247BCE1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 10:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD29F10F459;
	Tue, 21 Dec 2021 09:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CA710F453;
 Tue, 21 Dec 2021 09:30:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E32C3B81217;
 Tue, 21 Dec 2021 09:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FBBC36AE2;
 Tue, 21 Dec 2021 09:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640079001;
 bh=t9uG/PUzJfJCt5vq7qOvzQiuQHsRYBb+5hBgWJjQF8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MMrMbGrsqXDDJawxnYTgl5OlqV29ks8dDbYtGt+9DN7vpqfD5awhcaVrfIphjkLhR
 eCRBU9SysvivSe0EOauQNT2dECjbHZrp5OFoLLZrHfj5oxihlfsbp1jTAEj+M4zMa2
 qN4tkQlXtDx9JJihAZOgHkEn4Qjac7ihVzHqkY94=
Date: Tue, 21 Dec 2021 10:29:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 01/34] component: Introduce struct aggregate_device
Message-ID: <YcGel9PtOgqWH6l3@kroah.com>
References: <20211202222732.2453851-1-swboyd@chromium.org>
 <20211202222732.2453851-2-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202222732.2453851-2-swboyd@chromium.org>
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
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 02, 2021 at 02:26:59PM -0800, Stephen Boyd wrote:
> Replace 'struct master' with 'struct aggregate_device' and then rename
> 'master' to 'adev' everywhere in the code. While we're here, put a
> struct device inside the aggregate device so that we can register it
> with a bus_type in the next patch.
> 
> The diff is large but that's because this is mostly a rename, where
> sometimes 'master' is replaced with 'adev' and other times it is
> replaced with 'parent' to indicate that the struct device that was being
> used is actually the parent of the aggregate device and driver.
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
>  drivers/base/component.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/component.c b/drivers/base/component.c
> index 2d25a6416587..d25048d04b70 100644
> --- a/drivers/base/component.c
> +++ b/drivers/base/component.c
> @@ -9,6 +9,7 @@
>   */
>  #include <linux/component.h>
>  #include <linux/device.h>
> +#include <linux/idr.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
> @@ -63,7 +64,10 @@ struct master {
>  
>  	const struct component_master_ops *ops;
>  	struct device *parent;
> +	struct device dev;

Who initializes this new structure?

>  	struct component_match *match;
> +
> +	int id;
>  };
>  
>  struct component {
> @@ -79,6 +83,7 @@ struct component {
>  static DEFINE_MUTEX(component_mutex);
>  static LIST_HEAD(component_list);
>  static LIST_HEAD(masters);
> +static DEFINE_IDA(aggregate_ida);
>  
>  #ifdef CONFIG_DEBUG_FS
>  
> @@ -440,6 +445,7 @@ static void free_master(struct master *master)
>  		}
>  	}
>  
> +	ida_free(&aggregate_ida, master->id);
>  	kfree(master);
>  }
>  
> @@ -460,7 +466,7 @@ int component_master_add_with_match(struct device *parent,
>  	struct component_match *match)
>  {
>  	struct master *master;
> -	int ret;
> +	int ret, id;
>  
>  	/* Reallocate the match array for its true size */
>  	ret = component_match_realloc(match, match->num);
> @@ -471,9 +477,17 @@ int component_master_add_with_match(struct device *parent,
>  	if (!master)
>  		return -ENOMEM;
>  
> +	id = ida_alloc(&aggregate_ida, GFP_KERNEL);
> +	if (id < 0) {
> +		kfree(master);
> +		return id;
> +	}
> +
> +	master->id = id;
>  	master->parent = parent;
>  	master->ops = ops;
>  	master->match = match;
> +	dev_set_name(&master->dev, "aggregate%d", id);

You set the name yet the device is not "real"?

I don't understand this patch at all, sorry.

greg k-h
