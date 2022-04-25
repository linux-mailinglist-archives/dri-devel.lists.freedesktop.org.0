Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CF550E779
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 19:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2904910EE57;
	Mon, 25 Apr 2022 17:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7218E10EE75
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=wLUmUeHVyJX9afsutX3xLdFQV+vAlD5FZapuJ+ZSqgI=;
 b=JmMQHZDt456dDRO3ht2PPyuSljzBpy4RYLU/ZUXX01/1lS1LPy/mkQGtsl8SM6PzEUzw3MVrED1di
 WA0RINPw7vZ0hH1RP/1OwKOLSsyuModUhEaWBnZUnwUFQ7+eJ7uTQub2naU2aV9BjoksQktzzPNt3H
 5W2zKNmFDIAwY2MAjS3QOdMjLDNmlte/DxFPvgO6irbM3WfSzc8gCeGLEdy+Mz+avxhMuYzSDnxNVr
 BxHGj8/C7kPNpjRpWZ+ulvXojtK6+LWTUFdqrh0IUn2PPeNhXvMlvCVhkiH79/M4VQ5uubDdyo5n1Z
 zd3RF/pEalj36qaYlVazJ/BweLj3KVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=wLUmUeHVyJX9afsutX3xLdFQV+vAlD5FZapuJ+ZSqgI=;
 b=VxDRTx3fkE5BJbSS846w6+epT06MYLAASTua0OfWOi7eiFwBVzY+42wcBt8c1MD67sVPWQOP6gHFA
 6t0e3SfDA==
X-HalOne-Cookie: aa683d150876407bc5e03b6084f90a79eaae35b0
X-HalOne-ID: b2a720be-c4bf-11ec-a907-d0431ea8a290
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id b2a720be-c4bf-11ec-a907-d0431ea8a290;
 Mon, 25 Apr 2022 17:46:55 +0000 (UTC)
Date: Mon, 25 Apr 2022 19:46:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/3] fbdev: Put mmap for deferred I/O into drivers
Message-ID: <Ymbejo2702tUUyNW@ravnborg.org>
References: <20220425112751.25985-1-tzimmermann@suse.de>
 <20220425112751.25985-2-tzimmermann@suse.de>
 <YmbZyI0kVzLo2gR6@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmbZyI0kVzLo2gR6@ravnborg.org>
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
Cc: airlied@linux.ie, linux-fbdev@vger.kernel.org, deller@gmx.de,
 dri-devel@lists.freedesktop.org, javierm@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Apr 25, 2022 at 07:26:32PM +0200, Sam Ravnborg wrote:
> Hi Thomas,
> 
> > diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> > index 6aaf6d0abf39..6924d489a289 100644
> > --- a/drivers/video/fbdev/core/fb_defio.c
> > +++ b/drivers/video/fbdev/core/fb_defio.c
> > @@ -181,6 +181,7 @@ int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
> >  	vma->vm_private_data = info;
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(fb_deferred_io_mmap);
> >  
> >  /* workqueue callback */
> >  static void fb_deferred_io_work(struct work_struct *work)
> > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > index 84427470367b..52440e3f8f69 100644
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -1334,7 +1334,6 @@ static int
> >  fb_mmap(struct file *file, struct vm_area_struct * vma)
> >  {
> >  	struct fb_info *info = file_fb_info(file);
> > -	int (*fb_mmap_fn)(struct fb_info *info, struct vm_area_struct *vma);
> >  	unsigned long mmio_pgoff;
> >  	unsigned long start;
> >  	u32 len;
> > @@ -1343,14 +1342,7 @@ fb_mmap(struct file *file, struct vm_area_struct * vma)
> >  		return -ENODEV;
> >  	mutex_lock(&info->mm_lock);
> >  
> > -	fb_mmap_fn = info->fbops->fb_mmap;
> > -
> > -#if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
> > -	if (info->fbdefio)
> > -		fb_mmap_fn = fb_deferred_io_mmap;
> > -#endif
> > -
> > -	if (fb_mmap_fn) {
> > +	if (info->fbops->fb_mmap) {
> >  		int res;
> >  
> >  		/*
> > @@ -1358,11 +1350,18 @@ fb_mmap(struct file *file, struct vm_area_struct * vma)
> >  		 * SME protection is removed ahead of the call
> >  		 */
> >  		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> > -		res = fb_mmap_fn(info, vma);
> > +		res = info->fbops->fb_mmap(info, vma);
> >  		mutex_unlock(&info->mm_lock);
> >  		return res;
> >  	}
> >  
> > +	/*
> > +	 * FB deferred I/O wants you to handle mmap in your drivers. At a
> > +	 * minimum, point struct fb_ops.fb_mmap to fb_deferred_io_mmap().
> > +	 */
> > +	if (dev_WARN_ONCE(info->dev, info->fbdefio, "fbdev mmap not set up for defered I/O.\n"))
> > +		return -ENODEV;
> > +
> 
> If not configured - then why not just call fb_deferred_io_mmap(), as
> this seems to be the default implementation anyway.
> Then drivers that needs it can override - and the rest fallback to the
> default.

Just to be clear - I already read:
"
Leave the mmap handling to drivers and expect them to call the
helper for deferred I/O by thmeselves.
"

But this does not help me understand why we need to explicit do what
could be a simple default implementation.
Chances are that I am stupid and it is obvious..

	Sam
