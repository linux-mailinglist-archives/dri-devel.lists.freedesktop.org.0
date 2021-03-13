Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2827E339A68
	for <lists+dri-devel@lfdr.de>; Sat, 13 Mar 2021 01:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3336E06E;
	Sat, 13 Mar 2021 00:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7F86E06E
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 00:23:07 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id e2so7415333pld.9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 16:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Mxl5wgTXm6WvIxF372O9LXWW67rnjxGwUZirXHXgwHc=;
 b=tpYAFAvWEPXXscwO3nwtTATA17r0kLGvvvTo7JgFyDsEnUg7ojfgpQmM8ClI71z4WH
 6sDdUVy/yyVQ738c3EUGesVs2VjAfUU+EdPMW2Df6rCCIiZs8M5A508W9dspllKSNGIk
 zU9TRjgM02ucD8O29/d2I1Gq3q7g8nUlFnsMWkyF4bDrHE4qT66JzI4CZap6B6Frgfnh
 uS+rGXah5YjQRF9wd7jT6GAtxHV7xMiWQD0YY2ZDXKwl69Rwy17mOY845hbW+W/L+P88
 XEbMybP2cPnOBhT6qOy68C8TAfXL+cYhG3TRbArAiHO1ntaeiceC07iCJv2TUROjXJEm
 NHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mxl5wgTXm6WvIxF372O9LXWW67rnjxGwUZirXHXgwHc=;
 b=thU5nvidBDB9524whkZbU0smstgtdGRVr2L9CNKugyC+V9nbscxuCnWeFBynHy00av
 dvddaIddfqixEKSh+JWe8QH3V1H5x8o8qt+b+eYvUAv7GU+Qbri50y+swQ3USRNjIYSH
 AqA6EcL7AK89UvtSEbRRpY+syqfe5x1J42y8QYS03wHsKhk9MkSYnCB+FEX8NKKrR4zX
 HfoAuGTrTuYkg+afSI7UEBJLlZOLw3AR4inmsHclg0BWdsQVRG7gshpTYv3VsTZkWKYt
 NqupC5j0B5IX6I9aYheaCcdpAG1zNoE1PR3gLXimE/SUkh43gVviX2lfon9lP4Dz36G8
 cptg==
X-Gm-Message-State: AOAM532osGMBu/AiQYg0ElrxlzytuiPYHjKcP+rPEQbNmR1XRdAkPKye
 q1yzvkKzvMN3lFg5SZMoT+I=
X-Google-Smtp-Source: ABdhPJzAMD5ppH8t4UOmXRRdh4rkE2E5C91n9H0bg/PBoAUpnhs9Df0Gye/XCmArV+Cq6FroB+Pkdw==
X-Received: by 2002:a17:90b:e08:: with SMTP id
 ge8mr849457pjb.130.1615594986787; 
 Fri, 12 Mar 2021 16:23:06 -0800 (PST)
Received: from ThinkCentre-M83 ([202.133.196.154])
 by smtp.gmail.com with ESMTPSA id z2sm6598454pfc.8.2021.03.12.16.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 16:23:06 -0800 (PST)
Date: Sat, 13 Mar 2021 08:23:03 +0800
From: Du Cheng <ducheng2@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers: video: fbcon: fix NULL dereference in
 fbcon_cursor()
Message-ID: <20210313002303.GA9569@ThinkCentre-M83>
References: <20210312081421.452405-1-ducheng2@gmail.com>
 <YEsoGqJypKUdPoR+@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YEsoGqJypKUdPoR+@kroah.com>
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

After syzbot testing at
https://syzkaller.appspot.com/bug?id=26567b12e74b8791e1db50da6039ee1705e5a7ed
the results showed that shahbazi's patch did not solve this bug, but my patch
passed the syzbot test.

Regards,
Du Cheng





_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
