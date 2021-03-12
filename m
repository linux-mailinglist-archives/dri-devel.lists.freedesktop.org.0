Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF47533888D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 10:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5E86F519;
	Fri, 12 Mar 2021 09:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499936F4FE
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 09:13:06 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id l2so15458937pgb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 01:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WZyIYp7HNe42hBBV3Gm6wAX0Jorv9kyyvyCRD58+4Sg=;
 b=J5sru662IvNuddv6OWE1fZdgQkO+ogREXmx+2NngPbKYj8UPqOHOyxfB3U6flgrzE7
 p90DwcIgR7yPFsRFEiGdcHBt0BzlDZVSq5U+wR1eAqHUgDvDAJu6A5bi/5R7eLCbJHN2
 n/x09WZuECLe6+iUbdwdNRIihiEM4EDUO/D1bdDeT4VhexC/bCWDxtHn5V+RkLNRzyuc
 ub8nlzvNslArVULONusd7Xf8i9fiLHzvBAvOieV+vS/3PPcnPRgwIGlgg0rNHKMqQRTM
 N1GfheU+ltqLaJl31d6YWF3f2D+Ivbh2XQitwB2jSfz7pb0jMn6Q7lhOzx6BuTcrEOtC
 /hhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WZyIYp7HNe42hBBV3Gm6wAX0Jorv9kyyvyCRD58+4Sg=;
 b=Zy/mhEDLIq5RiYR0rbejkljaOmmSMfuHiM1e/GjOpDjIBzD5Czl0DurU49bIe324VY
 VfgLUFr1Xg51POMoO9XG1MU43wTR7/gM0/VZzl52WyitRRfYzvnkWGAex5HpIZ1ETq6H
 VCK91lfv4wQ3sZiVeDZZc6Um800rbRxerm2eFOghvy+N+PdnvoSHF5X9NnCOrDizAMbl
 Cin3egsSpwyR7NgdU8jHuGFB1KeESb0Hw9ybaiQzCPhBZxvPad/cJ3f+dC6mG6FYQFeH
 D/BSFTvH9vxG6/9XQcX+0k5e2TRY4H8Qbx9hyFaebwOWOjWrIWpgmL2zrpqTMUrHuXqy
 sE+A==
X-Gm-Message-State: AOAM533+gHiuNgRAO5zPcQ7JOn0WrXiwgzA0/y+3z/y3IUttRTZjcGej
 lM5jYknXiStKy4rrKK6Beb0=
X-Google-Smtp-Source: ABdhPJx6yz/SXlXm2bIrQCxSesLGTNigjUzZaN0Eascp9+OvdwERN3gOFPs0aGbEx85BUyRJ3ss6kw==
X-Received: by 2002:a63:140b:: with SMTP id u11mr11009181pgl.436.1615540385869; 
 Fri, 12 Mar 2021 01:13:05 -0800 (PST)
Received: from ThinkCentre-M83 ([202.133.196.154])
 by smtp.gmail.com with ESMTPSA id y194sm4883674pfb.21.2021.03.12.01.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 01:13:05 -0800 (PST)
Date: Fri, 12 Mar 2021 17:13:02 +0800
From: Du Cheng <ducheng2@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers: video: fbcon: fix NULL dereference in
 fbcon_cursor()
Message-ID: <20210312091302.GA454062@ThinkCentre-M83>
References: <20210312081421.452405-1-ducheng2@gmail.com>
 <YEsoGqJypKUdPoR+@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YEsoGqJypKUdPoR+@kroah.com>
X-Mailman-Approved-At: Fri, 12 Mar 2021 09:25:15 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 syzbot+b67aaae8d3a927f68d20@syzkaller.appspotmail.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 12, 2021 at 09:36:42AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 12, 2021 at 04:14:21PM +0800, Du Cheng wrote:
> > add null-check on function pointer before dereference on ops->cursor
> > 
> > Reported-by: syzbot+b67aaae8d3a927f68d20@syzkaller.appspotmail.com
> > Signed-off-by: Du Cheng <ducheng2@gmail.com>
> > ---
> >  drivers/video/fbdev/core/fbcon.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index 44a5cd2f54cc..3406067985b1 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -1333,6 +1333,9 @@ static void fbcon_cursor(struct vc_data *vc, int mode)
> >  
> >  	ops->cursor_flash = (mode == CM_ERASE) ? 0 : 1;
> >  
> > +	if (!ops->cursor)
> > +		return;
> > +
> >  	ops->cursor(vc, info, mode, get_color(vc, info, c, 1),
> >  		    get_color(vc, info, c, 0));
> >  }
> > -- 
> > 2.27.0
> > 
> 
> Is this the same issue reported here:
> 	https://lore.kernel.org/r/20210307105642.112572-1-h.shahbazi.git@gmail.com
> 
> And has syzbot testing shown that this fix does solve the issue?
> 
> thanks,
> 
> greg k-h

Hi Greg,

I sent both my patch and that of shahbazi to syzbot to see if they resolve the
bug by the id b67aaae8d3a927f68d20.

I will keep you posted of the outcomes.

Regards,
Du Cheng
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
