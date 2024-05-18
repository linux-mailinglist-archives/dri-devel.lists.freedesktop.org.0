Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF308C91BE
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 19:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEDD10E150;
	Sat, 18 May 2024 17:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="blBBnYdT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5EE10E047
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 17:32:09 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1ee5235f5c9so38460605ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 10:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716053529; x=1716658329;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WMb7ysVjI0JLkMqGCgNqLzZAvSpQ0hbRLPRZoUvBT/g=;
 b=blBBnYdTlbYOV64KEDzPAp42g722kEtjZSJ9Sr4oGR0MsqC5wWHu628uj6m5kbfZ9w
 EpOQvKQDiOywIVbf3Eu00CygPcVTw0H8esuBNLqWvduxXTjZxx8NB7L6RJsYxZQ7wlTH
 Gkdf3/jliZa9oFig0PDRziev7FYhjFOwUqsDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716053529; x=1716658329;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WMb7ysVjI0JLkMqGCgNqLzZAvSpQ0hbRLPRZoUvBT/g=;
 b=kOf8ODZ4HIYZyCl3VWC09P3teFRZULfgQjuo8ylB0aVel06ePNE0YiJ2X5kYZwCcaJ
 YeUAFSKjF/pTji/yWCGWoTEdlzf1XQFPcSnbVRwKGiALE6DnHXgqunVtX2IJj5cxyGPG
 xGk3ghapRCC0jsJAFwHwYf3j1JXNVLarHPuLp3KWaeD2Y1qlS8DOefy7beIzrMpP9TFD
 SQLaKlItWT009P2LUsnTRZsBSTwVduaOgiwEb2lfMw+x8TFKGTk/wEGN+dJSKjo3WmMM
 cgRKszb4I0aVS0GcOgX/pZAfJ3TbZkpwXei3ID/J9EiHMGqOoveVoht8U3k7R0JfZmmD
 7nCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgC9qZD2oSJ4Bw5NHHtE/OKW4Ka1o9eH8B60ceyE49503gmGurYsnFWPXvf44rWhgATZWZ078Ff5UUj+s9SQAsH+YQJgULK4e+7s3Ttd90
X-Gm-Message-State: AOJu0YxHXMNGUA5o6k169xAm3Q9Zc/F4FhAcike6vckaNzyoYB8cF24h
 oo5gQk/V71WBbHRCwIH8clty6q7DiRUJsFPba95WuPix3+EW3phGjaPyjNNu/A==
X-Google-Smtp-Source: AGHT+IHDNO5ydpUr4NNY3Rpyki/cxqgkoUM/sFxM+xVFuU5eQst7LLOHqvPSrbMtdUDKPiyRRzxrWg==
X-Received: by 2002:a05:6a20:1590:b0:1af:939b:d477 with SMTP id
 adf61e73a8af0-1afde12444bmr30112347637.36.1716053529197; 
 Sat, 18 May 2024 10:32:09 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2af2bafsm16465777b3a.162.2024.05.18.10.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 10:32:08 -0700 (PDT)
Date: Sat, 18 May 2024 10:32:07 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Guenter Roeck <linux@roeck-us.net>, airlied@gmail.com, dakr@redhat.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com, javierm@redhat.com, kherbst@redhat.com,
 linux-kernel@vger.kernel.org, lyude@redhat.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, tzimmermann@suse.de,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/nouveau/nvif: Avoid build error due to potential
 integer overflows
Message-ID: <202405181020.2D0A364F@keescook>
References: <20240518143743.313872-1-linux@roeck-us.net>
 <34a6d812-b4ed-4465-b0ec-e641d185b9b1@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34a6d812-b4ed-4465-b0ec-e641d185b9b1@wanadoo.fr>
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

On Sat, May 18, 2024 at 06:54:36PM +0200, Christophe JAILLET wrote:
> (adding linux-hardening@vger.kernel.org)
> 
> 
> Le 18/05/2024 à 16:37, Guenter Roeck a écrit :
> > Trying to build parisc:allmodconfig with gcc 12.x or later results
> > in the following build error.
> > 
> > drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_mthd':
> > drivers/gpu/drm/nouveau/nvif/object.c:161:9: error:
> > 	'memcpy' accessing 4294967264 or more bytes at offsets 0 and 32 overlaps 6442450881 bytes at offset -2147483617 [-Werror=restrict]
> >    161 |         memcpy(data, args->mthd.data, size);
> >        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_ctor':
> > drivers/gpu/drm/nouveau/nvif/object.c:298:17: error:
> > 	'memcpy' accessing 4294967240 or more bytes at offsets 0 and 56 overlaps 6442450833 bytes at offset -2147483593 [-Werror=restrict]
> >    298 |                 memcpy(data, args->new.data, size);
> > 
> > gcc assumes that 'sizeof(*args) + size' can overflow, which would result
> > in the problem.
> > 
> > The problem is not new, only it is now no longer a warning but an error since W=1
> > has been enabled for the drm subsystem and since Werror is enabled for test builds.
> > 
> > Rearrange arithmetic and add extra size checks to avoid the overflow.
> > 
> > Fixes: a61ddb4393ad ("drm: enable (most) W=1 warnings by default across the subsystem")
> > Cc: Javier Martinez Canillas <javierm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > Cc: Jani Nikula <jani.nikula-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > Cc: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
> > Cc: Danilo Krummrich <dakr-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > Cc: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> > ---
> > checkpatch complains about the line length in the description and the (pre-existing)
> > assignlemts in if conditions, but I did not want to split lines in the description
> > or rearrange the code further.
> > 
> > I don't know why I only see the problem with parisc builds (at least so far).
> > 
> >   drivers/gpu/drm/nouveau/nvif/object.c | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
> > index 4d1aaee8fe15..baf623a48874 100644
> > --- a/drivers/gpu/drm/nouveau/nvif/object.c
> > +++ b/drivers/gpu/drm/nouveau/nvif/object.c
> > @@ -145,8 +145,9 @@ nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
> >   	u8 stack[128];
> >   	int ret;
> > -	if (sizeof(*args) + size > sizeof(stack)) {
> > -		if (!(args = kmalloc(sizeof(*args) + size, GFP_KERNEL)))
> > +	if (size > sizeof(stack) - sizeof(*args)) {
> > +		if (size > INT_MAX ||
> > +		    !(args = kmalloc(sizeof(*args) + size, GFP_KERNEL)))
> 
> Hi,
> 
> Would it be cleaner or better to use size_add(sizeof(*args), size)?

I think the INT_MAX test is actually better in this case because
nvif_object_ioctl()'s size argument is u32:

ret = nvif_object_ioctl(object, args, sizeof(*args) + size, NULL);
                                      ^^^^^^^^^^^^^^^^^^^^

So that could wrap around, even though the allocation may not.

Better yet, since "sizeof(*args) + size" is repeated 3 times in the
function, I'd recommend:

	...
	u32 args_size;

	if (check_add_overflow(sizeof(*args), size, &args_size))
		return -ENOMEM;
	if (args_size > sizeof(stack)) {
		if (!(args = kmalloc(args_size, GFP_KERNEL)))
			return -ENOMEM;
        } else {
                args = (void *)stack;
        }
	...
        ret = nvif_object_ioctl(object, args, args_size, NULL);

This will catch the u32 overflow to nvif_object_ioctl(), catch an
allocation underflow on 32-bits systems, and make the code more
readable. :)

-Kees

-- 
Kees Cook
