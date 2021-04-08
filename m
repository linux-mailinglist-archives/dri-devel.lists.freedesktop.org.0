Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336F235812C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 12:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562176EA87;
	Thu,  8 Apr 2021 10:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A63C6EA87
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 10:53:29 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j5so656198wrn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 03:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OBM1JnxONgzGFkr4ut7M8W7VWeQp4Tx5cMKl44jxVZg=;
 b=W1ie1LtSsXfd8qNPqE0euaZd9TYiLWF93YdHLJFlk4dgw3QvqltUpZfwgk34WS1Rjl
 eXkCtR4qHhLKkIXUOLz7q5SJnIQqelbTt04EH3VAKUvdDdHyxXfnv/n4LBo86MWCXTLF
 E5Y9qJ1JwKzvm8qJ3gJUGUA5YBgk0zTHabC5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OBM1JnxONgzGFkr4ut7M8W7VWeQp4Tx5cMKl44jxVZg=;
 b=sVs5s1T/voMe5J+ac//fl9suWti6pPUj5Qj5UlXW8fdjcRwefaXDuNFA8naY45cYyL
 H3+CXz0oaJ/BoO7vncH7dBjUCFVzjN4GJ0C+eDxOy0Z7SzZDfSfqakJX56NomN0A7vh2
 gqlSTTNTDGWOWdYKAoMd1T/nQJZY8SuDu2i+t5Oj3JwXjdGt72t88NC3rZaVlKEJMkTU
 u+SHY4VB7JS9F1/r2Yd6GBzttS35GUgAtAXa5iOwXmasjxS1UeieZ9td1M75utYQ5fXO
 oIHdsAp/qgY+Lx/ZIovZaadLJaugA95VJvQWVAQfYBelXBlv8pLw87lPI7c2DwJCBZ2e
 aXXw==
X-Gm-Message-State: AOAM5331PI/PWugOSedv8st3b1o/399Stx0o2/pKJF3Kz4pBsX/Ebm6H
 EfHo+4cTTHPP5QjRgDdrkEiCMA==
X-Google-Smtp-Source: ABdhPJzoX0pzx4X75LrEk1/KMhWdkeBcpuldBytOXUY2TkaaJgb7rmKP+Jqn1Okk/9gkt635bgOwUg==
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr10204998wrw.331.1617879207815; 
 Thu, 08 Apr 2021 03:53:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z1sm28651471wrs.89.2021.04.08.03.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 03:53:27 -0700 (PDT)
Date: Thu, 8 Apr 2021 12:53:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] drm: xlnx: zynqmp: fix a memset in zynqmp_dp_train()
Message-ID: <YG7gpWgz/AYIj+Hd@phenom.ffwll.local>
References: <YGLwCBMotnrKZu6P@mwanda>
 <abae16c0-6d76-f78f-133c-0a0d54bc60a9@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abae16c0-6d76-f78f-133c-0a0d54bc60a9@xilinx.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 07, 2021 at 12:17:49PM +0200, Michal Simek wrote:
> 
> 
> On 3/30/21 11:31 AM, Dan Carpenter wrote:
> > The dp->train_set[] for this driver is only two characters, not four so
> > this memsets too much.  Fortunately, this ends up corrupting a struct
> > hole and not anything important.
> > 
> > Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index 99158ee67d02..59d1fb017da0 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -866,7 +866,7 @@ static int zynqmp_dp_train(struct zynqmp_dp *dp)
> >  		return ret;
> >  
> >  	zynqmp_dp_write(dp, ZYNQMP_DP_SCRAMBLING_DISABLE, 1);
> > -	memset(dp->train_set, 0, 4);
> > +	memset(dp->train_set, 0, sizeof(dp->train_set));
> >  	ret = zynqmp_dp_link_train_cr(dp);
> >  	if (ret)
> >  		return ret;
> > 
> 
> Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Stuffed into drm-misc-next, thanks.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
