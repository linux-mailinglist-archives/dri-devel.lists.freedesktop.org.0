Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F40803F83E7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 10:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D646E55C;
	Thu, 26 Aug 2021 08:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADE16E55C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 08:49:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so1707829wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 01:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YeOmq+WUoZEJToxOrrtfRYaO5WuPJc4okNIzqOKtUk8=;
 b=MzRr+4ND9e8yAxsG6UDQdCI8eKqkhzAB9yN9IpDtrZpK15uIAK00HxcSo3juHjNL16
 mOeqICqT1Bk9252Tbj3ZXw9V5I64p1P5jTflIABf9jUdV5/wsdEw/IVEX1fZpaw73iSo
 L2XqadsVf7VAXwkBpNJafTv/bWN9zU7WCf3uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YeOmq+WUoZEJToxOrrtfRYaO5WuPJc4okNIzqOKtUk8=;
 b=iCnAXOQW8BeKKSdYjMOx73T6xsjUDiCUhjYZn2NlXFJgAV4vS2ntNE9HGFJeaDe7qM
 klUCvB+1TnYvMbKed5BagfgOxeMUfQRmoDduGsMDqgRH96sezGcvwwhh67Omw1J77Ak7
 wjFe3FEpDTw4TZoGDwV5NUC+Jd44NDtHvHSsE5VRqn97gNkfmk7YrJWgsVmSLF7ZBOMr
 YhlB4/cr9sf7A/pl7C31pqSGt80a+ox4KjzW/g6llNcxPqGqO/85JQRiklC5bXu5lGOt
 PZhTu24gg1pQVqTPgO94IpTuEpxf/HAo73kd7mW9shMZJDbfm3P//l4UbT/HI9i2d+wp
 96OQ==
X-Gm-Message-State: AOAM530yPkIwQTKbgx/ZD+YGB6eIc/mBEJ0mr4lcszU8Wj85cF2m2Y7g
 tfw0jQVE1UcUKZRGZsjIjCdF2w==
X-Google-Smtp-Source: ABdhPJyP4nEP74chVJb3gK4NgI8XVs2PzaOvxBoiWgwn2jIVPFxvfGBRs2KsUu022Ox90DP5yDSpCw==
X-Received: by 2002:a7b:cb02:: with SMTP id u2mr13154653wmj.103.1629967762533; 
 Thu, 26 Aug 2021 01:49:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l18sm8795875wmc.30.2021.08.26.01.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 01:49:21 -0700 (PDT)
Date: Thu, 26 Aug 2021 10:49:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, airlied@gmail.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
Message-ID: <YSdVkNcKLG8j7uP/@phenom.ffwll.local>
References: <20210728130552.2074-1-christian.koenig@amd.com>
 <eebf6fc4-c299-6aa7-f91c-16029c5c3444@gmail.com>
 <3ad5188659ce362087db1980880ac47af60e639f.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ad5188659ce362087db1980880ac47af60e639f.camel@linux.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Mon, Aug 23, 2021 at 01:15:20PM +0200, Thomas Hellström wrote:
> On Mon, 2021-08-23 at 13:05 +0200, Christian König wrote:
> > Adding Thomas on CC as well.
> > 
> > Just a gentle ping. I think the patch set makes sense now.
> > 
> > Regards,
> > Christian.
> > 
> > Am 28.07.21 um 15:05 schrieb Christian König:
> > > Doing this in vmw_ttm_destroy() is to late.
> > > 
> > > It turned out that this is not a good idea at all because it leaves
> > > pointers
> > > to freed up system memory pages in the GART tables of the drivers.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 +++------
> > >   1 file changed, 3 insertions(+), 6 deletions(-)
> > > 
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

For next time around I think recording a bit more of the discussions and
git history in these would be really good. At least I'd like to get more
people ramped up on ttm work, and for that to work out things need to be a
bit more accessible ... The above commit message is pretty much useless if
you ever hit it in a git blame, if you haven't been involved in any of
these discussions.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
