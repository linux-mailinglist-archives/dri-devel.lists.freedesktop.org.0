Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CFF4A8417
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 13:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0AD10F62A;
	Thu,  3 Feb 2022 12:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD1110F62B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 12:51:58 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a13so4828670wrh.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 04:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=FUPIfszd+Y3hE4MXZ9LvXmC172Tu1YsDIDX0pVslV88=;
 b=SJbg68NvUvUz6JlqQSaxOonhT4mAOvcKWl24+3aeEkN/C1Eq4jUsGwuuNVnT5r4ShQ
 S4CCpbZnnReNr3hL8OgVf8+pJQP8m0GXazEV2XbfsHcM1B0QmoGYx8H2/uxUKFWlCYFG
 DcGR2UQ+XzHZwSvyV97uns+/wwZu3yj1ECS6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=FUPIfszd+Y3hE4MXZ9LvXmC172Tu1YsDIDX0pVslV88=;
 b=RdoBg3eQOz2dihhDeyroNqThXBTsmllGRSHUMbqo4+YO4d/irnHGuMKn35k9A7ikcR
 y3NiEm+l3bE+8Mj8pY4++MfXm68KjRmFVvdsLhS/SLklezadPnU099AtIpojgq3IWF5/
 5PCGEr8WesI3q+Z6YJXxpMtN8i73hKfLrClL37BRPt/lN5qSNEBylZ2bJX0WrTI2LUR0
 CgLfeUJApIdMZTaBbPKn2NPa5zV6Cyz5OyCrJFRZq2jTAXDRyOLJmPyqrMa+ApZZsbM7
 rGpbhxaWm+VGnhHbdzcn1CQu60uyNbTqnzvLg+hqaEcw8CHxZUkrNVFy+EaI5byzHLYU
 /npA==
X-Gm-Message-State: AOAM532IX/ChgqLb7NUMsmHqt7wYh/dnTaqgpOMgAfB2FqcvMBRSheSe
 eKoLd8b4YDhCCilA7/Fuy2hqAA==
X-Google-Smtp-Source: ABdhPJzR42nAMyZ79Y6xhTnIHIKTFzdFNj0PSIWQX50mORQVSDsydvIvPCxezSwwDXLYrXyM95hc9Q==
X-Received: by 2002:a5d:5887:: with SMTP id n7mr29040764wrf.116.1643892716648; 
 Thu, 03 Feb 2022 04:51:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v124sm7290459wme.30.2022.02.03.04.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 04:51:56 -0800 (PST)
Date: Thu, 3 Feb 2022 13:51:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v6] fbdev: fbmem: Fix the implicit type casting
Message-ID: <YfvP6s+EByLAqL9K@phenom.ffwll.local>
Mail-Followup-To: Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>, Yizhuo Zhai <yzhai003@ucr.edu>,
 Matthew Wilcox <willy@infradead.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Xin Tan <tanxin.ctf@gmail.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Zheyu Ma <zheyuma97@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <f3b28143-5f59-ad77-f2b8-6274a6edbfdc@roeck-us.net>
 <20220202235811.1621017-1-yzhai003@ucr.edu>
 <Yft4qf3Hw7ntxc98@ravnborg.org>
 <d323261d-b123-27e5-b629-559ca892163d@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d323261d-b123-27e5-b629-559ca892163d@gmx.de>
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Zheyu Ma <zheyuma97@gmail.com>,
 linux-fbdev@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-kernel@vger.kernel.org, Yizhuo Zhai <yzhai003@ucr.edu>,
 dri-devel@lists.freedesktop.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 03, 2022 at 09:18:30AM +0100, Helge Deller wrote:
> On 2/3/22 07:39, Sam Ravnborg wrote:
> > Hi Daniel,
> >
> > I assume you will take this.
> >
> > Patch is:
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> 
> Acked-by: Helge Deller <deller@gmx.de>

Pushed to drm-misc-fixes, thanks for patch&review.
-Daniel

> 
> Helge
> 
> >
> > 	Sam
> >
> > On Wed, Feb 02, 2022 at 03:58:08PM -0800, Yizhuo Zhai wrote:
> >> In function do_fb_ioctl(), the "arg" is the type of unsigned long,
> >> and in "case FBIOBLANK:" this argument is casted into an int before
> >> passig to fb_blank(). In fb_blank(), the comparision
> >> if (blank > FB_BLANK_POWERDOWN) would be bypass if the original
> >> "arg" is a large number, which is possible because it comes from
> >> the user input. Fix this by adding the check before the function
> >> call.
> >>
> >> Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
> >> ---
> >>  drivers/video/fbdev/core/fbmem.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> >> index 0fa7ede94fa6..13083ad8d751 100644
> >> --- a/drivers/video/fbdev/core/fbmem.c
> >> +++ b/drivers/video/fbdev/core/fbmem.c
> >> @@ -1160,6 +1160,8 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> >>  		ret = fbcon_set_con2fb_map_ioctl(argp);
> >>  		break;
> >>  	case FBIOBLANK:
> >> +		if (arg > FB_BLANK_POWERDOWN)
> >> +			return -EINVAL;
> >>  		console_lock();
> >>  		lock_fb_info(info);
> >>  		ret = fb_blank(info, arg);
> >> --
> >> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
