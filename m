Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CDAB93D78
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 03:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5582F10E093;
	Tue, 23 Sep 2025 01:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="lvjxcrcj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6169410E093
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type; bh=PqEYUudwG18jHMViGLX/jZq1TAjXJhfWsdIZilzljnk=;
 b=lvjxcrcjr4Vpxk9cLwZBp33jsJzsOaMgA98UdPTdegAAvpWFzXIs+FiJo37HRI
 iv7b32cfDz5FgzvUjb9VMPF57VBrskT9SxDw0uYgyscshgiL9L0lNez9kUByoZex
 pC3c3W3y6+CCV/Hyyrf8Xn7kMvumCXPLXAGTLNf3t+oJA=
Received: from localhost (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnN4th99FosHheDA--.434S2;
 Tue, 23 Sep 2025 09:26:58 +0800 (CST)
Date: Tue, 23 Sep 2025 09:26:57 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jani.nikula@linux.intel.com, samasth.norway.ananda@oracle.com,
 simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 George Kennedy <george.kennedy@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Shixiong Ou <oushixiong@kylinos.cn>, Kees Cook <kees@kernel.org>,
 stable@vger.kernel.org, Zsolt Kajtar <soci@c64.rulez.org>
Subject: Re: [PATCH] fbcon: Fix OOB access in font allocation
Message-ID: <aNH3YWKc7ZF7-clL@debian.debian.local>
References: <20250922134619.257684-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250922134619.257684-1-tzimmermann@suse.de>
X-CM-TRANSID: _____wDnN4th99FosHheDA--.434S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kry8GF1rtFWDuw4fXr1kZrb_yoW5JFyrpF
 WUGF13Wrs5tw43Ga1jgrWDZFy8Ww1kJryjgay2g3W5Zr9agwnxW34jkFWYga4fCr1DCry0
 yFyqqFya9as8uFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UcvtZUUUUU=
X-Originating-IP: [60.166.103.111]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiER7RamjR73-r6wAAsd
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

On Mon, Sep 22, 2025 at 03:45:54PM +0200, Thomas Zimmermann wrote:
> Commit 1a194e6c8e1e ("fbcon: fix integer overflow in fbcon_do_set_font")
> introduced an out-of-bounds access by storing data and allocation sizes
> in the same variable. Restore the old size calculation and use the new
> variable 'alloc_size' for the allocation.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 1a194e6c8e1e ("fbcon: fix integer overflow in fbcon_do_set_font")
> Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15020
> Cc: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: George Kennedy <george.kennedy@oracle.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Helge Deller <deller@gmx.de>
> Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Qianqiang Liu <qianqiang.liu@163.com>
> Cc: Shixiong Ou <oushixiong@kylinos.cn>
> Cc: Kees Cook <kees@kernel.org>
> Cc: <stable@vger.kernel.org> # v5.9+
> Cc: Zsolt Kajtar <soci@c64.rulez.org>
> ---
>  drivers/video/fbdev/core/fbcon.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 5fade44931b8..c1c0cdd7597c 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2518,7 +2518,7 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
>  	unsigned charcount = font->charcount;
>  	int w = font->width;
>  	int h = font->height;
> -	int size;
> +	int size, alloc_size;
>  	int i, csum;
>  	u8 *new_data, *data = font->data;
>  	int pitch = PITCH(font->width);
> @@ -2551,10 +2551,10 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
>  		return -EINVAL;
>  
>  	/* Check for overflow in allocation size calculation */
> -	if (check_add_overflow(FONT_EXTRA_WORDS * sizeof(int), size, &size))
> +	if (check_add_overflow(FONT_EXTRA_WORDS * sizeof(int), size, &alloc_size))
>  		return -EINVAL;
>  
> -	new_data = kmalloc(size, GFP_USER);
> +	new_data = kmalloc(alloc_size, GFP_USER);
>  
>  	if (!new_data)
>  		return -ENOMEM;
> -- 
> 2.51.0

Reviewed-by: Qianqiang Liu <qianqiang.liu@163.com>

-- 
Best,
Qianqiang Liu

