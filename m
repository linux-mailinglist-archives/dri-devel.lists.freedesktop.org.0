Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8941A7BFA26
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 13:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3FE10E337;
	Tue, 10 Oct 2023 11:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA89710E33B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 11:46:01 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32337a39009so1340898f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 04:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1696938360; x=1697543160; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aiA4D11X2sFtXKvFj+BVZkBdxaJKzeEbh5cY8Yxytvg=;
 b=CfWkFQkNQFdEhzhIovWlC/gMyVZPvmXiKyt6pf/T8Yz3JeflvwGjcsczLUmGJUW6yQ
 yLxVWITS/8IwslfMbuSHdk3P7Xfac3Gh370SCVO6q0fF6V/QZYw4rHf5eGJcxfuK5/wY
 SLsY2VnzfG4GYo0tYaGG9vkcAZxU4wBGfKkr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696938360; x=1697543160;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aiA4D11X2sFtXKvFj+BVZkBdxaJKzeEbh5cY8Yxytvg=;
 b=gOTq5IWiFgjzkA0s4FKkbSmjpv9fBmep1o3u8C4NWCTkamD3rBa+uRgF/5x0FC1Mpx
 ydkbtHGEfUhtGnsougEQSJkI1thwa510NVo+UsuMmheTgyxGMaToPQjtYbqw+tMVLfS4
 4lvaaW35jXc5fDQIOuFBP6U/dRcTG8R+Er4AiTwUE/Jf1XxdQlY8W3QsCwmJpHp+PlHo
 h8LLxegFUZXcGTQWi2Q/Phdekk3Bfo3sZdaXQUwpXWb4+4mtRIfoxXDtdcbX1qoUc0SM
 7KA6D+U0Im4xrO1DkbdzEPvegfeqB40ytuWPZvjL5Evlavedan5RBN18y7V+AKDgm6ex
 Gftw==
X-Gm-Message-State: AOJu0YyhNe8SZ2uOgJR3MKtmh8ffrOlK657E38S9TAAheTY75pbo3GQi
 Mu15gOdbiv3AhUauhRXaXS0rmA==
X-Google-Smtp-Source: AGHT+IE4/UvRoJK4tGLVIxW4ixF9DbnO2siW/LMpb7C9C8dsXdtbYclfJKlYBA0WjLwnhm1UDv3LbA==
X-Received: by 2002:a5d:6909:0:b0:320:8f0:b93d with SMTP id
 t9-20020a5d6909000000b0032008f0b93dmr14892975wru.3.1696938360227; 
 Tue, 10 Oct 2023 04:46:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a5d6889000000b0031c52e81490sm12640936wru.72.2023.10.10.04.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 04:45:59 -0700 (PDT)
Date: Tue, 10 Oct 2023 13:45:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ondrej Zary <linux@zary.sk>
Subject: Re: [PATCH] video: fbdev: arkfb: fix possible object reference leak
Message-ID: <ZSU5dZJqd8CIFzM6@phenom.ffwll.local>
Mail-Followup-To: Ondrej Zary <linux@zary.sk>, Helge Deller <deller@gmx.de>,
 jiapeng.chong@linux.alibaba.com, linux-fbdev@vger.kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de,
 Zhang Shurong <zhang_shurong@foxmail.com>
References: <tencent_55C1A344A101B55762ECA6A6366D0B0F8C05@qq.com>
 <b9e51034-bc6c-81d8-39ef-9fc74fa09c62@gmx.de>
 <202310061634.02110.linux@zary.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310061634.02110.linux@zary.sk>
X-Operating-System: Linux phenom 6.5.0-1-amd64 
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
Cc: jiapeng.chong@linux.alibaba.com, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, javierm@redhat.com, tzimmermann@suse.de,
 Zhang Shurong <zhang_shurong@foxmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 06, 2023 at 04:34:01PM +0200, Ondrej Zary wrote:
> On Friday 06 October 2023, Helge Deller wrote:
> > On 10/5/23 09:01, Zhang Shurong wrote:
> > > Add missing pci_disable_device() in error path in ark_pci_probe().
> > 
> > Do you have this hardware and tested your patch?
> > I'm sure there is a reason, why "pci_disable_device()" was commented
> > out in the original submission in commit 681e14730c73c...
> 
> pci_disable_device() call is disabled in many fbdev drivers because
> calling it might prevent display from working.

Yeah I've recently hit some _really_ interesting regression report where
essentially fbdev driver and vgacon where managing the hardware
collaboratively. There's enormous amounts of "this shouldn't work like
that, but it is how it does" going on in old fbdev drivers, and what you
brought up is also what I immediately thought of.

This patch feels way too risky to me that we should apply it ...
-Sima

> 
> > 
> > Additionally I'm wondering why your patch doesn't show up in
> > the fbdev patchwork, although you added linux-fbdev mailing list.
> > Probably a vger issue.
> > 
> > Helge
> > 
> > 
> > > Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> > > ---
> > >   drivers/video/fbdev/arkfb.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
> > > index 60a96fdb5dd8..6c4e5065646f 100644
> > > --- a/drivers/video/fbdev/arkfb.c
> > > +++ b/drivers/video/fbdev/arkfb.c
> > > @@ -1064,7 +1064,7 @@ static int ark_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
> > >   err_dac:
> > >   	pci_release_regions(dev);
> > >   err_request_regions:
> > > -/*	pci_disable_device(dev); */
> > > +	pci_disable_device(dev);
> > >   err_enable_device:
> > >   	framebuffer_release(info);
> > >   	return rc;
> > > @@ -1085,7 +1085,7 @@ static void ark_pci_remove(struct pci_dev *dev)
> > >
> > >   		pci_iounmap(dev, info->screen_base);
> > >   		pci_release_regions(dev);
> > > -/*		pci_disable_device(dev); */
> > > +		pci_disable_device(dev);
> > >
> > >   		framebuffer_release(info);
> > >   	}
> > 
> > 
> 
> 
> 
> -- 
> Ondrej Zary

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
