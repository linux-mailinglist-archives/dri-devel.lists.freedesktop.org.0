Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6247D7F41
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 11:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E8410E783;
	Thu, 26 Oct 2023 09:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36ABA10E788
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 09:04:06 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4079ed65471so5006375e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698311044; x=1698915844; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4l+2Rs7C7x9u0N7SLFEtVHo7I01QW3h5/pshwo3pB28=;
 b=TGVSiW+QZAD/+8CBuwiJl1qLgHwFYeW6i7Fh/joJmwB2/M3vsKGtHtqAWhLoXsiMBN
 fi5jZFQ/i3kafd4NvlUEBd47ZfipQh/camRksZT2fjGCzLmYZVE/bO7eao9WVqsjHAgQ
 XClwA0MZ/czvdKjEbTbtRnYHYvpaF0+Prj8qexmaZO09U3OgKUhgZ9OaMbHc0ISoiHyR
 npTXgDngqrzewsmkqdGqGeIpA0a91KmaDt7s1Fru+9rAGujQ06XeOv+OFzTP7L5H7Ppl
 6+vMoJ9PRouJ98sgudDysjotO53iQr18XgeeIada3nRG0u2jYoY9EoHhzOZJMxYLBpqx
 J1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698311044; x=1698915844;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4l+2Rs7C7x9u0N7SLFEtVHo7I01QW3h5/pshwo3pB28=;
 b=bTLeW/PvkoP1q8OVyQILtKgZsi2uEHKd7jsqJqo8Gp5HcZA5/Ug1nIzsVpV2kC5KZ1
 f+5Ssh+0XNA8/tkdKJrIpWKopF6rusiS3su8fe3WAiDw/5VFyU9Gsfm6/KednfHuc5Uk
 A3iWvXVleViCvB5c0e+P+YAbHbbABeqrWYDtJF6hp8As4Y8J1uJDUAGfkNl+c9kzeIc3
 e0WsEboXfD63bQBh7ShTbaMC+tU4gQ2Jer8nNBBh9OrbaXUzp8mls+oBe8uNlsWjEDzj
 qIdxa1izd8M6XqxH2g/b1nwvHOKsutnxgG4hb0Xef42eNP0v26Ah8iUd/IPxUuA5fj3p
 LATw==
X-Gm-Message-State: AOJu0Yy5+MpJHPHQq1wS7FOgB8OfbX5G/AN+6+w/w3v89ua9SHWhiFnC
 RLozlBkv5Qqi6qYwZOYecx55kg==
X-Google-Smtp-Source: AGHT+IG8hSkFGo9COVTu/+5Jxw+21cZ8QP5ccxewFjEgxFfeOWN7uvJ1RwUqTZdRpeNw0xm000OrMA==
X-Received: by 2002:a05:600c:3b0f:b0:406:44e6:c00d with SMTP id
 m15-20020a05600c3b0f00b0040644e6c00dmr14858423wms.2.1698311044570; 
 Thu, 26 Oct 2023 02:04:04 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f21-20020a05600c43d500b00401bbfb9b2bsm990772wmn.0.2023.10.26.02.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:04:04 -0700 (PDT)
Date: Thu, 26 Oct 2023 12:04:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] vga_switcheroo: Fix impossible judgment condition
Message-ID: <06e868cb-f96e-46af-9484-a613de0baaaf@kadam.mountain>
References: <4ec2b80b-f042-4abf-b799-0a9ef364f0fa@kadam.mountain>
 <54d21280-6e1e-780c-372d-d630630a4fe9@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54d21280-6e1e-780c-372d-d630630a4fe9@nfschina.com>
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
Cc: tzimmermann@suse.de, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org, Jim.Qu@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 26, 2023 at 04:46:29PM +0800, Su Hui wrote:
> On 2023/10/26 12:44, Dan Carpenter wrote:
> > On Thu, Oct 26, 2023 at 10:10:57AM +0800, Su Hui wrote:
> > > 'id' is enum type like unsigned int, so it will never be less than zero.
> > > 
> > > Fixes: 4aaf448fa975 ("vga_switcheroo: set audio client id according to bound GPU id")
> > > Signed-off-by: Su Hui <suhui@nfschina.com>
> > > ---
> > >   drivers/gpu/vga/vga_switcheroo.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
> > > index 365e6ddbe90f..d3064466fd3a 100644
> > > --- a/drivers/gpu/vga/vga_switcheroo.c
> > > +++ b/drivers/gpu/vga/vga_switcheroo.c
> > > @@ -375,7 +375,7 @@ int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
> > >   	mutex_lock(&vgasr_mutex);
> > >   	if (vgasr_priv.active) {
> > >   		id = vgasr_priv.handler->get_client_id(vga_dev);
> > > -		if (id < 0) {
> > > +		if ((int)id < 0) {
> > Hi,
> > 
> > I feel like you're using Smatch?  Which is great!  Fantastic!
> Yep, Smatch helps me  a lot to find these bugs! I really like this excellent
> tool!
> > 
> > Have you built the cross function database?  If you have there is a
> > command that's useful.
> Not yet, bu I want to build this.

Yeah.  It's super useful for kernel development.  It helps to understand
how functions are called and where variables are set etc.  The smatch
documentation is crap, I know.  But I did write a short blog about the
cross function DB.

https://staticthinking.wordpress.com/2023/05/02/the-cross-function-db/

It's simple to build, but it takes a long time.  Just run
smatch_scripts/build_kernel_data.sh

regards,
dan carpenter

