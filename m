Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55054B462D3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 20:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EF710EC32;
	Fri,  5 Sep 2025 18:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ravnborg.org header.i=@ravnborg.org header.b="AeEd6qCU";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="FY2u5rVd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com
 (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0A610EC32
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 18:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1757098439;
 x=1757703239; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Rp8QvMDkqRWorfuh6XNKbpaQu3Sv/rPZIcu6CVHbFO4=;
 b=AeEd6qCUcN2/whahq4sGxJKJv7S1+QvKhPYb6F5TniwiLP6GLOPiy9xIJk+KZyArO3utSXXJrCrCn
 xnli0OmIygOeSLYYAIKCH3tfy48n5FdiP5BG6UOT+yVsHZI0BPpv4JBWJWiS9zMMoMTzlZYXl09kE+
 r4++Wj1mkr+rW8bXSIxUhAZVtGIhwBTajPTVWrQwY56P3bYxlnH9LpwNEanb3GoNkx7l9MjzMUW9FB
 dG5ZJAe+mBMSMBhyorNh9pYNUhVYoF9hRWX57Qi32BJHgA92UjKvL/OWN1vU/7qzVns20gXx+m2wz1
 Uy8JAtnm/OyiAGjoH5QDUJoRCpr2I1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1757098439;
 x=1757703239; d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Rp8QvMDkqRWorfuh6XNKbpaQu3Sv/rPZIcu6CVHbFO4=;
 b=FY2u5rVdT37ucKn4KYuYewbTUpwcg3M/MiBZr2aeIWoFIE2k7w6NRDUwSMpWSe0xksW6UNgo2yjFg
 7cqrqHkCQ==
X-HalOne-ID: addad8e8-8a89-11f0-87ea-632fe8569f3f
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id addad8e8-8a89-11f0-87ea-632fe8569f3f;
 Fri, 05 Sep 2025 18:53:59 +0000 (UTC)
Date: Fri, 5 Sep 2025 20:53:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] fbcon: Move fbcon callbacks into struct fbcon_bitops
Message-ID: <20250905185358.GA361827@ravnborg.org>
References: <20250818104655.235001-1-tzimmermann@suse.de>
 <20250818104655.235001-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818104655.235001-5-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Mon, Aug 18, 2025 at 12:36:39PM +0200, Thomas Zimmermann wrote:
> Depending on rotation settings, fbcon sets different callback
> functions in struct fbcon from within fbcon_set_bitops(). Declare
> the callback functions in the new type struct fbcon_bitops. Then
> only replace the single bitops pointer in struct fbcon.
> 
> Keeping callbacks in constant instances of struct fbcon_bitops
> makes it harder to exploit the callbacks. Also makes the code slightly
> easier to maintain.
> 
> For tile-based consoles, there's a separate instance of the bitops
> structure.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/core/bitblit.c   | 17 ++++---
>  drivers/video/fbdev/core/fbcon.c     | 67 +++++++++++++++-------------
>  drivers/video/fbdev/core/fbcon.h     |  7 ++-
>  drivers/video/fbdev/core/fbcon_ccw.c | 18 +++++---
>  drivers/video/fbdev/core/fbcon_cw.c  | 18 +++++---
>  drivers/video/fbdev/core/fbcon_ud.c  | 18 +++++---
>  drivers/video/fbdev/core/tileblit.c  | 16 ++++---
>  7 files changed, 94 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
> index a2202cae0691..267bd1635a41 100644
> --- a/drivers/video/fbdev/core/bitblit.c
> +++ b/drivers/video/fbdev/core/bitblit.c
> @@ -384,15 +384,18 @@ static int bit_update_start(struct fb_info *info)
>  	return err;
>  }
>  
> +static const struct fbcon_bitops bit_fbcon_bitops = {
> +	.bmove = bit_bmove,
> +	.clear = bit_clear,
> +	.putcs = bit_putcs,
> +	.clear_margins = bit_clear_margins,
> +	.cursor = bit_cursor,
> +	.update_start = bit_update_start,
> +};
> +
>  void fbcon_set_bitops(struct fbcon *confb)
>  {
> -	confb->bmove = bit_bmove;
> -	confb->clear = bit_clear;
> -	confb->putcs = bit_putcs;
> -	confb->clear_margins = bit_clear_margins;
> -	confb->cursor = bit_cursor;
> -	confb->update_start = bit_update_start;
> -	confb->rotate_font = NULL;
> +	confb->bitops = &bit_fbcon_bitops;
>  
>  	if (confb->rotate)
>  		fbcon_set_rotate(confb);

fbcon_set_rotate() is only used to set the correct bitops.

It would be simpler to just do

	if (confb->rotate)
		confb->bitops = fbcon_rotate_get_ops();

And rename fbcon_set_rotate() to fbcon_rotate_get_ops() and return the
pointer to the struct.

The no need to pass the struct, and it is obvious that the bitops are
overwritten.

	Sam

