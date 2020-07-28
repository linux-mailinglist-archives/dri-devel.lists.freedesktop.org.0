Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF4723129E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C90C6E39C;
	Tue, 28 Jul 2020 19:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C351889E52
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 12:50:24 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x12so6165100qtp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GgtMyjeO4HLpQBw/exS2AHiDSiKY8Aj2c/cuRUlzRaM=;
 b=tGdMuCgbBf+xUH44MOqwqObI23V3rvUFzUFZI/QjbU42CBRhT+wgaqwZjd+kldED/Q
 ki01CNPPE0cfaK1npzMluvdLLHCpwL7fueCxjK8z/Q5T/ADUxgNVkIE4jQGGxlZBkSyC
 rgNVakvPQRiTg3RM3l2UKUnlO+SZ21CLUor6vXSKVYvp21NE2OFHAhjboShkXKLD/aGH
 WLz9W94j70D1ynUHaVzpHD9eX2ZrJR2Zx/glrW3ICbYTos8ZHd0nJwTWLiZtOOK0vjGH
 rVAEGR7jE1neaho/frDgI5cLckZWRrb4jgz28e9aRtTGaSKlPRlz/nleXZGC9cgSpenP
 Q6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GgtMyjeO4HLpQBw/exS2AHiDSiKY8Aj2c/cuRUlzRaM=;
 b=amozFTunkWtYTs0pTH+A5yupOw40ceSEZlYXNaRqbNrWzUjWHEr6dpp0xK8b6k2ofA
 n/pVz3Z3cU+bjzegNEGNoY5nCflZ4HWjFKmK/0jYDW+qEr3JGD44C6KSn1SlrQY0qxeT
 rhbz1GDzGst+RPqXYvCDtNFYF6Yb3maE7il9SetUYLHwFsPsAqO540kplDKpyDxpKXk7
 D/CKvCyJn8POIS/C5zjusbaqTvGwYyZvacy1id1qgdT5XpNrBqSeX7iiFQHfFCkQN8qz
 UPbo9gJ+8jS7DEfnQovtIO/qK5wkvz7T1HLWMWHFQASoqINucO3EZd7wkvXRQpKLuLEk
 jzyQ==
X-Gm-Message-State: AOAM5306jxYDmg8247R+J2nY/WDoz9O6H30t228w9j87qmjyVIIWvRa8
 wFtTV8zlbJg2Olt8vW0c2A==
X-Google-Smtp-Source: ABdhPJxtmQcEAy5Fs04CmF0q3XaPWDqDwnhC4OEWLtN3cKQJP31ESmu5OAHSU7gHukiYE7G/FcVVeQ==
X-Received: by 2002:ac8:73d9:: with SMTP id v25mr13958369qtp.82.1595940623774; 
 Tue, 28 Jul 2020 05:50:23 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id c70sm20373613qke.109.2020.07.28.05.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 05:50:23 -0700 (PDT)
Date: Tue, 28 Jul 2020 08:50:21 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] drm/bufs: Prevent
 kernel-infoleak in copy_one_buf()
Message-ID: <20200728125021.GA409978@PWN>
References: <20200728014343.341303-1-yepeilin.cs@gmail.com>
 <20200728115210.408486-1-yepeilin.cs@gmail.com>
 <3058d741282b463d8aa7c8aff62e4326@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3058d741282b463d8aa7c8aff62e4326@AcuMS.aculab.com>
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 12:35:17PM +0000, David Laight wrote:
> From: Peilin Ye
> > Sent: 28 July 2020 12:52
> > Currently `struct drm_buf_desc` is defined as follows:
> > 
> > struct drm_buf_desc {
> > 	int count;
> > 	int size;
> > 	int low_mark;
> > 	int high_mark;
> > 	enum {
> > 		_DRM_PAGE_ALIGN = 0x01,
> > 		_DRM_AGP_BUFFER = 0x02,
> > 		_DRM_SG_BUFFER = 0x04,
> > 		_DRM_FB_BUFFER = 0x08,
> > 		_DRM_PCI_BUFFER_RO = 0x10
> > 	} flags;
> > 	unsigned long agp_start;
> > };
> > 
> > copy_one_buf() is potentially copying uninitialized kernel stack memory
> > to userspace, since the compiler may leave such "holes" (around `.flags`
> > and `.agp_start` fields) in this statically allocated structure. Prevent
> > it by initializing `v` with memset().
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> > Change in v2:
> >     - Improve commit description. (Suggested by Arnd Bergmann
> >       <arnd@arndb.de>)
> > 
> >  drivers/gpu/drm/drm_bufs.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> > index a0735fbc144b..f99cd4a3f951 100644
> > --- a/drivers/gpu/drm/drm_bufs.c
> > +++ b/drivers/gpu/drm/drm_bufs.c
> > @@ -1349,10 +1349,14 @@ static int copy_one_buf(void *data, int count, struct drm_buf_entry *from)
> >  {
> >  	struct drm_buf_info *request = data;
> >  	struct drm_buf_desc __user *to = &request->list[count];
> > -	struct drm_buf_desc v = {.count = from->buf_count,
> > -				 .size = from->buf_size,
> > -				 .low_mark = from->low_mark,
> > -				 .high_mark = from->high_mark};
> > +	struct drm_buf_desc v;
> > +
> > +	memset(&v, 0, sizeof(v));
> > +
> > +	v.count = from->buf_count;
> > +	v.size = from->buf_size;
> > +	v.low_mark = from->low_mark;
> > +	v.high_mark = from->high_mark;
> > 
> >  	if (copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags)))
> >  		return -EFAULT;
> 
> The memset() isn't needed.
> The copy_to_user() stops after the 4 'int' values so no 'random'
> kernel stack can get copied.

You are right, I overlooked that. Thank you for pointing this out!

Peilin Ye

> Quite why it is 'right' to leave the remaining part of each
> userspace structure unchanged is another matter.
> 
> 	David.
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
