Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8404B1759
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 22:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C0D10E958;
	Thu, 10 Feb 2022 21:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C27E10E958
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 21:00:36 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 85c0f381-8ab4-11ec-baa1-0050568c148b;
 Thu, 10 Feb 2022 21:00:48 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id B9438194B34;
 Thu, 10 Feb 2022 22:00:32 +0100 (CET)
Date: Thu, 10 Feb 2022 22:00:29 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] fbdev/defio: Early-out if page is already enlisted
Message-ID: <YgV87ejpzGkSMNop@ravnborg.org>
References: <20220210141111.5231-1-tzimmermann@suse.de>
 <20220210141111.5231-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210141111.5231-2-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, bernie@plugable.com,
 noralf@tronnes.org, andriy.shevchenko@linux.intel.com, jayalk@intworks.biz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Feb 10, 2022 at 03:11:11PM +0100, Thomas Zimmermann wrote:
> Return early if a page is already in the list of dirty pages for
> deferred I/O. This can be detected if the page's list head is not
> empty. Keep the list head initialized while the page is not enlisted
> to make this work reliably.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/core/fb_defio.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> index a591d291b231..3727b1ca87b1 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -59,6 +59,7 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
>  		printk(KERN_ERR "no mapping available\n");
>  
>  	BUG_ON(!page->mapping);
> +	INIT_LIST_HEAD(&page->lru);
>  	page->index = vmf->pgoff;
>  
>  	vmf->page = page;
> @@ -122,17 +123,19 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
>  	 */
>  	lock_page(page);
>  
> +	/*
> +	 * This check is to catch the case where a new process could start
> +	 * writing to the same page through a new pte. this new access
> +	 * can cause the mkwrite even when the original ps's pte is marked
> +	 * writable.
> +	 */
When moving this comment it would be prudent to also fix the wording a
bit.
- Capital in start of sentence and after a period
- Spell out process and do not shorten ps


> +	if (!list_empty(&page->lru))
> +		goto page_already_added;
> +

This check says that if the page already has something in the parge->lru
then this is added by defio and thus is already added.
This matches your commit description - OK.

Maybe add something like:
* Pages added will have their lru set, and it is clered again in the
* deferred work handler.



>  	/* we loop through the pagelist before adding in order
>  	to keep the pagelist sorted */
>  	list_for_each_entry(cur, &fbdefio->pagelist, lru) {
> -		/* this check is to catch the case where a new
> -		process could start writing to the same page
> -		through a new pte. this new access can cause the
> -		mkwrite even when the original ps's pte is marked
> -		writable */
> -		if (unlikely(cur == page))
> -			goto page_already_added;
> -		else if (cur->index > page->index)
> +		if (cur->index > page->index)
>  			break;
>  	}
>  
> @@ -194,7 +197,7 @@ static void fb_deferred_io_work(struct work_struct *work)
>  
>  	/* clear the list */
>  	list_for_each_safe(node, next, &fbdefio->pagelist) {
> -		list_del(node);
> +		list_del_init(node);
>  	}
>  	mutex_unlock(&fbdefio->lock);
>  }

With the comment adjusted as you see fit
Acked-by: Sam Ravnborg <sam@ravnborg.org>
