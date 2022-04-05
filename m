Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440644F3ED8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 22:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279BE10EDF6;
	Tue,  5 Apr 2022 20:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1B410ED42
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 20:54:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j12so306313wrb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 13:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=9NHEHnuZ3EwIt6oRfVHzwUDeTZ1Be9ZvXyD0BUY2xlM=;
 b=dMIxaOA+PwGmGbUBgSF+BtNgTUc4RKGxiEJxcOGGW41WPS35KSWlB4hv7i4DbpxOGC
 ZH1S+U4+vSggXY1XAGmMMGqiGDAAFbM1TiIfR+O950jkhP22hrN5zpqEUFn8ZJUif7W1
 UT9mutnETTYpsxdjQi923ezsNRj0CTq+AgkAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=9NHEHnuZ3EwIt6oRfVHzwUDeTZ1Be9ZvXyD0BUY2xlM=;
 b=ey33IinxNLZEI63wzGpSw6kHYmVRn/V6GYgiPhGImEoHQAVVjA1z+ios9Mu5/+ECRr
 k24eetZU3feX0fUghGYiSNNA9MC1OLgEfeZ2dhc3Y97EueMJe24ASLEUE7s8+//4YFbv
 GjoE53Mnay0ArzyP+yD3qrDlrbaovvu5iF0Kl+vJVWEgESS0vuVuacwtZTn7+Sja89x9
 lc2XPNN0EA/WgIYj5/+qf6C+LW7mIZ6yh77SfpCG0S3I8X+krtmkfgbqZuQREjLigsEa
 xB9rzNAUDW4wWcY0R24EDy4u5Bo4mI9+3mawRBsI16wD9gevmDh2csvb19Bei1NkaNzT
 FcwA==
X-Gm-Message-State: AOAM5309x2HJcN+93+ydtAmOi/fRYdAUDVSzGCawSxoActrayIBeQv/q
 lsBS+czKC0bMZvlQqvI8LGINTg==
X-Google-Smtp-Source: ABdhPJyhXpgIjQQcv0SKxB4ADopYBn4Ma33nCG5hGhtlwq04P9w9qJQ0mEskhuSP+q2j89By5mUeGg==
X-Received: by 2002:adf:f24d:0:b0:206:96b:4ea1 with SMTP id
 b13-20020adff24d000000b00206096b4ea1mr4059467wrp.694.1649192093853; 
 Tue, 05 Apr 2022 13:54:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s1-20020adfb781000000b002060d4a8bd9sm8008923wre.17.2022.04.05.13.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 13:54:53 -0700 (PDT)
Date: Tue, 5 Apr 2022 22:54:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH v2 06/19] fbcon: Use delayed work for cursor
Message-ID: <Ykysm3EJd3XLrzyr@phenom.ffwll.local>
Mail-Followup-To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Claudio Suarez <cssk@net-c.es>, Du Cheng <ducheng2@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-7-daniel.vetter@ffwll.ch>
 <7f6d61f4-042f-8c9d-23ed-da6f1dcb20d0@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f6d61f4-042f-8c9d-23ed-da6f1dcb20d0@I-love.SAKURA.ne.jp>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Du Cheng <ducheng2@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 08:43:36PM +0900, Tetsuo Handa wrote:
> On 2022/02/09 6:08, Daniel Vetter wrote:
> > @@ -714,6 +700,8 @@ static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
> >  		ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
> >  		if (!ops)
> >  			err = -ENOMEM;
> > +
> > +		INIT_DELAYED_WORK(&ops->cursor_work, fb_flashcursor);
> >  	}
> >  
> >  	if (!err) {
> 
> Memory allocation fault injection will hit NULL pointer dereference.

The error handling here is convoluted and I got this wrong, but a later
patch to extract an fbcon_open() helper fixes it. I'll fix this small
bisect issue for v3 anyway, thanks for taking a look at the patches.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
